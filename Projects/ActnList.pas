//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ActnList;

interface

uses
  SysUtils, Classes, ActnList, ImgList, system;

type
  TContainedAction = class(TBasicAction)
  public
    Category:String;//f58
    FActionList:TCustomActionList;//f5C
    destructor Destroy; virtual;//00447944
    procedure ReadState(Reader:TReader); virtual;//v14//004479B4
    function Update:Boolean; virtual;//v44//00447B08
    procedure Execute; dynamic;//00447AB0
    procedure HasParent; dynamic;//004479A4
    procedure GetParentComponent; dynamic;//00447994
    procedure SetParentComponent(AParent:TComponent); dynamic;//00447A84
    function GetIndex:Integer;//00447978
    function IsStoredCategory(Value:String):Boolean;//00447990
    procedure SetIndex(Value:Integer);//004479E8
    procedure SetCategory(const Value:AnsiString);//00447A30
    procedure SetActionList(AActionList:TCustomActionList);//00447A5C
  end;
  TCustomActionList = class(TComponent)
  public
    FActions:TList;//f30
    FImageChangeLink:TChangeLink;//f34
    FImages:TCustomImageList;//f38
    FOnChange:TNotifyEvent;//f40
    FOnExecute:TActionEvent;//f48
    FOnUpdate:TActionEvent;//f50
    FState:TActionListState;//f58
    FOnStateChange:TNotifyEvent;//f60
    destructor Destroy; virtual;//00447BCC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00447CF0
    constructor Create(AOwner:TComponent); virtual;//v2C//00447B60
    procedure Change; virtual;//v30//00447D74
    procedure SetImages(Value:TCustomImageList); virtual;//v34//00447CB0
    procedure UpdateAction(Action:TBasicAction); dynamic;//00447E88
    procedure ExecuteAction(Action:TBasicAction); dynamic;//00447E68
    procedure SetChildOrder(Component:TComponent; Order:Integer); dynamic;//00447C64
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00447C1C
    function GetAction(Index:Integer):TContainedAction;//00447C94
    function GetActionCount:Integer;//00447CA8
    procedure ImageListChange(Sender:TObject);//00447CE4
    procedure AddAction(Action:TContainedAction);//00447D38
    procedure RemoveAction(Action:TContainedAction);//00447D58
    function IsShortCut(var Message:TWMKey):Boolean;//00447DDC
  end;
  TShortCutList = class(TStringList)
  public
    function Add(const S:AnsiString):Integer; virtual;//v38//00448618
    function IndexOfShortCut(const Shortcut:TShortCut):Integer;//00448644
  end;
  TCustomAction = class(TContainedAction)
  public
    FDisableIfNoHandler:Boolean;//f60
    FCaption:String;//f64
    FChecking:Boolean;//f68
    FChecked:Boolean;//f69
    FEnabled:Boolean;//f6A
    FGroupIndex:Integer;//f6C
    FHelpType:THelpType;//f70
    FHelpContext:THelpContext;//f74
    FHelpKeyword:String;//f78
    FHint:String;//f7C
    FImageIndex:TImageIndex;//f80
    FShortCut:TShortCut;//f84
    FVisible:Boolean;//f86
    FOnHint:THintEvent;//f88
    FSecondaryShortCuts:TShortCutList;//f90
    FSavedEnabledState:Boolean;//f94
    FAutoCheck:Boolean;//f95
    FImage:TObject;//f98
    FMask:TObject;//f9C
    destructor Destroy; virtual;//00447FF4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00448044
    procedure SetName(const Value:TComponentName); virtual;//v18//00448510
    constructor Create(AOwner:TComponent); virtual;//v2C//00447FA0
    procedure SetHelpContext(Value:THelpContext); virtual;//v48//00448338
    procedure SetHelpKeyword(const Value:AnsiString); virtual;//v4C//004482D0
    function HandleShortCut:Boolean; virtual;//v50//0044860C
    procedure DoHint(var HintStr:AnsiString); dynamic;//0044855C
    procedure Execute; dynamic;//00448584
    procedure SetCaption(const Value:AnsiString);//004480F0
    procedure SetChecked(Value:Boolean);//00448150
    procedure SetEnabled(Value:Boolean);//00448258
    procedure SetHint(const Value:AnsiString);//00448390
    procedure SetImageIndex(Value:TImageIndex);//004483F0
    procedure SetShortCut(Value:TShortCut);//0044844C
    procedure SetVisible(Value:Boolean);//004484B0
    function GetSecondaryShortCuts:TShortCutList;//004485E4
  end;
  TActionLink = class(TBasicActionLink)
  public
    function IsCaptionLinked:Boolean; virtual;//v20//00447EA8
    function IsCheckedLinked:Boolean; virtual;//v24//00447EBC
    function IsEnabledLinked:Boolean; virtual;//v28//00447ED0
    function IsGroupIndexLinked:Boolean; virtual;//v2C//00447EE4
    function IsHelpContextLinked:Boolean; virtual;//v30//00447EF8
    function IsHelpLinked:Boolean; virtual;//v34//00447F0C
    function IsHintLinked:Boolean; virtual;//v38//00447F20
    function IsImageIndexLinked:Boolean; virtual;//v3C//00447F34
    function IsShortCutLinked:Boolean; virtual;//v40//00447F48
    function IsVisibleLinked:Boolean; virtual;//v44//00447F5C
    procedure v48; virtual;//v48//00447F70
    procedure v4C; virtual;//v4C//00447F74
    procedure v50; virtual;//v50//00447F78
    procedure v54; virtual;//v54//00447F7C
    procedure v58; virtual;//v58//00447F80
    procedure v5C; virtual;//v5C//00447F84
    procedure v60; virtual;//v60//00447F88
    procedure v64; virtual;//v64//00447F8C
    procedure v68; virtual;//v68//00447F90
    procedure v6C; virtual;//v6C//00447F94
    procedure v70; virtual;//v70//00447F98
    procedure v74; virtual;//v74//00447F9C
  end;
    destructor Destroy;//00447944
    procedure GetParentComponent;//00447994
    procedure HasParent;//004479A4
    procedure ReadState(Reader:TReader);//004479B4
    procedure SetParentComponent(AParent:TComponent);//00447A84
    procedure Execute;//00447AB0
    function Update:Boolean;//00447B08
    constructor Create(AOwner:TComponent);//00447B60
    destructor Destroy;//00447BCC
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00447C1C
    procedure SetChildOrder(Component:TComponent; Order:Integer);//00447C64
    procedure SetImages(Value:TCustomImageList);//00447CB0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00447CF0
    procedure Change;//00447D74
    procedure ExecuteAction(Action:TBasicAction);//00447E68
    procedure UpdateAction(Action:TBasicAction);//00447E88
    function IsCaptionLinked:Boolean;//00447EA8
    function IsCheckedLinked:Boolean;//00447EBC
    function IsEnabledLinked:Boolean;//00447ED0
    function IsGroupIndexLinked:Boolean;//00447EE4
    function IsHelpContextLinked:Boolean;//00447EF8
    function IsHelpLinked:Boolean;//00447F0C
    function IsHintLinked:Boolean;//00447F20
    function IsImageIndexLinked:Boolean;//00447F34
    function IsShortCutLinked:Boolean;//00447F48
    function IsVisibleLinked:Boolean;//00447F5C
    procedure sub_00447F70;//00447F70
    procedure sub_00447F74;//00447F74
    procedure sub_00447F78;//00447F78
    procedure sub_00447F7C;//00447F7C
    procedure sub_00447F80;//00447F80
    procedure sub_00447F84;//00447F84
    procedure sub_00447F88;//00447F88
    procedure sub_00447F8C;//00447F8C
    procedure sub_00447F90;//00447F90
    procedure sub_00447F94;//00447F94
    procedure sub_00447F98;//00447F98
    procedure sub_00447F9C;//00447F9C
    constructor Create(AOwner:TComponent);//00447FA0
    destructor Destroy;//00447FF4
    procedure AssignTo(Dest:TPersistent);//00448044
    procedure SetHelpKeyword(const Value:AnsiString);//004482D0
    procedure SetHelpContext(Value:THelpContext);//00448338
    procedure SetName(const Value:TComponentName);//00448510
    procedure DoHint(var HintStr:AnsiString);//0044855C
    procedure Execute;//00448584
    function HandleShortCut:Boolean;//0044860C
    function Add(const S:AnsiString):Integer;//00448618

implementation

//00447944
destructor TContainedAction.Destroy;
begin
{*
 00447944    push        ebx
 00447945    push        esi
 00447946    call        @BeforeDestruction
 0044794B    mov         ebx,edx
 0044794D    mov         esi,eax
 0044794F    mov         eax,dword ptr [esi+5C]
 00447952    test        eax,eax
>00447954    je          0044795D
 00447956    mov         edx,esi
 00447958    call        TCustomActionList.RemoveAction
 0044795D    mov         edx,ebx
 0044795F    and         dl,0FC
 00447962    mov         eax,esi
 00447964    call        TBasicAction.Destroy
 00447969    test        bl,bl
>0044796B    jle         00447974
 0044796D    mov         eax,esi
 0044796F    call        @ClassDestroy
 00447974    pop         esi
 00447975    pop         ebx
 00447976    ret
*}
end;

//00447978
function TContainedAction.GetIndex:Integer;
begin
{*
 00447978    mov         edx,dword ptr [eax+5C]
 0044797B    test        edx,edx
>0044797D    je          00447989
 0044797F    mov         edx,dword ptr [edx+30]
 00447982    xchg        eax,edx
 00447983    call        TList.IndexOf
 00447988    ret
 00447989    or          eax,0FFFFFFFF
 0044798C    ret
*}
end;

//00447990
function TContainedAction.IsStoredCategory(Value:String):Boolean;
begin
{*
 00447990    mov         al,1
 00447992    ret
*}
end;

//00447994
procedure TContainedAction.GetParentComponent;
begin
{*
 00447994    mov         edx,dword ptr [eax+5C]
 00447997    test        edx,edx
>00447999    je          0044799E
 0044799B    mov         eax,edx
 0044799D    ret
 0044799E    call        TComponent.GetParentComponent
 004479A3    ret
*}
end;

//004479A4
procedure TContainedAction.HasParent;
begin
{*
 004479A4    cmp         dword ptr [eax+5C],0
>004479A8    je          004479AD
 004479AA    mov         al,1
 004479AC    ret
 004479AD    call        TComponent.HasParent
 004479B2    ret
*}
end;

//004479B4
procedure TContainedAction.ReadState(Reader:TReader);
begin
{*
 004479B4    push        ebx
 004479B5    push        esi
 004479B6    push        edi
 004479B7    mov         esi,edx
 004479B9    mov         ebx,eax
 004479BB    mov         edx,esi
 004479BD    mov         eax,ebx
 004479BF    call        TComponent.ReadState
 004479C4    mov         edi,dword ptr [esi+2C]
 004479C7    mov         eax,edi
 004479C9    mov         edx,dword ptr ds:[447574];TCustomActionList
 004479CF    call        @IsClass
 004479D4    test        al,al
>004479D6    je          004479E1
 004479D8    mov         edx,edi
 004479DA    mov         eax,ebx
 004479DC    call        TContainedAction.SetActionList
 004479E1    pop         edi
 004479E2    pop         esi
 004479E3    pop         ebx
 004479E4    ret
*}
end;

//004479E8
procedure TContainedAction.SetIndex(Value:Integer);
begin
{*
 004479E8    push        ebx
 004479E9    push        esi
 004479EA    push        edi
 004479EB    mov         esi,edx
 004479ED    mov         ebx,eax
 004479EF    mov         eax,ebx
 004479F1    call        TContainedAction.GetIndex
 004479F6    test        eax,eax
>004479F8    jl          00447A2B
 004479FA    mov         edx,dword ptr [ebx+5C]
 004479FD    mov         edi,dword ptr [edx+30]
 00447A00    mov         edx,dword ptr [edi+8]
 00447A03    test        esi,esi
>00447A05    jge         00447A09
 00447A07    xor         esi,esi
 00447A09    cmp         edx,esi
>00447A0B    jg          00447A10
 00447A0D    mov         esi,edx
 00447A0F    dec         esi
 00447A10    cmp         eax,esi
>00447A12    je          00447A2B
 00447A14    mov         edx,edi
 00447A16    xchg        eax,edx
 00447A17    call        TList.Delete
 00447A1C    mov         eax,dword ptr [ebx+5C]
 00447A1F    mov         eax,dword ptr [eax+30]
 00447A22    mov         ecx,ebx
 00447A24    mov         edx,esi
 00447A26    call        TList.Insert
 00447A2B    pop         edi
 00447A2C    pop         esi
 00447A2D    pop         ebx
 00447A2E    ret
*}
end;

//00447A30
procedure TContainedAction.SetCategory(const Value:AnsiString);
begin
{*
 00447A30    push        ebx
 00447A31    push        esi
 00447A32    mov         esi,edx
 00447A34    mov         ebx,eax
 00447A36    mov         eax,esi
 00447A38    mov         edx,dword ptr [ebx+58]
 00447A3B    call        @LStrCmp
>00447A40    je          00447A58
 00447A42    lea         eax,[ebx+58]
 00447A45    mov         edx,esi
 00447A47    call        @LStrAsg
 00447A4C    mov         eax,dword ptr [ebx+5C]
 00447A4F    test        eax,eax
>00447A51    je          00447A58
 00447A53    mov         edx,dword ptr [eax]
 00447A55    call        dword ptr [edx+30]
 00447A58    pop         esi
 00447A59    pop         ebx
 00447A5A    ret
*}
end;

//00447A5C
procedure TContainedAction.SetActionList(AActionList:TCustomActionList);
begin
{*
 00447A5C    push        ebx
 00447A5D    push        esi
 00447A5E    mov         esi,edx
 00447A60    mov         ebx,eax
 00447A62    mov         eax,dword ptr [ebx+5C]
 00447A65    cmp         esi,eax
>00447A67    je          00447A81
 00447A69    test        eax,eax
>00447A6B    je          00447A74
 00447A6D    mov         edx,ebx
 00447A6F    call        TCustomActionList.RemoveAction
 00447A74    test        esi,esi
>00447A76    je          00447A81
 00447A78    mov         edx,ebx
 00447A7A    mov         eax,esi
 00447A7C    call        TCustomActionList.AddAction
 00447A81    pop         esi
 00447A82    pop         ebx
 00447A83    ret
*}
end;

//00447A84
procedure TContainedAction.SetParentComponent(AParent:TComponent);
begin
{*
 00447A84    push        ebx
 00447A85    push        esi
 00447A86    mov         esi,edx
 00447A88    mov         ebx,eax
 00447A8A    test        byte ptr [ebx+1C],1
>00447A8E    jne         00447AAA
 00447A90    mov         eax,esi
 00447A92    mov         edx,dword ptr ds:[447574];TCustomActionList
 00447A98    call        @IsClass
 00447A9D    test        al,al
>00447A9F    je          00447AAA
 00447AA1    mov         edx,esi
 00447AA3    mov         eax,ebx
 00447AA5    call        TContainedAction.SetActionList
 00447AAA    pop         esi
 00447AAB    pop         ebx
 00447AAC    ret
*}
end;

//00447AB0
procedure TContainedAction.Execute;
begin
{*
 00447AB0    push        ebx
 00447AB1    push        esi
 00447AB2    push        edi
 00447AB3    mov         ebx,eax
 00447AB5    mov         edi,dword ptr [ebx+5C]
 00447AB8    test        edi,edi
>00447ABA    je          00447ACD
 00447ABC    mov         edx,ebx
 00447ABE    mov         eax,edi
 00447AC0    mov         si,0FFF3
 00447AC4    call        @CallDynaInst
 00447AC9    test        al,al
>00447ACB    jne         00447AFF
 00447ACD    mov         eax,[005AE584];^Application:TApplication
 00447AD2    mov         eax,dword ptr [eax]
 00447AD4    mov         edx,ebx
 00447AD6    call        TApplication.ExecuteAction
 00447ADB    test        al,al
>00447ADD    jne         00447AFF
 00447ADF    mov         eax,ebx
 00447AE1    call        TBasicAction.Execute
 00447AE6    test        al,al
>00447AE8    jne         00447AFF
 00447AEA    mov         ecx,ebx
 00447AEC    xor         edx,edx
 00447AEE    mov         eax,0B040
 00447AF3    call        SendAppMessage
 00447AF8    dec         eax
>00447AF9    je          00447AFF
 00447AFB    xor         eax,eax
>00447AFD    jmp         00447B01
 00447AFF    mov         al,1
 00447B01    pop         edi
 00447B02    pop         esi
 00447B03    pop         ebx
 00447B04    ret
*}
end;

//00447B08
function TContainedAction.Update:Boolean;
begin
{*
 00447B08    push        ebx
 00447B09    push        esi
 00447B0A    push        edi
 00447B0B    mov         ebx,eax
 00447B0D    mov         edi,dword ptr [ebx+5C]
 00447B10    test        edi,edi
>00447B12    je          00447B25
 00447B14    mov         edx,ebx
 00447B16    mov         eax,edi
 00447B18    mov         si,0FFF0
 00447B1C    call        @CallDynaInst
 00447B21    test        al,al
>00447B23    jne         00447B57
 00447B25    mov         eax,[005AE584];^Application:TApplication
 00447B2A    mov         eax,dword ptr [eax]
 00447B2C    mov         edx,ebx
 00447B2E    call        TApplication.UpdateAction
 00447B33    test        al,al
>00447B35    jne         00447B57
 00447B37    mov         eax,ebx
 00447B39    call        TBasicAction.Update
 00447B3E    test        al,al
>00447B40    jne         00447B57
 00447B42    mov         ecx,ebx
 00447B44    xor         edx,edx
 00447B46    mov         eax,0B03F
 00447B4B    call        SendAppMessage
 00447B50    dec         eax
>00447B51    je          00447B57
 00447B53    xor         eax,eax
>00447B55    jmp         00447B59
 00447B57    mov         al,1
 00447B59    pop         edi
 00447B5A    pop         esi
 00447B5B    pop         ebx
 00447B5C    ret
*}
end;

//00447B60
constructor TCustomActionList.Create(AOwner:TComponent);
begin
{*
 00447B60    push        ebp
 00447B61    mov         ebp,esp
 00447B63    push        ecx
 00447B64    push        ebx
 00447B65    push        esi
 00447B66    test        dl,dl
>00447B68    je          00447B72
 00447B6A    add         esp,0FFFFFFF0
 00447B6D    call        @ClassCreate
 00447B72    mov         byte ptr [ebp-1],dl
 00447B75    mov         ebx,eax
 00447B77    xor         edx,edx
 00447B79    mov         eax,ebx
 00447B7B    call        TComponent.Create
 00447B80    mov         dl,1
 00447B82    mov         eax,[00417CEC];TList
 00447B87    call        TObject.Create
 00447B8C    mov         dword ptr [ebx+30],eax
 00447B8F    mov         dl,1
 00447B91    mov         eax,[004486E4];TChangeLink
 00447B96    call        TObject.Create
 00447B9B    mov         esi,eax
 00447B9D    mov         dword ptr [ebx+34],esi
 00447BA0    mov         dword ptr [esi+0C],ebx
 00447BA3    mov         dword ptr [esi+8],447CE4;TCustomActionList.ImageListChange
 00447BAA    mov         byte ptr [ebx+58],0
 00447BAE    mov         eax,ebx
 00447BB0    cmp         byte ptr [ebp-1],0
>00447BB4    je          00447BC5
 00447BB6    call        @AfterConstruction
 00447BBB    pop         dword ptr fs:[0]
 00447BC2    add         esp,0C
 00447BC5    mov         eax,ebx
 00447BC7    pop         esi
 00447BC8    pop         ebx
 00447BC9    pop         ecx
 00447BCA    pop         ebp
 00447BCB    ret
*}
end;

//00447BCC
destructor TCustomActionList.Destroy;
begin
{*
 00447BCC    push        ebx
 00447BCD    push        esi
 00447BCE    push        edi
 00447BCF    call        @BeforeDestruction
 00447BD4    mov         ebx,edx
 00447BD6    mov         edi,eax
 00447BD8    mov         eax,dword ptr [edi+34]
 00447BDB    call        TObject.Free
>00447BE0    jmp         00447BEE
 00447BE2    mov         eax,esi
 00447BE4    call        TList.Last
 00447BE9    call        TObject.Free
 00447BEE    mov         esi,dword ptr [edi+30]
 00447BF1    cmp         dword ptr [esi+8],0
>00447BF5    jg          00447BE2
 00447BF7    mov         eax,dword ptr [edi+30]
 00447BFA    call        TObject.Free
 00447BFF    mov         edx,ebx
 00447C01    and         dl,0FC
 00447C04    mov         eax,edi
 00447C06    call        TComponent.Destroy
 00447C0B    test        bl,bl
>00447C0D    jle         00447C16
 00447C0F    mov         eax,edi
 00447C11    call        @ClassDestroy
 00447C16    pop         edi
 00447C17    pop         esi
 00447C18    pop         ebx
 00447C19    ret
*}
end;

//00447C1C
procedure TCustomActionList.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00447C1C    push        ebp
 00447C1D    mov         ebp,esp
 00447C1F    add         esp,0FFFFFFF8
 00447C22    push        ebx
 00447C23    push        esi
 00447C24    mov         dword ptr [ebp-8],edx
 00447C27    mov         dword ptr [ebp-4],eax
 00447C2A    mov         eax,dword ptr [ebp-4]
 00447C2D    mov         eax,dword ptr [eax+30]
 00447C30    mov         ebx,dword ptr [eax+8]
 00447C33    dec         ebx
 00447C34    test        ebx,ebx
>00447C36    jl          00447C5B
 00447C38    inc         ebx
 00447C39    xor         esi,esi
 00447C3B    mov         eax,dword ptr [ebp-4]
 00447C3E    mov         eax,dword ptr [eax+30]
 00447C41    mov         eax,dword ptr [eax+4]
 00447C44    mov         eax,dword ptr [eax+esi*4]
 00447C47    mov         edx,dword ptr [eax+4]
 00447C4A    cmp         edx,dword ptr [ebp-8]
>00447C4D    jne         00447C57
 00447C4F    mov         edx,eax
 00447C51    mov         eax,dword ptr [ebp+0C]
 00447C54    call        dword ptr [ebp+8]
 00447C57    inc         esi
 00447C58    dec         ebx
>00447C59    jne         00447C3B
 00447C5B    pop         esi
 00447C5C    pop         ebx
 00447C5D    pop         ecx
 00447C5E    pop         ecx
 00447C5F    pop         ebp
 00447C60    ret         8
*}
end;

//00447C64
procedure TCustomActionList.SetChildOrder(Component:TComponent; Order:Integer);
begin
{*
 00447C64    push        ebx
 00447C65    push        esi
 00447C66    push        edi
 00447C67    mov         edi,ecx
 00447C69    mov         esi,edx
 00447C6B    mov         ebx,eax
 00447C6D    mov         edx,esi
 00447C6F    mov         eax,dword ptr [ebx+30]
 00447C72    call        TList.IndexOf
 00447C77    test        eax,eax
>00447C79    jl          00447C8F
 00447C7B    mov         eax,esi
 00447C7D    mov         edx,dword ptr ds:[447450];TContainedAction
 00447C83    call        @AsClass
 00447C88    mov         edx,edi
 00447C8A    call        TContainedAction.SetIndex
 00447C8F    pop         edi
 00447C90    pop         esi
 00447C91    pop         ebx
 00447C92    ret
*}
end;

//00447C94
function TCustomActionList.GetAction(Index:Integer):TContainedAction;
begin
{*
 00447C94    push        ebx
 00447C95    push        esi
 00447C96    mov         esi,edx
 00447C98    mov         ebx,eax
 00447C9A    mov         edx,esi
 00447C9C    mov         eax,dword ptr [ebx+30]
 00447C9F    call        TList.Get
 00447CA4    pop         esi
 00447CA5    pop         ebx
 00447CA6    ret
*}
end;

//00447CA8
function TCustomActionList.GetActionCount:Integer;
begin
{*
 00447CA8    mov         eax,dword ptr [eax+30]
 00447CAB    mov         eax,dword ptr [eax+8]
 00447CAE    ret
*}
end;

//00447CB0
procedure TCustomActionList.SetImages(Value:TCustomImageList);
begin
{*
 00447CB0    push        ebx
 00447CB1    push        esi
 00447CB2    mov         esi,edx
 00447CB4    mov         ebx,eax
 00447CB6    mov         eax,dword ptr [ebx+38]
 00447CB9    test        eax,eax
>00447CBB    je          00447CC5
 00447CBD    mov         edx,dword ptr [ebx+34]
 00447CC0    call        TCustomImageList.UnRegisterChanges
 00447CC5    mov         eax,esi
 00447CC7    mov         dword ptr [ebx+38],eax
 00447CCA    test        eax,eax
>00447CCC    je          00447CE0
 00447CCE    mov         edx,dword ptr [ebx+34]
 00447CD1    call        TCustomImageList.RegisterChanges
 00447CD6    mov         edx,ebx
 00447CD8    mov         eax,dword ptr [ebx+38]
 00447CDB    call        TComponent.FreeNotification
 00447CE0    pop         esi
 00447CE1    pop         ebx
 00447CE2    ret
*}
end;

//00447CE4
procedure TCustomActionList.ImageListChange(Sender:TObject);
begin
{*
 00447CE4    cmp         edx,dword ptr [eax+38]
>00447CE7    jne         00447CEE
 00447CE9    mov         edx,dword ptr [eax]
 00447CEB    call        dword ptr [edx+30]
 00447CEE    ret
*}
end;

//00447CF0
procedure TCustomActionList.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00447CF0    push        ebx
 00447CF1    push        esi
 00447CF2    push        edi
 00447CF3    mov         ebx,ecx
 00447CF5    mov         edi,edx
 00447CF7    mov         esi,eax
 00447CF9    mov         ecx,ebx
 00447CFB    mov         edx,edi
 00447CFD    mov         eax,esi
 00447CFF    call        TComponent.Notification
 00447D04    cmp         bl,1
>00447D07    jne         00447D33
 00447D09    cmp         edi,dword ptr [esi+38]
>00447D0C    jne         00447D19
 00447D0E    xor         edx,edx
 00447D10    mov         eax,esi
 00447D12    mov         ecx,dword ptr [eax]
 00447D14    call        dword ptr [ecx+34]
>00447D17    jmp         00447D33
 00447D19    mov         eax,edi
 00447D1B    mov         edx,dword ptr ds:[447450];TContainedAction
 00447D21    call        @IsClass
 00447D26    test        al,al
>00447D28    je          00447D33
 00447D2A    mov         edx,edi
 00447D2C    mov         eax,esi
 00447D2E    call        TCustomActionList.RemoveAction
 00447D33    pop         edi
 00447D34    pop         esi
 00447D35    pop         ebx
 00447D36    ret
*}
end;

//00447D38
procedure TCustomActionList.AddAction(Action:TContainedAction);
begin
{*
 00447D38    push        ebx
 00447D39    push        esi
 00447D3A    mov         esi,edx
 00447D3C    mov         ebx,eax
 00447D3E    mov         edx,esi
 00447D40    mov         eax,dword ptr [ebx+30]
 00447D43    call        TList.Add
 00447D48    mov         dword ptr [esi+5C],ebx
 00447D4B    mov         edx,ebx
 00447D4D    mov         eax,esi
 00447D4F    call        TComponent.FreeNotification
 00447D54    pop         esi
 00447D55    pop         ebx
 00447D56    ret
*}
end;

//00447D58
procedure TCustomActionList.RemoveAction(Action:TContainedAction);
begin
{*
 00447D58    push        ebx
 00447D59    push        esi
 00447D5A    mov         esi,edx
 00447D5C    mov         ebx,eax
 00447D5E    mov         edx,esi
 00447D60    mov         eax,dword ptr [ebx+30]
 00447D63    call        TList.Remove
 00447D68    test        eax,eax
>00447D6A    jl          00447D71
 00447D6C    xor         eax,eax
 00447D6E    mov         dword ptr [esi+5C],eax
 00447D71    pop         esi
 00447D72    pop         ebx
 00447D73    ret
*}
end;

//00447D74
procedure TCustomActionList.Change;
begin
{*
 00447D74    push        ebx
 00447D75    push        esi
 00447D76    push        edi
 00447D77    mov         ebx,eax
 00447D79    cmp         word ptr [ebx+42],0
>00447D7E    je          00447D88
 00447D80    mov         edx,ebx
 00447D82    mov         eax,dword ptr [ebx+44]
 00447D85    call        dword ptr [ebx+40]
 00447D88    mov         eax,dword ptr [ebx+30]
 00447D8B    mov         esi,dword ptr [eax+8]
 00447D8E    dec         esi
 00447D8F    test        esi,esi
>00447D91    jl          00447DA8
 00447D93    inc         esi
 00447D94    xor         edi,edi
 00447D96    mov         eax,dword ptr [ebx+30]
 00447D99    mov         eax,dword ptr [eax+4]
 00447D9C    mov         eax,dword ptr [eax+edi*4]
 00447D9F    mov         edx,dword ptr [eax]
 00447DA1    call        dword ptr [edx+30]
 00447DA4    inc         edi
 00447DA5    dec         esi
>00447DA6    jne         00447D96
 00447DA8    test        byte ptr [ebx+1C],10
>00447DAC    je          00447DD6
 00447DAE    mov         esi,dword ptr [ebx+4]
 00447DB1    mov         eax,esi
 00447DB3    mov         edx,dword ptr ds:[451000];TForm
 00447DB9    call        @IsClass
 00447DBE    test        al,al
>00447DC0    je          00447DD6
 00447DC2    cmp         dword ptr [esi+250],0
>00447DC9    je          00447DD6
 00447DCB    mov         eax,dword ptr [esi+250]
 00447DD1    mov         edx,dword ptr [eax]
 00447DD3    call        dword ptr [edx+0C]
 00447DD6    pop         edi
 00447DD7    pop         esi
 00447DD8    pop         ebx
 00447DD9    ret
*}
end;

//00447DDC
function TCustomActionList.IsShortCut(var Message:TWMKey):Boolean;
begin
{*
 00447DDC    push        ebx
 00447DDD    push        esi
 00447DDE    push        edi
 00447DDF    push        ebp
 00447DE0    push        ecx
 00447DE1    mov         esi,edx
 00447DE3    mov         dword ptr [esp],eax
 00447DE6    mov         eax,dword ptr [esi+8]
 00447DE9    call        KeyDataToShiftState
 00447DEE    mov         ebx,eax
 00447DF0    mov         ax,word ptr [esi+4]
 00447DF4    mov         edx,ebx
 00447DF6    call        ShortCut
 00447DFB    mov         ebp,eax
 00447DFD    test        bp,bp
>00447E00    je          00447E60
 00447E02    mov         eax,dword ptr [esp]
 00447E05    mov         eax,dword ptr [eax+30]
 00447E08    mov         esi,dword ptr [eax+8]
 00447E0B    dec         esi
 00447E0C    test        esi,esi
>00447E0E    jl          00447E60
 00447E10    inc         esi
 00447E11    xor         edi,edi
 00447E13    mov         eax,dword ptr [esp]
 00447E16    mov         eax,dword ptr [eax+30]
 00447E19    mov         eax,dword ptr [eax+4]
 00447E1C    mov         ebx,dword ptr [eax+edi*4]
 00447E1F    mov         eax,ebx
 00447E21    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447E27    call        @IsClass
 00447E2C    test        al,al
>00447E2E    je          00447E5C
 00447E30    cmp         bp,word ptr [ebx+84]
>00447E37    je          00447E53
 00447E39    cmp         dword ptr [ebx+90],0
>00447E40    je          00447E5C
 00447E42    mov         eax,ebx
 00447E44    call        TCustomAction.GetSecondaryShortCuts
 00447E49    mov         edx,ebp
 00447E4B    call        TShortCutList.IndexOfShortCut
 00447E50    inc         eax
>00447E51    je          00447E5C
 00447E53    mov         eax,ebx
 00447E55    mov         edx,dword ptr [eax]
 00447E57    call        dword ptr [edx+50]
>00447E5A    jmp         00447E62
 00447E5C    inc         edi
 00447E5D    dec         esi
>00447E5E    jne         00447E13
 00447E60    xor         eax,eax
 00447E62    pop         edx
 00447E63    pop         ebp
 00447E64    pop         edi
 00447E65    pop         esi
 00447E66    pop         ebx
 00447E67    ret
*}
end;

//00447E68
procedure TCustomActionList.ExecuteAction(Action:TBasicAction);
begin
{*
 00447E68    push        ebx
 00447E69    push        ecx
 00447E6A    mov         byte ptr [esp],0
 00447E6E    cmp         word ptr [eax+4A],0
>00447E73    je          00447E7F
 00447E75    mov         ecx,esp
 00447E77    mov         ebx,eax
 00447E79    mov         eax,dword ptr [ebx+4C]
 00447E7C    call        dword ptr [ebx+48]
 00447E7F    mov         al,byte ptr [esp]
 00447E82    pop         edx
 00447E83    pop         ebx
 00447E84    ret
*}
end;

//00447E88
procedure TCustomActionList.UpdateAction(Action:TBasicAction);
begin
{*
 00447E88    push        ebx
 00447E89    push        ecx
 00447E8A    mov         byte ptr [esp],0
 00447E8E    cmp         word ptr [eax+52],0
>00447E93    je          00447E9F
 00447E95    mov         ecx,esp
 00447E97    mov         ebx,eax
 00447E99    mov         eax,dword ptr [ebx+54]
 00447E9C    call        dword ptr [ebx+50]
 00447E9F    mov         al,byte ptr [esp]
 00447EA2    pop         edx
 00447EA3    pop         ebx
 00447EA4    ret
*}
end;

//00447EA8
function TActionLink.IsCaptionLinked:Boolean;
begin
{*
 00447EA8    push        ebx
 00447EA9    mov         ebx,eax
 00447EAB    mov         eax,dword ptr [ebx+10]
 00447EAE    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447EB4    call        @IsClass
 00447EB9    pop         ebx
 00447EBA    ret
*}
end;

//00447EBC
function TActionLink.IsCheckedLinked:Boolean;
begin
{*
 00447EBC    push        ebx
 00447EBD    mov         ebx,eax
 00447EBF    mov         eax,dword ptr [ebx+10]
 00447EC2    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447EC8    call        @IsClass
 00447ECD    pop         ebx
 00447ECE    ret
*}
end;

//00447ED0
function TActionLink.IsEnabledLinked:Boolean;
begin
{*
 00447ED0    push        ebx
 00447ED1    mov         ebx,eax
 00447ED3    mov         eax,dword ptr [ebx+10]
 00447ED6    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447EDC    call        @IsClass
 00447EE1    pop         ebx
 00447EE2    ret
*}
end;

//00447EE4
function TActionLink.IsGroupIndexLinked:Boolean;
begin
{*
 00447EE4    push        ebx
 00447EE5    mov         ebx,eax
 00447EE7    mov         eax,dword ptr [ebx+10]
 00447EEA    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447EF0    call        @IsClass
 00447EF5    pop         ebx
 00447EF6    ret
*}
end;

//00447EF8
function TActionLink.IsHelpContextLinked:Boolean;
begin
{*
 00447EF8    push        ebx
 00447EF9    mov         ebx,eax
 00447EFB    mov         eax,dword ptr [ebx+10]
 00447EFE    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447F04    call        @IsClass
 00447F09    pop         ebx
 00447F0A    ret
*}
end;

//00447F0C
function TActionLink.IsHelpLinked:Boolean;
begin
{*
 00447F0C    push        ebx
 00447F0D    mov         ebx,eax
 00447F0F    mov         eax,dword ptr [ebx+10]
 00447F12    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447F18    call        @IsClass
 00447F1D    pop         ebx
 00447F1E    ret
*}
end;

//00447F20
function TActionLink.IsHintLinked:Boolean;
begin
{*
 00447F20    push        ebx
 00447F21    mov         ebx,eax
 00447F23    mov         eax,dword ptr [ebx+10]
 00447F26    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447F2C    call        @IsClass
 00447F31    pop         ebx
 00447F32    ret
*}
end;

//00447F34
function TActionLink.IsImageIndexLinked:Boolean;
begin
{*
 00447F34    push        ebx
 00447F35    mov         ebx,eax
 00447F37    mov         eax,dword ptr [ebx+10]
 00447F3A    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447F40    call        @IsClass
 00447F45    pop         ebx
 00447F46    ret
*}
end;

//00447F48
function TActionLink.IsShortCutLinked:Boolean;
begin
{*
 00447F48    push        ebx
 00447F49    mov         ebx,eax
 00447F4B    mov         eax,dword ptr [ebx+10]
 00447F4E    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447F54    call        @IsClass
 00447F59    pop         ebx
 00447F5A    ret
*}
end;

//00447F5C
function TActionLink.IsVisibleLinked:Boolean;
begin
{*
 00447F5C    push        ebx
 00447F5D    mov         ebx,eax
 00447F5F    mov         eax,dword ptr [ebx+10]
 00447F62    mov         edx,dword ptr ds:[44776C];TCustomAction
 00447F68    call        @IsClass
 00447F6D    pop         ebx
 00447F6E    ret
*}
end;

//00447F70
procedure sub_00447F70;
begin
{*
 00447F70    ret
*}
end;

//00447F74
procedure sub_00447F74;
begin
{*
 00447F74    ret
*}
end;

//00447F78
procedure sub_00447F78;
begin
{*
 00447F78    ret
*}
end;

//00447F7C
procedure sub_00447F7C;
begin
{*
 00447F7C    ret
*}
end;

//00447F80
procedure sub_00447F80;
begin
{*
 00447F80    ret
*}
end;

//00447F84
procedure sub_00447F84;
begin
{*
 00447F84    ret
*}
end;

//00447F88
procedure sub_00447F88;
begin
{*
 00447F88    ret
*}
end;

//00447F8C
procedure sub_00447F8C;
begin
{*
 00447F8C    ret
*}
end;

//00447F90
procedure sub_00447F90;
begin
{*
 00447F90    ret
*}
end;

//00447F94
procedure sub_00447F94;
begin
{*
 00447F94    ret
*}
end;

//00447F98
procedure sub_00447F98;
begin
{*
 00447F98    ret
*}
end;

//00447F9C
procedure sub_00447F9C;
begin
{*
 00447F9C    ret
*}
end;

//00447FA0
constructor TCustomAction.Create(AOwner:TComponent);
begin
{*
 00447FA0    push        ebx
 00447FA1    push        esi
 00447FA2    test        dl,dl
>00447FA4    je          00447FAE
 00447FA6    add         esp,0FFFFFFF0
 00447FA9    call        @ClassCreate
 00447FAE    mov         ebx,edx
 00447FB0    mov         esi,eax
 00447FB2    xor         edx,edx
 00447FB4    mov         eax,esi
 00447FB6    call        TBasicAction.Create
 00447FBB    mov         byte ptr [esi+6A],1
 00447FBF    mov         dword ptr [esi+80],0FFFFFFFF
 00447FC9    mov         byte ptr [esi+86],1
 00447FD0    xor         eax,eax
 00447FD2    mov         dword ptr [esi+90],eax
 00447FD8    mov         eax,esi
 00447FDA    test        bl,bl
>00447FDC    je          00447FED
 00447FDE    call        @AfterConstruction
 00447FE3    pop         dword ptr fs:[0]
 00447FEA    add         esp,0C
 00447FED    mov         eax,esi
 00447FEF    pop         esi
 00447FF0    pop         ebx
 00447FF1    ret
*}
end;

//00447FF4
destructor TCustomAction.Destroy;
begin
{*
 00447FF4    push        ebx
 00447FF5    push        esi
 00447FF6    call        @BeforeDestruction
 00447FFB    mov         ebx,edx
 00447FFD    mov         esi,eax
 00447FFF    mov         eax,dword ptr [esi+98]
 00448005    call        TObject.Free
 0044800A    mov         eax,dword ptr [esi+9C]
 00448010    call        TObject.Free
 00448015    cmp         dword ptr [esi+90],0
>0044801C    je          00448029
 0044801E    lea         eax,[esi+90]
 00448024    call        FreeAndNil
 00448029    mov         edx,ebx
 0044802B    and         dl,0FC
 0044802E    mov         eax,esi
 00448030    call        TContainedAction.Destroy
 00448035    test        bl,bl
>00448037    jle         00448040
 00448039    mov         eax,esi
 0044803B    call        @ClassDestroy
 00448040    pop         esi
 00448041    pop         ebx
 00448042    ret
*}
end;

//00448044
procedure TCustomAction.AssignTo(Dest:TPersistent);
begin
{*
 00448044    push        ebx
 00448045    push        esi
 00448046    push        edi
 00448047    mov         esi,edx
 00448049    mov         ebx,eax
 0044804B    mov         eax,esi
 0044804D    mov         edx,dword ptr ds:[44776C];TCustomAction
 00448053    call        @IsClass
 00448058    test        al,al
>0044805A    je          004480E3
 00448060    mov         edx,dword ptr [ebx+64]
 00448063    mov         edi,esi
 00448065    mov         eax,edi
 00448067    call        TCustomAction.SetCaption
 0044806C    mov         dl,byte ptr [ebx+69]
 0044806F    mov         eax,edi
 00448071    call        TCustomAction.SetChecked
 00448076    mov         dl,byte ptr [ebx+6A]
 00448079    mov         eax,edi
 0044807B    call        TCustomAction.SetEnabled
 00448080    mov         edx,dword ptr [ebx+74]
 00448083    mov         eax,edi
 00448085    mov         ecx,dword ptr [eax]
 00448087    call        dword ptr [ecx+48]
 0044808A    mov         edx,dword ptr [ebx+7C]
 0044808D    mov         eax,edi
 0044808F    call        TCustomAction.SetHint
 00448094    mov         edx,dword ptr [ebx+80]
 0044809A    mov         eax,edi
 0044809C    call        TCustomAction.SetImageIndex
 004480A1    mov         dx,word ptr [ebx+84]
 004480A8    mov         eax,edi
 004480AA    call        TCustomAction.SetShortCut
 004480AF    mov         dl,byte ptr [ebx+86]
 004480B5    mov         eax,edi
 004480B7    call        TCustomAction.SetVisible
 004480BC    push        dword ptr [ebx+44]
 004480BF    push        dword ptr [ebx+40]
 004480C2    mov         eax,edi
 004480C4    mov         edx,dword ptr [eax]
 004480C6    call        dword ptr [edx+34]
 004480C9    mov         eax,dword ptr [ebx+48]
 004480CC    mov         dword ptr [edi+48],eax
 004480CF    mov         eax,dword ptr [ebx+4C]
 004480D2    mov         dword ptr [edi+4C],eax
 004480D5    mov         eax,dword ptr [ebx+38]
 004480D8    mov         dword ptr [edi+38],eax
 004480DB    mov         eax,dword ptr [ebx+3C]
 004480DE    mov         dword ptr [edi+3C],eax
>004480E1    jmp         004480EC
 004480E3    mov         edx,esi
 004480E5    mov         eax,ebx
 004480E7    call        TPersistent.AssignTo
 004480EC    pop         edi
 004480ED    pop         esi
 004480EE    pop         ebx
 004480EF    ret
*}
end;

//004480F0
procedure TCustomAction.SetCaption(const Value:AnsiString);
begin
{*
 004480F0    push        ebx
 004480F1    push        esi
 004480F2    push        edi
 004480F3    push        ecx
 004480F4    mov         dword ptr [esp],edx
 004480F7    mov         ebx,eax
 004480F9    mov         eax,dword ptr [esp]
 004480FC    mov         edx,dword ptr [ebx+64]
 004480FF    call        @LStrCmp
>00448104    je          0044814A
 00448106    mov         eax,dword ptr [ebx+50]
 00448109    mov         esi,dword ptr [eax+8]
 0044810C    dec         esi
 0044810D    test        esi,esi
>0044810F    jl          00448138
 00448111    inc         esi
 00448112    xor         edi,edi
 00448114    mov         eax,dword ptr [ebx+50]
 00448117    mov         eax,dword ptr [eax+4]
 0044811A    mov         eax,dword ptr [eax+edi*4]
 0044811D    mov         edx,dword ptr ds:[447874];TActionLink
 00448123    call        @AsClass
 00448128    test        eax,eax
>0044812A    je          00448134
 0044812C    mov         edx,dword ptr [esp]
 0044812F    mov         ecx,dword ptr [eax]
 00448131    call        dword ptr [ecx+4C]
 00448134    inc         edi
 00448135    dec         esi
>00448136    jne         00448114
 00448138    lea         eax,[ebx+64]
 0044813B    mov         edx,dword ptr [esp]
 0044813E    call        @LStrAsg
 00448143    mov         eax,ebx
 00448145    mov         edx,dword ptr [eax]
 00448147    call        dword ptr [edx+30]
 0044814A    pop         edx
 0044814B    pop         edi
 0044814C    pop         esi
 0044814D    pop         ebx
 0044814E    ret
*}
end;

//00448150
procedure TCustomAction.SetChecked(Value:Boolean);
begin
{*
 00448150    push        ebp
 00448151    mov         ebp,esp
 00448153    push        ecx
 00448154    push        ebx
 00448155    push        esi
 00448156    push        edi
 00448157    mov         ebx,edx
 00448159    mov         dword ptr [ebp-4],eax
 0044815C    mov         eax,dword ptr [ebp-4]
 0044815F    cmp         byte ptr [eax+68],0
>00448163    jne         0044824F
 00448169    mov         eax,dword ptr [ebp-4]
 0044816C    mov         byte ptr [eax+68],1
 00448170    xor         edx,edx
 00448172    push        ebp
 00448173    push        448248
 00448178    push        dword ptr fs:[edx]
 0044817B    mov         dword ptr fs:[edx],esp
 0044817E    mov         eax,dword ptr [ebp-4]
 00448181    cmp         bl,byte ptr [eax+69]
>00448184    je          00448233
 0044818A    mov         eax,dword ptr [ebp-4]
 0044818D    mov         eax,dword ptr [eax+50]
 00448190    mov         edi,dword ptr [eax+8]
 00448193    dec         edi
 00448194    test        edi,edi
>00448196    jl          004481C1
 00448198    inc         edi
 00448199    xor         esi,esi
 0044819B    mov         eax,dword ptr [ebp-4]
 0044819E    mov         eax,dword ptr [eax+50]
 004481A1    mov         eax,dword ptr [eax+4]
 004481A4    mov         eax,dword ptr [eax+esi*4]
 004481A7    mov         edx,dword ptr ds:[447874];TActionLink
 004481AD    call        @AsClass
 004481B2    test        eax,eax
>004481B4    je          004481BD
 004481B6    mov         edx,ebx
 004481B8    mov         ecx,dword ptr [eax]
 004481BA    call        dword ptr [ecx+50]
 004481BD    inc         esi
 004481BE    dec         edi
>004481BF    jne         0044819B
 004481C1    mov         eax,dword ptr [ebp-4]
 004481C4    mov         byte ptr [eax+69],bl
 004481C7    mov         eax,dword ptr [ebp-4]
 004481CA    cmp         dword ptr [eax+6C],0
>004481CE    jle         0044822B
 004481D0    mov         eax,dword ptr [ebp-4]
 004481D3    cmp         byte ptr [eax+69],0
>004481D7    je          0044822B
 004481D9    mov         eax,dword ptr [ebp-4]
 004481DC    mov         eax,dword ptr [eax+5C]
 004481DF    call        TCustomActionList.GetActionCount
 004481E4    mov         edi,eax
 004481E6    dec         edi
 004481E7    test        edi,edi
>004481E9    jl          0044822B
 004481EB    inc         edi
 004481EC    xor         esi,esi
 004481EE    mov         eax,dword ptr [ebp-4]
 004481F1    mov         eax,dword ptr [eax+5C]
 004481F4    mov         edx,esi
 004481F6    call        TCustomActionList.GetAction
 004481FB    mov         ebx,eax
 004481FD    cmp         ebx,dword ptr [ebp-4]
>00448200    je          00448227
 00448202    mov         eax,ebx
 00448204    mov         edx,dword ptr ds:[44776C];TCustomAction
 0044820A    call        @IsClass
 0044820F    test        al,al
>00448211    je          00448227
 00448213    mov         eax,dword ptr [ebx+6C]
 00448216    mov         edx,dword ptr [ebp-4]
 00448219    cmp         eax,dword ptr [edx+6C]
>0044821C    jne         00448227
 0044821E    xor         edx,edx
 00448220    mov         eax,ebx
 00448222    call        TCustomAction.SetChecked
 00448227    inc         esi
 00448228    dec         edi
>00448229    jne         004481EE
 0044822B    mov         eax,dword ptr [ebp-4]
 0044822E    mov         edx,dword ptr [eax]
 00448230    call        dword ptr [edx+30]
 00448233    xor         eax,eax
 00448235    pop         edx
 00448236    pop         ecx
 00448237    pop         ecx
 00448238    mov         dword ptr fs:[eax],edx
 0044823B    push        44824F
 00448240    mov         eax,dword ptr [ebp-4]
 00448243    mov         byte ptr [eax+68],0
 00448247    ret
>00448248    jmp         @HandleFinally
>0044824D    jmp         00448240
 0044824F    pop         edi
 00448250    pop         esi
 00448251    pop         ebx
 00448252    pop         ecx
 00448253    pop         ebp
 00448254    ret
*}
end;

//00448258
procedure TCustomAction.SetEnabled(Value:Boolean);
begin
{*
 00448258    push        ebx
 00448259    push        esi
 0044825A    push        edi
 0044825B    push        ecx
 0044825C    mov         byte ptr [esp],dl
 0044825F    mov         ebx,eax
 00448261    mov         al,byte ptr [esp]
 00448264    cmp         al,byte ptr [ebx+6A]
>00448267    je          004482C8
 00448269    mov         eax,dword ptr [ebx+5C]
 0044826C    test        eax,eax
>0044826E    je          00448289
 00448270    mov         dl,byte ptr [eax+58]
 00448273    cmp         dl,1
>00448276    jne         00448280
 00448278    mov         al,byte ptr [esp]
 0044827B    mov         byte ptr [ebx+6A],al
>0044827E    jmp         004482C8
 00448280    cmp         dl,2
>00448283    jne         00448289
 00448285    mov         byte ptr [esp],1
 00448289    mov         eax,dword ptr [ebx+50]
 0044828C    mov         esi,dword ptr [eax+8]
 0044828F    dec         esi
 00448290    test        esi,esi
>00448292    jl          004482BB
 00448294    inc         esi
 00448295    xor         edi,edi
 00448297    mov         eax,dword ptr [ebx+50]
 0044829A    mov         eax,dword ptr [eax+4]
 0044829D    mov         eax,dword ptr [eax+edi*4]
 004482A0    mov         edx,dword ptr ds:[447874];TActionLink
 004482A6    call        @AsClass
 004482AB    test        eax,eax
>004482AD    je          004482B7
 004482AF    mov         dl,byte ptr [esp]
 004482B2    mov         ecx,dword ptr [eax]
 004482B4    call        dword ptr [ecx+54]
 004482B7    inc         edi
 004482B8    dec         esi
>004482B9    jne         00448297
 004482BB    mov         al,byte ptr [esp]
 004482BE    mov         byte ptr [ebx+6A],al
 004482C1    mov         eax,ebx
 004482C3    mov         edx,dword ptr [eax]
 004482C5    call        dword ptr [edx+30]
 004482C8    pop         edx
 004482C9    pop         edi
 004482CA    pop         esi
 004482CB    pop         ebx
 004482CC    ret
*}
end;

//004482D0
procedure TCustomAction.SetHelpKeyword(const Value:AnsiString);
begin
{*
 004482D0    push        ebx
 004482D1    push        esi
 004482D2    push        edi
 004482D3    push        ebp
 004482D4    mov         ebp,edx
 004482D6    mov         ebx,eax
 004482D8    mov         eax,ebp
 004482DA    mov         edx,dword ptr [ebx+78]
 004482DD    call        @LStrCmp
>004482E2    je          00448331
 004482E4    mov         eax,dword ptr [ebx+50]
 004482E7    mov         edi,dword ptr [eax+8]
 004482EA    dec         edi
 004482EB    test        edi,edi
>004482ED    jl          00448320
 004482EF    inc         edi
 004482F0    xor         esi,esi
 004482F2    mov         edx,esi
 004482F4    mov         eax,dword ptr [ebx+50]
 004482F7    call        TList.Get
 004482FC    mov         edx,dword ptr ds:[447874];TActionLink
 00448302    call        @IsClass
 00448307    test        al,al
>00448309    je          0044831C
 0044830B    mov         edx,esi
 0044830D    mov         eax,dword ptr [ebx+50]
 00448310    call        TList.Get
 00448315    mov         edx,ebp
 00448317    mov         ecx,dword ptr [eax]
 00448319    call        dword ptr [ecx+60]
 0044831C    inc         esi
 0044831D    dec         edi
>0044831E    jne         004482F2
 00448320    lea         eax,[ebx+78]
 00448323    mov         edx,ebp
 00448325    call        @LStrAsg
 0044832A    mov         eax,ebx
 0044832C    mov         edx,dword ptr [eax]
 0044832E    call        dword ptr [edx+30]
 00448331    pop         ebp
 00448332    pop         edi
 00448333    pop         esi
 00448334    pop         ebx
 00448335    ret
*}
end;

//00448338
procedure TCustomAction.SetHelpContext(Value:THelpContext);
begin
{*
 00448338    push        ebx
 00448339    push        esi
 0044833A    push        edi
 0044833B    push        ecx
 0044833C    mov         dword ptr [esp],edx
 0044833F    mov         ebx,eax
 00448341    mov         eax,dword ptr [esp]
 00448344    cmp         eax,dword ptr [ebx+74]
>00448347    je          00448388
 00448349    mov         eax,dword ptr [ebx+50]
 0044834C    mov         esi,dword ptr [eax+8]
 0044834F    dec         esi
 00448350    test        esi,esi
>00448352    jl          0044837B
 00448354    inc         esi
 00448355    xor         edi,edi
 00448357    mov         eax,dword ptr [ebx+50]
 0044835A    mov         eax,dword ptr [eax+4]
 0044835D    mov         eax,dword ptr [eax+edi*4]
 00448360    mov         edx,dword ptr ds:[447874];TActionLink
 00448366    call        @AsClass
 0044836B    test        eax,eax
>0044836D    je          00448377
 0044836F    mov         edx,dword ptr [esp]
 00448372    mov         ecx,dword ptr [eax]
 00448374    call        dword ptr [ecx+5C]
 00448377    inc         edi
 00448378    dec         esi
>00448379    jne         00448357
 0044837B    mov         eax,dword ptr [esp]
 0044837E    mov         dword ptr [ebx+74],eax
 00448381    mov         eax,ebx
 00448383    mov         edx,dword ptr [eax]
 00448385    call        dword ptr [edx+30]
 00448388    pop         edx
 00448389    pop         edi
 0044838A    pop         esi
 0044838B    pop         ebx
 0044838C    ret
*}
end;

//00448390
procedure TCustomAction.SetHint(const Value:AnsiString);
begin
{*
 00448390    push        ebx
 00448391    push        esi
 00448392    push        edi
 00448393    push        ecx
 00448394    mov         dword ptr [esp],edx
 00448397    mov         ebx,eax
 00448399    mov         eax,dword ptr [esp]
 0044839C    mov         edx,dword ptr [ebx+7C]
 0044839F    call        @LStrCmp
>004483A4    je          004483EA
 004483A6    mov         eax,dword ptr [ebx+50]
 004483A9    mov         esi,dword ptr [eax+8]
 004483AC    dec         esi
 004483AD    test        esi,esi
>004483AF    jl          004483D8
 004483B1    inc         esi
 004483B2    xor         edi,edi
 004483B4    mov         eax,dword ptr [ebx+50]
 004483B7    mov         eax,dword ptr [eax+4]
 004483BA    mov         eax,dword ptr [eax+edi*4]
 004483BD    mov         edx,dword ptr ds:[447874];TActionLink
 004483C3    call        @AsClass
 004483C8    test        eax,eax
>004483CA    je          004483D4
 004483CC    mov         edx,dword ptr [esp]
 004483CF    mov         ecx,dword ptr [eax]
 004483D1    call        dword ptr [ecx+68]
 004483D4    inc         edi
 004483D5    dec         esi
>004483D6    jne         004483B4
 004483D8    lea         eax,[ebx+7C]
 004483DB    mov         edx,dword ptr [esp]
 004483DE    call        @LStrAsg
 004483E3    mov         eax,ebx
 004483E5    mov         edx,dword ptr [eax]
 004483E7    call        dword ptr [edx+30]
 004483EA    pop         edx
 004483EB    pop         edi
 004483EC    pop         esi
 004483ED    pop         ebx
 004483EE    ret
*}
end;

//004483F0
procedure TCustomAction.SetImageIndex(Value:TImageIndex);
begin
{*
 004483F0    push        ebx
 004483F1    push        esi
 004483F2    push        edi
 004483F3    push        ecx
 004483F4    mov         dword ptr [esp],edx
 004483F7    mov         ebx,eax
 004483F9    mov         eax,dword ptr [esp]
 004483FC    cmp         eax,dword ptr [ebx+80]
>00448402    je          00448446
 00448404    mov         eax,dword ptr [ebx+50]
 00448407    mov         esi,dword ptr [eax+8]
 0044840A    dec         esi
 0044840B    test        esi,esi
>0044840D    jl          00448436
 0044840F    inc         esi
 00448410    xor         edi,edi
 00448412    mov         eax,dword ptr [ebx+50]
 00448415    mov         eax,dword ptr [eax+4]
 00448418    mov         eax,dword ptr [eax+edi*4]
 0044841B    mov         edx,dword ptr ds:[447874];TActionLink
 00448421    call        @AsClass
 00448426    test        eax,eax
>00448428    je          00448432
 0044842A    mov         edx,dword ptr [esp]
 0044842D    mov         ecx,dword ptr [eax]
 0044842F    call        dword ptr [ecx+6C]
 00448432    inc         edi
 00448433    dec         esi
>00448434    jne         00448412
 00448436    mov         eax,dword ptr [esp]
 00448439    mov         dword ptr [ebx+80],eax
 0044843F    mov         eax,ebx
 00448441    mov         edx,dword ptr [eax]
 00448443    call        dword ptr [edx+30]
 00448446    pop         edx
 00448447    pop         edi
 00448448    pop         esi
 00448449    pop         ebx
 0044844A    ret
*}
end;

//0044844C
procedure TCustomAction.SetShortCut(Value:TShortCut);
begin
{*
 0044844C    push        ebx
 0044844D    push        esi
 0044844E    push        edi
 0044844F    push        ecx
 00448450    mov         word ptr [esp],dx
 00448454    mov         ebx,eax
 00448456    mov         ax,word ptr [esp]
 0044845A    cmp         ax,word ptr [ebx+84]
>00448461    je          004484A8
 00448463    mov         eax,dword ptr [ebx+50]
 00448466    mov         esi,dword ptr [eax+8]
 00448469    dec         esi
 0044846A    test        esi,esi
>0044846C    jl          00448496
 0044846E    inc         esi
 0044846F    xor         edi,edi
 00448471    mov         eax,dword ptr [ebx+50]
 00448474    mov         eax,dword ptr [eax+4]
 00448477    mov         eax,dword ptr [eax+edi*4]
 0044847A    mov         edx,dword ptr ds:[447874];TActionLink
 00448480    call        @AsClass
 00448485    test        eax,eax
>00448487    je          00448492
 00448489    mov         dx,word ptr [esp]
 0044848D    mov         ecx,dword ptr [eax]
 0044848F    call        dword ptr [ecx+70]
 00448492    inc         edi
 00448493    dec         esi
>00448494    jne         00448471
 00448496    mov         ax,word ptr [esp]
 0044849A    mov         word ptr [ebx+84],ax
 004484A1    mov         eax,ebx
 004484A3    mov         edx,dword ptr [eax]
 004484A5    call        dword ptr [edx+30]
 004484A8    pop         edx
 004484A9    pop         edi
 004484AA    pop         esi
 004484AB    pop         ebx
 004484AC    ret
*}
end;

//004484B0
procedure TCustomAction.SetVisible(Value:Boolean);
begin
{*
 004484B0    push        ebx
 004484B1    push        esi
 004484B2    push        edi
 004484B3    push        ebp
 004484B4    mov         ebx,edx
 004484B6    mov         ebp,eax
 004484B8    cmp         bl,byte ptr [ebp+86]
>004484BE    je          00448508
 004484C0    mov         eax,dword ptr [ebp+50]
 004484C3    mov         edi,dword ptr [eax+8]
 004484C6    dec         edi
 004484C7    test        edi,edi
>004484C9    jl          004484FB
 004484CB    inc         edi
 004484CC    xor         esi,esi
 004484CE    mov         eax,dword ptr [ebp+50]
 004484D1    mov         eax,dword ptr [eax+4]
 004484D4    mov         eax,dword ptr [eax+esi*4]
 004484D7    mov         edx,dword ptr ds:[447874];TActionLink
 004484DD    call        @AsClass
 004484E2    test        eax,eax
>004484E4    je          004484F7
 004484E6    mov         edx,esi
 004484E8    mov         eax,dword ptr [ebp+50]
 004484EB    call        TList.Get
 004484F0    mov         edx,ebx
 004484F2    mov         ecx,dword ptr [eax]
 004484F4    call        dword ptr [ecx+74]
 004484F7    inc         esi
 004484F8    dec         edi
>004484F9    jne         004484CE
 004484FB    mov         byte ptr [ebp+86],bl
 00448501    mov         eax,ebp
 00448503    mov         edx,dword ptr [eax]
 00448505    call        dword ptr [edx+30]
 00448508    pop         ebp
 00448509    pop         edi
 0044850A    pop         esi
 0044850B    pop         ebx
 0044850C    ret
*}
end;

//00448510
procedure TCustomAction.SetName(const Value:TComponentName);
begin
{*
 00448510    push        ebx
 00448511    push        esi
 00448512    push        edi
 00448513    mov         edi,edx
 00448515    mov         esi,eax
 00448517    mov         eax,dword ptr [esi+8]
 0044851A    mov         edx,dword ptr [esi+64]
 0044851D    call        @LStrCmp
>00448522    jne         00448531
 00448524    mov         ebx,dword ptr [esi+4]
 00448527    test        ebx,ebx
>00448529    je          00448535
 0044852B    test        byte ptr [ebx+1C],1
>0044852F    je          00448535
 00448531    xor         eax,eax
>00448533    jmp         00448537
 00448535    mov         al,1
 00448537    mov         ebx,eax
 00448539    mov         edx,edi
 0044853B    mov         eax,esi
 0044853D    call        TComponent.SetName
 00448542    test        bl,bl
>00448544    je          00448558
 00448546    mov         eax,dword ptr [esi+50]
 00448549    cmp         dword ptr [eax+8],0
>0044854D    jne         00448558
 0044854F    mov         edx,edi
 00448551    mov         eax,esi
 00448553    call        TCustomAction.SetCaption
 00448558    pop         edi
 00448559    pop         esi
 0044855A    pop         ebx
 0044855B    ret
*}
end;

//0044855C
procedure TCustomAction.DoHint(var HintStr:AnsiString);
begin
{*
 0044855C    push        ebx
 0044855D    push        ecx
 0044855E    mov         byte ptr [esp],1
 00448562    cmp         word ptr [eax+8A],0
>0044856A    je          0044857C
 0044856C    mov         ecx,esp
 0044856E    mov         ebx,eax
 00448570    mov         eax,dword ptr [ebx+8C]
 00448576    call        dword ptr [ebx+88]
 0044857C    mov         al,byte ptr [esp]
 0044857F    pop         edx
 00448580    pop         ebx
 00448581    ret
*}
end;

//00448584
procedure TCustomAction.Execute;
begin
{*
 00448584    push        ebx
 00448585    mov         ebx,eax
 00448587    xor         eax,eax
 00448589    mov         edx,dword ptr [ebx+5C]
 0044858C    test        edx,edx
>0044858E    je          00448596
 00448590    cmp         byte ptr [edx+58],0
>00448594    jne         004485E2
 00448596    mov         eax,ebx
 00448598    mov         edx,dword ptr [eax]
 0044859A    call        dword ptr [edx+44]
 0044859D    cmp         byte ptr [ebx+6A],0
>004485A1    je          004485CB
 004485A3    cmp         byte ptr [ebx+95],0
>004485AA    je          004485CB
 004485AC    cmp         byte ptr [ebx+69],0
>004485B0    je          004485BE
 004485B2    cmp         byte ptr [ebx+69],0
>004485B6    je          004485CB
 004485B8    cmp         dword ptr [ebx+6C],0
>004485BC    jne         004485CB
 004485BE    mov         dl,byte ptr [ebx+69]
 004485C1    xor         dl,1
 004485C4    mov         eax,ebx
 004485C6    call        TCustomAction.SetChecked
 004485CB    cmp         byte ptr [ebx+6A],0
>004485CF    je          004485DC
 004485D1    mov         eax,ebx
 004485D3    call        TContainedAction.Execute
 004485D8    test        al,al
>004485DA    jne         004485E0
 004485DC    xor         eax,eax
>004485DE    jmp         004485E2
 004485E0    mov         al,1
 004485E2    pop         ebx
 004485E3    ret
*}
end;

//004485E4
function TCustomAction.GetSecondaryShortCuts:TShortCutList;
begin
{*
 004485E4    push        ebx
 004485E5    mov         ebx,eax
 004485E7    cmp         dword ptr [ebx+90],0
>004485EE    jne         00448602
 004485F0    mov         dl,1
 004485F2    mov         eax,[00447650];TShortCutList
 004485F7    call        TObject.Create
 004485FC    mov         dword ptr [ebx+90],eax
 00448602    mov         eax,dword ptr [ebx+90]
 00448608    pop         ebx
 00448609    ret
*}
end;

//0044860C
function TCustomAction.HandleShortCut:Boolean;
begin
{*
 0044860C    push        esi
 0044860D    mov         si,0FFEF
 00448611    call        @CallDynaInst
 00448616    pop         esi
 00448617    ret
*}
end;

//00448618
function TShortCutList.Add(const S:AnsiString):Integer;
begin
{*
 00448618    push        ebx
 00448619    push        esi
 0044861A    push        edi
 0044861B    mov         esi,edx
 0044861D    mov         ebx,eax
 0044861F    mov         edx,esi
 00448621    mov         eax,ebx
 00448623    call        TStringList.Add
 00448628    mov         edi,eax
 0044862A    mov         eax,esi
 0044862C    call        TextToShortCut
 00448631    movzx       ecx,ax
 00448634    mov         edx,edi
 00448636    mov         eax,ebx
 00448638    mov         ebx,dword ptr [eax]
 0044863A    call        dword ptr [ebx+24]
 0044863D    mov         eax,edi
 0044863F    pop         edi
 00448640    pop         esi
 00448641    pop         ebx
 00448642    ret
*}
end;

//00448644
function TShortCutList.IndexOfShortCut(const Shortcut:TShortCut):Integer;
begin
{*
 00448644    push        ebx
 00448645    push        esi
 00448646    push        edi
 00448647    push        ebp
 00448648    push        ecx
 00448649    mov         ebp,edx
 0044864B    mov         edi,eax
 0044864D    mov         dword ptr [esp],0FFFFFFFF
 00448654    mov         eax,edi
 00448656    mov         edx,dword ptr [eax]
 00448658    call        dword ptr [edx+14]
 0044865B    mov         esi,eax
 0044865D    dec         esi
 0044865E    test        esi,esi
>00448660    jl          0044867C
 00448662    inc         esi
 00448663    xor         ebx,ebx
 00448665    mov         edx,ebx
 00448667    mov         eax,edi
 00448669    mov         ecx,dword ptr [eax]
 0044866B    call        dword ptr [ecx+18]
 0044866E    cmp         bp,ax
>00448671    jne         00448678
 00448673    mov         dword ptr [esp],ebx
>00448676    jmp         0044867C
 00448678    inc         ebx
 00448679    dec         esi
>0044867A    jne         00448665
 0044867C    mov         eax,dword ptr [esp]
 0044867F    pop         edx
 00448680    pop         ebp
 00448681    pop         edi
 00448682    pop         esi
 00448683    pop         ebx
 00448684    ret
*}
end;

Initialization
//004486B8
{*
 004486B8    sub         dword ptr ds:[5E0C8C],1
>004486BF    jae         004486E1
 004486C1    mov         edx,dword ptr ds:[437BA4];TControl
 004486C7    mov         eax,[00447574];TCustomActionList
 004486CC    call        GroupDescendentsWith
 004486D1    mov         edx,dword ptr ds:[437BA4];TControl
 004486D7    mov         eax,[00447450];TContainedAction
 004486DC    call        GroupDescendentsWith
 004486E1    ret
*}
Finalization
end.