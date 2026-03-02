//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit StdCtrls;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TTextLayout = (tlTop, tlCenter, tlBottom);
  TCustomLabel = class(TGraphicControl)
  public
    FFocusControl:TWinControl;//f168
    FAlignment:TAlignment;//f16C
    FAutoSize:Boolean;//f16D
    FLayout:TTextLayout;//f16E
    FWordWrap:Boolean;//f16F
    FShowAccelChar:Boolean;//f170
    FOnMouseLeave:TNotifyEvent;//f178
    FOnMouseEnter:TNotifyEvent;//f180
    FTransparentSet:Boolean;//f188
    procedure Loaded; virtual;//vC//004353A0
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00435588
    constructor Create(AOwner:TComponent); virtual;//v2C//00435088
    procedure SetAutoSize(Value:Boolean); virtual;//v5C//004354A8
    procedure Paint; virtual;//v8C//004352A4
    function GetLabelText:AnsiString; virtual;//v90//00435120
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//004355EC
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004355D4
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004355B8
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//00435688
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//004356AC
    procedure DoDrawText(var Rect:TRect; Flags:Longint); dynamic;//00435134
    procedure AdjustBounds; dynamic;//004353BC
    procedure SetAlignment(Value:TAlignment);//0043548C
    function GetTransparent:Boolean;//004354C4
    procedure SetFocusControl(Value:TWinControl);//004354D0
    procedure SetShowAccelChar(Value:Boolean);//004354E4
    procedure SetTransparent(Value:Boolean);//00435500
    procedure SetLayout(Value:TTextLayout);//00435544
    procedure SetWordWrap(Value:Boolean);//00435560
  end;
  TLabel = class(TCustomLabel)
  end;
  TButtonActionLink = class(TWinControlActionLink)
  public
    FClient:TButtonControl;//f28
    procedure AssignClient(AClient:TObject); virtual;//v0//004356D0
    function IsCheckedLinked:Boolean; virtual;//v24//004356F4
    procedure SetChecked(Value:Boolean); virtual;//v50//0043572C
  end;
  TButtonControl = class(TWinControl)
  public
    FClicksDisabled:Boolean;//f208
    FWordWrap:Boolean;//f209
    constructor Create(AOwner:TComponent); virtual;//v2C//00435790
    procedure WndProc(var Message:TMessage); virtual;//v74//0043583C
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//0043592C
    //function vC8:?; virtual;//vC8//00435834
    procedure vCC; virtual;//vCC//00435838
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//00435900
    procedure sub_0043582C; dynamic;//0043582C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//004357E4
    procedure SetWordWrap(const Value:Boolean);//00435950
  end;
  TButton = class(TButtonControl)
  public
    Default:Boolean;//f210
    Cancel:Boolean;//f211
    FActive:Boolean;//f212
    ModalResult:TModalResult;//f214
    constructor Create(AOwner:TComponent); virtual;//v2C//00435964
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//00435A78
    procedure CreateWnd; virtual;//vA0//00435AB4
    procedure SetButtonStyle(ADefault:Boolean); virtual;//vD0//004359F0
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//00435C28
    procedure CMDialogKey(var Message:TCMDialogKey); message CM_DIALOGKEY;//00435AE0
    procedure CMDialogChar(var Message:TCMDialogChar); message CM_DIALOGCHAR;//00435B50
    procedure CMFocusChanged(var Message:TCMFocusChanged); message CM_FOCUSCHANGED;//00435BD4
    procedure CNCommand(var Message:TWMCommand); dynamic;//00435ACC
    procedure UseRightToLeftAlignment; dynamic;//004359EC
    procedure Click; dynamic;//004359C8
    procedure SetDefault(Value:Boolean);//00435A44
  end;
    constructor Create(AOwner:TComponent);//00435088
    function GetLabelText:AnsiString;//00435120
    procedure DoDrawText(var Rect:TRect; Flags:Longint);//00435134
    procedure Paint;//004352A4
    procedure Loaded;//004353A0
    procedure AdjustBounds;//004353BC
    procedure SetAutoSize(Value:Boolean);//004354A8
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00435588
    procedure CMTextChanged(var Message:TMessage);//004355B8
    procedure CMFontChanged(var Message:TMessage);//004355D4
    procedure CMDialogChar(var Message:TCMDialogChar);//004355EC
    procedure CMMouseEnter(var Message:TMessage);//00435688
    procedure CMMouseLeave(var Message:TMessage);//004356AC
    procedure AssignClient(AClient:TObject);//004356D0
    function IsCheckedLinked:Boolean;//004356F4
    procedure SetChecked(Value:Boolean);//0043572C
    constructor Create(AOwner:TComponent);//00435790
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//004357E4
    procedure sub_0043582C;//0043582C
    //function sub_00435834:?;//00435834
    procedure sub_00435838;//00435838
    procedure WndProc(var Message:TMessage);//0043583C
    procedure CNCtlColorBtn(var Message:TWMCtlColorBtn);//004358B4
    procedure WMEraseBkGnd(var Message:TWMEraseBkgnd);//00435900
    procedure CreateParams(var Params:TCreateParams);//0043592C
    constructor Create(AOwner:TComponent);//00435964
    procedure Click;//004359C8
    procedure UseRightToLeftAlignment;//004359EC
    procedure SetButtonStyle(ADefault:Boolean);//004359F0
    procedure CreateParams(var Params:TCreateParams);//00435A78
    procedure CreateWnd;//00435AB4
    procedure CNCommand(var Message:TWMCommand);//00435ACC
    procedure CMDialogKey(var Message:TCMDialogKey);//00435AE0
    procedure CMDialogChar(var Message:TCMDialogChar);//00435B50
    procedure CMFocusChanged(var Message:TCMFocusChanged);//00435BD4
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//00435C28
    procedure CNCtlColorStatic(var Message:TWMCtlColorStatic);//00435C54

implementation

//00435088
constructor TCustomLabel.Create(AOwner:TComponent);
begin
{*
 00435088    push        ebx
 00435089    push        esi
 0043508A    test        dl,dl
>0043508C    je          00435096
 0043508E    add         esp,0FFFFFFF0
 00435091    call        @ClassCreate
 00435096    mov         ebx,edx
 00435098    mov         esi,eax
 0043509A    xor         edx,edx
 0043509C    mov         eax,esi
 0043509E    call        TGraphicControl.Create
 004350A3    mov         eax,dword ptr [esi+50]
 004350A6    or          eax,dword ptr ds:[435118]
 004350AC    mov         dword ptr [esi+50],eax
 004350AF    mov         edx,41
 004350B4    mov         eax,esi
 004350B6    call        TControl.SetWidth
 004350BB    mov         edx,11
 004350C0    mov         eax,esi
 004350C2    call        TControl.SetHeight
 004350C7    mov         byte ptr [esi+16D],1
 004350CE    mov         byte ptr [esi+170],1
 004350D5    call        ThemeServices
 004350DA    call        TThemeServices.GetThemesEnabled
 004350DF    test        al,al
>004350E1    je          004350F2
 004350E3    mov         eax,[0043511C]
 004350E8    not         eax
 004350EA    and         eax,dword ptr [esi+50]
 004350ED    mov         dword ptr [esi+50],eax
>004350F0    jmp         004350FE
 004350F2    mov         eax,dword ptr [esi+50]
 004350F5    or          eax,dword ptr ds:[43511C]
 004350FB    mov         dword ptr [esi+50],eax
 004350FE    mov         eax,esi
 00435100    test        bl,bl
>00435102    je          00435113
 00435104    call        @AfterConstruction
 00435109    pop         dword ptr fs:[0]
 00435110    add         esp,0C
 00435113    mov         eax,esi
 00435115    pop         esi
 00435116    pop         ebx
 00435117    ret
*}
end;

//00435120
function TCustomLabel.GetLabelText:AnsiString;
begin
{*
 00435120    push        ebx
 00435121    push        esi
 00435122    mov         esi,edx
 00435124    mov         ebx,eax
 00435126    mov         edx,esi
 00435128    mov         eax,ebx
 0043512A    call        TControl.GetText
 0043512F    pop         esi
 00435130    pop         ebx
 00435131    ret
*}
end;

//00435134
procedure TCustomLabel.DoDrawText(var Rect:TRect; Flags:Longint);
begin
{*
 00435134    push        ebp
 00435135    mov         ebp,esp
 00435137    push        0
 00435139    push        ebx
 0043513A    push        esi
 0043513B    push        edi
 0043513C    mov         esi,ecx
 0043513E    mov         edi,edx
 00435140    mov         ebx,eax
 00435142    xor         eax,eax
 00435144    push        ebp
 00435145    push        43528A
 0043514A    push        dword ptr fs:[eax]
 0043514D    mov         dword ptr fs:[eax],esp
 00435150    lea         edx,[ebp-4]
 00435153    mov         eax,ebx
 00435155    mov         ecx,dword ptr [eax]
 00435157    call        dword ptr [ecx+90]
 0043515D    test        esi,400
>00435163    je          00435192
 00435165    cmp         dword ptr [ebp-4],0
>00435169    je          00435185
 0043516B    cmp         byte ptr [ebx+170],0
>00435172    je          00435192
 00435174    mov         eax,dword ptr [ebp-4]
 00435177    cmp         byte ptr [eax],26
>0043517A    jne         00435192
 0043517C    mov         eax,dword ptr [ebp-4]
 0043517F    cmp         byte ptr [eax+1],0
>00435183    jne         00435192
 00435185    lea         eax,[ebp-4]
 00435188    mov         edx,4352A0;' '
 0043518D    call        @LStrCat
 00435192    cmp         byte ptr [ebx+170],0
>00435199    jne         004351A1
 0043519B    or          esi,800
 004351A1    mov         edx,esi
 004351A3    mov         eax,ebx
 004351A5    call        TControl.DrawTextBiDiModeFlags
 004351AA    mov         esi,eax
 004351AC    mov         edx,dword ptr [ebx+68]
 004351AF    mov         eax,dword ptr [ebx+160]
 004351B5    call        TCanvas.SetFont
 004351BA    mov         eax,ebx
 004351BC    mov         edx,dword ptr [eax]
 004351BE    call        dword ptr [edx+50]
 004351C1    test        al,al
>004351C3    jne         0043524F
 004351C9    push        1
 004351CB    push        1
 004351CD    push        edi
 004351CE    call        user32.OffsetRect
 004351D3    mov         eax,dword ptr [ebx+160]
 004351D9    mov         eax,dword ptr [eax+0C]
 004351DC    mov         edx,0FF000014
 004351E1    call        TFont.SetColor
 004351E6    push        esi
 004351E7    push        edi
 004351E8    mov         eax,dword ptr [ebp-4]
 004351EB    call        @LStrLen
 004351F0    push        eax
 004351F1    mov         eax,dword ptr [ebp-4]
 004351F4    call        @LStrToPChar
 004351F9    push        eax
 004351FA    mov         eax,dword ptr [ebx+160]
 00435200    call        TCanvas.GetHandle
 00435205    push        eax
 00435206    call        user32.DrawTextA
 0043520B    push        0FF
 0043520D    push        0FF
 0043520F    push        edi
 00435210    call        user32.OffsetRect
 00435215    mov         eax,dword ptr [ebx+160]
 0043521B    mov         eax,dword ptr [eax+0C]
 0043521E    mov         edx,0FF000010
 00435223    call        TFont.SetColor
 00435228    push        esi
 00435229    push        edi
 0043522A    mov         eax,dword ptr [ebp-4]
 0043522D    call        @LStrLen
 00435232    push        eax
 00435233    mov         eax,dword ptr [ebp-4]
 00435236    call        @LStrToPChar
 0043523B    push        eax
 0043523C    mov         eax,dword ptr [ebx+160]
 00435242    call        TCanvas.GetHandle
 00435247    push        eax
 00435248    call        user32.DrawTextA
>0043524D    jmp         00435274
 0043524F    push        esi
 00435250    push        edi
 00435251    mov         eax,dword ptr [ebp-4]
 00435254    call        @LStrLen
 00435259    push        eax
 0043525A    mov         eax,dword ptr [ebp-4]
 0043525D    call        @LStrToPChar
 00435262    push        eax
 00435263    mov         eax,dword ptr [ebx+160]
 00435269    call        TCanvas.GetHandle
 0043526E    push        eax
 0043526F    call        user32.DrawTextA
 00435274    xor         eax,eax
 00435276    pop         edx
 00435277    pop         ecx
 00435278    pop         ecx
 00435279    mov         dword ptr fs:[eax],edx
 0043527C    push        435291
 00435281    lea         eax,[ebp-4]
 00435284    call        @LStrClr
 00435289    ret
>0043528A    jmp         @HandleFinally
>0043528F    jmp         00435281
 00435291    pop         edi
 00435292    pop         esi
 00435293    pop         ebx
 00435294    pop         ecx
 00435295    pop         ebp
 00435296    ret
*}
end;

//004352A4
procedure TCustomLabel.Paint;
begin
{*
 004352A4    push        ebx
 004352A5    push        esi
 004352A6    push        edi
 004352A7    add         esp,0FFFFFFD0
 004352AA    mov         ebx,eax
 004352AC    mov         esi,dword ptr [ebx+160]
 004352B2    mov         eax,ebx
 004352B4    call        TCustomLabel.GetTransparent
 004352B9    test        al,al
>004352BB    jne         004352E8
 004352BD    mov         edx,dword ptr [ebx+70]
 004352C0    mov         eax,dword ptr [esi+14]
 004352C3    call        TBrush.SetColor
 004352C8    xor         edx,edx
 004352CA    mov         eax,dword ptr [esi+14]
 004352CD    call        TBrush.SetStyle
 004352D2    lea         edx,[esp+20]
 004352D6    mov         eax,ebx
 004352D8    mov         ecx,dword ptr [eax]
 004352DA    call        dword ptr [ecx+44]
 004352DD    lea         edx,[esp+20]
 004352E1    mov         eax,esi
 004352E3    call        TCanvas.FillRect
 004352E8    mov         dl,1
 004352EA    mov         eax,dword ptr [esi+14]
 004352ED    call        TBrush.SetStyle
 004352F2    mov         edx,esp
 004352F4    mov         eax,ebx
 004352F6    mov         ecx,dword ptr [eax]
 004352F8    call        dword ptr [ecx+44]
 004352FB    xor         eax,eax
 004352FD    mov         al,byte ptr [ebx+16F]
 00435303    mov         di,word ptr [eax*2+5ACB54]
 0043530B    or          di,40
 0043530F    xor         eax,eax
 00435311    mov         al,byte ptr [ebx+16C]
 00435317    or          di,word ptr [eax*2+5ACB4C]
 0043531F    movzx       edi,di
 00435322    cmp         byte ptr [ebx+16E],0
>00435329    je          0043538A
 0043532B    push        edi
 0043532C    lea         esi,[esp+4]
 00435330    lea         edi,[esp+14]
 00435334    movs        dword ptr [edi],dword ptr [esi]
 00435335    movs        dword ptr [edi],dword ptr [esi]
 00435336    movs        dword ptr [edi],dword ptr [esi]
 00435337    movs        dword ptr [edi],dword ptr [esi]
 00435338    pop         edi
 00435339    mov         ecx,edi
 0043533B    or          ecx,400
 00435341    lea         edx,[esp+10]
 00435345    mov         eax,ebx
 00435347    mov         si,0FFC6
 0043534B    call        @CallDynaInst
 00435350    cmp         byte ptr [ebx+16E],2
>00435357    jne         0043536F
 00435359    mov         eax,dword ptr [ebx+4C]
 0043535C    sub         eax,dword ptr [esp+1C]
 00435360    push        eax
 00435361    push        0
 00435363    lea         eax,[esp+8]
 00435367    push        eax
 00435368    call        user32.OffsetRect
>0043536D    jmp         0043538A
 0043536F    mov         eax,dword ptr [ebx+4C]
 00435372    sub         eax,dword ptr [esp+1C]
 00435376    sar         eax,1
>00435378    jns         0043537D
 0043537A    adc         eax,0
 0043537D    push        eax
 0043537E    push        0
 00435380    lea         eax,[esp+8]
 00435384    push        eax
 00435385    call        user32.OffsetRect
 0043538A    mov         edx,esp
 0043538C    mov         ecx,edi
 0043538E    mov         eax,ebx
 00435390    mov         si,0FFC6
 00435394    call        @CallDynaInst
 00435399    add         esp,30
 0043539C    pop         edi
 0043539D    pop         esi
 0043539E    pop         ebx
 0043539F    ret
*}
end;

//004353A0
procedure TCustomLabel.Loaded;
begin
{*
 004353A0    push        ebx
 004353A1    push        esi
 004353A2    mov         ebx,eax
 004353A4    mov         eax,ebx
 004353A6    call        TControl.Loaded
 004353AB    mov         eax,ebx
 004353AD    mov         si,0FFC7
 004353B1    call        @CallDynaInst
 004353B6    pop         esi
 004353B7    pop         ebx
 004353B8    ret
*}
end;

//004353BC
procedure TCustomLabel.AdjustBounds;
begin
{*
 004353BC    push        ebx
 004353BD    push        esi
 004353BE    push        edi
 004353BF    add         esp,0FFFFFFEC
 004353C2    mov         edi,eax
 004353C4    test        byte ptr [edi+1C],2
>004353C8    jne         00435482
 004353CE    cmp         byte ptr [edi+16D],0
>004353D5    je          00435482
 004353DB    lea         edx,[esp+1]
 004353DF    mov         eax,edi
 004353E1    mov         ecx,dword ptr [eax]
 004353E3    call        dword ptr [ecx+44]
 004353E6    push        0
 004353E8    call        user32.GetDC
 004353ED    mov         ebx,eax
 004353EF    mov         edx,ebx
 004353F1    mov         eax,dword ptr [edi+160]
 004353F7    call        TCanvas.SetHandle
 004353FC    xor         eax,eax
 004353FE    mov         al,byte ptr [edi+16F]
 00435404    mov         cx,word ptr [eax*2+5ACB58]
 0043540C    or          cx,440
 00435411    movzx       ecx,cx
 00435414    lea         edx,[esp+1]
 00435418    mov         eax,edi
 0043541A    mov         si,0FFC6
 0043541E    call        @CallDynaInst
 00435423    xor         edx,edx
 00435425    mov         eax,dword ptr [edi+160]
 0043542B    call        TCanvas.SetHandle
 00435430    push        ebx
 00435431    push        0
 00435433    call        user32.ReleaseDC
 00435438    mov         ebx,dword ptr [edi+40]
 0043543B    mov         al,byte ptr [edi+16C]
 00435441    mov         byte ptr [esp],al
 00435444    mov         eax,edi
 00435446    mov         si,0FFC8
 0043544A    call        @CallDynaInst
 0043544F    test        al,al
>00435451    je          0043545A
 00435453    mov         eax,esp
 00435455    call        ChangeBiDiModeAlignment
 0043545A    cmp         byte ptr [esp],1
>0043545E    jne         00435469
 00435460    mov         eax,dword ptr [edi+48]
 00435463    sub         eax,dword ptr [esp+9]
 00435467    add         ebx,eax
 00435469    mov         eax,dword ptr [esp+9]
 0043546D    push        eax
 0043546E    mov         eax,dword ptr [esp+11]
 00435472    push        eax
 00435473    mov         ecx,dword ptr [edi+44]
 00435476    mov         edx,ebx
 00435478    mov         eax,edi
 0043547A    mov         ebx,dword ptr [eax]
 0043547C    call        dword ptr [ebx+84]
 00435482    add         esp,14
 00435485    pop         edi
 00435486    pop         esi
 00435487    pop         ebx
 00435488    ret
*}
end;

//0043548C
procedure TCustomLabel.SetAlignment(Value:TAlignment);
begin
{*
 0043548C    push        esi
 0043548D    mov         esi,eax
 0043548F    cmp         dl,byte ptr [esi+16C]
>00435495    je          004354A4
 00435497    mov         byte ptr [esi+16C],dl
 0043549D    mov         eax,esi
 0043549F    mov         edx,dword ptr [eax]
 004354A1    call        dword ptr [edx+7C]
 004354A4    pop         esi
 004354A5    ret
*}
end;

//004354A8
procedure TCustomLabel.SetAutoSize(Value:Boolean);
begin
{*
 004354A8    push        esi
 004354A9    cmp         dl,byte ptr [eax+16D]
>004354AF    je          004354C0
 004354B1    mov         byte ptr [eax+16D],dl
 004354B7    mov         si,0FFC7
 004354BB    call        @CallDynaInst
 004354C0    pop         esi
 004354C1    ret
*}
end;

//004354C4
function TCustomLabel.GetTransparent:Boolean;
begin
{*
 004354C4    test        byte ptr [eax+50],40
 004354C8    setne       al
 004354CB    xor         al,1
 004354CD    ret
*}
end;

//004354D0
procedure TCustomLabel.SetFocusControl(Value:TWinControl);
begin
{*
 004354D0    mov         dword ptr [eax+168],edx
 004354D6    test        edx,edx
>004354D8    je          004354E0
 004354DA    xchg        eax,edx
 004354DB    call        TComponent.FreeNotification
 004354E0    ret
*}
end;

//004354E4
procedure TCustomLabel.SetShowAccelChar(Value:Boolean);
begin
{*
 004354E4    push        esi
 004354E5    mov         esi,eax
 004354E7    cmp         dl,byte ptr [esi+170]
>004354ED    je          004354FC
 004354EF    mov         byte ptr [esi+170],dl
 004354F5    mov         eax,esi
 004354F7    mov         edx,dword ptr [eax]
 004354F9    call        dword ptr [edx+7C]
 004354FC    pop         esi
 004354FD    ret
*}
end;

//00435500
procedure TCustomLabel.SetTransparent(Value:Boolean);
begin
{*
 00435500    push        ebx
 00435501    push        esi
 00435502    mov         ebx,edx
 00435504    mov         esi,eax
 00435506    mov         eax,esi
 00435508    call        TCustomLabel.GetTransparent
 0043550D    cmp         bl,al
>0043550F    je          00435536
 00435511    test        bl,bl
>00435513    je          00435524
 00435515    mov         eax,[00435540]
 0043551A    not         eax
 0043551C    and         eax,dword ptr [esi+50]
 0043551F    mov         dword ptr [esi+50],eax
>00435522    jmp         0043552F
 00435524    mov         eax,[00435540]
 00435529    or          eax,dword ptr [esi+50]
 0043552C    mov         dword ptr [esi+50],eax
 0043552F    mov         eax,esi
 00435531    mov         edx,dword ptr [eax]
 00435533    call        dword ptr [edx+7C]
 00435536    mov         byte ptr [esi+188],1
 0043553D    pop         esi
 0043553E    pop         ebx
 0043553F    ret
*}
end;

//00435544
procedure TCustomLabel.SetLayout(Value:TTextLayout);
begin
{*
 00435544    push        esi
 00435545    mov         esi,eax
 00435547    cmp         dl,byte ptr [esi+16E]
>0043554D    je          0043555C
 0043554F    mov         byte ptr [esi+16E],dl
 00435555    mov         eax,esi
 00435557    mov         edx,dword ptr [eax]
 00435559    call        dword ptr [edx+7C]
 0043555C    pop         esi
 0043555D    ret
*}
end;

//00435560
procedure TCustomLabel.SetWordWrap(Value:Boolean);
begin
{*
 00435560    push        esi
 00435561    push        edi
 00435562    mov         edi,eax
 00435564    cmp         dl,byte ptr [edi+16F]
>0043556A    je          00435584
 0043556C    mov         byte ptr [edi+16F],dl
 00435572    mov         eax,edi
 00435574    mov         si,0FFC7
 00435578    call        @CallDynaInst
 0043557D    mov         eax,edi
 0043557F    mov         edx,dword ptr [eax]
 00435581    call        dword ptr [edx+7C]
 00435584    pop         edi
 00435585    pop         esi
 00435586    ret
*}
end;

//00435588
procedure TCustomLabel.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00435588    push        ebx
 00435589    push        esi
 0043558A    push        edi
 0043558B    mov         ebx,ecx
 0043558D    mov         esi,edx
 0043558F    mov         edi,eax
 00435591    mov         ecx,ebx
 00435593    mov         edx,esi
 00435595    mov         eax,edi
 00435597    call        TControl.Notification
 0043559C    cmp         bl,1
>0043559F    jne         004355B1
 004355A1    cmp         esi,dword ptr [edi+168]
>004355A7    jne         004355B1
 004355A9    xor         eax,eax
 004355AB    mov         dword ptr [edi+168],eax
 004355B1    pop         edi
 004355B2    pop         esi
 004355B3    pop         ebx
 004355B4    ret
*}
end;

//004355B8
procedure TCustomLabel.CMTextChanged(var Message:TMessage);
begin
{*
 004355B8    push        ebx
 004355B9    push        esi
 004355BA    mov         ebx,eax
 004355BC    mov         eax,ebx
 004355BE    mov         edx,dword ptr [eax]
 004355C0    call        dword ptr [edx+7C]
 004355C3    mov         eax,ebx
 004355C5    mov         si,0FFC7
 004355C9    call        @CallDynaInst
 004355CE    pop         esi
 004355CF    pop         ebx
 004355D0    ret
*}
end;

//004355D4
procedure TCustomLabel.CMFontChanged(var Message:TMessage);
begin
{*
 004355D4    push        esi
 004355D5    mov         esi,eax
 004355D7    mov         eax,esi
 004355D9    call        TControl.CMFontChanged
 004355DE    mov         eax,esi
 004355E0    mov         si,0FFC7
 004355E4    call        @CallDynaInst
 004355E9    pop         esi
 004355EA    ret
*}
end;

//004355EC
procedure TCustomLabel.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 004355EC    push        ebp
 004355ED    mov         ebp,esp
 004355EF    push        0
 004355F1    push        ebx
 004355F2    push        esi
 004355F3    push        edi
 004355F4    mov         edi,edx
 004355F6    mov         ebx,eax
 004355F8    xor         eax,eax
 004355FA    push        ebp
 004355FB    push        435679
 00435600    push        dword ptr fs:[eax]
 00435603    mov         dword ptr fs:[eax],esp
 00435606    cmp         dword ptr [ebx+168],0
>0043560D    je          00435663
 0043560F    mov         eax,ebx
 00435611    mov         edx,dword ptr [eax]
 00435613    call        dword ptr [edx+50]
 00435616    test        al,al
>00435618    je          00435663
 0043561A    cmp         byte ptr [ebx+170],0
>00435621    je          00435663
 00435623    lea         edx,[ebp-4]
 00435626    mov         eax,ebx
 00435628    call        TControl.GetText
 0043562D    mov         edx,dword ptr [ebp-4]
 00435630    mov         ax,word ptr [edi+4]
 00435634    call        IsAccel
 00435639    test        al,al
>0043563B    je          00435663
 0043563D    mov         ebx,dword ptr [ebx+168]
 00435643    mov         eax,ebx
 00435645    mov         si,0FFB8
 00435649    call        @CallDynaInst
 0043564E    test        al,al
>00435650    je          00435663
 00435652    mov         eax,ebx
 00435654    mov         edx,dword ptr [eax]
 00435656    call        dword ptr [edx+0C4]
 0043565C    mov         dword ptr [edi+0C],1
 00435663    xor         eax,eax
 00435665    pop         edx
 00435666    pop         ecx
 00435667    pop         ecx
 00435668    mov         dword ptr fs:[eax],edx
 0043566B    push        435680
 00435670    lea         eax,[ebp-4]
 00435673    call        @LStrClr
 00435678    ret
>00435679    jmp         @HandleFinally
>0043567E    jmp         00435670
 00435680    pop         edi
 00435681    pop         esi
 00435682    pop         ebx
 00435683    pop         ecx
 00435684    pop         ebp
 00435685    ret
*}
end;

//00435688
procedure TCustomLabel.CMMouseEnter(var Message:TMessage);
begin
{*
 00435688    push        ebx
 00435689    mov         ebx,eax
 0043568B    mov         eax,ebx
 0043568D    call        TControl.CMMouseEnter
 00435692    cmp         word ptr [ebx+182],0
>0043569A    je          004356AA
 0043569C    mov         edx,ebx
 0043569E    mov         eax,dword ptr [ebx+184]
 004356A4    call        dword ptr [ebx+180]
 004356AA    pop         ebx
 004356AB    ret
*}
end;

//004356AC
procedure TCustomLabel.CMMouseLeave(var Message:TMessage);
begin
{*
 004356AC    push        ebx
 004356AD    mov         ebx,eax
 004356AF    mov         eax,ebx
 004356B1    call        TControl.CMMouseLeave
 004356B6    cmp         word ptr [ebx+17A],0
>004356BE    je          004356CE
 004356C0    mov         edx,ebx
 004356C2    mov         eax,dword ptr [ebx+17C]
 004356C8    call        dword ptr [ebx+178]
 004356CE    pop         ebx
 004356CF    ret
*}
end;

//004356D0
procedure TButtonActionLink.AssignClient(AClient:TObject);
begin
{*
 004356D0    push        ebx
 004356D1    push        esi
 004356D2    mov         esi,edx
 004356D4    mov         ebx,eax
 004356D6    mov         edx,esi
 004356D8    mov         eax,ebx
 004356DA    call        TWinControlActionLink.AssignClient
 004356DF    mov         eax,esi
 004356E1    mov         edx,dword ptr ds:[434844];TButtonControl
 004356E7    call        @AsClass
 004356EC    mov         dword ptr [ebx+28],eax
 004356EF    pop         esi
 004356F0    pop         ebx
 004356F1    ret
*}
end;

//004356F4
function TButtonActionLink.IsCheckedLinked:Boolean;
begin
{*
 004356F4    push        ebx
 004356F5    mov         ebx,eax
 004356F7    mov         eax,ebx
 004356F9    call        TActionLink.IsCheckedLinked
 004356FE    test        al,al
>00435700    je          00435722
 00435702    mov         eax,dword ptr [ebx+28]
 00435705    mov         edx,dword ptr [eax]
 00435707    call        dword ptr [edx+0C8]
 0043570D    push        eax
 0043570E    mov         eax,dword ptr [ebx+10]
 00435711    mov         edx,dword ptr ds:[44776C];TCustomAction
 00435717    call        @AsClass
 0043571C    pop         edx
 0043571D    cmp         dl,byte ptr [eax+69]
>00435720    je          00435726
 00435722    xor         eax,eax
 00435724    pop         ebx
 00435725    ret
 00435726    mov         al,1
 00435728    pop         ebx
 00435729    ret
*}
end;

//0043572C
procedure TButtonActionLink.SetChecked(Value:Boolean);
begin
{*
 0043572C    push        ebp
 0043572D    mov         ebp,esp
 0043572F    push        ecx
 00435730    push        ebx
 00435731    mov         ebx,edx
 00435733    mov         dword ptr [ebp-4],eax
 00435736    mov         eax,dword ptr [ebp-4]
 00435739    mov         edx,dword ptr [eax]
 0043573B    call        dword ptr [edx+24]
 0043573E    test        al,al
>00435740    je          00435789
 00435742    mov         eax,dword ptr [ebp-4]
 00435745    mov         eax,dword ptr [eax+28]
 00435748    mov         byte ptr [eax+208],1
 0043574F    xor         edx,edx
 00435751    push        ebp
 00435752    push        435782
 00435757    push        dword ptr fs:[edx]
 0043575A    mov         dword ptr fs:[edx],esp
 0043575D    mov         edx,ebx
 0043575F    mov         ecx,dword ptr [eax]
 00435761    call        dword ptr [ecx+0CC]
 00435767    xor         eax,eax
 00435769    pop         edx
 0043576A    pop         ecx
 0043576B    pop         ecx
 0043576C    mov         dword ptr fs:[eax],edx
 0043576F    push        435789
 00435774    mov         eax,dword ptr [ebp-4]
 00435777    mov         eax,dword ptr [eax+28]
 0043577A    mov         byte ptr [eax+208],0
 00435781    ret
>00435782    jmp         @HandleFinally
>00435787    jmp         00435774
 00435789    pop         ebx
 0043578A    pop         ecx
 0043578B    pop         ebp
 0043578C    ret
*}
end;

//00435790
constructor TButtonControl.Create(AOwner:TComponent);
begin
{*
 00435790    push        ebx
 00435791    push        esi
 00435792    test        dl,dl
>00435794    je          0043579E
 00435796    add         esp,0FFFFFFF0
 00435799    call        @ClassCreate
 0043579E    mov         ebx,edx
 004357A0    mov         esi,eax
 004357A2    xor         edx,edx
 004357A4    mov         eax,esi
 004357A6    call        TWinControl.Create
 004357AB    mov         eax,[005AE810];^SysLocale:TSysLocale
 004357B0    cmp         byte ptr [eax+0C],0
>004357B4    je          004357C7
 004357B6    mov         eax,[005AE800]
 004357BB    cmp         dword ptr [eax],2
>004357BE    jne         004357C7
 004357C0    mov         byte ptr [esi+184],0
 004357C7    mov         eax,esi
 004357C9    test        bl,bl
>004357CB    je          004357DC
 004357CD    call        @AfterConstruction
 004357D2    pop         dword ptr fs:[0]
 004357D9    add         esp,0C
 004357DC    mov         eax,esi
 004357DE    pop         esi
 004357DF    pop         ebx
 004357E0    ret
*}
end;

//004357E4
procedure TButtonControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 004357E4    push        ebx
 004357E5    push        esi
 004357E6    push        edi
 004357E7    mov         ebx,ecx
 004357E9    mov         esi,edx
 004357EB    mov         edi,eax
 004357ED    mov         ecx,ebx
 004357EF    mov         edx,esi
 004357F1    mov         eax,edi
 004357F3    call        TWinControl.ActionChange
 004357F8    mov         eax,esi
 004357FA    mov         edx,dword ptr ds:[44776C];TCustomAction
 00435800    call        @IsClass
 00435805    test        al,al
>00435807    je          00435828
 00435809    test        bl,bl
>0043580B    je          0043581B
 0043580D    mov         eax,edi
 0043580F    mov         edx,dword ptr [eax]
 00435811    call        dword ptr [edx+0C8]
 00435817    test        al,al
>00435819    jne         00435828
 0043581B    mov         dl,byte ptr [esi+69]
 0043581E    mov         eax,edi
 00435820    mov         ecx,dword ptr [eax]
 00435822    call        dword ptr [ecx+0CC]
 00435828    pop         edi
 00435829    pop         esi
 0043582A    pop         ebx
 0043582B    ret
*}
end;

//0043582C
procedure TButtonControl.sub_0043582C;
begin
{*
 0043582C    mov         eax,[00434768];TButtonActionLink
 00435831    ret
*}
end;

//00435834
{*function sub_00435834:?;
begin
 00435834    xor         eax,eax
 00435836    ret
end;*}

//00435838
procedure sub_00435838;
begin
{*
 00435838    ret
*}
end;

//0043583C
procedure TButtonControl.WndProc(var Message:TMessage);
begin
{*
 0043583C    push        ebx
 0043583D    push        esi
 0043583E    push        edi
 0043583F    mov         edi,edx
 00435841    mov         ebx,eax
 00435843    mov         eax,dword ptr [edi]
 00435845    sub         eax,201
>0043584A    je          0043585A
 0043584C    sub         eax,2
>0043584F    je          0043585A
 00435851    sub         eax,0BB0E
>00435856    je          0043589B
>00435858    jmp         004358A4
 0043585A    test        byte ptr [ebx+1C],10
>0043585E    jne         004358A4
 00435860    mov         eax,ebx
 00435862    mov         si,0FFB5
 00435866    call        @CallDynaInst
 0043586B    test        al,al
>0043586D    jne         004358A4
 0043586F    mov         byte ptr [ebx+208],1
 00435876    mov         eax,ebx
 00435878    call        TWinControl.GetHandle
 0043587D    push        eax
 0043587E    call        user32.SetFocus
 00435883    mov         byte ptr [ebx+208],0
 0043588A    mov         eax,ebx
 0043588C    mov         si,0FFB5
 00435890    call        @CallDynaInst
 00435895    test        al,al
>00435897    je          004358AD
>00435899    jmp         004358A4
 0043589B    cmp         byte ptr [ebx+208],0
>004358A2    jne         004358AD
 004358A4    mov         edx,edi
 004358A6    mov         eax,ebx
 004358A8    call        TWinControl.WndProc
 004358AD    pop         edi
 004358AE    pop         esi
 004358AF    pop         ebx
 004358B0    ret
*}
end;

//004358B4
procedure TButton.CNCtlColorBtn(var Message:TWMCtlColorBtn);
begin
{*
 004358B4    push        ebx
 004358B5    push        esi
 004358B6    push        edi
 004358B7    mov         edi,edx
 004358B9    mov         esi,eax
 004358BB    call        ThemeServices
 004358C0    mov         ebx,eax
 004358C2    mov         eax,ebx
 004358C4    call        TThemeServices.GetThemesEnabled
 004358C9    test        al,al
>004358CB    je          004358F2
 004358CD    push        0
 004358CF    push        0
 004358D1    push        0
 004358D3    mov         eax,esi
 004358D5    call        TWinControl.GetHandle
 004358DA    mov         edx,eax
 004358DC    mov         ecx,dword ptr [edi+4]
 004358DF    mov         eax,ebx
 004358E1    call        TThemeServices.DrawParentBackground
 004358E6    push        5
 004358E8    call        gdi32.GetStockObject
 004358ED    mov         dword ptr [edi+0C],eax
>004358F0    jmp         004358FB
 004358F2    mov         edx,edi
 004358F4    mov         eax,esi
 004358F6    mov         ecx,dword ptr [eax]
 004358F8    call        dword ptr [ecx-10]
 004358FB    pop         edi
 004358FC    pop         esi
 004358FD    pop         ebx
 004358FE    ret
*}
end;

//00435900
procedure TButtonControl.WMEraseBkGnd(var Message:TWMEraseBkgnd);
begin
{*
 00435900    push        ebx
 00435901    push        esi
 00435902    mov         esi,edx
 00435904    mov         ebx,eax
 00435906    call        ThemeServices
 0043590B    call        TThemeServices.GetThemesEnabled
 00435910    test        al,al
>00435912    je          0043591E
 00435914    mov         dword ptr [esi+0C],1
 0043591B    pop         esi
 0043591C    pop         ebx
 0043591D    ret
 0043591E    mov         edx,esi
 00435920    mov         eax,ebx
 00435922    call        TWinControl.WMEraseBkgnd
 00435927    pop         esi
 00435928    pop         ebx
 00435929    ret
*}
end;

//0043592C
procedure TButtonControl.CreateParams(var Params:TCreateParams);
begin
{*
 0043592C    push        ebx
 0043592D    push        esi
 0043592E    mov         esi,edx
 00435930    mov         ebx,eax
 00435932    mov         edx,esi
 00435934    mov         eax,ebx
 00435936    call        TWinControl.CreateParams
 0043593B    cmp         byte ptr [ebx+209],0
>00435942    je          0043594B
 00435944    or          dword ptr [esi+4],2000
 0043594B    pop         esi
 0043594C    pop         ebx
 0043594D    ret
*}
end;

//00435950
procedure TButtonControl.SetWordWrap(const Value:Boolean);
begin
{*
 00435950    cmp         dl,byte ptr [eax+209]
>00435956    je          00435963
 00435958    mov         byte ptr [eax+209],dl
 0043595E    call        TWinControl.RecreateWnd
 00435963    ret
*}
end;

//00435964
constructor TButton.Create(AOwner:TComponent);
begin
{*
 00435964    push        ebx
 00435965    push        esi
 00435966    test        dl,dl
>00435968    je          00435972
 0043596A    add         esp,0FFFFFFF0
 0043596D    call        @ClassCreate
 00435972    mov         ebx,edx
 00435974    mov         esi,eax
 00435976    xor         edx,edx
 00435978    mov         eax,esi
 0043597A    call        TButtonControl.Create
 0043597F    mov         eax,[004359C4]
 00435984    mov         dword ptr [esi+50],eax
 00435987    mov         edx,4B
 0043598C    mov         eax,esi
 0043598E    call        TControl.SetWidth
 00435993    mov         edx,19
 00435998    mov         eax,esi
 0043599A    call        TControl.SetHeight
 0043599F    mov         dl,1
 004359A1    mov         eax,esi
 004359A3    call        TWinControl.SetTabStop
 004359A8    mov         eax,esi
 004359AA    test        bl,bl
>004359AC    je          004359BD
 004359AE    call        @AfterConstruction
 004359B3    pop         dword ptr fs:[0]
 004359BA    add         esp,0C
 004359BD    mov         eax,esi
 004359BF    pop         esi
 004359C0    pop         ebx
 004359C1    ret
*}
end;

//004359C8
procedure TButton.Click;
begin
{*
 004359C8    push        ebx
 004359C9    mov         ebx,eax
 004359CB    mov         eax,ebx
 004359CD    call        GetParentForm
 004359D2    test        eax,eax
>004359D4    je          004359E2
 004359D6    mov         edx,dword ptr [ebx+214]
 004359DC    mov         dword ptr [eax+24C],edx
 004359E2    mov         eax,ebx
 004359E4    call        TControl.Click
 004359E9    pop         ebx
 004359EA    ret
*}
end;

//004359EC
procedure TButton.UseRightToLeftAlignment;
begin
{*
 004359EC    xor         eax,eax
 004359EE    ret
*}
end;

//004359F0
procedure TButton.SetButtonStyle(ADefault:Boolean);
begin
{*
 004359F0    push        ebx
 004359F1    push        esi
 004359F2    push        edi
 004359F3    push        ebp
 004359F4    mov         ebx,edx
 004359F6    mov         ebp,eax
 004359F8    mov         eax,ebp
 004359FA    call        TWinControl.HandleAllocated
 004359FF    test        al,al
>00435A01    je          00435A3D
 00435A03    test        bl,bl
>00435A05    je          00435A0D
 00435A07    mov         si,1
>00435A0B    jmp         00435A0F
 00435A0D    xor         esi,esi
 00435A0F    push        0F0
 00435A11    mov         eax,ebp
 00435A13    call        TWinControl.GetHandle
 00435A18    push        eax
 00435A19    call        user32.GetWindowLongA
 00435A1E    and         eax,0F
 00435A21    movzx       edi,si
 00435A24    cmp         eax,edi
>00435A26    je          00435A3D
 00435A28    push        1
 00435A2A    push        edi
 00435A2B    push        0F4
 00435A30    mov         eax,ebp
 00435A32    call        TWinControl.GetHandle
 00435A37    push        eax
 00435A38    call        user32.SendMessageA
 00435A3D    pop         ebp
 00435A3E    pop         edi
 00435A3F    pop         esi
 00435A40    pop         ebx
 00435A41    ret
*}
end;

//00435A44
procedure TButton.SetDefault(Value:Boolean);
begin
{*
 00435A44    push        ebx
 00435A45    mov         ebx,eax
 00435A47    mov         byte ptr [ebx+210],dl
 00435A4D    mov         eax,ebx
 00435A4F    call        TWinControl.HandleAllocated
 00435A54    test        al,al
>00435A56    je          00435A76
 00435A58    mov         eax,ebx
 00435A5A    call        GetParentForm
 00435A5F    test        eax,eax
>00435A61    je          00435A76
 00435A63    mov         edx,dword ptr [eax+220]
 00435A69    push        edx
 00435A6A    xor         ecx,ecx
 00435A6C    mov         edx,0B007
 00435A71    call        TControl.Perform
 00435A76    pop         ebx
 00435A77    ret
*}
end;

//00435A78
procedure TButton.CreateParams(var Params:TCreateParams);
begin
{*
 00435A78    push        ebx
 00435A79    push        esi
 00435A7A    mov         esi,edx
 00435A7C    mov         ebx,eax
 00435A7E    mov         edx,esi
 00435A80    mov         eax,ebx
 00435A82    call        TButtonControl.CreateParams
 00435A87    mov         ecx,435AAC
 00435A8C    mov         edx,esi
 00435A8E    mov         eax,ebx
 00435A90    call        TWinControl.CreateSubClass
 00435A95    xor         eax,eax
 00435A97    mov         al,byte ptr [ebx+210]
 00435A9D    mov         eax,dword ptr [eax*4+5ACB5C]
 00435AA4    or          dword ptr [esi+4],eax
 00435AA7    pop         esi
 00435AA8    pop         ebx
 00435AA9    ret
*}
end;

//00435AB4
procedure TButton.CreateWnd;
begin
{*
 00435AB4    push        ebx
 00435AB5    mov         ebx,eax
 00435AB7    mov         eax,ebx
 00435AB9    call        TWinControl.CreateWnd
 00435ABE    mov         al,byte ptr [ebx+210]
 00435AC4    mov         byte ptr [ebx+212],al
 00435ACA    pop         ebx
 00435ACB    ret
*}
end;

//00435ACC
procedure TButton.CNCommand(var Message:TWMCommand);
begin
{*
 00435ACC    push        esi
 00435ACD    cmp         word ptr [edx+6],0
>00435AD2    jne         00435ADD
 00435AD4    mov         si,0FFEB
 00435AD8    call        @CallDynaInst
 00435ADD    pop         esi
 00435ADE    ret
*}
end;

//00435AE0
procedure TButton.CMDialogKey(var Message:TCMDialogKey);
begin
{*
 00435AE0    push        ebx
 00435AE1    push        esi
 00435AE2    push        edi
 00435AE3    mov         edi,edx
 00435AE5    mov         ebx,eax
 00435AE7    cmp         word ptr [edi+4],0D
>00435AEC    jne         00435AF7
 00435AEE    cmp         byte ptr [ebx+212],0
>00435AF5    jne         00435B07
 00435AF7    cmp         word ptr [edi+4],1B
>00435AFC    jne         00435B3C
 00435AFE    cmp         byte ptr [ebx+211],0
>00435B05    je          00435B3C
 00435B07    mov         eax,dword ptr [edi+8]
 00435B0A    call        KeyDataToShiftState
 00435B0F    mov         dl,byte ptr ds:[435B4C]
 00435B15    cmp         dl,al
>00435B17    jne         00435B3C
 00435B19    mov         eax,ebx
 00435B1B    mov         si,0FFB8
 00435B1F    call        @CallDynaInst
 00435B24    test        al,al
>00435B26    je          00435B3C
 00435B28    mov         eax,ebx
 00435B2A    mov         si,0FFEB
 00435B2E    call        @CallDynaInst
 00435B33    mov         dword ptr [edi+0C],1
>00435B3A    jmp         00435B45
 00435B3C    mov         edx,edi
 00435B3E    mov         eax,ebx
 00435B40    call        TWinControl.CMDialogKey
 00435B45    pop         edi
 00435B46    pop         esi
 00435B47    pop         ebx
 00435B48    ret
*}
end;

//00435B50
procedure TButton.CMDialogChar(var Message:TCMDialogChar);
begin
{*
 00435B50    push        ebp
 00435B51    mov         ebp,esp
 00435B53    push        0
 00435B55    push        ebx
 00435B56    push        esi
 00435B57    push        edi
 00435B58    mov         edi,edx
 00435B5A    mov         ebx,eax
 00435B5C    xor         eax,eax
 00435B5E    push        ebp
 00435B5F    push        435BC6
 00435B64    push        dword ptr fs:[eax]
 00435B67    mov         dword ptr fs:[eax],esp
 00435B6A    lea         edx,[ebp-4]
 00435B6D    mov         eax,ebx
 00435B6F    call        TControl.GetText
 00435B74    mov         edx,dword ptr [ebp-4]
 00435B77    mov         ax,word ptr [edi+4]
 00435B7B    call        IsAccel
 00435B80    test        al,al
>00435B82    je          00435BA7
 00435B84    mov         eax,ebx
 00435B86    mov         si,0FFB8
 00435B8A    call        @CallDynaInst
 00435B8F    test        al,al
>00435B91    je          00435BA7
 00435B93    mov         eax,ebx
 00435B95    mov         si,0FFEB
 00435B99    call        @CallDynaInst
 00435B9E    mov         dword ptr [edi+0C],1
>00435BA5    jmp         00435BB0
 00435BA7    mov         edx,edi
 00435BA9    mov         eax,ebx
 00435BAB    call        TWinControl.CMDialogChar
 00435BB0    xor         eax,eax
 00435BB2    pop         edx
 00435BB3    pop         ecx
 00435BB4    pop         ecx
 00435BB5    mov         dword ptr fs:[eax],edx
 00435BB8    push        435BCD
 00435BBD    lea         eax,[ebp-4]
 00435BC0    call        @LStrClr
 00435BC5    ret
>00435BC6    jmp         @HandleFinally
>00435BCB    jmp         00435BBD
 00435BCD    pop         edi
 00435BCE    pop         esi
 00435BCF    pop         ebx
 00435BD0    pop         ecx
 00435BD1    pop         ebp
 00435BD2    ret
*}
end;

//00435BD4
procedure TButton.CMFocusChanged(var Message:TCMFocusChanged);
begin
{*
 00435BD4    push        ebx
 00435BD5    push        esi
 00435BD6    push        edi
 00435BD7    mov         esi,edx
 00435BD9    mov         ebx,eax
 00435BDB    mov         edi,dword ptr [esi+8]
 00435BDE    mov         eax,edi
 00435BE0    mov         edx,dword ptr ds:[4349B8];TButton
 00435BE6    call        @IsClass
 00435BEB    test        al,al
>00435BED    je          00435BFC
 00435BEF    cmp         ebx,edi
 00435BF1    sete        al
 00435BF4    mov         byte ptr [ebx+212],al
>00435BFA    jmp         00435C08
 00435BFC    mov         al,byte ptr [ebx+210]
 00435C02    mov         byte ptr [ebx+212],al
 00435C08    mov         dl,byte ptr [ebx+212]
 00435C0E    mov         eax,ebx
 00435C10    mov         ecx,dword ptr [eax]
 00435C12    call        dword ptr [ecx+0D0]
 00435C18    mov         edx,esi
 00435C1A    mov         eax,ebx
 00435C1C    call        TWinControl.CMFocusChanged
 00435C21    pop         edi
 00435C22    pop         esi
 00435C23    pop         ebx
 00435C24    ret
*}
end;

//00435C28
procedure TButton.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 00435C28    push        ebx
 00435C29    push        esi
 00435C2A    mov         esi,edx
 00435C2C    mov         ebx,eax
 00435C2E    call        ThemeServices
 00435C33    call        TThemeServices.GetThemesEnabled
 00435C38    test        al,al
>00435C3A    je          00435C46
 00435C3C    mov         dword ptr [esi+0C],1
 00435C43    pop         esi
 00435C44    pop         ebx
 00435C45    ret
 00435C46    mov         edx,esi
 00435C48    mov         eax,ebx
 00435C4A    mov         ecx,dword ptr [eax]
 00435C4C    call        dword ptr [ecx-10]
 00435C4F    pop         esi
 00435C50    pop         ebx
 00435C51    ret
*}
end;

//00435C54
procedure TButtonControl.CNCtlColorStatic(var Message:TWMCtlColorStatic);
begin
{*
 00435C54    push        ebx
 00435C55    push        esi
 00435C56    push        edi
 00435C57    mov         edi,edx
 00435C59    mov         esi,eax
 00435C5B    call        ThemeServices
 00435C60    mov         ebx,eax
 00435C62    mov         eax,ebx
 00435C64    call        TThemeServices.GetThemesEnabled
 00435C69    test        al,al
>00435C6B    je          00435C92
 00435C6D    push        0
 00435C6F    push        0
 00435C71    push        0
 00435C73    mov         eax,esi
 00435C75    call        TWinControl.GetHandle
 00435C7A    mov         edx,eax
 00435C7C    mov         ecx,dword ptr [edi+4]
 00435C7F    mov         eax,ebx
 00435C81    call        TThemeServices.DrawParentBackground
 00435C86    push        5
 00435C88    call        gdi32.GetStockObject
 00435C8D    mov         dword ptr [edi+0C],eax
>00435C90    jmp         00435C9B
 00435C92    mov         edx,edi
 00435C94    mov         eax,esi
 00435C96    mov         ecx,dword ptr [eax]
 00435C98    call        dword ptr [ecx-10]
 00435C9B    pop         edi
 00435C9C    pop         esi
 00435C9D    pop         ebx
 00435C9E    ret
*}
end;

end.