//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Menus;

interface

uses
  SysUtils, Classes, Menus, Graphics, ImgList;

type
  EMenuError = class(Exception)
  end;
  TMenuBreak = (mbNone, mbBreak, mbBarBreak);
  TMenuChangeEvent = procedure(Sender:TObject; Source:TMenuItem; Rebuild:Boolean) of object;;
  TMenuDrawItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; ARect:TRect; Selected:Boolean) of object;;
  TAdvancedMenuDrawItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState) of object;;
  TMenuMeasureItemEvent = procedure(Sender:TObject; ACanvas:TCanvas; var Width:Integer; var Height:Integer) of object;;
  TMenuItemAutoFlag = (maAutomatic, maManual, maParent);
  TMenuAutoFlag = (maAutomatic, maManual);
  TMenuActionLink = class(TActionLink)
  public
    FClient:TMenuItem;//f18
    procedure AssignClient(AClient:TObject); virtual;//v0//0044B2BC
    function IsOnExecuteLinked:Boolean; virtual;//v8//0044B4D4
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v10//0044B61C
    function IsCaptionLinked:Boolean; virtual;//v20//0044B300
    function IsCheckedLinked:Boolean; virtual;//v24//0044B338
    function IsEnabledLinked:Boolean; virtual;//v28//0044B368
    function IsGroupIndexLinked:Boolean; virtual;//v2C//0044B3FC
    function IsHelpContextLinked:Boolean; virtual;//v30//0044B398
    function IsHintLinked:Boolean; virtual;//v38//0044B3C8
    function IsImageIndexLinked:Boolean; virtual;//v3C//0044B438
    function IsShortCutLinked:Boolean; virtual;//v40//0044B46C
    function IsVisibleLinked:Boolean; virtual;//v44//0044B4A0
    procedure SetAutoCheck(Value:Boolean); virtual;//v48//0044B4FC
    procedure SetCaption(const Value:AnsiString); virtual;//v4C//0044B51C
    procedure SetChecked(Value:Boolean); virtual;//v50//0044B53C
    procedure SetEnabled(Value:Boolean); virtual;//v54//0044B55C
    procedure SetHelpContext(Value:THelpContext); virtual;//v5C//0044B57C
    procedure SetHint(const Value:AnsiString); virtual;//v68//0044B598
    procedure SetImageIndex(Value:Integer); virtual;//v6C//0044B5BC
    procedure SetShortCut(Value:TShortCut); virtual;//v70//0044B5DC
    procedure SetVisible(Value:Boolean); virtual;//v74//0044B5FC
    function IsAutoCheckLinked:Boolean; virtual;//v78//0044B2D8
  end;
  TMenuItem = class(TComponent)
  public
    Caption:String;//f30
    FHandle:HMENU;//f34
    Checked:Boolean;//f38
    Enabled:Boolean;//f39
    Default:Boolean;//f3A
    AutoHotkeys:TMenuItemAutoFlag;//f3B
    AutoLineReduction:TMenuItemAutoFlag;//f3C
    RadioItem:Boolean;//f3D
    Visible:Boolean;//f3E
    GroupIndex:Byte;//f3F
    ImageIndex:TImageIndex;//f40
    FActionLink:TMenuActionLink;//f44
    Break:TMenuBreak;//f48
    FBitmap:TBitmap;//f4C
    FCommand:Word;//f50
    HelpContext:THelpContext;//f54
    Hint:String;//f58
    FItems:TList;//f5C
    ShortCut:TShortCut;//f60
    FParent:TMenuItem;//f64
    FMerged:TMenuItem;//f68
    FMergedWith:TMenuItem;//f6C
    FMenu:TMenu;//f70
    FStreamedRebuild:Boolean;//f74
    FImageChangeLink:TChangeLink;//f78
    SubMenuImages:TCustomImageList;//f7C
    FOnChange:TMenuChangeEvent;//f80
    OnClick:TNotifyEvent;//f88
    OnDrawItem:TMenuDrawItemEvent;//f90
    OnAdvancedDrawItem:TAdvancedMenuDrawItemEvent;//f98
    OnMeasureItem:TMenuMeasureItemEvent;//fA0
    AutoCheck:Boolean;//fA8
    destructor Destroy; virtual;//0044B6C4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0044DF50
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0044BCD4
    procedure Loaded; virtual;//vC//0044BB1C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0044DFC8
    constructor Create(AOwner:TComponent); virtual;//v2C//0044B648
    procedure AdvancedDrawItem(ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState; TopLevel:Boolean); virtual;//v30//0044D198
    procedure DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean); virtual;//v34//0044BF28
    procedure MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer); virtual;//v38//0044D348
    procedure MenuChanged(Rebuild:Boolean); virtual;//v3C//0044DAB4
    procedure InitiateAction; virtual;//v40//0044D870
    procedure Click; virtual;//v44//0044D9A8
    procedure sub_0044D6EC; dynamic;//0044D6EC
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//0044DCEC
    procedure HasParent; dynamic;//0044D548
    procedure GetParentComponent; dynamic;//0044DC48
    procedure SetParentComponent(Value:TComponent); dynamic;//0044DC5C
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//0044D7F4
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//0044D7BC
    procedure AppendTo(Menu:HMENU; ARightToLeft:Boolean);//0044B778
    procedure PopulateMenu;//0044BA18
    procedure ReadShortCutText(Reader:TReader);//0044BA88
    procedure MergeWith(Menu:TMenuItem);//0044BAE0
    procedure RebuildHandle;//0044BB58
    procedure VerifyGroupIndex(Position:Integer; Value:Byte);//0044BC28
    function GetHandle:HMENU;//0044BC88
    procedure DoDrawText(ACanvas:TCanvas; const ACaption:AnsiString; var Rect:TRect; Selected:Boolean; Flags:Longint);//0044BD18
    function GetImageList:TCustomImageList;//0044D2CC
    procedure SetBreak(Value:TMenuBreak);//0044D54C
    procedure SetCaption(const Value:AnsiString);//0044D55C
    procedure TurnSiblingsOff;//0044D584
    procedure SetChecked(Value:Boolean);//0044D5CC
    procedure SetEnabled(Value:Boolean);//0044D620
    procedure SetGroupIndex(Value:Byte);//0044D698
    function GetAction:TBasicAction;//0044D6DC
    function GetCount:Integer;//0044D6F4
    function GetItem(Index:Integer):TMenuItem;//0044D704
    procedure SetShortCut(Value:TShortCut);//0044D728
    procedure SetVisible(Value:Boolean);//0044D73C
    procedure SetImageIndex(Value:TImageIndex);//0044D74C
    function GetMenuIndex:Integer;//0044D75C
    procedure SetMenuIndex(Value:Integer);//0044D774
    procedure SetDefault(Value:Boolean);//0044D814
    procedure Insert(Index:Integer; Item:TMenuItem);//0044D880
    procedure Delete(Index:Integer);//0044D934
    function IndexOf(Item:TMenuItem):Integer;//0044DA58
    procedure Add(Item:TMenuItem);//0044DA70
    procedure Remove(Item:TMenuItem);//0044DA8C
    procedure SubItemChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//0044DAF8
    function GetBitmap:TBitmap;//0044DB50
    procedure SetAction(Value:TBasicAction);//0044DB78
    procedure SetBitmap(Value:TBitmap);//0044DBE8
    procedure InitiateActions;//0044DC1C
    function GetParentMenu:TMenu;//0044DCB0
    procedure SetRadioItem(Value:Boolean);//0044DCC0
    procedure DoActionChange(Sender:TObject);//0044DE0C
    function IsCaptionStored(Value:String):Boolean;//0044DE30
    function IsCheckedStored(Value:Boolean):Boolean;//0044DE50
    function IsEnabledStored(Value:Boolean):Boolean;//0044DE70
    function IsHintStored(Value:String):Boolean;//0044DE90
    function IsHelpContextStored(Value:THelpContext):Boolean;//0044DEB0
    function IsImageIndexStored(Value:TImageIndex):Boolean;//0044DED0
    function IsShortCutStored(Value:TShortCut):Boolean;//0044DEF0
    function IsVisibleStored(Value:Boolean):Boolean;//0044DF10
    function IsOnClickStored(Value:TNotifyEvent):Boolean;//0044DF30
    procedure SetSubMenuImages(Value:TCustomImageList);//0044E01C
    procedure ImageListChange(Sender:TObject);//0044E058
    procedure UpdateItems;//0044E08C
    function InternalRethinkHotkeys(ForceRethink:Boolean):Boolean;//0044E2B4
    procedure SetAutoHotkeys(const Value:TMenuItemAutoFlag);//0044E77C
    function IsLine:Boolean;//0044E78C
    function InternalRethinkLines(ForceRethink:Boolean):Boolean;//0044E7B0
    procedure SetAutoLineReduction(const Value:TMenuItemAutoFlag);//0044E8F8
    function GetAutoHotkeys:Boolean;//0044E908
    function GetAutoLineReduction:Boolean;//0044E934
  end;
  TMenu = class(TComponent)
  public
    FBiDiMode:TBiDiMode;//f30
    Items:TMenuItem;//f34
    FWindowHandle:HWND;//f38
    FMenuImage:String;//f3C
    FOwnerDraw:Boolean;//f40
    FParentBiDiMode:Boolean;//f41
    FImageChangeLink:TChangeLink;//f44
    FImages:TCustomImageList;//f48
    FOnChange:TMenuChangeEvent;//f50
    destructor Destroy; virtual;//0044E9FC
    procedure Loaded; virtual;//vC//0044F224
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0044F2C0
    constructor Create(AOwner:TComponent); virtual;//v2C//0044E960
    procedure DoChange(Source:TMenuItem; Rebuild:Boolean); virtual;//v30//0044F20C
    function GetHandle:HMENU; virtual;//v34//0044EA50
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean); virtual;//v38//0044F23C
    procedure IsShortCut(var Message:TWMKey); dynamic;//0044EE44
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//0044EA5C
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//0044EA34
    procedure UpdateItems;//0044EA98
    function FindItem(Value:Integer; Kind:TFindItemKind):TMenuItem;//0044EB48
    function GetHelpContext(Value:Integer; ByCommand:Boolean):THelpContext;//0044EB78
    function DispatchCommand(ACommand:Word):Boolean;//0044EBE8
    function DispatchPopup(AHandle:HMENU):Boolean;//0044EC04
    function IsOwnerDraw:Boolean;//0044ECCC
    procedure DoBiDiModeChanged;//0044EF68
    function UpdateImage:Boolean;//0044F0C4
    procedure SetOwnerDraw(Value:Boolean);//0044F148
    procedure AdjustBiDiBehavior;//0044F158
    procedure SetWindowHandle(Value:HWND);//0044F1D4
    procedure ImageListChange(Sender:TObject);//0044F278
    procedure SetImages(Value:TCustomImageList);//0044F284
    function IsRightToLeft:Boolean;//0044F2EC
    procedure ProcessMenuChar(var Message:TWMMenuChar);//0044F448
    function DoGetMenuString(Menu:HMENU; ItemID:UINT; Str:PChar; MaxCount:Integer; Flag:UINT):Integer;//0044F5C0
    procedure SetBiDiMode(Value:TBiDiMode);//0044F668
    procedure SetParentBiDiMode(Value:Boolean);//0044F67C
    procedure ParentBiDiModeChanged;//0044F68C
    procedure ParentBiDiModeChanged(AControl:TObject);//0044F6B4
    function GetAutoHotkeys:TMenuAutoFlag;//0044F6E0
    procedure SetAutoHotkeys(const Value:TMenuAutoFlag);//0044F6F0
    function GetAutoLineReduction:TMenuAutoFlag;//0044F700
    procedure SetAutoLineReduction(const Value:TMenuAutoFlag);//0044F710
  end;
  TMainMenu = class(TMenu)
  public
    FOle2Menu:HMENU;//f58
    AutoMerge:Boolean;//f5C
    function GetHandle:HMENU; virtual;//v34//0044F7FC
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean); virtual;//v38//0044F740
    procedure IsStoredBiDiMode(Value:TBiDiMode);//0044EF60
    procedure SetAutoMerge(Value:Boolean);//0044F720
    procedure Merge(Menu:TMainMenu);//0044F798
    procedure Unmerge(Menu:TMainMenu);//0044F7B4
    procedure ItemChanged;//0044F7D0
  end;
  TPopupAlignment = (paLeft, paRight, paCenter);
  TTrackButton = (tbRightButton, tbLeftButton);
  TMenuAnimations = (maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop, maNone);
  TMenuAnimation = set of TMenuAnimations;
  TPopupMenu = class(TMenu)
  public
    FPopupPoint:TPoint;//f58
    Alignment:TPopupAlignment;//f60
    AutoPopup:Boolean;//f61
    FPopupComponent:TComponent;//f64
    TrackButton:TTrackButton;//f68
    MenuAnimation:TMenuAnimation;//f69
    OnPopup:TNotifyEvent;//f70
    destructor Destroy; virtual;//0044FE54
    constructor Create(AOwner:TComponent); virtual;//v2C//0044FDE0
    procedure DoPopup(Sender:TObject); virtual;//v3C//0044FE88
    procedure Popup(X:Integer; Y:Integer); virtual;//v40//0044FF40
    function GetHelpContext:THelpContext;//0044FE9C
    procedure SetHelpContext(Value:THelpContext);//0044FEA4
    procedure SetBiDiModeFromPopupControl;//0044FEAC
    function UseRightToLeftAlignment:Boolean;//0044FEF4
  end;
  TPopupList = class(TList)
  public
    FWindow:HWND;//f10
    procedure WndProc(var Message:TMessage); virtual;//v10//0044F858
    procedure MainWndProc(var Message:TMessage);//0044F80C
    procedure Add(Popup:TPopupMenu);//0044FD9C
    procedure Remove(Popup:TPopupMenu);//0044FDC4
  end;
  TMenuItemStack = class(TStack)
    procedure ClearItem(AItem:TMenuItem);//0044FFF4
  end;
    function FindPopupControl(const Pos:TPoint):TControl;//0044ACF8
    function ReturnAddr:Pointer;//0044AD28
    procedure Error(ResStr:PResStringRec);//0044AD30
    function ShortCut(Key:Word; Shift:TShiftState):TShortCut;//0044AD50
    function GetSpecialName(ShortCut:TShortCut):AnsiString;//0044AD88
    function ShortCutToText(ShortCut:TShortCut):AnsiString;//0044ADDC
    function CompareFront(var Text:AnsiString; const Front:AnsiString):Boolean;//0044AFE0
    function TextToShortCut(Text:AnsiString):TShortCut;//0044B03C
    function UniqueCommand:Word;//0044B134
    function Iterate(var I:Integer; MenuItem:TMenuItem; AFunc:Pointer):Boolean;//0044B154
    procedure IterateMenus(Func:Pointer; Menu1:TMenuItem; Menu2:TMenuItem);//0044B1B4
    procedure AssignClient(AClient:TObject);//0044B2BC
    function IsAutoCheckLinked:Boolean;//0044B2D8
    function IsCaptionLinked:Boolean;//0044B300
    function IsCheckedLinked:Boolean;//0044B338
    function IsEnabledLinked:Boolean;//0044B368
    function IsHelpContextLinked:Boolean;//0044B398
    function IsHintLinked:Boolean;//0044B3C8
    function IsGroupIndexLinked:Boolean;//0044B3FC
    function IsImageIndexLinked:Boolean;//0044B438
    function IsShortCutLinked:Boolean;//0044B46C
    function IsVisibleLinked:Boolean;//0044B4A0
    function IsOnExecuteLinked:Boolean;//0044B4D4
    procedure SetAutoCheck(Value:Boolean);//0044B4FC
    procedure SetCaption(const Value:AnsiString);//0044B51C
    procedure SetChecked(Value:Boolean);//0044B53C
    procedure SetEnabled(Value:Boolean);//0044B55C
    procedure SetHelpContext(Value:THelpContext);//0044B57C
    procedure SetHint(const Value:AnsiString);//0044B598
    procedure SetImageIndex(Value:Integer);//0044B5BC
    procedure SetShortCut(Value:TShortCut);//0044B5DC
    procedure SetVisible(Value:Boolean);//0044B5FC
    procedure SetOnExecute(Value:TNotifyEvent);//0044B61C
    constructor Create(AOwner:TComponent);//0044B648
    destructor Destroy;//0044B6C4
    function AddIn(MenuItem:TMenuItem):Boolean;//0044B9FC
    procedure Loaded;//0044BB1C
    procedure DefineProperties(Filer:TFiler);//0044BCD4
    procedure DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean);//0044BF28
    procedure NormalDraw;//0044BF68
    procedure BiDiDraw;//0044C870
    procedure AdvancedDrawItem(ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState; TopLevel:Boolean);//0044D198
    procedure GetMenuSize;//0044D2FC
    procedure MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer);//0044D348
    procedure HasParent;//0044D548
    procedure sub_0044D6EC;//0044D6EC
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//0044D7BC
    procedure SetChildOrder(Child:TComponent; Order:Integer);//0044D7F4
    procedure InitiateAction;//0044D870
    procedure Click;//0044D9A8
    procedure MenuChanged(Rebuild:Boolean);//0044DAB4
    procedure GetParentComponent;//0044DC48
    procedure SetParentComponent(Value:TComponent);//0044DC5C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//0044DCEC
    procedure AssignTo(Dest:TPersistent);//0044DF50
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0044DFC8
    function UpdateItem(MenuItem:TMenuItem):Boolean;//0044E064
    function IfHotkeyAvailable(const AHotkey:AnsiString):Boolean;//0044E0A0
    procedure CopyToBest;//0044E0D0
    procedure InsertHotkeyFarEastFormat(var ACaption:AnsiString; const AHotKey:AnsiString; AColumn:Integer);//0044E154
    constructor Create(AOwner:TComponent);//0044E960
    destructor Destroy;//0044E9FC
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//0044EA34
    function GetHandle:HMENU;//0044EA50
    procedure SetChildOrder(Child:TComponent; Order:Integer);//0044EA5C
    function UpdateItem(MenuItem:TMenuItem):Boolean;//0044EA70
    function Find(Item:TMenuItem):Boolean;//0044EAB0
    function NthParentOf(Item:TMenuItem; N:Integer):TMenuItem;//0044ECE0
    function DoClick(var Item:TMenuItem; Level:Integer):TClickResult;//0044ECF0
    procedure IsShortCut(var Message:TWMKey);//0044EE44
    procedure BuildImage(Menu:HMENU);//0044F024
    procedure DoChange(Source:TMenuItem; Rebuild:Boolean);//0044F20C
    procedure Loaded;//0044F224
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//0044F23C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0044F2C0
    function IsAccelChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;//0044F304
    function IsInitialChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;//0044F360
    procedure MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);//0044F740
    function GetHandle:HMENU;//0044F7FC
    procedure WndProc(var Message:TMessage);//0044F858
    constructor Create(AOwner:TComponent);//0044FDE0
    destructor Destroy;//0044FE54
    procedure DoPopup(Sender:TObject);//0044FE88
    procedure Popup(X:Integer; Y:Integer);//0044FF40
    procedure DrawMenuItem(MenuItem:TMenuItem; ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState);//00450030
    function StripHotkey(const Text:AnsiString):AnsiString;//00450118
    function GetHotkey(const Text:AnsiString):AnsiString;//004501AC
    function AnsiSameCaption(const Text1:AnsiString; const Text2:AnsiString):Boolean;//00450210
    procedure _NF__590;//00450278

implementation

//0044ACF8
function FindPopupControl(const Pos:TPoint):TControl;
begin
{*
 0044ACF8    push        ebx
 0044ACF9    push        esi
 0044ACFA    push        edi
 0044ACFB    mov         edi,eax
 0044ACFD    xor         esi,esi
 0044ACFF    mov         eax,edi
 0044AD01    call        FindVCLWindow
 0044AD06    mov         ebx,eax
 0044AD08    test        ebx,ebx
>0044AD0A    je          0044AD21
 0044AD0C    push        0
 0044AD0E    mov         edx,edi
 0044AD10    xor         ecx,ecx
 0044AD12    mov         eax,ebx
 0044AD14    call        TWinControl.ControlAtPos
 0044AD19    mov         esi,eax
 0044AD1B    test        esi,esi
>0044AD1D    jne         0044AD21
 0044AD1F    mov         esi,ebx
 0044AD21    mov         eax,esi
 0044AD23    pop         edi
 0044AD24    pop         esi
 0044AD25    pop         ebx
 0044AD26    ret
*}
end;

//0044AD28
function ReturnAddr:Pointer;
begin
{*
 0044AD28    mov         eax,dword ptr [esp+8]
 0044AD2C    ret
*}
end;

//0044AD30
procedure Error(ResStr:PResStringRec);
begin
{*
 0044AD30    push        ebx
 0044AD31    mov         ebx,eax
 0044AD33    call        ReturnAddr
 0044AD38    push        eax
 0044AD39    mov         ecx,ebx
 0044AD3B    mov         dl,1
 0044AD3D    mov         eax,[00449DC8];EMenuError
 0044AD42    call        Exception.CreateRes
>0044AD47    jmp         @RaiseExcept
 0044AD4C    pop         ebx
 0044AD4D    ret
*}
end;

//0044AD50
function ShortCut(Key:Word; Shift:TShiftState):TShortCut;
begin
{*
 0044AD50    push        ebp
 0044AD51    mov         ebp,esp
 0044AD53    push        ecx
 0044AD54    mov         byte ptr [ebp-3],dl
 0044AD57    mov         word ptr [ebp-2],ax
 0044AD5B    xor         eax,eax
 0044AD5D    cmp         byte ptr [ebp-1],0
>0044AD61    jne         0044AD85
 0044AD63    mov         ax,word ptr [ebp-2]
 0044AD67    test        byte ptr [ebp-3],1
>0044AD6B    je          0044AD71
 0044AD6D    add         ax,2000
 0044AD71    test        byte ptr [ebp-3],4
>0044AD75    je          0044AD7B
 0044AD77    add         ax,4000
 0044AD7B    test        byte ptr [ebp-3],2
>0044AD7F    je          0044AD85
 0044AD81    add         ax,8000
 0044AD85    pop         ecx
 0044AD86    pop         ebp
 0044AD87    ret
*}
end;

//0044AD88
function GetSpecialName(ShortCut:TShortCut):AnsiString;
begin
{*
 0044AD88    push        ebp
 0044AD89    mov         ebp,esp
 0044AD8B    add         esp,0FFFFFEFC
 0044AD91    push        ebx
 0044AD92    mov         ebx,edx
 0044AD94    mov         word ptr [ebp-2],ax
 0044AD98    mov         eax,ebx
 0044AD9A    call        @LStrClr
 0044AD9F    push        0
 0044ADA1    xor         eax,eax
 0044ADA3    mov         al,byte ptr [ebp-2]
 0044ADA6    push        eax
 0044ADA7    call        user32.MapVirtualKeyA
 0044ADAC    shl         eax,10
 0044ADAF    test        eax,eax
>0044ADB1    je          0044ADD7
 0044ADB3    push        100
 0044ADB8    lea         edx,[ebp-102]
 0044ADBE    push        edx
 0044ADBF    push        eax
 0044ADC0    call        user32.GetKeyNameTextA
 0044ADC5    mov         eax,ebx
 0044ADC7    lea         edx,[ebp-102]
 0044ADCD    mov         ecx,100
 0044ADD2    call        @LStrFromArray
 0044ADD7    pop         ebx
 0044ADD8    mov         esp,ebp
 0044ADDA    pop         ebp
 0044ADDB    ret
*}
end;

//0044ADDC
function ShortCutToText(ShortCut:TShortCut):AnsiString;
begin
{*
 0044ADDC    push        ebp
 0044ADDD    mov         ebp,esp
 0044ADDF    push        0
 0044ADE1    push        0
 0044ADE3    push        0
 0044ADE5    push        ebx
 0044ADE6    push        esi
 0044ADE7    mov         esi,edx
 0044ADE9    mov         word ptr [ebp-2],ax
 0044ADED    xor         eax,eax
 0044ADEF    push        ebp
 0044ADF0    push        44AFC5
 0044ADF5    push        dword ptr fs:[eax]
 0044ADF8    mov         dword ptr fs:[eax],esp
 0044ADFB    mov         bl,byte ptr [ebp-2]
 0044ADFE    xor         eax,eax
 0044AE00    mov         al,bl
 0044AE02    cmp         eax,2D
>0044AE05    jge         0044AE2E
 0044AE07    add         eax,0FFFFFFF8
 0044AE0A    sub         eax,2
>0044AE0D    jb          0044AE77
 0044AE0F    sub         eax,3
>0044AE12    je          0044AE8F
 0044AE14    sub         eax,0E
>0044AE17    je          0044AEA2
 0044AE1D    add         eax,0FFFFFFFB
 0044AE20    sub         eax,9
>0044AE23    jb          0044AEB5
>0044AE29    jmp         0044AF45
 0044AE2E    cmp         eax,41
>0044AE31    jge         0044AE4E
 0044AE33    add         eax,0FFFFFFD3
 0044AE36    sub         eax,2
>0044AE39    jb          0044AED0
 0044AE3F    dec         eax
 0044AE40    sub         eax,0A
>0044AE43    jb          0044AEE8
>0044AE49    jmp         0044AF45
 0044AE4E    add         eax,0FFFFFFBF
 0044AE51    sub         eax,1A
>0044AE54    jb          0044AEFC
 0044AE5A    add         eax,0FFFFFFFB
 0044AE5D    sub         eax,0A
>0044AE60    jb          0044AF10
 0044AE66    add         eax,0FFFFFFFA
 0044AE69    sub         eax,18
>0044AE6C    jb          0044AF24
>0044AE72    jmp         0044AF45
 0044AE77    lea         eax,[ebp-8]
 0044AE7A    xor         edx,edx
 0044AE7C    mov         dl,bl
 0044AE7E    mov         edx,dword ptr [edx*4+5ACCB4]
 0044AE85    call        @LStrLAsg
>0044AE8A    jmp         0044AF51
 0044AE8F    lea         eax,[ebp-8]
 0044AE92    mov         edx,dword ptr ds:[5ACCE0]
 0044AE98    call        @LStrLAsg
>0044AE9D    jmp         0044AF51
 0044AEA2    lea         eax,[ebp-8]
 0044AEA5    mov         edx,dword ptr ds:[5ACCDC]
 0044AEAB    call        @LStrLAsg
>0044AEB0    jmp         0044AF51
 0044AEB5    lea         eax,[ebp-8]
 0044AEB8    add         bl,4
 0044AEBB    xor         edx,edx
 0044AEBD    mov         dl,bl
 0044AEBF    mov         edx,dword ptr [edx*4+5ACC54]
 0044AEC6    call        @LStrLAsg
>0044AECB    jmp         0044AF51
 0044AED0    lea         eax,[ebp-8]
 0044AED3    add         bl,0D
 0044AED6    xor         edx,edx
 0044AED8    mov         dl,bl
 0044AEDA    mov         edx,dword ptr [edx*4+5ACC20]
 0044AEE1    call        @LStrLAsg
>0044AEE6    jmp         0044AF51
 0044AEE8    lea         eax,[ebp-8]
 0044AEEB    xor         edx,edx
 0044AEED    mov         dl,bl
 0044AEEF    sub         edx,30
 0044AEF2    add         edx,30
 0044AEF5    call        @LStrFromChar
>0044AEFA    jmp         0044AF51
 0044AEFC    lea         eax,[ebp-8]
 0044AEFF    xor         edx,edx
 0044AF01    mov         dl,bl
 0044AF03    sub         edx,41
 0044AF06    add         edx,41
 0044AF09    call        @LStrFromChar
>0044AF0E    jmp         0044AF51
 0044AF10    lea         eax,[ebp-8]
 0044AF13    xor         edx,edx
 0044AF15    mov         dl,bl
 0044AF17    sub         edx,60
 0044AF1A    add         edx,30
 0044AF1D    call        @LStrFromChar
>0044AF22    jmp         0044AF51
 0044AF24    xor         eax,eax
 0044AF26    mov         al,bl
 0044AF28    sub         eax,6F
 0044AF2B    lea         edx,[ebp-0C]
 0044AF2E    call        IntToStr
 0044AF33    mov         ecx,dword ptr [ebp-0C]
 0044AF36    lea         eax,[ebp-8]
 0044AF39    mov         edx,44AFDC;'F'
 0044AF3E    call        @LStrCat3
>0044AF43    jmp         0044AF51
 0044AF45    lea         edx,[ebp-8]
 0044AF48    mov         ax,word ptr [ebp-2]
 0044AF4C    call        GetSpecialName
 0044AF51    cmp         dword ptr [ebp-8],0
>0044AF55    je          0044AFA3
 0044AF57    mov         eax,esi
 0044AF59    call        @LStrClr
 0044AF5E    test        byte ptr [ebp-1],20
>0044AF62    je          0044AF71
 0044AF64    mov         eax,esi
 0044AF66    mov         edx,dword ptr ds:[5ACD10]
 0044AF6C    call        @LStrCat
 0044AF71    test        byte ptr [ebp-1],40
>0044AF75    je          0044AF84
 0044AF77    mov         eax,esi
 0044AF79    mov         edx,dword ptr ds:[5ACD14]
 0044AF7F    call        @LStrCat
 0044AF84    test        byte ptr [ebp-1],80
>0044AF88    je          0044AF97
 0044AF8A    mov         eax,esi
 0044AF8C    mov         edx,dword ptr ds:[5ACD18]
 0044AF92    call        @LStrCat
 0044AF97    mov         eax,esi
 0044AF99    mov         edx,dword ptr [ebp-8]
 0044AF9C    call        @LStrCat
>0044AFA1    jmp         0044AFAA
 0044AFA3    mov         eax,esi
 0044AFA5    call        @LStrClr
 0044AFAA    xor         eax,eax
 0044AFAC    pop         edx
 0044AFAD    pop         ecx
 0044AFAE    pop         ecx
 0044AFAF    mov         dword ptr fs:[eax],edx
 0044AFB2    push        44AFCC
 0044AFB7    lea         eax,[ebp-0C]
 0044AFBA    mov         edx,2
 0044AFBF    call        @LStrArrayClr
 0044AFC4    ret
>0044AFC5    jmp         @HandleFinally
>0044AFCA    jmp         0044AFB7
 0044AFCC    pop         esi
 0044AFCD    pop         ebx
 0044AFCE    mov         esp,ebp
 0044AFD0    pop         ebp
 0044AFD1    ret
*}
end;

//0044AFE0
function CompareFront(var Text:AnsiString; const Front:AnsiString):Boolean;
begin
{*
 0044AFE0    push        ebx
 0044AFE1    push        esi
 0044AFE2    push        edi
 0044AFE3    mov         edi,edx
 0044AFE5    mov         esi,eax
 0044AFE7    xor         ebx,ebx
 0044AFE9    mov         eax,dword ptr [esi]
 0044AFEB    call        @LStrLen
 0044AFF0    push        eax
 0044AFF1    mov         eax,edi
 0044AFF3    call        @LStrLen
 0044AFF8    pop         edx
 0044AFF9    cmp         edx,eax
>0044AFFB    jl          0044B036
 0044AFFD    mov         eax,edi
 0044AFFF    call        @LStrLen
 0044B004    push        eax
 0044B005    mov         eax,edi
 0044B007    call        @LStrToPChar
 0044B00C    push        eax
 0044B00D    mov         eax,dword ptr [esi]
 0044B00F    call        @LStrToPChar
 0044B014    pop         edx
 0044B015    pop         ecx
 0044B016    call        AnsiStrLIComp
 0044B01B    test        eax,eax
>0044B01D    jne         0044B036
 0044B01F    mov         bl,1
 0044B021    mov         eax,edi
 0044B023    call        @LStrLen
 0044B028    mov         ecx,eax
 0044B02A    mov         eax,esi
 0044B02C    mov         edx,1
 0044B031    call        @LStrDelete
 0044B036    mov         eax,ebx
 0044B038    pop         edi
 0044B039    pop         esi
 0044B03A    pop         ebx
 0044B03B    ret
*}
end;

//0044B03C
function TextToShortCut(Text:AnsiString):TShortCut;
begin
{*
 0044B03C    push        ebp
 0044B03D    mov         ebp,esp
 0044B03F    add         esp,0FFFFFFF8
 0044B042    push        ebx
 0044B043    push        esi
 0044B044    push        edi
 0044B045    xor         edx,edx
 0044B047    mov         dword ptr [ebp-8],edx
 0044B04A    mov         dword ptr [ebp-4],eax
 0044B04D    mov         eax,dword ptr [ebp-4]
 0044B050    call        @LStrAddRef
 0044B055    xor         eax,eax
 0044B057    push        ebp
 0044B058    push        44B117
 0044B05D    push        dword ptr fs:[eax]
 0044B060    mov         dword ptr fs:[eax],esp
 0044B063    xor         edi,edi
 0044B065    xor         esi,esi
 0044B067    lea         eax,[ebp-4]
 0044B06A    mov         edx,dword ptr ds:[5ACD10]
 0044B070    call        CompareFront
 0044B075    test        al,al
>0044B077    je          0044B080
 0044B079    or          si,2000
>0044B07E    jmp         0044B067
 0044B080    lea         eax,[ebp-4]
 0044B083    mov         edx,44B130;'^'
 0044B088    call        CompareFront
 0044B08D    test        al,al
>0044B08F    je          0044B098
 0044B091    or          si,4000
>0044B096    jmp         0044B067
 0044B098    lea         eax,[ebp-4]
 0044B09B    mov         edx,dword ptr ds:[5ACD14]
 0044B0A1    call        CompareFront
 0044B0A6    test        al,al
>0044B0A8    je          0044B0B1
 0044B0AA    or          si,4000
>0044B0AF    jmp         0044B067
 0044B0B1    lea         eax,[ebp-4]
 0044B0B4    mov         edx,dword ptr ds:[5ACD18]
 0044B0BA    call        CompareFront
 0044B0BF    test        al,al
>0044B0C1    je          0044B0CA
 0044B0C3    or          si,8000
>0044B0C8    jmp         0044B067
 0044B0CA    cmp         dword ptr [ebp-4],0
>0044B0CE    je          0044B0FC
 0044B0D0    mov         bx,8
 0044B0D4    lea         edx,[ebp-8]
 0044B0D7    mov         eax,ebx
 0044B0D9    call        ShortCutToText
 0044B0DE    mov         edx,dword ptr [ebp-8]
 0044B0E1    mov         eax,dword ptr [ebp-4]
 0044B0E4    call        AnsiCompareText
 0044B0E9    test        eax,eax
>0044B0EB    jne         0044B0F4
 0044B0ED    mov         edi,esi
 0044B0EF    or          di,bx
>0044B0F2    jmp         0044B0FC
 0044B0F4    inc         ebx
 0044B0F5    cmp         bx,256
>0044B0FA    jne         0044B0D4
 0044B0FC    xor         eax,eax
 0044B0FE    pop         edx
 0044B0FF    pop         ecx
 0044B100    pop         ecx
 0044B101    mov         dword ptr fs:[eax],edx
 0044B104    push        44B11E
 0044B109    lea         eax,[ebp-8]
 0044B10C    mov         edx,2
 0044B111    call        @LStrArrayClr
 0044B116    ret
>0044B117    jmp         @HandleFinally
>0044B11C    jmp         0044B109
 0044B11E    mov         eax,edi
 0044B120    pop         edi
 0044B121    pop         esi
 0044B122    pop         ebx
 0044B123    pop         ecx
 0044B124    pop         ecx
 0044B125    pop         ebp
 0044B126    ret
*}
end;

//0044B134
function UniqueCommand:Word;
begin
{*
 0044B134    push        ebx
 0044B135    mov         eax,[005E0CA8];CommandPool:TBits
 0044B13A    call        TBits.OpenBit
 0044B13F    mov         ebx,eax
 0044B141    movzx       edx,bx
 0044B144    mov         cl,1
 0044B146    mov         eax,[005E0CA8];CommandPool:TBits
 0044B14B    call        TBits.SetBit
 0044B150    mov         eax,ebx
 0044B152    pop         ebx
 0044B153    ret
*}
end;

//0044B154
function Iterate(var I:Integer; MenuItem:TMenuItem; AFunc:Pointer):Boolean;
begin
{*
 0044B154    push        ebp
 0044B155    mov         ebp,esp
 0044B157    add         esp,0FFFFFFF4
 0044B15A    push        ebx
 0044B15B    push        esi
 0044B15C    mov         dword ptr [ebp-8],ecx
 0044B15F    mov         esi,edx
 0044B161    mov         ebx,eax
 0044B163    test        esi,esi
>0044B165    je          0044B1AB
 0044B167    mov         byte ptr [ebp-9],0
>0044B16B    jmp         0044B19A
 0044B16D    mov         edx,dword ptr [ebx]
 0044B16F    mov         eax,esi
 0044B171    call        TMenuItem.GetItem
 0044B176    mov         dword ptr [ebp-4],eax
 0044B179    mov         eax,dword ptr [ebp-4]
 0044B17C    mov         al,byte ptr [eax+3F]
 0044B17F    mov         edx,dword ptr [ebp+8]
 0044B182    cmp         al,byte ptr [edx-1]
>0044B185    ja          0044B1AB
 0044B187    mov         eax,dword ptr [ebp-4]
 0044B18A    mov         edx,dword ptr [ebp+8]
 0044B18D    push        dword ptr [edx]
 0044B18F    call        dword ptr [ebp-8]
 0044B192    add         esp,4
 0044B195    mov         byte ptr [ebp-9],al
 0044B198    inc         dword ptr [ebx]
 0044B19A    cmp         byte ptr [ebp-9],0
>0044B19E    jne         0044B1AB
 0044B1A0    mov         eax,esi
 0044B1A2    call        TMenuItem.GetCount
 0044B1A7    cmp         eax,dword ptr [ebx]
>0044B1A9    jg          0044B16D
 0044B1AB    mov         al,byte ptr [ebp-9]
 0044B1AE    pop         esi
 0044B1AF    pop         ebx
 0044B1B0    mov         esp,ebp
 0044B1B2    pop         ebp
 0044B1B3    ret
*}
end;

//0044B1B4
procedure IterateMenus(Func:Pointer; Menu1:TMenuItem; Menu2:TMenuItem);
begin
{*
 0044B1B4    push        ebp
 0044B1B5    mov         ebp,esp
 0044B1B7    add         esp,0FFFFFFE8
 0044B1BA    push        ebx
 0044B1BB    push        esi
 0044B1BC    push        edi
 0044B1BD    mov         dword ptr [ebp-0C],ecx
 0044B1C0    mov         edi,edx
 0044B1C2    mov         dword ptr [ebp-8],eax
 0044B1C5    xor         eax,eax
 0044B1C7    mov         dword ptr [ebp-10],eax
 0044B1CA    xor         eax,eax
 0044B1CC    mov         dword ptr [ebp-14],eax
 0044B1CF    xor         ebx,ebx
 0044B1D1    xor         esi,esi
 0044B1D3    test        edi,edi
>0044B1D5    je          0044B1E0
 0044B1D7    mov         eax,edi
 0044B1D9    call        TMenuItem.GetCount
 0044B1DE    mov         ebx,eax
 0044B1E0    cmp         dword ptr [ebp-0C],0
>0044B1E4    je          0044B1F0
 0044B1E6    mov         eax,dword ptr [ebp-0C]
 0044B1E9    call        TMenuItem.GetCount
 0044B1EE    mov         esi,eax
 0044B1F0    mov         byte ptr [ebp-16],0
>0044B1F4    jmp         0044B29A
 0044B1F9    mov         byte ptr [ebp-1],0FF
 0044B1FD    mov         byte ptr [ebp-15],0FF
 0044B201    cmp         ebx,dword ptr [ebp-10]
>0044B204    jle         0044B216
 0044B206    mov         edx,dword ptr [ebp-10]
 0044B209    mov         eax,edi
 0044B20B    call        TMenuItem.GetItem
 0044B210    mov         al,byte ptr [eax+3F]
 0044B213    mov         byte ptr [ebp-1],al
 0044B216    cmp         esi,dword ptr [ebp-14]
>0044B219    jle         0044B22C
 0044B21B    mov         edx,dword ptr [ebp-14]
 0044B21E    mov         eax,dword ptr [ebp-0C]
 0044B221    call        TMenuItem.GetItem
 0044B226    mov         al,byte ptr [eax+3F]
 0044B229    mov         byte ptr [ebp-15],al
 0044B22C    mov         al,byte ptr [ebp-1]
 0044B22F    cmp         al,byte ptr [ebp-15]
>0044B232    ja          0044B248
 0044B234    push        ebp
 0044B235    lea         eax,[ebp-10]
 0044B238    mov         ecx,dword ptr [ebp-8]
 0044B23B    mov         edx,edi
 0044B23D    call        Iterate
 0044B242    pop         ecx
 0044B243    mov         byte ptr [ebp-16],al
>0044B246    jmp         0044B266
 0044B248    mov         al,byte ptr [ebp-15]
 0044B24B    mov         byte ptr [ebp-1],al
 0044B24E    push        ebp
 0044B24F    lea         eax,[ebp-14]
 0044B252    mov         ecx,dword ptr [ebp-8]
 0044B255    mov         edx,dword ptr [ebp-0C]
 0044B258    call        Iterate
 0044B25D    pop         ecx
 0044B25E    mov         byte ptr [ebp-16],al
>0044B261    jmp         0044B266
 0044B263    inc         dword ptr [ebp-10]
 0044B266    cmp         ebx,dword ptr [ebp-10]
>0044B269    jle         0044B282
 0044B26B    mov         edx,dword ptr [ebp-10]
 0044B26E    mov         eax,edi
 0044B270    call        TMenuItem.GetItem
 0044B275    mov         al,byte ptr [eax+3F]
 0044B278    cmp         al,byte ptr [ebp-1]
>0044B27B    jbe         0044B263
>0044B27D    jmp         0044B282
 0044B27F    inc         dword ptr [ebp-14]
 0044B282    cmp         esi,dword ptr [ebp-14]
>0044B285    jle         0044B29A
 0044B287    mov         edx,dword ptr [ebp-14]
 0044B28A    mov         eax,dword ptr [ebp-0C]
 0044B28D    call        TMenuItem.GetItem
 0044B292    mov         al,byte ptr [eax+3F]
 0044B295    cmp         al,byte ptr [ebp-1]
>0044B298    jbe         0044B27F
 0044B29A    cmp         byte ptr [ebp-16],0
>0044B29E    jne         0044B2B2
 0044B2A0    cmp         ebx,dword ptr [ebp-10]
>0044B2A3    jg          0044B1F9
 0044B2A9    cmp         esi,dword ptr [ebp-14]
>0044B2AC    jg          0044B1F9
 0044B2B2    pop         edi
 0044B2B3    pop         esi
 0044B2B4    pop         ebx
 0044B2B5    mov         esp,ebp
 0044B2B7    pop         ebp
 0044B2B8    ret
*}
end;

//0044B2BC
procedure TMenuActionLink.AssignClient(AClient:TObject);
begin
{*
 0044B2BC    push        ebx
 0044B2BD    push        esi
 0044B2BE    mov         esi,edx
 0044B2C0    mov         ebx,eax
 0044B2C2    mov         eax,esi
 0044B2C4    mov         edx,dword ptr ds:[44A154];TMenuItem
 0044B2CA    call        @AsClass
 0044B2CF    mov         dword ptr [ebx+18],eax
 0044B2D2    pop         esi
 0044B2D3    pop         ebx
 0044B2D4    ret
*}
end;

//0044B2D8
function TMenuActionLink.IsAutoCheckLinked:Boolean;
begin
{*
 0044B2D8    push        ebx
 0044B2D9    mov         ebx,eax
 0044B2DB    mov         eax,dword ptr [ebx+10]
 0044B2DE    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B2E4    call        @AsClass
 0044B2E9    mov         al,byte ptr [eax+95]
 0044B2EF    mov         edx,dword ptr [ebx+18]
 0044B2F2    cmp         al,byte ptr [edx+0A8]
 0044B2F8    sete        al
 0044B2FB    pop         ebx
 0044B2FC    ret
*}
end;

//0044B300
function TMenuActionLink.IsCaptionLinked:Boolean;
begin
{*
 0044B300    push        ebx
 0044B301    mov         ebx,eax
 0044B303    mov         eax,ebx
 0044B305    call        TActionLink.IsCaptionLinked
 0044B30A    test        al,al
>0044B30C    je          0044B32E
 0044B30E    mov         eax,dword ptr [ebx+10]
 0044B311    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B317    call        @AsClass
 0044B31C    mov         edx,dword ptr [eax+64]
 0044B31F    mov         eax,dword ptr [ebx+18]
 0044B322    mov         eax,dword ptr [eax+30]
 0044B325    call        AnsiSameCaption
 0044B32A    test        al,al
>0044B32C    jne         0044B332
 0044B32E    xor         eax,eax
 0044B330    pop         ebx
 0044B331    ret
 0044B332    mov         al,1
 0044B334    pop         ebx
 0044B335    ret
*}
end;

//0044B338
function TMenuActionLink.IsCheckedLinked:Boolean;
begin
{*
 0044B338    push        ebx
 0044B339    mov         ebx,eax
 0044B33B    mov         eax,ebx
 0044B33D    call        TActionLink.IsCheckedLinked
 0044B342    test        al,al
>0044B344    je          0044B35F
 0044B346    mov         eax,dword ptr [ebx+10]
 0044B349    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B34F    call        @AsClass
 0044B354    mov         al,byte ptr [eax+69]
 0044B357    mov         edx,dword ptr [ebx+18]
 0044B35A    cmp         al,byte ptr [edx+38]
>0044B35D    je          0044B363
 0044B35F    xor         eax,eax
 0044B361    pop         ebx
 0044B362    ret
 0044B363    mov         al,1
 0044B365    pop         ebx
 0044B366    ret
*}
end;

//0044B368
function TMenuActionLink.IsEnabledLinked:Boolean;
begin
{*
 0044B368    push        ebx
 0044B369    mov         ebx,eax
 0044B36B    mov         eax,ebx
 0044B36D    call        TActionLink.IsEnabledLinked
 0044B372    test        al,al
>0044B374    je          0044B38F
 0044B376    mov         eax,dword ptr [ebx+10]
 0044B379    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B37F    call        @AsClass
 0044B384    mov         al,byte ptr [eax+6A]
 0044B387    mov         edx,dword ptr [ebx+18]
 0044B38A    cmp         al,byte ptr [edx+39]
>0044B38D    je          0044B393
 0044B38F    xor         eax,eax
 0044B391    pop         ebx
 0044B392    ret
 0044B393    mov         al,1
 0044B395    pop         ebx
 0044B396    ret
*}
end;

//0044B398
function TMenuActionLink.IsHelpContextLinked:Boolean;
begin
{*
 0044B398    push        ebx
 0044B399    mov         ebx,eax
 0044B39B    mov         eax,ebx
 0044B39D    call        TActionLink.IsHelpContextLinked
 0044B3A2    test        al,al
>0044B3A4    je          0044B3BF
 0044B3A6    mov         eax,dword ptr [ebx+10]
 0044B3A9    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B3AF    call        @AsClass
 0044B3B4    mov         eax,dword ptr [eax+74]
 0044B3B7    mov         edx,dword ptr [ebx+18]
 0044B3BA    cmp         eax,dword ptr [edx+54]
>0044B3BD    je          0044B3C3
 0044B3BF    xor         eax,eax
 0044B3C1    pop         ebx
 0044B3C2    ret
 0044B3C3    mov         al,1
 0044B3C5    pop         ebx
 0044B3C6    ret
*}
end;

//0044B3C8
function TMenuActionLink.IsHintLinked:Boolean;
begin
{*
 0044B3C8    push        ebx
 0044B3C9    mov         ebx,eax
 0044B3CB    mov         eax,ebx
 0044B3CD    call        TActionLink.IsHintLinked
 0044B3D2    test        al,al
>0044B3D4    je          0044B3F4
 0044B3D6    mov         eax,dword ptr [ebx+10]
 0044B3D9    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B3DF    call        @AsClass
 0044B3E4    mov         edx,dword ptr [eax+7C]
 0044B3E7    mov         eax,dword ptr [ebx+18]
 0044B3EA    mov         eax,dword ptr [eax+58]
 0044B3ED    call        @LStrCmp
>0044B3F2    je          0044B3F8
 0044B3F4    xor         eax,eax
 0044B3F6    pop         ebx
 0044B3F7    ret
 0044B3F8    mov         al,1
 0044B3FA    pop         ebx
 0044B3FB    ret
*}
end;

//0044B3FC
function TMenuActionLink.IsGroupIndexLinked:Boolean;
begin
{*
 0044B3FC    push        ebx
 0044B3FD    mov         ebx,eax
 0044B3FF    mov         eax,dword ptr [ebx+18]
 0044B402    cmp         byte ptr [eax+3D],0
>0044B406    je          0044B42F
 0044B408    mov         eax,ebx
 0044B40A    call        TActionLink.IsGroupIndexLinked
 0044B40F    test        al,al
>0044B411    je          0044B42F
 0044B413    mov         eax,dword ptr [ebx+10]
 0044B416    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B41C    call        @AsClass
 0044B421    mov         eax,dword ptr [eax+6C]
 0044B424    mov         edx,dword ptr [ebx+18]
 0044B427    movzx       edx,byte ptr [edx+3F]
 0044B42B    cmp         eax,edx
>0044B42D    je          0044B433
 0044B42F    xor         eax,eax
 0044B431    pop         ebx
 0044B432    ret
 0044B433    mov         al,1
 0044B435    pop         ebx
 0044B436    ret
*}
end;

//0044B438
function TMenuActionLink.IsImageIndexLinked:Boolean;
begin
{*
 0044B438    push        ebx
 0044B439    mov         ebx,eax
 0044B43B    mov         eax,ebx
 0044B43D    call        TActionLink.IsImageIndexLinked
 0044B442    test        al,al
>0044B444    je          0044B462
 0044B446    mov         eax,dword ptr [ebx+10]
 0044B449    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B44F    call        @AsClass
 0044B454    mov         eax,dword ptr [eax+80]
 0044B45A    mov         edx,dword ptr [ebx+18]
 0044B45D    cmp         eax,dword ptr [edx+40]
>0044B460    je          0044B466
 0044B462    xor         eax,eax
 0044B464    pop         ebx
 0044B465    ret
 0044B466    mov         al,1
 0044B468    pop         ebx
 0044B469    ret
*}
end;

//0044B46C
function TMenuActionLink.IsShortCutLinked:Boolean;
begin
{*
 0044B46C    push        ebx
 0044B46D    mov         ebx,eax
 0044B46F    mov         eax,ebx
 0044B471    call        TActionLink.IsShortCutLinked
 0044B476    test        al,al
>0044B478    je          0044B498
 0044B47A    mov         eax,dword ptr [ebx+10]
 0044B47D    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B483    call        @AsClass
 0044B488    mov         ax,word ptr [eax+84]
 0044B48F    mov         edx,dword ptr [ebx+18]
 0044B492    cmp         ax,word ptr [edx+60]
>0044B496    je          0044B49C
 0044B498    xor         eax,eax
 0044B49A    pop         ebx
 0044B49B    ret
 0044B49C    mov         al,1
 0044B49E    pop         ebx
 0044B49F    ret
*}
end;

//0044B4A0
function TMenuActionLink.IsVisibleLinked:Boolean;
begin
{*
 0044B4A0    push        ebx
 0044B4A1    mov         ebx,eax
 0044B4A3    mov         eax,ebx
 0044B4A5    call        TActionLink.IsVisibleLinked
 0044B4AA    test        al,al
>0044B4AC    je          0044B4CA
 0044B4AE    mov         eax,dword ptr [ebx+10]
 0044B4B1    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044B4B7    call        @AsClass
 0044B4BC    mov         al,byte ptr [eax+86]
 0044B4C2    mov         edx,dword ptr [ebx+18]
 0044B4C5    cmp         al,byte ptr [edx+3E]
>0044B4C8    je          0044B4CE
 0044B4CA    xor         eax,eax
 0044B4CC    pop         ebx
 0044B4CD    ret
 0044B4CE    mov         al,1
 0044B4D0    pop         ebx
 0044B4D1    ret
*}
end;

//0044B4D4
function TMenuActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 0044B4D4    push        ebx
 0044B4D5    mov         ebx,eax
 0044B4D7    mov         eax,ebx
 0044B4D9    call        TBasicActionLink.IsOnExecuteLinked
 0044B4DE    test        al,al
>0044B4E0    je          0044B4F3
 0044B4E2    mov         eax,dword ptr [ebx+18]
 0044B4E5    mov         eax,dword ptr [eax+88]
 0044B4EB    mov         edx,dword ptr [ebx+10]
 0044B4EE    cmp         eax,dword ptr [edx+40]
>0044B4F1    je          0044B4F7
 0044B4F3    xor         eax,eax
 0044B4F5    pop         ebx
 0044B4F6    ret
 0044B4F7    mov         al,1
 0044B4F9    pop         ebx
 0044B4FA    ret
*}
end;

//0044B4FC
procedure TMenuActionLink.SetAutoCheck(Value:Boolean);
begin
{*
 0044B4FC    push        ebx
 0044B4FD    push        esi
 0044B4FE    mov         ebx,edx
 0044B500    mov         esi,eax
 0044B502    mov         eax,esi
 0044B504    mov         edx,dword ptr [eax]
 0044B506    call        dword ptr [edx+78]
 0044B509    test        al,al
>0044B50B    je          0044B516
 0044B50D    mov         eax,dword ptr [esi+18]
 0044B510    mov         byte ptr [eax+0A8],bl
 0044B516    pop         esi
 0044B517    pop         ebx
 0044B518    ret
*}
end;

//0044B51C
procedure TMenuActionLink.SetCaption(const Value:AnsiString);
begin
{*
 0044B51C    push        ebx
 0044B51D    push        esi
 0044B51E    mov         esi,edx
 0044B520    mov         ebx,eax
 0044B522    mov         eax,ebx
 0044B524    mov         edx,dword ptr [eax]
 0044B526    call        dword ptr [edx+20]
 0044B529    test        al,al
>0044B52B    je          0044B537
 0044B52D    mov         edx,esi
 0044B52F    mov         eax,dword ptr [ebx+18]
 0044B532    call        TMenuItem.SetCaption
 0044B537    pop         esi
 0044B538    pop         ebx
 0044B539    ret
*}
end;

//0044B53C
procedure TMenuActionLink.SetChecked(Value:Boolean);
begin
{*
 0044B53C    push        ebx
 0044B53D    push        esi
 0044B53E    mov         ebx,edx
 0044B540    mov         esi,eax
 0044B542    mov         eax,esi
 0044B544    mov         edx,dword ptr [eax]
 0044B546    call        dword ptr [edx+24]
 0044B549    test        al,al
>0044B54B    je          0044B557
 0044B54D    mov         edx,ebx
 0044B54F    mov         eax,dword ptr [esi+18]
 0044B552    call        TMenuItem.SetChecked
 0044B557    pop         esi
 0044B558    pop         ebx
 0044B559    ret
*}
end;

//0044B55C
procedure TMenuActionLink.SetEnabled(Value:Boolean);
begin
{*
 0044B55C    push        ebx
 0044B55D    push        esi
 0044B55E    mov         ebx,edx
 0044B560    mov         esi,eax
 0044B562    mov         eax,esi
 0044B564    mov         edx,dword ptr [eax]
 0044B566    call        dword ptr [edx+28]
 0044B569    test        al,al
>0044B56B    je          0044B577
 0044B56D    mov         edx,ebx
 0044B56F    mov         eax,dword ptr [esi+18]
 0044B572    call        TMenuItem.SetEnabled
 0044B577    pop         esi
 0044B578    pop         ebx
 0044B579    ret
*}
end;

//0044B57C
procedure TMenuActionLink.SetHelpContext(Value:THelpContext);
begin
{*
 0044B57C    push        ebx
 0044B57D    push        esi
 0044B57E    mov         esi,edx
 0044B580    mov         ebx,eax
 0044B582    mov         eax,ebx
 0044B584    mov         edx,dword ptr [eax]
 0044B586    call        dword ptr [edx+30]
 0044B589    test        al,al
>0044B58B    je          0044B593
 0044B58D    mov         eax,dword ptr [ebx+18]
 0044B590    mov         dword ptr [eax+54],esi
 0044B593    pop         esi
 0044B594    pop         ebx
 0044B595    ret
*}
end;

//0044B598
procedure TMenuActionLink.SetHint(const Value:AnsiString);
begin
{*
 0044B598    push        ebx
 0044B599    push        esi
 0044B59A    mov         esi,edx
 0044B59C    mov         ebx,eax
 0044B59E    mov         eax,ebx
 0044B5A0    mov         edx,dword ptr [eax]
 0044B5A2    call        dword ptr [edx+38]
 0044B5A5    test        al,al
>0044B5A7    je          0044B5B6
 0044B5A9    mov         eax,dword ptr [ebx+18]
 0044B5AC    add         eax,58
 0044B5AF    mov         edx,esi
 0044B5B1    call        @LStrAsg
 0044B5B6    pop         esi
 0044B5B7    pop         ebx
 0044B5B8    ret
*}
end;

//0044B5BC
procedure TMenuActionLink.SetImageIndex(Value:Integer);
begin
{*
 0044B5BC    push        ebx
 0044B5BD    push        esi
 0044B5BE    mov         esi,edx
 0044B5C0    mov         ebx,eax
 0044B5C2    mov         eax,ebx
 0044B5C4    mov         edx,dword ptr [eax]
 0044B5C6    call        dword ptr [edx+3C]
 0044B5C9    test        al,al
>0044B5CB    je          0044B5D7
 0044B5CD    mov         edx,esi
 0044B5CF    mov         eax,dword ptr [ebx+18]
 0044B5D2    call        TMenuItem.SetImageIndex
 0044B5D7    pop         esi
 0044B5D8    pop         ebx
 0044B5D9    ret
*}
end;

//0044B5DC
procedure TMenuActionLink.SetShortCut(Value:TShortCut);
begin
{*
 0044B5DC    push        ebx
 0044B5DD    push        esi
 0044B5DE    mov         esi,edx
 0044B5E0    mov         ebx,eax
 0044B5E2    mov         eax,ebx
 0044B5E4    mov         edx,dword ptr [eax]
 0044B5E6    call        dword ptr [edx+40]
 0044B5E9    test        al,al
>0044B5EB    je          0044B5F7
 0044B5ED    mov         edx,esi
 0044B5EF    mov         eax,dword ptr [ebx+18]
 0044B5F2    call        TMenuItem.SetShortCut
 0044B5F7    pop         esi
 0044B5F8    pop         ebx
 0044B5F9    ret
*}
end;

//0044B5FC
procedure TMenuActionLink.SetVisible(Value:Boolean);
begin
{*
 0044B5FC    push        ebx
 0044B5FD    push        esi
 0044B5FE    mov         ebx,edx
 0044B600    mov         esi,eax
 0044B602    mov         eax,esi
 0044B604    mov         edx,dword ptr [eax]
 0044B606    call        dword ptr [edx+44]
 0044B609    test        al,al
>0044B60B    je          0044B617
 0044B60D    mov         edx,ebx
 0044B60F    mov         eax,dword ptr [esi+18]
 0044B612    call        TMenuItem.SetVisible
 0044B617    pop         esi
 0044B618    pop         ebx
 0044B619    ret
*}
end;

//0044B61C
procedure TMenuActionLink.SetOnExecute(Value:TNotifyEvent);
begin
{*
 0044B61C    push        ebp
 0044B61D    mov         ebp,esp
 0044B61F    push        ebx
 0044B620    mov         ebx,eax
 0044B622    mov         eax,ebx
 0044B624    mov         edx,dword ptr [eax]
 0044B626    call        dword ptr [edx+8]
 0044B629    test        al,al
>0044B62B    je          0044B642
 0044B62D    mov         eax,dword ptr [ebx+18]
 0044B630    mov         edx,dword ptr [ebp+8]
 0044B633    mov         dword ptr [eax+88],edx
 0044B639    mov         edx,dword ptr [ebp+0C]
 0044B63C    mov         dword ptr [eax+8C],edx
 0044B642    pop         ebx
 0044B643    pop         ebp
 0044B644    ret         8
*}
end;

//0044B648
constructor TMenuItem.Create(AOwner:TComponent);
begin
{*
 0044B648    push        ebp
 0044B649    mov         ebp,esp
 0044B64B    push        ecx
 0044B64C    push        ebx
 0044B64D    push        esi
 0044B64E    test        dl,dl
>0044B650    je          0044B65A
 0044B652    add         esp,0FFFFFFF0
 0044B655    call        @ClassCreate
 0044B65A    mov         byte ptr [ebp-1],dl
 0044B65D    mov         ebx,eax
 0044B65F    xor         edx,edx
 0044B661    mov         eax,ebx
 0044B663    call        TComponent.Create
 0044B668    mov         byte ptr [ebx+3E],1
 0044B66C    mov         byte ptr [ebx+39],1
 0044B670    mov         byte ptr [ebx+3B],2
 0044B674    mov         byte ptr [ebx+3C],2
 0044B678    call        UniqueCommand
 0044B67D    mov         word ptr [ebx+50],ax
 0044B681    mov         dword ptr [ebx+40],0FFFFFFFF
 0044B688    mov         dl,1
 0044B68A    mov         eax,[004486E4];TChangeLink
 0044B68F    call        TObject.Create
 0044B694    mov         esi,eax
 0044B696    mov         dword ptr [ebx+78],esi
 0044B699    mov         dword ptr [esi+0C],ebx
 0044B69C    mov         dword ptr [esi+8],44E058;TMenuItem.ImageListChange
 0044B6A3    mov         eax,ebx
 0044B6A5    cmp         byte ptr [ebp-1],0
>0044B6A9    je          0044B6BA
 0044B6AB    call        @AfterConstruction
 0044B6B0    pop         dword ptr fs:[0]
 0044B6B7    add         esp,0C
 0044B6BA    mov         eax,ebx
 0044B6BC    pop         esi
 0044B6BD    pop         ebx
 0044B6BE    pop         ecx
 0044B6BF    pop         ebp
 0044B6C0    ret
*}
end;

//0044B6C4
destructor TMenuItem.Destroy;
begin
{*
 0044B6C4    push        ebx
 0044B6C5    push        esi
 0044B6C6    call        @BeforeDestruction
 0044B6CB    mov         ebx,edx
 0044B6CD    mov         esi,eax
 0044B6CF    mov         edx,esi
 0044B6D1    mov         eax,[005E0CA0];ShortCutItems:TMenuItemStack
 0044B6D6    call        TMenuItemStack.ClearItem
 0044B6DB    mov         eax,dword ptr [esi+64]
 0044B6DE    test        eax,eax
>0044B6E0    je          0044B6FE
 0044B6E2    mov         edx,esi
 0044B6E4    call        TMenuItem.Remove
 0044B6E9    xor         eax,eax
 0044B6EB    mov         dword ptr [esi+64],eax
>0044B6EE    jmp         0044B6FE
 0044B6F0    xor         edx,edx
 0044B6F2    mov         eax,esi
 0044B6F4    call        TMenuItem.GetItem
 0044B6F9    call        TObject.Free
 0044B6FE    mov         eax,esi
 0044B700    call        TMenuItem.GetCount
 0044B705    test        eax,eax
>0044B707    jg          0044B6F0
 0044B709    cmp         dword ptr [esi+34],0
>0044B70D    je          0044B721
 0044B70F    xor         edx,edx
 0044B711    mov         eax,esi
 0044B713    call        TMenuItem.MergeWith
 0044B718    mov         eax,dword ptr [esi+34]
 0044B71B    push        eax
 0044B71C    call        user32.DestroyMenu
 0044B721    mov         eax,dword ptr [esi+5C]
 0044B724    call        TObject.Free
 0044B729    lea         eax,[esi+44]
 0044B72C    call        FreeAndNil
 0044B731    lea         eax,[esi+78]
 0044B734    call        FreeAndNil
 0044B739    mov         ax,word ptr [esi+50]
 0044B73D    test        ax,ax
>0044B740    je          0044B751
 0044B742    movzx       edx,ax
 0044B745    xor         ecx,ecx
 0044B747    mov         eax,[005E0CA8];CommandPool:TBits
 0044B74C    call        TBits.SetBit
 0044B751    mov         eax,dword ptr [esi+4C]
 0044B754    test        eax,eax
>0044B756    je          0044B75D
 0044B758    call        TObject.Free
 0044B75D    mov         edx,ebx
 0044B75F    and         dl,0FC
 0044B762    mov         eax,esi
 0044B764    call        TComponent.Destroy
 0044B769    test        bl,bl
>0044B76B    jle         0044B774
 0044B76D    mov         eax,esi
 0044B76F    call        @ClassDestroy
 0044B774    pop         esi
 0044B775    pop         ebx
 0044B776    ret
*}
end;

//0044B778
procedure TMenuItem.AppendTo(Menu:HMENU; ARightToLeft:Boolean);
begin
{*
 0044B778    push        ebp
 0044B779    mov         ebp,esp
 0044B77B    add         esp,0FFFFFFC0
 0044B77E    push        ebx
 0044B77F    push        esi
 0044B780    push        edi
 0044B781    xor         ebx,ebx
 0044B783    mov         dword ptr [ebp-40],ebx
 0044B786    mov         dword ptr [ebp-8],ebx
 0044B789    mov         byte ptr [ebp-1],cl
 0044B78C    mov         edi,edx
 0044B78E    mov         ebx,eax
 0044B790    xor         eax,eax
 0044B792    push        ebp
 0044B793    push        44B9D3
 0044B798    push        dword ptr fs:[eax]
 0044B79B    mov         dword ptr fs:[eax],esp
 0044B79E    cmp         byte ptr [ebx+3E],0
>0044B7A2    je          0044B9B5
 0044B7A8    lea         eax,[ebp-8]
 0044B7AB    mov         edx,dword ptr [ebx+30]
 0044B7AE    call        @LStrLAsg
 0044B7B3    mov         eax,ebx
 0044B7B5    call        TMenuItem.GetCount
 0044B7BA    test        eax,eax
>0044B7BC    jle         0044B7CA
 0044B7BE    mov         eax,ebx
 0044B7C0    call        TMenuItem.GetHandle
 0044B7C5    mov         dword ptr [ebp-25],eax
>0044B7C8    jmp         0044B814
 0044B7CA    cmp         word ptr [ebx+60],0
>0044B7CF    je          0044B814
 0044B7D1    mov         esi,dword ptr [ebx+64]
 0044B7D4    test        esi,esi
>0044B7D6    je          0044B7F0
 0044B7D8    cmp         dword ptr [esi+64],0
>0044B7DC    jne         0044B7F0
 0044B7DE    mov         eax,dword ptr [esi+4]
 0044B7E1    mov         edx,dword ptr ds:[44A66C];TMainMenu
 0044B7E7    call        @IsClass
 0044B7EC    test        al,al
>0044B7EE    jne         0044B814
 0044B7F0    push        dword ptr [ebp-8]
 0044B7F3    push        44B9EC;#9
 0044B7F8    lea         edx,[ebp-40]
 0044B7FB    mov         ax,word ptr [ebx+60]
 0044B7FF    call        ShortCutToText
 0044B804    push        dword ptr [ebp-40]
 0044B807    lea         eax,[ebp-8]
 0044B80A    mov         edx,3
 0044B80F    call        @LStrCatN
 0044B814    call        KERNEL32.GetVersion
 0044B819    and         eax,0FF
 0044B81E    cmp         ax,4
>0044B822    jb          0044B92E
 0044B828    mov         dword ptr [ebp-39],2C
 0044B82F    mov         dword ptr [ebp-35],3F
 0044B836    mov         eax,ebx
 0044B838    call        TMenuItem.GetParentMenu
 0044B83D    mov         esi,eax
 0044B83F    test        esi,esi
>0044B841    je          0044B854
 0044B843    cmp         byte ptr [esi+40],0
>0044B847    jne         0044B86A
 0044B849    mov         eax,ebx
 0044B84B    call        TMenuItem.GetImageList
 0044B850    test        eax,eax
>0044B852    jne         0044B86A
 0044B854    cmp         dword ptr [ebx+4C],0
>0044B858    je          0044B866
 0044B85A    mov         eax,dword ptr [ebx+4C]
 0044B85D    mov         edx,dword ptr [eax]
 0044B85F    call        dword ptr [edx+1C]
 0044B862    test        al,al
>0044B864    je          0044B86A
 0044B866    xor         eax,eax
>0044B868    jmp         0044B86C
 0044B86A    mov         al,1
 0044B86C    mov         byte ptr [ebp-9],al
 0044B86F    mov         eax,dword ptr [ebx+30]
 0044B872    mov         edx,44B9F8;'-'
 0044B877    call        @LStrCmp
 0044B87C    sete        al
 0044B87F    and         eax,7F
 0044B882    mov         eax,dword ptr [eax*4+5ACD6C]
 0044B889    xor         edx,edx
 0044B88B    mov         dl,byte ptr [ebx+3D]
 0044B88E    mov         edx,dword ptr [edx*4+5ACD64]
 0044B895    xor         ecx,ecx
 0044B897    mov         cl,byte ptr [ebx+48]
 0044B89A    or          edx,dword ptr [ecx*4+5ACD40]
 0044B8A1    or          eax,edx
 0044B8A3    xor         edx,edx
 0044B8A5    mov         dl,byte ptr [ebp-1]
 0044B8A8    or          eax,dword ptr [edx*4+5ACD74]
 0044B8AF    xor         edx,edx
 0044B8B1    mov         dl,byte ptr [ebp-9]
 0044B8B4    or          eax,dword ptr [edx*4+5ACD7C]
 0044B8BB    mov         dword ptr [ebp-31],eax
 0044B8BE    xor         eax,eax
 0044B8C0    mov         al,byte ptr [ebx+38]
 0044B8C3    mov         eax,dword ptr [eax*4+5ACD4C]
 0044B8CA    xor         edx,edx
 0044B8CC    mov         dl,byte ptr [ebx+39]
 0044B8CF    or          eax,dword ptr [edx*4+5ACD5C]
 0044B8D6    xor         edx,edx
 0044B8D8    mov         dl,byte ptr [ebx+3A]
 0044B8DB    or          eax,dword ptr [edx*4+5ACD54]
 0044B8E2    mov         dword ptr [ebp-2D],eax
 0044B8E5    movzx       eax,word ptr [ebx+50]
 0044B8E9    mov         dword ptr [ebp-29],eax
 0044B8EC    xor         eax,eax
 0044B8EE    mov         dword ptr [ebp-25],eax
 0044B8F1    xor         eax,eax
 0044B8F3    mov         dword ptr [ebp-21],eax
 0044B8F6    xor         eax,eax
 0044B8F8    mov         dword ptr [ebp-1D],eax
 0044B8FB    mov         eax,dword ptr [ebp-8]
 0044B8FE    call        @LStrToPChar
 0044B903    mov         dword ptr [ebp-15],eax
 0044B906    mov         eax,ebx
 0044B908    call        TMenuItem.GetCount
 0044B90D    test        eax,eax
>0044B90F    jle         0044B91B
 0044B911    mov         eax,ebx
 0044B913    call        TMenuItem.GetHandle
 0044B918    mov         dword ptr [ebp-25],eax
 0044B91B    lea         eax,[ebp-39]
 0044B91E    push        eax
 0044B91F    push        0FF
 0044B921    push        0FF
 0044B923    push        edi
 0044B924    call        user32.InsertMenuItemA
>0044B929    jmp         0044B9B5
 0044B92E    mov         eax,dword ptr [ebx+30]
 0044B931    mov         edx,44B9F8;'-'
 0044B936    call        @LStrCmp
 0044B93B    sete        al
 0044B93E    and         eax,7F
 0044B941    mov         esi,dword ptr [eax*4+5ACD38]
 0044B948    xor         eax,eax
 0044B94A    mov         al,byte ptr [ebx+48]
 0044B94D    mov         eax,dword ptr [eax*4+5ACD2C]
 0044B954    xor         edx,edx
 0044B956    mov         dl,byte ptr [ebx+38]
 0044B959    or          eax,dword ptr [edx*4+5ACD1C]
 0044B960    xor         edx,edx
 0044B962    mov         dl,byte ptr [ebx+39]
 0044B965    or          eax,dword ptr [edx*4+5ACD24]
 0044B96C    or          esi,eax
 0044B96E    or          esi,400
 0044B974    mov         eax,ebx
 0044B976    call        TMenuItem.GetCount
 0044B97B    test        eax,eax
>0044B97D    jle         0044B99E
 0044B97F    mov         eax,dword ptr [ebx+30]
 0044B982    call        @LStrToPChar
 0044B987    push        eax
 0044B988    mov         eax,ebx
 0044B98A    call        TMenuItem.GetHandle
 0044B98F    push        eax
 0044B990    or          esi,10
 0044B993    push        esi
 0044B994    push        0FF
 0044B996    push        edi
 0044B997    call        user32.InsertMenuA
>0044B99C    jmp         0044B9B5
 0044B99E    mov         eax,dword ptr [ebp-8]
 0044B9A1    call        @LStrToPChar
 0044B9A6    push        eax
 0044B9A7    movzx       eax,word ptr [ebx+50]
 0044B9AB    push        eax
 0044B9AC    push        esi
 0044B9AD    push        0FF
 0044B9AF    push        edi
 0044B9B0    call        user32.InsertMenuA
 0044B9B5    xor         eax,eax
 0044B9B7    pop         edx
 0044B9B8    pop         ecx
 0044B9B9    pop         ecx
 0044B9BA    mov         dword ptr fs:[eax],edx
 0044B9BD    push        44B9DA
 0044B9C2    lea         eax,[ebp-40]
 0044B9C5    call        @LStrClr
 0044B9CA    lea         eax,[ebp-8]
 0044B9CD    call        @LStrClr
 0044B9D2    ret
>0044B9D3    jmp         @HandleFinally
>0044B9D8    jmp         0044B9C2
 0044B9DA    pop         edi
 0044B9DB    pop         esi
 0044B9DC    pop         ebx
 0044B9DD    mov         esp,ebp
 0044B9DF    pop         ebp
 0044B9E0    ret
*}
end;

//0044B9FC
function AddIn(MenuItem:TMenuItem):Boolean;
begin
{*
 0044B9FC    push        ebp
 0044B9FD    mov         ebp,esp
 0044B9FF    mov         edx,dword ptr [ebp+8]
 0044BA02    mov         cl,byte ptr [edx-5]
 0044BA05    mov         edx,dword ptr [ebp+8]
 0044BA08    mov         edx,dword ptr [edx-4]
 0044BA0B    mov         edx,dword ptr [edx+34]
 0044BA0E    call        TMenuItem.AppendTo
 0044BA13    xor         eax,eax
 0044BA15    pop         ebp
 0044BA16    ret
*}
end;

//0044BA18
procedure TMenuItem.PopulateMenu;
begin
{*
 0044BA18    push        ebp
 0044BA19    mov         ebp,esp
 0044BA1B    add         esp,0FFFFFFF8
 0044BA1E    push        ebx
 0044BA1F    mov         dword ptr [ebp-4],eax
 0044BA22    mov         eax,dword ptr [ebp-4]
 0044BA25    mov         ebx,dword ptr [eax+70]
 0044BA28    test        ebx,ebx
>0044BA2A    je          0044BA51
 0044BA2C    mov         eax,ebx
 0044BA2E    mov         edx,dword ptr ds:[44A66C];TMainMenu
 0044BA34    call        @IsClass
 0044BA39    test        al,al
>0044BA3B    je          0044BA51
 0044BA3D    xor         edx,edx
 0044BA3F    mov         eax,dword ptr [ebp-4]
 0044BA42    call        TMenuItem.InternalRethinkHotkeys
 0044BA47    xor         edx,edx
 0044BA49    mov         eax,dword ptr [ebp-4]
 0044BA4C    call        TMenuItem.InternalRethinkLines
 0044BA51    mov         eax,dword ptr [ebp-4]
 0044BA54    mov         ebx,dword ptr [eax+70]
 0044BA57    test        ebx,ebx
>0044BA59    je          0044BA66
 0044BA5B    mov         eax,ebx
 0044BA5D    call        TMenu.IsRightToLeft
 0044BA62    test        al,al
>0044BA64    jne         0044BA6A
 0044BA66    xor         eax,eax
>0044BA68    jmp         0044BA6C
 0044BA6A    mov         al,1
 0044BA6C    mov         byte ptr [ebp-5],al
 0044BA6F    mov         eax,dword ptr [ebp-4]
 0044BA72    mov         edx,dword ptr [eax+68]
 0044BA75    mov         eax,44B9FC;AddIn:Boolean
 0044BA7A    mov         ecx,dword ptr [ebp-4]
 0044BA7D    call        IterateMenus
 0044BA82    pop         ebx
 0044BA83    pop         ecx
 0044BA84    pop         ecx
 0044BA85    pop         ebp
 0044BA86    ret
*}
end;

//0044BA88
procedure TMenuItem.ReadShortCutText(Reader:TReader);
begin
{*
 0044BA88    push        ebp
 0044BA89    mov         ebp,esp
 0044BA8B    push        0
 0044BA8D    push        ebx
 0044BA8E    push        esi
 0044BA8F    mov         esi,edx
 0044BA91    mov         ebx,eax
 0044BA93    xor         eax,eax
 0044BA95    push        ebp
 0044BA96    push        44BAD2
 0044BA9B    push        dword ptr fs:[eax]
 0044BA9E    mov         dword ptr fs:[eax],esp
 0044BAA1    lea         edx,[ebp-4]
 0044BAA4    mov         eax,esi
 0044BAA6    call        TReader.ReadString
 0044BAAB    mov         eax,dword ptr [ebp-4]
 0044BAAE    call        TextToShortCut
 0044BAB3    mov         edx,eax
 0044BAB5    mov         eax,ebx
 0044BAB7    call        TMenuItem.SetShortCut
 0044BABC    xor         eax,eax
 0044BABE    pop         edx
 0044BABF    pop         ecx
 0044BAC0    pop         ecx
 0044BAC1    mov         dword ptr fs:[eax],edx
 0044BAC4    push        44BAD9
 0044BAC9    lea         eax,[ebp-4]
 0044BACC    call        @LStrClr
 0044BAD1    ret
>0044BAD2    jmp         @HandleFinally
>0044BAD7    jmp         0044BAC9
 0044BAD9    pop         esi
 0044BADA    pop         ebx
 0044BADB    pop         ecx
 0044BADC    pop         ebp
 0044BADD    ret
*}
end;

//0044BAE0
procedure TMenuItem.MergeWith(Menu:TMenuItem);
begin
{*
 0044BAE0    push        ebx
 0044BAE1    mov         ebx,eax
 0044BAE3    test        edx,edx
>0044BAE5    je          0044BAED
 0044BAE7    test        byte ptr [edx+1C],8
>0044BAEB    jne         0044BB17
 0044BAED    mov         eax,dword ptr [ebx+68]
 0044BAF0    cmp         edx,eax
>0044BAF2    je          0044BB17
 0044BAF4    test        eax,eax
>0044BAF6    je          0044BAFD
 0044BAF8    xor         ecx,ecx
 0044BAFA    mov         dword ptr [eax+6C],ecx
 0044BAFD    mov         eax,edx
 0044BAFF    mov         dword ptr [ebx+68],eax
 0044BB02    test        eax,eax
>0044BB04    je          0044BB10
 0044BB06    mov         dword ptr [eax+6C],ebx
 0044BB09    mov         edx,ebx
 0044BB0B    call        TComponent.FreeNotification
 0044BB10    mov         eax,ebx
 0044BB12    call        TMenuItem.RebuildHandle
 0044BB17    pop         ebx
 0044BB18    ret
*}
end;

//0044BB1C
procedure TMenuItem.Loaded;
begin
{*
 0044BB1C    push        ebx
 0044BB1D    push        esi
 0044BB1E    mov         ebx,eax
 0044BB20    mov         eax,ebx
 0044BB22    call        TComponent.Loaded
 0044BB27    mov         eax,ebx
 0044BB29    call        TMenuItem.GetAction
 0044BB2E    test        eax,eax
>0044BB30    je          0044BB48
 0044BB32    mov         eax,ebx
 0044BB34    call        TMenuItem.GetAction
 0044BB39    mov         edx,eax
 0044BB3B    mov         cl,1
 0044BB3D    mov         eax,ebx
 0044BB3F    mov         si,0FFEF
 0044BB43    call        @CallDynaInst
 0044BB48    cmp         byte ptr [ebx+74],0
>0044BB4C    je          0044BB55
 0044BB4E    mov         eax,ebx
 0044BB50    call        TMenuItem.RebuildHandle
 0044BB55    pop         esi
 0044BB56    pop         ebx
 0044BB57    ret
*}
end;

//0044BB58
procedure TMenuItem.RebuildHandle;
begin
{*
 0044BB58    push        ebx
 0044BB59    push        esi
 0044BB5A    push        edi
 0044BB5B    push        ebp
 0044BB5C    mov         ebp,eax
 0044BB5E    test        byte ptr [ebp+1C],8
>0044BB62    jne         0044BC21
 0044BB68    test        byte ptr [ebp+1C],2
>0044BB6C    je          0044BB77
 0044BB6E    mov         byte ptr [ebp+74],1
>0044BB72    jmp         0044BC21
 0044BB77    mov         eax,dword ptr [ebp+6C]
 0044BB7A    test        eax,eax
>0044BB7C    je          0044BB88
 0044BB7E    call        TMenuItem.RebuildHandle
>0044BB83    jmp         0044BC21
 0044BB88    mov         eax,ebp
 0044BB8A    call        TMenuItem.GetHandle
 0044BB8F    push        eax
 0044BB90    call        user32.GetMenuItemCount
 0044BB95    mov         esi,eax
 0044BB97    test        esi,esi
 0044BB99    sete        bl
 0044BB9C    test        esi,esi
>0044BB9E    jle         0044BBD4
 0044BBA0    push        400
 0044BBA5    mov         edi,esi
 0044BBA7    dec         edi
 0044BBA8    push        edi
 0044BBA9    mov         eax,ebp
 0044BBAB    call        TMenuItem.GetHandle
 0044BBB0    push        eax
 0044BBB1    call        user32.GetMenuState
 0044BBB6    test        al,4
>0044BBB8    jne         0044BBCF
 0044BBBA    push        400
 0044BBBF    push        edi
 0044BBC0    mov         eax,ebp
 0044BBC2    call        TMenuItem.GetHandle
 0044BBC7    push        eax
 0044BBC8    call        user32.RemoveMenu
 0044BBCD    mov         bl,1
 0044BBCF    dec         esi
 0044BBD0    test        esi,esi
>0044BBD2    jg          0044BBA0
 0044BBD4    test        bl,bl
>0044BBD6    je          0044BC21
 0044BBD8    cmp         dword ptr [ebp+64],0
>0044BBDC    jne         0044BC11
 0044BBDE    mov         eax,dword ptr [ebp+70]
 0044BBE1    mov         edx,dword ptr ds:[44A66C];TMainMenu
 0044BBE7    call        @IsClass
 0044BBEC    test        al,al
>0044BBEE    je          0044BC11
 0044BBF0    mov         eax,ebp
 0044BBF2    call        TMenuItem.GetHandle
 0044BBF7    push        eax
 0044BBF8    call        user32.GetMenuItemCount
 0044BBFD    test        eax,eax
>0044BBFF    jne         0044BC11
 0044BC01    mov         eax,dword ptr [ebp+34]
 0044BC04    push        eax
 0044BC05    call        user32.DestroyMenu
 0044BC0A    xor         eax,eax
 0044BC0C    mov         dword ptr [ebp+34],eax
>0044BC0F    jmp         0044BC18
 0044BC11    mov         eax,ebp
 0044BC13    call        TMenuItem.PopulateMenu
 0044BC18    xor         edx,edx
 0044BC1A    mov         eax,ebp
 0044BC1C    mov         ecx,dword ptr [eax]
 0044BC1E    call        dword ptr [ecx+3C]
 0044BC21    pop         ebp
 0044BC22    pop         edi
 0044BC23    pop         esi
 0044BC24    pop         ebx
 0044BC25    ret
*}
end;

//0044BC28
procedure TMenuItem.VerifyGroupIndex(Position:Integer; Value:Byte);
begin
{*
 0044BC28    push        ebx
 0044BC29    push        esi
 0044BC2A    push        edi
 0044BC2B    push        ebp
 0044BC2C    push        ecx
 0044BC2D    mov         ebx,ecx
 0044BC2F    mov         dword ptr [esp],edx
 0044BC32    mov         edi,eax
 0044BC34    mov         eax,edi
 0044BC36    call        TMenuItem.GetCount
 0044BC3B    mov         esi,eax
 0044BC3D    dec         esi
 0044BC3E    test        esi,esi
>0044BC40    jl          0044BC82
 0044BC42    inc         esi
 0044BC43    xor         ebp,ebp
 0044BC45    cmp         ebp,dword ptr [esp]
>0044BC48    jge         0044BC64
 0044BC4A    mov         edx,ebp
 0044BC4C    mov         eax,edi
 0044BC4E    call        TMenuItem.GetItem
 0044BC53    cmp         bl,byte ptr [eax+3F]
>0044BC56    jae         0044BC7E
 0044BC58    mov         eax,[005AE228];^SGroupIndexTooLow:TResStringRec
 0044BC5D    call        Error
>0044BC62    jmp         0044BC7E
 0044BC64    mov         edx,ebp
 0044BC66    mov         eax,edi
 0044BC68    call        TMenuItem.GetItem
 0044BC6D    cmp         bl,byte ptr [eax+3F]
>0044BC70    jbe         0044BC7E
 0044BC72    mov         edx,ebp
 0044BC74    mov         eax,edi
 0044BC76    call        TMenuItem.GetItem
 0044BC7B    mov         byte ptr [eax+3F],bl
 0044BC7E    inc         ebp
 0044BC7F    dec         esi
>0044BC80    jne         0044BC45
 0044BC82    pop         edx
 0044BC83    pop         ebp
 0044BC84    pop         edi
 0044BC85    pop         esi
 0044BC86    pop         ebx
 0044BC87    ret
*}
end;

//0044BC88
function TMenuItem.GetHandle:HMENU;
begin
{*
 0044BC88    push        ebx
 0044BC89    mov         ebx,eax
 0044BC8B    cmp         dword ptr [ebx+34],0
>0044BC8F    jne         0044BCCC
 0044BC91    mov         eax,dword ptr [ebx+4]
 0044BC94    mov         edx,dword ptr ds:[44A950];TPopupMenu
 0044BC9A    call        @IsClass
 0044BC9F    test        al,al
>0044BCA1    je          0044BCAD
 0044BCA3    call        user32.CreatePopupMenu
 0044BCA8    mov         dword ptr [ebx+34],eax
>0044BCAB    jmp         0044BCB5
 0044BCAD    call        user32.CreateMenu
 0044BCB2    mov         dword ptr [ebx+34],eax
 0044BCB5    cmp         dword ptr [ebx+34],0
>0044BCB9    jne         0044BCC5
 0044BCBB    mov         eax,[005AE1D0];^SOutOfResources:TResStringRec
 0044BCC0    call        Error
 0044BCC5    mov         eax,ebx
 0044BCC7    call        TMenuItem.PopulateMenu
 0044BCCC    mov         eax,dword ptr [ebx+34]
 0044BCCF    pop         ebx
 0044BCD0    ret
*}
end;

//0044BCD4
procedure TMenuItem.DefineProperties(Filer:TFiler);
begin
{*
 0044BCD4    push        ebx
 0044BCD5    push        esi
 0044BCD6    mov         esi,edx
 0044BCD8    mov         ebx,eax
 0044BCDA    mov         edx,esi
 0044BCDC    mov         eax,ebx
 0044BCDE    call        TComponent.DefineProperties
 0044BCE3    push        ebx
 0044BCE4    push        44BA88;TMenuItem.ReadShortCutText
 0044BCE9    push        0
 0044BCEB    push        0
 0044BCED    xor         ecx,ecx
 0044BCEF    mov         edx,44BD08;'ShortCutText'
 0044BCF4    mov         eax,esi
 0044BCF6    mov         ebx,dword ptr [eax]
 0044BCF8    call        dword ptr [ebx+4]
 0044BCFB    pop         esi
 0044BCFC    pop         ebx
 0044BCFD    ret
*}
end;

//0044BD18
procedure TMenuItem.DoDrawText(ACanvas:TCanvas; const ACaption:AnsiString; var Rect:TRect; Selected:Boolean; Flags:Longint);
begin
{*
 0044BD18    push        ebp
 0044BD19    mov         ebp,esp
 0044BD1B    add         esp,0FFFFFFE4
 0044BD1E    push        ebx
 0044BD1F    push        esi
 0044BD20    push        edi
 0044BD21    xor         ebx,ebx
 0044BD23    mov         dword ptr [ebp-0C],ebx
 0044BD26    mov         dword ptr [ebp-8],ecx
 0044BD29    mov         dword ptr [ebp-4],edx
 0044BD2C    mov         esi,eax
 0044BD2E    mov         ebx,dword ptr [ebp+8]
 0044BD31    xor         eax,eax
 0044BD33    push        ebp
 0044BD34    push        44BEFC
 0044BD39    push        dword ptr fs:[eax]
 0044BD3C    mov         dword ptr fs:[eax],esp
 0044BD3F    mov         eax,esi
 0044BD41    call        TMenuItem.GetParentMenu
 0044BD46    mov         edi,eax
 0044BD48    test        edi,edi
>0044BD4A    je          0044BD7A
 0044BD4C    mov         eax,edi
 0044BD4E    call        TMenu.IsRightToLeft
 0044BD53    test        al,al
>0044BD55    je          0044BD7A
 0044BD57    test        bl,0
>0044BD5A    jne         0044BD64
 0044BD5C    and         ebx,0FFFFFFFF
 0044BD5F    or          ebx,2
>0044BD62    jmp         0044BD74
 0044BD64    mov         eax,ebx
 0044BD66    and         eax,2
 0044BD69    cmp         eax,2
>0044BD6C    jne         0044BD74
 0044BD6E    and         ebx,0FFFFFFFD
 0044BD71    or          ebx,0
 0044BD74    or          ebx,20000
 0044BD7A    lea         eax,[ebp-0C]
 0044BD7D    mov         edx,dword ptr [ebp-8]
 0044BD80    call        @LStrLAsg
 0044BD85    test        bh,4
>0044BD88    je          0044BDAE
 0044BD8A    cmp         dword ptr [ebp-0C],0
>0044BD8E    je          0044BDA1
 0044BD90    mov         eax,dword ptr [ebp-0C]
 0044BD93    cmp         byte ptr [eax],26
>0044BD96    jne         0044BDAE
 0044BD98    mov         eax,dword ptr [ebp-0C]
 0044BD9B    cmp         byte ptr [eax+1],0
>0044BD9F    jne         0044BDAE
 0044BDA1    lea         eax,[ebp-0C]
 0044BDA4    mov         edx,44BF14;' '
 0044BDA9    call        @LStrCat
 0044BDAE    mov         eax,dword ptr [ebp-0C]
 0044BDB1    mov         edx,44BF20;'-'
 0044BDB6    call        @LStrCmp
>0044BDBB    jne         0044BDF1
 0044BDBD    test        bh,4
>0044BDC0    jne         0044BEE6
 0044BDC6    mov         eax,dword ptr [ebp+10]
 0044BDC9    mov         esi,eax
 0044BDCB    lea         edi,[ebp-1C]
 0044BDCE    movs        dword ptr [edi],dword ptr [esi]
 0044BDCF    movs        dword ptr [edi],dword ptr [esi]
 0044BDD0    movs        dword ptr [edi],dword ptr [esi]
 0044BDD1    movs        dword ptr [edi],dword ptr [esi]
 0044BDD2    add         dword ptr [ebp-18],4
 0044BDD6    push        2
 0044BDD8    push        6
 0044BDDA    lea         eax,[ebp-1C]
 0044BDDD    push        eax
 0044BDDE    mov         eax,dword ptr [ebp-4]
 0044BDE1    call        TCanvas.GetHandle
 0044BDE6    push        eax
 0044BDE7    call        user32.DrawEdge
>0044BDEC    jmp         0044BEE6
 0044BDF1    mov         eax,dword ptr [ebp-4]
 0044BDF4    mov         eax,dword ptr [eax+14]
 0044BDF7    mov         dl,1
 0044BDF9    call        TBrush.SetStyle
 0044BDFE    cmp         byte ptr [esi+3A],0
>0044BE02    je          0044BE20
 0044BE04    mov         eax,dword ptr [ebp-4]
 0044BE07    mov         edi,dword ptr [eax+0C]
 0044BE0A    mov         eax,edi
 0044BE0C    call        TFont.GetStyle
 0044BE11    mov         edx,eax
 0044BE13    or          dl,byte ptr ds:[44BF24]
 0044BE19    mov         eax,edi
 0044BE1B    call        TFont.SetStyle
 0044BE20    cmp         byte ptr [esi+39],0
>0044BE24    jne         0044BEC1
 0044BE2A    cmp         byte ptr [ebp+0C],0
>0044BE2E    jne         0044BE7F
 0044BE30    push        1
 0044BE32    push        1
 0044BE34    mov         eax,dword ptr [ebp+10]
 0044BE37    push        eax
 0044BE38    call        user32.OffsetRect
 0044BE3D    mov         eax,dword ptr [ebp-4]
 0044BE40    mov         eax,dword ptr [eax+0C]
 0044BE43    mov         edx,0FF000014
 0044BE48    call        TFont.SetColor
 0044BE4D    push        ebx
 0044BE4E    mov         eax,dword ptr [ebp+10]
 0044BE51    push        eax
 0044BE52    mov         eax,dword ptr [ebp-0C]
 0044BE55    call        @LStrLen
 0044BE5A    push        eax
 0044BE5B    mov         eax,dword ptr [ebp-0C]
 0044BE5E    call        @LStrToPChar
 0044BE63    push        eax
 0044BE64    mov         eax,dword ptr [ebp-4]
 0044BE67    call        TCanvas.GetHandle
 0044BE6C    push        eax
 0044BE6D    call        user32.DrawTextA
 0044BE72    push        0FF
 0044BE74    push        0FF
 0044BE76    mov         eax,dword ptr [ebp+10]
 0044BE79    push        eax
 0044BE7A    call        user32.OffsetRect
 0044BE7F    cmp         byte ptr [ebp+0C],0
>0044BE83    je          0044BEB1
 0044BE85    mov         eax,0FF00000D
 0044BE8A    call        ColorToRGB
 0044BE8F    mov         esi,eax
 0044BE91    mov         eax,0FF000010
 0044BE96    call        ColorToRGB
 0044BE9B    cmp         esi,eax
>0044BE9D    jne         0044BEB1
 0044BE9F    mov         eax,dword ptr [ebp-4]
 0044BEA2    mov         eax,dword ptr [eax+0C]
 0044BEA5    mov         edx,0FF000014
 0044BEAA    call        TFont.SetColor
>0044BEAF    jmp         0044BEC1
 0044BEB1    mov         eax,dword ptr [ebp-4]
 0044BEB4    mov         eax,dword ptr [eax+0C]
 0044BEB7    mov         edx,0FF000010
 0044BEBC    call        TFont.SetColor
 0044BEC1    push        ebx
 0044BEC2    mov         eax,dword ptr [ebp+10]
 0044BEC5    push        eax
 0044BEC6    mov         eax,dword ptr [ebp-0C]
 0044BEC9    call        @LStrLen
 0044BECE    push        eax
 0044BECF    mov         eax,dword ptr [ebp-0C]
 0044BED2    call        @LStrToPChar
 0044BED7    push        eax
 0044BED8    mov         eax,dword ptr [ebp-4]
 0044BEDB    call        TCanvas.GetHandle
 0044BEE0    push        eax
 0044BEE1    call        user32.DrawTextA
 0044BEE6    xor         eax,eax
 0044BEE8    pop         edx
 0044BEE9    pop         ecx
 0044BEEA    pop         ecx
 0044BEEB    mov         dword ptr fs:[eax],edx
 0044BEEE    push        44BF03
 0044BEF3    lea         eax,[ebp-0C]
 0044BEF6    call        @LStrClr
 0044BEFB    ret
>0044BEFC    jmp         @HandleFinally
>0044BF01    jmp         0044BEF3
 0044BF03    pop         edi
 0044BF04    pop         esi
 0044BF05    pop         ebx
 0044BF06    mov         esp,ebp
 0044BF08    pop         ebp
 0044BF09    ret         0C
*}
end;

//0044BF28
procedure TMenuItem.DrawItem(ACanvas:TCanvas; ARect:TRect; Selected:Boolean);
begin
{*
 0044BF28    push        ebp
 0044BF29    mov         ebp,esp
 0044BF2B    add         esp,0FFFFFFF0
 0044BF2E    push        ebx
 0044BF2F    push        esi
 0044BF30    push        edi
 0044BF31    mov         esi,ecx
 0044BF33    lea         edi,[ebp-10]
 0044BF36    movs        dword ptr [edi],dword ptr [esi]
 0044BF37    movs        dword ptr [edi],dword ptr [esi]
 0044BF38    movs        dword ptr [edi],dword ptr [esi]
 0044BF39    movs        dword ptr [edi],dword ptr [esi]
 0044BF3A    cmp         word ptr [eax+92],0
>0044BF42    je          0044BF5E
 0044BF44    lea         ecx,[ebp-10]
 0044BF47    push        ecx
 0044BF48    mov         cl,byte ptr [ebp+8]
 0044BF4B    push        ecx
 0044BF4C    mov         ebx,eax
 0044BF4E    mov         ecx,edx
 0044BF50    mov         edx,eax
 0044BF52    mov         eax,dword ptr [ebx+94]
 0044BF58    call        dword ptr [ebx+90]
 0044BF5E    pop         edi
 0044BF5F    pop         esi
 0044BF60    pop         ebx
 0044BF61    mov         esp,ebp
 0044BF63    pop         ebp
 0044BF64    ret         4
*}
end;

//0044BF68
procedure NormalDraw;
begin
{*
 0044BF68    push        ebp
 0044BF69    mov         ebp,esp
 0044BF6B    push        0
 0044BF6D    push        ebx
 0044BF6E    push        esi
 0044BF6F    push        edi
 0044BF70    xor         eax,eax
 0044BF72    push        ebp
 0044BF73    push        44C850
 0044BF78    push        dword ptr fs:[eax]
 0044BF7B    mov         dword ptr fs:[eax],esp
 0044BF7E    mov         eax,dword ptr [ebp+8]
 0044BF81    cmp         byte ptr [eax-21],0
>0044BF85    je          0044BFDD
 0044BF87    mov         eax,dword ptr [ebp+8]
 0044BF8A    test        byte ptr [eax+0C],1
>0044BF8E    jne         0044BF99
 0044BF90    mov         eax,dword ptr [ebp+8]
 0044BF93    test        byte ptr [eax+0C],40
>0044BF97    je          0044BFC1
 0044BF99    mov         eax,dword ptr [ebp+8]
 0044BF9C    mov         eax,dword ptr [eax-28]
 0044BF9F    mov         eax,dword ptr [eax+14]
 0044BFA2    mov         edx,0FF00001D
 0044BFA7    call        TBrush.SetColor
 0044BFAC    mov         eax,dword ptr [ebp+8]
 0044BFAF    mov         eax,dword ptr [eax-28]
 0044BFB2    mov         eax,dword ptr [eax+0C]
 0044BFB5    mov         edx,0FF00000E
 0044BFBA    call        TFont.SetColor
>0044BFBF    jmp         0044BFDD
 0044BFC1    mov         eax,dword ptr [ebp+8]
 0044BFC4    cmp         byte ptr [eax+8],0
>0044BFC8    je          0044BFDD
 0044BFCA    mov         eax,dword ptr [ebp+8]
 0044BFCD    mov         eax,dword ptr [eax-28]
 0044BFD0    mov         eax,dword ptr [eax+14]
 0044BFD3    mov         edx,0FF00001E
 0044BFD8    call        TBrush.SetColor
 0044BFDD    mov         eax,dword ptr [ebp+8]
 0044BFE0    cmp         byte ptr [eax-29],0
>0044BFE4    je          0044BFEF
 0044BFE6    mov         eax,dword ptr [ebp+8]
 0044BFE9    cmp         byte ptr [eax-21],0
>0044BFED    je          0044C000
 0044BFEF    mov         eax,dword ptr [ebp+8]
 0044BFF2    lea         edx,[eax-20]
 0044BFF5    mov         eax,dword ptr [ebp+8]
 0044BFF8    mov         eax,dword ptr [eax-28]
 0044BFFB    call        TCanvas.FillRect
 0044C000    mov         eax,dword ptr [ebp+8]
 0044C003    cmp         dword ptr [eax-30],0
>0044C007    je          0044C012
 0044C009    mov         eax,dword ptr [ebp+8]
 0044C00C    mov         byte ptr [eax-31],0
>0044C010    jmp         0044C03F
 0044C012    mov         eax,dword ptr [ebp+8]
 0044C015    mov         eax,dword ptr [eax-30]
 0044C018    mov         edx,dword ptr ds:[44A950];TPopupMenu
 0044C01E    call        @IsClass
 0044C023    test        al,al
>0044C025    je          0044C038
 0044C027    mov         eax,dword ptr [ebp+8]
 0044C02A    mov         eax,dword ptr [eax-30]
 0044C02D    mov         al,byte ptr [eax+60]
 0044C030    mov         edx,dword ptr [ebp+8]
 0044C033    mov         byte ptr [edx-31],al
>0044C036    jmp         0044C03F
 0044C038    mov         eax,dword ptr [ebp+8]
 0044C03B    mov         byte ptr [eax-31],0
 0044C03F    mov         eax,dword ptr [ebp+8]
 0044C042    mov         eax,dword ptr [eax-20]
 0044C045    inc         eax
 0044C046    mov         edx,dword ptr [ebp+8]
 0044C049    mov         dword ptr [edx-10],eax
 0044C04C    mov         eax,dword ptr [ebp+8]
 0044C04F    mov         eax,dword ptr [eax-1C]
 0044C052    inc         eax
 0044C053    mov         edx,dword ptr [ebp+8]
 0044C056    mov         dword ptr [edx-0C],eax
 0044C059    mov         eax,dword ptr [ebp+8]
 0044C05C    mov         eax,dword ptr [eax-38]
 0044C05F    mov         eax,dword ptr [eax+30]
 0044C062    mov         edx,44C868;'-'
 0044C067    call        @LStrCmp
>0044C06C    jne         0044C09D
 0044C06E    mov         eax,dword ptr [ebp+8]
 0044C071    lea         edx,[eax-20]
 0044C074    mov         eax,dword ptr [ebp+8]
 0044C077    mov         eax,dword ptr [eax-28]
 0044C07A    call        TCanvas.FillRect
 0044C07F    mov         eax,dword ptr [ebp+8]
 0044C082    xor         edx,edx
 0044C084    mov         dword ptr [eax-10],edx
 0044C087    mov         eax,dword ptr [ebp+8]
 0044C08A    mov         dword ptr [eax-8],0FFFFFFFC
 0044C091    mov         eax,dword ptr [ebp+8]
 0044C094    mov         byte ptr [eax-39],0
>0044C098    jmp         0044C537
 0044C09D    mov         eax,dword ptr [ebp+8]
 0044C0A0    cmp         dword ptr [eax-40],0
>0044C0A4    je          0044C0ED
 0044C0A6    mov         eax,dword ptr [ebp+8]
 0044C0A9    mov         eax,dword ptr [eax-38]
 0044C0AC    mov         ebx,dword ptr [eax+40]
 0044C0AF    cmp         ebx,0FFFFFFFF
>0044C0B2    jle         0044C0C6
 0044C0B4    mov         eax,dword ptr [ebp+8]
 0044C0B7    mov         eax,dword ptr [ebp+8]
 0044C0BA    mov         eax,dword ptr [eax-40]
 0044C0BD    call        TCustomImageList.GetCount
 0044C0C2    cmp         ebx,eax
>0044C0C4    jl          0044C0F1
 0044C0C6    mov         eax,dword ptr [ebp+8]
 0044C0C9    mov         eax,dword ptr [eax-38]
 0044C0CC    cmp         byte ptr [eax+38],0
>0044C0D0    je          0044C0ED
 0044C0D2    mov         eax,dword ptr [ebp+8]
 0044C0D5    mov         eax,dword ptr [eax-38]
 0044C0D8    mov         esi,dword ptr [eax+4C]
 0044C0DB    test        esi,esi
>0044C0DD    je          0044C0F1
 0044C0DF    mov         eax,dword ptr [ebp+8]
 0044C0E2    mov         eax,esi
 0044C0E4    mov         edx,dword ptr [eax]
 0044C0E6    call        dword ptr [edx+1C]
 0044C0E9    test        al,al
>0044C0EB    jne         0044C0F1
 0044C0ED    xor         eax,eax
>0044C0EF    jmp         0044C0F3
 0044C0F1    mov         al,1
 0044C0F3    mov         edx,dword ptr [ebp+8]
 0044C0F6    mov         byte ptr [edx-41],al
 0044C0F9    mov         eax,dword ptr [ebp+8]
 0044C0FC    cmp         byte ptr [eax-41],0
>0044C100    jne         0044C125
 0044C102    mov         eax,dword ptr [ebp+8]
 0044C105    mov         eax,dword ptr [eax-38]
 0044C108    mov         ebx,dword ptr [eax+4C]
 0044C10B    test        ebx,ebx
>0044C10D    je          0044C4DA
 0044C113    mov         eax,dword ptr [ebp+8]
 0044C116    mov         eax,ebx
 0044C118    mov         edx,dword ptr [eax]
 0044C11A    call        dword ptr [edx+1C]
 0044C11D    test        al,al
>0044C11F    jne         0044C4DA
 0044C125    mov         eax,dword ptr [ebp+8]
 0044C128    mov         byte ptr [eax-39],1
 0044C12C    mov         eax,dword ptr [ebp+8]
 0044C12F    cmp         byte ptr [eax-41],0
>0044C133    je          0044C161
 0044C135    mov         eax,dword ptr [ebp+8]
 0044C138    mov         eax,dword ptr [eax-10]
 0044C13B    mov         edx,dword ptr [ebp+8]
 0044C13E    mov         edx,dword ptr [edx-40]
 0044C141    add         eax,dword ptr [edx+34]
 0044C144    mov         edx,dword ptr [ebp+8]
 0044C147    mov         dword ptr [edx-8],eax
 0044C14A    mov         eax,dword ptr [ebp+8]
 0044C14D    mov         eax,dword ptr [eax-0C]
 0044C150    mov         edx,dword ptr [ebp+8]
 0044C153    mov         edx,dword ptr [edx-40]
 0044C156    add         eax,dword ptr [edx+30]
 0044C159    mov         edx,dword ptr [ebp+8]
 0044C15C    mov         dword ptr [edx-4],eax
>0044C15F    jmp         0044C17F
 0044C161    mov         eax,dword ptr [ebp+8]
 0044C164    mov         eax,dword ptr [eax-10]
 0044C167    add         eax,10
 0044C16A    mov         edx,dword ptr [ebp+8]
 0044C16D    mov         dword ptr [edx-8],eax
 0044C170    mov         eax,dword ptr [ebp+8]
 0044C173    mov         eax,dword ptr [eax-0C]
 0044C176    add         eax,10
 0044C179    mov         edx,dword ptr [ebp+8]
 0044C17C    mov         dword ptr [edx-4],eax
 0044C17F    mov         eax,dword ptr [ebp+8]
 0044C182    mov         eax,dword ptr [eax-38]
 0044C185    cmp         byte ptr [eax+38],0
>0044C189    je          0044C24F
 0044C18F    mov         eax,dword ptr [ebp+8]
 0044C192    cmp         byte ptr [eax-21],0
>0044C196    jne         0044C24F
 0044C19C    mov         eax,dword ptr [ebp+8]
 0044C19F    inc         dword ptr [eax-8]
 0044C1A2    mov         eax,dword ptr [ebp+8]
 0044C1A5    inc         dword ptr [eax-4]
 0044C1A8    mov         eax,dword ptr [ebp+8]
 0044C1AB    mov         eax,dword ptr [eax-28]
 0044C1AE    mov         eax,dword ptr [eax+14]
 0044C1B1    call        TBrush.GetColor
 0044C1B6    mov         edx,dword ptr [ebp+8]
 0044C1B9    mov         dword ptr [edx-48],eax
 0044C1BC    mov         eax,dword ptr [ebp+8]
 0044C1BF    test        byte ptr [eax+0C],1
>0044C1C3    jne         0044C20B
 0044C1C5    mov         eax,dword ptr [ebp+8]
 0044C1C8    mov         eax,dword ptr [eax-28]
 0044C1CB    mov         eax,dword ptr [eax+14]
 0044C1CE    call        TBrush.GetColor
 0044C1D3    mov         edx,dword ptr [ebp+8]
 0044C1D6    mov         dword ptr [edx-48],eax
 0044C1D9    mov         edx,0FF000014
 0044C1DE    mov         eax,0FF00000F
 0044C1E3    call        AllocPatternBitmap
 0044C1E8    mov         edx,eax
 0044C1EA    mov         eax,dword ptr [ebp+8]
 0044C1ED    mov         eax,dword ptr [eax-28]
 0044C1F0    mov         eax,dword ptr [eax+14]
 0044C1F3    call        TBrush.SetBitmap
 0044C1F8    mov         eax,dword ptr [ebp+8]
 0044C1FB    lea         edx,[eax-10]
 0044C1FE    mov         eax,dword ptr [ebp+8]
 0044C201    mov         eax,dword ptr [eax-28]
 0044C204    call        TCanvas.FillRect
>0044C209    jmp         0044C22F
 0044C20B    mov         eax,dword ptr [ebp+8]
 0044C20E    mov         eax,dword ptr [eax-28]
 0044C211    mov         eax,dword ptr [eax+14]
 0044C214    mov         edx,0FF00000F
 0044C219    call        TBrush.SetColor
 0044C21E    mov         eax,dword ptr [ebp+8]
 0044C221    lea         edx,[eax-10]
 0044C224    mov         eax,dword ptr [ebp+8]
 0044C227    mov         eax,dword ptr [eax-28]
 0044C22A    call        TCanvas.FillRect
 0044C22F    mov         eax,dword ptr [ebp+8]
 0044C232    mov         edx,dword ptr [eax-48]
 0044C235    mov         eax,dword ptr [ebp+8]
 0044C238    mov         eax,dword ptr [eax-28]
 0044C23B    mov         eax,dword ptr [eax+14]
 0044C23E    call        TBrush.SetColor
 0044C243    mov         eax,dword ptr [ebp+8]
 0044C246    inc         dword ptr [eax-10]
 0044C249    mov         eax,dword ptr [ebp+8]
 0044C24C    inc         dword ptr [eax-0C]
 0044C24F    mov         eax,dword ptr [ebp+8]
 0044C252    cmp         byte ptr [eax-41],0
>0044C256    je          0044C3B6
 0044C25C    mov         eax,dword ptr [ebp+8]
 0044C25F    mov         eax,dword ptr [eax-38]
 0044C262    mov         ebx,dword ptr [eax+40]
 0044C265    cmp         ebx,0FFFFFFFF
>0044C268    jle         0044C2B3
 0044C26A    mov         eax,dword ptr [ebp+8]
 0044C26D    mov         eax,dword ptr [ebp+8]
 0044C270    mov         eax,dword ptr [eax-40]
 0044C273    call        TCustomImageList.GetCount
 0044C278    cmp         ebx,eax
>0044C27A    jge         0044C2B3
 0044C27C    mov         eax,dword ptr [ebp+8]
 0044C27F    mov         eax,dword ptr [eax-0C]
 0044C282    push        eax
 0044C283    mov         eax,dword ptr [ebp+8]
 0044C286    mov         eax,dword ptr [eax-38]
 0044C289    mov         eax,dword ptr [eax+40]
 0044C28C    push        eax
 0044C28D    mov         eax,dword ptr [ebp+8]
 0044C290    mov         eax,dword ptr [eax-38]
 0044C293    mov         al,byte ptr [eax+39]
 0044C296    push        eax
 0044C297    mov         eax,dword ptr [ebp+8]
 0044C29A    mov         ecx,dword ptr [eax-10]
 0044C29D    mov         eax,dword ptr [ebp+8]
 0044C2A0    mov         edx,dword ptr [eax-28]
 0044C2A3    mov         eax,dword ptr [ebp+8]
 0044C2A6    mov         eax,dword ptr [eax-40]
 0044C2A9    call        TCustomImageList.Draw
>0044C2AE    jmp         0044C4C0
 0044C2B3    mov         dl,1
 0044C2B5    mov         eax,[00424EB8];TBitmap
 0044C2BA    call        TBitmap.Create
 0044C2BF    mov         edx,dword ptr [ebp+8]
 0044C2C2    mov         dword ptr [edx-4C],eax
 0044C2C5    xor         eax,eax
 0044C2C7    push        ebp
 0044C2C8    push        44C3AF
 0044C2CD    push        dword ptr fs:[eax]
 0044C2D0    mov         dword ptr fs:[eax],esp
 0044C2D3    mov         eax,dword ptr [ebp+8]
 0044C2D6    mov         eax,dword ptr [eax-4C]
 0044C2D9    mov         dl,1
 0044C2DB    mov         ecx,dword ptr [eax]
 0044C2DD    call        dword ptr [ecx+3C]
 0044C2E0    push        7FF8
 0044C2E5    push        0
 0044C2E7    call        user32.LoadBitmapA
 0044C2EC    mov         edx,eax
 0044C2EE    mov         eax,dword ptr [ebp+8]
 0044C2F1    mov         eax,dword ptr [eax-4C]
 0044C2F4    call        TBitmap.SetHandle
 0044C2F9    mov         eax,dword ptr [ebp+8]
 0044C2FC    mov         eax,dword ptr [eax-28]
 0044C2FF    mov         eax,dword ptr [eax+0C]
 0044C302    mov         eax,dword ptr [eax+18]
 0044C305    mov         edx,dword ptr [ebp+8]
 0044C308    mov         dword ptr [edx-48],eax
 0044C30B    mov         eax,dword ptr [ebp+8]
 0044C30E    mov         eax,dword ptr [eax-28]
 0044C311    mov         eax,dword ptr [eax+0C]
 0044C314    mov         edx,0FF000012
 0044C319    call        TFont.SetColor
 0044C31E    mov         eax,dword ptr [ebp+8]
 0044C321    mov         eax,dword ptr [eax-4C]
 0044C324    push        eax
 0044C325    mov         eax,dword ptr [ebp+8]
 0044C328    mov         eax,dword ptr [eax-4C]
 0044C32B    mov         edx,dword ptr [eax]
 0044C32D    call        dword ptr [edx+20]
 0044C330    mov         edx,dword ptr [ebp+8]
 0044C333    mov         edx,dword ptr [edx-4]
 0044C336    mov         ecx,dword ptr [ebp+8]
 0044C339    mov         esi,dword ptr [ecx-0C]
 0044C33C    sub         edx,esi
 0044C33E    sub         edx,eax
 0044C340    sar         edx,1
>0044C342    jns         0044C347
 0044C344    adc         edx,0
 0044C347    mov         eax,dword ptr [ebp+8]
 0044C34A    add         edx,esi
 0044C34C    inc         edx
 0044C34D    push        edx
 0044C34E    mov         eax,dword ptr [ebp+8]
 0044C351    mov         eax,dword ptr [eax-4C]
 0044C354    mov         edx,dword ptr [eax]
 0044C356    call        dword ptr [edx+2C]
 0044C359    mov         edx,dword ptr [ebp+8]
 0044C35C    mov         edx,dword ptr [edx-8]
 0044C35F    mov         ecx,dword ptr [ebp+8]
 0044C362    mov         ebx,dword ptr [ecx-10]
 0044C365    sub         edx,ebx
 0044C367    sub         edx,eax
 0044C369    sar         edx,1
>0044C36B    jns         0044C370
 0044C36D    adc         edx,0
 0044C370    mov         eax,dword ptr [ebp+8]
 0044C373    add         edx,ebx
 0044C375    inc         edx
 0044C376    mov         eax,dword ptr [ebp+8]
 0044C379    mov         eax,dword ptr [eax-28]
 0044C37C    pop         ecx
 0044C37D    call        TCanvas.Draw
 0044C382    mov         eax,dword ptr [ebp+8]
 0044C385    mov         edx,dword ptr [eax-48]
 0044C388    mov         eax,dword ptr [ebp+8]
 0044C38B    mov         eax,dword ptr [eax-28]
 0044C38E    mov         eax,dword ptr [eax+0C]
 0044C391    call        TFont.SetColor
 0044C396    xor         eax,eax
 0044C398    pop         edx
 0044C399    pop         ecx
 0044C39A    pop         ecx
 0044C39B    mov         dword ptr fs:[eax],edx
 0044C39E    push        44C4C0
 0044C3A3    mov         eax,dword ptr [ebp+8]
 0044C3A6    mov         eax,dword ptr [eax-4C]
 0044C3A9    call        TObject.Free
 0044C3AE    ret
>0044C3AF    jmp         @HandleFinally
>0044C3B4    jmp         0044C3A3
 0044C3B6    mov         eax,dword ptr [ebp+8]
 0044C3B9    mov         edx,dword ptr [ebp+8]
 0044C3BC    lea         esi,[eax-10]
 0044C3BF    lea         edi,[edx-5C]
 0044C3C2    movs        dword ptr [edi],dword ptr [esi]
 0044C3C3    movs        dword ptr [edi],dword ptr [esi]
 0044C3C4    movs        dword ptr [edi],dword ptr [esi]
 0044C3C5    movs        dword ptr [edi],dword ptr [esi]
 0044C3C6    mov         eax,dword ptr [ebp+8]
 0044C3C9    mov         eax,dword ptr [eax-38]
 0044C3CC    mov         eax,dword ptr [eax+4C]
 0044C3CF    mov         edx,dword ptr [eax]
 0044C3D1    call        dword ptr [edx+2C]
 0044C3D4    mov         edx,dword ptr [ebp+8]
 0044C3D7    mov         edx,dword ptr [edx-8]
 0044C3DA    mov         ecx,dword ptr [ebp+8]
 0044C3DD    sub         edx,dword ptr [ecx-10]
 0044C3E0    cmp         eax,edx
>0044C3E2    jge         0044C42E
 0044C3E4    mov         eax,dword ptr [ebp+8]
 0044C3E7    mov         eax,dword ptr [eax-38]
 0044C3EA    mov         eax,dword ptr [eax+4C]
 0044C3ED    mov         edx,dword ptr [eax]
 0044C3EF    call        dword ptr [edx+2C]
 0044C3F2    mov         edx,dword ptr [ebp+8]
 0044C3F5    mov         edx,dword ptr [edx-8]
 0044C3F8    mov         ecx,dword ptr [ebp+8]
 0044C3FB    sub         edx,dword ptr [ecx-10]
 0044C3FE    sub         edx,eax
 0044C400    sar         edx,1
>0044C402    jns         0044C407
 0044C404    adc         edx,0
 0044C407    mov         eax,dword ptr [ebp+8]
 0044C40A    add         edx,dword ptr [eax-10]
 0044C40D    inc         edx
 0044C40E    mov         eax,dword ptr [ebp+8]
 0044C411    mov         dword ptr [eax-10],edx
 0044C414    mov         eax,dword ptr [ebp+8]
 0044C417    mov         eax,dword ptr [eax-38]
 0044C41A    mov         eax,dword ptr [eax+4C]
 0044C41D    mov         edx,dword ptr [eax]
 0044C41F    call        dword ptr [edx+2C]
 0044C422    mov         edx,dword ptr [ebp+8]
 0044C425    add         eax,dword ptr [edx-10]
 0044C428    mov         edx,dword ptr [ebp+8]
 0044C42B    mov         dword ptr [edx-8],eax
 0044C42E    mov         eax,dword ptr [ebp+8]
 0044C431    mov         eax,dword ptr [eax-38]
 0044C434    mov         eax,dword ptr [eax+4C]
 0044C437    mov         edx,dword ptr [eax]
 0044C439    call        dword ptr [edx+20]
 0044C43C    mov         edx,dword ptr [ebp+8]
 0044C43F    mov         edx,dword ptr [edx-4]
 0044C442    mov         ecx,dword ptr [ebp+8]
 0044C445    sub         edx,dword ptr [ecx-0C]
 0044C448    cmp         eax,edx
>0044C44A    jge         0044C496
 0044C44C    mov         eax,dword ptr [ebp+8]
 0044C44F    mov         eax,dword ptr [eax-38]
 0044C452    mov         eax,dword ptr [eax+4C]
 0044C455    mov         edx,dword ptr [eax]
 0044C457    call        dword ptr [edx+20]
 0044C45A    mov         edx,dword ptr [ebp+8]
 0044C45D    mov         edx,dword ptr [edx-4]
 0044C460    mov         ecx,dword ptr [ebp+8]
 0044C463    sub         edx,dword ptr [ecx-0C]
 0044C466    sub         edx,eax
 0044C468    sar         edx,1
>0044C46A    jns         0044C46F
 0044C46C    adc         edx,0
 0044C46F    mov         eax,dword ptr [ebp+8]
 0044C472    add         edx,dword ptr [eax-0C]
 0044C475    inc         edx
 0044C476    mov         eax,dword ptr [ebp+8]
 0044C479    mov         dword ptr [eax-0C],edx
 0044C47C    mov         eax,dword ptr [ebp+8]
 0044C47F    mov         eax,dword ptr [eax-38]
 0044C482    mov         eax,dword ptr [eax+4C]
 0044C485    mov         edx,dword ptr [eax]
 0044C487    call        dword ptr [edx+20]
 0044C48A    mov         edx,dword ptr [ebp+8]
 0044C48D    add         eax,dword ptr [edx-0C]
 0044C490    mov         edx,dword ptr [ebp+8]
 0044C493    mov         dword ptr [edx-4],eax
 0044C496    mov         eax,dword ptr [ebp+8]
 0044C499    mov         eax,dword ptr [eax-38]
 0044C49C    mov         ecx,dword ptr [eax+4C]
 0044C49F    mov         eax,dword ptr [ebp+8]
 0044C4A2    lea         edx,[eax-10]
 0044C4A5    mov         eax,dword ptr [ebp+8]
 0044C4A8    mov         eax,dword ptr [eax-28]
 0044C4AB    call        TCanvas.StretchDraw
 0044C4B0    mov         eax,dword ptr [ebp+8]
 0044C4B3    mov         edx,dword ptr [ebp+8]
 0044C4B6    lea         esi,[eax-5C]
 0044C4B9    lea         edi,[edx-10]
 0044C4BC    movs        dword ptr [edi],dword ptr [esi]
 0044C4BD    movs        dword ptr [edi],dword ptr [esi]
 0044C4BE    movs        dword ptr [edi],dword ptr [esi]
 0044C4BF    movs        dword ptr [edi],dword ptr [esi]
 0044C4C0    mov         eax,dword ptr [ebp+8]
 0044C4C3    mov         eax,dword ptr [eax-38]
 0044C4C6    cmp         byte ptr [eax+38],0
>0044C4CA    je          0044C537
 0044C4CC    mov         eax,dword ptr [ebp+8]
 0044C4CF    dec         dword ptr [eax-8]
 0044C4D2    mov         eax,dword ptr [ebp+8]
 0044C4D5    dec         dword ptr [eax-4]
>0044C4D8    jmp         0044C537
 0044C4DA    mov         eax,dword ptr [ebp+8]
 0044C4DD    cmp         dword ptr [eax-40],0
>0044C4E1    je          0044C518
 0044C4E3    mov         eax,dword ptr [ebp+8]
 0044C4E6    cmp         byte ptr [eax+8],0
>0044C4EA    jne         0044C518
 0044C4EC    mov         eax,dword ptr [ebp+8]
 0044C4EF    mov         eax,dword ptr [eax-10]
 0044C4F2    mov         edx,dword ptr [ebp+8]
 0044C4F5    mov         edx,dword ptr [edx-40]
 0044C4F8    add         eax,dword ptr [edx+34]
 0044C4FB    mov         edx,dword ptr [ebp+8]
 0044C4FE    mov         dword ptr [edx-8],eax
 0044C501    mov         eax,dword ptr [ebp+8]
 0044C504    mov         eax,dword ptr [eax-0C]
 0044C507    mov         edx,dword ptr [ebp+8]
 0044C50A    mov         edx,dword ptr [edx-40]
 0044C50D    add         eax,dword ptr [edx+30]
 0044C510    mov         edx,dword ptr [ebp+8]
 0044C513    mov         dword ptr [edx-4],eax
>0044C516    jmp         0044C530
 0044C518    mov         eax,dword ptr [ebp+8]
 0044C51B    mov         eax,dword ptr [eax-10]
 0044C51E    mov         edx,dword ptr [ebp+8]
 0044C521    mov         dword ptr [edx-8],eax
 0044C524    mov         eax,dword ptr [ebp+8]
 0044C527    mov         eax,dword ptr [eax-0C]
 0044C52A    mov         edx,dword ptr [ebp+8]
 0044C52D    mov         dword ptr [edx-4],eax
 0044C530    mov         eax,dword ptr [ebp+8]
 0044C533    mov         byte ptr [eax-39],0
 0044C537    mov         eax,dword ptr [ebp+8]
 0044C53A    dec         dword ptr [eax-10]
 0044C53D    mov         eax,dword ptr [ebp+8]
 0044C540    dec         dword ptr [eax-0C]
 0044C543    mov         eax,dword ptr [ebp+8]
 0044C546    add         dword ptr [eax-8],2
 0044C54A    mov         eax,dword ptr [ebp+8]
 0044C54D    add         dword ptr [eax-4],2
 0044C551    mov         eax,dword ptr [ebp+8]
 0044C554    mov         eax,dword ptr [eax-38]
 0044C557    cmp         byte ptr [eax+38],0
>0044C55B    jne         0044C56F
 0044C55D    mov         eax,dword ptr [ebp+8]
 0044C560    cmp         byte ptr [eax-29],0
>0044C564    je          0044C5A4
 0044C566    mov         eax,dword ptr [ebp+8]
 0044C569    cmp         byte ptr [eax-39],0
>0044C56D    je          0044C5A4
 0044C56F    mov         eax,dword ptr [ebp+8]
 0044C572    cmp         byte ptr [eax-21],0
>0044C576    jne         0044C5A4
 0044C578    push        0F
 0044C57A    mov         eax,dword ptr [ebp+8]
 0044C57D    mov         eax,dword ptr [eax-38]
 0044C580    movzx       eax,byte ptr [eax+38]
 0044C584    mov         eax,dword ptr [eax*4+5ACD8C]
 0044C58B    push        eax
 0044C58C    mov         eax,dword ptr [ebp+8]
 0044C58F    add         eax,0FFFFFFF0
 0044C592    push        eax
 0044C593    mov         eax,dword ptr [ebp+8]
 0044C596    mov         eax,dword ptr [eax-28]
 0044C599    call        TCanvas.GetHandle
 0044C59E    push        eax
 0044C59F    call        user32.DrawEdge
 0044C5A4    mov         eax,dword ptr [ebp+8]
 0044C5A7    cmp         byte ptr [eax-29],0
>0044C5AB    je          0044C5F9
 0044C5AD    mov         eax,dword ptr [ebp+8]
 0044C5B0    cmp         byte ptr [eax-39],0
>0044C5B4    je          0044C5C3
 0044C5B6    mov         eax,dword ptr [ebp+8]
 0044C5B9    mov         eax,dword ptr [eax-8]
 0044C5BC    inc         eax
 0044C5BD    mov         edx,dword ptr [ebp+8]
 0044C5C0    mov         dword ptr [edx-20],eax
 0044C5C3    mov         eax,dword ptr [ebp+8]
 0044C5C6    cmp         byte ptr [eax-5D],0
>0044C5CA    je          0044C5D5
 0044C5CC    mov         eax,dword ptr [ebp+8]
 0044C5CF    cmp         byte ptr [eax+8],0
>0044C5D3    jne         0044C5E8
 0044C5D5    mov         eax,dword ptr [ebp+8]
 0044C5D8    mov         eax,dword ptr [eax-28]
 0044C5DB    mov         eax,dword ptr [eax+14]
 0044C5DE    mov         edx,0FF00000D
 0044C5E3    call        TBrush.SetColor
 0044C5E8    mov         eax,dword ptr [ebp+8]
 0044C5EB    lea         edx,[eax-20]
 0044C5EE    mov         eax,dword ptr [ebp+8]
 0044C5F1    mov         eax,dword ptr [eax-28]
 0044C5F4    call        TCanvas.FillRect
 0044C5F9    mov         eax,dword ptr [ebp+8]
 0044C5FC    cmp         byte ptr [eax+8],0
>0044C600    je          0044C679
 0044C602    mov         eax,dword ptr [ebp+8]
 0044C605    cmp         byte ptr [eax-5D],0
>0044C609    je          0044C679
 0044C60B    mov         eax,dword ptr [ebp+8]
 0044C60E    cmp         byte ptr [eax-21],0
>0044C612    jne         0044C679
 0044C614    mov         eax,dword ptr [ebp+8]
 0044C617    cmp         byte ptr [eax-29],0
>0044C61B    je          0044C63B
 0044C61D    push        0F
 0044C61F    push        2
 0044C621    mov         eax,dword ptr [ebp+8]
 0044C624    add         eax,0FFFFFFE0
 0044C627    push        eax
 0044C628    mov         eax,dword ptr [ebp+8]
 0044C62B    mov         eax,dword ptr [eax-28]
 0044C62E    call        TCanvas.GetHandle
 0044C633    push        eax
 0044C634    call        user32.DrawEdge
>0044C639    jmp         0044C660
 0044C63B    mov         eax,dword ptr [ebp+8]
 0044C63E    test        byte ptr [eax+0C],40
>0044C642    je          0044C660
 0044C644    push        0F
 0044C646    push        4
 0044C648    mov         eax,dword ptr [ebp+8]
 0044C64B    add         eax,0FFFFFFE0
 0044C64E    push        eax
 0044C64F    mov         eax,dword ptr [ebp+8]
 0044C652    mov         eax,dword ptr [eax-28]
 0044C655    call        TCanvas.GetHandle
 0044C65A    push        eax
 0044C65B    call        user32.DrawEdge
 0044C660    mov         eax,dword ptr [ebp+8]
 0044C663    cmp         byte ptr [eax-29],0
>0044C667    jne         0044C679
 0044C669    push        0FF
 0044C66B    push        0
 0044C66D    mov         eax,dword ptr [ebp+8]
 0044C670    add         eax,0FFFFFFE0
 0044C673    push        eax
 0044C674    call        user32.OffsetRect
 0044C679    mov         eax,dword ptr [ebp+8]
 0044C67C    cmp         byte ptr [eax-29],0
>0044C680    je          0044C68B
 0044C682    mov         eax,dword ptr [ebp+8]
 0044C685    cmp         byte ptr [eax-39],0
>0044C689    jne         0044C698
 0044C68B    mov         eax,dword ptr [ebp+8]
 0044C68E    mov         eax,dword ptr [eax-8]
 0044C691    inc         eax
 0044C692    mov         edx,dword ptr [ebp+8]
 0044C695    mov         dword ptr [edx-20],eax
 0044C698    mov         eax,dword ptr [ebp+8]
 0044C69B    add         dword ptr [eax-20],2
 0044C69F    mov         eax,dword ptr [ebp+8]
 0044C6A2    dec         dword ptr [eax-18]
 0044C6A5    mov         eax,dword ptr [ebp+8]
 0044C6A8    movzx       eax,byte ptr [eax-31]
 0044C6AC    mov         ax,word ptr [eax*2+5ACD84]
 0044C6B4    or          ax,60
 0044C6B8    movzx       eax,ax
 0044C6BB    mov         edx,dword ptr [ebp+8]
 0044C6BE    mov         dword ptr [edx-64],eax
 0044C6C1    mov         eax,dword ptr [ebp+8]
 0044C6C4    cmp         byte ptr [eax-65],0
>0044C6C8    je          0044C6DD
 0044C6CA    mov         eax,dword ptr [ebp+8]
 0044C6CD    test        byte ptr [eax+0D],1
>0044C6D1    je          0044C6DD
 0044C6D3    mov         eax,dword ptr [ebp+8]
 0044C6D6    or          dword ptr [eax-64],100000
 0044C6DD    mov         eax,dword ptr [ebp+8]
 0044C6E0    mov         edx,dword ptr [ebp+8]
 0044C6E3    lea         esi,[eax-20]
 0044C6E6    lea         edi,[edx-5C]
 0044C6E9    movs        dword ptr [edi],dword ptr [esi]
 0044C6EA    movs        dword ptr [edi],dword ptr [esi]
 0044C6EB    movs        dword ptr [edi],dword ptr [esi]
 0044C6EC    movs        dword ptr [edi],dword ptr [esi]
 0044C6ED    mov         eax,dword ptr [ebp+8]
 0044C6F0    test        byte ptr [eax+0C],20
>0044C6F4    je          0044C70A
 0044C6F6    mov         eax,dword ptr [ebp+8]
 0044C6F9    mov         eax,dword ptr [eax-28]
 0044C6FC    mov         eax,dword ptr [eax+0C]
 0044C6FF    mov         dl,byte ptr ds:[44C86C]
 0044C705    call        TFont.SetStyle
 0044C70A    mov         eax,dword ptr [ebp+8]
 0044C70D    add         eax,0FFFFFFE0
 0044C710    push        eax
 0044C711    mov         eax,dword ptr [ebp+8]
 0044C714    mov         al,byte ptr [eax-29]
 0044C717    push        eax
 0044C718    mov         eax,dword ptr [ebp+8]
 0044C71B    mov         eax,dword ptr [eax-64]
 0044C71E    or          eax,400
 0044C723    or          eax,100
 0044C728    push        eax
 0044C729    mov         eax,dword ptr [ebp+8]
 0044C72C    mov         eax,dword ptr [eax-38]
 0044C72F    mov         ecx,dword ptr [eax+30]
 0044C732    mov         eax,dword ptr [ebp+8]
 0044C735    mov         edx,dword ptr [eax-28]
 0044C738    mov         eax,dword ptr [ebp+8]
 0044C73B    mov         eax,dword ptr [eax-38]
 0044C73E    call        TMenuItem.DoDrawText
 0044C743    mov         eax,dword ptr [ebp+8]
 0044C746    mov         eax,dword ptr [eax-50]
 0044C749    mov         edx,dword ptr [ebp+8]
 0044C74C    sub         eax,dword ptr [edx-58]
 0044C74F    mov         edx,dword ptr [ebp+8]
 0044C752    mov         edx,dword ptr [edx-14]
 0044C755    mov         ecx,dword ptr [ebp+8]
 0044C758    sub         edx,dword ptr [ecx-1C]
 0044C75B    sub         eax,edx
 0044C75D    sar         eax,1
>0044C75F    jns         0044C764
 0044C761    adc         eax,0
 0044C764    push        eax
 0044C765    push        0
 0044C767    mov         eax,dword ptr [ebp+8]
 0044C76A    add         eax,0FFFFFFE0
 0044C76D    push        eax
 0044C76E    call        user32.OffsetRect
 0044C773    mov         eax,dword ptr [ebp+8]
 0044C776    cmp         byte ptr [eax+8],0
>0044C77A    je          0044C7A7
 0044C77C    mov         eax,dword ptr [ebp+8]
 0044C77F    cmp         byte ptr [eax-29],0
>0044C783    je          0044C7A7
 0044C785    mov         eax,dword ptr [ebp+8]
 0044C788    cmp         byte ptr [eax-5D],0
>0044C78C    je          0044C7A7
 0044C78E    mov         eax,dword ptr [ebp+8]
 0044C791    cmp         byte ptr [eax-21],0
>0044C795    jne         0044C7A7
 0044C797    push        0
 0044C799    push        1
 0044C79B    mov         eax,dword ptr [ebp+8]
 0044C79E    add         eax,0FFFFFFE0
 0044C7A1    push        eax
 0044C7A2    call        user32.OffsetRect
 0044C7A7    mov         eax,dword ptr [ebp+8]
 0044C7AA    add         eax,0FFFFFFE0
 0044C7AD    push        eax
 0044C7AE    mov         eax,dword ptr [ebp+8]
 0044C7B1    mov         al,byte ptr [eax-29]
 0044C7B4    push        eax
 0044C7B5    mov         eax,dword ptr [ebp+8]
 0044C7B8    mov         eax,dword ptr [eax-64]
 0044C7BB    push        eax
 0044C7BC    mov         eax,dword ptr [ebp+8]
 0044C7BF    mov         eax,dword ptr [eax-38]
 0044C7C2    mov         ecx,dword ptr [eax+30]
 0044C7C5    mov         eax,dword ptr [ebp+8]
 0044C7C8    mov         edx,dword ptr [eax-28]
 0044C7CB    mov         eax,dword ptr [ebp+8]
 0044C7CE    mov         eax,dword ptr [eax-38]
 0044C7D1    call        TMenuItem.DoDrawText
 0044C7D6    mov         eax,dword ptr [ebp+8]
 0044C7D9    mov         eax,dword ptr [eax-38]
 0044C7DC    mov         bx,word ptr [eax+60]
 0044C7E0    test        bx,bx
>0044C7E3    je          0044C83A
 0044C7E5    mov         eax,dword ptr [ebp+8]
 0044C7E8    cmp         byte ptr [eax+8],0
>0044C7EC    jne         0044C83A
 0044C7EE    mov         eax,dword ptr [ebp+8]
 0044C7F1    mov         eax,dword ptr [eax-18]
 0044C7F4    mov         edx,dword ptr [ebp+8]
 0044C7F7    mov         dword ptr [edx-20],eax
 0044C7FA    mov         eax,dword ptr [ebp+8]
 0044C7FD    mov         eax,dword ptr [eax-54]
 0044C800    sub         eax,0A
 0044C803    mov         edx,dword ptr [ebp+8]
 0044C806    mov         dword ptr [edx-18],eax
 0044C809    mov         eax,dword ptr [ebp+8]
 0044C80C    add         eax,0FFFFFFE0
 0044C80F    push        eax
 0044C810    mov         eax,dword ptr [ebp+8]
 0044C813    mov         al,byte ptr [eax-29]
 0044C816    push        eax
 0044C817    push        2
 0044C819    lea         edx,[ebp-4]
 0044C81C    mov         eax,dword ptr [ebp+8]
 0044C81F    mov         eax,ebx
 0044C821    call        ShortCutToText
 0044C826    mov         ecx,dword ptr [ebp-4]
 0044C829    mov         eax,dword ptr [ebp+8]
 0044C82C    mov         edx,dword ptr [eax-28]
 0044C82F    mov         eax,dword ptr [ebp+8]
 0044C832    mov         eax,dword ptr [eax-38]
 0044C835    call        TMenuItem.DoDrawText
 0044C83A    xor         eax,eax
 0044C83C    pop         edx
 0044C83D    pop         ecx
 0044C83E    pop         ecx
 0044C83F    mov         dword ptr fs:[eax],edx
 0044C842    push        44C857
 0044C847    lea         eax,[ebp-4]
 0044C84A    call        @LStrClr
 0044C84F    ret
>0044C850    jmp         @HandleFinally
>0044C855    jmp         0044C847
 0044C857    pop         edi
 0044C858    pop         esi
 0044C859    pop         ebx
 0044C85A    pop         ecx
 0044C85B    pop         ebp
 0044C85C    ret
*}
end;

//0044C870
procedure BiDiDraw;
begin
{*
 0044C870    push        ebp
 0044C871    mov         ebp,esp
 0044C873    push        0
 0044C875    push        ebx
 0044C876    push        esi
 0044C877    push        edi
 0044C878    xor         eax,eax
 0044C87A    push        ebp
 0044C87B    push        44D178
 0044C880    push        dword ptr fs:[eax]
 0044C883    mov         dword ptr fs:[eax],esp
 0044C886    mov         eax,dword ptr [ebp+8]
 0044C889    cmp         byte ptr [eax-21],0
>0044C88D    je          0044C8E5
 0044C88F    mov         eax,dword ptr [ebp+8]
 0044C892    test        byte ptr [eax+0C],1
>0044C896    jne         0044C8A1
 0044C898    mov         eax,dword ptr [ebp+8]
 0044C89B    test        byte ptr [eax+0C],40
>0044C89F    je          0044C8C9
 0044C8A1    mov         eax,dword ptr [ebp+8]
 0044C8A4    mov         eax,dword ptr [eax-28]
 0044C8A7    mov         eax,dword ptr [eax+14]
 0044C8AA    mov         edx,0FF00001D
 0044C8AF    call        TBrush.SetColor
 0044C8B4    mov         eax,dword ptr [ebp+8]
 0044C8B7    mov         eax,dword ptr [eax-28]
 0044C8BA    mov         eax,dword ptr [eax+0C]
 0044C8BD    mov         edx,0FF00000E
 0044C8C2    call        TFont.SetColor
>0044C8C7    jmp         0044C8E5
 0044C8C9    mov         eax,dword ptr [ebp+8]
 0044C8CC    cmp         byte ptr [eax+8],0
>0044C8D0    je          0044C8E5
 0044C8D2    mov         eax,dword ptr [ebp+8]
 0044C8D5    mov         eax,dword ptr [eax-28]
 0044C8D8    mov         eax,dword ptr [eax+14]
 0044C8DB    mov         edx,0FF00001E
 0044C8E0    call        TBrush.SetColor
 0044C8E5    mov         eax,dword ptr [ebp+8]
 0044C8E8    cmp         byte ptr [eax-29],0
>0044C8EC    je          0044C903
 0044C8EE    mov         eax,dword ptr [ebp+8]
 0044C8F1    cmp         byte ptr [eax-21],0
>0044C8F5    je          0044C914
 0044C8F7    mov         eax,dword ptr [ebp+8]
 0044C8FA    mov         eax,dword ptr [eax-38]
 0044C8FD    cmp         byte ptr [eax+38],0
>0044C901    jne         0044C914
 0044C903    mov         eax,dword ptr [ebp+8]
 0044C906    lea         edx,[eax-20]
 0044C909    mov         eax,dword ptr [ebp+8]
 0044C90C    mov         eax,dword ptr [eax-28]
 0044C90F    call        TCanvas.FillRect
 0044C914    mov         eax,dword ptr [ebp+8]
 0044C917    cmp         dword ptr [eax-30],0
>0044C91B    je          0044C926
 0044C91D    mov         eax,dword ptr [ebp+8]
 0044C920    mov         byte ptr [eax-31],0
>0044C924    jmp         0044C953
 0044C926    mov         eax,dword ptr [ebp+8]
 0044C929    mov         eax,dword ptr [eax-30]
 0044C92C    mov         edx,dword ptr ds:[44A950];TPopupMenu
 0044C932    call        @IsClass
 0044C937    test        al,al
>0044C939    je          0044C94C
 0044C93B    mov         eax,dword ptr [ebp+8]
 0044C93E    mov         eax,dword ptr [eax-30]
 0044C941    mov         al,byte ptr [eax+60]
 0044C944    mov         edx,dword ptr [ebp+8]
 0044C947    mov         byte ptr [edx-31],al
>0044C94A    jmp         0044C953
 0044C94C    mov         eax,dword ptr [ebp+8]
 0044C94F    mov         byte ptr [eax-31],0
 0044C953    mov         eax,dword ptr [ebp+8]
 0044C956    mov         eax,dword ptr [eax-18]
 0044C959    dec         eax
 0044C95A    mov         edx,dword ptr [ebp+8]
 0044C95D    mov         dword ptr [edx-8],eax
 0044C960    mov         eax,dword ptr [ebp+8]
 0044C963    mov         eax,dword ptr [eax-1C]
 0044C966    inc         eax
 0044C967    mov         edx,dword ptr [ebp+8]
 0044C96A    mov         dword ptr [edx-0C],eax
 0044C96D    mov         eax,dword ptr [ebp+8]
 0044C970    mov         eax,dword ptr [eax-38]
 0044C973    mov         eax,dword ptr [eax+30]
 0044C976    mov         edx,44D190;'-'
 0044C97B    call        @LStrCmp
>0044C980    jne         0044C9B6
 0044C982    mov         eax,dword ptr [ebp+8]
 0044C985    lea         edx,[eax-20]
 0044C988    mov         eax,dword ptr [ebp+8]
 0044C98B    mov         eax,dword ptr [eax-28]
 0044C98E    call        TCanvas.FillRect
 0044C993    mov         eax,dword ptr [ebp+8]
 0044C996    mov         eax,dword ptr [eax-8]
 0044C999    add         eax,2
 0044C99C    mov         edx,dword ptr [ebp+8]
 0044C99F    mov         dword ptr [edx-10],eax
 0044C9A2    mov         eax,dword ptr [ebp+8]
 0044C9A5    xor         edx,edx
 0044C9A7    mov         dword ptr [eax-8],edx
 0044C9AA    mov         eax,dword ptr [ebp+8]
 0044C9AD    mov         byte ptr [eax-39],0
>0044C9B1    jmp         0044CE47
 0044C9B6    mov         eax,dword ptr [ebp+8]
 0044C9B9    cmp         dword ptr [eax-40],0
>0044C9BD    je          0044CA06
 0044C9BF    mov         eax,dword ptr [ebp+8]
 0044C9C2    mov         eax,dword ptr [eax-38]
 0044C9C5    mov         ebx,dword ptr [eax+40]
 0044C9C8    cmp         ebx,0FFFFFFFF
>0044C9CB    jle         0044C9DF
 0044C9CD    mov         eax,dword ptr [ebp+8]
 0044C9D0    mov         eax,dword ptr [ebp+8]
 0044C9D3    mov         eax,dword ptr [eax-40]
 0044C9D6    call        TCustomImageList.GetCount
 0044C9DB    cmp         ebx,eax
>0044C9DD    jl          0044CA0A
 0044C9DF    mov         eax,dword ptr [ebp+8]
 0044C9E2    mov         eax,dword ptr [eax-38]
 0044C9E5    cmp         byte ptr [eax+38],0
>0044C9E9    je          0044CA06
 0044C9EB    mov         eax,dword ptr [ebp+8]
 0044C9EE    mov         eax,dword ptr [eax-38]
 0044C9F1    mov         esi,dword ptr [eax+4C]
 0044C9F4    test        esi,esi
>0044C9F6    je          0044CA0A
 0044C9F8    mov         eax,dword ptr [ebp+8]
 0044C9FB    mov         eax,esi
 0044C9FD    mov         edx,dword ptr [eax]
 0044C9FF    call        dword ptr [edx+1C]
 0044CA02    test        al,al
>0044CA04    jne         0044CA0A
 0044CA06    xor         eax,eax
>0044CA08    jmp         0044CA0C
 0044CA0A    mov         al,1
 0044CA0C    mov         edx,dword ptr [ebp+8]
 0044CA0F    mov         byte ptr [edx-41],al
 0044CA12    mov         eax,dword ptr [ebp+8]
 0044CA15    cmp         byte ptr [eax-41],0
>0044CA19    jne         0044CA3E
 0044CA1B    mov         eax,dword ptr [ebp+8]
 0044CA1E    mov         eax,dword ptr [eax-38]
 0044CA21    mov         ebx,dword ptr [eax+4C]
 0044CA24    test        ebx,ebx
>0044CA26    je          0044CDEA
 0044CA2C    mov         eax,dword ptr [ebp+8]
 0044CA2F    mov         eax,ebx
 0044CA31    mov         edx,dword ptr [eax]
 0044CA33    call        dword ptr [edx+1C]
 0044CA36    test        al,al
>0044CA38    jne         0044CDEA
 0044CA3E    mov         eax,dword ptr [ebp+8]
 0044CA41    mov         byte ptr [eax-39],1
 0044CA45    mov         eax,dword ptr [ebp+8]
 0044CA48    cmp         byte ptr [eax-41],0
>0044CA4C    je          0044CA7A
 0044CA4E    mov         eax,dword ptr [ebp+8]
 0044CA51    mov         eax,dword ptr [eax-8]
 0044CA54    mov         edx,dword ptr [ebp+8]
 0044CA57    mov         edx,dword ptr [edx-40]
 0044CA5A    sub         eax,dword ptr [edx+34]
 0044CA5D    mov         edx,dword ptr [ebp+8]
 0044CA60    mov         dword ptr [edx-10],eax
 0044CA63    mov         eax,dword ptr [ebp+8]
 0044CA66    mov         eax,dword ptr [eax-0C]
 0044CA69    mov         edx,dword ptr [ebp+8]
 0044CA6C    mov         edx,dword ptr [edx-40]
 0044CA6F    add         eax,dword ptr [edx+30]
 0044CA72    mov         edx,dword ptr [ebp+8]
 0044CA75    mov         dword ptr [edx-4],eax
>0044CA78    jmp         0044CA98
 0044CA7A    mov         eax,dword ptr [ebp+8]
 0044CA7D    mov         eax,dword ptr [eax-8]
 0044CA80    sub         eax,10
 0044CA83    mov         edx,dword ptr [ebp+8]
 0044CA86    mov         dword ptr [edx-10],eax
 0044CA89    mov         eax,dword ptr [ebp+8]
 0044CA8C    mov         eax,dword ptr [eax-0C]
 0044CA8F    add         eax,10
 0044CA92    mov         edx,dword ptr [ebp+8]
 0044CA95    mov         dword ptr [edx-4],eax
 0044CA98    mov         eax,dword ptr [ebp+8]
 0044CA9B    mov         eax,dword ptr [eax-38]
 0044CA9E    cmp         byte ptr [eax+38],0
>0044CAA2    je          0044CB5B
 0044CAA8    mov         eax,dword ptr [ebp+8]
 0044CAAB    dec         dword ptr [eax-10]
 0044CAAE    mov         eax,dword ptr [ebp+8]
 0044CAB1    inc         dword ptr [eax-4]
 0044CAB4    mov         eax,dword ptr [ebp+8]
 0044CAB7    mov         eax,dword ptr [eax-28]
 0044CABA    mov         eax,dword ptr [eax+14]
 0044CABD    call        TBrush.GetColor
 0044CAC2    mov         edx,dword ptr [ebp+8]
 0044CAC5    mov         dword ptr [edx-48],eax
 0044CAC8    mov         eax,dword ptr [ebp+8]
 0044CACB    test        byte ptr [eax+0C],1
>0044CACF    jne         0044CB17
 0044CAD1    mov         eax,dword ptr [ebp+8]
 0044CAD4    mov         eax,dword ptr [eax-28]
 0044CAD7    mov         eax,dword ptr [eax+14]
 0044CADA    call        TBrush.GetColor
 0044CADF    mov         edx,dword ptr [ebp+8]
 0044CAE2    mov         dword ptr [edx-48],eax
 0044CAE5    mov         edx,0FF000014
 0044CAEA    mov         eax,0FF00000F
 0044CAEF    call        AllocPatternBitmap
 0044CAF4    mov         edx,eax
 0044CAF6    mov         eax,dword ptr [ebp+8]
 0044CAF9    mov         eax,dword ptr [eax-28]
 0044CAFC    mov         eax,dword ptr [eax+14]
 0044CAFF    call        TBrush.SetBitmap
 0044CB04    mov         eax,dword ptr [ebp+8]
 0044CB07    lea         edx,[eax-10]
 0044CB0A    mov         eax,dword ptr [ebp+8]
 0044CB0D    mov         eax,dword ptr [eax-28]
 0044CB10    call        TCanvas.FillRect
>0044CB15    jmp         0044CB3B
 0044CB17    mov         eax,dword ptr [ebp+8]
 0044CB1A    mov         eax,dword ptr [eax-28]
 0044CB1D    mov         eax,dword ptr [eax+14]
 0044CB20    mov         edx,0FF00000F
 0044CB25    call        TBrush.SetColor
 0044CB2A    mov         eax,dword ptr [ebp+8]
 0044CB2D    lea         edx,[eax-10]
 0044CB30    mov         eax,dword ptr [ebp+8]
 0044CB33    mov         eax,dword ptr [eax-28]
 0044CB36    call        TCanvas.FillRect
 0044CB3B    mov         eax,dword ptr [ebp+8]
 0044CB3E    mov         edx,dword ptr [eax-48]
 0044CB41    mov         eax,dword ptr [ebp+8]
 0044CB44    mov         eax,dword ptr [eax-28]
 0044CB47    mov         eax,dword ptr [eax+14]
 0044CB4A    call        TBrush.SetColor
 0044CB4F    mov         eax,dword ptr [ebp+8]
 0044CB52    dec         dword ptr [eax-8]
 0044CB55    mov         eax,dword ptr [ebp+8]
 0044CB58    inc         dword ptr [eax-0C]
 0044CB5B    mov         eax,dword ptr [ebp+8]
 0044CB5E    cmp         byte ptr [eax-41],0
>0044CB62    je          0044CCC2
 0044CB68    mov         eax,dword ptr [ebp+8]
 0044CB6B    mov         eax,dword ptr [eax-38]
 0044CB6E    mov         ebx,dword ptr [eax+40]
 0044CB71    cmp         ebx,0FFFFFFFF
>0044CB74    jle         0044CBBF
 0044CB76    mov         eax,dword ptr [ebp+8]
 0044CB79    mov         eax,dword ptr [ebp+8]
 0044CB7C    mov         eax,dword ptr [eax-40]
 0044CB7F    call        TCustomImageList.GetCount
 0044CB84    cmp         ebx,eax
>0044CB86    jge         0044CBBF
 0044CB88    mov         eax,dword ptr [ebp+8]
 0044CB8B    mov         eax,dword ptr [eax-0C]
 0044CB8E    push        eax
 0044CB8F    mov         eax,dword ptr [ebp+8]
 0044CB92    mov         eax,dword ptr [eax-38]
 0044CB95    mov         eax,dword ptr [eax+40]
 0044CB98    push        eax
 0044CB99    mov         eax,dword ptr [ebp+8]
 0044CB9C    mov         eax,dword ptr [eax-38]
 0044CB9F    mov         al,byte ptr [eax+39]
 0044CBA2    push        eax
 0044CBA3    mov         eax,dword ptr [ebp+8]
 0044CBA6    mov         ecx,dword ptr [eax-10]
 0044CBA9    mov         eax,dword ptr [ebp+8]
 0044CBAC    mov         edx,dword ptr [eax-28]
 0044CBAF    mov         eax,dword ptr [ebp+8]
 0044CBB2    mov         eax,dword ptr [eax-40]
 0044CBB5    call        TCustomImageList.Draw
>0044CBBA    jmp         0044CDD0
 0044CBBF    mov         dl,1
 0044CBC1    mov         eax,[00424EB8];TBitmap
 0044CBC6    call        TBitmap.Create
 0044CBCB    mov         edx,dword ptr [ebp+8]
 0044CBCE    mov         dword ptr [edx-4C],eax
 0044CBD1    xor         eax,eax
 0044CBD3    push        ebp
 0044CBD4    push        44CCBB
 0044CBD9    push        dword ptr fs:[eax]
 0044CBDC    mov         dword ptr fs:[eax],esp
 0044CBDF    mov         eax,dword ptr [ebp+8]
 0044CBE2    mov         eax,dword ptr [eax-4C]
 0044CBE5    mov         dl,1
 0044CBE7    mov         ecx,dword ptr [eax]
 0044CBE9    call        dword ptr [ecx+3C]
 0044CBEC    push        7FF8
 0044CBF1    push        0
 0044CBF3    call        user32.LoadBitmapA
 0044CBF8    mov         edx,eax
 0044CBFA    mov         eax,dword ptr [ebp+8]
 0044CBFD    mov         eax,dword ptr [eax-4C]
 0044CC00    call        TBitmap.SetHandle
 0044CC05    mov         eax,dword ptr [ebp+8]
 0044CC08    mov         eax,dword ptr [eax-28]
 0044CC0B    mov         eax,dword ptr [eax+0C]
 0044CC0E    mov         eax,dword ptr [eax+18]
 0044CC11    mov         edx,dword ptr [ebp+8]
 0044CC14    mov         dword ptr [edx-48],eax
 0044CC17    mov         eax,dword ptr [ebp+8]
 0044CC1A    mov         eax,dword ptr [eax-28]
 0044CC1D    mov         eax,dword ptr [eax+0C]
 0044CC20    mov         edx,0FF000012
 0044CC25    call        TFont.SetColor
 0044CC2A    mov         eax,dword ptr [ebp+8]
 0044CC2D    mov         eax,dword ptr [eax-4C]
 0044CC30    push        eax
 0044CC31    mov         eax,dword ptr [ebp+8]
 0044CC34    mov         eax,dword ptr [eax-4C]
 0044CC37    mov         edx,dword ptr [eax]
 0044CC39    call        dword ptr [edx+20]
 0044CC3C    mov         edx,dword ptr [ebp+8]
 0044CC3F    mov         edx,dword ptr [edx-4]
 0044CC42    mov         ecx,dword ptr [ebp+8]
 0044CC45    mov         esi,dword ptr [ecx-0C]
 0044CC48    sub         edx,esi
 0044CC4A    sub         edx,eax
 0044CC4C    sar         edx,1
>0044CC4E    jns         0044CC53
 0044CC50    adc         edx,0
 0044CC53    mov         eax,dword ptr [ebp+8]
 0044CC56    add         edx,esi
 0044CC58    inc         edx
 0044CC59    push        edx
 0044CC5A    mov         eax,dword ptr [ebp+8]
 0044CC5D    mov         eax,dword ptr [eax-4C]
 0044CC60    mov         edx,dword ptr [eax]
 0044CC62    call        dword ptr [edx+2C]
 0044CC65    mov         edx,dword ptr [ebp+8]
 0044CC68    mov         edx,dword ptr [edx-8]
 0044CC6B    mov         ecx,dword ptr [ebp+8]
 0044CC6E    mov         ebx,dword ptr [ecx-10]
 0044CC71    sub         edx,ebx
 0044CC73    sub         edx,eax
 0044CC75    sar         edx,1
>0044CC77    jns         0044CC7C
 0044CC79    adc         edx,0
 0044CC7C    mov         eax,dword ptr [ebp+8]
 0044CC7F    add         edx,ebx
 0044CC81    inc         edx
 0044CC82    mov         eax,dword ptr [ebp+8]
 0044CC85    mov         eax,dword ptr [eax-28]
 0044CC88    pop         ecx
 0044CC89    call        TCanvas.Draw
 0044CC8E    mov         eax,dword ptr [ebp+8]
 0044CC91    mov         edx,dword ptr [eax-48]
 0044CC94    mov         eax,dword ptr [ebp+8]
 0044CC97    mov         eax,dword ptr [eax-28]
 0044CC9A    mov         eax,dword ptr [eax+0C]
 0044CC9D    call        TFont.SetColor
 0044CCA2    xor         eax,eax
 0044CCA4    pop         edx
 0044CCA5    pop         ecx
 0044CCA6    pop         ecx
 0044CCA7    mov         dword ptr fs:[eax],edx
 0044CCAA    push        44CDD0
 0044CCAF    mov         eax,dword ptr [ebp+8]
 0044CCB2    mov         eax,dword ptr [eax-4C]
 0044CCB5    call        TObject.Free
 0044CCBA    ret
>0044CCBB    jmp         @HandleFinally
>0044CCC0    jmp         0044CCAF
 0044CCC2    mov         eax,dword ptr [ebp+8]
 0044CCC5    mov         edx,dword ptr [ebp+8]
 0044CCC8    lea         esi,[eax-10]
 0044CCCB    lea         edi,[edx-5C]
 0044CCCE    movs        dword ptr [edi],dword ptr [esi]
 0044CCCF    movs        dword ptr [edi],dword ptr [esi]
 0044CCD0    movs        dword ptr [edi],dword ptr [esi]
 0044CCD1    movs        dword ptr [edi],dword ptr [esi]
 0044CCD2    mov         eax,dword ptr [ebp+8]
 0044CCD5    mov         eax,dword ptr [eax-38]
 0044CCD8    mov         eax,dword ptr [eax+4C]
 0044CCDB    mov         edx,dword ptr [eax]
 0044CCDD    call        dword ptr [edx+2C]
 0044CCE0    mov         edx,dword ptr [ebp+8]
 0044CCE3    mov         edx,dword ptr [edx-8]
 0044CCE6    mov         ecx,dword ptr [ebp+8]
 0044CCE9    sub         edx,dword ptr [ecx-10]
 0044CCEC    cmp         eax,edx
>0044CCEE    jge         0044CD3E
 0044CCF0    mov         eax,dword ptr [ebp+8]
 0044CCF3    mov         eax,dword ptr [eax-38]
 0044CCF6    mov         eax,dword ptr [eax+4C]
 0044CCF9    mov         edx,dword ptr [eax]
 0044CCFB    call        dword ptr [edx+2C]
 0044CCFE    mov         edx,dword ptr [ebp+8]
 0044CD01    mov         edx,dword ptr [edx-8]
 0044CD04    mov         ecx,dword ptr [ebp+8]
 0044CD07    sub         edx,dword ptr [ecx-10]
 0044CD0A    sub         edx,eax
 0044CD0C    sar         edx,1
>0044CD0E    jns         0044CD13
 0044CD10    adc         edx,0
 0044CD13    mov         eax,dword ptr [ebp+8]
 0044CD16    mov         eax,dword ptr [eax-8]
 0044CD19    sub         eax,edx
 0044CD1B    inc         eax
 0044CD1C    mov         edx,dword ptr [ebp+8]
 0044CD1F    mov         dword ptr [edx-8],eax
 0044CD22    mov         eax,dword ptr [ebp+8]
 0044CD25    mov         eax,dword ptr [eax-38]
 0044CD28    mov         eax,dword ptr [eax+4C]
 0044CD2B    mov         edx,dword ptr [eax]
 0044CD2D    call        dword ptr [edx+2C]
 0044CD30    mov         edx,dword ptr [ebp+8]
 0044CD33    mov         edx,dword ptr [edx-8]
 0044CD36    sub         edx,eax
 0044CD38    mov         eax,dword ptr [ebp+8]
 0044CD3B    mov         dword ptr [eax-10],edx
 0044CD3E    mov         eax,dword ptr [ebp+8]
 0044CD41    mov         eax,dword ptr [eax-38]
 0044CD44    mov         eax,dword ptr [eax+4C]
 0044CD47    mov         edx,dword ptr [eax]
 0044CD49    call        dword ptr [edx+20]
 0044CD4C    mov         edx,dword ptr [ebp+8]
 0044CD4F    mov         edx,dword ptr [edx-4]
 0044CD52    mov         ecx,dword ptr [ebp+8]
 0044CD55    sub         edx,dword ptr [ecx-0C]
 0044CD58    cmp         eax,edx
>0044CD5A    jge         0044CDA6
 0044CD5C    mov         eax,dword ptr [ebp+8]
 0044CD5F    mov         eax,dword ptr [eax-38]
 0044CD62    mov         eax,dword ptr [eax+4C]
 0044CD65    mov         edx,dword ptr [eax]
 0044CD67    call        dword ptr [edx+20]
 0044CD6A    mov         edx,dword ptr [ebp+8]
 0044CD6D    mov         edx,dword ptr [edx-4]
 0044CD70    mov         ecx,dword ptr [ebp+8]
 0044CD73    sub         edx,dword ptr [ecx-0C]
 0044CD76    sub         edx,eax
 0044CD78    sar         edx,1
>0044CD7A    jns         0044CD7F
 0044CD7C    adc         edx,0
 0044CD7F    mov         eax,dword ptr [ebp+8]
 0044CD82    add         edx,dword ptr [eax-0C]
 0044CD85    inc         edx
 0044CD86    mov         eax,dword ptr [ebp+8]
 0044CD89    mov         dword ptr [eax-0C],edx
 0044CD8C    mov         eax,dword ptr [ebp+8]
 0044CD8F    mov         eax,dword ptr [eax-38]
 0044CD92    mov         eax,dword ptr [eax+4C]
 0044CD95    mov         edx,dword ptr [eax]
 0044CD97    call        dword ptr [edx+20]
 0044CD9A    mov         edx,dword ptr [ebp+8]
 0044CD9D    add         eax,dword ptr [edx-0C]
 0044CDA0    mov         edx,dword ptr [ebp+8]
 0044CDA3    mov         dword ptr [edx-4],eax
 0044CDA6    mov         eax,dword ptr [ebp+8]
 0044CDA9    mov         eax,dword ptr [eax-38]
 0044CDAC    mov         ecx,dword ptr [eax+4C]
 0044CDAF    mov         eax,dword ptr [ebp+8]
 0044CDB2    lea         edx,[eax-10]
 0044CDB5    mov         eax,dword ptr [ebp+8]
 0044CDB8    mov         eax,dword ptr [eax-28]
 0044CDBB    call        TCanvas.StretchDraw
 0044CDC0    mov         eax,dword ptr [ebp+8]
 0044CDC3    mov         edx,dword ptr [ebp+8]
 0044CDC6    lea         esi,[eax-5C]
 0044CDC9    lea         edi,[edx-10]
 0044CDCC    movs        dword ptr [edi],dword ptr [esi]
 0044CDCD    movs        dword ptr [edi],dword ptr [esi]
 0044CDCE    movs        dword ptr [edi],dword ptr [esi]
 0044CDCF    movs        dword ptr [edi],dword ptr [esi]
 0044CDD0    mov         eax,dword ptr [ebp+8]
 0044CDD3    mov         eax,dword ptr [eax-38]
 0044CDD6    cmp         byte ptr [eax+38],0
>0044CDDA    je          0044CE47
 0044CDDC    mov         eax,dword ptr [ebp+8]
 0044CDDF    dec         dword ptr [eax-8]
 0044CDE2    mov         eax,dword ptr [ebp+8]
 0044CDE5    dec         dword ptr [eax-4]
>0044CDE8    jmp         0044CE47
 0044CDEA    mov         eax,dword ptr [ebp+8]
 0044CDED    cmp         dword ptr [eax-40],0
>0044CDF1    je          0044CE28
 0044CDF3    mov         eax,dword ptr [ebp+8]
 0044CDF6    cmp         byte ptr [eax+8],0
>0044CDFA    jne         0044CE28
 0044CDFC    mov         eax,dword ptr [ebp+8]
 0044CDFF    mov         eax,dword ptr [eax-8]
 0044CE02    mov         edx,dword ptr [ebp+8]
 0044CE05    mov         edx,dword ptr [edx-40]
 0044CE08    sub         eax,dword ptr [edx+34]
 0044CE0B    mov         edx,dword ptr [ebp+8]
 0044CE0E    mov         dword ptr [edx-10],eax
 0044CE11    mov         eax,dword ptr [ebp+8]
 0044CE14    mov         eax,dword ptr [eax-0C]
 0044CE17    mov         edx,dword ptr [ebp+8]
 0044CE1A    mov         edx,dword ptr [edx-40]
 0044CE1D    add         eax,dword ptr [edx+30]
 0044CE20    mov         edx,dword ptr [ebp+8]
 0044CE23    mov         dword ptr [edx-4],eax
>0044CE26    jmp         0044CE40
 0044CE28    mov         eax,dword ptr [ebp+8]
 0044CE2B    mov         eax,dword ptr [eax-8]
 0044CE2E    mov         edx,dword ptr [ebp+8]
 0044CE31    mov         dword ptr [edx-10],eax
 0044CE34    mov         eax,dword ptr [ebp+8]
 0044CE37    mov         eax,dword ptr [eax-0C]
 0044CE3A    mov         edx,dword ptr [ebp+8]
 0044CE3D    mov         dword ptr [edx-4],eax
 0044CE40    mov         eax,dword ptr [ebp+8]
 0044CE43    mov         byte ptr [eax-39],0
 0044CE47    mov         eax,dword ptr [ebp+8]
 0044CE4A    dec         dword ptr [eax-10]
 0044CE4D    mov         eax,dword ptr [ebp+8]
 0044CE50    dec         dword ptr [eax-0C]
 0044CE53    mov         eax,dword ptr [ebp+8]
 0044CE56    add         dword ptr [eax-8],2
 0044CE5A    mov         eax,dword ptr [ebp+8]
 0044CE5D    add         dword ptr [eax-4],2
 0044CE61    mov         eax,dword ptr [ebp+8]
 0044CE64    mov         eax,dword ptr [eax-38]
 0044CE67    cmp         byte ptr [eax+38],0
>0044CE6B    jne         0044CE88
 0044CE6D    mov         eax,dword ptr [ebp+8]
 0044CE70    cmp         byte ptr [eax-29],0
>0044CE74    je          0044CEB4
 0044CE76    mov         eax,dword ptr [ebp+8]
 0044CE79    cmp         byte ptr [eax-39],0
>0044CE7D    je          0044CEB4
 0044CE7F    mov         eax,dword ptr [ebp+8]
 0044CE82    cmp         byte ptr [eax-21],0
>0044CE86    jne         0044CEB4
 0044CE88    push        0F
 0044CE8A    mov         eax,dword ptr [ebp+8]
 0044CE8D    mov         eax,dword ptr [eax-38]
 0044CE90    movzx       eax,byte ptr [eax+38]
 0044CE94    mov         eax,dword ptr [eax*4+5ACD8C]
 0044CE9B    push        eax
 0044CE9C    mov         eax,dword ptr [ebp+8]
 0044CE9F    add         eax,0FFFFFFF0
 0044CEA2    push        eax
 0044CEA3    mov         eax,dword ptr [ebp+8]
 0044CEA6    mov         eax,dword ptr [eax-28]
 0044CEA9    call        TCanvas.GetHandle
 0044CEAE    push        eax
 0044CEAF    call        user32.DrawEdge
 0044CEB4    mov         eax,dword ptr [ebp+8]
 0044CEB7    cmp         byte ptr [eax-29],0
>0044CEBB    je          0044CF09
 0044CEBD    mov         eax,dword ptr [ebp+8]
 0044CEC0    cmp         byte ptr [eax-39],0
>0044CEC4    je          0044CED3
 0044CEC6    mov         eax,dword ptr [ebp+8]
 0044CEC9    mov         eax,dword ptr [eax-10]
 0044CECC    dec         eax
 0044CECD    mov         edx,dword ptr [ebp+8]
 0044CED0    mov         dword ptr [edx-18],eax
 0044CED3    mov         eax,dword ptr [ebp+8]
 0044CED6    cmp         byte ptr [eax-5D],0
>0044CEDA    je          0044CEE5
 0044CEDC    mov         eax,dword ptr [ebp+8]
 0044CEDF    cmp         byte ptr [eax+8],0
>0044CEE3    jne         0044CEF8
 0044CEE5    mov         eax,dword ptr [ebp+8]
 0044CEE8    mov         eax,dword ptr [eax-28]
 0044CEEB    mov         eax,dword ptr [eax+14]
 0044CEEE    mov         edx,0FF00000D
 0044CEF3    call        TBrush.SetColor
 0044CEF8    mov         eax,dword ptr [ebp+8]
 0044CEFB    lea         edx,[eax-20]
 0044CEFE    mov         eax,dword ptr [ebp+8]
 0044CF01    mov         eax,dword ptr [eax-28]
 0044CF04    call        TCanvas.FillRect
 0044CF09    mov         eax,dword ptr [ebp+8]
 0044CF0C    cmp         byte ptr [eax+8],0
>0044CF10    je          0044CF89
 0044CF12    mov         eax,dword ptr [ebp+8]
 0044CF15    cmp         byte ptr [eax-5D],0
>0044CF19    je          0044CF89
 0044CF1B    mov         eax,dword ptr [ebp+8]
 0044CF1E    cmp         byte ptr [eax-21],0
>0044CF22    jne         0044CF89
 0044CF24    mov         eax,dword ptr [ebp+8]
 0044CF27    cmp         byte ptr [eax-29],0
>0044CF2B    je          0044CF4B
 0044CF2D    push        0F
 0044CF2F    push        2
 0044CF31    mov         eax,dword ptr [ebp+8]
 0044CF34    add         eax,0FFFFFFE0
 0044CF37    push        eax
 0044CF38    mov         eax,dword ptr [ebp+8]
 0044CF3B    mov         eax,dword ptr [eax-28]
 0044CF3E    call        TCanvas.GetHandle
 0044CF43    push        eax
 0044CF44    call        user32.DrawEdge
>0044CF49    jmp         0044CF70
 0044CF4B    mov         eax,dword ptr [ebp+8]
 0044CF4E    test        byte ptr [eax+0C],40
>0044CF52    je          0044CF70
 0044CF54    push        0F
 0044CF56    push        4
 0044CF58    mov         eax,dword ptr [ebp+8]
 0044CF5B    add         eax,0FFFFFFE0
 0044CF5E    push        eax
 0044CF5F    mov         eax,dword ptr [ebp+8]
 0044CF62    mov         eax,dword ptr [eax-28]
 0044CF65    call        TCanvas.GetHandle
 0044CF6A    push        eax
 0044CF6B    call        user32.DrawEdge
 0044CF70    mov         eax,dword ptr [ebp+8]
 0044CF73    cmp         byte ptr [eax-29],0
>0044CF77    jne         0044CF89
 0044CF79    push        0FF
 0044CF7B    push        0
 0044CF7D    mov         eax,dword ptr [ebp+8]
 0044CF80    add         eax,0FFFFFFE0
 0044CF83    push        eax
 0044CF84    call        user32.OffsetRect
 0044CF89    mov         eax,dword ptr [ebp+8]
 0044CF8C    cmp         byte ptr [eax-29],0
>0044CF90    je          0044CF9B
 0044CF92    mov         eax,dword ptr [ebp+8]
 0044CF95    cmp         byte ptr [eax-39],0
>0044CF99    jne         0044CFA8
 0044CF9B    mov         eax,dword ptr [ebp+8]
 0044CF9E    mov         eax,dword ptr [eax-10]
 0044CFA1    dec         eax
 0044CFA2    mov         edx,dword ptr [ebp+8]
 0044CFA5    mov         dword ptr [edx-18],eax
 0044CFA8    mov         eax,dword ptr [ebp+8]
 0044CFAB    add         dword ptr [eax-20],2
 0044CFAF    mov         eax,dword ptr [ebp+8]
 0044CFB2    dec         dword ptr [eax-18]
 0044CFB5    mov         eax,dword ptr [ebp+8]
 0044CFB8    movzx       eax,byte ptr [eax-31]
 0044CFBC    mov         ax,word ptr [eax*2+5ACD84]
 0044CFC4    or          ax,60
 0044CFC8    movzx       eax,ax
 0044CFCB    mov         edx,dword ptr [ebp+8]
 0044CFCE    mov         dword ptr [edx-64],eax
 0044CFD1    mov         eax,dword ptr [ebp+8]
 0044CFD4    cmp         byte ptr [eax-65],0
>0044CFD8    je          0044CFED
 0044CFDA    mov         eax,dword ptr [ebp+8]
 0044CFDD    test        byte ptr [eax+0D],1
>0044CFE1    je          0044CFED
 0044CFE3    mov         eax,dword ptr [ebp+8]
 0044CFE6    or          dword ptr [eax-64],100000
 0044CFED    mov         eax,dword ptr [ebp+8]
 0044CFF0    mov         edx,dword ptr [ebp+8]
 0044CFF3    lea         esi,[eax-20]
 0044CFF6    lea         edi,[edx-5C]
 0044CFF9    movs        dword ptr [edi],dword ptr [esi]
 0044CFFA    movs        dword ptr [edi],dword ptr [esi]
 0044CFFB    movs        dword ptr [edi],dword ptr [esi]
 0044CFFC    movs        dword ptr [edi],dword ptr [esi]
 0044CFFD    mov         eax,dword ptr [ebp+8]
 0044D000    test        byte ptr [eax+0C],20
>0044D004    je          0044D01A
 0044D006    mov         eax,dword ptr [ebp+8]
 0044D009    mov         eax,dword ptr [eax-28]
 0044D00C    mov         eax,dword ptr [eax+0C]
 0044D00F    mov         dl,byte ptr ds:[44D194]
 0044D015    call        TFont.SetStyle
 0044D01A    mov         eax,dword ptr [ebp+8]
 0044D01D    add         eax,0FFFFFFE0
 0044D020    push        eax
 0044D021    mov         eax,dword ptr [ebp+8]
 0044D024    mov         al,byte ptr [eax-29]
 0044D027    push        eax
 0044D028    mov         eax,dword ptr [ebp+8]
 0044D02B    mov         eax,dword ptr [eax-64]
 0044D02E    or          eax,400
 0044D033    or          eax,100
 0044D038    push        eax
 0044D039    mov         eax,dword ptr [ebp+8]
 0044D03C    mov         eax,dword ptr [eax-38]
 0044D03F    mov         ecx,dword ptr [eax+30]
 0044D042    mov         eax,dword ptr [ebp+8]
 0044D045    mov         edx,dword ptr [eax-28]
 0044D048    mov         eax,dword ptr [ebp+8]
 0044D04B    mov         eax,dword ptr [eax-38]
 0044D04E    call        TMenuItem.DoDrawText
 0044D053    mov         eax,dword ptr [ebp+8]
 0044D056    mov         eax,dword ptr [eax-5C]
 0044D059    mov         edx,dword ptr [ebp+8]
 0044D05C    mov         dword ptr [edx-20],eax
 0044D05F    mov         eax,dword ptr [ebp+8]
 0044D062    mov         eax,dword ptr [eax-54]
 0044D065    mov         edx,dword ptr [ebp+8]
 0044D068    mov         dword ptr [edx-18],eax
 0044D06B    mov         eax,dword ptr [ebp+8]
 0044D06E    mov         eax,dword ptr [eax-50]
 0044D071    mov         edx,dword ptr [ebp+8]
 0044D074    sub         eax,dword ptr [edx-58]
 0044D077    mov         edx,dword ptr [ebp+8]
 0044D07A    mov         edx,dword ptr [edx-14]
 0044D07D    mov         ecx,dword ptr [ebp+8]
 0044D080    sub         edx,dword ptr [ecx-1C]
 0044D083    sub         eax,edx
 0044D085    sar         eax,1
>0044D087    jns         0044D08C
 0044D089    adc         eax,0
 0044D08C    push        eax
 0044D08D    push        0
 0044D08F    mov         eax,dword ptr [ebp+8]
 0044D092    add         eax,0FFFFFFE0
 0044D095    push        eax
 0044D096    call        user32.OffsetRect
 0044D09B    mov         eax,dword ptr [ebp+8]
 0044D09E    cmp         byte ptr [eax+8],0
>0044D0A2    je          0044D0C6
 0044D0A4    mov         eax,dword ptr [ebp+8]
 0044D0A7    cmp         byte ptr [eax-29],0
>0044D0AB    je          0044D0C6
 0044D0AD    mov         eax,dword ptr [ebp+8]
 0044D0B0    cmp         byte ptr [eax-5D],0
>0044D0B4    je          0044D0C6
 0044D0B6    push        0
 0044D0B8    push        1
 0044D0BA    mov         eax,dword ptr [ebp+8]
 0044D0BD    add         eax,0FFFFFFE0
 0044D0C0    push        eax
 0044D0C1    call        user32.OffsetRect
 0044D0C6    mov         eax,dword ptr [ebp+8]
 0044D0C9    add         eax,0FFFFFFE0
 0044D0CC    push        eax
 0044D0CD    mov         eax,dword ptr [ebp+8]
 0044D0D0    mov         al,byte ptr [eax-29]
 0044D0D3    push        eax
 0044D0D4    mov         eax,dword ptr [ebp+8]
 0044D0D7    mov         eax,dword ptr [eax-64]
 0044D0DA    push        eax
 0044D0DB    mov         eax,dword ptr [ebp+8]
 0044D0DE    mov         eax,dword ptr [eax-38]
 0044D0E1    mov         ecx,dword ptr [eax+30]
 0044D0E4    mov         eax,dword ptr [ebp+8]
 0044D0E7    mov         edx,dword ptr [eax-28]
 0044D0EA    mov         eax,dword ptr [ebp+8]
 0044D0ED    mov         eax,dword ptr [eax-38]
 0044D0F0    call        TMenuItem.DoDrawText
 0044D0F5    mov         eax,dword ptr [ebp+8]
 0044D0F8    mov         eax,dword ptr [eax-38]
 0044D0FB    mov         bx,word ptr [eax+60]
 0044D0FF    test        bx,bx
>0044D102    je          0044D162
 0044D104    mov         eax,dword ptr [ebp+8]
 0044D107    cmp         byte ptr [eax+8],0
>0044D10B    jne         0044D162
 0044D10D    lea         edx,[ebp-4]
 0044D110    mov         eax,dword ptr [ebp+8]
 0044D113    mov         eax,ebx
 0044D115    call        ShortCutToText
 0044D11A    mov         eax,dword ptr [ebp+8]
 0044D11D    mov         dword ptr [eax-20],0A
 0044D124    mov         eax,dword ptr [ebp+8]
 0044D127    mov         eax,dword ptr [eax-28]
 0044D12A    mov         edx,dword ptr [ebp-4]
 0044D12D    call        TCanvas.TextWidth
 0044D132    mov         edx,dword ptr [ebp+8]
 0044D135    add         eax,dword ptr [edx-20]
 0044D138    mov         edx,dword ptr [ebp+8]
 0044D13B    mov         dword ptr [edx-18],eax
 0044D13E    mov         eax,dword ptr [ebp+8]
 0044D141    add         eax,0FFFFFFE0
 0044D144    push        eax
 0044D145    mov         eax,dword ptr [ebp+8]
 0044D148    mov         al,byte ptr [eax-29]
 0044D14B    push        eax
 0044D14C    push        2
 0044D14E    mov         eax,dword ptr [ebp+8]
 0044D151    mov         edx,dword ptr [eax-28]
 0044D154    mov         eax,dword ptr [ebp+8]
 0044D157    mov         eax,dword ptr [eax-38]
 0044D15A    mov         ecx,dword ptr [ebp-4]
 0044D15D    call        TMenuItem.DoDrawText
 0044D162    xor         eax,eax
 0044D164    pop         edx
 0044D165    pop         ecx
 0044D166    pop         ecx
 0044D167    mov         dword ptr fs:[eax],edx
 0044D16A    push        44D17F
 0044D16F    lea         eax,[ebp-4]
 0044D172    call        @LStrClr
 0044D177    ret
>0044D178    jmp         @HandleFinally
>0044D17D    jmp         0044D16F
 0044D17F    pop         edi
 0044D180    pop         esi
 0044D181    pop         ebx
 0044D182    pop         ecx
 0044D183    pop         ebp
 0044D184    ret
*}
end;

//0044D198
procedure TMenuItem.AdvancedDrawItem(ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState; TopLevel:Boolean);
begin
{*
 0044D198    push        ebp
 0044D199    mov         ebp,esp
 0044D19B    add         esp,0FFFFFF98
 0044D19E    push        ebx
 0044D19F    push        esi
 0044D1A0    push        edi
 0044D1A1    mov         esi,ecx
 0044D1A3    lea         edi,[ebp-20]
 0044D1A6    movs        dword ptr [edi],dword ptr [esi]
 0044D1A7    movs        dword ptr [edi],dword ptr [esi]
 0044D1A8    movs        dword ptr [edi],dword ptr [esi]
 0044D1A9    movs        dword ptr [edi],dword ptr [esi]
 0044D1AA    mov         dword ptr [ebp-28],edx
 0044D1AD    mov         dword ptr [ebp-38],eax
 0044D1B0    mov         eax,dword ptr [ebp-38]
 0044D1B3    call        TMenuItem.GetParentMenu
 0044D1B8    mov         dword ptr [ebp-30],eax
 0044D1BB    mov         eax,dword ptr [ebp-38]
 0044D1BE    call        TMenuItem.GetImageList
 0044D1C3    mov         dword ptr [ebp-40],eax
 0044D1C6    test        byte ptr [ebp+0C],1
 0044D1CA    setne       al
 0044D1CD    mov         byte ptr [ebp-29],al
 0044D1D0    mov         eax,[005AE310]
 0044D1D5    cmp         dword ptr [eax],4
>0044D1D8    jg          0044D1F2
 0044D1DA    mov         eax,[005AE310]
 0044D1DF    cmp         dword ptr [eax],4
>0044D1E2    jne         0044D1EE
 0044D1E4    mov         eax,[005AE618]
 0044D1E9    cmp         dword ptr [eax],0
>0044D1EC    jg          0044D1F2
 0044D1EE    xor         eax,eax
>0044D1F0    jmp         0044D1F4
 0044D1F2    mov         al,1
 0044D1F4    mov         byte ptr [ebp-5D],al
 0044D1F7    mov         eax,[005AE310]
 0044D1FC    cmp         dword ptr [eax],4
>0044D1FF    jle         0044D20B
 0044D201    mov         eax,[005AE800]
 0044D206    cmp         dword ptr [eax],2
>0044D209    je          0044D20F
 0044D20B    xor         eax,eax
>0044D20D    jmp         0044D211
 0044D20F    mov         al,1
 0044D211    mov         byte ptr [ebp-65],al
 0044D214    mov         eax,[005AE310]
 0044D219    cmp         dword ptr [eax],5
>0044D21C    jl          0044D228
 0044D21E    mov         eax,[005AE618]
 0044D223    cmp         dword ptr [eax],1
>0044D226    jge         0044D22C
 0044D228    xor         eax,eax
>0044D22A    jmp         0044D22E
 0044D22C    mov         al,1
 0044D22E    mov         byte ptr [ebp-21],al
 0044D231    cmp         dword ptr [ebp-30],0
>0044D235    je          0044D29F
 0044D237    mov         eax,dword ptr [ebp-30]
 0044D23A    cmp         byte ptr [eax+40],0
>0044D23E    jne         0044D246
 0044D240    cmp         dword ptr [ebp-40],0
>0044D244    je          0044D29F
 0044D246    mov         eax,dword ptr [ebp-38]
 0044D249    cmp         word ptr [eax+9A],0
>0044D251    jne         0044D260
 0044D253    mov         eax,dword ptr [ebp-38]
 0044D256    cmp         word ptr [eax+92],0
>0044D25E    je          0044D29F
 0044D260    mov         al,byte ptr [ebp-29]
 0044D263    push        eax
 0044D264    lea         ecx,[ebp-20]
 0044D267    mov         edx,dword ptr [ebp-28]
 0044D26A    mov         eax,dword ptr [ebp-38]
 0044D26D    mov         ebx,dword ptr [eax]
 0044D26F    call        dword ptr [ebx+34]
 0044D272    mov         eax,dword ptr [ebp-38]
 0044D275    cmp         word ptr [eax+9A],0
>0044D27D    je          0044D2C1
 0044D27F    lea         eax,[ebp-20]
 0044D282    push        eax
 0044D283    mov         ax,word ptr [ebp+0C]
 0044D287    push        eax
 0044D288    mov         ebx,dword ptr [ebp-38]
 0044D28B    mov         ecx,dword ptr [ebp-28]
 0044D28E    mov         edx,dword ptr [ebp-38]
 0044D291    mov         eax,dword ptr [ebx+9C]
 0044D297    call        dword ptr [ebx+98]
>0044D29D    jmp         0044D2C1
 0044D29F    cmp         dword ptr [ebp-30],0
>0044D2A3    je          0044D2BA
 0044D2A5    mov         eax,dword ptr [ebp-30]
 0044D2A8    call        TMenu.IsRightToLeft
 0044D2AD    test        al,al
>0044D2AF    jne         0044D2BA
 0044D2B1    push        ebp
 0044D2B2    call        NormalDraw
 0044D2B7    pop         ecx
>0044D2B8    jmp         0044D2C1
 0044D2BA    push        ebp
 0044D2BB    call        BiDiDraw
 0044D2C0    pop         ecx
 0044D2C1    pop         edi
 0044D2C2    pop         esi
 0044D2C3    pop         ebx
 0044D2C4    mov         esp,ebp
 0044D2C6    pop         ebp
 0044D2C7    ret         8
*}
end;

//0044D2CC
function TMenuItem.GetImageList:TCustomImageList;
begin
{*
 0044D2CC    push        ebx
 0044D2CD    xor         ebx,ebx
 0044D2CF    mov         edx,dword ptr [eax+64]
>0044D2D2    jmp         0044D2D7
 0044D2D4    mov         edx,dword ptr [edx+64]
 0044D2D7    test        edx,edx
>0044D2D9    je          0044D2E1
 0044D2DB    cmp         dword ptr [edx+7C],0
>0044D2DF    je          0044D2D4
 0044D2E1    test        edx,edx
>0044D2E3    je          0044D2EA
 0044D2E5    mov         ebx,dword ptr [edx+7C]
>0044D2E8    jmp         0044D2F6
 0044D2EA    call        TMenuItem.GetParentMenu
 0044D2EF    test        eax,eax
>0044D2F1    je          0044D2F6
 0044D2F3    mov         ebx,dword ptr [eax+48]
 0044D2F6    mov         eax,ebx
 0044D2F8    pop         ebx
 0044D2F9    ret
*}
end;

//0044D2FC
procedure GetMenuSize;
begin
{*
 0044D2FC    push        ebp
 0044D2FD    mov         ebp,esp
 0044D2FF    add         esp,0FFFFFEAC
 0044D305    mov         dword ptr [ebp-154],154
 0044D30F    push        0
 0044D311    lea         eax,[ebp-154]
 0044D317    push        eax
 0044D318    push        0
 0044D31A    push        29
 0044D31C    call        user32.SystemParametersInfoA
 0044D321    test        eax,eax
>0044D323    je          0044D341
 0044D325    mov         eax,dword ptr [ebp+8]
 0044D328    mov         eax,dword ptr [eax-4]
 0044D32B    mov         edx,dword ptr [ebp-0BC]
 0044D331    mov         dword ptr [eax],edx
 0044D333    mov         eax,dword ptr [ebp+8]
 0044D336    mov         eax,dword ptr [eax+8]
 0044D339    mov         edx,dword ptr [ebp-0B8]
 0044D33F    mov         dword ptr [eax],edx
 0044D341    mov         esp,ebp
 0044D343    pop         ebp
 0044D344    ret
*}
end;

//0044D348
procedure TMenuItem.MeasureItem(ACanvas:TCanvas; var Width:Integer; var Height:Integer);
begin
{*
 0044D348    push        ebp
 0044D349    mov         ebp,esp
 0044D34B    add         esp,0FFFFFFDC
 0044D34E    push        ebx
 0044D34F    push        esi
 0044D350    push        edi
 0044D351    xor         ebx,ebx
 0044D353    mov         dword ptr [ebp-24],ebx
 0044D356    mov         dword ptr [ebp-10],ebx
 0044D359    mov         dword ptr [ebp-4],ecx
 0044D35C    mov         dword ptr [ebp-8],edx
 0044D35F    mov         edi,eax
 0044D361    xor         eax,eax
 0044D363    push        ebp
 0044D364    push        44D52A
 0044D369    push        dword ptr fs:[eax]
 0044D36C    mov         dword ptr fs:[eax],esp
 0044D36F    mov         eax,edi
 0044D371    mov         si,0FFF2
 0044D375    call        @CallDynaInst
 0044D37A    mov         edx,dword ptr ds:[44A66C];TMainMenu
 0044D380    call        @IsClass
 0044D385    test        al,al
>0044D387    je          0044D394
 0044D389    mov         bl,1
 0044D38B    push        ebp
 0044D38C    call        GetMenuSize
 0044D391    pop         ecx
>0044D392    jmp         0044D396
 0044D394    xor         ebx,ebx
 0044D396    mov         eax,edi
 0044D398    call        TMenuItem.GetParentMenu
 0044D39D    mov         esi,eax
 0044D39F    mov         eax,edi
 0044D3A1    call        TMenuItem.GetImageList
 0044D3A6    mov         dword ptr [ebp-0C],eax
 0044D3A9    mov         eax,dword ptr [edi+30]
 0044D3AC    mov         edx,44D544;'-'
 0044D3B1    call        @LStrCmp
>0044D3B6    jne         0044D3CE
 0044D3B8    mov         eax,dword ptr [ebp+8]
 0044D3BB    mov         dword ptr [eax],5
 0044D3C1    mov         eax,dword ptr [ebp-4]
 0044D3C4    mov         dword ptr [eax],0FFFFFFFE
 0044D3CA    xor         eax,eax
>0044D3CC    jmp         0044D433
 0044D3CE    cmp         dword ptr [ebp-0C],0
>0044D3D2    je          0044D3FC
 0044D3D4    cmp         dword ptr [edi+40],0FFFFFFFF
>0044D3D8    jg          0044D3DE
 0044D3DA    test        bl,bl
>0044D3DC    jne         0044D3FC
 0044D3DE    mov         eax,dword ptr [ebp-0C]
 0044D3E1    mov         eax,dword ptr [eax+34]
 0044D3E4    mov         edx,dword ptr [ebp-4]
 0044D3E7    mov         dword ptr [edx],eax
 0044D3E9    test        bl,bl
>0044D3EB    jne         0044D3F8
 0044D3ED    mov         eax,dword ptr [ebp-0C]
 0044D3F0    mov         eax,dword ptr [eax+30]
 0044D3F3    mov         edx,dword ptr [ebp+8]
 0044D3F6    mov         dword ptr [edx],eax
 0044D3F8    mov         al,1
>0044D3FA    jmp         0044D433
 0044D3FC    cmp         dword ptr [edi+4C],0
>0044D400    je          0044D428
 0044D402    mov         eax,dword ptr [edi+4C]
 0044D405    mov         edx,dword ptr [eax]
 0044D407    call        dword ptr [edx+1C]
 0044D40A    test        al,al
>0044D40C    jne         0044D428
 0044D40E    mov         eax,dword ptr [ebp-4]
 0044D411    mov         dword ptr [eax],10
 0044D417    test        bl,bl
>0044D419    jne         0044D424
 0044D41B    mov         eax,dword ptr [ebp+8]
 0044D41E    mov         dword ptr [eax],10
 0044D424    mov         al,1
>0044D426    jmp         0044D433
 0044D428    mov         eax,dword ptr [ebp-4]
 0044D42B    mov         dword ptr [eax],0FFFFFFF9
 0044D431    xor         eax,eax
 0044D433    test        al,al
>0044D435    je          0044D441
 0044D437    test        bl,bl
>0044D439    jne         0044D441
 0044D43B    mov         eax,dword ptr [ebp-4]
 0044D43E    add         dword ptr [eax],0F
 0044D441    test        bl,bl
>0044D443    jne         0044D44B
 0044D445    mov         eax,dword ptr [ebp+8]
 0044D448    add         dword ptr [eax],3
 0044D44B    lea         eax,[ebp-20]
 0044D44E    xor         ecx,ecx
 0044D450    mov         edx,10
 0044D455    call        @FillChar
 0044D45A    test        esi,esi
>0044D45C    je          0044D462
 0044D45E    xor         ebx,ebx
>0044D460    jmp         0044D47A
 0044D462    mov         eax,esi
 0044D464    mov         edx,dword ptr ds:[44A950];TPopupMenu
 0044D46A    call        @IsClass
 0044D46F    test        al,al
>0044D471    je          0044D478
 0044D473    mov         bl,byte ptr [esi+60]
>0044D476    jmp         0044D47A
 0044D478    xor         ebx,ebx
 0044D47A    mov         si,word ptr [edi+60]
 0044D47E    test        si,si
>0044D481    je          0044D49D
 0044D483    lea         edx,[ebp-24]
 0044D486    mov         eax,esi
 0044D488    call        ShortCutToText
 0044D48D    mov         ecx,dword ptr [ebp-24]
 0044D490    lea         eax,[ebp-10]
 0044D493    mov         edx,dword ptr [edi+30]
 0044D496    call        @LStrCat3
>0044D49B    jmp         0044D4A8
 0044D49D    lea         eax,[ebp-10]
 0044D4A0    mov         edx,dword ptr [edi+30]
 0044D4A3    call        @LStrLAsg
 0044D4A8    xor         eax,eax
 0044D4AA    mov         al,bl
 0044D4AC    mov         ax,word ptr [eax*2+5ACD94]
 0044D4B4    or          ax,40
 0044D4B8    or          ax,20
 0044D4BC    or          ax,100
 0044D4C0    or          ax,400
 0044D4C4    movzx       eax,ax
 0044D4C7    lea         edx,[ebp-20]
 0044D4CA    push        edx
 0044D4CB    push        0
 0044D4CD    push        eax
 0044D4CE    mov         ecx,dword ptr [ebp-10]
 0044D4D1    mov         edx,dword ptr [ebp-8]
 0044D4D4    mov         eax,edi
 0044D4D6    call        TMenuItem.DoDrawText
 0044D4DB    mov         eax,dword ptr [ebp-18]
 0044D4DE    sub         eax,dword ptr [ebp-20]
 0044D4E1    add         eax,7
 0044D4E4    mov         edx,dword ptr [ebp-4]
 0044D4E7    add         dword ptr [edx],eax
 0044D4E9    cmp         word ptr [edi+0A2],0
>0044D4F1    je          0044D50C
 0044D4F3    mov         eax,dword ptr [ebp-4]
 0044D4F6    push        eax
 0044D4F7    mov         eax,dword ptr [ebp+8]
 0044D4FA    push        eax
 0044D4FB    mov         ecx,dword ptr [ebp-8]
 0044D4FE    mov         edx,edi
 0044D500    mov         eax,dword ptr [edi+0A4]
 0044D506    call        dword ptr [edi+0A0]
 0044D50C    xor         eax,eax
 0044D50E    pop         edx
 0044D50F    pop         ecx
 0044D510    pop         ecx
 0044D511    mov         dword ptr fs:[eax],edx
 0044D514    push        44D531
 0044D519    lea         eax,[ebp-24]
 0044D51C    call        @LStrClr
 0044D521    lea         eax,[ebp-10]
 0044D524    call        @LStrClr
 0044D529    ret
>0044D52A    jmp         @HandleFinally
>0044D52F    jmp         0044D519
 0044D531    pop         edi
 0044D532    pop         esi
 0044D533    pop         ebx
 0044D534    mov         esp,ebp
 0044D536    pop         ebp
 0044D537    ret         4
*}
end;

//0044D548
procedure TMenuItem.HasParent;
begin
{*
 0044D548    mov         al,1
 0044D54A    ret
*}
end;

//0044D54C
procedure TMenuItem.SetBreak(Value:TMenuBreak);
begin
{*
 0044D54C    cmp         dl,byte ptr [eax+48]
>0044D54F    je          0044D55B
 0044D551    mov         byte ptr [eax+48],dl
 0044D554    mov         dl,1
 0044D556    mov         ecx,dword ptr [eax]
 0044D558    call        dword ptr [ecx+3C]
 0044D55B    ret
*}
end;

//0044D55C
procedure TMenuItem.SetCaption(const Value:AnsiString);
begin
{*
 0044D55C    push        ebx
 0044D55D    push        esi
 0044D55E    mov         esi,edx
 0044D560    mov         ebx,eax
 0044D562    mov         eax,dword ptr [ebx+30]
 0044D565    mov         edx,esi
 0044D567    call        @LStrCmp
>0044D56C    je          0044D581
 0044D56E    lea         eax,[ebx+30]
 0044D571    mov         edx,esi
 0044D573    call        @LStrAsg
 0044D578    mov         dl,1
 0044D57A    mov         eax,ebx
 0044D57C    mov         ecx,dword ptr [eax]
 0044D57E    call        dword ptr [ecx+3C]
 0044D581    pop         esi
 0044D582    pop         ebx
 0044D583    ret
*}
end;

//0044D584
procedure TMenuItem.TurnSiblingsOff;
begin
{*
 0044D584    push        ebx
 0044D585    push        esi
 0044D586    push        edi
 0044D587    mov         ebx,eax
 0044D589    mov         esi,dword ptr [ebx+64]
 0044D58C    test        esi,esi
>0044D58E    je          0044D5C8
 0044D590    mov         eax,esi
 0044D592    call        TMenuItem.GetCount
 0044D597    dec         eax
 0044D598    test        eax,eax
>0044D59A    jl          0044D5C8
 0044D59C    inc         eax
 0044D59D    mov         esi,eax
 0044D59F    xor         edi,edi
 0044D5A1    mov         edx,edi
 0044D5A3    mov         eax,dword ptr [ebx+64]
 0044D5A6    call        TMenuItem.GetItem
 0044D5AB    cmp         ebx,eax
>0044D5AD    je          0044D5C4
 0044D5AF    cmp         byte ptr [eax+3D],0
>0044D5B3    je          0044D5C4
 0044D5B5    mov         dl,byte ptr [eax+3F]
 0044D5B8    cmp         dl,byte ptr [ebx+3F]
>0044D5BB    jne         0044D5C4
 0044D5BD    xor         edx,edx
 0044D5BF    call        TMenuItem.SetChecked
 0044D5C4    inc         edi
 0044D5C5    dec         esi
>0044D5C6    jne         0044D5A1
 0044D5C8    pop         edi
 0044D5C9    pop         esi
 0044D5CA    pop         ebx
 0044D5CB    ret
*}
end;

//0044D5CC
procedure TMenuItem.SetChecked(Value:Boolean);
begin
{*
 0044D5CC    push        ebx
 0044D5CD    push        esi
 0044D5CE    push        edi
 0044D5CF    mov         ebx,edx
 0044D5D1    mov         esi,eax
 0044D5D3    cmp         bl,byte ptr [esi+38]
>0044D5D6    je          0044D61A
 0044D5D8    mov         byte ptr [esi+38],bl
 0044D5DB    mov         edi,dword ptr [esi+64]
 0044D5DE    test        edi,edi
>0044D5E0    je          0044D609
 0044D5E2    test        byte ptr [esi+1C],2
>0044D5E6    jne         0044D609
 0044D5E8    xor         eax,eax
 0044D5EA    mov         al,bl
 0044D5EC    mov         eax,dword ptr [eax*4+5ACD1C]
 0044D5F3    or          eax,0
 0044D5F6    push        eax
 0044D5F7    movzx       eax,word ptr [esi+50]
 0044D5FB    push        eax
 0044D5FC    mov         eax,edi
 0044D5FE    call        TMenuItem.GetHandle
 0044D603    push        eax
 0044D604    call        user32.CheckMenuItem
 0044D609    test        bl,bl
>0044D60B    je          0044D61A
 0044D60D    cmp         byte ptr [esi+3D],0
>0044D611    je          0044D61A
 0044D613    mov         eax,esi
 0044D615    call        TMenuItem.TurnSiblingsOff
 0044D61A    pop         edi
 0044D61B    pop         esi
 0044D61C    pop         ebx
 0044D61D    ret
*}
end;

//0044D620
procedure TMenuItem.SetEnabled(Value:Boolean);
begin
{*
 0044D620    push        ebx
 0044D621    push        esi
 0044D622    push        edi
 0044D623    mov         ebx,edx
 0044D625    mov         esi,eax
 0044D627    cmp         bl,byte ptr [esi+39]
>0044D62A    je          0044D693
 0044D62C    mov         byte ptr [esi+39],bl
 0044D62F    mov         eax,[005AE800]
 0044D634    cmp         dword ptr [eax],2
>0044D637    jne         0044D644
 0044D639    mov         eax,esi
 0044D63B    call        TMenuItem.GetCount
 0044D640    test        eax,eax
>0044D642    jne         0044D651
 0044D644    mov         edi,dword ptr [esi+64]
 0044D647    test        edi,edi
>0044D649    je          0044D65C
 0044D64B    cmp         dword ptr [edi+6C],0
>0044D64F    je          0044D65C
 0044D651    mov         dl,1
 0044D653    mov         eax,esi
 0044D655    mov         ecx,dword ptr [eax]
 0044D657    call        dword ptr [ecx+3C]
>0044D65A    jmp         0044D693
 0044D65C    mov         edi,dword ptr [esi+64]
 0044D65F    test        edi,edi
>0044D661    je          0044D68A
 0044D663    test        byte ptr [esi+1C],2
>0044D667    jne         0044D68A
 0044D669    xor         eax,eax
 0044D66B    mov         al,bl
 0044D66D    mov         eax,dword ptr [eax*4+5ACD24]
 0044D674    or          eax,0
 0044D677    push        eax
 0044D678    movzx       eax,word ptr [esi+50]
 0044D67C    push        eax
 0044D67D    mov         eax,edi
 0044D67F    call        TMenuItem.GetHandle
 0044D684    push        eax
 0044D685    call        user32.EnableMenuItem
 0044D68A    xor         edx,edx
 0044D68C    mov         eax,esi
 0044D68E    mov         ecx,dword ptr [eax]
 0044D690    call        dword ptr [ecx+3C]
 0044D693    pop         edi
 0044D694    pop         esi
 0044D695    pop         ebx
 0044D696    ret
*}
end;

//0044D698
procedure TMenuItem.SetGroupIndex(Value:Byte);
begin
{*
 0044D698    push        ebx
 0044D699    push        esi
 0044D69A    push        edi
 0044D69B    mov         ebx,edx
 0044D69D    mov         esi,eax
 0044D69F    cmp         bl,byte ptr [esi+3F]
>0044D6A2    je          0044D6D5
 0044D6A4    mov         edi,dword ptr [esi+64]
 0044D6A7    test        edi,edi
>0044D6A9    je          0044D6BF
 0044D6AB    mov         edx,esi
 0044D6AD    mov         eax,edi
 0044D6AF    call        TMenuItem.IndexOf
 0044D6B4    mov         edx,eax
 0044D6B6    mov         ecx,ebx
 0044D6B8    mov         eax,edi
 0044D6BA    call        TMenuItem.VerifyGroupIndex
 0044D6BF    mov         byte ptr [esi+3F],bl
 0044D6C2    cmp         byte ptr [esi+38],0
>0044D6C6    je          0044D6D5
 0044D6C8    cmp         byte ptr [esi+3D],0
>0044D6CC    je          0044D6D5
 0044D6CE    mov         eax,esi
 0044D6D0    call        TMenuItem.TurnSiblingsOff
 0044D6D5    pop         edi
 0044D6D6    pop         esi
 0044D6D7    pop         ebx
 0044D6D8    ret
*}
end;

//0044D6DC
function TMenuItem.GetAction:TBasicAction;
begin
{*
 0044D6DC    mov         edx,dword ptr [eax+44]
 0044D6DF    test        edx,edx
>0044D6E1    je          0044D6E7
 0044D6E3    mov         eax,dword ptr [edx+10]
 0044D6E6    ret
 0044D6E7    xor         eax,eax
 0044D6E9    ret
*}
end;

//0044D6EC
procedure TMenuItem.sub_0044D6EC;
begin
{*
 0044D6EC    mov         eax,[0044A07C];TMenuActionLink
 0044D6F1    ret
*}
end;

//0044D6F4
function TMenuItem.GetCount:Integer;
begin
{*
 0044D6F4    mov         edx,dword ptr [eax+5C]
 0044D6F7    test        edx,edx
>0044D6F9    jne         0044D6FE
 0044D6FB    xor         eax,eax
 0044D6FD    ret
 0044D6FE    mov         eax,dword ptr [edx+8]
 0044D701    ret
*}
end;

//0044D704
function TMenuItem.GetItem(Index:Integer):TMenuItem;
begin
{*
 0044D704    push        ebx
 0044D705    push        esi
 0044D706    mov         esi,edx
 0044D708    mov         ebx,eax
 0044D70A    cmp         dword ptr [ebx+5C],0
>0044D70E    jne         0044D71A
 0044D710    mov         eax,[005AE3AC];^SMenuIndexError:TResStringRec
 0044D715    call        Error
 0044D71A    mov         edx,esi
 0044D71C    mov         eax,dword ptr [ebx+5C]
 0044D71F    call        TList.Get
 0044D724    pop         esi
 0044D725    pop         ebx
 0044D726    ret
*}
end;

//0044D728
procedure TMenuItem.SetShortCut(Value:TShortCut);
begin
{*
 0044D728    cmp         dx,word ptr [eax+60]
>0044D72C    je          0044D739
 0044D72E    mov         word ptr [eax+60],dx
 0044D732    mov         dl,1
 0044D734    mov         ecx,dword ptr [eax]
 0044D736    call        dword ptr [ecx+3C]
 0044D739    ret
*}
end;

//0044D73C
procedure TMenuItem.SetVisible(Value:Boolean);
begin
{*
 0044D73C    cmp         dl,byte ptr [eax+3E]
>0044D73F    je          0044D74B
 0044D741    mov         byte ptr [eax+3E],dl
 0044D744    mov         dl,1
 0044D746    mov         ecx,dword ptr [eax]
 0044D748    call        dword ptr [ecx+3C]
 0044D74B    ret
*}
end;

//0044D74C
procedure TMenuItem.SetImageIndex(Value:TImageIndex);
begin
{*
 0044D74C    cmp         edx,dword ptr [eax+40]
>0044D74F    je          0044D75B
 0044D751    mov         dword ptr [eax+40],edx
 0044D754    mov         dl,1
 0044D756    mov         ecx,dword ptr [eax]
 0044D758    call        dword ptr [ecx+3C]
 0044D75B    ret
*}
end;

//0044D75C
function TMenuItem.GetMenuIndex:Integer;
begin
{*
 0044D75C    or          edx,0FFFFFFFF
 0044D75F    mov         ecx,dword ptr [eax+64]
 0044D762    test        ecx,ecx
>0044D764    je          0044D771
 0044D766    mov         edx,eax
 0044D768    mov         eax,ecx
 0044D76A    call        TMenuItem.IndexOf
 0044D76F    mov         edx,eax
 0044D771    mov         eax,edx
 0044D773    ret
*}
end;

//0044D774
procedure TMenuItem.SetMenuIndex(Value:Integer);
begin
{*
 0044D774    push        ebx
 0044D775    push        esi
 0044D776    push        edi
 0044D777    mov         esi,edx
 0044D779    mov         ebx,eax
 0044D77B    mov         eax,dword ptr [ebx+64]
 0044D77E    test        eax,eax
>0044D780    je          0044D7B6
 0044D782    call        TMenuItem.GetCount
 0044D787    test        esi,esi
>0044D789    jge         0044D78D
 0044D78B    xor         esi,esi
 0044D78D    cmp         eax,esi
>0044D78F    jg          0044D794
 0044D791    mov         esi,eax
 0044D793    dec         esi
 0044D794    mov         eax,ebx
 0044D796    call        TMenuItem.GetMenuIndex
 0044D79B    cmp         esi,eax
>0044D79D    je          0044D7B6
 0044D79F    mov         edi,dword ptr [ebx+64]
 0044D7A2    mov         edx,ebx
 0044D7A4    mov         eax,edi
 0044D7A6    call        TMenuItem.Remove
 0044D7AB    mov         ecx,ebx
 0044D7AD    mov         edx,esi
 0044D7AF    mov         eax,edi
 0044D7B1    call        TMenuItem.Insert
 0044D7B6    pop         edi
 0044D7B7    pop         esi
 0044D7B8    pop         ebx
 0044D7B9    ret
*}
end;

//0044D7BC
procedure TMenuItem.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 0044D7BC    push        ebp
 0044D7BD    mov         ebp,esp
 0044D7BF    push        ecx
 0044D7C0    push        ebx
 0044D7C1    push        esi
 0044D7C2    mov         dword ptr [ebp-4],eax
 0044D7C5    mov         eax,dword ptr [ebp-4]
 0044D7C8    call        TMenuItem.GetCount
 0044D7CD    mov         ebx,eax
 0044D7CF    dec         ebx
 0044D7D0    test        ebx,ebx
>0044D7D2    jl          0044D7ED
 0044D7D4    inc         ebx
 0044D7D5    xor         esi,esi
 0044D7D7    mov         edx,esi
 0044D7D9    mov         eax,dword ptr [ebp-4]
 0044D7DC    call        TMenuItem.GetItem
 0044D7E1    mov         edx,eax
 0044D7E3    mov         eax,dword ptr [ebp+0C]
 0044D7E6    call        dword ptr [ebp+8]
 0044D7E9    inc         esi
 0044D7EA    dec         ebx
>0044D7EB    jne         0044D7D7
 0044D7ED    pop         esi
 0044D7EE    pop         ebx
 0044D7EF    pop         ecx
 0044D7F0    pop         ebp
 0044D7F1    ret         8
*}
end;

//0044D7F4
procedure TMenuItem.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 0044D7F4    push        ebx
 0044D7F5    push        esi
 0044D7F6    mov         esi,ecx
 0044D7F8    mov         ebx,edx
 0044D7FA    mov         eax,ebx
 0044D7FC    mov         edx,dword ptr ds:[44A154];TMenuItem
 0044D802    call        @AsClass
 0044D807    mov         edx,esi
 0044D809    call        TMenuItem.SetMenuIndex
 0044D80E    pop         esi
 0044D80F    pop         ebx
 0044D810    ret
*}
end;

//0044D814
procedure TMenuItem.SetDefault(Value:Boolean);
begin
{*
 0044D814    push        ebx
 0044D815    push        esi
 0044D816    push        edi
 0044D817    push        ebp
 0044D818    mov         ebx,edx
 0044D81A    mov         ebp,eax
 0044D81C    cmp         bl,byte ptr [ebp+3A]
>0044D81F    je          0044D86B
 0044D821    test        bl,bl
>0044D823    je          0044D85F
 0044D825    cmp         dword ptr [ebp+64],0
>0044D829    je          0044D85F
 0044D82B    mov         eax,dword ptr [ebp+64]
 0044D82E    call        TMenuItem.GetCount
 0044D833    mov         edi,eax
 0044D835    dec         edi
 0044D836    test        edi,edi
>0044D838    jl          0044D85F
 0044D83A    inc         edi
 0044D83B    xor         esi,esi
 0044D83D    mov         edx,esi
 0044D83F    mov         eax,dword ptr [ebp+64]
 0044D842    call        TMenuItem.GetItem
 0044D847    cmp         byte ptr [eax+3A],0
>0044D84B    je          0044D85B
 0044D84D    mov         edx,esi
 0044D84F    mov         eax,dword ptr [ebp+64]
 0044D852    call        TMenuItem.GetItem
 0044D857    mov         byte ptr [eax+3A],0
 0044D85B    inc         esi
 0044D85C    dec         edi
>0044D85D    jne         0044D83D
 0044D85F    mov         byte ptr [ebp+3A],bl
 0044D862    mov         dl,1
 0044D864    mov         eax,ebp
 0044D866    mov         ecx,dword ptr [eax]
 0044D868    call        dword ptr [ecx+3C]
 0044D86B    pop         ebp
 0044D86C    pop         edi
 0044D86D    pop         esi
 0044D86E    pop         ebx
 0044D86F    ret
*}
end;

//0044D870
procedure TMenuItem.InitiateAction;
begin
{*
 0044D870    mov         edx,dword ptr [eax+44]
 0044D873    test        edx,edx
>0044D875    je          0044D87E
 0044D877    mov         eax,edx
 0044D879    mov         edx,dword ptr [eax]
 0044D87B    call        dword ptr [edx+1C]
 0044D87E    ret
*}
end;

//0044D880
procedure TMenuItem.Insert(Index:Integer; Item:TMenuItem);
begin
{*
 0044D880    push        ebx
 0044D881    push        esi
 0044D882    push        edi
 0044D883    push        ebp
 0044D884    mov         esi,ecx
 0044D886    mov         edi,edx
 0044D888    mov         ebx,eax
 0044D88A    cmp         dword ptr [esi+64],0
>0044D88E    je          0044D89A
 0044D890    mov         eax,[005AE7F4];^SMenuReinserted:TResStringRec
 0044D895    call        Error
 0044D89A    cmp         dword ptr [ebx+5C],0
>0044D89E    jne         0044D8AF
 0044D8A0    mov         dl,1
 0044D8A2    mov         eax,[00417CEC];TList
 0044D8A7    call        TObject.Create
 0044D8AC    mov         dword ptr [ebx+5C],eax
 0044D8AF    mov         ebp,edi
 0044D8B1    dec         ebp
 0044D8B2    test        ebp,ebp
>0044D8B4    jl          0044D8E4
 0044D8B6    mov         eax,dword ptr [ebx+5C]
 0044D8B9    cmp         ebp,dword ptr [eax+8]
>0044D8BC    jge         0044D8E4
 0044D8BE    mov         edx,ebp
 0044D8C0    mov         eax,dword ptr [ebx+5C]
 0044D8C3    call        TList.Get
 0044D8C8    mov         al,byte ptr [eax+3F]
 0044D8CB    cmp         al,byte ptr [esi+3F]
>0044D8CE    jbe         0044D8E4
 0044D8D0    mov         edx,ebp
 0044D8D2    mov         eax,dword ptr [ebx+5C]
 0044D8D5    call        TList.Get
 0044D8DA    mov         dl,byte ptr [eax+3F]
 0044D8DD    mov         eax,esi
 0044D8DF    call        TMenuItem.SetGroupIndex
 0044D8E4    mov         cl,byte ptr [esi+3F]
 0044D8E7    mov         edx,edi
 0044D8E9    mov         eax,ebx
 0044D8EB    call        TMenuItem.VerifyGroupIndex
 0044D8F0    mov         ecx,esi
 0044D8F2    mov         edx,edi
 0044D8F4    mov         eax,dword ptr [ebx+5C]
 0044D8F7    call        TList.Insert
 0044D8FC    mov         dword ptr [esi+64],ebx
 0044D8FF    mov         dword ptr [esi+84],ebx
 0044D905    mov         dword ptr [esi+80],44DAF8;TMenuItem.SubItemChanged
 0044D90F    cmp         dword ptr [ebx+34],0
>0044D913    je          0044D91C
 0044D915    mov         eax,ebx
 0044D917    call        TMenuItem.RebuildHandle
 0044D91C    mov         eax,ebx
 0044D91E    call        TMenuItem.GetCount
 0044D923    dec         eax
 0044D924    sete        dl
 0044D927    mov         eax,ebx
 0044D929    mov         ecx,dword ptr [eax]
 0044D92B    call        dword ptr [ecx+3C]
 0044D92E    pop         ebp
 0044D92F    pop         edi
 0044D930    pop         esi
 0044D931    pop         ebx
 0044D932    ret
*}
end;

//0044D934
procedure TMenuItem.Delete(Index:Integer);
begin
{*
 0044D934    push        ebx
 0044D935    push        esi
 0044D936    push        edi
 0044D937    mov         esi,edx
 0044D939    mov         ebx,eax
 0044D93B    test        esi,esi
>0044D93D    jl          0044D950
 0044D93F    cmp         dword ptr [ebx+5C],0
>0044D943    je          0044D950
 0044D945    mov         eax,ebx
 0044D947    call        TMenuItem.GetCount
 0044D94C    cmp         esi,eax
>0044D94E    jl          0044D95A
 0044D950    mov         eax,[005AE3AC];^SMenuIndexError:TResStringRec
 0044D955    call        Error
 0044D95A    mov         edx,esi
 0044D95C    mov         eax,dword ptr [ebx+5C]
 0044D95F    call        TList.Get
 0044D964    mov         edi,eax
 0044D966    mov         edx,esi
 0044D968    mov         eax,dword ptr [ebx+5C]
 0044D96B    call        TList.Delete
 0044D970    xor         eax,eax
 0044D972    mov         dword ptr [edi+64],eax
 0044D975    xor         eax,eax
 0044D977    mov         dword ptr [edi+80],eax
 0044D97D    mov         dword ptr [edi+84],eax
 0044D983    cmp         dword ptr [ebx+34],0
>0044D987    je          0044D990
 0044D989    mov         eax,ebx
 0044D98B    call        TMenuItem.RebuildHandle
 0044D990    mov         eax,ebx
 0044D992    call        TMenuItem.GetCount
 0044D997    test        eax,eax
 0044D999    sete        dl
 0044D99C    mov         eax,ebx
 0044D99E    mov         ecx,dword ptr [eax]
 0044D9A0    call        dword ptr [ecx+3C]
 0044D9A3    pop         edi
 0044D9A4    pop         esi
 0044D9A5    pop         ebx
 0044D9A6    ret
*}
end;

//0044D9A8
procedure TMenuItem.Click;
begin
{*
 0044D9A8    push        ebx
 0044D9A9    push        esi
 0044D9AA    mov         ebx,eax
 0044D9AC    cmp         byte ptr [ebx+39],0
>0044D9B0    je          0044DA54
 0044D9B6    cmp         dword ptr [ebx+44],0
>0044D9BA    jne         0044D9C5
 0044D9BC    cmp         byte ptr [ebx+0A8],0
>0044D9C3    jne         0044D9E0
 0044D9C5    mov         esi,dword ptr [ebx+44]
 0044D9C8    test        esi,esi
>0044D9CA    je          0044D9ED
 0044D9CC    mov         eax,esi
 0044D9CE    mov         edx,dword ptr [eax]
 0044D9D0    call        dword ptr [edx+78]
 0044D9D3    test        al,al
>0044D9D5    jne         0044D9ED
 0044D9D7    cmp         byte ptr [ebx+0A8],0
>0044D9DE    je          0044D9ED
 0044D9E0    mov         dl,byte ptr [ebx+38]
 0044D9E3    xor         dl,1
 0044D9E6    mov         eax,ebx
 0044D9E8    call        TMenuItem.SetChecked
 0044D9ED    cmp         word ptr [ebx+8A],0
>0044D9F5    je          0044DA24
 0044D9F7    mov         eax,ebx
 0044D9F9    call        TMenuItem.GetAction
 0044D9FE    test        eax,eax
>0044DA00    je          0044DA24
 0044DA02    mov         eax,ebx
 0044DA04    call        TMenuItem.GetAction
 0044DA09    mov         eax,dword ptr [eax+40]
 0044DA0C    cmp         eax,dword ptr [ebx+88]
>0044DA12    je          0044DA24
 0044DA14    mov         edx,ebx
 0044DA16    mov         eax,dword ptr [ebx+8C]
 0044DA1C    call        dword ptr [ebx+88]
>0044DA22    jmp         0044DA54
 0044DA24    test        byte ptr [ebx+1C],10
>0044DA28    jne         0044DA3C
 0044DA2A    cmp         dword ptr [ebx+44],0
>0044DA2E    je          0044DA3C
 0044DA30    mov         edx,ebx
 0044DA32    mov         eax,dword ptr [ebx+44]
 0044DA35    mov         ecx,dword ptr [eax]
 0044DA37    call        dword ptr [ecx+18]
>0044DA3A    jmp         0044DA54
 0044DA3C    cmp         word ptr [ebx+8A],0
>0044DA44    je          0044DA54
 0044DA46    mov         edx,ebx
 0044DA48    mov         eax,dword ptr [ebx+8C]
 0044DA4E    call        dword ptr [ebx+88]
 0044DA54    pop         esi
 0044DA55    pop         ebx
 0044DA56    ret
*}
end;

//0044DA58
function TMenuItem.IndexOf(Item:TMenuItem):Integer;
begin
{*
 0044DA58    push        esi
 0044DA59    or          ecx,0FFFFFFFF
 0044DA5C    mov         esi,dword ptr [eax+5C]
 0044DA5F    test        esi,esi
>0044DA61    je          0044DA6C
 0044DA63    mov         eax,esi
 0044DA65    call        TList.IndexOf
 0044DA6A    mov         ecx,eax
 0044DA6C    mov         eax,ecx
 0044DA6E    pop         esi
 0044DA6F    ret
*}
end;

//0044DA70
procedure TMenuItem.Add(Item:TMenuItem);
begin
{*
 0044DA70    push        ebx
 0044DA71    push        esi
 0044DA72    mov         esi,edx
 0044DA74    mov         ebx,eax
 0044DA76    mov         eax,ebx
 0044DA78    call        TMenuItem.GetCount
 0044DA7D    mov         edx,eax
 0044DA7F    mov         ecx,esi
 0044DA81    mov         eax,ebx
 0044DA83    call        TMenuItem.Insert
 0044DA88    pop         esi
 0044DA89    pop         ebx
 0044DA8A    ret
*}
end;

//0044DA8C
procedure TMenuItem.Remove(Item:TMenuItem);
begin
{*
 0044DA8C    push        ebx
 0044DA8D    push        esi
 0044DA8E    mov         ebx,eax
 0044DA90    mov         eax,ebx
 0044DA92    call        TMenuItem.IndexOf
 0044DA97    mov         esi,eax
 0044DA99    cmp         esi,0FFFFFFFF
>0044DA9C    jne         0044DAA8
 0044DA9E    mov         eax,[005AE6E0];^SMenuNotFound:TResStringRec
 0044DAA3    call        Error
 0044DAA8    mov         edx,esi
 0044DAAA    mov         eax,ebx
 0044DAAC    call        TMenuItem.Delete
 0044DAB1    pop         esi
 0044DAB2    pop         ebx
 0044DAB3    ret
*}
end;

//0044DAB4
procedure TMenuItem.MenuChanged(Rebuild:Boolean);
begin
{*
 0044DAB4    push        ebx
 0044DAB5    push        esi
 0044DAB6    mov         ebx,edx
 0044DAB8    mov         esi,eax
 0044DABA    cmp         dword ptr [esi+64],0
>0044DABE    jne         0044DAD6
 0044DAC0    mov         eax,dword ptr [esi+4]
 0044DAC3    mov         edx,dword ptr ds:[44A578];TMenu
 0044DAC9    call        @IsClass
 0044DACE    test        al,al
>0044DAD0    je          0044DAD6
 0044DAD2    xor         eax,eax
>0044DAD4    jmp         0044DAD8
 0044DAD6    mov         eax,esi
 0044DAD8    cmp         word ptr [esi+82],0
>0044DAE0    je          0044DAF3
 0044DAE2    push        ebx
 0044DAE3    mov         ecx,eax
 0044DAE5    mov         edx,esi
 0044DAE7    mov         eax,dword ptr [esi+84]
 0044DAED    call        dword ptr [esi+80]
 0044DAF3    pop         esi
 0044DAF4    pop         ebx
 0044DAF5    ret
*}
end;

//0044DAF8
procedure TMenuItem.SubItemChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 0044DAF8    push        ebp
 0044DAF9    mov         ebp,esp
 0044DAFB    push        ebx
 0044DAFC    push        esi
 0044DAFD    mov         esi,ecx
 0044DAFF    mov         ebx,eax
 0044DB01    cmp         byte ptr [ebp+8],0
>0044DB05    je          0044DB1A
 0044DB07    cmp         dword ptr [ebx+34],0
>0044DB0B    jne         0044DB13
 0044DB0D    cmp         dword ptr [ebx+6C],0
>0044DB11    je          0044DB1A
 0044DB13    mov         eax,ebx
 0044DB15    call        TMenuItem.RebuildHandle
 0044DB1A    mov         eax,dword ptr [ebx+64]
 0044DB1D    test        eax,eax
>0044DB1F    je          0044DB2E
 0044DB21    push        0
 0044DB23    mov         ecx,esi
 0044DB25    mov         edx,ebx
 0044DB27    call        TMenuItem.SubItemChanged
>0044DB2C    jmp         0044DB49
 0044DB2E    mov         esi,dword ptr [ebx+4]
 0044DB31    mov         eax,esi
 0044DB33    mov         edx,dword ptr ds:[44A66C];TMainMenu
 0044DB39    call        @IsClass
 0044DB3E    test        al,al
>0044DB40    je          0044DB49
 0044DB42    mov         eax,esi
 0044DB44    call        TMainMenu.ItemChanged
 0044DB49    pop         esi
 0044DB4A    pop         ebx
 0044DB4B    pop         ebp
 0044DB4C    ret         4
*}
end;

//0044DB50
function TMenuItem.GetBitmap:TBitmap;
begin
{*
 0044DB50    push        ebx
 0044DB51    mov         ebx,eax
 0044DB53    cmp         dword ptr [ebx+4C],0
>0044DB57    jne         0044DB68
 0044DB59    mov         dl,1
 0044DB5B    mov         eax,[00424EB8];TBitmap
 0044DB60    call        TBitmap.Create
 0044DB65    mov         dword ptr [ebx+4C],eax
 0044DB68    mov         dl,1
 0044DB6A    mov         eax,dword ptr [ebx+4C]
 0044DB6D    mov         ecx,dword ptr [eax]
 0044DB6F    call        dword ptr [ecx+3C]
 0044DB72    mov         eax,dword ptr [ebx+4C]
 0044DB75    pop         ebx
 0044DB76    ret
*}
end;

//0044DB78
procedure TMenuItem.SetAction(Value:TBasicAction);
begin
{*
 0044DB78    push        ebx
 0044DB79    push        esi
 0044DB7A    push        edi
 0044DB7B    mov         edi,edx
 0044DB7D    mov         ebx,eax
 0044DB7F    test        edi,edi
>0044DB81    jne         0044DB92
 0044DB83    mov         eax,dword ptr [ebx+44]
 0044DB86    call        TObject.Free
 0044DB8B    xor         eax,eax
 0044DB8D    mov         dword ptr [ebx+44],eax
>0044DB90    jmp         0044DBE1
 0044DB92    cmp         dword ptr [ebx+44],0
>0044DB96    jne         0044DBAD
 0044DB98    mov         eax,ebx
 0044DB9A    mov         si,0FFEE
 0044DB9E    call        @CallDynaInst
 0044DBA3    mov         ecx,ebx
 0044DBA5    mov         dl,1
 0044DBA7    call        dword ptr [eax+14]
 0044DBAA    mov         dword ptr [ebx+44],eax
 0044DBAD    mov         edx,edi
 0044DBAF    mov         eax,dword ptr [ebx+44]
 0044DBB2    mov         ecx,dword ptr [eax]
 0044DBB4    call        dword ptr [ecx+0C]
 0044DBB7    mov         eax,dword ptr [ebx+44]
 0044DBBA    mov         dword ptr [eax+0C],ebx
 0044DBBD    mov         dword ptr [eax+8],44DE0C;TMenuItem.DoActionChange
 0044DBC4    test        byte ptr [edi+1C],1
 0044DBC8    setne       cl
 0044DBCB    mov         edx,edi
 0044DBCD    mov         eax,ebx
 0044DBCF    mov         si,0FFEF
 0044DBD3    call        @CallDynaInst
 0044DBD8    mov         edx,ebx
 0044DBDA    mov         eax,edi
 0044DBDC    call        TComponent.FreeNotification
 0044DBE1    pop         edi
 0044DBE2    pop         esi
 0044DBE3    pop         ebx
 0044DBE4    ret
*}
end;

//0044DBE8
procedure TMenuItem.SetBitmap(Value:TBitmap);
begin
{*
 0044DBE8    push        ebx
 0044DBE9    push        esi
 0044DBEA    mov         ebx,edx
 0044DBEC    mov         esi,eax
 0044DBEE    cmp         dword ptr [esi+4C],0
>0044DBF2    jne         0044DC03
 0044DBF4    mov         dl,1
 0044DBF6    mov         eax,[00424EB8];TBitmap
 0044DBFB    call        TBitmap.Create
 0044DC00    mov         dword ptr [esi+4C],eax
 0044DC03    mov         edx,ebx
 0044DC05    mov         eax,dword ptr [esi+4C]
 0044DC08    mov         ecx,dword ptr [eax]
 0044DC0A    call        dword ptr [ecx+8]
 0044DC0D    mov         dl,1
 0044DC0F    mov         eax,esi
 0044DC11    mov         ecx,dword ptr [eax]
 0044DC13    call        dword ptr [ecx+3C]
 0044DC16    pop         esi
 0044DC17    pop         ebx
 0044DC18    ret
*}
end;

//0044DC1C
procedure TMenuItem.InitiateActions;
begin
{*
 0044DC1C    push        ebx
 0044DC1D    push        esi
 0044DC1E    push        edi
 0044DC1F    mov         edi,eax
 0044DC21    mov         eax,edi
 0044DC23    call        TMenuItem.GetCount
 0044DC28    mov         ebx,eax
 0044DC2A    dec         ebx
 0044DC2B    test        ebx,ebx
>0044DC2D    jl          0044DC44
 0044DC2F    inc         ebx
 0044DC30    xor         esi,esi
 0044DC32    mov         edx,esi
 0044DC34    mov         eax,edi
 0044DC36    call        TMenuItem.GetItem
 0044DC3B    mov         edx,dword ptr [eax]
 0044DC3D    call        dword ptr [edx+40]
 0044DC40    inc         esi
 0044DC41    dec         ebx
>0044DC42    jne         0044DC32
 0044DC44    pop         edi
 0044DC45    pop         esi
 0044DC46    pop         ebx
 0044DC47    ret
*}
end;

//0044DC48
procedure TMenuItem.GetParentComponent;
begin
{*
 0044DC48    mov         edx,dword ptr [eax+64]
 0044DC4B    test        edx,edx
>0044DC4D    je          0044DC59
 0044DC4F    cmp         dword ptr [edx+70],0
>0044DC53    je          0044DC59
 0044DC55    mov         eax,dword ptr [edx+70]
 0044DC58    ret
 0044DC59    mov         eax,edx
 0044DC5B    ret
*}
end;

//0044DC5C
procedure TMenuItem.SetParentComponent(Value:TComponent);
begin
{*
 0044DC5C    push        ebx
 0044DC5D    push        esi
 0044DC5E    mov         esi,edx
 0044DC60    mov         ebx,eax
 0044DC62    mov         eax,dword ptr [ebx+64]
 0044DC65    test        eax,eax
>0044DC67    je          0044DC70
 0044DC69    mov         edx,ebx
 0044DC6B    call        TMenuItem.Remove
 0044DC70    test        esi,esi
>0044DC72    je          0044DCAB
 0044DC74    mov         eax,esi
 0044DC76    mov         edx,dword ptr ds:[44A578];TMenu
 0044DC7C    call        @IsClass
 0044DC81    test        al,al
>0044DC83    je          0044DC91
 0044DC85    mov         eax,dword ptr [esi+34]
 0044DC88    mov         edx,ebx
 0044DC8A    call        TMenuItem.Add
>0044DC8F    jmp         0044DCAB
 0044DC91    mov         eax,esi
 0044DC93    mov         edx,dword ptr ds:[44A154];TMenuItem
 0044DC99    call        @IsClass
 0044DC9E    test        al,al
>0044DCA0    je          0044DCAB
 0044DCA2    mov         edx,ebx
 0044DCA4    mov         eax,esi
 0044DCA6    call        TMenuItem.Add
 0044DCAB    pop         esi
 0044DCAC    pop         ebx
 0044DCAD    ret
*}
end;

//0044DCB0
function TMenuItem.GetParentMenu:TMenu;
begin
{*
>0044DCB0    jmp         0044DCB4
 0044DCB2    mov         eax,edx
 0044DCB4    mov         edx,dword ptr [eax+64]
 0044DCB7    test        edx,edx
>0044DCB9    jne         0044DCB2
 0044DCBB    mov         eax,dword ptr [eax+70]
 0044DCBE    ret
*}
end;

//0044DCC0
procedure TMenuItem.SetRadioItem(Value:Boolean);
begin
{*
 0044DCC0    push        ebx
 0044DCC1    mov         ebx,eax
 0044DCC3    cmp         dl,byte ptr [ebx+3D]
>0044DCC6    je          0044DCE7
 0044DCC8    mov         byte ptr [ebx+3D],dl
 0044DCCB    cmp         byte ptr [ebx+38],0
>0044DCCF    je          0044DCDE
 0044DCD1    cmp         byte ptr [ebx+3D],0
>0044DCD5    je          0044DCDE
 0044DCD7    mov         eax,ebx
 0044DCD9    call        TMenuItem.TurnSiblingsOff
 0044DCDE    mov         dl,1
 0044DCE0    mov         eax,ebx
 0044DCE2    mov         ecx,dword ptr [eax]
 0044DCE4    call        dword ptr [ecx+3C]
 0044DCE7    pop         ebx
 0044DCE8    ret
*}
end;

//0044DCEC
procedure TMenuItem.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 0044DCEC    push        ebx
 0044DCED    push        esi
 0044DCEE    push        edi
 0044DCEF    mov         ebx,ecx
 0044DCF1    mov         edi,edx
 0044DCF3    mov         esi,eax
 0044DCF5    mov         eax,edi
 0044DCF7    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044DCFD    call        @IsClass
 0044DD02    test        al,al
>0044DD04    je          0044DE05
 0044DD0A    test        bl,bl
>0044DD0C    je          0044DD17
 0044DD0E    cmp         byte ptr [esi+0A8],0
>0044DD15    jne         0044DD23
 0044DD17    mov         al,byte ptr [edi+95]
 0044DD1D    mov         byte ptr [esi+0A8],al
 0044DD23    test        bl,bl
>0044DD25    je          0044DD2D
 0044DD27    cmp         dword ptr [esi+30],0
>0044DD2B    jne         0044DD37
 0044DD2D    mov         edx,dword ptr [edi+64]
 0044DD30    mov         eax,esi
 0044DD32    call        TMenuItem.SetCaption
 0044DD37    test        bl,bl
>0044DD39    je          0044DD41
 0044DD3B    cmp         byte ptr [esi+38],0
>0044DD3F    jne         0044DD4B
 0044DD41    mov         dl,byte ptr [edi+69]
 0044DD44    mov         eax,esi
 0044DD46    call        TMenuItem.SetChecked
 0044DD4B    test        bl,bl
>0044DD4D    je          0044DD55
 0044DD4F    cmp         byte ptr [esi+39],1
>0044DD53    jne         0044DD5F
 0044DD55    mov         dl,byte ptr [edi+6A]
 0044DD58    mov         eax,esi
 0044DD5A    call        TMenuItem.SetEnabled
 0044DD5F    test        bl,bl
>0044DD61    je          0044DD69
 0044DD63    cmp         dword ptr [esi+54],0
>0044DD67    jne         0044DD6F
 0044DD69    mov         eax,dword ptr [edi+74]
 0044DD6C    mov         dword ptr [esi+54],eax
 0044DD6F    test        bl,bl
>0044DD71    je          0044DD79
 0044DD73    cmp         dword ptr [esi+58],0
>0044DD77    jne         0044DD84
 0044DD79    lea         eax,[esi+58]
 0044DD7C    mov         edx,dword ptr [edi+7C]
 0044DD7F    call        @LStrAsg
 0044DD84    cmp         byte ptr [esi+3D],0
>0044DD88    je          0044DD9E
 0044DD8A    test        bl,bl
>0044DD8C    je          0044DD94
 0044DD8E    cmp         byte ptr [esi+3F],0
>0044DD92    jne         0044DD9E
 0044DD94    mov         dl,byte ptr [edi+6C]
 0044DD97    mov         eax,esi
 0044DD99    call        TMenuItem.SetGroupIndex
 0044DD9E    test        bl,bl
>0044DDA0    je          0044DDA8
 0044DDA2    cmp         dword ptr [esi+40],0FFFFFFFF
>0044DDA6    jne         0044DDB5
 0044DDA8    mov         edx,dword ptr [edi+80]
 0044DDAE    mov         eax,esi
 0044DDB0    call        TMenuItem.SetImageIndex
 0044DDB5    test        bl,bl
>0044DDB7    je          0044DDC0
 0044DDB9    cmp         word ptr [esi+60],0
>0044DDBE    jne         0044DDCE
 0044DDC0    mov         dx,word ptr [edi+84]
 0044DDC7    mov         eax,esi
 0044DDC9    call        TMenuItem.SetShortCut
 0044DDCE    test        bl,bl
>0044DDD0    je          0044DDD8
 0044DDD2    cmp         byte ptr [esi+3E],1
>0044DDD6    jne         0044DDE5
 0044DDD8    mov         dl,byte ptr [edi+86]
 0044DDDE    mov         eax,esi
 0044DDE0    call        TMenuItem.SetVisible
 0044DDE5    test        bl,bl
>0044DDE7    je          0044DDF3
 0044DDE9    cmp         word ptr [esi+8A],0
>0044DDF1    jne         0044DE05
 0044DDF3    mov         eax,dword ptr [edi+40]
 0044DDF6    mov         dword ptr [esi+88],eax
 0044DDFC    mov         eax,dword ptr [edi+44]
 0044DDFF    mov         dword ptr [esi+8C],eax
 0044DE05    pop         edi
 0044DE06    pop         esi
 0044DE07    pop         ebx
 0044DE08    ret
*}
end;

//0044DE0C
procedure TMenuItem.DoActionChange(Sender:TObject);
begin
{*
 0044DE0C    push        esi
 0044DE0D    push        edi
 0044DE0E    mov         edi,edx
 0044DE10    mov         esi,eax
 0044DE12    mov         eax,esi
 0044DE14    call        TMenuItem.GetAction
 0044DE19    cmp         edi,eax
>0044DE1B    jne         0044DE2C
 0044DE1D    xor         ecx,ecx
 0044DE1F    mov         edx,edi
 0044DE21    mov         eax,esi
 0044DE23    mov         si,0FFEF
 0044DE27    call        @CallDynaInst
 0044DE2C    pop         edi
 0044DE2D    pop         esi
 0044DE2E    ret
*}
end;

//0044DE30
function TMenuItem.IsCaptionStored(Value:String):Boolean;
begin
{*
 0044DE30    push        ebx
 0044DE31    push        esi
 0044DE32    mov         ebx,eax
 0044DE34    mov         esi,dword ptr [ebx+44]
 0044DE37    test        esi,esi
>0044DE39    je          0044DE4B
 0044DE3B    mov         eax,esi
 0044DE3D    mov         edx,dword ptr [eax]
 0044DE3F    call        dword ptr [edx+20]
 0044DE42    test        al,al
>0044DE44    je          0044DE4B
 0044DE46    xor         eax,eax
 0044DE48    pop         esi
 0044DE49    pop         ebx
 0044DE4A    ret
 0044DE4B    mov         al,1
 0044DE4D    pop         esi
 0044DE4E    pop         ebx
 0044DE4F    ret
*}
end;

//0044DE50
function TMenuItem.IsCheckedStored(Value:Boolean):Boolean;
begin
{*
 0044DE50    push        ebx
 0044DE51    push        esi
 0044DE52    mov         ebx,eax
 0044DE54    mov         esi,dword ptr [ebx+44]
 0044DE57    test        esi,esi
>0044DE59    je          0044DE6B
 0044DE5B    mov         eax,esi
 0044DE5D    mov         edx,dword ptr [eax]
 0044DE5F    call        dword ptr [edx+24]
 0044DE62    test        al,al
>0044DE64    je          0044DE6B
 0044DE66    xor         eax,eax
 0044DE68    pop         esi
 0044DE69    pop         ebx
 0044DE6A    ret
 0044DE6B    mov         al,1
 0044DE6D    pop         esi
 0044DE6E    pop         ebx
 0044DE6F    ret
*}
end;

//0044DE70
function TMenuItem.IsEnabledStored(Value:Boolean):Boolean;
begin
{*
 0044DE70    push        ebx
 0044DE71    push        esi
 0044DE72    mov         ebx,eax
 0044DE74    mov         esi,dword ptr [ebx+44]
 0044DE77    test        esi,esi
>0044DE79    je          0044DE8B
 0044DE7B    mov         eax,esi
 0044DE7D    mov         edx,dword ptr [eax]
 0044DE7F    call        dword ptr [edx+28]
 0044DE82    test        al,al
>0044DE84    je          0044DE8B
 0044DE86    xor         eax,eax
 0044DE88    pop         esi
 0044DE89    pop         ebx
 0044DE8A    ret
 0044DE8B    mov         al,1
 0044DE8D    pop         esi
 0044DE8E    pop         ebx
 0044DE8F    ret
*}
end;

//0044DE90
function TMenuItem.IsHintStored(Value:String):Boolean;
begin
{*
 0044DE90    push        ebx
 0044DE91    push        esi
 0044DE92    mov         ebx,eax
 0044DE94    mov         esi,dword ptr [ebx+44]
 0044DE97    test        esi,esi
>0044DE99    je          0044DEAB
 0044DE9B    mov         eax,esi
 0044DE9D    mov         edx,dword ptr [eax]
 0044DE9F    call        dword ptr [edx+38]
 0044DEA2    test        al,al
>0044DEA4    je          0044DEAB
 0044DEA6    xor         eax,eax
 0044DEA8    pop         esi
 0044DEA9    pop         ebx
 0044DEAA    ret
 0044DEAB    mov         al,1
 0044DEAD    pop         esi
 0044DEAE    pop         ebx
 0044DEAF    ret
*}
end;

//0044DEB0
function TMenuItem.IsHelpContextStored(Value:THelpContext):Boolean;
begin
{*
 0044DEB0    push        ebx
 0044DEB1    push        esi
 0044DEB2    mov         ebx,eax
 0044DEB4    mov         esi,dword ptr [ebx+44]
 0044DEB7    test        esi,esi
>0044DEB9    je          0044DECB
 0044DEBB    mov         eax,esi
 0044DEBD    mov         edx,dword ptr [eax]
 0044DEBF    call        dword ptr [edx+30]
 0044DEC2    test        al,al
>0044DEC4    je          0044DECB
 0044DEC6    xor         eax,eax
 0044DEC8    pop         esi
 0044DEC9    pop         ebx
 0044DECA    ret
 0044DECB    mov         al,1
 0044DECD    pop         esi
 0044DECE    pop         ebx
 0044DECF    ret
*}
end;

//0044DED0
function TMenuItem.IsImageIndexStored(Value:TImageIndex):Boolean;
begin
{*
 0044DED0    push        ebx
 0044DED1    push        esi
 0044DED2    mov         ebx,eax
 0044DED4    mov         esi,dword ptr [ebx+44]
 0044DED7    test        esi,esi
>0044DED9    je          0044DEEB
 0044DEDB    mov         eax,esi
 0044DEDD    mov         edx,dword ptr [eax]
 0044DEDF    call        dword ptr [edx+3C]
 0044DEE2    test        al,al
>0044DEE4    je          0044DEEB
 0044DEE6    xor         eax,eax
 0044DEE8    pop         esi
 0044DEE9    pop         ebx
 0044DEEA    ret
 0044DEEB    mov         al,1
 0044DEED    pop         esi
 0044DEEE    pop         ebx
 0044DEEF    ret
*}
end;

//0044DEF0
function TMenuItem.IsShortCutStored(Value:TShortCut):Boolean;
begin
{*
 0044DEF0    push        ebx
 0044DEF1    push        esi
 0044DEF2    mov         ebx,eax
 0044DEF4    mov         esi,dword ptr [ebx+44]
 0044DEF7    test        esi,esi
>0044DEF9    je          0044DF0B
 0044DEFB    mov         eax,esi
 0044DEFD    mov         edx,dword ptr [eax]
 0044DEFF    call        dword ptr [edx+40]
 0044DF02    test        al,al
>0044DF04    je          0044DF0B
 0044DF06    xor         eax,eax
 0044DF08    pop         esi
 0044DF09    pop         ebx
 0044DF0A    ret
 0044DF0B    mov         al,1
 0044DF0D    pop         esi
 0044DF0E    pop         ebx
 0044DF0F    ret
*}
end;

//0044DF10
function TMenuItem.IsVisibleStored(Value:Boolean):Boolean;
begin
{*
 0044DF10    push        ebx
 0044DF11    push        esi
 0044DF12    mov         ebx,eax
 0044DF14    mov         esi,dword ptr [ebx+44]
 0044DF17    test        esi,esi
>0044DF19    je          0044DF2B
 0044DF1B    mov         eax,esi
 0044DF1D    mov         edx,dword ptr [eax]
 0044DF1F    call        dword ptr [edx+44]
 0044DF22    test        al,al
>0044DF24    je          0044DF2B
 0044DF26    xor         eax,eax
 0044DF28    pop         esi
 0044DF29    pop         ebx
 0044DF2A    ret
 0044DF2B    mov         al,1
 0044DF2D    pop         esi
 0044DF2E    pop         ebx
 0044DF2F    ret
*}
end;

//0044DF30
function TMenuItem.IsOnClickStored(Value:TNotifyEvent):Boolean;
begin
{*
 0044DF30    push        ebx
 0044DF31    push        esi
 0044DF32    mov         ebx,eax
 0044DF34    mov         esi,dword ptr [ebx+44]
 0044DF37    test        esi,esi
>0044DF39    je          0044DF4B
 0044DF3B    mov         eax,esi
 0044DF3D    mov         edx,dword ptr [eax]
 0044DF3F    call        dword ptr [edx+8]
 0044DF42    test        al,al
>0044DF44    je          0044DF4B
 0044DF46    xor         eax,eax
 0044DF48    pop         esi
 0044DF49    pop         ebx
 0044DF4A    ret
 0044DF4B    mov         al,1
 0044DF4D    pop         esi
 0044DF4E    pop         ebx
 0044DF4F    ret
*}
end;

//0044DF50
procedure TMenuItem.AssignTo(Dest:TPersistent);
begin
{*
 0044DF50    push        ebx
 0044DF51    push        esi
 0044DF52    push        edi
 0044DF53    mov         esi,edx
 0044DF55    mov         ebx,eax
 0044DF57    mov         eax,esi
 0044DF59    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044DF5F    call        @IsClass
 0044DF64    test        al,al
>0044DF66    je          0044DFBB
 0044DF68    mov         dl,byte ptr [ebx+39]
 0044DF6B    mov         edi,esi
 0044DF6D    mov         eax,edi
 0044DF6F    call        TCustomAction.SetEnabled
 0044DF74    mov         edx,dword ptr [ebx+54]
 0044DF77    mov         eax,edi
 0044DF79    mov         ecx,dword ptr [eax]
 0044DF7B    call        dword ptr [ecx+48]
 0044DF7E    mov         edx,dword ptr [ebx+58]
 0044DF81    mov         eax,edi
 0044DF83    call        TCustomAction.SetHint
 0044DF88    mov         edx,dword ptr [ebx+40]
 0044DF8B    mov         eax,edi
 0044DF8D    call        TCustomAction.SetImageIndex
 0044DF92    mov         edx,dword ptr [ebx+30]
 0044DF95    mov         eax,edi
 0044DF97    call        TCustomAction.SetCaption
 0044DF9C    mov         dl,byte ptr [ebx+3E]
 0044DF9F    mov         eax,edi
 0044DFA1    call        TCustomAction.SetVisible
 0044DFA6    push        dword ptr [ebx+8C]
 0044DFAC    push        dword ptr [ebx+88]
 0044DFB2    mov         eax,edi
 0044DFB4    mov         edx,dword ptr [eax]
 0044DFB6    call        dword ptr [edx+34]
>0044DFB9    jmp         0044DFC4
 0044DFBB    mov         edx,esi
 0044DFBD    mov         eax,ebx
 0044DFBF    call        TPersistent.AssignTo
 0044DFC4    pop         edi
 0044DFC5    pop         esi
 0044DFC6    pop         ebx
 0044DFC7    ret
*}
end;

//0044DFC8
procedure TMenuItem.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0044DFC8    push        ebx
 0044DFC9    push        esi
 0044DFCA    push        edi
 0044DFCB    mov         ebx,ecx
 0044DFCD    mov         edi,edx
 0044DFCF    mov         esi,eax
 0044DFD1    mov         ecx,ebx
 0044DFD3    mov         edx,edi
 0044DFD5    mov         eax,esi
 0044DFD7    call        TComponent.Notification
 0044DFDC    cmp         bl,1
>0044DFDF    jne         0044E015
 0044DFE1    mov         eax,esi
 0044DFE3    call        TMenuItem.GetAction
 0044DFE8    cmp         edi,eax
>0044DFEA    jne         0044DFF7
 0044DFEC    xor         edx,edx
 0044DFEE    mov         eax,esi
 0044DFF0    call        TMenuItem.SetAction
>0044DFF5    jmp         0044E015
 0044DFF7    cmp         edi,dword ptr [esi+7C]
>0044DFFA    jne         0044E007
 0044DFFC    xor         edx,edx
 0044DFFE    mov         eax,esi
 0044E000    call        TMenuItem.SetSubMenuImages
>0044E005    jmp         0044E015
 0044E007    cmp         edi,dword ptr [esi+68]
>0044E00A    jne         0044E015
 0044E00C    xor         edx,edx
 0044E00E    mov         eax,esi
 0044E010    call        TMenuItem.MergeWith
 0044E015    pop         edi
 0044E016    pop         esi
 0044E017    pop         ebx
 0044E018    ret
*}
end;

//0044E01C
procedure TMenuItem.SetSubMenuImages(Value:TCustomImageList);
begin
{*
 0044E01C    push        ebx
 0044E01D    push        esi
 0044E01E    mov         esi,edx
 0044E020    mov         ebx,eax
 0044E022    mov         eax,dword ptr [ebx+7C]
 0044E025    test        eax,eax
>0044E027    je          0044E031
 0044E029    mov         edx,dword ptr [ebx+78]
 0044E02C    call        TCustomImageList.UnRegisterChanges
 0044E031    mov         eax,esi
 0044E033    mov         dword ptr [ebx+7C],eax
 0044E036    test        eax,eax
>0044E038    je          0044E04C
 0044E03A    mov         edx,dword ptr [ebx+78]
 0044E03D    call        TCustomImageList.RegisterChanges
 0044E042    mov         edx,ebx
 0044E044    mov         eax,dword ptr [ebx+7C]
 0044E047    call        TComponent.FreeNotification
 0044E04C    mov         eax,ebx
 0044E04E    call        TMenuItem.UpdateItems
 0044E053    pop         esi
 0044E054    pop         ebx
 0044E055    ret
*}
end;

//0044E058
procedure TMenuItem.ImageListChange(Sender:TObject);
begin
{*
 0044E058    cmp         edx,dword ptr [eax+7C]
>0044E05B    jne         0044E062
 0044E05D    call        TMenuItem.UpdateItems
 0044E062    ret
*}
end;

//0044E064
function UpdateItem(MenuItem:TMenuItem):Boolean;
begin
{*
 0044E064    push        ebx
 0044E065    push        esi
 0044E066    mov         esi,eax
 0044E068    xor         ebx,ebx
 0044E06A    mov         eax,44E064;UpdateItem:Boolean
 0044E06F    mov         ecx,esi
 0044E071    mov         edx,dword ptr [esi+68]
 0044E074    call        IterateMenus
 0044E079    push        1
 0044E07B    mov         ecx,esi
 0044E07D    mov         edx,esi
 0044E07F    mov         eax,esi
 0044E081    call        TMenuItem.SubItemChanged
 0044E086    mov         eax,ebx
 0044E088    pop         esi
 0044E089    pop         ebx
 0044E08A    ret
*}
end;

//0044E08C
procedure TMenuItem.UpdateItems;
begin
{*
 0044E08C    mov         edx,44E064;UpdateItem:Boolean
 0044E091    mov         ecx,eax
 0044E093    mov         eax,dword ptr [eax+68]
 0044E096    xchg        eax,edx
 0044E097    call        IterateMenus
 0044E09C    ret
*}
end;

//0044E0A0
function IfHotkeyAvailable(const AHotkey:AnsiString):Boolean;
begin
{*
 0044E0A0    push        ebp
 0044E0A1    mov         ebp,esp
 0044E0A3    push        ebx
 0044E0A4    mov         edx,dword ptr [ebp+8]
 0044E0A7    mov         edx,dword ptr [edx-4]
 0044E0AA    call        AnsiPos
 0044E0AF    test        eax,eax
 0044E0B1    setne       bl
 0044E0B4    test        bl,bl
>0044E0B6    je          0044E0C9
 0044E0B8    mov         edx,dword ptr [ebp+8]
 0044E0BB    add         edx,0FFFFFFFC
 0044E0BE    mov         ecx,1
 0044E0C3    xchg        eax,edx
 0044E0C4    call        @LStrDelete
 0044E0C9    mov         eax,ebx
 0044E0CB    pop         ebx
 0044E0CC    pop         ebp
 0044E0CD    ret
*}
end;

//0044E0D0
procedure CopyToBest;
begin
{*
 0044E0D0    push        ebp
 0044E0D1    mov         ebp,esp
 0044E0D3    push        ebx
 0044E0D4    push        esi
 0044E0D5    push        edi
 0044E0D6    mov         eax,dword ptr [ebp+8]
 0044E0D9    mov         edx,dword ptr [eax-0C]
 0044E0DC    mov         eax,dword ptr [ebp+8]
 0044E0DF    mov         eax,dword ptr [eax-8]
 0044E0E2    mov         ecx,dword ptr [eax]
 0044E0E4    call        dword ptr [ecx+8]
 0044E0E7    mov         eax,dword ptr [ebp+8]
 0044E0EA    mov         eax,dword ptr [eax-0C]
 0044E0ED    mov         edx,dword ptr [eax]
 0044E0EF    call        dword ptr [edx+14]
 0044E0F2    mov         edx,dword ptr [ebp+8]
 0044E0F5    mov         dword ptr [edx-10],eax
 0044E0F8    mov         eax,dword ptr [ebp+8]
 0044E0FB    mov         eax,dword ptr [eax-14]
 0044E0FE    mov         edx,dword ptr [eax]
 0044E100    call        dword ptr [edx+14]
 0044E103    mov         esi,eax
 0044E105    dec         esi
 0044E106    test        esi,esi
>0044E108    jl          0044E13B
 0044E10A    inc         esi
 0044E10B    xor         ebx,ebx
 0044E10D    mov         eax,dword ptr [ebp+8]
 0044E110    mov         eax,dword ptr [eax-14]
 0044E113    mov         edx,ebx
 0044E115    mov         ecx,dword ptr [eax]
 0044E117    call        dword ptr [ecx+18]
 0044E11A    push        eax
 0044E11B    mov         eax,dword ptr [ebp+8]
 0044E11E    mov         eax,dword ptr [eax-14]
 0044E121    mov         edx,ebx
 0044E123    mov         ecx,dword ptr [eax]
 0044E125    call        dword ptr [ecx+18]
 0044E128    mov         edx,dword ptr [eax+30]
 0044E12B    mov         eax,dword ptr [ebp+8]
 0044E12E    mov         eax,dword ptr [eax-8]
 0044E131    pop         ecx
 0044E132    mov         edi,dword ptr [eax]
 0044E134    call        dword ptr [edi+3C]
 0044E137    inc         ebx
 0044E138    dec         esi
>0044E139    jne         0044E10D
 0044E13B    mov         eax,dword ptr [ebp+8]
 0044E13E    add         eax,0FFFFFFE8
 0044E141    mov         edx,dword ptr [ebp+8]
 0044E144    mov         edx,dword ptr [edx-4]
 0044E147    call        @LStrLAsg
 0044E14C    pop         edi
 0044E14D    pop         esi
 0044E14E    pop         ebx
 0044E14F    pop         ebp
 0044E150    ret
*}
end;

//0044E154
procedure InsertHotkeyFarEastFormat(var ACaption:AnsiString; const AHotKey:AnsiString; AColumn:Integer);
begin
{*
 0044E154    push        ebp
 0044E155    mov         ebp,esp
 0044E157    add         esp,0FFFFFFF0
 0044E15A    push        ebx
 0044E15B    push        esi
 0044E15C    push        edi
 0044E15D    xor         ebx,ebx
 0044E15F    mov         dword ptr [ebp-10],ebx
 0044E162    mov         dword ptr [ebp-0C],ebx
 0044E165    mov         dword ptr [ebp-8],ecx
 0044E168    mov         dword ptr [ebp-4],edx
 0044E16B    mov         esi,eax
 0044E16D    xor         eax,eax
 0044E16F    push        ebp
 0044E170    push        44E276
 0044E175    push        dword ptr fs:[eax]
 0044E178    mov         dword ptr fs:[eax],esp
 0044E17B    xor         ebx,ebx
 0044E17D    mov         eax,dword ptr [esi]
 0044E17F    call        @LStrLen
 0044E184    test        eax,eax
>0044E186    jle         0044E1AC
 0044E188    mov         edi,1
 0044E18D    mov         edx,dword ptr [esi]
 0044E18F    mov         dl,byte ptr [edx+edi-1]
 0044E193    mov         ecx,dword ptr ds:[5AE7EC]
 0044E199    and         edx,0FF
 0044E19F    bt          dword ptr [ecx],edx
>0044E1A2    jae         0044E1A8
 0044E1A4    mov         bl,1
>0044E1A6    jmp         0044E1AC
 0044E1A8    inc         edi
 0044E1A9    dec         eax
>0044E1AA    jne         0044E18D
 0044E1AC    test        bl,bl
>0044E1AE    je          0044E246
 0044E1B4    lea         eax,[ebp-0C]
 0044E1B7    push        eax
 0044E1B8    mov         eax,dword ptr [esi]
 0044E1BA    call        @LStrLen
 0044E1BF    mov         edx,eax
 0044E1C1    sub         edx,3
 0044E1C4    inc         edx
 0044E1C5    mov         eax,dword ptr [esi]
 0044E1C7    mov         ecx,3
 0044E1CC    call        @LStrCopy
 0044E1D1    mov         eax,dword ptr [ebp-0C]
 0044E1D4    mov         edx,44E28C;'...'
 0044E1D9    call        @LStrCmp
>0044E1DE    jne         0044E224
 0044E1E0    lea         eax,[ebp-10]
 0044E1E3    push        eax
 0044E1E4    mov         eax,dword ptr [esi]
 0044E1E6    call        @LStrLen
 0044E1EB    mov         ecx,eax
 0044E1ED    sub         ecx,3
 0044E1F0    mov         eax,dword ptr [esi]
 0044E1F2    mov         edx,1
 0044E1F7    call        @LStrCopy
 0044E1FC    push        dword ptr [ebp-10]
 0044E1FF    push        44E298;'('
 0044E204    push        44E2A4;'&'
 0044E209    push        dword ptr [ebp-4]
 0044E20C    push        44E2B0;')'
 0044E211    push        44E28C;'...'
 0044E216    mov         eax,esi
 0044E218    mov         edx,6
 0044E21D    call        @LStrCatN
>0044E222    jmp         0044E25B
 0044E224    push        dword ptr [esi]
 0044E226    push        44E298;'('
 0044E22B    push        44E2A4;'&'
 0044E230    push        dword ptr [ebp-4]
 0044E233    push        44E2B0;')'
 0044E238    mov         eax,esi
 0044E23A    mov         edx,5
 0044E23F    call        @LStrCatN
>0044E244    jmp         0044E25B
 0044E246    cmp         dword ptr [ebp-8],0
>0044E24A    je          0044E25B
 0044E24C    mov         edx,esi
 0044E24E    mov         ecx,dword ptr [ebp-8]
 0044E251    mov         eax,44E2A4;'&'
 0044E256    call        @LStrInsert
 0044E25B    xor         eax,eax
 0044E25D    pop         edx
 0044E25E    pop         ecx
 0044E25F    pop         ecx
 0044E260    mov         dword ptr fs:[eax],edx
 0044E263    push        44E27D
 0044E268    lea         eax,[ebp-10]
 0044E26B    mov         edx,2
 0044E270    call        @LStrArrayClr
 0044E275    ret
>0044E276    jmp         @HandleFinally
>0044E27B    jmp         0044E268
 0044E27D    pop         edi
 0044E27E    pop         esi
 0044E27F    pop         ebx
 0044E280    mov         esp,ebp
 0044E282    pop         ebp
 0044E283    ret
*}
end;

//0044E2B4
function TMenuItem.InternalRethinkHotkeys(ForceRethink:Boolean):Boolean;
begin
{*
 0044E2B4    push        ebp
 0044E2B5    mov         ebp,esp
 0044E2B7    add         esp,0FFFFFFB8
 0044E2BA    push        ebx
 0044E2BB    push        esi
 0044E2BC    push        edi
 0044E2BD    xor         ecx,ecx
 0044E2BF    mov         dword ptr [ebp-48],ecx
 0044E2C2    mov         dword ptr [ebp-44],ecx
 0044E2C5    mov         dword ptr [ebp-40],ecx
 0044E2C8    mov         dword ptr [ebp-3C],ecx
 0044E2CB    mov         dword ptr [ebp-2C],ecx
 0044E2CE    mov         dword ptr [ebp-30],ecx
 0044E2D1    mov         dword ptr [ebp-34],ecx
 0044E2D4    mov         dword ptr [ebp-4],ecx
 0044E2D7    mov         dword ptr [ebp-18],ecx
 0044E2DA    mov         byte ptr [ebp-19],dl
 0044E2DD    mov         ebx,eax
 0044E2DF    xor         eax,eax
 0044E2E1    push        ebp
 0044E2E2    push        44E753
 0044E2E7    push        dword ptr fs:[eax]
 0044E2EA    mov         dword ptr fs:[eax],esp
 0044E2ED    mov         byte ptr [ebp-1A],0
 0044E2F1    cmp         byte ptr [ebp-19],0
>0044E2F5    jne         0044E310
 0044E2F7    test        byte ptr [ebx+1C],10
>0044E2FB    jne         0044E71B
 0044E301    mov         eax,ebx
 0044E303    call        TMenuItem.GetAutoHotkeys
 0044E308    test        al,al
>0044E30A    je          0044E71B
 0044E310    lea         eax,[ebp-4]
 0044E313    mov         edx,dword ptr ds:[5ACCC0]
 0044E319    call        @LStrLAsg
 0044E31E    xor         eax,eax
 0044E320    mov         dword ptr [ebp-0C],eax
 0044E323    xor         eax,eax
 0044E325    mov         dword ptr [ebp-14],eax
 0044E328    xor         eax,eax
 0044E32A    mov         dword ptr [ebp-20],eax
 0044E32D    xor         eax,eax
 0044E32F    mov         dword ptr [ebp-8],eax
 0044E332    xor         eax,eax
 0044E334    mov         dword ptr [ebp-10],eax
 0044E337    xor         eax,eax
 0044E339    push        ebp
 0044E33A    push        44E714
 0044E33F    push        dword ptr fs:[eax]
 0044E342    mov         dword ptr fs:[eax],esp
 0044E345    mov         dl,1
 0044E347    mov         eax,[00418350];TStringList
 0044E34C    call        TObject.Create
 0044E351    mov         dword ptr [ebp-0C],eax
 0044E354    mov         dl,1
 0044E356    mov         eax,[00418350];TStringList
 0044E35B    call        TObject.Create
 0044E360    mov         dword ptr [ebp-14],eax
 0044E363    mov         dl,1
 0044E365    mov         eax,[00418350];TStringList
 0044E36A    call        TObject.Create
 0044E36F    mov         dword ptr [ebp-20],eax
 0044E372    mov         dl,1
 0044E374    mov         eax,[00418350];TStringList
 0044E379    call        TObject.Create
 0044E37E    mov         dword ptr [ebp-8],eax
 0044E381    mov         eax,ebx
 0044E383    call        TMenuItem.GetCount
 0044E388    dec         eax
 0044E389    test        eax,eax
>0044E38B    jl          0044E494
 0044E391    inc         eax
 0044E392    mov         dword ptr [ebp-38],eax
 0044E395    xor         esi,esi
 0044E397    mov         edx,esi
 0044E399    mov         eax,ebx
 0044E39B    call        TMenuItem.GetItem
 0044E3A0    cmp         byte ptr [eax+3E],0
>0044E3A4    je          0044E48A
 0044E3AA    mov         edx,esi
 0044E3AC    mov         eax,ebx
 0044E3AE    call        TMenuItem.GetItem
 0044E3B3    mov         eax,dword ptr [eax+30]
 0044E3B6    mov         edx,44E76C;'-'
 0044E3BB    call        @LStrCmp
>0044E3C0    je          0044E48A
 0044E3C6    mov         edx,esi
 0044E3C8    mov         eax,ebx
 0044E3CA    call        TMenuItem.GetItem
 0044E3CF    cmp         dword ptr [eax+30],0
>0044E3D3    je          0044E48A
 0044E3D9    mov         edx,esi
 0044E3DB    mov         eax,ebx
 0044E3DD    call        TMenuItem.GetItem
 0044E3E2    mov         eax,dword ptr [eax+30]
 0044E3E5    lea         edx,[ebp-3C]
 0044E3E8    call        GetHotkey
 0044E3ED    mov         eax,dword ptr [ebp-3C]
 0044E3F0    lea         edx,[ebp-2C]
 0044E3F3    call        UpperCase
 0044E3F8    cmp         dword ptr [ebp-2C],0
>0044E3FC    jne         0044E420
 0044E3FE    mov         edx,esi
 0044E400    mov         eax,ebx
 0044E402    call        TMenuItem.GetItem
 0044E407    push        eax
 0044E408    mov         edx,esi
 0044E40A    mov         eax,ebx
 0044E40C    call        TMenuItem.GetItem
 0044E411    mov         ecx,dword ptr [eax+30]
 0044E414    xor         edx,edx
 0044E416    mov         eax,dword ptr [ebp-20]
 0044E419    mov         edi,dword ptr [eax]
 0044E41B    call        dword ptr [edi+64]
>0044E41E    jmp         0044E48A
 0044E420    mov         edx,dword ptr ds:[5ACCC0]
 0044E426    mov         eax,dword ptr [ebp-2C]
 0044E429    call        AnsiPos
 0044E42E    test        eax,eax
>0044E430    je          0044E48A
 0044E432    push        ebp
 0044E433    mov         eax,dword ptr [ebp-2C]
 0044E436    call        IfHotkeyAvailable
 0044E43B    pop         ecx
 0044E43C    test        al,al
>0044E43E    jne         0044E48A
 0044E440    mov         edx,esi
 0044E442    mov         eax,ebx
 0044E444    call        TMenuItem.GetItem
 0044E449    add         eax,30
 0044E44C    push        eax
 0044E44D    mov         edx,esi
 0044E44F    mov         eax,ebx
 0044E451    call        TMenuItem.GetItem
 0044E456    mov         eax,dword ptr [eax+30]
 0044E459    lea         edx,[ebp-40]
 0044E45C    call        StripHotkey
 0044E461    mov         edx,dword ptr [ebp-40]
 0044E464    pop         eax
 0044E465    call        @LStrAsg
 0044E46A    mov         edx,esi
 0044E46C    mov         eax,ebx
 0044E46E    call        TMenuItem.GetItem
 0044E473    push        eax
 0044E474    mov         edx,esi
 0044E476    mov         eax,ebx
 0044E478    call        TMenuItem.GetItem
 0044E47D    mov         ecx,dword ptr [eax+30]
 0044E480    xor         edx,edx
 0044E482    mov         eax,dword ptr [ebp-20]
 0044E485    mov         edi,dword ptr [eax]
 0044E487    call        dword ptr [edi+64]
 0044E48A    inc         esi
 0044E48B    dec         dword ptr [ebp-38]
>0044E48E    jne         0044E397
 0044E494    lea         eax,[ebp-34]
 0044E497    mov         edx,dword ptr [ebp-4]
 0044E49A    call        @LStrLAsg
 0044E49F    mov         eax,dword ptr [ebp-20]
 0044E4A2    mov         edx,dword ptr [eax]
 0044E4A4    call        dword ptr [edx+14]
 0044E4A7    dec         eax
 0044E4A8    test        eax,eax
>0044E4AA    jl          0044E616
 0044E4B0    inc         eax
 0044E4B1    mov         dword ptr [ebp-38],eax
 0044E4B4    lea         eax,[ebp-4]
 0044E4B7    mov         edx,dword ptr [ebp-34]
 0044E4BA    call        @LStrLAsg
 0044E4BF    mov         edx,dword ptr [ebp-20]
 0044E4C2    mov         eax,dword ptr [ebp-14]
 0044E4C5    mov         ecx,dword ptr [eax]
 0044E4C7    call        dword ptr [ecx+8]
 0044E4CA    mov         eax,dword ptr [ebp-0C]
 0044E4CD    mov         edx,dword ptr [eax]
 0044E4CF    call        dword ptr [edx+44]
 0044E4D2    mov         eax,dword ptr [ebp-14]
 0044E4D5    mov         edx,dword ptr [eax]
 0044E4D7    call        dword ptr [edx+14]
 0044E4DA    mov         esi,eax
 0044E4DC    dec         esi
 0044E4DD    cmp         esi,0
>0044E4E0    jl          0044E5AA
 0044E4E6    lea         ecx,[ebp-30]
 0044E4E9    mov         edx,esi
 0044E4EB    mov         eax,dword ptr [ebp-14]
 0044E4EE    mov         ebx,dword ptr [eax]
 0044E4F0    call        dword ptr [ebx+0C]
 0044E4F3    mov         ebx,1
>0044E4F8    jmp         0044E590
 0044E4FD    mov         eax,dword ptr [ebp-30]
 0044E500    mov         al,byte ptr [eax+ebx-1]
 0044E504    mov         edx,dword ptr ds:[5AE7EC]
 0044E50A    and         eax,0FF
 0044E50F    bt          dword ptr [edx],eax
>0044E512    jae         0044E517
 0044E514    inc         ebx
>0044E515    jmp         0044E58F
 0044E517    lea         eax,[ebp-44]
 0044E51A    push        eax
 0044E51B    mov         ecx,1
 0044E520    mov         edx,ebx
 0044E522    mov         eax,dword ptr [ebp-30]
 0044E525    call        @LStrCopy
 0044E52A    mov         eax,dword ptr [ebp-44]
 0044E52D    lea         edx,[ebp-2C]
 0044E530    call        UpperCase
 0044E535    push        ebp
 0044E536    mov         eax,dword ptr [ebp-2C]
 0044E539    call        IfHotkeyAvailable
 0044E53E    pop         ecx
 0044E53F    test        al,al
>0044E541    je          0044E58F
 0044E543    mov         eax,[005AE810];^SysLocale:TSysLocale
 0044E548    cmp         byte ptr [eax+0C],0
>0044E54C    je          0044E55D
 0044E54E    lea         eax,[ebp-30]
 0044E551    mov         ecx,ebx
 0044E553    mov         edx,dword ptr [ebp-2C]
 0044E556    call        InsertHotkeyFarEastFormat
>0044E55B    jmp         0044E56C
 0044E55D    lea         edx,[ebp-30]
 0044E560    mov         ecx,ebx
 0044E562    mov         eax,44E778;'&'
 0044E567    call        @LStrInsert
 0044E56C    mov         edx,esi
 0044E56E    mov         eax,dword ptr [ebp-14]
 0044E571    mov         ecx,dword ptr [eax]
 0044E573    call        dword ptr [ecx+18]
 0044E576    mov         ecx,eax
 0044E578    mov         edx,dword ptr [ebp-30]
 0044E57B    mov         eax,dword ptr [ebp-0C]
 0044E57E    mov         ebx,dword ptr [eax]
 0044E580    call        dword ptr [ebx+3C]
 0044E583    mov         edx,esi
 0044E585    mov         eax,dword ptr [ebp-14]
 0044E588    mov         ecx,dword ptr [eax]
 0044E58A    call        dword ptr [ecx+48]
>0044E58D    jmp         0044E5A0
 0044E58F    inc         ebx
 0044E590    mov         eax,dword ptr [ebp-30]
 0044E593    call        @LStrLen
 0044E598    cmp         ebx,eax
>0044E59A    jle         0044E4FD
 0044E5A0    dec         esi
 0044E5A1    cmp         esi,0FFFFFFFF
>0044E5A4    jne         0044E4E6
 0044E5AA    mov         eax,dword ptr [ebp-0C]
 0044E5AD    mov         edx,dword ptr [eax]
 0044E5AF    call        dword ptr [edx+14]
 0044E5B2    cmp         eax,dword ptr [ebp-10]
>0044E5B5    jle         0044E5BE
 0044E5B7    push        ebp
 0044E5B8    call        CopyToBest
 0044E5BD    pop         ecx
 0044E5BE    mov         eax,dword ptr [ebp-14]
 0044E5C1    mov         edx,dword ptr [eax]
 0044E5C3    call        dword ptr [edx+14]
 0044E5C6    test        eax,eax
>0044E5C8    jle         0044E616
 0044E5CA    mov         eax,dword ptr [ebp-14]
 0044E5CD    mov         edx,dword ptr [eax]
 0044E5CF    call        dword ptr [edx+14]
 0044E5D2    mov         edi,eax
 0044E5D4    dec         edi
 0044E5D5    test        edi,edi
>0044E5D7    jl          0044E60D
 0044E5D9    inc         edi
 0044E5DA    xor         esi,esi
 0044E5DC    mov         edx,esi
 0044E5DE    mov         eax,dword ptr [ebp-14]
 0044E5E1    mov         ecx,dword ptr [eax]
 0044E5E3    call        dword ptr [ecx+18]
 0044E5E6    mov         edx,eax
 0044E5E8    mov         eax,dword ptr [ebp-20]
 0044E5EB    mov         ecx,dword ptr [eax]
 0044E5ED    call        dword ptr [ecx+5C]
 0044E5F0    mov         dword ptr [ebp-28],eax
 0044E5F3    mov         eax,dword ptr [ebp-20]
 0044E5F6    mov         edx,dword ptr [eax]
 0044E5F8    call        dword ptr [edx+14]
 0044E5FB    mov         ecx,eax
 0044E5FD    dec         ecx
 0044E5FE    mov         edx,dword ptr [ebp-28]
 0044E601    mov         eax,dword ptr [ebp-20]
 0044E604    mov         ebx,dword ptr [eax]
 0044E606    call        dword ptr [ebx+70]
 0044E609    inc         esi
 0044E60A    dec         edi
>0044E60B    jne         0044E5DC
 0044E60D    dec         dword ptr [ebp-38]
>0044E610    jne         0044E4B4
 0044E616    cmp         dword ptr [ebp-10],0
>0044E61A    jne         0044E623
 0044E61C    push        ebp
 0044E61D    call        CopyToBest
 0044E622    pop         ecx
 0044E623    mov         eax,dword ptr [ebp-8]
 0044E626    mov         edx,dword ptr [eax]
 0044E628    call        dword ptr [edx+14]
 0044E62B    test        eax,eax
 0044E62D    setg        byte ptr [ebp-1A]
 0044E631    mov         eax,dword ptr [ebp-8]
 0044E634    mov         edx,dword ptr [eax]
 0044E636    call        dword ptr [edx+14]
 0044E639    dec         eax
 0044E63A    test        eax,eax
>0044E63C    jl          0044E6E6
 0044E642    inc         eax
 0044E643    mov         dword ptr [ebp-38],eax
 0044E646    xor         esi,esi
 0044E648    lea         ecx,[ebp-30]
 0044E64B    mov         edx,esi
 0044E64D    mov         eax,dword ptr [ebp-8]
 0044E650    mov         ebx,dword ptr [eax]
 0044E652    call        dword ptr [ebx+0C]
 0044E655    mov         eax,[005AE810];^SysLocale:TSysLocale
 0044E65A    cmp         byte ptr [eax+0C],0
>0044E65E    je          0044E6C7
 0044E660    mov         edx,dword ptr [ebp-30]
 0044E663    mov         eax,44E778;'&'
 0044E668    call        AnsiPos
 0044E66D    test        eax,eax
>0044E66F    jne         0044E6C7
 0044E671    cmp         dword ptr [ebp-18],0
>0044E675    je          0044E6C7
 0044E677    mov         edx,dword ptr [ebp-30]
 0044E67A    mov         eax,44E778;'&'
 0044E67F    call        AnsiPos
 0044E684    test        eax,eax
>0044E686    jne         0044E6C7
 0044E688    lea         eax,[ebp-48]
 0044E68B    push        eax
 0044E68C    mov         eax,dword ptr [ebp-18]
 0044E68F    call        @LStrLen
 0044E694    mov         edx,eax
 0044E696    mov         ecx,1
 0044E69B    mov         eax,dword ptr [ebp-18]
 0044E69E    call        @LStrCopy
 0044E6A3    mov         edx,dword ptr [ebp-48]
 0044E6A6    lea         eax,[ebp-30]
 0044E6A9    xor         ecx,ecx
 0044E6AB    call        InsertHotkeyFarEastFormat
 0044E6B0    mov         eax,dword ptr [ebp-18]
 0044E6B3    call        @LStrLen
 0044E6B8    mov         edx,eax
 0044E6BA    lea         eax,[ebp-18]
 0044E6BD    mov         ecx,1
 0044E6C2    call        @LStrDelete
 0044E6C7    mov         edx,esi
 0044E6C9    mov         eax,dword ptr [ebp-8]
 0044E6CC    mov         ecx,dword ptr [eax]
 0044E6CE    call        dword ptr [ecx+18]
 0044E6D1    add         eax,30
 0044E6D4    mov         edx,dword ptr [ebp-30]
 0044E6D7    call        @LStrAsg
 0044E6DC    inc         esi
 0044E6DD    dec         dword ptr [ebp-38]
>0044E6E0    jne         0044E648
 0044E6E6    xor         eax,eax
 0044E6E8    pop         edx
 0044E6E9    pop         ecx
 0044E6EA    pop         ecx
 0044E6EB    mov         dword ptr fs:[eax],edx
 0044E6EE    push        44E71B
 0044E6F3    mov         eax,dword ptr [ebp-8]
 0044E6F6    call        TObject.Free
 0044E6FB    mov         eax,dword ptr [ebp-20]
 0044E6FE    call        TObject.Free
 0044E703    mov         eax,dword ptr [ebp-14]
 0044E706    call        TObject.Free
 0044E70B    mov         eax,dword ptr [ebp-0C]
 0044E70E    call        TObject.Free
 0044E713    ret
>0044E714    jmp         @HandleFinally
>0044E719    jmp         0044E6F3
 0044E71B    xor         eax,eax
 0044E71D    pop         edx
 0044E71E    pop         ecx
 0044E71F    pop         ecx
 0044E720    mov         dword ptr fs:[eax],edx
 0044E723    push        44E75A
 0044E728    lea         eax,[ebp-48]
 0044E72B    mov         edx,4
 0044E730    call        @LStrArrayClr
 0044E735    lea         eax,[ebp-34]
 0044E738    mov         edx,3
 0044E73D    call        @LStrArrayClr
 0044E742    lea         eax,[ebp-18]
 0044E745    call        @LStrClr
 0044E74A    lea         eax,[ebp-4]
 0044E74D    call        @LStrClr
 0044E752    ret
>0044E753    jmp         @HandleFinally
>0044E758    jmp         0044E728
 0044E75A    mov         al,byte ptr [ebp-1A]
 0044E75D    pop         edi
 0044E75E    pop         esi
 0044E75F    pop         ebx
 0044E760    mov         esp,ebp
 0044E762    pop         ebp
 0044E763    ret
*}
end;

//0044E77C
procedure TMenuItem.SetAutoHotkeys(const Value:TMenuItemAutoFlag);
begin
{*
 0044E77C    cmp         dl,byte ptr [eax+3B]
>0044E77F    je          0044E78B
 0044E781    mov         byte ptr [eax+3B],dl
 0044E784    mov         dl,1
 0044E786    mov         ecx,dword ptr [eax]
 0044E788    call        dword ptr [ecx+3C]
 0044E78B    ret
*}
end;

//0044E78C
function TMenuItem.IsLine:Boolean;
begin
{*
 0044E78C    push        ebx
 0044E78D    mov         ebx,eax
 0044E78F    mov         eax,dword ptr [ebx+30]
 0044E792    mov         edx,44E7AC;'-'
 0044E797    call        @LStrCmp
 0044E79C    sete        al
 0044E79F    pop         ebx
 0044E7A0    ret
*}
end;

//0044E7B0
function TMenuItem.InternalRethinkLines(ForceRethink:Boolean):Boolean;
begin
{*
 0044E7B0    push        ebx
 0044E7B1    push        esi
 0044E7B2    push        edi
 0044E7B3    push        ebp
 0044E7B4    add         esp,0FFFFFFF8
 0044E7B7    mov         ebx,edx
 0044E7B9    mov         esi,eax
 0044E7BB    mov         byte ptr [esp],0
 0044E7BF    test        bl,bl
>0044E7C1    jne         0044E7DC
 0044E7C3    test        byte ptr [esi+1C],10
>0044E7C7    jne         0044E8ED
 0044E7CD    mov         eax,esi
 0044E7CF    call        TMenuItem.GetAutoLineReduction
 0044E7D4    test        al,al
>0044E7D6    je          0044E8ED
 0044E7DC    xor         eax,eax
 0044E7DE    mov         dword ptr [esp+4],eax
 0044E7E2    xor         ebp,ebp
 0044E7E4    mov         ebx,dword ptr [esp+4]
 0044E7E8    mov         eax,esi
 0044E7EA    call        TMenuItem.GetCount
 0044E7EF    mov         edi,eax
 0044E7F1    dec         edi
 0044E7F2    sub         edi,ebx
>0044E7F4    jl          0044E835
 0044E7F6    inc         edi
 0044E7F7    mov         edx,ebx
 0044E7F9    mov         eax,esi
 0044E7FB    call        TMenuItem.GetItem
 0044E800    cmp         byte ptr [eax+3E],0
>0044E804    je          0044E831
 0044E806    mov         edx,ebx
 0044E808    mov         eax,esi
 0044E80A    call        TMenuItem.GetItem
 0044E80F    call        TMenuItem.IsLine
 0044E814    test        al,al
>0044E816    je          0044E82B
 0044E818    mov         edx,ebx
 0044E81A    mov         eax,esi
 0044E81C    call        TMenuItem.GetItem
 0044E821    mov         byte ptr [eax+3E],0
 0044E825    mov         byte ptr [esp],1
>0044E829    jmp         0044E831
 0044E82B    mov         dword ptr [esp+4],ebx
>0044E82F    jmp         0044E835
 0044E831    inc         ebx
 0044E832    dec         edi
>0044E833    jne         0044E7F7
 0044E835    mov         ebx,dword ptr [esp+4]
 0044E839    mov         eax,esi
 0044E83B    call        TMenuItem.GetCount
 0044E840    mov         edi,eax
 0044E842    dec         edi
 0044E843    sub         edi,ebx
>0044E845    jl          0044E8A4
 0044E847    inc         edi
 0044E848    mov         edx,ebx
 0044E84A    mov         eax,esi
 0044E84C    call        TMenuItem.GetItem
 0044E851    call        TMenuItem.IsLine
 0044E856    test        al,al
>0044E858    je          0044E879
 0044E85A    test        ebp,ebp
>0044E85C    je          0044E86C
 0044E85E    cmp         byte ptr [ebp+3E],0
>0044E862    je          0044E86C
 0044E864    mov         byte ptr [ebp+3E],0
 0044E868    mov         byte ptr [esp],1
 0044E86C    mov         edx,ebx
 0044E86E    mov         eax,esi
 0044E870    call        TMenuItem.GetItem
 0044E875    mov         ebp,eax
>0044E877    jmp         0044E8A0
 0044E879    mov         edx,ebx
 0044E87B    mov         eax,esi
 0044E87D    call        TMenuItem.GetItem
 0044E882    cmp         byte ptr [eax+3E],0
>0044E886    je          0044E8A0
 0044E888    test        ebp,ebp
>0044E88A    je          0044E89A
 0044E88C    cmp         byte ptr [ebp+3E],0
>0044E890    jne         0044E89A
 0044E892    mov         byte ptr [ebp+3E],1
 0044E896    mov         byte ptr [esp],1
 0044E89A    xor         ebp,ebp
 0044E89C    mov         dword ptr [esp+4],ebx
 0044E8A0    inc         ebx
 0044E8A1    dec         edi
>0044E8A2    jne         0044E848
 0044E8A4    mov         eax,esi
 0044E8A6    call        TMenuItem.GetCount
 0044E8AB    mov         ebx,eax
 0044E8AD    dec         ebx
 0044E8AE    mov         edi,dword ptr [esp+4]
 0044E8B2    sub         edi,ebx
>0044E8B4    jg          0044E8ED
 0044E8B6    dec         edi
 0044E8B7    mov         edx,ebx
 0044E8B9    mov         eax,esi
 0044E8BB    call        TMenuItem.GetItem
 0044E8C0    cmp         byte ptr [eax+3E],0
>0044E8C4    je          0044E8E9
 0044E8C6    mov         edx,ebx
 0044E8C8    mov         eax,esi
 0044E8CA    call        TMenuItem.GetItem
 0044E8CF    call        TMenuItem.IsLine
 0044E8D4    test        al,al
>0044E8D6    je          0044E8ED
 0044E8D8    mov         edx,ebx
 0044E8DA    mov         eax,esi
 0044E8DC    call        TMenuItem.GetItem
 0044E8E1    mov         byte ptr [eax+3E],0
 0044E8E5    mov         byte ptr [esp],1
 0044E8E9    dec         ebx
 0044E8EA    inc         edi
>0044E8EB    jne         0044E8B7
 0044E8ED    mov         al,byte ptr [esp]
 0044E8F0    pop         ecx
 0044E8F1    pop         edx
 0044E8F2    pop         ebp
 0044E8F3    pop         edi
 0044E8F4    pop         esi
 0044E8F5    pop         ebx
 0044E8F6    ret
*}
end;

//0044E8F8
procedure TMenuItem.SetAutoLineReduction(const Value:TMenuItemAutoFlag);
begin
{*
 0044E8F8    cmp         dl,byte ptr [eax+3C]
>0044E8FB    je          0044E907
 0044E8FD    mov         byte ptr [eax+3C],dl
 0044E900    mov         dl,1
 0044E902    mov         ecx,dword ptr [eax]
 0044E904    call        dword ptr [ecx+3C]
 0044E907    ret
*}
end;

//0044E908
function TMenuItem.GetAutoHotkeys:Boolean;
begin
{*
 0044E908    push        ebx
 0044E909    mov         ebx,eax
 0044E90B    mov         al,byte ptr [ebx+3B]
 0044E90E    cmp         al,2
>0044E910    jne         0044E929
 0044E912    cmp         dword ptr [ebx+64],0
>0044E916    je          0044E929
 0044E918    mov         eax,dword ptr [ebx+64]
 0044E91B    call        TMenuItem.GetAutoHotkeys
 0044E920    and         eax,7F
 0044E923    mov         al,byte ptr [eax+5ACCCC]
 0044E929    and         eax,7F
 0044E92C    mov         al,byte ptr [eax+5ACCD0]
 0044E932    pop         ebx
 0044E933    ret
*}
end;

//0044E934
function TMenuItem.GetAutoLineReduction:Boolean;
begin
{*
 0044E934    push        ebx
 0044E935    mov         ebx,eax
 0044E937    mov         al,byte ptr [ebx+3C]
 0044E93A    cmp         al,2
>0044E93C    jne         0044E955
 0044E93E    cmp         dword ptr [ebx+64],0
>0044E942    je          0044E955
 0044E944    mov         eax,dword ptr [ebx+64]
 0044E947    call        TMenuItem.GetAutoLineReduction
 0044E94C    and         eax,7F
 0044E94F    mov         al,byte ptr [eax+5ACCCC]
 0044E955    and         eax,7F
 0044E958    mov         al,byte ptr [eax+5ACCD0]
 0044E95E    pop         ebx
 0044E95F    ret
*}
end;

//0044E960
constructor TMenu.Create(AOwner:TComponent);
begin
{*
 0044E960    push        ebp
 0044E961    mov         ebp,esp
 0044E963    push        ecx
 0044E964    push        ebx
 0044E965    push        esi
 0044E966    push        edi
 0044E967    test        dl,dl
>0044E969    je          0044E973
 0044E96B    add         esp,0FFFFFFF0
 0044E96E    call        @ClassCreate
 0044E973    mov         edi,ecx
 0044E975    mov         byte ptr [ebp-1],dl
 0044E978    mov         ebx,eax
 0044E97A    mov         ecx,ebx
 0044E97C    mov         dl,1
 0044E97E    mov         eax,[0044A154];TMenuItem
 0044E983    call        TMenuItem.Create
 0044E988    mov         esi,eax
 0044E98A    mov         dword ptr [ebx+34],esi
 0044E98D    mov         dword ptr [esi+84],ebx
 0044E993    mov         eax,dword ptr [ebx]
 0044E995    mov         eax,dword ptr [eax+38]
 0044E998    mov         dword ptr [esi+80],eax
 0044E99E    mov         dword ptr [esi+70],ebx
 0044E9A1    mov         dl,1
 0044E9A3    mov         eax,[004486E4];TChangeLink
 0044E9A8    call        TObject.Create
 0044E9AD    mov         esi,eax
 0044E9AF    mov         dword ptr [ebx+44],esi
 0044E9B2    mov         dword ptr [esi+0C],ebx
 0044E9B5    mov         dword ptr [esi+8],44F278;TMenu.ImageListChange
 0044E9BC    mov         byte ptr [ebx+41],1
 0044E9C0    mov         ecx,edi
 0044E9C2    xor         edx,edx
 0044E9C4    mov         eax,ebx
 0044E9C6    call        TComponent.Create
 0044E9CB    mov         eax,dword ptr [ebx+34]
 0044E9CE    mov         byte ptr [eax+3B],0
 0044E9D2    mov         byte ptr [eax+3C],0
 0044E9D6    mov         eax,ebx
 0044E9D8    call        TMenu.ParentBiDiModeChanged
 0044E9DD    mov         eax,ebx
 0044E9DF    cmp         byte ptr [ebp-1],0
>0044E9E3    je          0044E9F4
 0044E9E5    call        @AfterConstruction
 0044E9EA    pop         dword ptr fs:[0]
 0044E9F1    add         esp,0C
 0044E9F4    mov         eax,ebx
 0044E9F6    pop         edi
 0044E9F7    pop         esi
 0044E9F8    pop         ebx
 0044E9F9    pop         ecx
 0044E9FA    pop         ebp
 0044E9FB    ret
*}
end;

//0044E9FC
destructor TMenu.Destroy;
begin
{*
 0044E9FC    push        ebx
 0044E9FD    push        esi
 0044E9FE    call        @BeforeDestruction
 0044EA03    mov         ebx,edx
 0044EA05    mov         esi,eax
 0044EA07    mov         eax,dword ptr [esi+34]
 0044EA0A    call        TObject.Free
 0044EA0F    mov         eax,dword ptr [esi+44]
 0044EA12    call        TObject.Free
 0044EA17    mov         edx,ebx
 0044EA19    and         dl,0FC
 0044EA1C    mov         eax,esi
 0044EA1E    call        TComponent.Destroy
 0044EA23    test        bl,bl
>0044EA25    jle         0044EA2E
 0044EA27    mov         eax,esi
 0044EA29    call        @ClassDestroy
 0044EA2E    pop         esi
 0044EA2F    pop         ebx
 0044EA30    ret
*}
end;

//0044EA34
procedure TMenu.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 0044EA34    push        ebp
 0044EA35    mov         ebp,esp
 0044EA37    push        esi
 0044EA38    push        dword ptr [ebp+0C]
 0044EA3B    push        dword ptr [ebp+8]
 0044EA3E    mov         eax,dword ptr [eax+34]
 0044EA41    mov         si,0FFFD
 0044EA45    call        @CallDynaInst
 0044EA4A    pop         esi
 0044EA4B    pop         ebp
 0044EA4C    ret         8
*}
end;

//0044EA50
function TMenu.GetHandle:HMENU;
begin
{*
 0044EA50    mov         eax,dword ptr [eax+34]
 0044EA53    call        TMenuItem.GetHandle
 0044EA58    ret
*}
end;

//0044EA5C
procedure TMenu.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 0044EA5C    push        esi
 0044EA5D    mov         esi,eax
 0044EA5F    mov         eax,dword ptr [esi+34]
 0044EA62    mov         si,0FFF9
 0044EA66    call        @CallDynaInst
 0044EA6B    pop         esi
 0044EA6C    ret
*}
end;

//0044EA70
function UpdateItem(MenuItem:TMenuItem):Boolean;
begin
{*
 0044EA70    push        ebx
 0044EA71    push        esi
 0044EA72    mov         esi,eax
 0044EA74    xor         ebx,ebx
 0044EA76    mov         eax,44EA70;UpdateItem:Boolean
 0044EA7B    mov         ecx,esi
 0044EA7D    mov         edx,dword ptr [esi+68]
 0044EA80    call        IterateMenus
 0044EA85    push        1
 0044EA87    mov         ecx,esi
 0044EA89    mov         edx,esi
 0044EA8B    mov         eax,esi
 0044EA8D    call        TMenuItem.SubItemChanged
 0044EA92    mov         eax,ebx
 0044EA94    pop         esi
 0044EA95    pop         ebx
 0044EA96    ret
*}
end;

//0044EA98
procedure TMenu.UpdateItems;
begin
{*
 0044EA98    push        ebx
 0044EA99    mov         ecx,44EA70;UpdateItem:Boolean
 0044EA9E    mov         edx,dword ptr [eax+34]
 0044EAA1    mov         ebx,dword ptr [edx+68]
 0044EAA4    mov         eax,edx
 0044EAA6    xchg        eax,ecx
 0044EAA7    mov         edx,ebx
 0044EAA9    call        IterateMenus
 0044EAAE    pop         ebx
 0044EAAF    ret
*}
end;

//0044EAB0
function Find(Item:TMenuItem):Boolean;
begin
{*
 0044EAB0    push        ebp
 0044EAB1    mov         ebp,esp
 0044EAB3    push        ecx
 0044EAB4    push        ebx
 0044EAB5    push        esi
 0044EAB6    push        edi
 0044EAB7    mov         ebx,eax
 0044EAB9    mov         byte ptr [ebp-1],0
 0044EABD    mov         eax,dword ptr [ebp+8]
 0044EAC0    cmp         byte ptr [eax-1],0
>0044EAC4    jne         0044EAD4
 0044EAC6    mov         eax,dword ptr [ebp+8]
 0044EAC9    mov         eax,dword ptr [eax-8]
 0044EACC    movzx       edx,word ptr [ebx+50]
 0044EAD0    cmp         eax,edx
>0044EAD2    je          0044EAFF
 0044EAD4    mov         eax,dword ptr [ebp+8]
 0044EAD7    cmp         byte ptr [eax-1],1
>0044EADB    jne         0044EAE8
 0044EADD    mov         eax,dword ptr [ebp+8]
 0044EAE0    mov         eax,dword ptr [eax-8]
 0044EAE3    cmp         eax,dword ptr [ebx+34]
>0044EAE6    je          0044EAFF
 0044EAE8    mov         eax,dword ptr [ebp+8]
 0044EAEB    cmp         byte ptr [eax-1],2
>0044EAEF    jne         0044EB0B
 0044EAF1    mov         eax,dword ptr [ebp+8]
 0044EAF4    mov         eax,dword ptr [eax-8]
 0044EAF7    movzx       edx,word ptr [ebx+60]
 0044EAFB    cmp         eax,edx
>0044EAFD    jne         0044EB0B
 0044EAFF    mov         eax,dword ptr [ebp+8]
 0044EB02    mov         dword ptr [eax-0C],ebx
 0044EB05    mov         byte ptr [ebp-1],1
>0044EB09    jmp         0044EB3D
 0044EB0B    mov         eax,ebx
 0044EB0D    call        TMenuItem.GetCount
 0044EB12    mov         esi,eax
 0044EB14    dec         esi
 0044EB15    test        esi,esi
>0044EB17    jl          0044EB3D
 0044EB19    inc         esi
 0044EB1A    xor         edi,edi
 0044EB1C    mov         eax,dword ptr [ebp+8]
 0044EB1F    push        eax
 0044EB20    mov         edx,edi
 0044EB22    mov         eax,ebx
 0044EB24    call        TMenuItem.GetItem
 0044EB29    call        Find
 0044EB2E    pop         ecx
 0044EB2F    test        al,al
>0044EB31    je          0044EB39
 0044EB33    mov         byte ptr [ebp-1],1
>0044EB37    jmp         0044EB3D
 0044EB39    inc         edi
 0044EB3A    dec         esi
>0044EB3B    jne         0044EB1C
 0044EB3D    mov         al,byte ptr [ebp-1]
 0044EB40    pop         edi
 0044EB41    pop         esi
 0044EB42    pop         ebx
 0044EB43    pop         ecx
 0044EB44    pop         ebp
 0044EB45    ret
*}
end;

//0044EB48
function TMenu.FindItem(Value:Integer; Kind:TFindItemKind):TMenuItem;
begin
{*
 0044EB48    push        ebp
 0044EB49    mov         ebp,esp
 0044EB4B    add         esp,0FFFFFFF4
 0044EB4E    push        ebx
 0044EB4F    mov         byte ptr [ebp-1],cl
 0044EB52    mov         dword ptr [ebp-8],edx
 0044EB55    xor         edx,edx
 0044EB57    mov         dword ptr [ebp-0C],edx
 0044EB5A    mov         ecx,44EAB0;Find:Boolean
 0044EB5F    mov         edx,dword ptr [eax+34]
 0044EB62    mov         ebx,dword ptr [edx+68]
 0044EB65    mov         eax,edx
 0044EB67    xchg        eax,ecx
 0044EB68    mov         edx,ebx
 0044EB6A    call        IterateMenus
 0044EB6F    mov         eax,dword ptr [ebp-0C]
 0044EB72    pop         ebx
 0044EB73    mov         esp,ebp
 0044EB75    pop         ebp
 0044EB76    ret
*}
end;

//0044EB78
function TMenu.GetHelpContext(Value:Integer; ByCommand:Boolean):THelpContext;
begin
{*
 0044EB78    push        ebx
 0044EB79    push        esi
 0044EB7A    push        edi
 0044EB7B    push        ebp
 0044EB7C    push        ecx
 0044EB7D    mov         byte ptr [esp],cl
 0044EB80    mov         ebp,edx
 0044EB82    mov         esi,eax
 0044EB84    xor         edi,edi
 0044EB86    mov         bl,1
 0044EB88    cmp         byte ptr [esp],0
>0044EB8C    je          0044EB90
 0044EB8E    xor         ebx,ebx
 0044EB90    cmp         bl,1
>0044EB93    jne         0044EBBC
 0044EB95    mov         eax,esi
 0044EB97    mov         edx,dword ptr ds:[44A950];TPopupMenu
 0044EB9D    call        @IsClass
 0044EBA2    test        al,al
>0044EBA4    je          0044EBBC
 0044EBA6    mov         eax,esi
 0044EBA8    mov         edx,dword ptr [eax]
 0044EBAA    call        dword ptr [edx+34]
 0044EBAD    cmp         ebp,eax
>0044EBAF    jne         0044EBBC
 0044EBB1    mov         eax,esi
 0044EBB3    call        TPopupMenu.GetHelpContext
 0044EBB8    mov         edi,eax
>0044EBBA    jmp         0044EBDD
 0044EBBC    mov         ecx,ebx
 0044EBBE    mov         edx,ebp
 0044EBC0    mov         eax,esi
 0044EBC2    call        TMenu.FindItem
>0044EBC7    jmp         0044EBCC
 0044EBC9    mov         eax,dword ptr [eax+64]
 0044EBCC    test        eax,eax
>0044EBCE    je          0044EBD6
 0044EBD0    cmp         dword ptr [eax+54],0
>0044EBD4    je          0044EBC9
 0044EBD6    test        eax,eax
>0044EBD8    je          0044EBDD
 0044EBDA    mov         edi,dword ptr [eax+54]
 0044EBDD    mov         eax,edi
 0044EBDF    pop         edx
 0044EBE0    pop         ebp
 0044EBE1    pop         edi
 0044EBE2    pop         esi
 0044EBE3    pop         ebx
 0044EBE4    ret
*}
end;

//0044EBE8
function TMenu.DispatchCommand(ACommand:Word):Boolean;
begin
{*
 0044EBE8    push        ebx
 0044EBE9    xor         ebx,ebx
 0044EBEB    movzx       edx,dx
 0044EBEE    xor         ecx,ecx
 0044EBF0    call        TMenu.FindItem
 0044EBF5    test        eax,eax
>0044EBF7    je          0044EC00
 0044EBF9    mov         edx,dword ptr [eax]
 0044EBFB    call        dword ptr [edx+44]
 0044EBFE    mov         bl,1
 0044EC00    mov         eax,ebx
 0044EC02    pop         ebx
 0044EC03    ret
*}
end;

//0044EC04
function TMenu.DispatchPopup(AHandle:HMENU):Boolean;
begin
{*
 0044EC04    push        ebx
 0044EC05    push        esi
 0044EC06    push        edi
 0044EC07    mov         esi,eax
 0044EC09    xor         ebx,ebx
 0044EC0B    mov         cl,1
 0044EC0D    mov         eax,esi
 0044EC0F    call        TMenu.FindItem
 0044EC14    mov         edi,eax
 0044EC16    test        edi,edi
>0044EC18    je          0044ECA4
 0044EC1E    test        byte ptr [edi+1C],10
>0044EC22    jne         0044EC2B
 0044EC24    mov         eax,edi
 0044EC26    call        TMenuItem.InitiateActions
 0044EC2B    mov         eax,edi
 0044EC2D    mov         edx,dword ptr [eax]
 0044EC2F    call        dword ptr [edx+44]
 0044EC32    xor         edx,edx
 0044EC34    mov         eax,edi
 0044EC36    call        TMenuItem.InternalRethinkHotkeys
 0044EC3B    mov         ebx,eax
 0044EC3D    xor         edx,edx
 0044EC3F    mov         eax,edi
 0044EC41    call        TMenuItem.InternalRethinkLines
 0044EC46    or          bl,al
 0044EC48    test        bl,bl
>0044EC4A    je          0044EC53
 0044EC4C    mov         eax,edi
 0044EC4E    call        TMenuItem.RebuildHandle
 0044EC53    mov         eax,[005AE584];^Application:TApplication
 0044EC58    mov         eax,dword ptr [eax]
 0044EC5A    mov         eax,dword ptr [eax+44]
 0044EC5D    test        eax,eax
>0044EC5F    je          0044ECA0
 0044EC61    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 0044EC67    mov         ebx,eax
 0044EC69    cmp         byte ptr [ebx+22F],2
>0044EC70    jne         0044ECA0
 0044EC72    cmp         edi,dword ptr [ebx+258]
>0044EC78    jne         0044ECA0
 0044EC7A    push        0
 0044EC7C    push        0
 0044EC7E    push        234
 0044EC83    mov         eax,dword ptr [ebx+254]
 0044EC89    push        eax
 0044EC8A    call        user32.SendMessageA
 0044EC8F    test        eax,eax
>0044EC91    je          0044ECA0
 0044EC93    mov         eax,ebx
 0044EC95    call        TWinControl.GetHandle
 0044EC9A    push        eax
 0044EC9B    call        user32.DrawMenuBar
 0044ECA0    mov         bl,1
>0044ECA2    jmp         0044ECC3
 0044ECA4    test        byte ptr [esi+1C],10
>0044ECA8    jne         0044ECC3
 0044ECAA    mov         eax,esi
 0044ECAC    mov         edx,dword ptr ds:[44A950];TPopupMenu
 0044ECB2    call        @IsClass
 0044ECB7    test        al,al
>0044ECB9    je          0044ECC3
 0044ECBB    mov         eax,dword ptr [esi+34]
 0044ECBE    call        TMenuItem.InitiateActions
 0044ECC3    mov         eax,ebx
 0044ECC5    pop         edi
 0044ECC6    pop         esi
 0044ECC7    pop         ebx
 0044ECC8    ret
*}
end;

//0044ECCC
function TMenu.IsOwnerDraw:Boolean;
begin
{*
 0044ECCC    cmp         byte ptr [eax+40],0
>0044ECD0    jne         0044ECDB
 0044ECD2    cmp         dword ptr [eax+48],0
>0044ECD6    jne         0044ECDB
 0044ECD8    xor         eax,eax
 0044ECDA    ret
 0044ECDB    mov         al,1
 0044ECDD    ret
*}
end;

//0044ECE0
function NthParentOf(Item:TMenuItem; N:Integer):TMenuItem;
begin
{*
>0044ECE0    jmp         0044ECE6
 0044ECE2    mov         eax,dword ptr [eax+64]
 0044ECE5    dec         edx
 0044ECE6    test        edx,edx
>0044ECE8    jle         0044ECEE
 0044ECEA    test        eax,eax
>0044ECEC    jne         0044ECE2
 0044ECEE    ret
*}
end;

//0044ECF0
function DoClick(var Item:TMenuItem; Level:Integer):TClickResult;
begin
{*
 0044ECF0    push        ebp
 0044ECF1    mov         ebp,esp
 0044ECF3    add         esp,0FFFFFFF8
 0044ECF6    push        ebx
 0044ECF7    push        esi
 0044ECF8    push        edi
 0044ECF9    mov         esi,edx
 0044ECFB    mov         ebx,eax
 0044ECFD    mov         byte ptr [ebp-1],1
 0044ED01    mov         eax,dword ptr [ebx]
 0044ED03    mov         eax,dword ptr [eax+64]
 0044ED06    mov         dword ptr [ebp-8],eax
 0044ED09    cmp         dword ptr [ebp-8],0
>0044ED0D    je          0044ED22
 0044ED0F    mov         eax,dword ptr [ebp+8]
 0044ED12    push        eax
 0044ED13    lea         edx,[esi+1]
 0044ED16    lea         eax,[ebp-8]
 0044ED19    call        DoClick
 0044ED1E    pop         ecx
 0044ED1F    mov         byte ptr [ebp-1],al
 0044ED22    mov         al,byte ptr [ebp-1]
 0044ED25    test        al,al
>0044ED27    je          0044EE37
 0044ED2D    sub         al,3
>0044ED2F    je          0044EE37
 0044ED35    cmp         byte ptr [ebp-1],2
>0044ED39    jne         0044EDB1
 0044ED3B    mov         eax,dword ptr [ebp+8]
 0044ED3E    cmp         dword ptr [eax-4],0
>0044ED42    je          0044ED57
 0044ED44    mov         eax,dword ptr [ebp+8]
 0044ED47    mov         eax,dword ptr [eax-4]
 0044ED4A    mov         ax,word ptr [eax+60]
 0044ED4E    mov         edx,dword ptr [ebp+8]
 0044ED51    cmp         ax,word ptr [edx-6]
>0044ED55    je          0044ED83
 0044ED57    mov         eax,dword ptr [ebp+8]
 0044ED5A    movzx       edx,word ptr [eax-6]
 0044ED5E    mov         eax,dword ptr [ebp+8]
 0044ED61    mov         eax,dword ptr [eax-0C]
 0044ED64    mov         cl,2
 0044ED66    call        TMenu.FindItem
 0044ED6B    mov         edx,dword ptr [ebp+8]
 0044ED6E    mov         dword ptr [edx-4],eax
 0044ED71    mov         eax,dword ptr [ebp+8]
 0044ED74    cmp         dword ptr [eax-4],0
>0044ED78    jne         0044ED83
 0044ED7A    mov         byte ptr [ebp-1],3
>0044ED7E    jmp         0044EE37
 0044ED83    mov         eax,dword ptr [ebp+8]
 0044ED86    mov         eax,dword ptr [eax-4]
 0044ED89    mov         edx,esi
 0044ED8B    call        NthParentOf
 0044ED90    mov         dword ptr [ebx],eax
 0044ED92    cmp         dword ptr [ebx],0
>0044ED95    je          0044EE37
 0044ED9B    mov         eax,dword ptr [ebx]
 0044ED9D    mov         eax,dword ptr [eax+64]
 0044EDA0    cmp         eax,dword ptr [ebp-8]
>0044EDA3    jne         0044EE37
 0044EDA9    test        esi,esi
>0044EDAB    jne         0044EDB1
 0044EDAD    mov         byte ptr [ebp-1],1
 0044EDB1    mov         eax,dword ptr [ebx]
 0044EDB3    cmp         byte ptr [eax+39],0
>0044EDB7    je          0044EE33
 0044EDB9    xor         eax,eax
 0044EDBB    push        ebp
 0044EDBC    push        44EE15
 0044EDC1    push        dword ptr fs:[eax]
 0044EDC4    mov         dword ptr fs:[eax],esp
 0044EDC7    mov         eax,dword ptr [ebp+8]
 0044EDCA    mov         eax,dword ptr [eax-0C]
 0044EDCD    test        byte ptr [eax+1C],10
>0044EDD1    jne         0044EDDA
 0044EDD3    mov         eax,dword ptr [ebx]
 0044EDD5    call        TMenuItem.InitiateActions
 0044EDDA    mov         eax,dword ptr [ebx]
 0044EDDC    mov         edx,dword ptr [eax]
 0044EDDE    call        dword ptr [edx+44]
 0044EDE1    mov         eax,dword ptr [ebp+8]
 0044EDE4    cmp         dword ptr [eax-4],0
>0044EDE8    je          0044EE07
 0044EDEA    mov         eax,dword ptr [ebx]
 0044EDEC    mov         edx,dword ptr [ebp+8]
 0044EDEF    cmp         eax,dword ptr [edx-4]
>0044EDF2    je          0044EE0B
 0044EDF4    mov         eax,dword ptr [ebp+8]
 0044EDF7    mov         eax,dword ptr [eax-4]
 0044EDFA    mov         ax,word ptr [eax+60]
 0044EDFE    mov         edx,dword ptr [ebp+8]
 0044EE01    cmp         ax,word ptr [edx-6]
>0044EE05    je          0044EE0B
 0044EE07    mov         byte ptr [ebp-1],2
 0044EE0B    xor         eax,eax
 0044EE0D    pop         edx
 0044EE0E    pop         ecx
 0044EE0F    pop         ecx
 0044EE10    mov         dword ptr fs:[eax],edx
>0044EE13    jmp         0044EE37
>0044EE15    jmp         @HandleAnyException
 0044EE1A    mov         eax,dword ptr [ebp+8]
 0044EE1D    mov         edx,dword ptr [eax-0C]
 0044EE20    mov         eax,[005AE584];^Application:TApplication
 0044EE25    mov         eax,dword ptr [eax]
 0044EE27    call        TApplication.HandleException
 0044EE2C    call        @DoneExcept
>0044EE31    jmp         0044EE37
 0044EE33    mov         byte ptr [ebp-1],0
 0044EE37    mov         al,byte ptr [ebp-1]
 0044EE3A    pop         edi
 0044EE3B    pop         esi
 0044EE3C    pop         ebx
 0044EE3D    pop         ecx
 0044EE3E    pop         ecx
 0044EE3F    pop         ebp
 0044EE40    ret
*}
end;

//0044EE44
procedure TMenu.IsShortCut(var Message:TWMKey);
begin
{*
 0044EE44    push        ebp
 0044EE45    mov         ebp,esp
 0044EE47    add         esp,0FFFFFFEC
 0044EE4A    push        ebx
 0044EE4B    mov         ebx,edx
 0044EE4D    mov         dword ptr [ebp-0C],eax
 0044EE50    xor         eax,eax
 0044EE52    xor         edx,edx
 0044EE54    mov         dl,byte ptr [ebx+4]
 0044EE57    mov         word ptr [ebp-6],dx
 0044EE5B    cmp         word ptr [ebp-6],0
>0044EE60    je          0044EF5B
 0044EE66    push        10
 0044EE68    call        user32.GetKeyState
 0044EE6D    test        ax,ax
>0044EE70    jge         0044EE78
 0044EE72    add         word ptr [ebp-6],2000
 0044EE78    push        11
 0044EE7A    call        user32.GetKeyState
 0044EE7F    test        ax,ax
>0044EE82    jge         0044EE8A
 0044EE84    add         word ptr [ebp-6],4000
 0044EE8A    test        byte ptr [ebx+0B],20
>0044EE8E    je          0044EE96
 0044EE90    add         word ptr [ebp-6],8000
 0044EE96    mov         eax,dword ptr [ebp-0C]
 0044EE99    mov         eax,dword ptr [eax+34]
 0044EE9C    mov         dword ptr [ebp-14],eax
 0044EE9F    lea         edx,[ebp-14]
 0044EEA2    mov         eax,[005E0CA0];ShortCutItems:TMenuItemStack
 0044EEA7    call        TOrderedList.Push
 0044EEAC    xor         eax,eax
 0044EEAE    push        ebp
 0044EEAF    push        44EF42
 0044EEB4    push        dword ptr fs:[eax]
 0044EEB7    mov         dword ptr fs:[eax],esp
 0044EEBA    mov         byte ptr [ebp-0D],0
 0044EEBE    movzx       edx,word ptr [ebp-6]
 0044EEC2    mov         cl,2
 0044EEC4    mov         eax,dword ptr [ebp-0C]
 0044EEC7    call        TMenu.FindItem
 0044EECC    mov         dword ptr [ebp-4],eax
 0044EECF    cmp         dword ptr [ebp-4],0
>0044EED3    je          0044EF1E
 0044EED5    lea         edx,[ebp-4]
 0044EED8    mov         eax,[005E0CA0];ShortCutItems:TMenuItemStack
 0044EEDD    call        TOrderedList.Push
 0044EEE2    xor         eax,eax
 0044EEE4    push        ebp
 0044EEE5    push        44EF17
 0044EEEA    push        dword ptr fs:[eax]
 0044EEED    mov         dword ptr fs:[eax],esp
 0044EEF0    push        ebp
 0044EEF1    lea         eax,[ebp-4]
 0044EEF4    xor         edx,edx
 0044EEF6    call        DoClick
 0044EEFB    pop         ecx
 0044EEFC    mov         byte ptr [ebp-0D],al
 0044EEFF    xor         eax,eax
 0044EF01    pop         edx
 0044EF02    pop         ecx
 0044EF03    pop         ecx
 0044EF04    mov         dword ptr fs:[eax],edx
 0044EF07    push        44EF1E
 0044EF0C    mov         eax,[005E0CA0];ShortCutItems:TMenuItemStack
 0044EF11    call        TOrderedList.Pop
 0044EF16    ret
>0044EF17    jmp         @HandleFinally
>0044EF1C    jmp         0044EF0C
 0044EF1E    cmp         dword ptr [ebp-14],0
>0044EF22    je          0044EF2A
 0044EF24    cmp         byte ptr [ebp-0D],2
>0044EF28    je          0044EEBA
 0044EF2A    xor         eax,eax
 0044EF2C    pop         edx
 0044EF2D    pop         ecx
 0044EF2E    pop         ecx
 0044EF2F    mov         dword ptr fs:[eax],edx
 0044EF32    push        44EF49
 0044EF37    mov         eax,[005E0CA0];ShortCutItems:TMenuItemStack
 0044EF3C    call        TOrderedList.Pop
 0044EF41    ret
>0044EF42    jmp         @HandleFinally
>0044EF47    jmp         0044EF37
 0044EF49    cmp         dword ptr [ebp-4],0
>0044EF4D    jne         0044EF59
 0044EF4F    cmp         dword ptr [ebp-14],0
>0044EF53    je          0044EF59
 0044EF55    xor         eax,eax
>0044EF57    jmp         0044EF5B
 0044EF59    mov         al,1
 0044EF5B    pop         ebx
 0044EF5C    mov         esp,ebp
 0044EF5E    pop         ebp
 0044EF5F    ret
*}
end;

//0044EF60
procedure TMainMenu.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 0044EF60    mov         al,byte ptr [eax+41];TMainMenu.FParentBiDiMode:Boolean
 0044EF63    xor         al,1
 0044EF65    ret
*}
end;

//0044EF68
procedure TMenu.DoBiDiModeChanged;
begin
{*
 0044EF68    push        ebx
 0044EF69    push        esi
 0044EF6A    add         esp,0FFFFFF80
 0044EF6D    mov         ebx,eax
 0044EF6F    mov         eax,[005AE810];^SysLocale:TSysLocale
 0044EF74    cmp         byte ptr [eax+0D],0
>0044EF78    je          0044F01A
 0044EF7E    cmp         dword ptr [ebx+38],0
>0044EF82    je          0044F01A
 0044EF88    mov         eax,ebx
 0044EF8A    mov         edx,dword ptr [eax]
 0044EF8C    call        dword ptr [edx+34]
 0044EF8F    mov         esi,eax
 0044EF91    mov         dword ptr [esp],2C
 0044EF98    mov         dword ptr [esp+4],10
 0044EFA0    lea         eax,[esp+30]
 0044EFA4    mov         dword ptr [esp+24],eax
 0044EFA8    mov         dword ptr [esp+28],50
 0044EFB0    push        esp
 0044EFB1    push        0FF
 0044EFB3    push        0
 0044EFB5    push        esi
 0044EFB6    call        user32.GetMenuItemInfoA
 0044EFBB    test        eax,eax
>0044EFBD    je          0044F01A
 0044EFBF    mov         eax,ebx
 0044EFC1    call        TMenu.IsRightToLeft
 0044EFC6    mov         edx,dword ptr [esp+8]
 0044EFCA    and         edx,6000
 0044EFD0    cmp         edx,1
 0044EFD3    sbb         edx,edx
 0044EFD5    inc         edx
 0044EFD6    cmp         al,dl
>0044EFD8    je          0044F01A
 0044EFDA    mov         eax,ebx
 0044EFDC    call        TMenu.IsRightToLeft
 0044EFE1    and         eax,7F
 0044EFE4    shl         eax,0D
 0044EFE7    lea         eax,[eax+eax*2]
 0044EFEA    mov         edx,dword ptr [esp+8]
 0044EFEE    and         edx,0FFFF9FFF
 0044EFF4    or          eax,edx
 0044EFF6    mov         dword ptr [esp+8],eax
 0044EFFA    mov         dword ptr [esp+4],10
 0044F002    push        esp
 0044F003    push        0FF
 0044F005    push        0
 0044F007    push        esi
 0044F008    call        user32.SetMenuItemInfoA
 0044F00D    test        eax,eax
>0044F00F    je          0044F01A
 0044F011    mov         eax,dword ptr [ebx+38]
 0044F014    push        eax
 0044F015    call        user32.DrawMenuBar
 0044F01A    add         esp,80
 0044F020    pop         esi
 0044F021    pop         ebx
 0044F022    ret
*}
end;

//0044F024
procedure BuildImage(Menu:HMENU);
begin
{*
 0044F024    push        ebp
 0044F025    mov         ebp,esp
 0044F027    add         esp,0FFFFFFF4
 0044F02A    push        ebx
 0044F02B    push        esi
 0044F02C    mov         dword ptr [ebp-4],eax
 0044F02F    mov         eax,dword ptr [ebp-4]
 0044F032    push        eax
 0044F033    call        user32.GetMenuItemCount
 0044F038    mov         dword ptr [ebp-0C],eax
 0044F03B    mov         eax,dword ptr [ebp+8]
 0044F03E    lea         ebx,[eax-200]
 0044F044    mov         eax,dword ptr [ebp+8]
 0044F047    add         eax,0FFFFFFFB
 0044F04A    mov         dword ptr [ebp-8],eax
 0044F04D    xor         esi,esi
>0044F04F    jmp         0044F0B1
 0044F051    push        ebx
 0044F052    mov         eax,dword ptr [ebp-8]
 0044F055    sub         eax,ebx
 0044F057    push        eax
 0044F058    push        400
 0044F05D    mov         eax,dword ptr [ebp+8]
 0044F060    mov         eax,dword ptr [eax-204]
 0044F066    mov         ecx,esi
 0044F068    mov         edx,dword ptr [ebp-4]
 0044F06B    call        TMenu.DoGetMenuString
 0044F070    mov         eax,ebx
 0044F072    call        StrEnd
 0044F077    mov         ebx,eax
 0044F079    push        400
 0044F07E    push        esi
 0044F07F    mov         eax,dword ptr [ebp-4]
 0044F082    push        eax
 0044F083    call        user32.GetMenuState
 0044F088    test        al,2
>0044F08A    je          0044F093
 0044F08C    mov         byte ptr [ebx],24
 0044F08F    inc         ebx
 0044F090    mov         byte ptr [ebx],0
 0044F093    test        al,40
>0044F095    je          0044F09E
 0044F097    mov         byte ptr [ebx],40
 0044F09A    inc         ebx
 0044F09B    mov         byte ptr [ebx],0
 0044F09E    test        al,1
>0044F0A0    je          0044F0A9
 0044F0A2    mov         byte ptr [ebx],23
 0044F0A5    inc         ebx
 0044F0A6    mov         byte ptr [ebx],0
 0044F0A9    mov         byte ptr [ebx],3B
 0044F0AC    inc         ebx
 0044F0AD    mov         byte ptr [ebx],0
 0044F0B0    inc         esi
 0044F0B1    cmp         esi,dword ptr [ebp-0C]
>0044F0B4    jge         0044F0BB
 0044F0B6    cmp         ebx,dword ptr [ebp-8]
>0044F0B9    jb          0044F051
 0044F0BB    pop         esi
 0044F0BC    pop         ebx
 0044F0BD    mov         esp,ebp
 0044F0BF    pop         ebp
 0044F0C0    ret
*}
end;

//0044F0C4
function TMenu.UpdateImage:Boolean;
begin
{*
 0044F0C4    push        ebp
 0044F0C5    mov         ebp,esp
 0044F0C7    add         esp,0FFFFFDFC
 0044F0CD    push        ebx
 0044F0CE    mov         dword ptr [ebp-204],eax
 0044F0D4    xor         ebx,ebx
 0044F0D6    mov         byte ptr [ebp-200],0
 0044F0DD    mov         eax,dword ptr [ebp-204]
 0044F0E3    cmp         dword ptr [eax+38],0
>0044F0E7    je          0044F0FB
 0044F0E9    push        ebp
 0044F0EA    mov         eax,dword ptr [ebp-204]
 0044F0F0    mov         edx,dword ptr [eax]
 0044F0F2    call        dword ptr [edx+34]
 0044F0F5    call        BuildImage
 0044F0FA    pop         ecx
 0044F0FB    mov         eax,dword ptr [ebp-204]
 0044F101    cmp         dword ptr [eax+3C],0
>0044F105    je          0044F124
 0044F107    mov         eax,dword ptr [ebp-204]
 0044F10D    mov         eax,dword ptr [eax+3C]
 0044F110    call        @LStrToPChar
 0044F115    lea         edx,[ebp-200]
 0044F11B    call        StrComp
 0044F120    test        eax,eax
>0044F122    je          0044F13F
 0044F124    mov         bl,1
 0044F126    mov         eax,dword ptr [ebp-204]
 0044F12C    add         eax,3C
 0044F12F    lea         edx,[ebp-200]
 0044F135    mov         ecx,200
 0044F13A    call        @LStrFromArray
 0044F13F    mov         eax,ebx
 0044F141    pop         ebx
 0044F142    mov         esp,ebp
 0044F144    pop         ebp
 0044F145    ret
*}
end;

//0044F148
procedure TMenu.SetOwnerDraw(Value:Boolean);
begin
{*
 0044F148    cmp         dl,byte ptr [eax+40]
>0044F14B    je          0044F155
 0044F14D    mov         byte ptr [eax+40],dl
 0044F150    call        TMenu.UpdateItems
 0044F155    ret
*}
end;

//0044F158
procedure TMenu.AdjustBiDiBehavior;
begin
{*
 0044F158    push        ebp
 0044F159    mov         ebp,esp
 0044F15B    add         esp,0FFFFFFF8
 0044F15E    mov         dword ptr [ebp-4],eax
 0044F161    mov         eax,[005AE810];^SysLocale:TSysLocale
 0044F166    cmp         byte ptr [eax+0D],0
>0044F16A    je          0044F1CF
 0044F16C    mov         eax,dword ptr [ebp-4]
 0044F16F    mov         al,byte ptr [eax+30]
 0044F172    mov         byte ptr [ebp-5],al
 0044F175    mov         edx,dword ptr [ebp-4]
 0044F178    mov         dl,byte ptr [edx+41]
 0044F17B    mov         byte ptr [ebp-6],dl
 0044F17E    xor         edx,edx
 0044F180    push        ebp
 0044F181    push        44F1C8
 0044F186    push        dword ptr fs:[edx]
 0044F189    mov         dword ptr fs:[edx],esp
 0044F18C    test        al,al
>0044F18E    jne         0044F19C
 0044F190    mov         dl,1
 0044F192    mov         eax,dword ptr [ebp-4]
 0044F195    call        TMenu.SetBiDiMode
>0044F19A    jmp         0044F1A6
 0044F19C    xor         edx,edx
 0044F19E    mov         eax,dword ptr [ebp-4]
 0044F1A1    call        TMenu.SetBiDiMode
 0044F1A6    xor         eax,eax
 0044F1A8    pop         edx
 0044F1A9    pop         ecx
 0044F1AA    pop         ecx
 0044F1AB    mov         dword ptr fs:[eax],edx
 0044F1AE    push        44F1CF
 0044F1B3    mov         dl,byte ptr [ebp-5]
 0044F1B6    mov         eax,dword ptr [ebp-4]
 0044F1B9    call        TMenu.SetBiDiMode
 0044F1BE    mov         eax,dword ptr [ebp-4]
 0044F1C1    mov         dl,byte ptr [ebp-6]
 0044F1C4    mov         byte ptr [eax+41],dl
 0044F1C7    ret
>0044F1C8    jmp         @HandleFinally
>0044F1CD    jmp         0044F1B3
 0044F1CF    pop         ecx
 0044F1D0    pop         ecx
 0044F1D1    pop         ebp
 0044F1D2    ret
*}
end;

//0044F1D4
procedure TMenu.SetWindowHandle(Value:HWND);
begin
{*
 0044F1D4    push        ebx
 0044F1D5    push        esi
 0044F1D6    mov         esi,edx
 0044F1D8    mov         ebx,eax
 0044F1DA    mov         dword ptr [ebx+38],esi
 0044F1DD    mov         eax,ebx
 0044F1DF    call        TMenu.UpdateImage
 0044F1E4    mov         eax,[005AE810];^SysLocale:TSysLocale
 0044F1E9    cmp         byte ptr [eax+0D],0
>0044F1ED    je          0044F209
 0044F1EF    test        esi,esi
>0044F1F1    je          0044F209
 0044F1F3    cmp         byte ptr [ebx+41],0
>0044F1F7    je          0044F202
 0044F1F9    mov         eax,ebx
 0044F1FB    call        TMenu.ParentBiDiModeChanged
>0044F200    jmp         0044F209
 0044F202    mov         eax,ebx
 0044F204    call        TMenu.AdjustBiDiBehavior
 0044F209    pop         esi
 0044F20A    pop         ebx
 0044F20B    ret
*}
end;

//0044F20C
procedure TMenu.DoChange(Source:TMenuItem; Rebuild:Boolean);
begin
{*
 0044F20C    push        ebx
 0044F20D    cmp         word ptr [eax+52],0
>0044F212    je          0044F221
 0044F214    push        ecx
 0044F215    mov         ebx,eax
 0044F217    mov         ecx,edx
 0044F219    mov         edx,eax
 0044F21B    mov         eax,dword ptr [ebx+54]
 0044F21E    call        dword ptr [ebx+50]
 0044F221    pop         ebx
 0044F222    ret
*}
end;

//0044F224
procedure TMenu.Loaded;
begin
{*
 0044F224    push        ebx
 0044F225    mov         ebx,eax
 0044F227    mov         eax,ebx
 0044F229    call        TComponent.Loaded
 0044F22E    xor         ecx,ecx
 0044F230    xor         edx,edx
 0044F232    mov         eax,ebx
 0044F234    mov         ebx,dword ptr [eax]
 0044F236    call        dword ptr [ebx+30]
 0044F239    pop         ebx
 0044F23A    ret
*}
end;

//0044F23C
procedure TMenu.MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 0044F23C    push        ebp
 0044F23D    mov         ebp,esp
 0044F23F    push        ebx
 0044F240    push        esi
 0044F241    mov         esi,ecx
 0044F243    mov         ebx,eax
 0044F245    mov         ax,[0044F270]
 0044F24B    and         ax,word ptr [ebx+1C]
 0044F24F    mov         dx,word ptr ds:[44F274]
 0044F256    cmp         dx,ax
>0044F259    jne         0044F267
 0044F25B    mov         cl,byte ptr [ebp+8]
 0044F25E    mov         edx,esi
 0044F260    mov         eax,ebx
 0044F262    mov         ebx,dword ptr [eax]
 0044F264    call        dword ptr [ebx+30]
 0044F267    pop         esi
 0044F268    pop         ebx
 0044F269    pop         ebp
 0044F26A    ret         4
*}
end;

//0044F278
procedure TMenu.ImageListChange(Sender:TObject);
begin
{*
 0044F278    cmp         edx,dword ptr [eax+48]
>0044F27B    jne         0044F282
 0044F27D    call        TMenu.UpdateItems
 0044F282    ret
*}
end;

//0044F284
procedure TMenu.SetImages(Value:TCustomImageList);
begin
{*
 0044F284    push        ebx
 0044F285    push        esi
 0044F286    mov         esi,edx
 0044F288    mov         ebx,eax
 0044F28A    mov         eax,dword ptr [ebx+48]
 0044F28D    test        eax,eax
>0044F28F    je          0044F299
 0044F291    mov         edx,dword ptr [ebx+44]
 0044F294    call        TCustomImageList.UnRegisterChanges
 0044F299    mov         eax,esi
 0044F29B    mov         dword ptr [ebx+48],eax
 0044F29E    test        eax,eax
>0044F2A0    je          0044F2B4
 0044F2A2    mov         edx,dword ptr [ebx+44]
 0044F2A5    call        TCustomImageList.RegisterChanges
 0044F2AA    mov         edx,ebx
 0044F2AC    mov         eax,dword ptr [ebx+48]
 0044F2AF    call        TComponent.FreeNotification
 0044F2B4    mov         eax,ebx
 0044F2B6    call        TMenu.UpdateItems
 0044F2BB    pop         esi
 0044F2BC    pop         ebx
 0044F2BD    ret
*}
end;

//0044F2C0
procedure TMenu.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0044F2C0    push        ebx
 0044F2C1    push        esi
 0044F2C2    push        edi
 0044F2C3    mov         ebx,ecx
 0044F2C5    mov         esi,edx
 0044F2C7    mov         edi,eax
 0044F2C9    mov         ecx,ebx
 0044F2CB    mov         edx,esi
 0044F2CD    mov         eax,edi
 0044F2CF    call        TComponent.Notification
 0044F2D4    cmp         esi,dword ptr [edi+48]
>0044F2D7    jne         0044F2E7
 0044F2D9    cmp         bl,1
>0044F2DC    jne         0044F2E7
 0044F2DE    xor         edx,edx
 0044F2E0    mov         eax,edi
 0044F2E2    call        TMenu.SetImages
 0044F2E7    pop         edi
 0044F2E8    pop         esi
 0044F2E9    pop         ebx
 0044F2EA    ret
*}
end;

//0044F2EC
function TMenu.IsRightToLeft:Boolean;
begin
{*
 0044F2EC    mov         edx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0044F2F2    cmp         byte ptr [edx+0D],0
>0044F2F6    je          0044F2FE
 0044F2F8    cmp         byte ptr [eax+30],0
>0044F2FC    jne         0044F301
 0044F2FE    xor         eax,eax
 0044F300    ret
 0044F301    mov         al,1
 0044F303    ret
*}
end;

//0044F304
function IsAccelChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;
begin
{*
 0044F304    push        ebp
 0044F305    mov         ebp,esp
 0044F307    push        esi
 0044F308    xor         esi,esi
 0044F30A    test        dl,10
>0044F30D    je          0044F328
 0044F30F    push        ecx
 0044F310    push        eax
 0044F311    call        user32.GetSubMenu
 0044F316    mov         edx,dword ptr [ebp+0C]
 0044F319    mov         edx,dword ptr [edx-4]
 0044F31C    mov         cl,1
 0044F31E    xchg        eax,edx
 0044F31F    call        TMenu.FindItem
 0044F324    mov         esi,eax
>0044F326    jmp         0044F344
 0044F328    push        ecx
 0044F329    push        eax
 0044F32A    call        user32.GetMenuItemID
 0044F32F    cmp         eax,0FFFFFFFF
>0044F332    je          0044F344
 0044F334    mov         edx,dword ptr [ebp+0C]
 0044F337    mov         edx,dword ptr [edx-4]
 0044F33A    xor         ecx,ecx
 0044F33C    xchg        eax,edx
 0044F33D    call        TMenu.FindItem
 0044F342    mov         esi,eax
 0044F344    test        esi,esi
>0044F346    je          0044F357
 0044F348    xor         eax,eax
 0044F34A    mov         al,byte ptr [ebp+8]
 0044F34D    mov         edx,dword ptr [esi+30]
 0044F350    call        IsAccel
>0044F355    jmp         0044F359
 0044F357    xor         eax,eax
 0044F359    pop         esi
 0044F35A    pop         ebp
 0044F35B    ret         4
*}
end;

//0044F360
function IsInitialChar(Menu:HMENU; State:Word; I:Integer; C:Char):Boolean;
begin
{*
 0044F360    push        ebp
 0044F361    mov         ebp,esp
 0044F363    push        0
 0044F365    push        0
 0044F367    push        0
 0044F369    push        0
 0044F36B    push        ebx
 0044F36C    push        esi
 0044F36D    mov         esi,ecx
 0044F36F    mov         word ptr [ebp-2],dx
 0044F373    xor         edx,edx
 0044F375    push        ebp
 0044F376    push        44F435
 0044F37B    push        dword ptr fs:[edx]
 0044F37E    mov         dword ptr fs:[edx],esp
 0044F381    test        byte ptr [ebp-2],10
>0044F385    je          0044F3A0
 0044F387    push        esi
 0044F388    push        eax
 0044F389    call        user32.GetSubMenu
 0044F38E    mov         edx,dword ptr [ebp+0C]
 0044F391    mov         edx,dword ptr [edx-4]
 0044F394    mov         cl,1
 0044F396    xchg        eax,edx
 0044F397    call        TMenu.FindItem
 0044F39C    mov         ebx,eax
>0044F39E    jmp         0044F3CA
 0044F3A0    mov         edx,dword ptr [ebp+0C]
 0044F3A3    mov         edx,dword ptr [edx-4]
 0044F3A6    mov         cl,1
 0044F3A8    xchg        eax,edx
 0044F3A9    call        TMenu.FindItem
 0044F3AE    mov         ebx,eax
 0044F3B0    test        ebx,ebx
>0044F3B2    je          0044F3CA
 0044F3B4    mov         eax,ebx
 0044F3B6    call        TMenuItem.GetCount
 0044F3BB    cmp         esi,eax
>0044F3BD    jge         0044F3CA
 0044F3BF    mov         edx,esi
 0044F3C1    mov         eax,ebx
 0044F3C3    call        TMenuItem.GetItem
 0044F3C8    mov         ebx,eax
 0044F3CA    test        ebx,ebx
>0044F3CC    je          0044F418
 0044F3CE    cmp         dword ptr [ebx+30],0
>0044F3D2    je          0044F418
 0044F3D4    lea         eax,[ebp-8]
 0044F3D7    mov         dl,byte ptr [ebp+8]
 0044F3DA    call        @LStrFromChar
 0044F3DF    mov         eax,dword ptr [ebp-8]
 0044F3E2    push        eax
 0044F3E3    lea         eax,[ebp-0C]
 0044F3E6    mov         edx,dword ptr [ebx+30]
 0044F3E9    mov         dl,byte ptr [edx]
 0044F3EB    call        @LStrFromChar
 0044F3F0    mov         eax,dword ptr [ebp-0C]
 0044F3F3    pop         edx
 0044F3F4    call        AnsiCompareText
 0044F3F9    test        eax,eax
>0044F3FB    jne         0044F40E
 0044F3FD    lea         edx,[ebp-10]
 0044F400    mov         eax,dword ptr [ebx+30]
 0044F403    call        GetHotkey
 0044F408    cmp         dword ptr [ebp-10],0
>0044F40C    je          0044F412
 0044F40E    xor         eax,eax
>0044F410    jmp         0044F414
 0044F412    mov         al,1
 0044F414    mov         ebx,eax
>0044F416    jmp         0044F41A
 0044F418    xor         ebx,ebx
 0044F41A    xor         eax,eax
 0044F41C    pop         edx
 0044F41D    pop         ecx
 0044F41E    pop         ecx
 0044F41F    mov         dword ptr fs:[eax],edx
 0044F422    push        44F43C
 0044F427    lea         eax,[ebp-10]
 0044F42A    mov         edx,3
 0044F42F    call        @LStrArrayClr
 0044F434    ret
>0044F435    jmp         @HandleFinally
>0044F43A    jmp         0044F427
 0044F43C    mov         eax,ebx
 0044F43E    pop         esi
 0044F43F    pop         ebx
 0044F440    mov         esp,ebp
 0044F442    pop         ebp
 0044F443    ret         4
*}
end;

//0044F448
procedure TMenu.ProcessMenuChar(var Message:TWMMenuChar);
begin
{*
 0044F448    push        ebp
 0044F449    mov         ebp,esp
 0044F44B    add         esp,0FFFFFFE8
 0044F44E    push        ebx
 0044F44F    push        esi
 0044F450    push        edi
 0044F451    mov         ebx,edx
 0044F453    mov         dword ptr [ebp-4],eax
 0044F456    xor         eax,eax
 0044F458    mov         dword ptr [ebx+0C],eax
 0044F45B    mov         dword ptr [ebp-0C],0FFFFFFFF
 0044F462    mov         dword ptr [ebp-10],0FFFFFFFF
 0044F469    mov         dword ptr [ebp-14],0FFFFFFFF
 0044F470    mov         eax,dword ptr [ebx+8]
 0044F473    push        eax
 0044F474    call        user32.GetMenuItemCount
 0044F479    mov         dword ptr [ebp-8],eax
 0044F47C    mov         eax,dword ptr [ebp-8]
 0044F47F    dec         eax
 0044F480    test        eax,eax
>0044F482    jl          0044F4FB
 0044F484    inc         eax
 0044F485    mov         dword ptr [ebp-18],eax
 0044F488    xor         esi,esi
 0044F48A    push        400
 0044F48F    push        esi
 0044F490    mov         eax,dword ptr [ebx+8]
 0044F493    push        eax
 0044F494    call        user32.GetMenuState
 0044F499    mov         edi,eax
 0044F49B    push        ebp
 0044F49C    mov         al,byte ptr [ebx+4]
 0044F49F    push        eax
 0044F4A0    mov         eax,dword ptr [ebx+8]
 0044F4A3    mov         ecx,esi
 0044F4A5    mov         edx,edi
 0044F4A7    call        IsAccelChar
 0044F4AC    pop         ecx
 0044F4AD    test        al,al
>0044F4AF    je          0044F4F5
 0044F4B1    test        di,2
>0044F4B6    je          0044F4C7
 0044F4B8    cmp         dword ptr [ebp-0C],0
>0044F4BC    jge         0044F4F5
 0044F4BE    mov         dword ptr [ebp-0C],0FFFFFFFE
>0044F4C5    jmp         0044F4F5
 0044F4C7    cmp         dword ptr [ebp-0C],0
>0044F4CB    jge         0044F4D9
 0044F4CD    mov         dword ptr [ebp-0C],esi
 0044F4D0    mov         dword ptr [ebx+0C],2
>0044F4D7    jmp         0044F4E0
 0044F4D9    mov         dword ptr [ebx+0C],3
 0044F4E0    test        di,80
>0044F4E5    je          0044F4EC
 0044F4E7    mov         dword ptr [ebp-10],esi
>0044F4EA    jmp         0044F4F5
 0044F4EC    cmp         dword ptr [ebp-10],0
>0044F4F0    jl          0044F4F5
 0044F4F2    mov         dword ptr [ebp-14],esi
 0044F4F5    inc         esi
 0044F4F6    dec         dword ptr [ebp-18]
>0044F4F9    jne         0044F48A
 0044F4FB    cmp         dword ptr [ebp-0C],0FFFFFFFF
>0044F4FF    jge         0044F50D
 0044F501    mov         dword ptr [ebx+0C],10000
>0044F508    jmp         0044F5B9
 0044F50D    cmp         dword ptr [ebp-0C],0
>0044F511    jge         0044F58C
 0044F513    mov         eax,dword ptr [ebp-8]
 0044F516    dec         eax
 0044F517    test        eax,eax
>0044F519    jl          0044F58C
 0044F51B    inc         eax
 0044F51C    mov         dword ptr [ebp-18],eax
 0044F51F    xor         esi,esi
 0044F521    push        400
 0044F526    push        esi
 0044F527    mov         eax,dword ptr [ebx+8]
 0044F52A    push        eax
 0044F52B    call        user32.GetMenuState
 0044F530    mov         edi,eax
 0044F532    push        ebp
 0044F533    mov         al,byte ptr [ebx+4]
 0044F536    push        eax
 0044F537    mov         eax,dword ptr [ebx+8]
 0044F53A    mov         ecx,esi
 0044F53C    mov         edx,edi
 0044F53E    call        IsInitialChar
 0044F543    pop         ecx
 0044F544    test        al,al
>0044F546    je          0044F586
 0044F548    test        di,2
>0044F54D    je          0044F558
 0044F54F    mov         dword ptr [ebx+0C],10000
>0044F556    jmp         0044F5B9
 0044F558    cmp         dword ptr [ebp-0C],0
>0044F55C    jge         0044F56A
 0044F55E    mov         dword ptr [ebp-0C],esi
 0044F561    mov         dword ptr [ebx+0C],2
>0044F568    jmp         0044F571
 0044F56A    mov         dword ptr [ebx+0C],3
 0044F571    test        di,80
>0044F576    je          0044F57D
 0044F578    mov         dword ptr [ebp-10],esi
>0044F57B    jmp         0044F586
 0044F57D    cmp         dword ptr [ebp-10],0
>0044F581    jl          0044F586
 0044F583    mov         dword ptr [ebp-14],esi
 0044F586    inc         esi
 0044F587    dec         dword ptr [ebp-18]
>0044F58A    jne         0044F521
 0044F58C    mov         eax,dword ptr [ebx+0C]
 0044F58F    cmp         eax,2
>0044F592    jne         0044F59F
 0044F594    shl         eax,10
 0044F597    or          eax,dword ptr [ebp-0C]
 0044F59A    mov         dword ptr [ebx+0C],eax
>0044F59D    jmp         0044F5B9
 0044F59F    cmp         eax,3
>0044F5A2    jne         0044F5B9
 0044F5A4    cmp         dword ptr [ebp-14],0
>0044F5A8    jge         0044F5B0
 0044F5AA    mov         edx,dword ptr [ebp-0C]
 0044F5AD    mov         dword ptr [ebp-14],edx
 0044F5B0    shl         eax,10
 0044F5B3    or          eax,dword ptr [ebp-14]
 0044F5B6    mov         dword ptr [ebx+0C],eax
 0044F5B9    pop         edi
 0044F5BA    pop         esi
 0044F5BB    pop         ebx
 0044F5BC    mov         esp,ebp
 0044F5BE    pop         ebp
 0044F5BF    ret
*}
end;

//0044F5C0
function TMenu.DoGetMenuString(Menu:HMENU; ItemID:UINT; Str:PChar; MaxCount:Integer; Flag:UINT):Integer;
begin
{*
 0044F5C0    push        ebp
 0044F5C1    mov         ebp,esp
 0044F5C3    push        ecx
 0044F5C4    push        ebx
 0044F5C5    push        esi
 0044F5C6    push        edi
 0044F5C7    mov         esi,ecx
 0044F5C9    mov         edi,edx
 0044F5CB    mov         ebx,eax
 0044F5CD    mov         eax,ebx
 0044F5CF    call        TMenu.IsOwnerDraw
 0044F5D4    test        al,al
>0044F5D6    je          0044F64C
 0044F5D8    xor         eax,eax
 0044F5DA    mov         dword ptr [ebp-4],eax
 0044F5DD    mov         eax,dword ptr [ebp+8]
 0044F5E0    push        eax
 0044F5E1    push        esi
 0044F5E2    push        edi
 0044F5E3    call        user32.GetMenuState
 0044F5E8    test        al,10
>0044F5EA    je          0044F605
 0044F5EC    push        esi
 0044F5ED    push        edi
 0044F5EE    call        user32.GetSubMenu
 0044F5F3    mov         edi,eax
 0044F5F5    mov         cl,1
 0044F5F7    mov         edx,edi
 0044F5F9    mov         eax,ebx
 0044F5FB    call        TMenu.FindItem
 0044F600    mov         dword ptr [ebp-4],eax
>0044F603    jmp         0044F621
 0044F605    push        esi
 0044F606    push        edi
 0044F607    call        user32.GetMenuItemID
 0044F60C    mov         esi,eax
 0044F60E    cmp         esi,0FFFFFFFF
>0044F611    je          0044F621
 0044F613    xor         ecx,ecx
 0044F615    mov         edx,esi
 0044F617    mov         eax,ebx
 0044F619    call        TMenu.FindItem
 0044F61E    mov         dword ptr [ebp-4],eax
 0044F621    cmp         dword ptr [ebp-4],0
>0044F625    je          0044F648
 0044F627    mov         eax,dword ptr [ebp+10]
 0044F62A    mov         byte ptr [eax],0
 0044F62D    mov         eax,dword ptr [ebp-4]
 0044F630    mov         edx,dword ptr [eax+30]
 0044F633    mov         ecx,dword ptr [ebp+0C]
 0044F636    mov         eax,dword ptr [ebp+10]
 0044F639    call        StrPLCopy
 0044F63E    mov         eax,dword ptr [ebp+10]
 0044F641    call        StrLen
>0044F646    jmp         0044F65F
 0044F648    xor         eax,eax
>0044F64A    jmp         0044F65F
 0044F64C    mov         eax,dword ptr [ebp+8]
 0044F64F    push        eax
 0044F650    mov         eax,dword ptr [ebp+0C]
 0044F653    push        eax
 0044F654    mov         eax,dword ptr [ebp+10]
 0044F657    push        eax
 0044F658    push        esi
 0044F659    push        edi
 0044F65A    call        user32.GetMenuStringA
 0044F65F    pop         edi
 0044F660    pop         esi
 0044F661    pop         ebx
 0044F662    pop         ecx
 0044F663    pop         ebp
 0044F664    ret         0C
*}
end;

//0044F668
procedure TMenu.SetBiDiMode(Value:TBiDiMode);
begin
{*
 0044F668    cmp         dl,byte ptr [eax+30]
>0044F66B    je          0044F679
 0044F66D    mov         byte ptr [eax+30],dl
 0044F670    mov         byte ptr [eax+41],0
 0044F674    call        TMenu.DoBiDiModeChanged
 0044F679    ret
*}
end;

//0044F67C
procedure TMenu.SetParentBiDiMode(Value:Boolean);
begin
{*
 0044F67C    cmp         dl,byte ptr [eax+41]
>0044F67F    je          0044F689
 0044F681    mov         byte ptr [eax+41],dl
 0044F684    call        TMenu.ParentBiDiModeChanged
 0044F689    ret
*}
end;

//0044F68C
procedure TMenu.ParentBiDiModeChanged;
begin
{*
 0044F68C    push        ebx
 0044F68D    mov         ebx,eax
 0044F68F    cmp         byte ptr [ebx+41],0
>0044F693    je          0044F6AF
 0044F695    mov         eax,dword ptr [ebx+38]
 0044F698    call        FindControl
 0044F69D    test        eax,eax
>0044F69F    je          0044F6AF
 0044F6A1    mov         dl,byte ptr [eax+5F]
 0044F6A4    mov         eax,ebx
 0044F6A6    call        TMenu.SetBiDiMode
 0044F6AB    mov         byte ptr [ebx+41],1
 0044F6AF    pop         ebx
 0044F6B0    ret
*}
end;

//0044F6B4
procedure TMenu.ParentBiDiModeChanged(AControl:TObject);
begin
{*
 0044F6B4    push        ebx
 0044F6B5    push        esi
 0044F6B6    mov         esi,edx
 0044F6B8    mov         ebx,eax
 0044F6BA    cmp         byte ptr [ebx+41],0
>0044F6BE    je          0044F6DB
 0044F6C0    mov         eax,esi
 0044F6C2    mov         edx,dword ptr ds:[437BA4];TControl
 0044F6C8    call        @AsClass
 0044F6CD    mov         dl,byte ptr [eax+5F]
 0044F6D0    mov         eax,ebx
 0044F6D2    call        TMenu.SetBiDiMode
 0044F6D7    mov         byte ptr [ebx+41],1
 0044F6DB    pop         esi
 0044F6DC    pop         ebx
 0044F6DD    ret
*}
end;

//0044F6E0
function TMenu.GetAutoHotkeys:TMenuAutoFlag;
begin
{*
 0044F6E0    mov         eax,dword ptr [eax+34]
 0044F6E3    movzx       eax,byte ptr [eax+3B]
 0044F6E7    mov         al,byte ptr [eax+5ACCC8]
 0044F6ED    ret
*}
end;

//0044F6F0
procedure TMenu.SetAutoHotkeys(const Value:TMenuAutoFlag);
begin
{*
 0044F6F0    and         edx,7F
 0044F6F3    mov         dl,byte ptr [edx+5ACCC4]
 0044F6F9    mov         eax,dword ptr [eax+34]
 0044F6FC    mov         byte ptr [eax+3B],dl
 0044F6FF    ret
*}
end;

//0044F700
function TMenu.GetAutoLineReduction:TMenuAutoFlag;
begin
{*
 0044F700    mov         eax,dword ptr [eax+34]
 0044F703    movzx       eax,byte ptr [eax+3C]
 0044F707    mov         al,byte ptr [eax+5ACCC8]
 0044F70D    ret
*}
end;

//0044F710
procedure TMenu.SetAutoLineReduction(const Value:TMenuAutoFlag);
begin
{*
 0044F710    and         edx,7F
 0044F713    mov         dl,byte ptr [edx+5ACCC4]
 0044F719    mov         eax,dword ptr [eax+34]
 0044F71C    mov         byte ptr [eax+3C],dl
 0044F71F    ret
*}
end;

//0044F720
procedure TMainMenu.SetAutoMerge(Value:Boolean);
begin
{*
 0044F720    cmp         dl,byte ptr [eax+5C]
>0044F723    je          0044F73E
 0044F725    mov         byte ptr [eax+5C],dl
 0044F728    mov         edx,dword ptr [eax+38]
 0044F72B    test        edx,edx
>0044F72D    je          0044F73E
 0044F72F    push        0
 0044F731    push        0
 0044F733    push        0B015
 0044F738    push        edx
 0044F739    call        user32.SendMessageA
 0044F73E    ret
*}
end;

//0044F740
procedure TMainMenu.MenuChanged(Sender:TObject; Source:TMenuItem; Rebuild:Boolean);
begin
{*
 0044F740    push        ebp
 0044F741    mov         ebp,esp
 0044F743    push        ecx
 0044F744    push        ebx
 0044F745    push        esi
 0044F746    push        edi
 0044F747    mov         esi,ecx
 0044F749    mov         dword ptr [ebp-4],edx
 0044F74C    mov         edi,eax
 0044F74E    cmp         dword ptr [edi+38],0
>0044F752    je          0044F780
 0044F754    mov         eax,edi
 0044F756    call        TMenu.UpdateImage
 0044F75B    mov         ebx,eax
 0044F75D    test        esi,esi
>0044F75F    jne         0044F773
 0044F761    push        0
 0044F763    push        0
 0044F765    push        0B015
 0044F76A    mov         eax,dword ptr [edi+38]
 0044F76D    push        eax
 0044F76E    call        user32.SendMessageA
 0044F773    test        bl,bl
>0044F775    je          0044F780
 0044F777    mov         eax,dword ptr [edi+38]
 0044F77A    push        eax
 0044F77B    call        user32.DrawMenuBar
 0044F780    mov         al,byte ptr [ebp+8]
 0044F783    push        eax
 0044F784    mov         ecx,esi
 0044F786    mov         edx,dword ptr [ebp-4]
 0044F789    mov         eax,edi
 0044F78B    call        TMenu.MenuChanged
 0044F790    pop         edi
 0044F791    pop         esi
 0044F792    pop         ebx
 0044F793    pop         ecx
 0044F794    pop         ebp
 0044F795    ret         4
*}
end;

//0044F798
procedure TMainMenu.Merge(Menu:TMainMenu);
begin
{*
 0044F798    test        edx,edx
>0044F79A    je          0044F7A8
 0044F79C    mov         eax,dword ptr [eax+34]
 0044F79F    mov         edx,dword ptr [edx+34]
 0044F7A2    call        TMenuItem.MergeWith
 0044F7A7    ret
 0044F7A8    xor         edx,edx
 0044F7AA    mov         eax,dword ptr [eax+34]
 0044F7AD    call        TMenuItem.MergeWith
 0044F7B2    ret
*}
end;

//0044F7B4
procedure TMainMenu.Unmerge(Menu:TMainMenu);
begin
{*
 0044F7B4    test        edx,edx
>0044F7B6    je          0044F7CD
 0044F7B8    mov         ecx,dword ptr [eax+34]
 0044F7BB    mov         ecx,dword ptr [ecx+68]
 0044F7BE    cmp         ecx,dword ptr [edx+34]
>0044F7C1    jne         0044F7CD
 0044F7C3    xor         edx,edx
 0044F7C5    mov         eax,dword ptr [eax+34]
 0044F7C8    call        TMenuItem.MergeWith
 0044F7CD    ret
*}
end;

//0044F7D0
procedure TMainMenu.ItemChanged;
begin
{*
 0044F7D0    push        ebx
 0044F7D1    push        esi
 0044F7D2    mov         ebx,eax
 0044F7D4    push        0
 0044F7D6    xor         ecx,ecx
 0044F7D8    xor         edx,edx
 0044F7DA    mov         eax,ebx
 0044F7DC    mov         esi,dword ptr [eax]
 0044F7DE    call        dword ptr [esi+38]
 0044F7E1    mov         eax,dword ptr [ebx+38]
 0044F7E4    test        eax,eax
>0044F7E6    je          0044F7F7
 0044F7E8    push        0
 0044F7EA    push        0
 0044F7EC    push        0B015
 0044F7F1    push        eax
 0044F7F2    call        user32.SendMessageA
 0044F7F7    pop         esi
 0044F7F8    pop         ebx
 0044F7F9    ret
*}
end;

//0044F7FC
function TMainMenu.GetHandle:HMENU;
begin
{*
 0044F7FC    mov         edx,dword ptr [eax+58]
 0044F7FF    test        edx,edx
>0044F801    je          0044F806
 0044F803    mov         eax,edx
 0044F805    ret
 0044F806    call        TMenu.GetHandle
 0044F80B    ret
*}
end;

//0044F80C
procedure TPopupList.MainWndProc(var Message:TMessage);
begin
{*
 0044F80C    push        ebp
 0044F80D    mov         ebp,esp
 0044F80F    push        ecx
 0044F810    push        ebx
 0044F811    push        esi
 0044F812    push        edi
 0044F813    mov         dword ptr [ebp-4],eax
 0044F816    xor         eax,eax
 0044F818    push        ebp
 0044F819    push        44F836
 0044F81E    push        dword ptr fs:[eax]
 0044F821    mov         dword ptr fs:[eax],esp
 0044F824    mov         eax,dword ptr [ebp-4]
 0044F827    mov         ecx,dword ptr [eax]
 0044F829    call        dword ptr [ecx+10]
 0044F82C    xor         eax,eax
 0044F82E    pop         edx
 0044F82F    pop         ecx
 0044F830    pop         ecx
 0044F831    mov         dword ptr fs:[eax],edx
>0044F834    jmp         0044F84F
>0044F836    jmp         @HandleAnyException
 0044F83B    mov         eax,[005AE584];^Application:TApplication
 0044F840    mov         eax,dword ptr [eax]
 0044F842    mov         edx,dword ptr [ebp-4]
 0044F845    call        TApplication.HandleException
 0044F84A    call        @DoneExcept
 0044F84F    pop         edi
 0044F850    pop         esi
 0044F851    pop         ebx
 0044F852    pop         ecx
 0044F853    pop         ebp
 0044F854    ret
*}
end;

//0044F858
procedure TPopupList.WndProc(var Message:TMessage);
begin
{*
 0044F858    push        ebp
 0044F859    mov         ebp,esp
 0044F85B    add         esp,0FFFFFFD0
 0044F85E    push        ebx
 0044F85F    push        esi
 0044F860    push        edi
 0044F861    xor         ecx,ecx
 0044F863    mov         dword ptr [ebp-30],ecx
 0044F866    mov         esi,edx
 0044F868    mov         dword ptr [ebp-4],eax
 0044F86B    xor         eax,eax
 0044F86D    push        ebp
 0044F86E    push        44FD8B
 0044F873    push        dword ptr fs:[eax]
 0044F876    mov         dword ptr fs:[eax],esp
 0044F879    mov         eax,dword ptr [esi]
 0044F87B    cmp         eax,111
>0044F880    jg          0044F8A2
>0044F882    je          0044F8BA
 0044F884    sub         eax,2B
>0044F887    je          0044FAC7
 0044F88D    dec         eax
>0044F88E    je          0044FBD2
 0044F894    sub         eax,27
>0044F897    je          0044F9C5
>0044F89D    jmp         0044FD5B
 0044F8A2    sub         eax,117
>0044F8A7    je          0044F8F0
 0044F8A9    sub         eax,8
>0044F8AC    je          0044F925
 0044F8AE    dec         eax
>0044F8AF    je          0044FD12
>0044F8B5    jmp         0044FD5B
 0044F8BA    mov         eax,dword ptr [ebp-4]
 0044F8BD    mov         ebx,dword ptr [eax+8]
 0044F8C0    dec         ebx
 0044F8C1    test        ebx,ebx
>0044F8C3    jl          0044FD5B
 0044F8C9    inc         ebx
 0044F8CA    xor         edi,edi
 0044F8CC    mov         edx,edi
 0044F8CE    mov         eax,dword ptr [ebp-4]
 0044F8D1    call        TList.Get
 0044F8D6    mov         dx,word ptr [esi+4]
 0044F8DA    call        TMenu.DispatchCommand
 0044F8DF    test        al,al
>0044F8E1    jne         0044FD75
 0044F8E7    inc         edi
 0044F8E8    dec         ebx
>0044F8E9    jne         0044F8CC
>0044F8EB    jmp         0044FD5B
 0044F8F0    mov         eax,dword ptr [ebp-4]
 0044F8F3    mov         ebx,dword ptr [eax+8]
 0044F8F6    dec         ebx
 0044F8F7    test        ebx,ebx
>0044F8F9    jl          0044FD5B
 0044F8FF    inc         ebx
 0044F900    xor         edi,edi
 0044F902    mov         edx,edi
 0044F904    mov         eax,dword ptr [ebp-4]
 0044F907    call        TList.Get
 0044F90C    mov         edx,dword ptr [esi+4]
 0044F90F    call        TMenu.DispatchPopup
 0044F914    test        al,al
>0044F916    jne         0044FD75
 0044F91C    inc         edi
 0044F91D    dec         ebx
>0044F91E    jne         0044F902
>0044F920    jmp         0044FD5B
 0044F925    mov         byte ptr [ebp-0D],0
 0044F929    test        byte ptr [esi+6],10
>0044F92D    je          0044F933
 0044F92F    mov         byte ptr [ebp-0D],1
 0044F933    mov         eax,dword ptr [ebp-4]
 0044F936    mov         ebx,dword ptr [eax+8]
 0044F939    dec         ebx
 0044F93A    test        ebx,ebx
>0044F93C    jl          0044F9B2
 0044F93E    inc         ebx
 0044F93F    xor         edi,edi
 0044F941    cmp         byte ptr [ebp-0D],1
>0044F945    jne         0044F967
 0044F947    mov         eax,dword ptr [esi+8]
 0044F94A    test        eax,eax
>0044F94C    je          0044F95E
 0044F94E    movzx       edx,word ptr [esi+4]
 0044F952    push        edx
 0044F953    push        eax
 0044F954    call        user32.GetSubMenu
 0044F959    mov         dword ptr [ebp-8],eax
>0044F95C    jmp         0044F96E
 0044F95E    mov         dword ptr [ebp-8],0FFFFFFFF
>0044F965    jmp         0044F96E
 0044F967    movzx       eax,word ptr [esi+4]
 0044F96B    mov         dword ptr [ebp-8],eax
 0044F96E    mov         edx,edi
 0044F970    mov         eax,dword ptr [ebp-4]
 0044F973    call        TList.Get
 0044F978    mov         cl,byte ptr [ebp-0D]
 0044F97B    mov         edx,dword ptr [ebp-8]
 0044F97E    call        TMenu.FindItem
 0044F983    mov         dword ptr [ebp-0C],eax
 0044F986    cmp         dword ptr [ebp-0C],0
>0044F98A    je          0044F9AE
 0044F98C    lea         edx,[ebp-30]
 0044F98F    mov         eax,dword ptr [ebp-0C]
 0044F992    mov         eax,dword ptr [eax+58]
 0044F995    call        GetLongHint
 0044F99A    mov         edx,dword ptr [ebp-30]
 0044F99D    mov         eax,[005AE584];^Application:TApplication
 0044F9A2    mov         eax,dword ptr [eax]
 0044F9A4    call        TApplication.SetHint
>0044F9A9    jmp         0044FD75
 0044F9AE    inc         edi
 0044F9AF    dec         ebx
>0044F9B0    jne         0044F941
 0044F9B2    mov         eax,[005AE584];^Application:TApplication
 0044F9B7    mov         eax,dword ptr [eax]
 0044F9B9    xor         edx,edx
 0044F9BB    call        TApplication.SetHint
>0044F9C0    jmp         0044FD5B
 0044F9C5    mov         eax,dword ptr [esi+8]
 0044F9C8    mov         dword ptr [ebp-20],eax
 0044F9CB    mov         eax,dword ptr [ebp-4]
 0044F9CE    mov         ebx,dword ptr [eax+8]
 0044F9D1    dec         ebx
 0044F9D2    test        ebx,ebx
>0044F9D4    jl          0044FD5B
 0044F9DA    inc         ebx
 0044F9DB    xor         edi,edi
 0044F9DD    mov         edx,edi
 0044F9DF    mov         eax,dword ptr [ebp-4]
 0044F9E2    call        TList.Get
 0044F9E7    mov         edx,dword ptr [eax]
 0044F9E9    call        dword ptr [edx+34]
 0044F9EC    mov         edx,dword ptr [ebp-20]
 0044F9EF    cmp         eax,dword ptr [edx+0C]
>0044F9F2    jne         0044FA06
 0044F9F4    mov         edx,edi
 0044F9F6    mov         eax,dword ptr [ebp-4]
 0044F9F9    call        TList.Get
 0044F9FE    mov         eax,dword ptr [eax+34]
 0044FA01    mov         dword ptr [ebp-0C],eax
>0044FA04    jmp         0044FA20
 0044FA06    mov         edx,edi
 0044FA08    mov         eax,dword ptr [ebp-4]
 0044FA0B    call        TList.Get
 0044FA10    mov         edx,dword ptr [ebp-20]
 0044FA13    mov         edx,dword ptr [edx+0C]
 0044FA16    mov         cl,1
 0044FA18    call        TMenu.FindItem
 0044FA1D    mov         dword ptr [ebp-0C],eax
 0044FA20    cmp         dword ptr [ebp-0C],0
>0044FA24    je          0044FABA
 0044FA2A    mov         edx,edi
 0044FA2C    mov         eax,dword ptr [ebp-4]
 0044FA2F    call        TList.Get
 0044FA34    mov         edx,dword ptr [ebp-20]
 0044FA37    mov         edx,dword ptr [edx+8]
 0044FA3A    mov         cl,1
 0044FA3C    call        TMenu.GetHelpContext
 0044FA41    test        eax,eax
>0044FA43    jne         0044FA5C
 0044FA45    mov         edx,edi
 0044FA47    mov         eax,dword ptr [ebp-4]
 0044FA4A    call        TList.Get
 0044FA4F    mov         edx,dword ptr [ebp-20]
 0044FA52    mov         edx,dword ptr [edx+0C]
 0044FA55    xor         ecx,ecx
 0044FA57    call        TMenu.GetHelpContext
 0044FA5C    mov         edx,dword ptr ds:[5AE7DC];^Screen:TScreen
 0044FA62    mov         edx,dword ptr [edx]
 0044FA64    mov         edx,dword ptr [edx+6C]
 0044FA67    test        edx,edx
>0044FA69    je          0044FD75
 0044FA6F    test        eax,eax
>0044FA71    jne         0044FA7E
 0044FA73    mov         eax,[005AE7DC];^Screen:TScreen
 0044FA78    mov         eax,dword ptr [edx+158]
 0044FA7E    mov         ecx,dword ptr ds:[5AE7DC];^Screen:TScreen
 0044FA84    test        byte ptr [edx+228],8
>0044FA8B    je          0044FAA7
 0044FA8D    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 0044FA93    mov         edx,dword ptr [edx]
 0044FA95    mov         ecx,eax
 0044FA97    mov         eax,8
 0044FA9C    xchg        eax,edx
 0044FA9D    call        TApplication.HelpCommand
>0044FAA2    jmp         0044FD75
 0044FAA7    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 0044FAAD    mov         edx,dword ptr [edx]
 0044FAAF    xchg        eax,edx
 0044FAB0    call        TApplication.HelpContext
>0044FAB5    jmp         0044FD75
 0044FABA    inc         edi
 0044FABB    dec         ebx
>0044FABC    jne         0044F9DD
>0044FAC2    jmp         0044FD5B
 0044FAC7    mov         eax,dword ptr [esi+8]
 0044FACA    mov         dword ptr [ebp-24],eax
 0044FACD    mov         eax,dword ptr [ebp-4]
 0044FAD0    mov         ebx,dword ptr [eax+8]
 0044FAD3    dec         ebx
 0044FAD4    test        ebx,ebx
>0044FAD6    jl          0044FD5B
 0044FADC    inc         ebx
 0044FADD    xor         edi,edi
 0044FADF    mov         edx,edi
 0044FAE1    mov         eax,dword ptr [ebp-4]
 0044FAE4    call        TList.Get
 0044FAE9    mov         edx,dword ptr [ebp-24]
 0044FAEC    mov         edx,dword ptr [edx+8]
 0044FAEF    xor         ecx,ecx
 0044FAF1    call        TMenu.FindItem
 0044FAF6    mov         dword ptr [ebp-0C],eax
 0044FAF9    cmp         dword ptr [ebp-0C],0
>0044FAFD    je          0044FBC5
 0044FB03    mov         dl,1
 0044FB05    mov         eax,[00436FD4];TControlCanvas
 0044FB0A    call        TCanvas.Create
 0044FB0F    mov         dword ptr [ebp-14],eax
 0044FB12    xor         eax,eax
 0044FB14    push        ebp
 0044FB15    push        44FBBE
 0044FB1A    push        dword ptr fs:[eax]
 0044FB1D    mov         dword ptr fs:[eax],esp
 0044FB20    mov         eax,dword ptr [ebp-24]
 0044FB23    mov         eax,dword ptr [eax+18]
 0044FB26    push        eax
 0044FB27    call        gdi32.SaveDC
 0044FB2C    mov         dword ptr [ebp-18],eax
 0044FB2F    xor         eax,eax
 0044FB31    push        ebp
 0044FB32    push        44FBA1
 0044FB37    push        dword ptr fs:[eax]
 0044FB3A    mov         dword ptr fs:[eax],esp
 0044FB3D    mov         eax,dword ptr [ebp-24]
 0044FB40    mov         edx,dword ptr [eax+18]
 0044FB43    mov         eax,dword ptr [ebp-14]
 0044FB46    call        TCanvas.SetHandle
 0044FB4B    mov         eax,[005AE7DC];^Screen:TScreen
 0044FB50    mov         eax,dword ptr [eax]
 0044FB52    mov         edx,dword ptr [eax+88]
 0044FB58    mov         eax,dword ptr [ebp-14]
 0044FB5B    call        TCanvas.SetFont
 0044FB60    mov         eax,dword ptr [ebp-24]
 0044FB63    mov         ax,word ptr [eax+10]
 0044FB67    push        eax
 0044FB68    mov         eax,dword ptr [ebp-24]
 0044FB6B    lea         ecx,[eax+1C]
 0044FB6E    mov         edx,dword ptr [ebp-14]
 0044FB71    mov         eax,dword ptr [ebp-0C]
 0044FB74    call        DrawMenuItem
 0044FB79    xor         eax,eax
 0044FB7B    pop         edx
 0044FB7C    pop         ecx
 0044FB7D    pop         ecx
 0044FB7E    mov         dword ptr fs:[eax],edx
 0044FB81    push        44FBA8
 0044FB86    xor         edx,edx
 0044FB88    mov         eax,dword ptr [ebp-14]
 0044FB8B    call        TCanvas.SetHandle
 0044FB90    mov         eax,dword ptr [ebp-18]
 0044FB93    push        eax
 0044FB94    mov         eax,dword ptr [ebp-24]
 0044FB97    mov         eax,dword ptr [eax+18]
 0044FB9A    push        eax
 0044FB9B    call        gdi32.RestoreDC
 0044FBA0    ret
>0044FBA1    jmp         @HandleFinally
>0044FBA6    jmp         0044FB86
 0044FBA8    xor         eax,eax
 0044FBAA    pop         edx
 0044FBAB    pop         ecx
 0044FBAC    pop         ecx
 0044FBAD    mov         dword ptr fs:[eax],edx
 0044FBB0    push        44FD75
 0044FBB5    mov         eax,dword ptr [ebp-14]
 0044FBB8    call        TObject.Free
 0044FBBD    ret
>0044FBBE    jmp         @HandleFinally
>0044FBC3    jmp         0044FBB5
 0044FBC5    inc         edi
 0044FBC6    dec         ebx
>0044FBC7    jne         0044FADF
>0044FBCD    jmp         0044FD5B
 0044FBD2    mov         eax,dword ptr [esi+8]
 0044FBD5    mov         dword ptr [ebp-28],eax
 0044FBD8    mov         eax,dword ptr [ebp-4]
 0044FBDB    mov         ebx,dword ptr [eax+8]
 0044FBDE    dec         ebx
 0044FBDF    test        ebx,ebx
>0044FBE1    jl          0044FD5B
 0044FBE7    inc         ebx
 0044FBE8    xor         edi,edi
 0044FBEA    mov         edx,edi
 0044FBEC    mov         eax,dword ptr [ebp-4]
 0044FBEF    call        TList.Get
 0044FBF4    mov         edx,dword ptr [ebp-28]
 0044FBF7    mov         edx,dword ptr [edx+8]
 0044FBFA    xor         ecx,ecx
 0044FBFC    call        TMenu.FindItem
 0044FC01    mov         dword ptr [ebp-0C],eax
 0044FC04    cmp         dword ptr [ebp-0C],0
>0044FC08    je          0044FD08
 0044FC0E    mov         eax,dword ptr [ebp-4]
 0044FC11    mov         eax,dword ptr [eax+10]
 0044FC14    push        eax
 0044FC15    call        user32.GetWindowDC
 0044FC1A    mov         dword ptr [ebp-1C],eax
 0044FC1D    xor         eax,eax
 0044FC1F    push        ebp
 0044FC20    push        44FD01
 0044FC25    push        dword ptr fs:[eax]
 0044FC28    mov         dword ptr fs:[eax],esp
 0044FC2B    mov         dl,1
 0044FC2D    mov         eax,[00436FD4];TControlCanvas
 0044FC32    call        TCanvas.Create
 0044FC37    mov         dword ptr [ebp-14],eax
 0044FC3A    xor         eax,eax
 0044FC3C    push        ebp
 0044FC3D    push        44FCDC
 0044FC42    push        dword ptr fs:[eax]
 0044FC45    mov         dword ptr fs:[eax],esp
 0044FC48    mov         eax,dword ptr [ebp-1C]
 0044FC4B    push        eax
 0044FC4C    call        gdi32.SaveDC
 0044FC51    mov         dword ptr [ebp-18],eax
 0044FC54    xor         eax,eax
 0044FC56    push        ebp
 0044FC57    push        44FCBF
 0044FC5C    push        dword ptr fs:[eax]
 0044FC5F    mov         dword ptr fs:[eax],esp
 0044FC62    mov         edx,dword ptr [ebp-1C]
 0044FC65    mov         eax,dword ptr [ebp-14]
 0044FC68    call        TCanvas.SetHandle
 0044FC6D    mov         eax,[005AE7DC];^Screen:TScreen
 0044FC72    mov         eax,dword ptr [eax]
 0044FC74    mov         edx,dword ptr [eax+88]
 0044FC7A    mov         eax,dword ptr [ebp-14]
 0044FC7D    call        TCanvas.SetFont
 0044FC82    mov         eax,dword ptr [ebp-28]
 0044FC85    add         eax,10
 0044FC88    push        eax
 0044FC89    mov         eax,dword ptr [ebp-28]
 0044FC8C    lea         ecx,[eax+0C]
 0044FC8F    mov         edx,dword ptr [ebp-14]
 0044FC92    mov         eax,dword ptr [ebp-0C]
 0044FC95    mov         ebx,dword ptr [eax]
 0044FC97    call        dword ptr [ebx+38]
 0044FC9A    xor         eax,eax
 0044FC9C    pop         edx
 0044FC9D    pop         ecx
 0044FC9E    pop         ecx
 0044FC9F    mov         dword ptr fs:[eax],edx
 0044FCA2    push        44FCC6
 0044FCA7    xor         edx,edx
 0044FCA9    mov         eax,dword ptr [ebp-14]
 0044FCAC    call        TCanvas.SetHandle
 0044FCB1    mov         eax,dword ptr [ebp-18]
 0044FCB4    push        eax
 0044FCB5    mov         eax,dword ptr [ebp-1C]
 0044FCB8    push        eax
 0044FCB9    call        gdi32.RestoreDC
 0044FCBE    ret
>0044FCBF    jmp         @HandleFinally
>0044FCC4    jmp         0044FCA7
 0044FCC6    xor         eax,eax
 0044FCC8    pop         edx
 0044FCC9    pop         ecx
 0044FCCA    pop         ecx
 0044FCCB    mov         dword ptr fs:[eax],edx
 0044FCCE    push        44FCE3
 0044FCD3    mov         eax,dword ptr [ebp-14]
 0044FCD6    call        TObject.Free
 0044FCDB    ret
>0044FCDC    jmp         @HandleFinally
>0044FCE1    jmp         0044FCD3
 0044FCE3    xor         eax,eax
 0044FCE5    pop         edx
 0044FCE6    pop         ecx
 0044FCE7    pop         ecx
 0044FCE8    mov         dword ptr fs:[eax],edx
 0044FCEB    push        44FD75
 0044FCF0    mov         eax,dword ptr [ebp-1C]
 0044FCF3    push        eax
 0044FCF4    mov         eax,dword ptr [ebp-4]
 0044FCF7    mov         eax,dword ptr [eax+10]
 0044FCFA    push        eax
 0044FCFB    call        user32.ReleaseDC
 0044FD00    ret
>0044FD01    jmp         @HandleFinally
>0044FD06    jmp         0044FCF0
 0044FD08    inc         edi
 0044FD09    dec         ebx
>0044FD0A    jne         0044FBEA
>0044FD10    jmp         0044FD5B
 0044FD12    mov         eax,dword ptr [ebp-4]
 0044FD15    mov         ebx,dword ptr [eax+8]
 0044FD18    dec         ebx
 0044FD19    test        ebx,ebx
>0044FD1B    jl          0044FD5B
 0044FD1D    inc         ebx
 0044FD1E    xor         edi,edi
 0044FD20    mov         edx,edi
 0044FD22    mov         eax,dword ptr [ebp-4]
 0044FD25    call        TList.Get
 0044FD2A    mov         dword ptr [ebp-2C],eax
 0044FD2D    mov         eax,dword ptr [ebp-2C]
 0044FD30    mov         edx,dword ptr [eax]
 0044FD32    call        dword ptr [edx+34]
 0044FD35    cmp         eax,dword ptr [esi+8]
>0044FD38    je          0044FD4B
 0044FD3A    mov         edx,dword ptr [esi+8]
 0044FD3D    mov         cl,1
 0044FD3F    mov         eax,dword ptr [ebp-2C]
 0044FD42    call        TMenu.FindItem
 0044FD47    test        eax,eax
>0044FD49    je          0044FD57
 0044FD4B    mov         edx,esi
 0044FD4D    mov         eax,dword ptr [ebp-2C]
 0044FD50    call        TMenu.ProcessMenuChar
>0044FD55    jmp         0044FD75
 0044FD57    inc         edi
 0044FD58    dec         ebx
>0044FD59    jne         0044FD20
 0044FD5B    mov         eax,dword ptr [esi+8]
 0044FD5E    push        eax
 0044FD5F    mov         eax,dword ptr [esi+4]
 0044FD62    push        eax
 0044FD63    mov         eax,dword ptr [esi]
 0044FD65    push        eax
 0044FD66    mov         eax,dword ptr [ebp-4]
 0044FD69    mov         eax,dword ptr [eax+10]
 0044FD6C    push        eax
 0044FD6D    call        user32.DefWindowProcA
 0044FD72    mov         dword ptr [esi+0C],eax
 0044FD75    xor         eax,eax
 0044FD77    pop         edx
 0044FD78    pop         ecx
 0044FD79    pop         ecx
 0044FD7A    mov         dword ptr fs:[eax],edx
 0044FD7D    push        44FD92
 0044FD82    lea         eax,[ebp-30]
 0044FD85    call        @LStrClr
 0044FD8A    ret
>0044FD8B    jmp         @HandleFinally
>0044FD90    jmp         0044FD82
 0044FD92    pop         edi
 0044FD93    pop         esi
 0044FD94    pop         ebx
 0044FD95    mov         esp,ebp
 0044FD97    pop         ebp
 0044FD98    ret
*}
end;

//0044FD9C
procedure TPopupList.Add(Popup:TPopupMenu);
begin
{*
 0044FD9C    push        ebx
 0044FD9D    push        esi
 0044FD9E    mov         esi,edx
 0044FDA0    mov         ebx,eax
 0044FDA2    cmp         dword ptr [ebx+8],0
>0044FDA6    jne         0044FDB6
 0044FDA8    push        ebx
 0044FDA9    push        44F80C;TPopupList.MainWndProc
 0044FDAE    call        AllocateHWnd
 0044FDB3    mov         dword ptr [ebx+10],eax
 0044FDB6    mov         edx,esi
 0044FDB8    mov         eax,ebx
 0044FDBA    call        TList.Add
 0044FDBF    pop         esi
 0044FDC0    pop         ebx
 0044FDC1    ret
*}
end;

//0044FDC4
procedure TPopupList.Remove(Popup:TPopupMenu);
begin
{*
 0044FDC4    push        ebx
 0044FDC5    mov         ebx,eax
 0044FDC7    mov         eax,ebx
 0044FDC9    call        TList.Remove
 0044FDCE    cmp         dword ptr [ebx+8],0
>0044FDD2    jne         0044FDDC
 0044FDD4    mov         eax,dword ptr [ebx+10]
 0044FDD7    call        DeallocateHWnd
 0044FDDC    pop         ebx
 0044FDDD    ret
*}
end;

//0044FDE0
constructor TPopupMenu.Create(AOwner:TComponent);
begin
{*
 0044FDE0    push        ebx
 0044FDE1    push        esi
 0044FDE2    test        dl,dl
>0044FDE4    je          0044FDEE
 0044FDE6    add         esp,0FFFFFFF0
 0044FDE9    call        @ClassCreate
 0044FDEE    mov         ebx,edx
 0044FDF0    mov         esi,eax
 0044FDF2    xor         edx,edx
 0044FDF4    mov         eax,esi
 0044FDF6    call        TMenu.Create
 0044FDFB    mov         dword ptr [esi+58],0FFFFFFFF
 0044FE02    mov         dword ptr [esi+5C],0FFFFFFFF
 0044FE09    mov         eax,dword ptr [esi+34]
 0044FE0C    mov         dword ptr [eax+8C],esi
 0044FE12    mov         edx,dword ptr [esi]
 0044FE14    mov         edx,dword ptr [edx+3C]
 0044FE17    mov         dword ptr [eax+88],edx
 0044FE1D    mov         eax,[005AE584];^Application:TApplication
 0044FE22    mov         eax,dword ptr [eax]
 0044FE24    mov         eax,dword ptr [eax+30]
 0044FE27    mov         dword ptr [esi+38],eax
 0044FE2A    mov         byte ptr [esi+61],1
 0044FE2E    mov         edx,esi
 0044FE30    mov         eax,[005E0C9C];PopupList:TPopupList
 0044FE35    call        TPopupList.Add
 0044FE3A    mov         eax,esi
 0044FE3C    test        bl,bl
>0044FE3E    je          0044FE4F
 0044FE40    call        @AfterConstruction
 0044FE45    pop         dword ptr fs:[0]
 0044FE4C    add         esp,0C
 0044FE4F    mov         eax,esi
 0044FE51    pop         esi
 0044FE52    pop         ebx
 0044FE53    ret
*}
end;

//0044FE54
destructor TPopupMenu.Destroy;
begin
{*
 0044FE54    push        ebx
 0044FE55    push        esi
 0044FE56    call        @BeforeDestruction
 0044FE5B    mov         ebx,edx
 0044FE5D    mov         esi,eax
 0044FE5F    mov         edx,esi
 0044FE61    mov         eax,[005E0C9C];PopupList:TPopupList
 0044FE66    call        TPopupList.Remove
 0044FE6B    mov         edx,ebx
 0044FE6D    and         dl,0FC
 0044FE70    mov         eax,esi
 0044FE72    call        TMenu.Destroy
 0044FE77    test        bl,bl
>0044FE79    jle         0044FE82
 0044FE7B    mov         eax,esi
 0044FE7D    call        @ClassDestroy
 0044FE82    pop         esi
 0044FE83    pop         ebx
 0044FE84    ret
*}
end;

//0044FE88
procedure TPopupMenu.DoPopup(Sender:TObject);
begin
{*
 0044FE88    push        ebx
 0044FE89    cmp         word ptr [eax+72],0
>0044FE8E    je          0044FE98
 0044FE90    mov         ebx,eax
 0044FE92    mov         eax,dword ptr [ebx+74]
 0044FE95    call        dword ptr [ebx+70]
 0044FE98    pop         ebx
 0044FE99    ret
*}
end;

//0044FE9C
function TPopupMenu.GetHelpContext:THelpContext;
begin
{*
 0044FE9C    mov         eax,dword ptr [eax+34]
 0044FE9F    mov         eax,dword ptr [eax+54]
 0044FEA2    ret
*}
end;

//0044FEA4
procedure TPopupMenu.SetHelpContext(Value:THelpContext);
begin
{*
 0044FEA4    mov         eax,dword ptr [eax+34];TPopupMenu.Items:TMenuItem
 0044FEA7    mov         dword ptr [eax+54],edx;TMenuItem.HelpContext:THelpContext
 0044FEAA    ret
*}
end;

//0044FEAC
procedure TPopupMenu.SetBiDiModeFromPopupControl;
begin
{*
 0044FEAC    push        ebx
 0044FEAD    mov         ebx,eax
 0044FEAF    mov         eax,[005AE810];^SysLocale:TSysLocale
 0044FEB4    cmp         byte ptr [eax+0D],0
>0044FEB8    je          0044FEF1
 0044FEBA    cmp         byte ptr [ebx+41],0
>0044FEBE    je          0044FEF1
 0044FEC0    lea         eax,[ebx+58]
 0044FEC3    call        FindPopupControl
 0044FEC8    test        eax,eax
>0044FECA    je          0044FEDC
 0044FECC    mov         dl,byte ptr [eax+5F]
 0044FECF    mov         eax,ebx
 0044FED1    call        TMenu.SetBiDiMode
 0044FED6    mov         byte ptr [ebx+41],1
>0044FEDA    jmp         0044FEF1
 0044FEDC    mov         eax,[005AE584];^Application:TApplication
 0044FEE1    mov         eax,dword ptr [eax]
 0044FEE3    mov         dl,byte ptr [eax+34]
 0044FEE6    mov         eax,ebx
 0044FEE8    call        TMenu.SetBiDiMode
 0044FEED    mov         byte ptr [ebx+41],1
 0044FEF1    pop         ebx
 0044FEF2    ret
*}
end;

//0044FEF4
function TPopupMenu.UseRightToLeftAlignment:Boolean;
begin
{*
 0044FEF4    push        esi
 0044FEF5    xor         edx,edx
 0044FEF7    mov         ecx,dword ptr ds:[5AE810];^SysLocale:TSysLocale
 0044FEFD    cmp         byte ptr [ecx+0D],0
>0044FF01    je          0044FF39
 0044FF03    cmp         byte ptr [eax+41],0
>0044FF07    je          0044FF32
 0044FF09    add         eax,58
 0044FF0C    call        FindPopupControl
 0044FF11    test        eax,eax
>0044FF13    je          0044FF22
 0044FF15    mov         si,0FFC8
 0044FF19    call        @CallDynaInst
 0044FF1E    mov         edx,eax
>0044FF20    jmp         0044FF39
 0044FF22    mov         eax,[005AE584];^Application:TApplication
 0044FF27    mov         eax,dword ptr [eax]
 0044FF29    call        TApplication.UseRightToLeftAlignment
 0044FF2E    mov         edx,eax
>0044FF30    jmp         0044FF39
 0044FF32    cmp         byte ptr [eax+30],1
 0044FF36    sete        dl
 0044FF39    mov         eax,edx
 0044FF3B    pop         esi
 0044FF3C    ret
*}
end;

//0044FF40
procedure TPopupMenu.Popup(X:Integer; Y:Integer);
begin
{*
 0044FF40    push        ebx
 0044FF41    push        esi
 0044FF42    push        edi
 0044FF43    push        ebp
 0044FF44    add         esp,0FFFFFFF8
 0044FF47    mov         edi,ecx
 0044FF49    mov         esi,edx
 0044FF4B    mov         ebx,eax
 0044FF4D    mov         ecx,esp
 0044FF4F    mov         edx,edi
 0044FF51    mov         eax,esi
 0044FF53    call        Point
 0044FF58    mov         eax,dword ptr [esp]
 0044FF5B    mov         dword ptr [ebx+58],eax
 0044FF5E    mov         eax,dword ptr [esp+4]
 0044FF62    mov         dword ptr [ebx+5C],eax
 0044FF65    mov         eax,ebx
 0044FF67    call        TPopupMenu.SetBiDiModeFromPopupControl
 0044FF6C    mov         edx,ebx
 0044FF6E    mov         eax,ebx
 0044FF70    mov         ecx,dword ptr [eax]
 0044FF72    call        dword ptr [ecx+3C]
 0044FF75    xor         edx,edx
 0044FF77    mov         eax,dword ptr [ebx+34]
 0044FF7A    call        TMenuItem.InternalRethinkHotkeys
 0044FF7F    xor         edx,edx
 0044FF81    mov         eax,dword ptr [ebx+34]
 0044FF84    call        TMenuItem.InternalRethinkLines
 0044FF89    mov         eax,dword ptr [ebx+34]
 0044FF8C    call        TMenuItem.RebuildHandle
 0044FF91    mov         eax,ebx
 0044FF93    call        TMenu.AdjustBiDiBehavior
 0044FF98    mov         eax,ebx
 0044FF9A    call        TPopupMenu.UseRightToLeftAlignment
 0044FF9F    and         eax,7F
 0044FFA2    lea         eax,[eax+eax*2]
 0044FFA5    lea         eax,[eax*2+5ACD9C]
 0044FFAC    xor         edx,edx
 0044FFAE    mov         dl,byte ptr [ebx+60]
 0044FFB1    mov         bp,word ptr [eax+edx*2]
 0044FFB5    xor         eax,eax
 0044FFB7    mov         al,byte ptr [ebx+68]
 0044FFBA    or          bp,word ptr [eax*2+5ACDA8]
 0044FFC2    movzx       ebp,bp
 0044FFC5    xor         eax,eax
 0044FFC7    mov         al,byte ptr [ebx+69]
 0044FFCA    shl         eax,0A
 0044FFCD    or          ebp,eax
 0044FFCF    push        0
 0044FFD1    mov         eax,[005E0C9C];PopupList:TPopupList
 0044FFD6    mov         eax,dword ptr [eax+10]
 0044FFD9    push        eax
 0044FFDA    push        0
 0044FFDC    push        edi
 0044FFDD    push        esi
 0044FFDE    push        ebp
 0044FFDF    mov         eax,dword ptr [ebx+34]
 0044FFE2    call        TMenuItem.GetHandle
 0044FFE7    push        eax
 0044FFE8    call        user32.TrackPopupMenu
 0044FFED    pop         ecx
 0044FFEE    pop         edx
 0044FFEF    pop         ebp
 0044FFF0    pop         edi
 0044FFF1    pop         esi
 0044FFF2    pop         ebx
 0044FFF3    ret
*}
end;

//0044FFF4
procedure TMenuItemStack.ClearItem(AItem:TMenuItem);
begin
{*
 0044FFF4    push        ebx
 0044FFF5    push        esi
 0044FFF6    push        edi
 0044FFF7    push        ebp
 0044FFF8    mov         ebp,edx
 0044FFFA    mov         edi,eax
 0044FFFC    mov         eax,dword ptr [edi+4]
 0044FFFF    mov         esi,dword ptr [eax+8]
 00450002    dec         esi
 00450003    test        esi,esi
>00450005    jl          0045002A
 00450007    inc         esi
 00450008    xor         ebx,ebx
 0045000A    mov         eax,dword ptr [edi+4]
 0045000D    mov         edx,ebx
 0045000F    call        TList.Get
 00450014    cmp         ebp,dword ptr [eax]
>00450016    jne         00450026
 00450018    mov         eax,dword ptr [edi+4]
 0045001B    mov         edx,ebx
 0045001D    call        TList.Get
 00450022    xor         edx,edx
 00450024    mov         dword ptr [eax],edx
 00450026    inc         ebx
 00450027    dec         esi
>00450028    jne         0045000A
 0045002A    pop         ebp
 0045002B    pop         edi
 0045002C    pop         esi
 0045002D    pop         ebx
 0045002E    ret
*}
end;

//00450030
procedure DrawMenuItem(MenuItem:TMenuItem; ACanvas:TCanvas; ARect:TRect; State:TOwnerDrawState);
begin
{*
 00450030    push        ebp
 00450031    mov         ebp,esp
 00450033    add         esp,0FFFFFFE8
 00450036    push        ebx
 00450037    push        esi
 00450038    push        edi
 00450039    mov         esi,ecx
 0045003B    lea         edi,[ebp-15]
 0045003E    movs        dword ptr [edi],dword ptr [esi]
 0045003F    movs        dword ptr [edi],dword ptr [esi]
 00450040    movs        dword ptr [edi],dword ptr [esi]
 00450041    movs        dword ptr [edi],dword ptr [esi]
 00450042    mov         edi,edx
 00450044    mov         dword ptr [ebp-4],eax
 00450047    mov         eax,[005AE310]
 0045004C    cmp         dword ptr [eax],4
>0045004F    jg          00450069
 00450051    mov         eax,[005AE310]
 00450056    cmp         dword ptr [eax],4
>00450059    jne         00450065
 0045005B    mov         eax,[005AE618]
 00450060    cmp         dword ptr [eax],0
>00450063    jg          00450069
 00450065    xor         ebx,ebx
>00450067    jmp         0045006B
 00450069    mov         bl,1
 0045006B    mov         eax,dword ptr [ebp-4]
 0045006E    mov         si,0FFF2
 00450072    call        @CallDynaInst
 00450077    mov         edx,dword ptr ds:[44A66C];TMainMenu
 0045007D    call        @IsClass
 00450082    mov         byte ptr [ebp-5],al
 00450085    test        byte ptr [ebp+8],1
>00450089    je          004500B7
 0045008B    cmp         byte ptr [ebp-5],0
>0045008F    je          0045009B
 00450091    cmp         byte ptr [ebp-5],0
>00450095    je          004500B7
 00450097    test        bl,bl
>00450099    jne         004500B7
 0045009B    mov         edx,0FF00000D
 004500A0    mov         eax,dword ptr [edi+14]
 004500A3    call        TBrush.SetColor
 004500A8    mov         edx,0FF00000E
 004500AD    mov         eax,dword ptr [edi+0C]
 004500B0    call        TFont.SetColor
>004500B5    jmp         004500F7
 004500B7    test        bl,bl
>004500B9    je          004500DD
 004500BB    test        byte ptr [ebp+8],80
>004500BF    je          004500DD
 004500C1    mov         edx,0FF000004
 004500C6    mov         eax,dword ptr [edi+14]
 004500C9    call        TBrush.SetColor
 004500CE    mov         edx,0FF000011
 004500D3    mov         eax,dword ptr [edi+0C]
 004500D6    call        TFont.SetColor
>004500DB    jmp         004500F7
 004500DD    mov         edx,0FF000004
 004500E2    mov         eax,dword ptr [edi+14]
 004500E5    call        TBrush.SetColor
 004500EA    mov         edx,0FF000007
 004500EF    mov         eax,dword ptr [edi+0C]
 004500F2    call        TFont.SetColor
 004500F7    mov         ax,word ptr [ebp+8]
 004500FB    push        eax
 004500FC    mov         al,byte ptr [ebp-5]
 004500FF    push        eax
 00450100    lea         ecx,[ebp-15]
 00450103    mov         edx,edi
 00450105    mov         eax,dword ptr [ebp-4]
 00450108    mov         ebx,dword ptr [eax]
 0045010A    call        dword ptr [ebx+30]
 0045010D    pop         edi
 0045010E    pop         esi
 0045010F    pop         ebx
 00450110    mov         esp,ebp
 00450112    pop         ebp
 00450113    ret         4
*}
end;

//00450118
function StripHotkey(const Text:AnsiString):AnsiString;
begin
{*
 00450118    push        ebx
 00450119    push        esi
 0045011A    mov         esi,edx
 0045011C    mov         ebx,eax
 0045011E    mov         eax,esi
 00450120    mov         edx,ebx
 00450122    call        @LStrAsg
 00450127    mov         ebx,1
>0045012C    jmp         0045019E
 0045012E    mov         eax,dword ptr [esi]
 00450130    mov         al,byte ptr [eax+ebx-1]
 00450134    mov         edx,dword ptr ds:[5AE7EC]
 0045013A    mov         ecx,eax
 0045013C    and         ecx,0FF
 00450142    bt          dword ptr [edx],ecx
>00450145    jae         0045014A
 00450147    inc         ebx
>00450148    jmp         0045019D
 0045014A    cmp         al,26
>0045014C    jne         0045019D
 0045014E    mov         eax,[005AE810];^SysLocale:TSysLocale
 00450153    cmp         byte ptr [eax+0C],0
>00450157    je          0045018F
 00450159    cmp         ebx,1
>0045015C    jle         0045018F
 0045015E    mov         eax,dword ptr [esi]
 00450160    call        @LStrLen
 00450165    sub         eax,ebx
 00450167    cmp         eax,2
>0045016A    jl          0045018F
 0045016C    mov         eax,dword ptr [esi]
 0045016E    cmp         byte ptr [eax+ebx-2],28
>00450173    jne         0045018F
 00450175    mov         eax,dword ptr [esi]
 00450177    cmp         byte ptr [eax+ebx+1],29
>0045017C    jne         0045018F
 0045017E    mov         edx,ebx
 00450180    dec         edx
 00450181    mov         eax,esi
 00450183    mov         ecx,4
 00450188    call        @LStrDelete
>0045018D    jmp         0045019D
 0045018F    mov         eax,esi
 00450191    mov         ecx,1
 00450196    mov         edx,ebx
 00450198    call        @LStrDelete
 0045019D    inc         ebx
 0045019E    mov         eax,dword ptr [esi]
 004501A0    call        @LStrLen
 004501A5    cmp         ebx,eax
>004501A7    jle         0045012E
 004501A9    pop         esi
 004501AA    pop         ebx
 004501AB    ret
*}
end;

//004501AC
function GetHotkey(const Text:AnsiString):AnsiString;
begin
{*
 004501AC    push        ebx
 004501AD    push        esi
 004501AE    push        edi
 004501AF    push        ebp
 004501B0    mov         ebp,edx
 004501B2    mov         esi,eax
 004501B4    mov         eax,ebp
 004501B6    call        @LStrClr
 004501BB    mov         ebx,1
 004501C0    mov         eax,esi
 004501C2    call        @LStrLen
 004501C7    mov         edi,eax
 004501C9    cmp         edi,ebx
>004501CB    jl          0045020A
 004501CD    mov         eax,[005AE7EC]
 004501D2    mov         dl,byte ptr [esi+ebx-1]
 004501D6    and         edx,0FF
 004501DC    bt          dword ptr [eax],edx
>004501DF    jae         004501E4
 004501E1    inc         ebx
>004501E2    jmp         00450205
 004501E4    cmp         byte ptr [esi+ebx-1],26
>004501E9    jne         00450205
 004501EB    mov         eax,edi
 004501ED    sub         eax,ebx
 004501EF    dec         eax
>004501F0    jl          00450205
 004501F2    inc         ebx
 004501F3    cmp         byte ptr [esi+ebx-1],26
>004501F8    je          00450205
 004501FA    mov         eax,ebp
 004501FC    mov         dl,byte ptr [esi+ebx-1]
 00450200    call        @LStrFromChar
 00450205    inc         ebx
 00450206    cmp         edi,ebx
>00450208    jge         004501CD
 0045020A    pop         ebp
 0045020B    pop         edi
 0045020C    pop         esi
 0045020D    pop         ebx
 0045020E    ret
*}
end;

//00450210
function AnsiSameCaption(const Text1:AnsiString; const Text2:AnsiString):Boolean;
begin
{*
 00450210    push        ebp
 00450211    mov         ebp,esp
 00450213    push        0
 00450215    push        0
 00450217    push        ebx
 00450218    push        esi
 00450219    mov         esi,edx
 0045021B    mov         ebx,eax
 0045021D    xor         eax,eax
 0045021F    push        ebp
 00450220    push        450269
 00450225    push        dword ptr fs:[eax]
 00450228    mov         dword ptr fs:[eax],esp
 0045022B    lea         edx,[ebp-4]
 0045022E    mov         eax,esi
 00450230    call        StripHotkey
 00450235    mov         eax,dword ptr [ebp-4]
 00450238    push        eax
 00450239    lea         edx,[ebp-8]
 0045023C    mov         eax,ebx
 0045023E    call        StripHotkey
 00450243    mov         eax,dword ptr [ebp-8]
 00450246    pop         edx
 00450247    call        AnsiSameText
 0045024C    mov         ebx,eax
 0045024E    xor         eax,eax
 00450250    pop         edx
 00450251    pop         ecx
 00450252    pop         ecx
 00450253    mov         dword ptr fs:[eax],edx
 00450256    push        450270
 0045025B    lea         eax,[ebp-8]
 0045025E    mov         edx,2
 00450263    call        @LStrArrayClr
 00450268    ret
>00450269    jmp         @HandleFinally
>0045026E    jmp         0045025B
 00450270    mov         eax,ebx
 00450272    pop         esi
 00450273    pop         ebx
 00450274    pop         ecx
 00450275    pop         ecx
 00450276    pop         ebp
 00450277    ret
*}
end;

//00450278
procedure _NF__590;
begin
{*
 00450278    adc         al,byte ptr [eax]
 0045027A    add         byte ptr [eax],al
 0045027C    sbb         ch,cl
 0045027E    pop         edx
 0045027F    add         byte ptr [eax-1E],cl
 00450282    pop         edx
 00450283    add         byte ptr [ecx*8-1E43FFA6],dl
 0045028A    pop         edx
 0045028B    add         byte ptr [eax],dl
 0045028D    int         5A
 0045028F    add         byte ptr [eax],bl
 00450291    loope       004502ED
 00450293    add         byte ptr [ecx*8-1E8FFFA6],cl
 0045029A    pop         edx
 0045029B    add         byte ptr [eax],cl
 0045029D    int         5A
 0045029F    add         byte ptr [eax+4005AE6],cl
 004502A5    int         5A
 004502A7    add         byte ptr [ecx-32FFFFA6],al
 004502AE    pop         edx
 004502AF    add         ah,dh
 004502B1    jecxz       0045030D
 004502B3    add         ah,bh
 004502B5    int         3
 004502B6    pop         edx
 004502B7    add         byte ptr [eax],bl
 004502B9    jecxz       00450315
 004502BB    add         al,bh
 004502BD    int         3
 004502BE    pop         edx
 004502BF    add         byte ptr [edi+5A],ah
 004502C3    add         ah,dh
 004502C5    int         3
 004502C6    pop         edx
 004502C7    add         byte ptr [eax-19],ah
 004502CA    pop         edx
 004502CB    add         al,dh
 004502CD    int         3
 004502CE    pop         edx
 004502CF    add         byte ptr [edx-3313FFA6],dh
 004502D6    pop         edx
 004502D7    add         al,bh
 004502D9    out         5A,al
 004502DB    add         al,ch
 004502DD    int         3
 004502DE    pop         edx
 004502DF    add         byte ptr [eax-1BFFA51A],dl
 004502E5    int         3
 004502E6    pop         edx
 004502E7    add         al,ah
 004502E9    out         5A,eax
 004502EB    add         al,ah
 004502ED    int         3
 004502EE    pop         edx
 004502EF    add         byte ptr [eax-23FFA519],cl
 004502F5    int         3
 004502F6    pop         edx
 004502F7    add         ah,al
 004502F9    loop        00450355
 004502FB    add         al,bl
 004502FD    int         3
 004502FE    pop         edx
 004502FF    add         al,ah
 00450301    loop        0045035D
 00450303    add         ah,dl
 00450305    int         3
 00450306    pop         edx
 00450307    add         byte ptr [ebx],bh
 0045030A    pop         edx
 0045030B    add         byte ptr [ebp-75],dl;{Finalization}
*}
end;

Initialization
//0045037C
{*
 0045037C    sub         dword ptr ds:[5E0CA4],1
>00450383    jae         00450400
 00450385    mov         eax,450278;_NF__590
 0045038A    call        @InitResStringImports
 0045038F    mov         eax,[00437BA4];TControl
 00450394    call        StartClassGroup
 00450399    mov         eax,[00437BA4];TControl
 0045039E    call        ActivateClassGroup
 004503A3    mov         edx,dword ptr ds:[437BA4];TControl
 004503A9    mov         eax,[0044A154];TMenuItem
 004503AE    call        GroupDescendentsWith
 004503B3    mov         edx,dword ptr ds:[437BA4];TControl
 004503B9    mov         eax,[0044A578];TMenu
 004503BE    call        GroupDescendentsWith
 004503C3    mov         eax,[0044A154];TMenuItem
 004503C8    call        RegisterClass
 004503CD    mov         dl,1
 004503CF    mov         eax,[00417DA8];TBits
 004503D4    call        TObject.Create
 004503D9    mov         [005E0CA8],eax;CommandPool:TBits
 004503DE    mov         dl,1
 004503E0    mov         eax,[0044ABF4];TPopupList
 004503E5    call        TObject.Create
 004503EA    mov         [005E0C9C],eax;PopupList:TPopupList
 004503EF    mov         dl,1
 004503F1    mov         eax,[0044AC60];TMenuItemStack
 004503F6    call        TOrderedList.Create
 004503FB    mov         [005E0CA0],eax;ShortCutItems:TMenuItemStack
 00450400    ret
*}
Finalization
//0045030C
{*
 0045030C    push        ebp
 0045030D    mov         ebp,esp
 0045030F    xor         eax,eax
 00450311    push        ebp
 00450312    push        450370
 00450317    push        dword ptr fs:[eax]
 0045031A    mov         dword ptr fs:[eax],esp
 0045031D    inc         dword ptr ds:[5E0CA4]
>00450323    jne         00450362
 00450325    mov         eax,[005E0CA0];ShortCutItems:TMenuItemStack
 0045032A    call        TObject.Free
 0045032F    mov         eax,[005E0C9C];PopupList:TPopupList
 00450334    call        TObject.Free
 00450339    mov         eax,[005E0CA8];CommandPool:TBits
 0045033E    call        TObject.Free
 00450343    mov         eax,5ACCD4
 00450348    mov         ecx,12
 0045034D    mov         edx,dword ptr ds:[4010B4];String
 00450353    call        @FinalizeArray
 00450358    mov         eax,5ACCC0
 0045035D    call        @LStrClr
 00450362    xor         eax,eax
 00450364    pop         edx
 00450365    pop         ecx
 00450366    pop         ecx
 00450367    mov         dword ptr fs:[eax],edx
 0045036A    push        450377
 0045036F    ret
>00450370    jmp         @HandleFinally
>00450375    jmp         0045036F
 00450377    pop         ebp
 00450378    ret
*}
end.