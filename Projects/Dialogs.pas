//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Dialogs;

interface

uses
  SysUtils, Classes, StdCtrls;

type
  TCommonDialog = class(TComponent)
  public
    Ctl3D:Boolean;//f30
    FDefWndProc:Pointer;//f34
    HelpContext:THelpContext;//f38
    FHandle:HWND;//f3C
    FObjectInstance:Pointer;//f40
    FTemplate:PChar;//f44
    OnClose:TNotifyEvent;//f48
    OnShow:TNotifyEvent;//f50
    procedure DefaultHandler(var Message:void ); virtual;//004301FC
    destructor Destroy; virtual;//004301A0
    constructor Create(AOwner:TComponent); virtual;//v2C//00430158
    procedure v30; virtual;//v30//00430280
    function MessageHook(var Msg:TMessage):Boolean; virtual;//v34//004301D4
    function TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL; virtual;//v38//004302CC
    procedure v3C; virtual; abstract;//v3C//00402BEC
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//00430288
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//004302B8
    procedure WMInitDialog(var Message:TWMInitDialog); message WM_INITDIALOG;//004302A0
    procedure DoShow; dynamic;//004303B4
    procedure DoClose; dynamic;//004303A0
    procedure MainWndProc(var Message:TMessage);//00430234
  end;
  TMessageForm = class(TForm)
  public
    Message:TLabel;//f2F8
    constructor CreateNew(AOwner:TComponent);//00430594
    procedure HelpButtonClick(Sender:TObject);//0043060C
    procedure CustomKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//00430624
    procedure WriteToClipBoard(Text:AnsiString);//00430690
    function GetFormText:AnsiString;//004307CC
  end;
    constructor Create(AOwner:TComponent);//00430158
    destructor Destroy;//004301A0
    function MessageHook(var Msg:TMessage):Boolean;//004301D4
    procedure DefaultHandler(var Message:void );//004301FC
    procedure sub_00430280;//00430280
    procedure WMDestroy(var Message:TWMDestroy);//00430288
    procedure WMInitDialog(var Message:TWMInitDialog);//004302A0
    procedure WMNCDestroy(var Message:TWMNCDestroy);//004302B8
    function TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL;//004302CC
    procedure DoClose;//004303A0
    procedure DoShow;//004303B4
    function GetAveCharSize(Canvas:TCanvas):TPoint;//004303C8
    function CreateMessageDialog(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons):TForm;//00430A6C
    function MessageDlgPos(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer):Integer;//00431010
    function MessageDlgPosHelp(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer; const HelpFileName:AnsiString):Integer;//00431034
    procedure ShowMessage(const Msg:AnsiString);//004310E8
    procedure ShowMessagePos(const Msg:AnsiString; X:Integer; Y:Integer);//004310F4
    procedure InitGlobals;//0043110C
    procedure _NF__533;//004311A8

implementation

//00430158
constructor TCommonDialog.Create(AOwner:TComponent);
begin
{*
 00430158    push        ebx
 00430159    push        esi
 0043015A    test        dl,dl
>0043015C    je          00430166
 0043015E    add         esp,0FFFFFFF0
 00430161    call        @ClassCreate
 00430166    mov         ebx,edx
 00430168    mov         esi,eax
 0043016A    xor         edx,edx
 0043016C    mov         eax,esi
 0043016E    call        TComponent.Create
 00430173    mov         byte ptr [esi+30],1
 00430177    push        esi
 00430178    push        430234;TCommonDialog.MainWndProc
 0043017D    call        MakeObjectInstance
 00430182    mov         dword ptr [esi+40],eax
 00430185    mov         eax,esi
 00430187    test        bl,bl
>00430189    je          0043019A
 0043018B    call        @AfterConstruction
 00430190    pop         dword ptr fs:[0]
 00430197    add         esp,0C
 0043019A    mov         eax,esi
 0043019C    pop         esi
 0043019D    pop         ebx
 0043019E    ret
*}
end;

//004301A0
destructor TCommonDialog.Destroy;
begin
{*
 004301A0    push        ebx
 004301A1    push        esi
 004301A2    call        @BeforeDestruction
 004301A7    mov         ebx,edx
 004301A9    mov         esi,eax
 004301AB    mov         eax,dword ptr [esi+40]
 004301AE    test        eax,eax
>004301B0    je          004301B7
 004301B2    call        FreeObjectInstance
 004301B7    mov         edx,ebx
 004301B9    and         dl,0FC
 004301BC    mov         eax,esi
 004301BE    call        TComponent.Destroy
 004301C3    test        bl,bl
>004301C5    jle         004301CE
 004301C7    mov         eax,esi
 004301C9    call        @ClassDestroy
 004301CE    pop         esi
 004301CF    pop         ebx
 004301D0    ret
*}
end;

//004301D4
function TCommonDialog.MessageHook(var Msg:TMessage):Boolean;
begin
{*
 004301D4    xor         ecx,ecx
 004301D6    mov         edx,dword ptr [edx]
 004301D8    cmp         edx,dword ptr ds:[5E0B3C];HelpMsg:Cardinal
>004301DE    jne         004301F9
 004301E0    cmp         dword ptr [eax+38],0
>004301E4    je          004301F9
 004301E6    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 004301EC    mov         edx,dword ptr [edx]
 004301EE    mov         eax,dword ptr [eax+38]
 004301F1    xchg        eax,edx
 004301F2    call        TApplication.HelpContext
 004301F7    mov         cl,1
 004301F9    mov         eax,ecx
 004301FB    ret
*}
end;

//004301FC
procedure TCommonDialog.DefaultHandler(var Message:void );
begin
{*
 004301FC    push        ebx
 004301FD    push        esi
 004301FE    push        edi
 004301FF    mov         esi,edx
 00430201    mov         ebx,eax
 00430203    mov         edi,dword ptr [ebx+3C]
 00430206    test        edi,edi
>00430208    je          00430224
 0043020A    mov         eax,dword ptr [esi+8]
 0043020D    push        eax
 0043020E    mov         eax,dword ptr [esi+4]
 00430211    push        eax
 00430212    mov         eax,dword ptr [esi]
 00430214    push        eax
 00430215    push        edi
 00430216    mov         eax,dword ptr [ebx+34]
 00430219    push        eax
 0043021A    call        user32.CallWindowProcA
 0043021F    mov         dword ptr [esi+0C],eax
>00430222    jmp         0043022D
 00430224    mov         edx,esi
 00430226    mov         eax,ebx
 00430228    call        TObject.DefaultHandler
 0043022D    pop         edi
 0043022E    pop         esi
 0043022F    pop         ebx
 00430230    ret
*}
end;

//00430234
procedure TCommonDialog.MainWndProc(var Message:TMessage);
begin
{*
 00430234    push        ebp
 00430235    mov         ebp,esp
 00430237    push        ecx
 00430238    push        ebx
 00430239    push        esi
 0043023A    push        edi
 0043023B    mov         dword ptr [ebp-4],eax
 0043023E    xor         eax,eax
 00430240    push        ebp
 00430241    push        43025E
 00430246    push        dword ptr fs:[eax]
 00430249    mov         dword ptr fs:[eax],esp
 0043024C    mov         eax,dword ptr [ebp-4]
 0043024F    mov         ecx,dword ptr [eax]
 00430251    call        dword ptr [ecx+30]
 00430254    xor         eax,eax
 00430256    pop         edx
 00430257    pop         ecx
 00430258    pop         ecx
 00430259    mov         dword ptr fs:[eax],edx
>0043025C    jmp         00430277
>0043025E    jmp         @HandleAnyException
 00430263    mov         eax,[005AE584];^Application:TApplication
 00430268    mov         eax,dword ptr [eax]
 0043026A    mov         edx,dword ptr [ebp-4]
 0043026D    call        TApplication.HandleException
 00430272    call        @DoneExcept
 00430277    pop         edi
 00430278    pop         esi
 00430279    pop         ebx
 0043027A    pop         ecx
 0043027B    pop         ebp
 0043027C    ret
*}
end;

//00430280
procedure sub_00430280;
begin
{*
 00430280    mov         ecx,dword ptr [eax]
 00430282    call        dword ptr [ecx-14];TObject.Dispatch
 00430285    ret
*}
end;

//00430288
procedure TCommonDialog.WMDestroy(var Message:TWMDestroy);
begin
{*
 00430288    push        esi
 00430289    mov         esi,eax
 0043028B    mov         eax,esi
 0043028D    mov         ecx,dword ptr [eax]
 0043028F    call        dword ptr [ecx-10]
 00430292    mov         eax,esi
 00430294    mov         si,0FFEF
 00430298    call        @CallDynaInst
 0043029D    pop         esi
 0043029E    ret
*}
end;

//004302A0
procedure TCommonDialog.WMInitDialog(var Message:TWMInitDialog);
begin
{*
 004302A0    push        ebx
 004302A1    push        esi
 004302A2    mov         ebx,edx
 004302A4    mov         si,0FFEE
 004302A8    call        @CallDynaInst
 004302AD    xor         eax,eax
 004302AF    mov         dword ptr [ebx+0C],eax
 004302B2    pop         esi
 004302B3    pop         ebx
 004302B4    ret
*}
end;

//004302B8
procedure TCommonDialog.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 004302B8    push        esi
 004302B9    mov         esi,eax
 004302BB    mov         eax,esi
 004302BD    mov         ecx,dword ptr [eax]
 004302BF    call        dword ptr [ecx-10]
 004302C2    xor         eax,eax
 004302C4    mov         dword ptr [esi+3C],eax
 004302C7    pop         esi
 004302C8    ret
*}
end;

//004302CC
function TCommonDialog.TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL;
begin
{*
 004302CC    push        ebp
 004302CD    mov         ebp,esp
 004302CF    add         esp,0FFFFFFE8
 004302D2    push        ebx
 004302D3    push        esi
 004302D4    mov         esi,ecx
 004302D6    mov         ebx,edx
 004302D8    mov         dword ptr [ebp-8],eax
 004302DB    call        user32.GetActiveWindow
 004302E0    mov         dword ptr [ebp-10],eax
 004302E3    xor         eax,eax
 004302E5    call        DisableTaskWindows
 004302EA    mov         dword ptr [ebp-14],eax
 004302ED    call        SaveFocusState
 004302F2    mov         dword ptr [ebp-18],eax
 004302F5    xor         eax,eax
 004302F7    push        ebp
 004302F8    push        43038F
 004302FD    push        dword ptr fs:[eax]
 00430300    mov         dword ptr fs:[eax],esp
 00430303    mov         eax,dword ptr [ebp-8]
 00430306    push        eax
 00430307    mov         eax,dword ptr [eax]
 00430309    mov         eax,dword ptr [eax+34]
 0043030C    push        eax
 0043030D    mov         eax,[005AE584];^Application:TApplication
 00430312    mov         eax,dword ptr [eax]
 00430314    call        TApplication.HookMainWindow
 00430319    fnstcw      word ptr [ebp-2]
 0043031C    xor         eax,eax
 0043031E    push        ebp
 0043031F    push        430361
 00430324    push        dword ptr fs:[eax]
 00430327    mov         dword ptr fs:[eax],esp
 0043032A    mov         eax,dword ptr [ebp-8]
 0043032D    mov         [005AC85C],eax
 00430332    push        esi
 00430333    call        ebx
 00430335    mov         dword ptr [ebp-0C],eax
 00430338    xor         eax,eax
 0043033A    pop         edx
 0043033B    pop         ecx
 0043033C    pop         ecx
 0043033D    mov         dword ptr fs:[eax],edx
 00430340    push        430368
 00430345    fnclex
 00430347    fldcw       word ptr [ebp-2]
 0043034A    mov         eax,dword ptr [ebp-8]
 0043034D    push        eax
 0043034E    mov         eax,dword ptr [eax]
 00430350    mov         eax,dword ptr [eax+34]
 00430353    push        eax
 00430354    mov         eax,[005AE584];^Application:TApplication
 00430359    mov         eax,dword ptr [eax]
 0043035B    call        TApplication.UnhookMainWindow
 00430360    ret
>00430361    jmp         @HandleFinally
>00430366    jmp         00430345
 00430368    xor         eax,eax
 0043036A    pop         edx
 0043036B    pop         ecx
 0043036C    pop         ecx
 0043036D    mov         dword ptr fs:[eax],edx
 00430370    push        430396
 00430375    mov         eax,dword ptr [ebp-14]
 00430378    call        EnableTaskWindows
 0043037D    mov         eax,dword ptr [ebp-10]
 00430380    push        eax
 00430381    call        user32.SetActiveWindow
 00430386    mov         eax,dword ptr [ebp-18]
 00430389    call        RestoreFocusState
 0043038E    ret
>0043038F    jmp         @HandleFinally
>00430394    jmp         00430375
 00430396    mov         eax,dword ptr [ebp-0C]
 00430399    pop         esi
 0043039A    pop         ebx
 0043039B    mov         esp,ebp
 0043039D    pop         ebp
 0043039E    ret
*}
end;

//004303A0
procedure TCommonDialog.DoClose;
begin
{*
 004303A0    push        ebx
 004303A1    cmp         word ptr [eax+4A],0
>004303A6    je          004303B2
 004303A8    mov         ebx,eax
 004303AA    mov         edx,eax
 004303AC    mov         eax,dword ptr [ebx+4C]
 004303AF    call        dword ptr [ebx+48]
 004303B2    pop         ebx
 004303B3    ret
*}
end;

//004303B4
procedure TCommonDialog.DoShow;
begin
{*
 004303B4    push        ebx
 004303B5    cmp         word ptr [eax+52],0
>004303BA    je          004303C6
 004303BC    mov         ebx,eax
 004303BE    mov         edx,eax
 004303C0    mov         eax,dword ptr [ebx+54]
 004303C3    call        dword ptr [ebx+50]
 004303C6    pop         ebx
 004303C7    ret
*}
end;

//004303C8
function GetAveCharSize(Canvas:TCanvas):TPoint;
begin
{*
 004303C8    push        ebx
 004303C9    push        esi
 004303CA    add         esp,0FFFFFFCC
 004303CD    mov         ebx,edx
 004303CF    mov         esi,eax
 004303D1    xor         eax,eax
 004303D3    mov         edx,esp
 004303D5    lea         ecx,[eax+41]
 004303D8    mov         byte ptr [edx],cl
 004303DA    inc         eax
 004303DB    inc         edx
 004303DC    cmp         eax,1A
>004303DF    jne         004303D5
 004303E1    xor         eax,eax
 004303E3    lea         edx,[esp+1A]
 004303E7    lea         ecx,[eax+61]
 004303EA    mov         byte ptr [edx],cl
 004303EC    inc         eax
 004303ED    inc         edx
 004303EE    cmp         eax,1A
>004303F1    jne         004303E7
 004303F3    push        ebx
 004303F4    push        34
 004303F6    lea         eax,[esp+8]
 004303FA    push        eax
 004303FB    mov         eax,esi
 004303FD    call        TCanvas.GetHandle
 00430402    push        eax
 00430403    call        gdi32.GetTextExtentPointA
 00430408    mov         eax,dword ptr [ebx]
 0043040A    mov         ecx,34
 0043040F    cdq
 00430410    idiv        eax,ecx
 00430412    mov         dword ptr [ebx],eax
 00430414    add         esp,34
 00430417    pop         esi
 00430418    pop         ebx
 00430419    ret
*}
end;

//00430594
constructor TMessageForm.CreateNew(AOwner:TComponent);
begin
{*
 00430594    push        ebp
 00430595    mov         ebp,esp
 00430597    add         esp,0FFFFFEAC
 0043059D    push        ebx
 0043059E    push        esi
 0043059F    test        dl,dl
>004305A1    je          004305AB
 004305A3    add         esp,0FFFFFFF0
 004305A6    call        @ClassCreate
 004305AB    mov         ebx,edx
 004305AD    mov         esi,eax
 004305AF    push        0
 004305B1    xor         edx,edx
 004305B3    mov         eax,esi
 004305B5    call        TCustomForm.CreateNew
 004305BA    mov         dword ptr [ebp-154],154
 004305C4    push        0
 004305C6    lea         eax,[ebp-154]
 004305CC    push        eax
 004305CD    push        0
 004305CF    push        29
 004305D1    call        user32.SystemParametersInfoA
 004305D6    test        eax,eax
>004305D8    je          004305ED
 004305DA    lea         eax,[ebp-3C]
 004305DD    push        eax
 004305DE    call        gdi32.CreateFontIndirectA
 004305E3    mov         edx,eax
 004305E5    mov         eax,dword ptr [esi+68]
 004305E8    call        TFont.SetHandle
 004305ED    mov         eax,esi
 004305EF    test        bl,bl
>004305F1    je          00430602
 004305F3    call        @AfterConstruction
 004305F8    pop         dword ptr fs:[0]
 004305FF    add         esp,0C
 00430602    mov         eax,esi
 00430604    pop         esi
 00430605    pop         ebx
 00430606    mov         esp,ebp
 00430608    pop         ebp
 00430609    ret
*}
end;

//0043060C
procedure TMessageForm.HelpButtonClick(Sender:TObject);
begin
{*
 0043060C    mov         edx,dword ptr ds:[5AE584];^Application:TApplication
 00430612    mov         edx,dword ptr [edx]
 00430614    mov         eax,dword ptr [eax+158]
 0043061A    xchg        eax,edx
 0043061B    call        TApplication.HelpContext
 00430620    ret
*}
end;

//00430624
procedure TMessageForm.CustomKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 00430624    push        ebp
 00430625    mov         ebp,esp
 00430627    push        0
 00430629    push        ebx
 0043062A    push        esi
 0043062B    mov         esi,ecx
 0043062D    mov         ebx,eax
 0043062F    xor         eax,eax
 00430631    push        ebp
 00430632    push        43067C
 00430637    push        dword ptr fs:[eax]
 0043063A    mov         dword ptr fs:[eax],esp
 0043063D    mov         al,[0043068C]
 00430642    cmp         al,byte ptr [ebp+8]
>00430645    jne         00430666
 00430647    cmp         word ptr [esi],43
>0043064B    jne         00430666
 0043064D    call        Beep
 00430652    lea         edx,[ebp-4]
 00430655    mov         eax,ebx
 00430657    call        TMessageForm.GetFormText
 0043065C    mov         edx,dword ptr [ebp-4]
 0043065F    mov         eax,ebx
 00430661    call        TMessageForm.WriteToClipBoard
 00430666    xor         eax,eax
 00430668    pop         edx
 00430669    pop         ecx
 0043066A    pop         ecx
 0043066B    mov         dword ptr fs:[eax],edx
 0043066E    push        430683
 00430673    lea         eax,[ebp-4]
 00430676    call        @LStrClr
 0043067B    ret
>0043067C    jmp         @HandleFinally
>00430681    jmp         00430673
 00430683    pop         esi
 00430684    pop         ebx
 00430685    pop         ecx
 00430686    pop         ebp
 00430687    ret         4
*}
end;

//00430690
procedure TMessageForm.WriteToClipBoard(Text:AnsiString);
begin
{*
 00430690    push        ebp
 00430691    mov         ebp,esp
 00430693    add         esp,0FFFFFFF8
 00430696    push        ebx
 00430697    push        esi
 00430698    push        edi
 00430699    mov         dword ptr [ebp-4],edx
 0043069C    mov         eax,dword ptr [ebp-4]
 0043069F    call        @LStrAddRef
 004306A4    xor         eax,eax
 004306A6    push        ebp
 004306A7    push        4307BE
 004306AC    push        dword ptr fs:[eax]
 004306AF    mov         dword ptr fs:[eax],esp
 004306B2    push        0
 004306B4    call        user32.OpenClipboard
 004306B9    test        eax,eax
>004306BB    je          00430791
 004306C1    xor         eax,eax
 004306C3    push        ebp
 004306C4    push        43078A
 004306C9    push        dword ptr fs:[eax]
 004306CC    mov         dword ptr fs:[eax],esp
 004306CF    mov         eax,dword ptr [ebp-4]
 004306D2    call        @LStrLen
 004306D7    inc         eax
 004306D8    push        eax
 004306D9    push        2002
 004306DE    call        KERNEL32.GlobalAlloc
 004306E3    mov         dword ptr [ebp-8],eax
 004306E6    xor         eax,eax
 004306E8    push        ebp
 004306E9    push        43075F
 004306EE    push        dword ptr fs:[eax]
 004306F1    mov         dword ptr fs:[eax],esp
 004306F4    mov         eax,dword ptr [ebp-8]
 004306F7    push        eax
 004306F8    call        KERNEL32.GlobalLock
 004306FD    mov         ebx,eax
 004306FF    xor         eax,eax
 00430701    push        ebp
 00430702    push        43074E
 00430707    push        dword ptr fs:[eax]
 0043070A    mov         dword ptr fs:[eax],esp
 0043070D    mov         eax,dword ptr [ebp-4]
 00430710    call        @LStrLen
 00430715    inc         eax
 00430716    push        eax
 00430717    mov         eax,dword ptr [ebp-4]
 0043071A    call        @LStrToPChar
 0043071F    mov         edx,ebx
 00430721    pop         ecx
 00430722    call        Move
 00430727    call        user32.EmptyClipboard
 0043072C    mov         eax,dword ptr [ebp-8]
 0043072F    push        eax
 00430730    push        1
 00430732    call        user32.SetClipboardData
 00430737    xor         eax,eax
 00430739    pop         edx
 0043073A    pop         ecx
 0043073B    pop         ecx
 0043073C    mov         dword ptr fs:[eax],edx
 0043073F    push        430755
 00430744    mov         eax,dword ptr [ebp-8]
 00430747    push        eax
 00430748    call        KERNEL32.GlobalUnlock
 0043074D    ret
>0043074E    jmp         @HandleFinally
>00430753    jmp         00430744
 00430755    xor         eax,eax
 00430757    pop         edx
 00430758    pop         ecx
 00430759    pop         ecx
 0043075A    mov         dword ptr fs:[eax],edx
>0043075D    jmp         00430777
>0043075F    jmp         @HandleAnyException
 00430764    mov         eax,dword ptr [ebp-8]
 00430767    push        eax
 00430768    call        KERNEL32.GlobalFree
 0043076D    call        @RaiseAgain
 00430772    call        @DoneExcept
 00430777    xor         eax,eax
 00430779    pop         edx
 0043077A    pop         ecx
 0043077B    pop         ecx
 0043077C    mov         dword ptr fs:[eax],edx
 0043077F    push        4307A8
 00430784    call        user32.CloseClipboard
 00430789    ret
>0043078A    jmp         @HandleFinally
>0043078F    jmp         00430784
 00430791    mov         ecx,dword ptr ds:[5AE19C];^SCannotOpenClipboard:TResStringRec
 00430797    mov         dl,1
 00430799    mov         eax,[00408B30];Exception
 0043079E    call        Exception.CreateRes
 004307A3    call        @RaiseExcept
 004307A8    xor         eax,eax
 004307AA    pop         edx
 004307AB    pop         ecx
 004307AC    pop         ecx
 004307AD    mov         dword ptr fs:[eax],edx
 004307B0    push        4307C5
 004307B5    lea         eax,[ebp-4]
 004307B8    call        @LStrClr
 004307BD    ret
>004307BE    jmp         @HandleFinally
>004307C3    jmp         004307B5
 004307C5    pop         edi
 004307C6    pop         esi
 004307C7    pop         ebx
 004307C8    pop         ecx
 004307C9    pop         ecx
 004307CA    pop         ebp
 004307CB    ret
*}
end;

//004307CC
function TMessageForm.GetFormText:AnsiString;
begin
{*
 004307CC    push        ebp
 004307CD    mov         ebp,esp
 004307CF    add         esp,0FFFFFF8C
 004307D2    push        ebx
 004307D3    push        esi
 004307D4    push        edi
 004307D5    xor         ecx,ecx
 004307D7    mov         dword ptr [ebp-70],ecx
 004307DA    mov         dword ptr [ebp-74],ecx
 004307DD    mov         dword ptr [ebp-1C],ecx
 004307E0    mov         dword ptr [ebp-14],ecx
 004307E3    mov         dword ptr [ebp-18],ecx
 004307E6    mov         dword ptr [ebp-10],ecx
 004307E9    mov         dword ptr [ebp-8],ecx
 004307EC    mov         dword ptr [ebp-0C],ecx
 004307EF    mov         dword ptr [ebp-4],edx
 004307F2    mov         ebx,eax
 004307F4    xor         eax,eax
 004307F6    push        ebp
 004307F7    push        43097D
 004307FC    push        dword ptr fs:[eax]
 004307FF    mov         dword ptr fs:[eax],esp
 00430802    lea         ecx,[ebp-10]
 00430805    mov         edx,1B
 0043080A    mov         al,2D
 0043080C    call        @LStrOfChar
 00430811    mov         edx,dword ptr [ebp-10]
 00430814    lea         eax,[ebp-8]
 00430817    mov         ecx,430994;#13+#10
 0043081C    call        @LStrCat3
 00430821    mov         eax,ebx
 00430823    call        TComponent.GetComponentCount
 00430828    mov         edi,eax
 0043082A    dec         edi
 0043082B    test        edi,edi
>0043082D    jl          00430884
 0043082F    inc         edi
 00430830    xor         esi,esi
 00430832    mov         edx,esi
 00430834    mov         eax,ebx
 00430836    call        TComponent.GetComponent
 0043083B    mov         edx,dword ptr ds:[4349B8];TButton
 00430841    call        @IsClass
 00430846    test        al,al
>00430848    je          00430880
 0043084A    push        dword ptr [ebp-0C]
 0043084D    mov         edx,esi
 0043084F    mov         eax,ebx
 00430851    call        TComponent.GetComponent
 00430856    lea         edx,[ebp-14]
 00430859    call        TControl.GetText
 0043085E    push        dword ptr [ebp-14]
 00430861    lea         ecx,[ebp-18]
 00430864    mov         edx,3
 00430869    mov         al,20
 0043086B    call        @LStrOfChar
 00430870    push        dword ptr [ebp-18]
 00430873    lea         eax,[ebp-0C]
 00430876    mov         edx,3
 0043087B    call        @LStrCatN
 00430880    inc         esi
 00430881    dec         edi
>00430882    jne         00430832
 00430884    mov         al,[00430998]
 00430889    push        eax
 0043088A    lea         eax,[ebp-1C]
 0043088D    push        eax
 0043088E    xor         ecx,ecx
 00430890    mov         edx,4309A4;'&'
 00430895    mov         eax,dword ptr [ebp-0C]
 00430898    call        StringReplace
 0043089D    mov         edx,dword ptr [ebp-1C]
 004308A0    lea         eax,[ebp-0C]
 004308A3    call        @LStrLAsg
 004308A8    mov         eax,dword ptr [ebp-4]
 004308AB    push        eax
 004308AC    mov         eax,dword ptr [ebp-8]
 004308AF    mov         dword ptr [ebp-6C],eax
 004308B2    mov         byte ptr [ebp-68],0B
 004308B6    lea         edx,[ebp-70]
 004308B9    mov         eax,ebx
 004308BB    call        TControl.GetText
 004308C0    mov         eax,dword ptr [ebp-70]
 004308C3    mov         dword ptr [ebp-64],eax
 004308C6    mov         byte ptr [ebp-60],0B
 004308CA    mov         eax,430994;#13+#10
 004308CF    mov         dword ptr [ebp-5C],eax
 004308D2    mov         byte ptr [ebp-58],0B
 004308D6    mov         eax,dword ptr [ebp-8]
 004308D9    mov         dword ptr [ebp-54],eax
 004308DC    mov         byte ptr [ebp-50],0B
 004308E0    lea         edx,[ebp-74]
 004308E3    mov         eax,dword ptr [ebx+2F8]
 004308E9    call        TControl.GetText
 004308EE    mov         eax,dword ptr [ebp-74]
 004308F1    mov         dword ptr [ebp-4C],eax
 004308F4    mov         byte ptr [ebp-48],0B
 004308F8    mov         eax,430994;#13+#10
 004308FD    mov         dword ptr [ebp-44],eax
 00430900    mov         byte ptr [ebp-40],0B
 00430904    mov         eax,dword ptr [ebp-8]
 00430907    mov         dword ptr [ebp-3C],eax
 0043090A    mov         byte ptr [ebp-38],0B
 0043090E    mov         eax,dword ptr [ebp-0C]
 00430911    mov         dword ptr [ebp-34],eax
 00430914    mov         byte ptr [ebp-30],0B
 00430918    mov         eax,430994;#13+#10
 0043091D    mov         dword ptr [ebp-2C],eax
 00430920    mov         byte ptr [ebp-28],0B
 00430924    mov         eax,dword ptr [ebp-8]
 00430927    mov         dword ptr [ebp-24],eax
 0043092A    mov         byte ptr [ebp-20],0B
 0043092E    lea         edx,[ebp-6C]
 00430931    mov         ecx,9
 00430936    mov         eax,4309B0;'%s%s%s%s%s%s%s%s%s%s'
 0043093B    call        Format
 00430940    xor         eax,eax
 00430942    pop         edx
 00430943    pop         ecx
 00430944    pop         ecx
 00430945    mov         dword ptr fs:[eax],edx
 00430948    push        430984
 0043094D    lea         eax,[ebp-74]
 00430950    mov         edx,2
 00430955    call        @LStrArrayClr
 0043095A    lea         eax,[ebp-1C]
 0043095D    mov         edx,2
 00430962    call        @LStrArrayClr
 00430967    lea         eax,[ebp-14]
 0043096A    call        @LStrClr
 0043096F    lea         eax,[ebp-10]
 00430972    mov         edx,3
 00430977    call        @LStrArrayClr
 0043097C    ret
>0043097D    jmp         @HandleFinally
>00430982    jmp         0043094D
 00430984    pop         edi
 00430985    pop         esi
 00430986    pop         ebx
 00430987    mov         esp,ebp
 00430989    pop         ebp
 0043098A    ret
*}
end;

//00430A6C
function CreateMessageDialog(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons):TForm;
begin
{*
 00430A6C    push        ebp
 00430A6D    mov         ebp,esp
 00430A6F    add         esp,0FFFFFF90
 00430A72    push        ebx
 00430A73    push        esi
 00430A74    push        edi
 00430A75    xor         ebx,ebx
 00430A77    mov         dword ptr [ebp-70],ebx
 00430A7A    mov         dword ptr [ebp-6C],ebx
 00430A7D    mov         dword ptr [ebp-68],ebx
 00430A80    mov         dword ptr [ebp-64],ebx
 00430A83    mov         word ptr [ebp-7],cx
 00430A87    mov         byte ptr [ebp-5],dl
 00430A8A    mov         dword ptr [ebp-4],eax
 00430A8D    xor         eax,eax
 00430A8F    push        ebp
 00430A90    push        430FDC
 00430A95    push        dword ptr fs:[eax]
 00430A98    mov         dword ptr fs:[eax],esp
 00430A9B    mov         ecx,dword ptr ds:[5AE584];^Application:TApplication
 00430AA1    mov         ecx,dword ptr [ecx]
 00430AA3    mov         dl,1
 00430AA5    mov         eax,[0043041C];TMessageForm
 00430AAA    call        TMessageForm.CreateNew
 00430AAF    mov         dword ptr [ebp-0C],eax
 00430AB2    mov         eax,[005AE584];^Application:TApplication
 00430AB7    mov         eax,dword ptr [eax]
 00430AB9    mov         dl,byte ptr [eax+34]
 00430ABC    mov         eax,dword ptr [ebp-0C]
 00430ABF    mov         ecx,dword ptr [eax]
 00430AC1    call        dword ptr [ecx+70]
 00430AC4    mov         dl,3
 00430AC6    mov         eax,dword ptr [ebp-0C]
 00430AC9    call        TCustomForm.SetBorderStyle
 00430ACE    mov         eax,dword ptr [ebp-0C]
 00430AD1    call        TCustomForm.GetCanvas
 00430AD6    mov         edx,dword ptr [ebp-0C]
 00430AD9    mov         edx,dword ptr [edx+68]
 00430ADC    call        TCanvas.SetFont
 00430AE1    mov         eax,dword ptr [ebp-0C]
 00430AE4    mov         byte ptr [eax+22D],1
 00430AEB    mov         eax,dword ptr [ebp-0C]
 00430AEE    mov         edx,dword ptr [ebp-0C]
 00430AF1    mov         dword ptr [eax+1DC],edx
 00430AF7    mov         dword ptr [eax+1D8],430624;TMessageForm.CustomKeyDown
 00430B01    mov         eax,dword ptr [ebp-0C]
 00430B04    call        TCustomForm.GetCanvas
 00430B09    lea         edx,[ebp-14]
 00430B0C    call        GetAveCharSize
 00430B11    push        4
 00430B13    mov         ebx,dword ptr [ebp-14]
 00430B16    push        ebx
 00430B17    push        8
 00430B19    call        KERNEL32.MulDiv
 00430B1E    mov         dword ptr [ebp-18],eax
 00430B21    push        8
 00430B23    mov         esi,dword ptr [ebp-10]
 00430B26    push        esi
 00430B27    push        8
 00430B29    call        KERNEL32.MulDiv
 00430B2E    mov         dword ptr [ebp-1C],eax
 00430B31    push        4
 00430B33    push        ebx
 00430B34    push        0A
 00430B36    call        KERNEL32.MulDiv
 00430B3B    mov         dword ptr [ebp-20],eax
 00430B3E    push        8
 00430B40    push        esi
 00430B41    push        0A
 00430B43    call        KERNEL32.MulDiv
 00430B48    mov         dword ptr [ebp-24],eax
 00430B4B    push        4
 00430B4D    push        ebx
 00430B4E    push        32
 00430B50    call        KERNEL32.MulDiv
 00430B55    mov         dword ptr [ebp-28],eax
 00430B58    xor         ebx,ebx
 00430B5A    mov         esi,5E0B44;ButtonWidths:array[TMsgDlgBtn] of System.Integer
 00430B5F    mov         dword ptr [ebp-4C],5AC8B8;^SMsgDlgYes:TResStringRec
 00430B66    mov         eax,ebx
 00430B68    cmp         al,0F
>00430B6A    ja          00430B73
 00430B6C    and         eax,7F
 00430B6F    bt          dword ptr [ebp-7],eax
>00430B73    jae         00430BDD
 00430B75    cmp         dword ptr [esi],0
>00430B78    jne         00430BD3
 00430B7A    push        0
 00430B7C    lea         eax,[ebp-60]
 00430B7F    push        eax
 00430B80    xor         ecx,ecx
 00430B82    xor         edx,edx
 00430B84    xor         eax,eax
 00430B86    call        Bounds
 00430B8B    mov         eax,dword ptr [ebp-0C]
 00430B8E    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 00430B93    or          eax,420
 00430B98    push        eax
 00430B99    lea         eax,[ebp-60]
 00430B9C    push        eax
 00430B9D    push        0FF
 00430B9F    lea         edx,[ebp-64]
 00430BA2    mov         eax,dword ptr [ebp-4C]
 00430BA5    mov         eax,dword ptr [eax]
 00430BA7    call        LoadStr
 00430BAC    mov         eax,dword ptr [ebp-64]
 00430BAF    call        @LStrToPChar
 00430BB4    push        eax
 00430BB5    mov         eax,dword ptr [ebp-0C]
 00430BB8    call        TCustomForm.GetCanvas
 00430BBD    call        TCanvas.GetHandle
 00430BC2    push        eax
 00430BC3    call        user32.DrawTextA
 00430BC8    mov         eax,dword ptr [ebp-58]
 00430BCB    sub         eax,dword ptr [ebp-60]
 00430BCE    add         eax,8
 00430BD1    mov         dword ptr [esi],eax
 00430BD3    mov         eax,dword ptr [esi]
 00430BD5    cmp         eax,dword ptr [ebp-28]
>00430BD8    jle         00430BDD
 00430BDA    mov         dword ptr [ebp-28],eax
 00430BDD    inc         ebx
 00430BDE    add         dword ptr [ebp-4C],4
 00430BE2    add         esi,4
 00430BE5    cmp         bl,0B
>00430BE8    jne         00430B66
 00430BEE    push        8
 00430BF0    mov         eax,dword ptr [ebp-10]
 00430BF3    push        eax
 00430BF4    push        0E
 00430BF6    call        KERNEL32.MulDiv
 00430BFB    mov         dword ptr [ebp-2C],eax
 00430BFE    push        4
 00430C00    mov         eax,dword ptr [ebp-14]
 00430C03    push        eax
 00430C04    push        4
 00430C06    call        KERNEL32.MulDiv
 00430C0B    mov         dword ptr [ebp-30],eax
 00430C0E    push        0
 00430C10    mov         eax,[005AE7DC];^Screen:TScreen
 00430C15    mov         eax,dword ptr [eax]
 00430C17    call        TScreen.GetWidth
 00430C1C    sar         eax,1
>00430C1E    jns         00430C23
 00430C20    adc         eax,0
 00430C23    push        eax
 00430C24    push        0
 00430C26    push        0
 00430C28    lea         eax,[ebp-60]
 00430C2B    push        eax
 00430C2C    call        user32.SetRect
 00430C31    mov         eax,dword ptr [ebp-0C]
 00430C34    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 00430C39    or          eax,450
 00430C3E    push        eax
 00430C3F    lea         eax,[ebp-60]
 00430C42    push        eax
 00430C43    mov         eax,dword ptr [ebp-4]
 00430C46    call        @LStrLen
 00430C4B    inc         eax
 00430C4C    push        eax
 00430C4D    mov         eax,dword ptr [ebp-4]
 00430C50    call        @LStrToPChar
 00430C55    push        eax
 00430C56    mov         eax,dword ptr [ebp-0C]
 00430C59    call        TCustomForm.GetCanvas
 00430C5E    call        TCanvas.GetHandle
 00430C63    push        eax
 00430C64    call        user32.DrawTextA
 00430C69    xor         eax,eax
 00430C6B    mov         al,byte ptr [ebp-5]
 00430C6E    mov         edi,dword ptr [eax*4+5AC878]
 00430C75    mov         esi,dword ptr [ebp-58]
 00430C78    mov         eax,dword ptr [ebp-54]
 00430C7B    mov         dword ptr [ebp-34],eax
 00430C7E    test        edi,edi
>00430C80    je          00430C97
 00430C82    mov         eax,dword ptr [ebp-20]
 00430C85    add         eax,20
 00430C88    add         esi,eax
 00430C8A    cmp         dword ptr [ebp-34],20
>00430C8E    jge         00430C97
 00430C90    mov         dword ptr [ebp-34],20
 00430C97    xor         eax,eax
 00430C99    xor         ebx,ebx
 00430C9B    mov         edx,ebx
 00430C9D    cmp         dl,0F
>00430CA0    ja          00430CA9
 00430CA2    and         edx,7F
 00430CA5    bt          dword ptr [ebp-7],edx
>00430CA9    jae         00430CAC
 00430CAB    inc         eax
 00430CAC    inc         ebx
 00430CAD    cmp         bl,0B
>00430CB0    jne         00430C9B
 00430CB2    xor         ebx,ebx
 00430CB4    test        eax,eax
>00430CB6    je          00430CC4
 00430CB8    mov         ebx,dword ptr [ebp-28]
 00430CBB    imul        ebx,eax
 00430CBE    dec         eax
 00430CBF    imul        dword ptr [ebp-30]
 00430CC2    add         ebx,eax
 00430CC4    mov         edx,ebx
 00430CC6    mov         eax,esi
 00430CC8    call        Max
 00430CCD    mov         edx,eax
 00430CCF    mov         eax,dword ptr [ebp-18]
 00430CD2    add         eax,eax
 00430CD4    add         edx,eax
 00430CD6    mov         eax,dword ptr [ebp-0C]
 00430CD9    call        TCustomForm.SetClientWidth
 00430CDE    mov         edx,dword ptr [ebp-34]
 00430CE1    add         edx,dword ptr [ebp-2C]
 00430CE4    add         edx,dword ptr [ebp-24]
 00430CE7    mov         eax,dword ptr [ebp-1C]
 00430CEA    add         eax,eax
 00430CEC    add         edx,eax
 00430CEE    mov         eax,dword ptr [ebp-0C]
 00430CF1    call        TCustomForm.SetClientHeight
 00430CF6    mov         eax,[005AE7DC];^Screen:TScreen
 00430CFB    mov         eax,dword ptr [eax]
 00430CFD    call        TScreen.GetWidth
 00430D02    mov         edx,eax
 00430D04    sar         edx,1
>00430D06    jns         00430D0B
 00430D08    adc         edx,0
 00430D0B    mov         eax,dword ptr [ebp-0C]
 00430D0E    mov         eax,dword ptr [eax+48]
 00430D11    sar         eax,1
>00430D13    jns         00430D18
 00430D15    adc         eax,0
 00430D18    sub         edx,eax
 00430D1A    mov         eax,dword ptr [ebp-0C]
 00430D1D    call        TControl.SetLeft
 00430D22    mov         eax,[005AE7DC];^Screen:TScreen
 00430D27    mov         eax,dword ptr [eax]
 00430D29    call        TScreen.GetHeight
 00430D2E    mov         edx,eax
 00430D30    sar         edx,1
>00430D32    jns         00430D37
 00430D34    adc         edx,0
 00430D37    mov         eax,dword ptr [ebp-0C]
 00430D3A    mov         eax,dword ptr [eax+4C]
 00430D3D    sar         eax,1
>00430D3F    jns         00430D44
 00430D41    adc         eax,0
 00430D44    sub         edx,eax
 00430D46    mov         eax,dword ptr [ebp-0C]
 00430D49    call        TControl.SetTop
 00430D4E    cmp         byte ptr [ebp-5],4
>00430D52    je          00430D75
 00430D54    lea         edx,[ebp-68]
 00430D57    xor         eax,eax
 00430D59    mov         al,byte ptr [ebp-5]
 00430D5C    mov         eax,dword ptr [eax*4+5AC864];^SMsgDlgWarning:TResStringRec
 00430D63    call        LoadStr
 00430D68    mov         edx,dword ptr [ebp-68]
 00430D6B    mov         eax,dword ptr [ebp-0C]
 00430D6E    call        TControl.SetText
>00430D73    jmp         00430D8F
 00430D75    lea         edx,[ebp-6C]
 00430D78    mov         eax,[005AE584];^Application:TApplication
 00430D7D    mov         eax,dword ptr [eax]
 00430D7F    call        TApplication.GetTitle
 00430D84    mov         edx,dword ptr [ebp-6C]
 00430D87    mov         eax,dword ptr [ebp-0C]
 00430D8A    call        TControl.SetText
 00430D8F    test        edi,edi
>00430D91    je          00430DEF
 00430D93    mov         ecx,dword ptr [ebp-0C]
 00430D96    mov         dl,1
 00430D98    mov         eax,[004312FC];TImage
 00430D9D    call        TImage.Create
 00430DA2    mov         dword ptr [ebp-44],eax
 00430DA5    mov         edx,430FF8;'Image'
 00430DAA    mov         eax,dword ptr [ebp-44]
 00430DAD    mov         ecx,dword ptr [eax]
 00430DAF    call        dword ptr [ecx+18]
 00430DB2    mov         edx,dword ptr [ebp-0C]
 00430DB5    mov         eax,dword ptr [ebp-44]
 00430DB8    mov         ecx,dword ptr [eax]
 00430DBA    call        dword ptr [ecx+68]
 00430DBD    push        edi
 00430DBE    push        0
 00430DC0    call        user32.LoadIconA
 00430DC5    push        eax
 00430DC6    mov         eax,dword ptr [ebp-44]
 00430DC9    mov         eax,dword ptr [eax+168]
 00430DCF    call        TPicture.GetIcon
 00430DD4    pop         edx
 00430DD5    call        TIcon.SetHandle
 00430DDA    push        20
 00430DDC    push        20
 00430DDE    mov         ecx,dword ptr [ebp-1C]
 00430DE1    mov         edx,dword ptr [ebp-18]
 00430DE4    mov         eax,dword ptr [ebp-44]
 00430DE7    mov         edi,dword ptr [eax]
 00430DE9    call        dword ptr [edi+84]
 00430DEF    mov         ecx,dword ptr [ebp-0C]
 00430DF2    mov         dl,1
 00430DF4    mov         eax,[004340D4];TLabel
 00430DF9    call        TCustomLabel.Create
 00430DFE    mov         edi,eax
 00430E00    mov         eax,dword ptr [ebp-0C]
 00430E03    mov         dword ptr [eax+2F8],edi
 00430E09    mov         edx,431008;'Message'
 00430E0E    mov         eax,edi
 00430E10    mov         ecx,dword ptr [eax]
 00430E12    call        dword ptr [ecx+18]
 00430E15    mov         edx,dword ptr [ebp-0C]
 00430E18    mov         eax,edi
 00430E1A    mov         ecx,dword ptr [eax]
 00430E1C    call        dword ptr [ecx+68]
 00430E1F    mov         dl,1
 00430E21    mov         eax,edi
 00430E23    call        TCustomLabel.SetWordWrap
 00430E28    mov         edx,dword ptr [ebp-4]
 00430E2B    mov         eax,edi
 00430E2D    call        TControl.SetText
 00430E32    lea         edx,[ebp-60]
 00430E35    mov         eax,edi
 00430E37    call        TControl.SetBoundsRect
 00430E3C    mov         eax,dword ptr [ebp-0C]
 00430E3F    mov         dl,byte ptr [eax+5F]
 00430E42    mov         eax,edi
 00430E44    mov         ecx,dword ptr [eax]
 00430E46    call        dword ptr [ecx+70]
 00430E49    sub         esi,dword ptr [ebp-58]
 00430E4C    add         esi,dword ptr [ebp-18]
 00430E4F    mov         dword ptr [ebp-3C],esi
 00430E52    mov         eax,edi
 00430E54    mov         si,0FFC8
 00430E58    call        @CallDynaInst
 00430E5D    test        al,al
>00430E5F    je          00430E72
 00430E61    mov         eax,dword ptr [ebp-0C]
 00430E64    call        TControl.GetClientWidth
 00430E69    sub         eax,dword ptr [ebp-3C]
 00430E6C    sub         eax,dword ptr [edi+48]
 00430E6F    mov         dword ptr [ebp-3C],eax
 00430E72    mov         eax,dword ptr [ebp-58]
 00430E75    push        eax
 00430E76    mov         eax,dword ptr [ebp-54]
 00430E79    push        eax
 00430E7A    mov         ecx,dword ptr [ebp-1C]
 00430E7D    mov         edx,dword ptr [ebp-3C]
 00430E80    mov         eax,edi
 00430E82    mov         esi,dword ptr [eax]
 00430E84    call        dword ptr [esi+84]
 00430E8A    test        byte ptr [ebp-7],4
>00430E8E    je          00430E96
 00430E90    mov         byte ptr [ebp-3D],2
>00430E94    jmp         00430EA6
 00430E96    test        byte ptr [ebp-7],1
>00430E9A    je          00430EA2
 00430E9C    mov         byte ptr [ebp-3D],0
>00430EA0    jmp         00430EA6
 00430EA2    mov         byte ptr [ebp-3D],5
 00430EA6    test        byte ptr [ebp-7],8
>00430EAA    je          00430EB2
 00430EAC    mov         byte ptr [ebp-3E],3
>00430EB0    jmp         00430EC2
 00430EB2    test        byte ptr [ebp-7],2
>00430EB6    je          00430EBE
 00430EB8    mov         byte ptr [ebp-3E],1
>00430EBC    jmp         00430EC2
 00430EBE    mov         byte ptr [ebp-3E],2
 00430EC2    mov         eax,dword ptr [ebp-0C]
 00430EC5    call        TControl.GetClientWidth
 00430ECA    sub         eax,ebx
 00430ECC    sar         eax,1
>00430ECE    jns         00430ED3
 00430ED0    adc         eax,0
 00430ED3    mov         dword ptr [ebp-38],eax
 00430ED6    xor         ebx,ebx
 00430ED8    mov         dword ptr [ebp-4C],5AC88C
 00430EDF    mov         esi,5AC8B8;^SMsgDlgYes:TResStringRec
 00430EE4    mov         dword ptr [ebp-50],5AC8E4
 00430EEB    mov         eax,ebx
 00430EED    cmp         al,0F
>00430EEF    ja          00430EF8
 00430EF1    and         eax,7F
 00430EF4    bt          dword ptr [ebp-7],eax
>00430EF8    jae         00430FAC
 00430EFE    mov         ecx,dword ptr [ebp-0C]
 00430F01    mov         dl,1
 00430F03    mov         eax,[004349B8];TButton
 00430F08    call        TButton.Create
 00430F0D    mov         dword ptr [ebp-48],eax
 00430F10    mov         eax,dword ptr [ebp-4C]
 00430F13    mov         edx,dword ptr [eax]
 00430F15    mov         eax,dword ptr [ebp-48]
 00430F18    mov         ecx,dword ptr [eax]
 00430F1A    call        dword ptr [ecx+18]
 00430F1D    mov         edx,dword ptr [ebp-0C]
 00430F20    mov         eax,dword ptr [ebp-48]
 00430F23    mov         ecx,dword ptr [eax]
 00430F25    call        dword ptr [ecx+68]
 00430F28    lea         edx,[ebp-70]
 00430F2B    mov         eax,dword ptr [esi]
 00430F2D    call        LoadStr
 00430F32    mov         edx,dword ptr [ebp-70]
 00430F35    mov         eax,dword ptr [ebp-48]
 00430F38    call        TControl.SetText
 00430F3D    mov         eax,dword ptr [ebp-50]
 00430F40    mov         eax,dword ptr [eax]
 00430F42    mov         edx,dword ptr [ebp-48]
 00430F45    mov         dword ptr [edx+214],eax
 00430F4B    cmp         bl,byte ptr [ebp-3D]
>00430F4E    jne         00430F5A
 00430F50    mov         dl,1
 00430F52    mov         eax,dword ptr [ebp-48]
 00430F55    call        TButton.SetDefault
 00430F5A    cmp         bl,byte ptr [ebp-3E]
>00430F5D    jne         00430F69
 00430F5F    mov         eax,dword ptr [ebp-48]
 00430F62    mov         byte ptr [eax+211],1
 00430F69    mov         eax,dword ptr [ebp-28]
 00430F6C    push        eax
 00430F6D    mov         eax,dword ptr [ebp-2C]
 00430F70    push        eax
 00430F71    mov         ecx,dword ptr [ebp-34]
 00430F74    add         ecx,dword ptr [ebp-1C]
 00430F77    add         ecx,dword ptr [ebp-24]
 00430F7A    mov         edx,dword ptr [ebp-38]
 00430F7D    mov         eax,dword ptr [ebp-48]
 00430F80    mov         edi,dword ptr [eax]
 00430F82    call        dword ptr [edi+84]
 00430F88    mov         eax,dword ptr [ebp-28]
 00430F8B    add         eax,dword ptr [ebp-30]
 00430F8E    add         dword ptr [ebp-38],eax
 00430F91    cmp         bl,0A
>00430F94    jne         00430FAC
 00430F96    mov         eax,dword ptr [ebp-48]
 00430F99    mov         edx,dword ptr [ebp-0C]
 00430F9C    mov         dword ptr [eax+124],edx
 00430FA2    mov         dword ptr [eax+120],43060C;TMessageForm.HelpButtonClick
 00430FAC    inc         ebx
 00430FAD    add         dword ptr [ebp-50],4
 00430FB1    add         esi,4
 00430FB4    add         dword ptr [ebp-4C],4
 00430FB8    cmp         bl,0B
>00430FBB    jne         00430EEB
 00430FC1    xor         eax,eax
 00430FC3    pop         edx
 00430FC4    pop         ecx
 00430FC5    pop         ecx
 00430FC6    mov         dword ptr fs:[eax],edx
 00430FC9    push        430FE3
 00430FCE    lea         eax,[ebp-70]
 00430FD1    mov         edx,4
 00430FD6    call        @LStrArrayClr
 00430FDB    ret
>00430FDC    jmp         @HandleFinally
>00430FE1    jmp         00430FCE
 00430FE3    mov         eax,dword ptr [ebp-0C]
 00430FE6    pop         edi
 00430FE7    pop         esi
 00430FE8    pop         ebx
 00430FE9    mov         esp,ebp
 00430FEB    pop         ebp
 00430FEC    ret
*}
end;

//00431010
function MessageDlgPos(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer):Integer;
begin
{*
 00431010    push        ebp
 00431011    mov         ebp,esp
 00431013    push        ecx
 00431014    mov         word ptr [ebp-2],cx
 00431018    mov         ecx,dword ptr [ebp+10]
 0043101B    push        ecx
 0043101C    mov         ecx,dword ptr [ebp+0C]
 0043101F    push        ecx
 00431020    mov         ecx,dword ptr [ebp+8]
 00431023    push        ecx
 00431024    push        0
 00431026    mov         cx,word ptr [ebp-2]
 0043102A    call        MessageDlgPosHelp
 0043102F    pop         ecx
 00431030    pop         ebp
 00431031    ret         0C
*}
end;

//00431034
function MessageDlgPosHelp(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer; const HelpFileName:AnsiString):Integer;
begin
{*
 00431034    push        ebp
 00431035    mov         ebp,esp
 00431037    add         esp,0FFFFFFF4
 0043103A    push        ebx
 0043103B    push        esi
 0043103C    mov         word ptr [ebp-3],cx
 00431040    mov         byte ptr [ebp-1],dl
 00431043    mov         esi,dword ptr [ebp+0C]
 00431046    mov         ebx,dword ptr [ebp+10]
 00431049    mov         cx,word ptr [ebp-3]
 0043104D    mov         dl,byte ptr [ebp-1]
 00431050    call        CreateMessageDialog
 00431055    mov         dword ptr [ebp-0C],eax
 00431058    xor         eax,eax
 0043105A    push        ebp
 0043105B    push        4310D3
 00431060    push        dword ptr fs:[eax]
 00431063    mov         dword ptr fs:[eax],esp
 00431066    mov         edx,dword ptr [ebp+14]
 00431069    mov         eax,dword ptr [ebp-0C]
 0043106C    call        TControl.SetHelpContext
 00431071    mov         eax,dword ptr [ebp-0C]
 00431074    add         eax,23C
 00431079    mov         edx,dword ptr [ebp+8]
 0043107C    call        @LStrAsg
 00431081    test        ebx,ebx
>00431083    jl          0043108F
 00431085    mov         edx,ebx
 00431087    mov         eax,dword ptr [ebp-0C]
 0043108A    call        TControl.SetLeft
 0043108F    test        esi,esi
>00431091    jl          0043109D
 00431093    mov         edx,esi
 00431095    mov         eax,dword ptr [ebp-0C]
 00431098    call        TControl.SetTop
 0043109D    test        esi,esi
>0043109F    jge         004310AF
 004310A1    test        ebx,ebx
>004310A3    jge         004310AF
 004310A5    mov         dl,4
 004310A7    mov         eax,dword ptr [ebp-0C]
 004310AA    call        TCustomForm.SetPosition
 004310AF    mov         eax,dword ptr [ebp-0C]
 004310B2    mov         edx,dword ptr [eax]
 004310B4    call        dword ptr [edx+0EC]
 004310BA    mov         dword ptr [ebp-8],eax
 004310BD    xor         eax,eax
 004310BF    pop         edx
 004310C0    pop         ecx
 004310C1    pop         ecx
 004310C2    mov         dword ptr fs:[eax],edx
 004310C5    push        4310DA
 004310CA    mov         eax,dword ptr [ebp-0C]
 004310CD    call        TObject.Free
 004310D2    ret
>004310D3    jmp         @HandleFinally
>004310D8    jmp         004310CA
 004310DA    mov         eax,dword ptr [ebp-8]
 004310DD    pop         esi
 004310DE    pop         ebx
 004310DF    mov         esp,ebp
 004310E1    pop         ebp
 004310E2    ret         10
*}
end;

//004310E8
procedure ShowMessage(const Msg:AnsiString);
begin
{*
 004310E8    or          ecx,0FFFFFFFF
 004310EB    or          edx,0FFFFFFFF
 004310EE    call        ShowMessagePos
 004310F3    ret
*}
end;

//004310F4
procedure ShowMessagePos(const Msg:AnsiString; X:Integer; Y:Integer);
begin
{*
 004310F4    push        0
 004310F6    push        edx
 004310F7    push        ecx
 004310F8    mov         dl,4
 004310FA    mov         cx,word ptr ds:[431108]
 00431101    call        MessageDlgPos
 00431106    ret
*}
end;

//0043110C
procedure InitGlobals;
begin
{*
 0043110C    add         esp,0FFFFFFD0
 0043110F    push        431170
 00431114    call        user32.RegisterWindowMessageA
 00431119    mov         [005E0B3C],eax;HelpMsg:Cardinal
 0043111E    push        431180
 00431123    call        user32.RegisterWindowMessageA
 00431128    mov         [005E0B40],eax;FindMsg:Cardinal
 0043112D    push        1
 0043112F    mov         eax,[005AF664];gvar_005AF664
 00431134    mov         dword ptr [esp+24],eax
 00431138    mov         byte ptr [esp+28],0
 0043113D    call        KERNEL32.GetCurrentThreadId
 00431142    mov         dword ptr [esp+2C],eax
 00431146    mov         byte ptr [esp+30],0
 0043114B    lea         ecx,[esp+24]
 0043114F    mov         edx,431194
 00431154    lea         eax,[esp+4]
 00431158    call        StrFmt
 0043115D    push        eax
 0043115E    call        KERNEL32.GlobalAddAtomA
 00431163    mov         [005AC860],ax
 00431169    add         esp,30
 0043116C    ret
*}
end;

//004311A8
procedure _NF__533;
begin
{*
 004311A8    sldt        word ptr [eax]
 004311AB    add         al,ah
 004311AD    enter       5A,48
 004311B1    loope       0043120D
 004311B3    add         byte ptr [eax],al
 004311B5    add         byte ptr [eax],al
 004311B7    add         ah,bl
 004311B9    enter       5A,14
 004311BD    in          eax,5A
 004311BF    add         byte ptr [eax],al
 004311C1    add         byte ptr [eax],al
 004311C3    add         al,bl
 004311C5    enter       5A,8
 004311C9    loope       00431225
 004311CB    add         byte ptr [eax],al
 004311CD    add         byte ptr [eax],al
 004311CF    add         ah,dl
 004311D1    enter       5A,0F0
 004311D5    out         5A,al
 004311D7    add         byte ptr [eax],al
 004311D9    add         byte ptr [eax],al
 004311DB    add         al,dl
 004311DD    enter       5A,38
 004311E1    in          eax,5A
 004311E3    add         byte ptr [eax],al
 004311E5    add         byte ptr [eax],al
 004311E7    add         ah,cl
 004311E9    enter       5A,90
 004311ED    in          al,5A
 004311EF    add         byte ptr [eax],al
 004311F1    add         byte ptr [eax],al
 004311F3    add         al,cl
 004311F5    enter       5A,34
 004311F9    out         5A,al
 004311FB    add         byte ptr [eax],al
 004311FD    add         byte ptr [eax],al
 004311FF    add         ah,al
 00431201    enter       5A,60
 00431205    jecxz       00431261
 00431207    add         byte ptr [eax],al
 00431209    add         byte ptr [eax],al
 0043120B    add         al,al
 0043120D    enter       5A,0BC
 00431211    in          al,5A
 00431213    add         byte ptr [eax],al
 00431215    add         byte ptr [eax],al
 00431217    add         byte ptr [eax+ecx*8-1C5FFFA6],bh
 0043121E    pop         edx
 0043121F    add         byte ptr [eax],al
 00431221    add         byte ptr [eax],al
 00431223    add         byte ptr [eax-47FFA538],bh
 00431229    out         5A,eax
 0043122B    add         byte ptr [eax],al
 0043122D    add         byte ptr [eax],al
 0043122F    add         byte ptr [eax-38],dh
 00431232    pop         edx
 00431233    add         ah,cl
 00431235    loope       00431291
 00431237    add         byte ptr [eax],al
 00431239    add         byte ptr [eax],al
 0043123B    add         byte ptr [eax+ecx*8+5A],ch
 0043123F    add         al,cl
 00431241    out         5A,al
 00431243    add         byte ptr [eax],al
 00431245    add         byte ptr [eax],al
 00431247    add         byte ptr [eax-38],ch
 0043124A    pop         edx
 0043124B    add         byte ptr [eax],ch
 0043124D    out         5A,eax
 0043124F    add         byte ptr [eax],al
 00431251    add         byte ptr [eax],al
 00431253    add         byte ptr [eax+ecx*8+5A],ah
 00431257    add         byte ptr [eax],al
 00431259    in          al,5A
 0043125B    add         byte ptr [eax],al
 0043125D    add         byte ptr [eax],al
 0043125F    add         byte ptr [ebp-75],dl;{Finalization}
*}
end;

Initialization
//004312BC
{*
 004312BC    sub         dword ptr ds:[5E0B38],1
>004312C3    jae         004312F8
 004312C5    mov         eax,4311A8;_NF__533
 004312CA    call        @InitImports
 004312CF    call        InitGlobals
 004312D4    mov         eax,[00437BA4];TControl
 004312D9    call        StartClassGroup
 004312DE    mov         eax,[00437BA4];TControl
 004312E3    call        ActivateClassGroup
 004312E8    mov         edx,dword ptr ds:[437BA4];TControl
 004312EE    mov         eax,[0042FFEC];TCommonDialog
 004312F3    call        GroupDescendentsWith
 004312F8    ret
*}
Finalization
//00431260
{*
 00431260    push        ebp
 00431261    mov         ebp,esp
 00431263    xor         eax,eax
 00431265    push        ebp
 00431266    push        4312B2
 0043126B    push        dword ptr fs:[eax]
 0043126E    mov         dword ptr fs:[eax],esp
 00431271    inc         dword ptr ds:[5E0B38]
>00431277    jne         004312A4
 00431279    cmp         word ptr ds:[5AC860],0
>00431281    je          0043128F
 00431283    mov         ax,[005AC860]
 00431289    push        eax
 0043128A    call        KERNEL32.GlobalDeleteAtom
 0043128F    mov         eax,5AC88C
 00431294    mov         ecx,0B
 00431299    mov         edx,dword ptr ds:[4010B4];String
 0043129F    call        @FinalizeArray
 004312A4    xor         eax,eax
 004312A6    pop         edx
 004312A7    pop         ecx
 004312A8    pop         ecx
 004312A9    mov         dword ptr fs:[eax],edx
 004312AC    push        4312B9
 004312B1    ret
>004312B2    jmp         @HandleFinally
>004312B7    jmp         004312B1
 004312B9    pop         ebp
 004312BA    ret
*}
end.