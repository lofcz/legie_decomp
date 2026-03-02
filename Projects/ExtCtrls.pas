//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ExtCtrls;

interface

uses
  SysUtils, Classes, Graphics;

type
  TImage = class(TGraphicControl)
  public
    Picture:TPicture;//f168
    OnProgress:TProgressEvent;//f170
    Stretch:Boolean;//f178
    Center:Boolean;//f179
    IncrementalDisplay:Boolean;//f17A
    Transparent:Boolean;//f17B
    FDrawing:Boolean;//f17C
    Proportional:Boolean;//f17D
    destructor Destroy; virtual;//00431A2C
    constructor Create(AOwner:TComponent); virtual;//v2C//00431994
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v34//00431F00
    procedure Paint; virtual;//v8C//00431BA4
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString); dynamic;//00431CFC
    procedure GetPalette; dynamic;//00431A5C
    function DestRect:TRect;//00431A78
    function DoPaletteChange:Boolean;//00431C64
    procedure SetCenter(Value:Boolean);//00431D68
    procedure SetPicture(Value:TPicture);//00431D80
    procedure SetStretch(Value:Boolean);//00431D90
    procedure SetTransparent(Value:Boolean);//00431DA8
    procedure SetProportional(Value:Boolean);//00431DC0
    procedure PictureChanged(Sender:TObject);//00431DD8
  end;
  TTimer = class(TComponent)
  public
    Interval:Cardinal;//f30
    FWindowHandle:HWND;//f34
    OnTimer:TNotifyEvent;//f38
    Enabled:Boolean;//f40
    destructor Destroy; virtual;//00431FB8
    constructor Create(AOwner:TComponent); virtual;//v2C//00431F68
    procedure Timer; dynamic;//00432128
    procedure WndProc(var Msg:TMessage);//00431FF0
    procedure UpdateTimer;//00432064
    procedure SetEnabled(Value:Boolean);//004320F0
    procedure SetInterval(Value:Cardinal);//00432100
    procedure SetOnTimer(Value:TNotifyEvent);//00432110
  end;
    constructor Create(AOwner:TComponent);//00431994
    destructor Destroy;//00431A2C
    procedure GetPalette;//00431A5C
    procedure Paint;//00431BA4
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);//00431CFC
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//00431F00
    constructor Create(AOwner:TComponent);//00431F68
    destructor Destroy;//00431FB8
    procedure Timer;//00432128
    procedure _NF__82C;//004322B4

implementation

//00431994
constructor TImage.Create(AOwner:TComponent);
begin
{*
 00431994    push        ebp
 00431995    mov         ebp,esp
 00431997    push        ecx
 00431998    push        ebx
 00431999    push        esi
 0043199A    test        dl,dl
>0043199C    je          004319A6
 0043199E    add         esp,0FFFFFFF0
 004319A1    call        @ClassCreate
 004319A6    mov         byte ptr [ebp-1],dl
 004319A9    mov         ebx,eax
 004319AB    xor         edx,edx
 004319AD    mov         eax,ebx
 004319AF    call        TGraphicControl.Create
 004319B4    mov         eax,dword ptr [ebx+50]
 004319B7    or          eax,dword ptr ds:[431A28]
 004319BD    mov         dword ptr [ebx+50],eax
 004319C0    mov         dl,1
 004319C2    mov         eax,[00424C0C];TPicture
 004319C7    call        TPicture.Create
 004319CC    mov         esi,eax
 004319CE    mov         dword ptr [ebx+168],esi
 004319D4    mov         dword ptr [esi+14],ebx
 004319D7    mov         dword ptr [esi+10],431DD8;TImage.PictureChanged
 004319DE    mov         dword ptr [esi+24],ebx
 004319E1    mov         eax,ebx
 004319E3    mov         dx,0FFC7
 004319E7    call        @FindDynaInst
 004319EC    mov         dword ptr [esi+20],eax
 004319EF    mov         edx,69
 004319F4    mov         eax,ebx
 004319F6    call        TControl.SetHeight
 004319FB    mov         edx,69
 00431A00    mov         eax,ebx
 00431A02    call        TControl.SetWidth
 00431A07    mov         eax,ebx
 00431A09    cmp         byte ptr [ebp-1],0
>00431A0D    je          00431A1E
 00431A0F    call        @AfterConstruction
 00431A14    pop         dword ptr fs:[0]
 00431A1B    add         esp,0C
 00431A1E    mov         eax,ebx
 00431A20    pop         esi
 00431A21    pop         ebx
 00431A22    pop         ecx
 00431A23    pop         ebp
 00431A24    ret
*}
end;

//00431A2C
destructor TImage.Destroy;
begin
{*
 00431A2C    push        ebx
 00431A2D    push        esi
 00431A2E    call        @BeforeDestruction
 00431A33    mov         ebx,edx
 00431A35    mov         esi,eax
 00431A37    mov         eax,dword ptr [esi+168]
 00431A3D    call        TObject.Free
 00431A42    mov         edx,ebx
 00431A44    and         dl,0FC
 00431A47    mov         eax,esi
 00431A49    call        TGraphicControl.Destroy
 00431A4E    test        bl,bl
>00431A50    jle         00431A59
 00431A52    mov         eax,esi
 00431A54    call        @ClassDestroy
 00431A59    pop         esi
 00431A5A    pop         ebx
 00431A5B    ret
*}
end;

//00431A5C
procedure TImage.GetPalette;
begin
{*
 00431A5C    xor         edx,edx
 00431A5E    mov         ecx,dword ptr [eax+168]
 00431A64    mov         ecx,dword ptr [ecx+0C]
 00431A67    test        ecx,ecx
>00431A69    je          00431A74
 00431A6B    mov         eax,ecx
 00431A6D    mov         edx,dword ptr [eax]
 00431A6F    call        dword ptr [edx+24]
 00431A72    mov         edx,eax
 00431A74    mov         eax,edx
 00431A76    ret
*}
end;

//00431A78
function TImage.DestRect:TRect;
begin
{*
 00431A78    push        ebx
 00431A79    push        esi
 00431A7A    push        edi
 00431A7B    push        ebp
 00431A7C    add         esp,0FFFFFFE8
 00431A7F    mov         ebp,edx
 00431A81    mov         ebx,eax
 00431A83    mov         eax,dword ptr [ebx+168]
 00431A89    call        TPicture.GetWidth
 00431A8E    mov         esi,eax
 00431A90    mov         eax,dword ptr [ebx+168]
 00431A96    call        TPicture.GetHeight
 00431A9B    mov         edi,eax
 00431A9D    mov         eax,ebx
 00431A9F    call        TControl.GetClientWidth
 00431AA4    mov         dword ptr [esp],eax
 00431AA7    mov         eax,ebx
 00431AA9    call        TControl.GetClientHeight
 00431AAE    mov         dword ptr [esp+4],eax
 00431AB2    cmp         byte ptr [ebx+178],0
>00431AB9    jne         00431AD7
 00431ABB    cmp         byte ptr [ebx+17D],0
>00431AC2    je          00431B61
 00431AC8    cmp         esi,dword ptr [esp]
>00431ACB    jg          00431AD7
 00431ACD    cmp         edi,dword ptr [esp+4]
>00431AD1    jle         00431B61
 00431AD7    cmp         byte ptr [ebx+17D],0
>00431ADE    je          00431B5A
 00431AE0    test        esi,esi
>00431AE2    jle         00431B5A
 00431AE4    test        edi,edi
>00431AE6    jle         00431B5A
 00431AE8    mov         dword ptr [esp+10],esi
 00431AEC    fild        dword ptr [esp+10]
 00431AF0    mov         dword ptr [esp+14],edi
 00431AF4    fild        dword ptr [esp+14]
 00431AF8    fdivp       st(1),st
 00431AFA    fstp        qword ptr [esp+8]
 00431AFE    wait
 00431AFF    cmp         edi,esi
>00431B01    jge         00431B2F
 00431B03    mov         esi,dword ptr [esp]
 00431B06    fild        dword ptr [esp]
 00431B09    fdiv        qword ptr [esp+8]
 00431B0D    call        @TRUNC
 00431B12    mov         edi,eax
 00431B14    cmp         edi,dword ptr [esp+4]
>00431B18    jle         00431B61
 00431B1A    mov         edi,dword ptr [esp+4]
 00431B1E    fild        dword ptr [esp+4]
 00431B22    fmul        qword ptr [esp+8]
 00431B26    call        @TRUNC
 00431B2B    mov         esi,eax
>00431B2D    jmp         00431B61
 00431B2F    mov         edi,dword ptr [esp+4]
 00431B33    fild        dword ptr [esp+4]
 00431B37    fmul        qword ptr [esp+8]
 00431B3B    call        @TRUNC
 00431B40    mov         esi,eax
 00431B42    cmp         esi,dword ptr [esp]
>00431B45    jle         00431B61
 00431B47    mov         esi,dword ptr [esp]
 00431B4A    fild        dword ptr [esp]
 00431B4D    fdiv        qword ptr [esp+8]
 00431B51    call        @TRUNC
 00431B56    mov         edi,eax
>00431B58    jmp         00431B61
 00431B5A    mov         esi,dword ptr [esp]
 00431B5D    mov         edi,dword ptr [esp+4]
 00431B61    xor         eax,eax
 00431B63    mov         dword ptr [ebp],eax
 00431B66    xor         eax,eax
 00431B68    mov         dword ptr [ebp+4],eax
 00431B6B    mov         dword ptr [ebp+8],esi
 00431B6E    mov         dword ptr [ebp+0C],edi
 00431B71    cmp         byte ptr [ebx+179],0
>00431B78    je          00431B9C
 00431B7A    mov         eax,dword ptr [esp+4]
 00431B7E    sub         eax,edi
 00431B80    sar         eax,1
>00431B82    jns         00431B87
 00431B84    adc         eax,0
 00431B87    push        eax
 00431B88    mov         eax,dword ptr [esp+4]
 00431B8C    sub         eax,esi
 00431B8E    sar         eax,1
>00431B90    jns         00431B95
 00431B92    adc         eax,0
 00431B95    push        eax
 00431B96    push        ebp
 00431B97    call        user32.OffsetRect
 00431B9C    add         esp,18
 00431B9F    pop         ebp
 00431BA0    pop         edi
 00431BA1    pop         esi
 00431BA2    pop         ebx
 00431BA3    ret
*}
end;

//00431BA4
procedure TImage.Paint;
begin
{*
 00431BA4    push        ebp
 00431BA5    mov         ebp,esp
 00431BA7    add         esp,0FFFFFFE8
 00431BAA    push        ebx
 00431BAB    mov         dword ptr [ebp-4],eax
 00431BAE    mov         eax,dword ptr [ebp-4]
 00431BB1    test        byte ptr [eax+1C],10
>00431BB5    je          00431BED
 00431BB7    mov         eax,dword ptr [ebp-4]
 00431BBA    mov         ebx,dword ptr [eax+160]
 00431BC0    mov         eax,dword ptr [ebx+10]
 00431BC3    mov         dl,1
 00431BC5    call        TPen.SetStyle
 00431BCA    mov         eax,dword ptr [ebx+14]
 00431BCD    mov         dl,1
 00431BCF    call        TBrush.SetStyle
 00431BD4    mov         eax,dword ptr [ebp-4]
 00431BD7    mov         eax,dword ptr [eax+48]
 00431BDA    push        eax
 00431BDB    mov         eax,dword ptr [ebp-4]
 00431BDE    mov         eax,dword ptr [eax+4C]
 00431BE1    push        eax
 00431BE2    xor         ecx,ecx
 00431BE4    xor         edx,edx
 00431BE6    mov         eax,ebx
 00431BE8    call        TCanvas.Rectangle
 00431BED    mov         eax,dword ptr [ebp-4]
 00431BF0    mov         al,byte ptr [eax+17C]
 00431BF6    mov         byte ptr [ebp-5],al
 00431BF9    mov         eax,dword ptr [ebp-4]
 00431BFC    mov         byte ptr [eax+17C],1
 00431C03    xor         eax,eax
 00431C05    push        ebp
 00431C06    push        431C55
 00431C0B    push        dword ptr fs:[eax]
 00431C0E    mov         dword ptr fs:[eax],esp
 00431C11    mov         eax,dword ptr [ebp-4]
 00431C14    mov         ebx,dword ptr [eax+160]
 00431C1A    lea         edx,[ebp-18]
 00431C1D    mov         eax,dword ptr [ebp-4]
 00431C20    call        TImage.DestRect
 00431C25    lea         edx,[ebp-18]
 00431C28    mov         eax,dword ptr [ebp-4]
 00431C2B    mov         eax,dword ptr [eax+168]
 00431C31    mov         ecx,dword ptr [eax+0C]
 00431C34    mov         eax,ebx
 00431C36    call        TCanvas.StretchDraw
 00431C3B    xor         eax,eax
 00431C3D    pop         edx
 00431C3E    pop         ecx
 00431C3F    pop         ecx
 00431C40    mov         dword ptr fs:[eax],edx
 00431C43    push        431C5C
 00431C48    mov         eax,dword ptr [ebp-4]
 00431C4B    mov         dl,byte ptr [ebp-5]
 00431C4E    mov         byte ptr [eax+17C],dl
 00431C54    ret
>00431C55    jmp         @HandleFinally
>00431C5A    jmp         00431C48
 00431C5C    pop         ebx
 00431C5D    mov         esp,ebp
 00431C5F    pop         ebp
 00431C60    ret
*}
end;

//00431C64
function TImage.DoPaletteChange:Boolean;
begin
{*
 00431C64    push        ebx
 00431C65    push        esi
 00431C66    push        edi
 00431C67    push        ebp
 00431C68    mov         ebp,eax
 00431C6A    xor         ebx,ebx
 00431C6C    mov         eax,dword ptr [ebp+168]
 00431C72    mov         esi,dword ptr [eax+0C]
 00431C75    cmp         byte ptr [ebp+57],0
>00431C79    je          00431CF4
 00431C7B    test        byte ptr [ebp+1C],1
>00431C7F    jne         00431CF4
 00431C81    test        esi,esi
>00431C83    je          00431CF4
 00431C85    cmp         byte ptr [esi+22],0
>00431C89    je          00431CF4
 00431C8B    mov         eax,esi
 00431C8D    mov         edx,dword ptr [eax]
 00431C8F    call        dword ptr [edx+24]
 00431C92    test        eax,eax
>00431C94    jne         00431C9C
 00431C96    mov         byte ptr [esi+22],0
>00431C9A    jmp         00431CF4
 00431C9C    mov         eax,ebp
 00431C9E    call        GetParentForm
 00431CA3    mov         edi,eax
 00431CA5    test        edi,edi
>00431CA7    je          00431CF4
 00431CA9    cmp         byte ptr [edi+22E],0
>00431CB0    je          00431CF4
 00431CB2    mov         eax,edi
 00431CB4    call        TWinControl.HandleAllocated
 00431CB9    test        al,al
>00431CBB    je          00431CF4
 00431CBD    cmp         byte ptr [ebp+17C],0
>00431CC4    je          00431CD8
 00431CC6    push        0
 00431CC8    xor         ecx,ecx
 00431CCA    mov         edx,30F
 00431CCF    mov         eax,edi
 00431CD1    call        TControl.Perform
>00431CD6    jmp         00431CEE
 00431CD8    push        0
 00431CDA    push        0
 00431CDC    push        30F
 00431CE1    mov         eax,edi
 00431CE3    call        TWinControl.GetHandle
 00431CE8    push        eax
 00431CE9    call        user32.PostMessageA
 00431CEE    mov         bl,1
 00431CF0    mov         byte ptr [esi+22],0
 00431CF4    mov         eax,ebx
 00431CF6    pop         ebp
 00431CF7    pop         edi
 00431CF8    pop         esi
 00431CF9    pop         ebx
 00431CFA    ret
*}
end;

//00431CFC
procedure TImage.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);
begin
{*
 00431CFC    push        ebp
 00431CFD    mov         ebp,esp
 00431CFF    push        ecx
 00431D00    push        ebx
 00431D01    push        esi
 00431D02    push        edi
 00431D03    mov         byte ptr [ebp-1],cl
 00431D06    mov         edi,edx
 00431D08    mov         esi,eax
 00431D0A    mov         ebx,dword ptr [ebp+10]
 00431D0D    test        byte ptr [esi+17A],bl
>00431D13    je          00431D36
 00431D15    mov         eax,esi
 00431D17    call        TImage.DoPaletteChange
 00431D1C    test        al,al
>00431D1E    je          00431D2C
 00431D20    mov         eax,esi
 00431D22    mov         edx,dword ptr [eax]
 00431D24    call        dword ptr [edx+88]
>00431D2A    jmp         00431D36
 00431D2C    mov         eax,esi
 00431D2E    mov         edx,dword ptr [eax]
 00431D30    call        dword ptr [edx+8C]
 00431D36    cmp         word ptr [esi+172],0
>00431D3E    je          00431D5E
 00431D40    mov         al,byte ptr [ebp+14]
 00431D43    push        eax
 00431D44    push        ebx
 00431D45    mov         eax,dword ptr [ebp+0C]
 00431D48    push        eax
 00431D49    mov         eax,dword ptr [ebp+8]
 00431D4C    push        eax
 00431D4D    mov         cl,byte ptr [ebp-1]
 00431D50    mov         edx,edi
 00431D52    mov         eax,dword ptr [esi+174]
 00431D58    call        dword ptr [esi+170]
 00431D5E    pop         edi
 00431D5F    pop         esi
 00431D60    pop         ebx
 00431D61    pop         ecx
 00431D62    pop         ebp
 00431D63    ret         10
*}
end;

//00431D68
procedure TImage.SetCenter(Value:Boolean);
begin
{*
 00431D68    cmp         dl,byte ptr [eax+179]
>00431D6E    je          00431D7D
 00431D70    mov         byte ptr [eax+179],dl
 00431D76    mov         edx,eax
 00431D78    call        TImage.PictureChanged
 00431D7D    ret
*}
end;

//00431D80
procedure TImage.SetPicture(Value:TPicture);
begin
{*
 00431D80    push        esi
 00431D81    mov         esi,eax
 00431D83    mov         eax,dword ptr [esi+168]
 00431D89    mov         ecx,dword ptr [eax]
 00431D8B    call        dword ptr [ecx+8]
 00431D8E    pop         esi
 00431D8F    ret
*}
end;

//00431D90
procedure TImage.SetStretch(Value:Boolean);
begin
{*
 00431D90    cmp         dl,byte ptr [eax+178]
>00431D96    je          00431DA5
 00431D98    mov         byte ptr [eax+178],dl
 00431D9E    mov         edx,eax
 00431DA0    call        TImage.PictureChanged
 00431DA5    ret
*}
end;

//00431DA8
procedure TImage.SetTransparent(Value:Boolean);
begin
{*
 00431DA8    cmp         dl,byte ptr [eax+17B]
>00431DAE    je          00431DBD
 00431DB0    mov         byte ptr [eax+17B],dl
 00431DB6    mov         edx,eax
 00431DB8    call        TImage.PictureChanged
 00431DBD    ret
*}
end;

//00431DC0
procedure TImage.SetProportional(Value:Boolean);
begin
{*
 00431DC0    cmp         dl,byte ptr [eax+17D]
>00431DC6    je          00431DD5
 00431DC8    mov         byte ptr [eax+17D],dl
 00431DCE    mov         edx,eax
 00431DD0    call        TImage.PictureChanged
 00431DD5    ret
*}
end;

//00431DD8
procedure TImage.PictureChanged(Sender:TObject);
begin
{*
 00431DD8    push        ebx
 00431DD9    push        esi
 00431DDA    add         esp,0FFFFFFF0
 00431DDD    mov         ebx,eax
 00431DDF    cmp         byte ptr [ebx+5C],0
>00431DE3    je          00431E2B
 00431DE5    mov         eax,dword ptr [ebx+168]
 00431DEB    call        TPicture.GetWidth
 00431DF0    test        eax,eax
>00431DF2    jle         00431E2B
 00431DF4    mov         eax,dword ptr [ebx+168]
 00431DFA    call        TPicture.GetHeight
 00431DFF    test        eax,eax
>00431E01    jle         00431E2B
 00431E03    mov         eax,dword ptr [ebx+168]
 00431E09    call        TPicture.GetWidth
 00431E0E    push        eax
 00431E0F    mov         eax,dword ptr [ebx+168]
 00431E15    call        TPicture.GetHeight
 00431E1A    push        eax
 00431E1B    mov         ecx,dword ptr [ebx+44]
 00431E1E    mov         edx,dword ptr [ebx+40]
 00431E21    mov         eax,ebx
 00431E23    mov         esi,dword ptr [eax]
 00431E25    call        dword ptr [esi+84]
 00431E2B    mov         eax,dword ptr [ebx+168]
 00431E31    mov         esi,dword ptr [eax+0C]
 00431E34    test        esi,esi
>00431E36    je          00431ED8
 00431E3C    mov         eax,esi
 00431E3E    mov         edx,dword ptr ds:[424D78];TMetafile
 00431E44    call        @IsClass
 00431E49    test        al,al
>00431E4B    jne         00431E6B
 00431E4D    mov         eax,esi
 00431E4F    mov         edx,dword ptr ds:[424FFC];TIcon
 00431E55    call        @IsClass
 00431E5A    test        al,al
>00431E5C    jne         00431E6B
 00431E5E    mov         dl,byte ptr [ebx+17B]
 00431E64    mov         eax,esi
 00431E66    mov         ecx,dword ptr [eax]
 00431E68    call        dword ptr [ecx+3C]
 00431E6B    mov         edx,esp
 00431E6D    mov         eax,ebx
 00431E6F    call        TImage.DestRect
 00431E74    mov         eax,esi
 00431E76    mov         edx,dword ptr [eax]
 00431E78    call        dword ptr [edx+28]
 00431E7B    test        al,al
>00431E7D    jne         00431EAB
 00431E7F    cmp         dword ptr [esp],0
>00431E83    jg          00431EAB
 00431E85    cmp         dword ptr [esp+4],0
>00431E8A    jg          00431EAB
 00431E8C    mov         eax,dword ptr [esp+8]
 00431E90    cmp         eax,dword ptr [ebx+48]
>00431E93    jl          00431EAB
 00431E95    mov         eax,dword ptr [esp+0C]
 00431E99    cmp         eax,dword ptr [ebx+4C]
>00431E9C    jl          00431EAB
 00431E9E    mov         eax,[00431EFC]
 00431EA3    or          eax,dword ptr [ebx+50]
 00431EA6    mov         dword ptr [ebx+50],eax
>00431EA9    jmp         00431EB8
 00431EAB    mov         eax,[00431EFC]
 00431EB0    not         eax
 00431EB2    and         eax,dword ptr [ebx+50]
 00431EB5    mov         dword ptr [ebx+50],eax
 00431EB8    mov         eax,ebx
 00431EBA    call        TImage.DoPaletteChange
 00431EBF    test        al,al
>00431EC1    je          00431EE5
 00431EC3    cmp         byte ptr [ebx+17C],0
>00431ECA    je          00431EE5
 00431ECC    mov         eax,ebx
 00431ECE    mov         edx,dword ptr [eax]
 00431ED0    call        dword ptr [edx+88]
>00431ED6    jmp         00431EE5
 00431ED8    mov         eax,[00431EFC]
 00431EDD    not         eax
 00431EDF    and         eax,dword ptr [ebx+50]
 00431EE2    mov         dword ptr [ebx+50],eax
 00431EE5    cmp         byte ptr [ebx+17C],0
>00431EEC    jne         00431EF5
 00431EEE    mov         eax,ebx
 00431EF0    mov         edx,dword ptr [eax]
 00431EF2    call        dword ptr [edx+7C]
 00431EF5    add         esp,10
 00431EF8    pop         esi
 00431EF9    pop         ebx
 00431EFA    ret
*}
end;

//00431F00
function TImage.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 00431F00    push        ebx
 00431F01    push        esi
 00431F02    push        edi
 00431F03    push        ebp
 00431F04    mov         ebp,ecx
 00431F06    mov         edi,edx
 00431F08    mov         esi,eax
 00431F0A    mov         bl,1
 00431F0C    test        byte ptr [esi+1C],10
>00431F10    je          00431F30
 00431F12    mov         eax,dword ptr [esi+168]
 00431F18    call        TPicture.GetWidth
 00431F1D    test        eax,eax
>00431F1F    jle         00431F5F
 00431F21    mov         eax,dword ptr [esi+168]
 00431F27    call        TPicture.GetHeight
 00431F2C    test        eax,eax
>00431F2E    jle         00431F5F
 00431F30    mov         al,byte ptr [esi+5B]
 00431F33    test        al,al
>00431F35    je          00431F3D
 00431F37    add         al,0FD
 00431F39    sub         al,2
>00431F3B    jae         00431F4A
 00431F3D    mov         eax,dword ptr [esi+168]
 00431F43    call        TPicture.GetWidth
 00431F48    mov         dword ptr [edi],eax
 00431F4A    mov         al,byte ptr [esi+5B]
 00431F4D    sub         al,3
>00431F4F    jae         00431F5F
 00431F51    mov         eax,dword ptr [esi+168]
 00431F57    call        TPicture.GetHeight
 00431F5C    mov         dword ptr [ebp],eax
 00431F5F    mov         eax,ebx
 00431F61    pop         ebp
 00431F62    pop         edi
 00431F63    pop         esi
 00431F64    pop         ebx
 00431F65    ret
*}
end;

//00431F68
constructor TTimer.Create(AOwner:TComponent);
begin
{*
 00431F68    push        ebx
 00431F69    push        esi
 00431F6A    test        dl,dl
>00431F6C    je          00431F76
 00431F6E    add         esp,0FFFFFFF0
 00431F71    call        @ClassCreate
 00431F76    mov         ebx,edx
 00431F78    mov         esi,eax
 00431F7A    xor         edx,edx
 00431F7C    mov         eax,esi
 00431F7E    call        TComponent.Create
 00431F83    mov         byte ptr [esi+40],1
 00431F87    mov         dword ptr [esi+30],3E8
 00431F8E    push        esi
 00431F8F    push        431FF0;TTimer.WndProc
 00431F94    call        AllocateHWnd
 00431F99    mov         dword ptr [esi+34],eax
 00431F9C    mov         eax,esi
 00431F9E    test        bl,bl
>00431FA0    je          00431FB1
 00431FA2    call        @AfterConstruction
 00431FA7    pop         dword ptr fs:[0]
 00431FAE    add         esp,0C
 00431FB1    mov         eax,esi
 00431FB3    pop         esi
 00431FB4    pop         ebx
 00431FB5    ret
*}
end;

//00431FB8
destructor TTimer.Destroy;
begin
{*
 00431FB8    push        ebx
 00431FB9    push        esi
 00431FBA    call        @BeforeDestruction
 00431FBF    mov         ebx,edx
 00431FC1    mov         esi,eax
 00431FC3    mov         byte ptr [esi+40],0
 00431FC7    mov         eax,esi
 00431FC9    call        TTimer.UpdateTimer
 00431FCE    mov         eax,dword ptr [esi+34]
 00431FD1    call        DeallocateHWnd
 00431FD6    mov         edx,ebx
 00431FD8    and         dl,0FC
 00431FDB    mov         eax,esi
 00431FDD    call        TComponent.Destroy
 00431FE2    test        bl,bl
>00431FE4    jle         00431FED
 00431FE6    mov         eax,esi
 00431FE8    call        @ClassDestroy
 00431FED    pop         esi
 00431FEE    pop         ebx
 00431FEF    ret
*}
end;

//00431FF0
procedure TTimer.WndProc(var Msg:TMessage);
begin
{*
 00431FF0    push        ebp
 00431FF1    mov         ebp,esp
 00431FF3    push        ecx
 00431FF4    push        ebx
 00431FF5    push        esi
 00431FF6    push        edi
 00431FF7    mov         ebx,edx
 00431FF9    mov         dword ptr [ebp-4],eax
 00431FFC    mov         esi,dword ptr [ebx]
 00431FFE    cmp         esi,113
>00432004    jne         00432045
 00432006    xor         eax,eax
 00432008    push        ebp
 00432009    push        43202A
 0043200E    push        dword ptr fs:[eax]
 00432011    mov         dword ptr fs:[eax],esp
 00432014    mov         eax,dword ptr [ebp-4]
 00432017    mov         si,0FFEF
 0043201B    call        @CallDynaInst
 00432020    xor         eax,eax
 00432022    pop         edx
 00432023    pop         ecx
 00432024    pop         ecx
 00432025    mov         dword ptr fs:[eax],edx
>00432028    jmp         0043205D
>0043202A    jmp         @HandleAnyException
 0043202F    mov         eax,[005AE584];^Application:TApplication
 00432034    mov         eax,dword ptr [eax]
 00432036    mov         edx,dword ptr [ebp-4]
 00432039    call        TApplication.HandleException
 0043203E    call        @DoneExcept
>00432043    jmp         0043205D
 00432045    mov         eax,dword ptr [ebx+8]
 00432048    push        eax
 00432049    mov         eax,dword ptr [ebx+4]
 0043204C    push        eax
 0043204D    push        esi
 0043204E    mov         eax,dword ptr [ebp-4]
 00432051    mov         eax,dword ptr [eax+34]
 00432054    push        eax
 00432055    call        user32.DefWindowProcA
 0043205A    mov         dword ptr [ebx+0C],eax
 0043205D    pop         edi
 0043205E    pop         esi
 0043205F    pop         ebx
 00432060    pop         ecx
 00432061    pop         ebp
 00432062    ret
*}
end;

//00432064
procedure TTimer.UpdateTimer;
begin
{*
 00432064    push        ebp
 00432065    mov         ebp,esp
 00432067    push        0
 00432069    push        ebx
 0043206A    push        esi
 0043206B    mov         ebx,eax
 0043206D    xor         eax,eax
 0043206F    push        ebp
 00432070    push        4320E3
 00432075    push        dword ptr fs:[eax]
 00432078    mov         dword ptr fs:[eax],esp
 0043207B    push        1
 0043207D    mov         eax,dword ptr [ebx+34]
 00432080    push        eax
 00432081    call        user32.KillTimer
 00432086    mov         esi,dword ptr [ebx+30]
 00432089    test        esi,esi
>0043208B    je          004320CD
 0043208D    cmp         byte ptr [ebx+40],0
>00432091    je          004320CD
 00432093    cmp         word ptr [ebx+3A],0
>00432098    je          004320CD
 0043209A    push        0
 0043209C    push        esi
 0043209D    push        1
 0043209F    mov         eax,dword ptr [ebx+34]
 004320A2    push        eax
 004320A3    call        user32.SetTimer
 004320A8    test        eax,eax
>004320AA    jne         004320CD
 004320AC    lea         edx,[ebp-4]
 004320AF    mov         eax,[005AE7D8];^SNoTimers:TResStringRec
 004320B4    call        LoadStr
 004320B9    mov         ecx,dword ptr [ebp-4]
 004320BC    mov         dl,1
 004320BE    mov         eax,[00417C30];EOutOfResources
 004320C3    call        Exception.Create
 004320C8    call        @RaiseExcept
 004320CD    xor         eax,eax
 004320CF    pop         edx
 004320D0    pop         ecx
 004320D1    pop         ecx
 004320D2    mov         dword ptr fs:[eax],edx
 004320D5    push        4320EA
 004320DA    lea         eax,[ebp-4]
 004320DD    call        @LStrClr
 004320E2    ret
>004320E3    jmp         @HandleFinally
>004320E8    jmp         004320DA
 004320EA    pop         esi
 004320EB    pop         ebx
 004320EC    pop         ecx
 004320ED    pop         ebp
 004320EE    ret
*}
end;

//004320F0
procedure TTimer.SetEnabled(Value:Boolean);
begin
{*
 004320F0    cmp         dl,byte ptr [eax+40]
>004320F3    je          004320FD
 004320F5    mov         byte ptr [eax+40],dl
 004320F8    call        TTimer.UpdateTimer
 004320FD    ret
*}
end;

//00432100
procedure TTimer.SetInterval(Value:Cardinal);
begin
{*
 00432100    cmp         edx,dword ptr [eax+30]
>00432103    je          0043210D
 00432105    mov         dword ptr [eax+30],edx
 00432108    call        TTimer.UpdateTimer
 0043210D    ret
*}
end;

//00432110
procedure TTimer.SetOnTimer(Value:TNotifyEvent);
begin
{*
 00432110    push        ebp
 00432111    mov         ebp,esp
 00432113    mov         edx,dword ptr [ebp+8]
 00432116    mov         dword ptr [eax+38],edx
 00432119    mov         edx,dword ptr [ebp+0C]
 0043211C    mov         dword ptr [eax+3C],edx
 0043211F    call        TTimer.UpdateTimer
 00432124    pop         ebp
 00432125    ret         8
*}
end;

//00432128
procedure TTimer.Timer;
begin
{*
 00432128    push        ebx
 00432129    cmp         word ptr [eax+3A],0
>0043212E    je          0043213A
 00432130    mov         ebx,eax
 00432132    mov         edx,eax
 00432134    mov         eax,dword ptr [ebx+3C]
 00432137    call        dword ptr [ebx+38]
 0043213A    pop         ebx
 0043213B    ret
*}
end;

//004322B4
procedure _NF__82C;
begin
{*
 004322B4    das
 004322B5    add         byte ptr [eax],al
 004322B7    add         byte ptr [edx+ecx*8+22AC005A],al
 004322BE    inc         ebx
 004322BF    add         byte ptr [edx+ecx*8+5A],bh
 004322C3    add         byte ptr [edx-358BFFBD],ah
 004322CA    pop         edx
 004322CB    add         byte ptr [edx-3593FFBD],bl
 004322D2    pop         edx
 004322D3    add         byte ptr [edx-359BFFBD],dl
 004322DA    pop         edx
 004322DB    add         byte ptr [edx-35A3FFBD],cl
 004322E2    pop         edx
 004322E3    add         byte ptr [edx-35ABFFBD],al
 004322EA    pop         edx
 004322EB    add         byte ptr [edx+43],bh
 004322EF    add         byte ptr [edx+ecx*8+5A],cl
 004322F3    add         byte ptr [edx+43],dh
 004322F7    add         byte ptr [edx+ecx*8+5A],al
 004322FB    add         byte ptr [edx+43],ch
 004322FF    add         byte ptr [edx+ecx*8],bh
 00432302    pop         edx
 00432303    add         byte ptr [edx+43],ah
 00432307    add         byte ptr [edx+ecx*8],dh
 0043230A    pop         edx
 0043230B    add         byte ptr [edx+43],bl
 0043230F    add         byte ptr [edx+ecx*8],ch
 00432312    pop         edx
 00432313    add         byte ptr [edx+43],dl
 00432317    add         byte ptr [edx+ecx*8],ah
 0043231A    pop         edx
 0043231B    add         byte ptr [edx+43],cl
 0043231F    add         byte ptr [edx+ecx*8],bl
 00432322    pop         edx
 00432323    add         byte ptr [edx+43],al
 00432327    add         byte ptr [edx+ecx*8],dl
 0043232A    pop         edx
 0043232B    add         byte ptr [edx],bh
 0043232E    inc         ebx
 0043232F    add         byte ptr [edx+ecx*8],cl
 00432332    pop         edx
 00432333    add         byte ptr [edx],dh
 00432336    inc         ebx
 00432337    add         byte ptr [edx+ecx*8],al
 0043233A    pop         edx
 0043233B    add         byte ptr [edx],ch
 0043233E    inc         ebx
 0043233F    add         ah,bh
 00432341    leave
 00432342    pop         edx
 00432343    add         byte ptr [edx],ah
 00432346    inc         ebx
 00432347    add         ah,dh
 00432349    leave
 0043234A    pop         edx
 0043234B    add         byte ptr [edx],bl
 0043234E    inc         ebx
 0043234F    add         ah,ch
 00432351    leave
 00432352    pop         edx
 00432353    add         byte ptr [edx],dl
 00432356    inc         ebx
 00432357    add         ah,ah
 00432359    leave
 0043235A    pop         edx
 0043235B    add         byte ptr [edx],cl
 0043235E    inc         ebx
 0043235F    add         ah,bl
 00432361    leave
 00432362    pop         edx
 00432363    add         byte ptr [edx],al
 00432366    inc         ebx
 00432367    add         ah,dl
 00432369    leave
 0043236A    pop         edx
 0043236B    add         ah,bh
 0043236D    and         dword ptr [ebx],eax
 00432370    int         3
 00432371    leave
 00432372    pop         edx
 00432373    add         ah,dh
 00432375    and         dword ptr [ebx],eax
 00432378    ???
 00432379    leave
 0043237A    pop         edx
 0043237B    add         ah,ch
 0043237D    and         dword ptr [ebx],eax
 00432380    mov         esp,0E4005AC9
 00432385    and         dword ptr [ebx],eax
 00432388    mov         ah,0C9
 0043238A    pop         edx
 0043238B    add         ah,bl
 0043238D    and         dword ptr [ebx],eax
 00432390    lods        byte ptr [esi]
 00432391    leave
 00432392    pop         edx
 00432393    add         ah,dl
 00432395    and         dword ptr [ebx],eax
 00432398    movs        byte ptr [edi],byte ptr [esi]
 00432399    leave
 0043239A    pop         edx
 0043239B    add         ah,cl
 0043239D    and         dword ptr [ebx],eax
 004323A0    pushfd
 004323A1    leave
 004323A2    pop         edx
 004323A3    add         ah,al
 004323A5    and         dword ptr [ebx],eax
 004323A8    xchg        eax,esp
 004323A9    leave
 004323AA    pop         edx
 004323AB    add         byte ptr [ecx-3673FFBD],bh
 004323B2    pop         edx
 004323B3    add         byte ptr [ecx-367BFFBD],dh
 004323BA    pop         edx
 004323BB    add         byte ptr [ecx-3683FFBD],ch
 004323C2    pop         edx
 004323C3    add         byte ptr [ecx-368BFFBD],ah
 004323CA    pop         edx
 004323CB    add         byte ptr [ecx-3693FFBD],bl
 004323D2    pop         edx
 004323D3    add         byte ptr [ecx-369BFFBD],dl
 004323DA    pop         edx
 004323DB    add         byte ptr [ecx-36A3FFBD],cl
 004323E2    pop         edx
 004323E3    add         byte ptr [ecx-36ABFFBD],al
 004323EA    pop         edx
 004323EB    add         byte ptr [ecx+43],bh
 004323EF    add         byte ptr [ecx+ecx*8+5A],cl
 004323F3    add         byte ptr [ecx+43],dh
 004323F7    add         byte ptr [ecx+ecx*8+5A],al
 004323FB    add         byte ptr [ecx+43],ch
 004323FF    add         byte ptr [ecx+ecx*8],bh
 00432402    pop         edx
 00432403    add         byte ptr [ecx+43],ah
 00432407    add         byte ptr [ecx+ecx*8],dh
 0043240A    pop         edx
 0043240B    add         byte ptr [ecx+43],bl
 0043240F    add         byte ptr [ecx+ecx*8],ch
 00432412    pop         edx
 00432413    add         byte ptr [ecx+43],dl
 00432417    add         byte ptr [ecx+ecx*8],ah
 0043241A    pop         edx
 0043241B    add         byte ptr [ecx+43],cl
 0043241F    add         byte ptr [ecx+ecx*8],bl
 00432422    pop         edx
 00432423    add         byte ptr [ecx+43],al
 00432427    add         byte ptr [ecx+ecx*8],dl
 0043242A    pop         edx
 0043242B    add         byte ptr [ecx],bh
 0043242E    inc         ebx
 0043242F    add         byte ptr [ebp-75],dl;{Finalization}
*}
end;

Initialization
//00432478
{*
 00432478    sub         dword ptr ds:[5E0B70],1
>0043247F    jae         004324A5
 00432481    mov         eax,4322B4;_NF__82C
 00432486    call        @InitResStrings
 0043248B    mov         eax,[00437BA4];TControl
 00432490    call        StartClassGroup
 00432495    mov         edx,dword ptr ds:[437BA4];TControl
 0043249B    mov         eax,[00431880];TTimer
 004324A0    call        GroupDescendentsWith
 004324A5    ret
*}
Finalization
//00432430
{*
 00432430    push        ebp
 00432431    mov         ebp,esp
 00432433    xor         eax,eax
 00432435    push        ebp
 00432436    push        43246C
 0043243B    push        dword ptr fs:[eax]
 0043243E    mov         dword ptr fs:[eax],esp
 00432441    inc         dword ptr ds:[5E0B70]
>00432447    jne         0043245E
 00432449    mov         eax,5AC910
 0043244E    mov         ecx,2F
 00432453    mov         edx,dword ptr ds:[418F20];TIdentMapEntry
 00432459    call        @FinalizeArray
 0043245E    xor         eax,eax
 00432460    pop         edx
 00432461    pop         ecx
 00432462    pop         ecx
 00432463    mov         dword ptr fs:[eax],edx
 00432466    push        432473
 0043246B    ret
>0043246C    jmp         @HandleFinally
>00432471    jmp         0043246B
 00432473    pop         ebp
 00432474    ret
*}
end.