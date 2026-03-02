//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLWin32Viewer;

interface

uses
  SysUtils, Classes, GLScene;

type
  TVSyncMode = (vsmSync, vsmNoSync);
  TGLSceneViewer = class(TWinControl)
  public
    Buffer:TGLSceneBuffer;//f208
    VSync:TVSyncMode;//f20C
    f210:HDC;//f210
    OnMouseEnter:TNotifyEvent;//f218
    f21A:word;//f21A
    f21C:dword;//f21C
    OnMouseLeave:TNotifyEvent;//f220
    f222:word;//f222
    f224:dword;//f224
    f228:byte;//f228
    f229:byte;//f229
    f22A:dword;//f22A
    f22E:dword;//f22E
    destructor Destroy; virtual;//0048B188
    procedure Loaded; virtual;//vC//0048B55C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0048B1B8
    constructor Create(AOwner:TComponent); virtual;//v2C//0048B0A8
    procedure CreateParams(var Params:TCreateParams); virtual;//v98//0048B2CC
    procedure CreateWnd; virtual;//vA0//0048B2EC
    procedure DestroyWnd; virtual;//vB0//0048B338
    procedure vC8; virtual;//vC8//0048B57C
    procedure WMDestroy(Message:TWMDestroy); message WM_DESTROY;//0048B4C0
    procedure WMSize(Message:TWMSize); message WM_SIZE;//0048B38C
    procedure WMPaint(Message:TWMPaint); message WM_PAINT;//0048B3B4
    procedure WMEraseBkgnd(Message:TWMEraseBkgnd); message WM_ERASEBKGND;//0048B374
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//0048B504
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//0048B530
    procedure sub_0048B598; dynamic;//0048B598
    procedure sub_0048B570; dynamic;//0048B570
    //procedure SetBeforeRender(Value:TNotifyEvent; ?:?; ?:?);//0048B1FC
    //procedure GetBeforeRender(?:?);//0048B21C
    //procedure SetPostRender(Value:TNotifyEvent; ?:?; ?:?);//0048B234
    //procedure GetPostRender(?:?);//0048B254
    //procedure SetAfterRender(Value:TNotifyEvent; ?:?; ?:?);//0048B26C
    //procedure GetAfterRender(?:?);//0048B28C
    procedure SetCamera(Value:TGLCamera);//0048B2A4
    //function GetCamera:?;//0048B2B0
    procedure SetBuffer(Value:TGLSceneBuffer);//0048B2C0
    procedure GetFieldOfView;//0048B604
    //procedure SetFieldOfView(Value:Single; ?:?);//0048B660
  end;
    //procedure sub_0048AFEC(?:?);//0048AFEC
    constructor Create(AOwner:TComponent);//0048B0A8
    destructor Destroy;//0048B188
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0048B1B8
    procedure sub_0048B1F4;//0048B1F4
    procedure CreateParams(var Params:TCreateParams);//0048B2CC
    procedure CreateWnd;//0048B2EC
    procedure DestroyWnd;//0048B338
    procedure WMEraseBkgnd(Message:TWMEraseBkgnd);//0048B374
    procedure WMSize(Message:TWMSize);//0048B38C
    procedure WMPaint(Message:TWMPaint);//0048B3B4
    procedure WMDestroy(Message:TWMDestroy);//0048B4C0
    procedure CMMouseEnter(var Message:TMessage);//0048B504
    procedure CMMouseLeave(var Message:TMessage);//0048B530
    procedure Loaded;//0048B55C
    procedure sub_0048B570;//0048B570
    procedure sub_0048B57C;//0048B57C
    procedure sub_0048B598;//0048B598
    //function sub_0048B5A0(?:TGLSceneViewer):?;//0048B5A0

implementation

//0048AFEC
{*procedure sub_0048AFEC(?:?);
begin
 0048AFEC    push        ebx
 0048AFED    mov         ebx,eax
 0048AFEF    mov         eax,[005AE138];^gvar_005E0D32:Boolean
 0048AFF4    cmp         byte ptr [eax],0
>0048AFF7    je          0048B040
 0048AFF9    mov         eax,[005AE3A8];^gvar_005E0E04
 0048AFFE    mov         eax,dword ptr [eax]
 0048B000    call        eax
 0048B002    sub         bl,1
>0048B005    jb          0048B00B
>0048B007    je          0048B01B
>0048B009    jmp         0048B02C
 0048B00B    dec         eax
>0048B00C    je          0048B040
 0048B00E    push        1
 0048B010    mov         eax,[005AE25C];^gvar_005E0E00
 0048B015    mov         eax,dword ptr [eax]
 0048B017    call        eax
>0048B019    jmp         0048B040
 0048B01B    test        eax,eax
>0048B01D    je          0048B040
 0048B01F    push        0
 0048B021    mov         eax,[005AE25C];^gvar_005E0E00
 0048B026    mov         eax,dword ptr [eax]
 0048B028    call        eax
>0048B02A    jmp         0048B040
 0048B02C    mov         ecx,0CB
 0048B031    mov         edx,48B04C;'C:\GLScene\glscene_v_1000714\Source\platform\GLWin32Viewer.pas'
 0048B036    mov         eax,48B094;'Assertion failure'
 0048B03B    call        @Assert
 0048B040    pop         ebx
 0048B041    ret
end;*}

//0048B0A8
constructor TGLSceneViewer.Create(AOwner:TComponent);
begin
{*
 0048B0A8    push        ebx
 0048B0A9    push        esi
 0048B0AA    push        edi
 0048B0AB    test        dl,dl
>0048B0AD    je          0048B0B7
 0048B0AF    add         esp,0FFFFFFF0
 0048B0B2    call        @ClassCreate
 0048B0B7    mov         esi,ecx
 0048B0B9    mov         ebx,edx
 0048B0BB    mov         edi,eax
 0048B0BD    call        004650D0
 0048B0C2    mov         byte ptr [edi+229],al;TGLSceneViewer.?f229:byte
 0048B0C8    mov         ecx,esi
 0048B0CA    xor         edx,edx
 0048B0CC    mov         eax,edi
 0048B0CE    call        TWinControl.Create
 0048B0D3    mov         eax,[0048B180];0xCA gvar_0048B180
 0048B0D8    mov         dword ptr [edi+50],eax;TGLSceneViewer.FControlStyle:TControlStyle
 0048B0DB    test        byte ptr [edi+1C],10;TGLSceneViewer.FComponentState:TComponentState
>0048B0DF    je          0048B0ED
 0048B0E1    mov         eax,dword ptr [edi+50];TGLSceneViewer.FControlStyle:TControlStyle
 0048B0E4    or          eax,dword ptr ds:[48B184];0x10 gvar_0048B184
 0048B0EA    mov         dword ptr [edi+50],eax;TGLSceneViewer.FControlStyle:TControlStyle
 0048B0ED    mov         edx,64
 0048B0F2    mov         eax,edi
 0048B0F4    call        TControl.SetWidth
 0048B0F9    mov         edx,64
 0048B0FE    mov         eax,edi
 0048B100    call        TControl.SetHeight
 0048B105    mov         byte ptr [edi+20C],1;TGLSceneViewer.VSync:TVSyncMode
 0048B10C    mov         ecx,edi
 0048B10E    mov         dl,1
 0048B110    mov         eax,[0047AB64];TGLSceneBuffer
 0048B115    call        TGLSceneBuffer.Create;TGLSceneBuffer.Create
 0048B11A    mov         esi,eax
 0048B11C    mov         dword ptr [edi+208],esi;TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B122    mov         dword ptr [esi+18C],edi;TGLSceneBuffer.?f18C:TGLSceneViewer
 0048B128    mov         eax,edi
 0048B12A    mov         dx,0FFB3
 0048B12E    call        @FindDynaInst;TGLSceneViewer.sub_0048B570
 0048B133    mov         dword ptr [esi+188],eax;TGLSceneBuffer.?f188:dword
 0048B139    mov         dword ptr [esi+16C],edi;TGLSceneBuffer.?f16C:TGLNonVisualViewer
 0048B13F    mov         eax,dword ptr [edi]
 0048B141    mov         eax,dword ptr [eax+0C8];TGLSceneViewer.FOnConstrainedResize:TConstrainedResizeEvent
 0048B147    mov         dword ptr [esi+168],eax;TGLSceneBuffer.OnChange:TNotifyEvent
 0048B14D    mov         dword ptr [esi+174],edi;TGLSceneBuffer.?f174:TGLNonVisualViewer
 0048B153    mov         eax,edi
 0048B155    mov         dx,0FFB2
 0048B159    call        @FindDynaInst;TGLSceneViewer.sub_0048B598
 0048B15E    mov         dword ptr [esi+170],eax;TGLSceneBuffer.OnStructuralChange:TNotifyEvent
 0048B164    mov         eax,edi
 0048B166    test        bl,bl
>0048B168    je          0048B179
 0048B16A    call        @AfterConstruction
 0048B16F    pop         dword ptr fs:[0]
 0048B176    add         esp,0C
 0048B179    mov         eax,edi
 0048B17B    pop         edi
 0048B17C    pop         esi
 0048B17D    pop         ebx
 0048B17E    ret
*}
end;

//0048B188
destructor TGLSceneViewer.Destroy;
begin
{*
 0048B188    push        ebx
 0048B189    push        esi
 0048B18A    call        @BeforeDestruction
 0048B18F    mov         ebx,edx
 0048B191    mov         esi,eax
 0048B193    mov         eax,dword ptr [esi+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B199    call        TObject.Free
 0048B19E    mov         edx,ebx
 0048B1A0    and         dl,0FC
 0048B1A3    mov         eax,esi
 0048B1A5    call        TWinControl.Destroy
 0048B1AA    test        bl,bl
>0048B1AC    jle         0048B1B5
 0048B1AE    mov         eax,esi
 0048B1B0    call        @ClassDestroy
 0048B1B5    pop         esi
 0048B1B6    pop         ebx
 0048B1B7    ret
*}
end;

//0048B1B8
procedure TGLSceneViewer.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0048B1B8    push        ebx
 0048B1B9    push        esi
 0048B1BA    push        edi
 0048B1BB    mov         ebx,ecx
 0048B1BD    mov         esi,edx
 0048B1BF    mov         edi,eax
 0048B1C1    cmp         bl,1
>0048B1C4    jne         0048B1E3
 0048B1C6    cmp         dword ptr [edi+208],0;TGLSceneViewer.Buffer:TGLSceneBuffer
>0048B1CD    je          0048B1E3
 0048B1CF    mov         eax,edi
 0048B1D1    call        TGLSceneViewer.GetCamera
 0048B1D6    cmp         esi,eax
>0048B1D8    jne         0048B1E3
 0048B1DA    xor         edx,edx
 0048B1DC    mov         eax,edi
 0048B1DE    call        TGLSceneViewer.SetCamera
 0048B1E3    mov         ecx,ebx
 0048B1E5    mov         edx,esi
 0048B1E7    mov         eax,edi
 0048B1E9    call        TControl.Notification
 0048B1EE    pop         edi
 0048B1EF    pop         esi
 0048B1F0    pop         ebx
 0048B1F1    ret
*}
end;

//0048B1F4
procedure sub_0048B1F4;
begin
{*
 0048B1F4    call        TWinControl.RecreateWnd
 0048B1F9    ret
*}
end;

//0048B1FC
{*procedure TGLSceneViewer.SetBeforeRender(Value:TNotifyEvent; ?:?; ?:?);
begin
 0048B1FC    push        ebp
 0048B1FD    mov         ebp,esp
 0048B1FF    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B205    mov         edx,dword ptr [ebp+8]
 0048B208    mov         dword ptr [eax+180],edx;TGLSceneBuffer.BeforeRender:TNotifyEvent
 0048B20E    mov         edx,dword ptr [ebp+0C]
 0048B211    mov         dword ptr [eax+184],edx;TGLSceneBuffer.?f184:dword
 0048B217    pop         ebp
 0048B218    ret         8
end;*}

//0048B21C
{*procedure TGLSceneViewer.GetBeforeRender(?:?);
begin
 0048B21C    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B222    mov         ecx,dword ptr [eax+180];TGLSceneBuffer.BeforeRender:TNotifyEvent
 0048B228    mov         dword ptr [edx],ecx
 0048B22A    mov         ecx,dword ptr [eax+184];TGLSceneBuffer.?f184:dword
 0048B230    mov         dword ptr [edx+4],ecx
 0048B233    ret
end;*}

//0048B234
{*procedure TGLSceneViewer.SetPostRender(Value:TNotifyEvent; ?:?; ?:?);
begin
 0048B234    push        ebp
 0048B235    mov         ebp,esp
 0048B237    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B23D    mov         edx,dword ptr [ebp+8]
 0048B240    mov         dword ptr [eax+190],edx;TGLSceneBuffer.PostRender:TNotifyEvent
 0048B246    mov         edx,dword ptr [ebp+0C]
 0048B249    mov         dword ptr [eax+194],edx;TGLSceneBuffer.?f194:dword
 0048B24F    pop         ebp
 0048B250    ret         8
end;*}

//0048B254
{*procedure TGLSceneViewer.GetPostRender(?:?);
begin
 0048B254    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B25A    mov         ecx,dword ptr [eax+190];TGLSceneBuffer.PostRender:TNotifyEvent
 0048B260    mov         dword ptr [edx],ecx
 0048B262    mov         ecx,dword ptr [eax+194];TGLSceneBuffer.?f194:dword
 0048B268    mov         dword ptr [edx+4],ecx
 0048B26B    ret
end;*}

//0048B26C
{*procedure TGLSceneViewer.SetAfterRender(Value:TNotifyEvent; ?:?; ?:?);
begin
 0048B26C    push        ebp
 0048B26D    mov         ebp,esp
 0048B26F    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B275    mov         edx,dword ptr [ebp+8]
 0048B278    mov         dword ptr [eax+198],edx;TGLSceneBuffer.AfterRender:TNotifyEvent
 0048B27E    mov         edx,dword ptr [ebp+0C]
 0048B281    mov         dword ptr [eax+19C],edx;TGLSceneBuffer.?f19C:dword
 0048B287    pop         ebp
 0048B288    ret         8
end;*}

//0048B28C
{*procedure TGLSceneViewer.GetAfterRender(?:?);
begin
 0048B28C    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B292    mov         ecx,dword ptr [eax+198];TGLSceneBuffer.AfterRender:TNotifyEvent
 0048B298    mov         dword ptr [edx],ecx
 0048B29A    mov         ecx,dword ptr [eax+19C];TGLSceneBuffer.?f19C:dword
 0048B2A0    mov         dword ptr [edx+4],ecx
 0048B2A3    ret
end;*}

//0048B2A4
procedure TGLSceneViewer.SetCamera(Value:TGLCamera);
begin
{*
 0048B2A4    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B2AA    call        00481CF8
 0048B2AF    ret
*}
end;

//0048B2B0
{*function TGLSceneViewer.GetCamera:?;
begin
 0048B2B0    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B2B6    mov         eax,dword ptr [eax+130];TGLSceneBuffer.?f130:dword
 0048B2BC    ret
end;*}

//0048B2C0
procedure TGLSceneViewer.SetBuffer(Value:TGLSceneBuffer);
begin
{*
 0048B2C0    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B2C6    mov         ecx,dword ptr [eax]
 0048B2C8    call        dword ptr [ecx+8];TPersistent.Assign
 0048B2CB    ret
*}
end;

//0048B2CC
procedure TGLSceneViewer.CreateParams(var Params:TCreateParams);
begin
{*
 0048B2CC    push        ebx
 0048B2CD    mov         ebx,edx
 0048B2CF    mov         edx,ebx
 0048B2D1    call        TWinControl.CreateParams
 0048B2D6    mov         eax,dword ptr [ebx+4];TCreateParams.Style:DWORD
 0048B2D9    or          eax,2000000
 0048B2DE    or          eax,4000000
 0048B2E3    mov         dword ptr [ebx+4],eax;TCreateParams.Style:DWORD
 0048B2E6    or          dword ptr [ebx+24],20;TCreateParams.WindowClass:TWndClass
 0048B2EA    pop         ebx
 0048B2EB    ret
*}
end;

//0048B2EC
procedure TGLSceneViewer.CreateWnd;
begin
{*
 0048B2EC    push        ebx
 0048B2ED    push        esi
 0048B2EE    mov         ebx,eax
 0048B2F0    mov         eax,ebx
 0048B2F2    call        TWinControl.CreateWnd
 0048B2F7    cmp         byte ptr [ebx+229],0;TGLSceneViewer.?f229:byte
>0048B2FE    je          0048B335
 0048B300    mov         ecx,dword ptr [ebx+4C];TGLSceneViewer.Height:Integer
 0048B303    mov         edx,dword ptr [ebx+48];TGLSceneViewer.Width:Integer
 0048B306    mov         eax,dword ptr [ebx+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B30C    call        004810AC
 0048B311    mov         eax,ebx
 0048B313    call        TWinControl.GetHandle
 0048B318    push        eax
 0048B319    call        user32.GetDC
 0048B31E    mov         esi,eax
 0048B320    mov         dword ptr [ebx+210],esi;TGLSceneViewer.?f210:HDC
 0048B326    xor         ecx,ecx
 0048B328    mov         edx,esi
 0048B32A    mov         eax,dword ptr [ebx+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B330    call        00480E78
 0048B335    pop         esi
 0048B336    pop         ebx
 0048B337    ret
*}
end;

//0048B338
procedure TGLSceneViewer.DestroyWnd;
begin
{*
 0048B338    push        ebx
 0048B339    mov         ebx,eax
 0048B33B    mov         eax,dword ptr [ebx+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B341    call        00481070
 0048B346    cmp         dword ptr [ebx+210],0;TGLSceneViewer.?f210:HDC
>0048B34D    je          0048B36B
 0048B34F    mov         eax,dword ptr [ebx+210];TGLSceneViewer.?f210:HDC
 0048B355    push        eax
 0048B356    mov         eax,ebx
 0048B358    call        TWinControl.GetHandle
 0048B35D    push        eax
 0048B35E    call        user32.ReleaseDC
 0048B363    xor         eax,eax
 0048B365    mov         dword ptr [ebx+210],eax;TGLSceneViewer.?f210:HDC
 0048B36B    mov         eax,ebx
 0048B36D    call        TWinControl.DestroyWnd
 0048B372    pop         ebx
 0048B373    ret
*}
end;

//0048B374
procedure TGLSceneViewer.WMEraseBkgnd(Message:TWMEraseBkgnd);
begin
{*
 0048B374    cmp         byte ptr [eax+229],0;TGLSceneViewer.?f229:byte
>0048B37B    je          0048B385
 0048B37D    mov         dword ptr [edx+0C],1
 0048B384    ret
 0048B385    call        TWinControl.WMEraseBkgnd
 0048B38A    ret
*}
end;

//0048B38C
procedure TGLSceneViewer.WMSize(Message:TWMSize);
begin
{*
 0048B38C    push        ebx
 0048B38D    push        esi
 0048B38E    mov         esi,edx
 0048B390    mov         ebx,eax
 0048B392    mov         edx,esi
 0048B394    mov         eax,ebx
 0048B396    call        TWinControl.WMSize
 0048B39B    movzx       ecx,word ptr [esi+0A]
 0048B39F    movzx       edx,word ptr [esi+8]
 0048B3A3    mov         eax,dword ptr [ebx+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B3A9    call        004810AC
 0048B3AE    pop         esi
 0048B3AF    pop         ebx
 0048B3B0    ret
*}
end;

//0048B3B4
procedure TGLSceneViewer.WMPaint(Message:TWMPaint);
begin
{*
 0048B3B4    push        ebp
 0048B3B5    mov         ebp,esp
 0048B3B7    add         esp,0FFFFFFA8
 0048B3BA    mov         dword ptr [ebp-8],edx
 0048B3BD    mov         dword ptr [ebp-4],eax
 0048B3C0    lea         ecx,[ebp-58]
 0048B3C3    xor         edx,edx
 0048B3C5    xor         eax,eax
 0048B3C7    call        Point
 0048B3CC    lea         edx,[ebp-58]
 0048B3CF    lea         ecx,[ebp-10]
 0048B3D2    mov         eax,dword ptr [ebp-4]
 0048B3D5    call        TControl.ClientToScreen
 0048B3DA    mov         eax,dword ptr [ebp-4]
 0048B3DD    mov         eax,dword ptr [eax+22A];TGLSceneViewer.?f22A:dword
 0048B3E3    cmp         eax,dword ptr [ebp-10]
>0048B3E6    jne         0048B3F6
 0048B3E8    mov         eax,dword ptr [ebp-4]
 0048B3EB    mov         eax,dword ptr [eax+22E];TGLSceneViewer.?f22E:dword
 0048B3F1    cmp         eax,dword ptr [ebp-0C]
>0048B3F4    je          0048B441
 0048B3F6    mov         eax,dword ptr [ebp-4]
 0048B3F9    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B3FF    call        004810A4
 0048B404    test        al,al
>0048B406    je          0048B42C
 0048B408    mov         eax,dword ptr [ebp-4]
 0048B40B    mov         eax,dword ptr [eax+48];TGLSceneViewer.Width:Integer
 0048B40E    mov         edx,dword ptr [ebp-4]
 0048B411    mov         edx,dword ptr [edx+4C];TGLSceneViewer.Height:Integer
 0048B414    shl         edx,10
 0048B417    add         eax,edx
 0048B419    push        eax
 0048B41A    push        0
 0048B41C    push        5
 0048B41E    mov         eax,dword ptr [ebp-4]
 0048B421    call        TWinControl.GetHandle
 0048B426    push        eax
 0048B427    call        user32.PostMessageA
 0048B42C    mov         eax,dword ptr [ebp-4]
 0048B42F    mov         edx,dword ptr [ebp-10]
 0048B432    mov         dword ptr [eax+22A],edx;TGLSceneViewer.?f22A:dword
 0048B438    mov         edx,dword ptr [ebp-0C]
 0048B43B    mov         dword ptr [eax+22E],edx;TGLSceneViewer.?f22E:dword
 0048B441    lea         eax,[ebp-50]
 0048B444    push        eax
 0048B445    mov         eax,dword ptr [ebp-4]
 0048B448    call        TWinControl.GetHandle
 0048B44D    push        eax
 0048B44E    call        user32.BeginPaint
 0048B453    xor         eax,eax
 0048B455    push        ebp
 0048B456    push        48B4B5
 0048B45B    push        dword ptr fs:[eax]
 0048B45E    mov         dword ptr fs:[eax],esp
 0048B461    mov         eax,dword ptr [ebp-4]
 0048B464    cmp         byte ptr [eax+229],0;TGLSceneViewer.?f229:byte
>0048B46B    je          0048B48D
 0048B46D    mov         eax,dword ptr [ebp-4]
 0048B470    cmp         dword ptr [eax+48],0;TGLSceneViewer.Width:Integer
>0048B474    jle         0048B48D
 0048B476    mov         eax,dword ptr [ebp-4]
 0048B479    cmp         dword ptr [eax+4C],0;TGLSceneViewer.Height:Integer
>0048B47D    jle         0048B48D
 0048B47F    mov         eax,dword ptr [ebp-4]
 0048B482    mov         eax,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B488    call        004819A4
 0048B48D    xor         eax,eax
 0048B48F    pop         edx
 0048B490    pop         ecx
 0048B491    pop         ecx
 0048B492    mov         dword ptr fs:[eax],edx
 0048B495    push        48B4BC
 0048B49A    lea         eax,[ebp-50]
 0048B49D    push        eax
 0048B49E    mov         eax,dword ptr [ebp-4]
 0048B4A1    call        TWinControl.GetHandle
 0048B4A6    push        eax
 0048B4A7    call        user32.EndPaint
 0048B4AC    mov         eax,dword ptr [ebp-8]
 0048B4AF    xor         edx,edx
 0048B4B1    mov         dword ptr [eax+0C],edx
 0048B4B4    ret
>0048B4B5    jmp         @HandleFinally
>0048B4BA    jmp         0048B49A
 0048B4BC    mov         esp,ebp
 0048B4BE    pop         ebp
 0048B4BF    ret
*}
end;

//0048B4C0
procedure TGLSceneViewer.WMDestroy(Message:TWMDestroy);
begin
{*
 0048B4C0    push        ebx
 0048B4C1    push        esi
 0048B4C2    mov         esi,edx
 0048B4C4    mov         ebx,eax
 0048B4C6    mov         eax,dword ptr [ebx+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B4CC    call        00481070
 0048B4D1    cmp         dword ptr [ebx+210],0;TGLSceneViewer.?f210:HDC
>0048B4D8    je          0048B4F6
 0048B4DA    mov         eax,dword ptr [ebx+210];TGLSceneViewer.?f210:HDC
 0048B4E0    push        eax
 0048B4E1    mov         eax,ebx
 0048B4E3    call        TWinControl.GetHandle
 0048B4E8    push        eax
 0048B4E9    call        user32.ReleaseDC
 0048B4EE    xor         eax,eax
 0048B4F0    mov         dword ptr [ebx+210],eax;TGLSceneViewer.?f210:HDC
 0048B4F6    mov         edx,esi
 0048B4F8    mov         eax,ebx
 0048B4FA    call        TWinControl.WMDestroy
 0048B4FF    pop         esi
 0048B500    pop         ebx
 0048B501    ret
*}
end;

//0048B504
procedure TGLSceneViewer.CMMouseEnter(var Message:TMessage);
begin
{*
 0048B504    push        ebx
 0048B505    mov         ebx,eax
 0048B507    mov         eax,ebx
 0048B509    call        TControl.CMMouseEnter
 0048B50E    mov         byte ptr [ebx+228],1;TGLSceneViewer.?f228:byte
 0048B515    cmp         word ptr [ebx+21A],0;TGLSceneViewer.?f21A:word
>0048B51D    je          0048B52D
 0048B51F    mov         edx,ebx
 0048B521    mov         eax,dword ptr [ebx+21C];TGLSceneViewer.?f21C:dword
 0048B527    call        dword ptr [ebx+218];TGLSceneViewer.OnMouseEnter
 0048B52D    pop         ebx
 0048B52E    ret
*}
end;

//0048B530
procedure TGLSceneViewer.CMMouseLeave(var Message:TMessage);
begin
{*
 0048B530    push        ebx
 0048B531    mov         ebx,eax
 0048B533    mov         eax,ebx
 0048B535    call        TControl.CMMouseLeave
 0048B53A    mov         byte ptr [ebx+228],0;TGLSceneViewer.?f228:byte
 0048B541    cmp         word ptr [ebx+222],0;TGLSceneViewer.?f222:word
>0048B549    je          0048B559
 0048B54B    mov         edx,ebx
 0048B54D    mov         eax,dword ptr [ebx+224];TGLSceneViewer.?f224:dword
 0048B553    call        dword ptr [ebx+220];TGLSceneViewer.OnMouseLeave
 0048B559    pop         ebx
 0048B55A    ret
*}
end;

//0048B55C
procedure TGLSceneViewer.Loaded;
begin
{*
 0048B55C    push        ebx
 0048B55D    mov         ebx,eax
 0048B55F    mov         eax,ebx
 0048B561    call        TControl.Loaded
 0048B566    mov         eax,ebx
 0048B568    call        TWinControl.HandleNeeded
 0048B56D    pop         ebx
 0048B56E    ret
*}
end;

//0048B570
procedure TGLSceneViewer.sub_0048B570;
begin
{*
 0048B570    mov         al,byte ptr [eax+20C];TGLSceneViewer.VSync:TVSyncMode
 0048B576    call        0048AFEC
 0048B57B    ret
*}
end;

//0048B57C
procedure sub_0048B57C;
begin
{*
 0048B57C    mov         edx,dword ptr [eax+208];TGLSceneViewer.Buffer:TGLSceneBuffer
 0048B582    cmp         byte ptr [edx+1C],0;TGLSceneBuffer.?f1C:byte
>0048B586    jne         0048B596
 0048B588    cmp         byte ptr [edx+138],0;TGLSceneBuffer.?f138:byte
>0048B58F    jne         0048B596
 0048B591    mov         edx,dword ptr [eax]
 0048B593    call        dword ptr [edx+7C];TWinControl.Invalidate
 0048B596    ret
*}
end;

//0048B598
procedure TGLSceneViewer.sub_0048B598;
begin
{*
 0048B598    call        0048B1F4
 0048B59D    ret
*}
end;

//0048B5A0
{*function sub_0048B5A0(?:TGLSceneViewer):?;
begin
 0048B5A0    push        ebx
 0048B5A1    push        esi
 0048B5A2    mov         ebx,eax
 0048B5A4    mov         dl,1
 0048B5A6    mov         eax,[00424EB8];TBitmap
 0048B5AB    call        TBitmap.Create;TBitmap.Create
 0048B5B0    mov         esi,eax
 0048B5B2    mov         dl,6
 0048B5B4    mov         eax,esi
 0048B5B6    call        TBitmap.SetPixelFormat
 0048B5BB    mov         edx,dword ptr [ebx+48]
 0048B5BE    mov         eax,esi
 0048B5C0    mov         ecx,dword ptr [eax]
 0048B5C2    call        dword ptr [ecx+40];TBitmap.SetWidth
 0048B5C5    mov         edx,dword ptr [ebx+4C]
 0048B5C8    mov         eax,esi
 0048B5CA    mov         ecx,dword ptr [eax]
 0048B5CC    call        dword ptr [ecx+34];TBitmap.SetHeight
 0048B5CF    push        0CC0020
 0048B5D4    push        0
 0048B5D6    push        0
 0048B5D8    mov         eax,dword ptr [ebx+210]
 0048B5DE    push        eax
 0048B5DF    mov         eax,dword ptr [ebx+4C]
 0048B5E2    push        eax
 0048B5E3    mov         eax,dword ptr [ebx+48]
 0048B5E6    push        eax
 0048B5E7    push        0
 0048B5E9    push        0
 0048B5EB    mov         eax,esi
 0048B5ED    call        TBitmap.GetCanvas
 0048B5F2    call        TCanvas.GetHandle
 0048B5F7    push        eax
 0048B5F8    call        gdi32.BitBlt
 0048B5FD    mov         eax,esi
 0048B5FF    pop         esi
 0048B600    pop         ebx
 0048B601    ret
end;*}

//0048B604
procedure TGLSceneViewer.GetFieldOfView;
begin
{*
 0048B604    push        ebx
 0048B605    push        ecx
 0048B606    mov         ebx,eax
 0048B608    mov         eax,ebx
 0048B60A    call        TGLSceneViewer.GetCamera
 0048B60F    test        eax,eax
>0048B611    jne         0048B61A
 0048B613    xor         eax,eax
 0048B615    mov         dword ptr [esp],eax
>0048B618    jmp         0048B658
 0048B61A    mov         eax,dword ptr [ebx+48];TGLSceneViewer.Width:Integer
 0048B61D    cmp         eax,dword ptr [ebx+4C];TGLSceneViewer.Height:Integer
>0048B620    jge         0048B63E
 0048B622    fild        dword ptr [ebx+48];TGLSceneViewer.Width:Integer
 0048B625    add         esp,0FFFFFFFC
 0048B628    fstp        dword ptr [esp]
 0048B62B    wait
 0048B62C    mov         eax,ebx
 0048B62E    call        TGLSceneViewer.GetCamera
 0048B633    call        0047EEC0
 0048B638    fstp        dword ptr [esp]
 0048B63B    wait
>0048B63C    jmp         0048B658
 0048B63E    fild        dword ptr [ebx+4C];TGLSceneViewer.Height:Integer
 0048B641    add         esp,0FFFFFFFC
 0048B644    fstp        dword ptr [esp]
 0048B647    wait
 0048B648    mov         eax,ebx
 0048B64A    call        TGLSceneViewer.GetCamera
 0048B64F    call        0047EEC0
 0048B654    fstp        dword ptr [esp]
 0048B657    wait
 0048B658    fld         dword ptr [esp]
 0048B65B    pop         edx
 0048B65C    pop         ebx
 0048B65D    ret
*}
end;

//0048B660
{*procedure TGLSceneViewer.SetFieldOfView(Value:Single; ?:?);
begin
 0048B660    push        ebp
 0048B661    mov         ebp,esp
 0048B663    push        ebx
 0048B664    mov         ebx,eax
 0048B666    mov         eax,ebx
 0048B668    call        TGLSceneViewer.GetCamera
 0048B66D    test        eax,eax
>0048B66F    je          0048B6AD
 0048B671    mov         eax,dword ptr [ebx+48];TGLSceneViewer.Width:Integer
 0048B674    cmp         eax,dword ptr [ebx+4C];TGLSceneViewer.Height:Integer
>0048B677    jge         0048B694
 0048B679    push        dword ptr [ebp+8]
 0048B67C    fild        dword ptr [ebx+48];TGLSceneViewer.Width:Integer
 0048B67F    add         esp,0FFFFFFFC
 0048B682    fstp        dword ptr [esp]
 0048B685    wait
 0048B686    mov         eax,ebx
 0048B688    call        TGLSceneViewer.GetCamera
 0048B68D    call        0047EF2C
>0048B692    jmp         0048B6AD
 0048B694    push        dword ptr [ebp+8]
 0048B697    fild        dword ptr [ebx+4C];TGLSceneViewer.Height:Integer
 0048B69A    add         esp,0FFFFFFFC
 0048B69D    fstp        dword ptr [esp]
 0048B6A0    wait
 0048B6A1    mov         eax,ebx
 0048B6A3    call        TGLSceneViewer.GetCamera
 0048B6A8    call        0047EF2C
 0048B6AD    pop         ebx
 0048B6AE    pop         ebp
 0048B6AF    ret         4
end;*}

Initialization
//0048B6E4
{*
 0048B6E4    sub         dword ptr ds:[5E1550],1
>0048B6EB    jae         0048B6F7
 0048B6ED    mov         eax,[0048AA6C];TGLSceneViewer
 0048B6F2    call        RegisterClass
 0048B6F7    ret
*}
Finalization
end.