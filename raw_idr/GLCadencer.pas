//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLCadencer;

interface

uses
  SysUtils, Classes, GLScene;

type
  TGLCadencerMode = (cmManual, cmASAP, cmApplicationIdle);
  TGLCadencerTimeReference = (cmRTC, cmPerformanceCounter, cmExternal);
  TGLCadencer = class(TComponent)
  public
    f30:dword;//f30
    Scene:TGLScene;//f34
    TimeMultiplier:Double;//f38
    f3C:dword;//f3C
    f48:Double;//f48
    f4C:dword;//f4C
    f50:Double;//f50
    f54:dword;//f54
    Enabled:Boolean;//f58
    SleepLength:Integer;//f5C
    Mode:TGLCadencerMode;//f60
    TimeReference:TGLCadencerTimeReference;//f61
    f68:dword;//f68
    f6C:dword;//f6C
    f70:Double;//f70
    f74:dword;//f74
    MaxDeltaTime:Double;//f78
    MinDeltaTime:Double;//f80
    FixedDeltaTime:Double;//f88
    OnProgress:TGLProgressEvent;//f90
    f98:dword;//f98
    destructor Destroy; virtual;//0048294C
    procedure Loaded; virtual;//vC//00482A34
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004829FC
    constructor Create(AOwner:TComponent); virtual;//v2C//004828D4
    procedure SetEnabled(Value:Boolean);//00482A88
    procedure SetScene(Value:TGLScene);//00482AC8
    //procedure SetTimeMultiplier(Value:Double; ?:?; ?:?);//00482AFC
    function IsStoredTimeMultiplier(Value:Double):Boolean;//00482B98
    procedure SetMode(Value:TGLCadencerMode);//00482BB0
    procedure SetTimeReference(Value:TGLCadencerTimeReference);//00482BD8
  end;
  TASAPHandler = class(TObject)
  public
    f4:HWND;//f4
    constructor Create;//00482624
  end;
    procedure sub_0048255C(?:TGLCadencer);//0048255C
    procedure sub_004825D8(?:TGLCadencer);//004825D8
    constructor Create(AOwner:TComponent);//004828D4
    destructor Destroy;//0048294C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004829FC
    procedure Loaded;//00482A34
    //procedure sub_00482A48(?:?; ?:?; ?:?);//00482A48
    procedure sub_00482A58(?:TGLCadencer);//00482A58
    //procedure sub_00482BDC(?:?);//00482BDC
    //function sub_00482E90(?:TGLCadencer):?;//00482E90
    //function sub_00482F60(?:?):?;//00482F60

implementation

//0048255C
procedure sub_0048255C(?:TGLCadencer);
begin
{*
 0048255C    push        ebx
 0048255D    mov         ebx,eax
 0048255F    mov         al,byte ptr [ebx+60]
 00482562    cmp         al,1
>00482564    jne         004825B8
 00482566    cmp         dword ptr ds:[5E1524],0;gvar_005E1524:TList
>0048256D    jne         00482580
 0048256F    mov         dl,1
 00482571    mov         eax,[00417CEC];TList
 00482576    call        TObject.Create;TList.Create
 0048257B    mov         [005E1524],eax;gvar_005E1524:TList
 00482580    mov         edx,ebx
 00482582    mov         eax,[005E1524];gvar_005E1524:TList
 00482587    call        TList.IndexOf
 0048258C    test        eax,eax
>0048258E    jge         004825D3
 00482590    mov         edx,ebx
 00482592    mov         eax,[005E1524];gvar_005E1524:TList
 00482597    call        TList.Add
 0048259C    cmp         dword ptr ds:[5E1528],0;gvar_005E1528:TASAPHandler
>004825A3    jne         004825D3
 004825A5    mov         dl,1
 004825A7    mov         eax,[00482500];TASAPHandler
 004825AC    call        TASAPHandler.Create;TASAPHandler.Create
 004825B1    mov         [005E1528],eax;gvar_005E1528:TASAPHandler
 004825B6    pop         ebx
 004825B7    ret
 004825B8    cmp         al,2
>004825BA    jne         004825D3
 004825BC    mov         eax,[005AE584];^Application:TApplication
 004825C1    mov         eax,dword ptr [eax]
 004825C3    mov         dword ptr [eax+104],ebx;TApplication.?f104:dword
 004825C9    mov         dword ptr [eax+100],482A48;TApplication.FOnIdle:TIdleEvent sub_00482A48
 004825D3    pop         ebx
 004825D4    ret
*}
end;

//004825D8
procedure sub_004825D8(?:TGLCadencer);
begin
{*
 004825D8    mov         dl,byte ptr [eax+60]
 004825DB    cmp         dl,1
>004825DE    jne         00482608
 004825E0    cmp         dword ptr ds:[5E1524],0;gvar_005E1524:TList
>004825E7    je          00482622
 004825E9    mov         edx,eax
 004825EB    mov         eax,[005E1524];gvar_005E1524:TList
 004825F0    call        TList.IndexOf
 004825F5    test        eax,eax
>004825F7    jl          00482622
 004825F9    xor         ecx,ecx
 004825FB    mov         edx,eax
 004825FD    mov         eax,[005E1524];gvar_005E1524:TList
 00482602    call        TList.Put
 00482607    ret
 00482608    cmp         dl,2
>0048260B    jne         00482622
 0048260D    mov         eax,[005AE584];^Application:TApplication
 00482612    mov         eax,dword ptr [eax]
 00482614    xor         edx,edx
 00482616    mov         dword ptr [eax+100],edx;TApplication.FOnIdle:TIdleEvent
 0048261C    mov         dword ptr [eax+104],edx;TApplication.?f104:dword
 00482622    ret
*}
end;

//00482624
constructor TASAPHandler.Create;
begin
{*
 00482624    push        ebx
 00482625    push        esi
 00482626    push        edi
 00482627    test        dl,dl
>00482629    je          00482633
 0048262B    add         esp,0FFFFFFF0
 0048262E    call        @ClassCreate
 00482633    mov         ebx,edx
 00482635    mov         edi,eax
 00482637    xor         edx,edx
 00482639    mov         eax,edi
 0048263B    call        TObject.Create
 00482640    push        edi
 00482641    push        4826BC
 00482646    call        AllocateHWnd
 0048264B    mov         esi,eax
 0048264D    mov         dword ptr [edi+4],esi;TASAPHandler.?f4:HWND
 00482650    push        0
 00482652    push        0
 00482654    mov         eax,[005E1520];gvar_005E1520:LongWord
 00482659    push        eax
 0048265A    push        esi
 0048265B    call        user32.PostMessageA
 00482660    mov         eax,edi
 00482662    test        bl,bl
>00482664    je          00482675
 00482666    call        @AfterConstruction
 0048266B    pop         dword ptr fs:[0]
 00482672    add         esp,0C
 00482675    mov         eax,edi
 00482677    pop         edi
 00482678    pop         esi
 00482679    pop         ebx
 0048267A    ret
*}
end;

//004828D4
constructor TGLCadencer.Create(AOwner:TComponent);
begin
{*
 004828D4    push        ebx
 004828D5    push        esi
 004828D6    test        dl,dl
>004828D8    je          004828E2
 004828DA    add         esp,0FFFFFFF0
 004828DD    call        @ClassCreate
 004828E2    mov         ebx,edx
 004828E4    mov         esi,eax
 004828E6    xor         edx,edx
 004828E8    mov         eax,esi
 004828EA    call        TComponent.Create
 004828EF    mov         byte ptr [esi+61],1;TGLCadencer.TimeReference:TGLCadencerTimeReference
 004828F3    mov         eax,esi
 004828F5    call        00482E90
 004828FA    fstp        qword ptr [esi+48];TGLCadencer.?f48:Double
 004828FD    wait
 004828FE    mov         eax,dword ptr [esi+48];TGLCadencer.?f48:Double
 00482901    mov         dword ptr [esi+70],eax;TGLCadencer.?f70:Double
 00482904    mov         eax,dword ptr [esi+4C];TGLCadencer.?f4C:dword
 00482907    mov         dword ptr [esi+74],eax;TGLCadencer.?f74:dword
 0048290A    xor         eax,eax
 0048290C    mov         dword ptr [esi+38],eax;TGLCadencer.TimeMultiplier:Double
 0048290F    mov         dword ptr [esi+3C],3FF00000;TGLCadencer.?f3C:dword
 00482916    mov         dword ptr [esi+5C],0FFFFFFFF;TGLCadencer.SleepLength:Integer
 0048291D    mov         dl,1
 0048291F    mov         eax,esi
 00482921    call        TGLCadencer.SetMode
 00482926    mov         dl,1
 00482928    mov         eax,esi
 0048292A    call        TGLCadencer.SetEnabled
 0048292F    mov         eax,esi
 00482931    test        bl,bl
>00482933    je          00482944
 00482935    call        @AfterConstruction
 0048293A    pop         dword ptr fs:[0]
 00482941    add         esp,0C
 00482944    mov         eax,esi
 00482946    pop         esi
 00482947    pop         ebx
 00482948    ret
*}
end;

//0048294C
destructor TGLCadencer.Destroy;
begin
{*
 0048294C    push        ebx
 0048294D    push        esi
 0048294E    call        @BeforeDestruction
 00482953    mov         ebx,edx
 00482955    mov         esi,eax
 00482957    cmp         dword ptr [esi+98],0;TGLCadencer.?f98:dword
>0048295E    je          00482974
 00482960    mov         ecx,19C
 00482965    mov         edx,4829AC;'C:\GLScene\glscene_v_1000714\Source\GLCadencer.pas'
 0048296A    mov         eax,4829E8;'Assertion failure'
 0048296F    call        @Assert
 00482974    mov         eax,esi
 00482976    call        004825D8
 0048297B    mov         eax,dword ptr [esi+30];TGLCadencer.?f30:dword
 0048297E    call        TObject.Free
 00482983    xor         eax,eax
 00482985    mov         dword ptr [esi+30],eax;TGLCadencer.?f30:dword
 00482988    mov         edx,ebx
 0048298A    and         dl,0FC
 0048298D    mov         eax,esi
 0048298F    call        TComponent.Destroy
 00482994    test        bl,bl
>00482996    jle         0048299F
 00482998    mov         eax,esi
 0048299A    call        @ClassDestroy
 0048299F    pop         esi
 004829A0    pop         ebx
 004829A1    ret
*}
end;

//004829FC
procedure TGLCadencer.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004829FC    push        ebx
 004829FD    push        esi
 004829FE    push        edi
 004829FF    mov         ebx,ecx
 00482A01    mov         edi,edx
 00482A03    mov         esi,eax
 00482A05    cmp         bl,1
>00482A08    jne         00482A22
 00482A0A    cmp         edi,dword ptr [esi+34];TGLCadencer.Scene:TGLScene
>00482A0D    jne         00482A14
 00482A0F    xor         eax,eax
 00482A11    mov         dword ptr [esi+34],eax;TGLCadencer.Scene:TGLScene
 00482A14    mov         eax,dword ptr [esi+30];TGLCadencer.?f30:dword
 00482A17    test        eax,eax
>00482A19    je          00482A22
 00482A1B    mov         edx,edi
 00482A1D    call        TList.Remove
 00482A22    mov         ecx,ebx
 00482A24    mov         edx,edi
 00482A26    mov         eax,esi
 00482A28    call        TComponent.Notification
 00482A2D    pop         edi
 00482A2E    pop         esi
 00482A2F    pop         ebx
 00482A30    ret
*}
end;

//00482A34
procedure TGLCadencer.Loaded;
begin
{*
 00482A34    push        ebx
 00482A35    mov         ebx,eax
 00482A37    mov         eax,ebx
 00482A39    call        TComponent.Loaded
 00482A3E    mov         eax,ebx
 00482A40    call        00482A58
 00482A45    pop         ebx
 00482A46    ret
*}
end;

//00482A48
{*procedure sub_00482A48(?:?; ?:?; ?:?);
begin
 00482A48    push        ebx
 00482A49    mov         ebx,ecx
 00482A4B    call        00482BDC
 00482A50    mov         byte ptr [ebx],0
 00482A53    pop         ebx
 00482A54    ret
end;*}

//00482A58
procedure sub_00482A58(?:TGLCadencer);
begin
{*
 00482A58    test        byte ptr [eax+1C],1;TGLCadencer.FComponentState:TComponentState
>00482A5C    jne         00482A85
 00482A5E    mov         dl,byte ptr [eax+60];TGLCadencer.Mode:TGLCadencerMode
 00482A61    dec         edx
 00482A62    sub         dl,2
>00482A65    jae         00482A80
 00482A67    test        byte ptr [eax+1C],10;TGLCadencer.FComponentState:TComponentState
>00482A6B    jne         00482A80
 00482A6D    cmp         dword ptr [eax+34],0;TGLCadencer.Scene:TGLScene
>00482A71    je          00482A80
 00482A73    cmp         byte ptr [eax+58],0;TGLCadencer.Enabled:Boolean
>00482A77    je          00482A80
 00482A79    call        0048255C
>00482A7E    jmp         00482A85
 00482A80    call        004825D8
 00482A85    ret
*}
end;

//00482A88
procedure TGLCadencer.SetEnabled(Value:Boolean);
begin
{*
 00482A88    push        esi
 00482A89    mov         esi,eax
 00482A8B    cmp         dl,byte ptr [esi+58];TGLCadencer.Enabled:Boolean
>00482A8E    je          00482AC4
 00482A90    mov         eax,edx
 00482A92    mov         byte ptr [esi+58],al;TGLCadencer.Enabled:Boolean
 00482A95    test        byte ptr [esi+1C],10;TGLCadencer.FComponentState:TComponentState
>00482A99    jne         00482AC4
 00482A9B    test        al,al
>00482A9D    je          00482AB2
 00482A9F    mov         eax,esi
 00482AA1    call        00482E90
 00482AA6    fadd        qword ptr [esi+70];TGLCadencer.?f70:Double
 00482AA9    fsub        qword ptr [esi+48];TGLCadencer.?f48:Double
 00482AAC    fstp        qword ptr [esi+70];TGLCadencer.?f70:Double
 00482AAF    wait
>00482AB0    jmp         00482ABD
 00482AB2    mov         eax,esi
 00482AB4    call        00482E90
 00482AB9    fstp        qword ptr [esi+48];TGLCadencer.?f48:Double
 00482ABC    wait
 00482ABD    mov         eax,esi
 00482ABF    call        00482A58
 00482AC4    pop         esi
 00482AC5    ret
*}
end;

//00482AC8
procedure TGLCadencer.SetScene(Value:TGLScene);
begin
{*
 00482AC8    push        ebx
 00482AC9    push        esi
 00482ACA    mov         esi,edx
 00482ACC    mov         ebx,eax
 00482ACE    mov         eax,dword ptr [ebx+34];TGLCadencer.Scene:TGLScene
 00482AD1    cmp         esi,eax
>00482AD3    je          00482AF7
 00482AD5    test        eax,eax
>00482AD7    je          00482AE0
 00482AD9    mov         edx,ebx
 00482ADB    call        TComponent.RemoveFreeNotification
 00482AE0    mov         eax,esi
 00482AE2    mov         dword ptr [ebx+34],eax;TGLCadencer.Scene:TGLScene
 00482AE5    test        eax,eax
>00482AE7    je          00482AF0
 00482AE9    mov         edx,ebx
 00482AEB    call        TComponent.FreeNotification
 00482AF0    mov         eax,ebx
 00482AF2    call        00482A58
 00482AF7    pop         esi
 00482AF8    pop         ebx
 00482AF9    ret
*}
end;

//00482AFC
{*procedure TGLCadencer.SetTimeMultiplier(Value:Double; ?:?; ?:?);
begin
 00482AFC    push        ebp
 00482AFD    mov         ebp,esp
 00482AFF    add         esp,0FFFFFFF8
 00482B02    push        ebx
 00482B03    mov         ebx,eax
 00482B05    fld         qword ptr [ebp+8]
 00482B08    fcomp       qword ptr [ebx+38];TGLCadencer.TimeMultiplier:Double
 00482B0B    fnstsw      al
 00482B0D    sahf
>00482B0E    je          00482B8B
 00482B10    fld         qword ptr [ebp+8]
 00482B13    fcomp       dword ptr ds:[482B94];0:Single
 00482B19    fnstsw      al
 00482B1B    sahf
>00482B1C    jne         00482B35
 00482B1E    mov         eax,dword ptr [ebx+38];TGLCadencer.TimeMultiplier:Double
 00482B21    mov         dword ptr [ebx+50],eax;TGLCadencer.?f50:Double
 00482B24    mov         eax,dword ptr [ebx+3C];TGLCadencer.?f3C:dword
 00482B27    mov         dword ptr [ebx+54],eax;TGLCadencer.?f54:dword
 00482B2A    xor         edx,edx
 00482B2C    mov         eax,ebx
 00482B2E    call        TGLCadencer.SetEnabled
>00482B33    jmp         00482B7F
 00482B35    mov         eax,ebx
 00482B37    call        00482E90
 00482B3C    fstp        qword ptr [ebp-8]
 00482B3F    wait
 00482B40    fld         qword ptr [ebx+38];TGLCadencer.TimeMultiplier:Double
 00482B43    fcomp       dword ptr ds:[482B94];0:Single
 00482B49    fnstsw      al
 00482B4B    sahf
>00482B4C    jne         00482B6C
 00482B4E    mov         dl,1
 00482B50    mov         eax,ebx
 00482B52    call        TGLCadencer.SetEnabled
 00482B57    fld         qword ptr [ebp-8]
 00482B5A    fsub        qword ptr [ebx+70];TGLCadencer.?f70:Double
 00482B5D    fmul        qword ptr [ebx+50];TGLCadencer.?f50:Double
 00482B60    fdiv        qword ptr [ebp+8]
 00482B63    fsubr       qword ptr [ebp-8]
 00482B66    fstp        qword ptr [ebx+70];TGLCadencer.?f70:Double
 00482B69    wait
>00482B6A    jmp         00482B7F
 00482B6C    fld         qword ptr [ebp-8]
 00482B6F    fsub        qword ptr [ebx+70];TGLCadencer.?f70:Double
 00482B72    fmul        qword ptr [ebx+38];TGLCadencer.TimeMultiplier:Double
 00482B75    fdiv        qword ptr [ebp+8]
 00482B78    fsubr       qword ptr [ebp-8]
 00482B7B    fstp        qword ptr [ebx+70];TGLCadencer.?f70:Double
 00482B7E    wait
 00482B7F    mov         eax,dword ptr [ebp+8]
 00482B82    mov         dword ptr [ebx+38],eax;TGLCadencer.TimeMultiplier:Double
 00482B85    mov         eax,dword ptr [ebp+0C]
 00482B88    mov         dword ptr [ebx+3C],eax;TGLCadencer.?f3C:dword
 00482B8B    pop         ebx
 00482B8C    pop         ecx
 00482B8D    pop         ecx
 00482B8E    pop         ebp
 00482B8F    ret         8
end;*}

//00482B98
function TGLCadencer.IsStoredTimeMultiplier(Value:Double):Boolean;
begin
{*
 00482B98    mov         edx,eax
 00482B9A    fld         qword ptr [edx+38];TGLCadencer.TimeMultiplier:Double
 00482B9D    fcomp       dword ptr ds:[482BAC];1:Single
 00482BA3    fnstsw      al
 00482BA5    sahf
 00482BA6    setne       al
 00482BA9    ret
*}
end;

//00482BB0
procedure TGLCadencer.SetMode(Value:TGLCadencerMode);
begin
{*
 00482BB0    push        ebx
 00482BB1    push        esi
 00482BB2    mov         ebx,edx
 00482BB4    mov         esi,eax
 00482BB6    mov         al,byte ptr [esi+60];TGLCadencer.Mode:TGLCadencerMode
 00482BB9    cmp         bl,al
>00482BBB    je          00482BD2
 00482BBD    test        al,al
>00482BBF    je          00482BC8
 00482BC1    mov         eax,esi
 00482BC3    call        004825D8
 00482BC8    mov         byte ptr [esi+60],bl;TGLCadencer.Mode:TGLCadencerMode
 00482BCB    mov         eax,esi
 00482BCD    call        00482A58
 00482BD2    pop         esi
 00482BD3    pop         ebx
 00482BD4    ret
*}
end;

//00482BD8
procedure TGLCadencer.SetTimeReference(Value:TGLCadencerTimeReference);
begin
{*
 00482BD8    mov         byte ptr [eax+61],dl;TGLCadencer.TimeReference:TGLCadencerTimeReference
 00482BDB    ret
*}
end;

//00482BDC
{*procedure sub_00482BDC(?:?);
begin
 00482BDC    push        ebp
 00482BDD    mov         ebp,esp
 00482BDF    add         esp,0FFFFFFD0
 00482BE2    push        ebx
 00482BE3    push        esi
 00482BE4    mov         dword ptr [ebp-4],eax
 00482BE7    mov         eax,dword ptr [ebp-4]
 00482BEA    cmp         dword ptr [eax+98],0
>00482BF1    jl          00482E84
 00482BF7    mov         eax,dword ptr [ebp-4]
 00482BFA    cmp         byte ptr [eax+58],0
>00482BFE    je          00482C47
 00482C00    mov         eax,dword ptr [ebp-4]
 00482C03    mov         eax,dword ptr [eax+5C]
 00482C06    test        eax,eax
>00482C08    jl          00482C10
 00482C0A    push        eax
 00482C0B    call        KERNEL32.Sleep
 00482C10    mov         eax,dword ptr [ebp-4]
 00482C13    cmp         byte ptr [eax+60],1
>00482C17    jne         00482C47
 00482C19    mov         eax,[005AE584];^Application:TApplication
 00482C1E    mov         eax,dword ptr [eax]
 00482C20    call        TApplication.ProcessMessages
 00482C25    cmp         dword ptr ds:[5E1524],0;gvar_005E1524:TList
>00482C2C    je          00482E84
 00482C32    mov         edx,dword ptr [ebp-4]
 00482C35    mov         eax,[005E1524];gvar_005E1524:TList
 00482C3A    call        TList.IndexOf
 00482C3F    test        eax,eax
>00482C41    jl          00482E84
 00482C47    mov         eax,dword ptr [ebp-4]
 00482C4A    inc         dword ptr [eax+98]
 00482C50    xor         edx,edx
 00482C52    push        ebp
 00482C53    push        482E7D
 00482C58    push        dword ptr fs:[edx]
 00482C5B    mov         dword ptr fs:[edx],esp
 00482C5E    mov         eax,dword ptr [ebp-4]
 00482C61    mov         al,byte ptr [eax+58]
 00482C64    test        al,al
>00482C66    je          00482E66
 00482C6C    test        al,al
>00482C6E    je          00482E66
 00482C74    mov         eax,dword ptr [ebp-4]
 00482C77    call        00482F60
 00482C7C    fstp        qword ptr [ebp-18]
 00482C7F    wait
 00482C80    fld         qword ptr [ebp-18]
 00482C83    mov         eax,dword ptr [ebp-4]
 00482C86    fsub        qword ptr [eax+40]
 00482C89    fstp        qword ptr [ebp-10]
 00482C8C    wait
 00482C8D    fld         qword ptr [ebp-10]
 00482C90    mov         eax,dword ptr [ebp-4]
 00482C93    fcomp       qword ptr [eax+80]
 00482C99    fnstsw      al
 00482C9B    sahf
>00482C9C    jb          00482E66
 00482CA2    fld         qword ptr [ebp-10]
 00482CA5    mov         eax,dword ptr [ebp-4]
 00482CA8    fcomp       qword ptr [eax+88]
 00482CAE    fnstsw      al
 00482CB0    sahf
>00482CB1    jb          00482E66
 00482CB7    mov         eax,dword ptr [ebp-4]
 00482CBA    fld         qword ptr [eax+78]
 00482CBD    fcomp       dword ptr ds:[482E8C];0:Single
 00482CC3    fnstsw      al
 00482CC5    sahf
>00482CC6    jbe         00482D0E
 00482CC8    fld         qword ptr [ebp-10]
 00482CCB    mov         eax,dword ptr [ebp-4]
 00482CCE    fcomp       qword ptr [eax+78]
 00482CD1    fnstsw      al
 00482CD3    sahf
>00482CD4    jbe         00482D0E
 00482CD6    fld         qword ptr [ebp-10]
 00482CD9    mov         eax,dword ptr [ebp-4]
 00482CDC    fsub        qword ptr [eax+78]
 00482CDF    mov         eax,dword ptr [ebp-4]
 00482CE2    fdiv        qword ptr [eax+38]
 00482CE5    mov         eax,dword ptr [ebp-4]
 00482CE8    fadd        qword ptr [eax+70]
 00482CEB    mov         eax,dword ptr [ebp-4]
 00482CEE    fstp        qword ptr [eax+70]
 00482CF1    wait
 00482CF2    mov         eax,dword ptr [ebp-4]
 00482CF5    mov         edx,dword ptr [eax+78]
 00482CF8    mov         dword ptr [ebp-10],edx
 00482CFB    mov         edx,dword ptr [eax+7C]
 00482CFE    mov         dword ptr [ebp-0C],edx
 00482D01    mov         eax,dword ptr [ebp-4]
 00482D04    fld         qword ptr [eax+40]
 00482D07    fadd        qword ptr [ebp-10]
 00482D0A    fstp        qword ptr [ebp-18]
 00482D0D    wait
 00482D0E    mov         eax,dword ptr [ebp-10]
 00482D11    mov         dword ptr [ebp-20],eax
 00482D14    mov         eax,dword ptr [ebp-0C]
 00482D17    mov         dword ptr [ebp-1C],eax
 00482D1A    mov         eax,dword ptr [ebp-4]
 00482D1D    fld         qword ptr [eax+88]
 00482D23    fcomp       dword ptr ds:[482E8C];0:Single
 00482D29    fnstsw      al
 00482D2B    sahf
>00482D2C    jbe         00482E57
 00482D32    mov         eax,dword ptr [ebp-4]
 00482D35    mov         edx,dword ptr [eax+88]
 00482D3B    mov         dword ptr [ebp-10],edx
 00482D3E    mov         edx,dword ptr [eax+8C]
 00482D44    mov         dword ptr [ebp-0C],edx
>00482D47    jmp         00482E57
 00482D4C    mov         eax,dword ptr [ebp-4]
 00482D4F    fld         qword ptr [eax+40]
 00482D52    fadd        qword ptr [ebp-10]
 00482D55    mov         eax,dword ptr [ebp-4]
 00482D58    fstp        qword ptr [eax+40]
 00482D5B    wait
 00482D5C    mov         eax,dword ptr [ebp-4]
 00482D5F    cmp         dword ptr [eax+34],0
>00482D63    je          00482DC2
 00482D65    fld         qword ptr [ebp-10]
 00482D68    fcomp       dword ptr ds:[482E8C];0:Single
 00482D6E    fnstsw      al
 00482D70    sahf
>00482D71    je          00482DC2
 00482D73    mov         eax,dword ptr [ebp-4]
 00482D76    neg         dword ptr [eax+98]
 00482D7C    xor         eax,eax
 00482D7E    push        ebp
 00482D7F    push        482DBB
 00482D84    push        dword ptr fs:[eax]
 00482D87    mov         dword ptr fs:[eax],esp
 00482D8A    push        dword ptr [ebp-0C]
 00482D8D    push        dword ptr [ebp-10]
 00482D90    mov         eax,dword ptr [ebp-4]
 00482D93    push        dword ptr [eax+44]
 00482D96    push        dword ptr [eax+40]
 00482D99    mov         eax,dword ptr [ebp-4]
 00482D9C    mov         eax,dword ptr [eax+34]
 00482D9F    call        00480460
 00482DA4    xor         eax,eax
 00482DA6    pop         edx
 00482DA7    pop         ecx
 00482DA8    pop         ecx
 00482DA9    mov         dword ptr fs:[eax],edx
 00482DAC    push        482DC2
 00482DB1    mov         eax,dword ptr [ebp-4]
 00482DB4    neg         dword ptr [eax+98]
 00482DBA    ret
>00482DBB    jmp         @HandleFinally
>00482DC0    jmp         00482DB1
 00482DC2    mov         eax,dword ptr [ebp-10]
 00482DC5    mov         dword ptr [ebp-30],eax
 00482DC8    mov         eax,dword ptr [ebp-0C]
 00482DCB    mov         dword ptr [ebp-2C],eax
 00482DCE    mov         eax,dword ptr [ebp-4]
 00482DD1    mov         edx,dword ptr [eax+40]
 00482DD4    mov         dword ptr [ebp-28],edx
 00482DD7    mov         edx,dword ptr [eax+44]
 00482DDA    mov         dword ptr [ebp-24],edx
 00482DDD    mov         eax,dword ptr [ebp-4]
 00482DE0    mov         eax,dword ptr [eax+30]
 00482DE3    test        eax,eax
>00482DE5    je          00482E0B
 00482DE7    mov         ebx,dword ptr [eax+8]
 00482DEA    dec         ebx
 00482DEB    test        ebx,ebx
>00482DED    jl          00482E0B
 00482DEF    inc         ebx
 00482DF0    xor         esi,esi
 00482DF2    mov         eax,dword ptr [ebp-4]
 00482DF5    mov         eax,dword ptr [eax+30]
 00482DF8    mov         edx,esi
 00482DFA    call        TList.Get
 00482DFF    lea         edx,[ebp-30]
 00482E02    mov         ecx,dword ptr [eax]
 00482E04    call        dword ptr [ecx+30]
 00482E07    inc         esi
 00482E08    dec         ebx
>00482E09    jne         00482DF2
 00482E0B    mov         eax,dword ptr [ebp-4]
 00482E0E    cmp         word ptr [eax+92],0
>00482E16    je          00482E3F
 00482E18    mov         eax,dword ptr [ebp-4]
 00482E1B    test        byte ptr [eax+1C],10
>00482E1F    jne         00482E3F
 00482E21    push        dword ptr [ebp-0C]
 00482E24    push        dword ptr [ebp-10]
 00482E27    push        dword ptr [ebp-14]
 00482E2A    push        dword ptr [ebp-18]
 00482E2D    mov         ebx,dword ptr [ebp-4]
 00482E30    mov         edx,dword ptr [ebp-4]
 00482E33    mov         eax,dword ptr [ebx+94]
 00482E39    call        dword ptr [ebx+90]
 00482E3F    fld         qword ptr [ebp-10]
 00482E42    fcomp       dword ptr ds:[482E8C];0:Single
 00482E48    fnstsw      al
 00482E4A    sahf
>00482E4B    jbe         00482E66
 00482E4D    fld         qword ptr [ebp-20]
 00482E50    fsub        qword ptr [ebp-10]
 00482E53    fstp        qword ptr [ebp-20]
 00482E56    wait
 00482E57    fld         qword ptr [ebp-20]
 00482E5A    fcomp       qword ptr [ebp-10]
 00482E5D    fnstsw      al
 00482E5F    sahf
>00482E60    jae         00482D4C
 00482E66    xor         eax,eax
 00482E68    pop         edx
 00482E69    pop         ecx
 00482E6A    pop         ecx
 00482E6B    mov         dword ptr fs:[eax],edx
 00482E6E    push        482E84
 00482E73    mov         eax,dword ptr [ebp-4]
 00482E76    dec         dword ptr [eax+98]
 00482E7C    ret
>00482E7D    jmp         @HandleFinally
>00482E82    jmp         00482E73
 00482E84    pop         esi
 00482E85    pop         ebx
 00482E86    mov         esp,ebp
 00482E88    pop         ebp
 00482E89    ret
end;*}

//00482E90
{*function sub_00482E90(?:TGLCadencer):?;
begin
 00482E90    add         esp,0FFFFFFF0
 00482E93    mov         dl,byte ptr [eax+61];TGLCadencer.TimeReference:TGLCadencerTimeReference
 00482E96    sub         dl,1
>00482E99    jb          00482EA3
>00482E9B    je          00482EB4
 00482E9D    dec         dl
>00482E9F    je          00482ED0
>00482EA1    jmp         00482EDF
 00482EA3    call        Now
 00482EA8    fmul        dword ptr ds:[482F04];86400:Single
 00482EAE    fstp        qword ptr [esp]
 00482EB1    wait
>00482EB2    jmp         00482EFC
 00482EB4    lea         eax,[esp+8]
 00482EB8    push        eax
 00482EB9    call        KERNEL32.QueryPerformanceCounter
 00482EBE    fild        qword ptr [esp+8]
 00482EC2    fild        qword ptr ds:[5E1518];gvar_005E1518:Double
 00482EC8    fdivp       st(1),st
 00482ECA    fstp        qword ptr [esp]
 00482ECD    wait
>00482ECE    jmp         00482EFC
 00482ED0    mov         edx,dword ptr [eax+68];TGLCadencer.?f68:dword
 00482ED3    mov         dword ptr [esp],edx
 00482ED6    mov         edx,dword ptr [eax+6C];TGLCadencer.?f6C:dword
 00482ED9    mov         dword ptr [esp+4],edx
>00482EDD    jmp         00482EFC
 00482EDF    xor         eax,eax
 00482EE1    mov         dword ptr [esp],eax
 00482EE4    mov         dword ptr [esp+4],eax
 00482EE8    mov         ecx,299
 00482EED    mov         edx,482F10;'C:\GLScene\glscene_v_1000714\Source\GLCadencer.pas'
 00482EF2    mov         eax,482F4C;'Assertion failure'
 00482EF7    call        @Assert
 00482EFC    fld         qword ptr [esp]
 00482EFF    add         esp,10
 00482F02    ret
end;*}

//00482F60
{*function sub_00482F60(?:?):?;
begin
 00482F60    push        ebx
 00482F61    add         esp,0FFFFFFF8
 00482F64    mov         ebx,eax
 00482F66    mov         eax,ebx
 00482F68    call        00482E90
 00482F6D    fsub        qword ptr [ebx+70]
 00482F70    fmul        qword ptr [ebx+38]
 00482F73    fstp        qword ptr [esp]
 00482F76    wait
 00482F77    mov         eax,dword ptr [esp]
 00482F7A    mov         dword ptr [ebx+68],eax
 00482F7D    mov         eax,dword ptr [esp+4]
 00482F81    mov         dword ptr [ebx+6C],eax
 00482F84    fld         qword ptr [esp]
 00482F87    pop         ecx
 00482F88    pop         edx
 00482F89    pop         ebx
 00482F8A    ret
end;*}

Initialization
//00482FD0
{*
 00482FD0    sub         dword ptr ds:[5E1514],1
>00482FD7    jae         0048300A
 00482FD9    push        48300C;'TickGLCadencer'
 00482FDE    call        user32.RegisterWindowMessageA
 00482FE3    mov         [005E1520],eax;gvar_005E1520:LongWord
 00482FE8    push        5E1518;gvar_005E1518:Double
 00482FED    call        KERNEL32.QueryPerformanceFrequency
 00482FF2    test        eax,eax
>00482FF4    jne         0048300A
 00482FF6    mov         dword ptr ds:[5E1518],0;gvar_005E1518:Double
 00483000    mov         dword ptr ds:[5E151C],0;gvar_005E151C
 0048300A    ret
*}
Finalization
//00482F8C
{*
 00482F8C    push        ebp
 00482F8D    mov         ebp,esp
 00482F8F    xor         eax,eax
 00482F91    push        ebp
 00482F92    push        482FC7
 00482F97    push        dword ptr fs:[eax]
 00482F9A    mov         dword ptr fs:[eax],esp
 00482F9D    inc         dword ptr ds:[5E1514]
>00482FA3    jne         00482FB9
 00482FA5    mov         eax,5E1528;gvar_005E1528:TASAPHandler
 00482FAA    call        FreeAndNil
 00482FAF    mov         eax,5E1524;gvar_005E1524:TList
 00482FB4    call        FreeAndNil
 00482FB9    xor         eax,eax
 00482FBB    pop         edx
 00482FBC    pop         ecx
 00482FBD    pop         ecx
 00482FBE    mov         dword ptr fs:[eax],edx
 00482FC1    push        482FCE
 00482FC6    ret
>00482FC7    jmp         @HandleFinally
>00482FCC    jmp         00482FC6
 00482FCE    pop         ebp
 00482FCF    ret
*}
end.