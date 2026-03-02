//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Themes;

interface

uses
  SysUtils, Classes;

type
  TThemeServices = class(TObject)
  public
    FNewComCtrls:Boolean;//f4
    FThemesAvailable:Boolean;//f5
    FUseThemes:Boolean;//f6
    FThemeData:TThemeData;//f8
    FOnThemeChange:TNotifyEvent;//f68
    destructor Destroy; virtual;//004337D8
    procedure DoOnThemeChange; virtual;//v0//00433864
    constructor Create; virtual;//v4//0043378C
    function GetTheme(Element:TThemedElement):HTHEME;//0043380C
    function GetThemesEnabled:Boolean;//0043384C
    procedure UnloadThemeData;//00433878
    procedure ApplyThemeChange;//004338A8
    procedure DrawEdge(DC:HDC; Details:TThemedElementDetails; const R:TRect; Edge:Cardinal; Flags:Cardinal; ContentRect:PRect);//004338BC
    procedure DrawElement(DC:HDC; Details:TThemedElementDetails; const R:TRect; ClipRect:PRect);//00433908
    procedure DrawParentBackground(Window:HWND; Target:HDC; Details:PThemedElementDetails; OnlyIfTransparent:Boolean; Bounds:PRect);//0043394C
    function GetElementDetails(Detail:TThemedEdit):TThemedElementDetails;//004339B4
    function GetElementDetails(Detail:TThemedWindow):TThemedElementDetails;//004339F0
    procedure PaintBorder(Control:TWinControl; EraseLRCorner:Boolean);//00433D7C
    procedure UpdateThemes;//00433EE8
  end;
    procedure _NF__337;//004335D8
    function ThemeServices:TThemeServices;//0043376C
    constructor Create;//0043378C
    destructor Destroy;//004337D8
    procedure DoOnThemeChange;//00433864

implementation

//004335D8
procedure _NF__337;
begin
{*
 004335D8    bound       eax,qword ptr [eax]
>004335DA    jne         004335DC
>004335DC    je          004335DE
>004335DE    je          004335E0
 004335E0    outs        dl,dword ptr [esi]
 004335E1    add         byte ptr [esi],ch
 004335E4    add         byte ptr [eax],al
 004335E6    add         byte ptr [eax],al
 004335E8    arpl        word ptr [eax],ax
 004335EA    ins         byte ptr [edi],dl
 004335EB    add         byte ptr [edi],ch
 004335EE    arpl        word ptr [eax],ax
 004335F0    imul        eax,dword ptr [eax],0
 004335F3    add         byte ptr [ebx],ah
 004335F6    outs        dl,dword ptr [esi]
 004335F7    add         byte ptr [ebp],ch
 004335FA    bound       eax,qword ptr [eax]
 004335FC    outs        dl,dword ptr [esi]
 004335FD    add         byte ptr [edx],ah
 00433600    outs        dl,dword ptr [esi]
 00433601    add         byte ptr [eax],bh
 00433604    add         byte ptr [eax],al
 00433606    add         byte ptr [eax],al
 00433608    add         byte ptr gs:[eax+eax+69],ah
 0043360D    add         byte ptr [eax+eax],dh
 00433611    add         byte ptr [eax],al
 00433613    add         byte ptr [ebp],ah
>00433616    js          00433618
>00433618    jo          0043361A
 0043361A    ins         byte ptr [edi],dl
 0043361B    add         byte ptr [edi],ch
>0043361E    jb          00433620
 00433620    add         byte ptr gs:[edx],dh
 00433624    bound       eax,qword ptr [eax]
 00433626    popad
 00433627    add         byte ptr [edx],dh
 0043362A    add         byte ptr [eax],al
 0043362C    push        61006500
 00433631    add         byte ptr [eax+eax+65],ah
 00433635    add         byte ptr [edx],dh
 00433638    add         byte ptr [eax],al
 0043363A    add         byte ptr [eax],al
 0043363C    ins         byte ptr [edi],dl
 0043363D    add         byte ptr [ecx],ch
>00433640    jae         00433642
>00433642    je          00433644
>00433644    jbe         00433646
 00433646    imul        eax,dword ptr [eax],770065
 0043364C    add         byte ptr [eax],al
 0043364E    add         byte ptr [eax],al
 00433650    ins         dword ptr [edi],dl
 00433651    add         byte ptr [ebp],ah
 00433654    outs        dl,byte ptr [esi]
 00433655    add         byte ptr [ebp],dh
 00433658    add         byte ptr [eax],al
 0043365A    add         byte ptr [eax],al
>0043365C    jo          0043365E
 0043365E    popad
 0043365F    add         byte ptr [edi],ah
 00433662    add         byte ptr gs:[eax],al
 00433665    add         byte ptr [eax],al
 00433667    add         byte ptr [eax],dh
>0043366A    jb          0043366C
 0043366C    outs        dl,dword ptr [esi]
 0043366D    add         byte ptr [edi],ah
>00433670    jb          00433672
 00433672    add         byte ptr gs:[ebx],dh
>00433676    jae         00433678
 00433678    add         byte ptr [eax],al
 0043367A    add         byte ptr [eax],al
>0043367C    jb          0043367E
 0043367E    add         byte ptr gs:[edx],ah
 00433682    popad
 00433683    add         byte ptr [edx],dh
 00433686    add         byte ptr [eax],al
>00433688    jae         0043368A
 0043368A    arpl        word ptr [eax],ax
>0043368C    jb          0043368E
 0043368E    outs        dl,dword ptr [esi]
 0043368F    add         byte ptr [eax+eax+6C],ch
 00433693    add         byte ptr [edx],ah
 00433696    popad
 00433697    add         byte ptr [edx],dh
 0043369A    add         byte ptr [eax],al
>0043369C    jae         0043369E
>0043369E    jo          004336A0
 004336A0    imul        eax,dword ptr [eax],6E
 004336A6    add         byte ptr [eax],al
>004336A8    jae         004336AA
>004336AA    je          004336AC
 004336AC    popad
 004336AD    add         byte ptr [edx],dh
>004336B0    je          004336B2
>004336B2    jo          004336B4
 004336B4    popad
 004336B5    add         byte ptr [esi],ch
 004336B8    add         byte ptr gs:[eax+eax],ch
 004336BD    add         byte ptr [eax],al
 004336BF    add         byte ptr [ebx],dh
>004336C2    je          004336C4
 004336C4    popad
 004336C5    add         byte ptr [eax+eax+75],dh
 004336C9    add         byte ptr [ebx],dh
 004336CC    add         byte ptr [eax],al
 004336CE    add         byte ptr [eax],al
>004336D0    je          004336D2
 004336D2    popad
 004336D3    add         byte ptr [edx],ah
 004336D6    add         byte ptr [eax],al
>004336D8    je          004336DA
 004336DA    popad
 004336DB    add         byte ptr [ebx],dh
 004336DE    imul        eax,dword ptr [eax],62
 004336E1    add         byte ptr [ecx],ah
 004336E4    outs        dl,byte ptr [esi]
 004336E5    add         byte ptr [eax+eax],ah
 004336E9    add         byte ptr [eax],al
 004336EB    add         byte ptr [eax+eax+61],dh
 004336EF    add         byte ptr [ebx],dh
 004336F2    imul        eax,dword ptr [eax],62
 004336F5    add         byte ptr [ecx],ah
>004336F8    jb          004336FA
 004336FA    add         byte ptr [eax],al
>004336FC    je          004336FE
 004336FE    outs        dl,dword ptr [esi]
 004336FF    add         byte ptr [edi],ch
 00433702    ins         byte ptr [edi],dl
 00433703    add         byte ptr [edx],ah
 00433706    popad
 00433707    add         byte ptr [edx],dh
 0043370A    add         byte ptr [eax],al
>0043370C    je          0043370E
 0043370E    outs        dl,dword ptr [esi]
 0043370F    add         byte ptr [edi],ch
 00433712    ins         byte ptr [edi],dl
 00433713    add         byte ptr [eax+eax+69],dh
 00433717    add         byte ptr [eax],dh
 0043371A    add         byte ptr [eax],al
>0043371C    je          0043371E
>0043371E    jb          00433720
 00433720    popad
 00433721    add         byte ptr [ebx],ah
 00433724    imul        eax,dword ptr [eax],62
 00433727    add         byte ptr [ecx],ah
>0043372A    jb          0043372C
 0043372C    add         byte ptr [eax],al
 0043372E    add         byte ptr [eax],al
>00433730    je          00433732
>00433732    jb          00433734
 00433734    popad
 00433735    add         byte ptr [ecx],bh
 00433738    outs        dl,byte ptr [esi]
 00433739    add         byte ptr [edi],ch
>0043373C    je          0043373E
 0043373E    imul        eax,dword ptr [eax],790066
 00433744    add         byte ptr [eax],al
 00433746    add         byte ptr [eax],al
>00433748    je          0043374A
>0043374A    jb          0043374C
 0043374C    add         byte ptr gs:[ebp],ah
>00433750    jbe         00433752
 00433752    imul        eax,dword ptr [eax],770065
 00433758    add         byte ptr [eax],al
 0043375A    add         byte ptr [eax],al
>0043375C    ja          0043375E
 0043375E    imul        eax,dword ptr [eax],64006E
 00433764    outs        dl,dword ptr [esi]
 00433765    add         byte ptr [edi],dh
 00433768    add         byte ptr [eax],al
 0043376A    add         byte ptr [eax],al
*}
end;

//0043376C
function ThemeServices:TThemeServices;
begin
{*
 0043376C    cmp         dword ptr ds:[5E0BEC],0;InternalServices:TThemeServices
>00433773    jne         00433784
 00433775    mov         dl,1
 00433777    mov         eax,[005ACAE4]
 0043377C    call        dword ptr [eax+4]
 0043377F    mov         [005E0BEC],eax;InternalServices:TThemeServices
 00433784    mov         eax,[005E0BEC];InternalServices:TThemeServices
 00433789    ret
*}
end;

//0043378C
constructor TThemeServices.Create;
begin
{*
 0043378C    push        ebx
 0043378D    push        esi
 0043378E    test        dl,dl
>00433790    je          0043379A
 00433792    add         esp,0FFFFFFF0
 00433795    call        @ClassCreate
 0043379A    mov         ebx,edx
 0043379C    mov         esi,eax
 0043379E    call        InitThemeLibrary
 004337A3    mov         byte ptr [esi+5],al
 004337A6    call        GetComCtlVersion
 004337AB    cmp         eax,60000
 004337B0    setge       al
 004337B3    mov         byte ptr [esi+4],al
 004337B6    mov         eax,esi
 004337B8    call        TThemeServices.UpdateThemes
 004337BD    mov         eax,esi
 004337BF    test        bl,bl
>004337C1    je          004337D2
 004337C3    call        @AfterConstruction
 004337C8    pop         dword ptr fs:[0]
 004337CF    add         esp,0C
 004337D2    mov         eax,esi
 004337D4    pop         esi
 004337D5    pop         ebx
 004337D6    ret
*}
end;

//004337D8
destructor TThemeServices.Destroy;
begin
{*
 004337D8    push        ebx
 004337D9    push        esi
 004337DA    call        @BeforeDestruction
 004337DF    mov         ebx,edx
 004337E1    mov         esi,eax
 004337E3    mov         eax,esi
 004337E5    call        TThemeServices.UnloadThemeData
 004337EA    call        FreeThemeLibrary
 004337EF    mov         edx,ebx
 004337F1    and         dl,0FC
 004337F4    mov         eax,esi
 004337F6    call        TObject.Destroy
 004337FB    test        bl,bl
>004337FD    jle         00433806
 004337FF    mov         eax,esi
 00433801    call        @ClassDestroy
 00433806    pop         esi
 00433807    pop         ebx
 00433808    ret
*}
end;

//0043380C
function TThemeServices.GetTheme(Element:TThemedElement):HTHEME;
begin
{*
 0043380C    push        ebx
 0043380D    push        esi
 0043380E    push        edi
 0043380F    mov         ebx,edx
 00433811    mov         esi,eax
 00433813    cmp         byte ptr [esi+6],0
>00433817    je          00433840
 00433819    xor         eax,eax
 0043381B    mov         al,bl
 0043381D    cmp         dword ptr [esi+eax*4+8],0
>00433822    jne         00433840
 00433824    mov         edi,ebx
 00433826    and         edi,7F
 00433829    mov         eax,dword ptr [edi*4+5ACAEC];^_NF__337
 00433830    push        eax
 00433831    push        0
 00433833    mov         eax,[005AE2B0];^OpenThemeData:function(val hwnd:Windows.HWND;val pszClassList:Windows.LP...
 00433838    mov         eax,dword ptr [eax]
 0043383A    call        eax
 0043383C    mov         dword ptr [esi+edi*4+8],eax
 00433840    xor         eax,eax
 00433842    mov         al,bl
 00433844    mov         eax,dword ptr [esi+eax*4+8]
 00433848    pop         edi
 00433849    pop         esi
 0043384A    pop         ebx
 0043384B    ret
*}
end;

//0043384C
function TThemeServices.GetThemesEnabled:Boolean;
begin
{*
 0043384C    cmp         byte ptr [eax+5],0
>00433850    je          0043385E
 00433852    cmp         byte ptr [eax+6],0
>00433856    je          0043385E
 00433858    cmp         byte ptr [eax+4],0
>0043385C    jne         00433861
 0043385E    xor         eax,eax
 00433860    ret
 00433861    mov         al,1
 00433863    ret
*}
end;

//00433864
procedure TThemeServices.DoOnThemeChange;
begin
{*
 00433864    push        ebx
 00433865    cmp         word ptr [eax+6A],0
>0043386A    je          00433876
 0043386C    mov         ebx,eax
 0043386E    mov         edx,eax
 00433870    mov         eax,dword ptr [ebx+6C]
 00433873    call        dword ptr [ebx+68]
 00433876    pop         ebx
 00433877    ret
*}
end;

//00433878
procedure TThemeServices.UnloadThemeData;
begin
{*
 00433878    push        ebx
 00433879    push        esi
 0043387A    push        edi
 0043387B    mov         esi,eax
 0043387D    xor         ebx,ebx
 0043387F    mov         edi,ebx
 00433881    and         edi,7F
 00433884    mov         eax,dword ptr [esi+edi*4+8]
 00433888    test        eax,eax
>0043388A    je          0043389C
 0043388C    push        eax
 0043388D    mov         eax,[005AE460];^CloseThemeData:function(val hTheme:Windows.THandle):System.HRESULT stdca...
 00433892    mov         eax,dword ptr [eax]
 00433894    call        eax
 00433896    xor         eax,eax
 00433898    mov         dword ptr [esi+edi*4+8],eax
 0043389C    inc         ebx
 0043389D    cmp         bl,18
>004338A0    jne         0043387F
 004338A2    pop         edi
 004338A3    pop         esi
 004338A4    pop         ebx
 004338A5    ret
*}
end;

//004338A8
procedure TThemeServices.ApplyThemeChange;
begin
{*
 004338A8    push        ebx
 004338A9    mov         ebx,eax
 004338AB    mov         eax,ebx
 004338AD    call        TThemeServices.UpdateThemes
 004338B2    mov         eax,ebx
 004338B4    mov         edx,dword ptr [eax]
 004338B6    call        dword ptr [edx]
 004338B8    pop         ebx
 004338B9    ret
*}
end;

//004338BC
procedure TThemeServices.DrawEdge(DC:HDC; Details:TThemedElementDetails; const R:TRect; Edge:Cardinal; Flags:Cardinal; ContentRect:PRect);
begin
{*
 004338BC    push        ebp
 004338BD    mov         ebp,esp
 004338BF    add         esp,0FFFFFFF4
 004338C2    push        ebx
 004338C3    push        esi
 004338C4    push        edi
 004338C5    mov         esi,ecx
 004338C7    lea         edi,[ebp-0C]
 004338CA    movs        dword ptr [edi],dword ptr [esi]
 004338CB    movs        dword ptr [edi],dword ptr [esi]
 004338CC    movs        dword ptr [edi],dword ptr [esi]
 004338CD    mov         esi,edx
 004338CF    mov         ebx,eax
 004338D1    mov         eax,dword ptr [ebp+8]
 004338D4    push        eax
 004338D5    mov         eax,dword ptr [ebp+0C]
 004338D8    push        eax
 004338D9    mov         eax,dword ptr [ebp+10]
 004338DC    push        eax
 004338DD    mov         eax,dword ptr [ebp+14]
 004338E0    push        eax
 004338E1    mov         eax,dword ptr [ebp-4]
 004338E4    push        eax
 004338E5    mov         eax,dword ptr [ebp-8]
 004338E8    push        eax
 004338E9    push        esi
 004338EA    mov         dl,byte ptr [ebp-0C]
 004338ED    mov         eax,ebx
 004338EF    call        TThemeServices.GetTheme
 004338F4    push        eax
 004338F5    mov         eax,[005AE4AC];^DrawThemeEdge:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;va...
 004338FA    mov         eax,dword ptr [eax]
 004338FC    call        eax
 004338FE    pop         edi
 004338FF    pop         esi
 00433900    pop         ebx
 00433901    mov         esp,ebp
 00433903    pop         ebp
 00433904    ret         10
*}
end;

//00433908
procedure TThemeServices.DrawElement(DC:HDC; Details:TThemedElementDetails; const R:TRect; ClipRect:PRect);
begin
{*
 00433908    push        ebp
 00433909    mov         ebp,esp
 0043390B    add         esp,0FFFFFFF4
 0043390E    push        ebx
 0043390F    push        esi
 00433910    push        edi
 00433911    mov         esi,ecx
 00433913    lea         edi,[ebp-0C]
 00433916    movs        dword ptr [edi],dword ptr [esi]
 00433917    movs        dword ptr [edi],dword ptr [esi]
 00433918    movs        dword ptr [edi],dword ptr [esi]
 00433919    mov         esi,edx
 0043391B    mov         ebx,eax
 0043391D    mov         eax,dword ptr [ebp+8]
 00433920    push        eax
 00433921    mov         eax,dword ptr [ebp+0C]
 00433924    push        eax
 00433925    mov         eax,dword ptr [ebp-4]
 00433928    push        eax
 00433929    mov         eax,dword ptr [ebp-8]
 0043392C    push        eax
 0043392D    push        esi
 0043392E    mov         dl,byte ptr [ebp-0C]
 00433931    mov         eax,ebx
 00433933    call        TThemeServices.GetTheme
 00433938    push        eax
 00433939    mov         eax,[005AE43C];^DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows....
 0043393E    mov         eax,dword ptr [eax]
 00433940    call        eax
 00433942    pop         edi
 00433943    pop         esi
 00433944    pop         ebx
 00433945    mov         esp,ebp
 00433947    pop         ebp
 00433948    ret         8
*}
end;

//0043394C
procedure TThemeServices.DrawParentBackground(Window:HWND; Target:HDC; Details:PThemedElementDetails; OnlyIfTransparent:Boolean; Bounds:PRect);
begin
{*
 0043394C    push        ebp
 0043394D    mov         ebp,esp
 0043394F    add         esp,0FFFFFFF8
 00433952    push        ebx
 00433953    push        esi
 00433954    mov         dword ptr [ebp-8],ecx
 00433957    mov         dword ptr [ebp-4],edx
 0043395A    mov         esi,eax
 0043395C    mov         eax,dword ptr [ebp+10]
 0043395F    cmp         byte ptr [ebp+0C],0
>00433963    je          0043398E
 00433965    test        eax,eax
>00433967    je          0043398E
 00433969    mov         ebx,eax
 0043396B    mov         eax,dword ptr [ebx+8]
 0043396E    push        eax
 0043396F    mov         eax,dword ptr [ebx+4]
 00433972    push        eax
 00433973    mov         dl,byte ptr [ebx]
 00433975    mov         eax,esi
 00433977    call        TThemeServices.GetTheme
 0043397C    push        eax
 0043397D    mov         eax,[005AE29C];^IsThemeBackgroundPartiallyTransparent:function(val hTheme:Windows.THandl...
 00433982    mov         eax,dword ptr [eax]
 00433984    call        eax
 00433986    cmp         eax,1
 00433989    sbb         eax,eax
 0043398B    inc         eax
>0043398C    jmp         00433990
 0043398E    mov         al,1
 00433990    test        al,al
>00433992    je          004339A9
 00433994    mov         eax,dword ptr [ebp+8]
 00433997    push        eax
 00433998    mov         eax,dword ptr [ebp-8]
 0043399B    push        eax
 0043399C    mov         eax,dword ptr [ebp-4]
 0043399F    push        eax
 004339A0    mov         eax,[005AE540];^DrawThemeParentBackground:function(val hwnd:Windows.HWND;val hdc:Windows...
 004339A5    mov         eax,dword ptr [eax]
 004339A7    call        eax
 004339A9    pop         esi
 004339AA    pop         ebx
 004339AB    pop         ecx
 004339AC    pop         ecx
 004339AD    pop         ebp
 004339AE    ret         0C
*}
end;

//004339B4
function TThemeServices.GetElementDetails(Detail:TThemedEdit):TThemedElementDetails;
begin
{*
 004339B4    mov         byte ptr [ecx],3
 004339B7    mov         eax,edx
 004339B9    add         al,0FE
 004339BB    sub         al,7
>004339BD    jb          004339C3
>004339BF    je          004339D1
>004339C1    jmp         004339DF
 004339C3    mov         dword ptr [ecx+4],1
 004339CA    mov         eax,2
>004339CF    jmp         004339E6
 004339D1    mov         dword ptr [ecx+4],2
 004339D8    mov         eax,9
>004339DD    jmp         004339E6
 004339DF    xor         eax,eax
 004339E1    mov         dword ptr [ecx+4],eax
 004339E4    xor         eax,eax
 004339E6    and         edx,7F
 004339E9    sub         edx,eax
 004339EB    inc         edx
 004339EC    mov         dword ptr [ecx+8],edx
 004339EF    ret
*}
end;

//004339F0
function TThemeServices.GetElementDetails(Detail:TThemedWindow):TThemedElementDetails;
begin
{*
 004339F0    mov         byte ptr [ecx],17
 004339F3    xor         eax,eax
 004339F5    mov         al,dl
 004339F7    cmp         eax,68
>004339FA    ja          00433D68
 00433A00    mov         al,byte ptr [eax+433A0D]
 00433A06    jmp         dword ptr [eax*4+433A76]
 00433A06    db          0
 00433A06    db          0
 00433A06    db          1
 00433A06    db          1
 00433A06    db          1
 00433A06    db          2
 00433A06    db          2
 00433A06    db          2
 00433A06    db          3
 00433A06    db          3
 00433A06    db          3
 00433A06    db          4
 00433A06    db          4
 00433A06    db          4
 00433A06    db          5
 00433A06    db          5
 00433A06    db          5
 00433A06    db          6
 00433A06    db          6
 00433A06    db          6
 00433A06    db          7
 00433A06    db          7
 00433A06    db          8
 00433A06    db          8
 00433A06    db          9
 00433A06    db          9
 00433A06    db          10
 00433A06    db          10
 00433A06    db          11
 00433A06    db          11
 00433A06    db          12
 00433A06    db          12
 00433A06    db          13
 00433A06    db          13
 00433A06    db          13
 00433A06    db          13
 00433A06    db          14
 00433A06    db          14
 00433A06    db          14
 00433A06    db          14
 00433A06    db          15
 00433A06    db          15
 00433A06    db          15
 00433A06    db          15
 00433A06    db          16
 00433A06    db          16
 00433A06    db          16
 00433A06    db          16
 00433A06    db          17
 00433A06    db          17
 00433A06    db          17
 00433A06    db          17
 00433A06    db          18
 00433A06    db          18
 00433A06    db          18
 00433A06    db          18
 00433A06    db          19
 00433A06    db          19
 00433A06    db          19
 00433A06    db          19
 00433A06    db          20
 00433A06    db          20
 00433A06    db          20
 00433A06    db          20
 00433A06    db          21
 00433A06    db          21
 00433A06    db          21
 00433A06    db          21
 00433A06    db          22
 00433A06    db          22
 00433A06    db          22
 00433A06    db          22
 00433A06    db          23
 00433A06    db          23
 00433A06    db          23
 00433A06    db          23
 00433A06    db          24
 00433A06    db          24
 00433A06    db          24
 00433A06    db          24
 00433A06    db          25
 00433A06    db          25
 00433A06    db          25
 00433A06    db          25
 00433A06    db          26
 00433A06    db          26
 00433A06    db          26
 00433A06    db          26
 00433A06    db          27
 00433A06    db          27
 00433A06    db          27
 00433A06    db          27
 00433A06    db          28
 00433A06    db          28
 00433A06    db          28
 00433A06    db          28
 00433A06    db          29
 00433A06    db          30
 00433A06    db          31
 00433A06    db          32
 00433A06    db          33
 00433A06    db          34
 00433A06    db          35
 00433A06    db          36
 00433A06    db          37
 00433A06    dd          00433D68
 00433A06    dd          00433B0E
 00433A06    dd          00433B1F
 00433A06    dd          00433B30
 00433A06    dd          00433B41
 00433A06    dd          00433B52
 00433A06    dd          00433B63
 00433A06    dd          00433B74
 00433A06    dd          00433B85
 00433A06    dd          00433B96
 00433A06    dd          00433BA7
 00433A06    dd          00433BB8
 00433A06    dd          00433BC9
 00433A06    dd          00433BDA
 00433A06    dd          00433BEB
 00433A06    dd          00433BFC
 00433A06    dd          00433C0D
 00433A06    dd          00433C1E
 00433A06    dd          00433C2F
 00433A06    dd          00433C40
 00433A06    dd          00433C51
 00433A06    dd          00433C62
 00433A06    dd          00433C73
 00433A06    dd          00433C84
 00433A06    dd          00433C95
 00433A06    dd          00433CA6
 00433A06    dd          00433CB7
 00433A06    dd          00433CC8
 00433A06    dd          00433CD9
 00433A06    dd          00433CEA
 00433A06    dd          00433CF8
 00433A06    dd          00433D06
 00433A06    dd          00433D14
 00433A06    dd          00433D22
 00433A06    dd          00433D30
 00433A06    dd          00433D3E
 00433A06    dd          00433D4C
 00433A06    dd          00433D5A
 00433B0E    mov         dword ptr [ecx+4],1
 00433B15    mov         eax,2
>00433B1A    jmp         00433D6F
 00433B1F    mov         dword ptr [ecx+4],2
 00433B26    mov         eax,5
>00433B2B    jmp         00433D6F
 00433B30    mov         dword ptr [ecx+4],3
 00433B37    mov         eax,8
>00433B3C    jmp         00433D6F
 00433B41    mov         dword ptr [ecx+4],4
 00433B48    mov         eax,0B
>00433B4D    jmp         00433D6F
 00433B52    mov         dword ptr [ecx+4],5
 00433B59    mov         eax,0E
>00433B5E    jmp         00433D6F
 00433B63    mov         dword ptr [ecx+4],6
 00433B6A    mov         eax,11
>00433B6F    jmp         00433D6F
 00433B74    mov         dword ptr [ecx+4],7
 00433B7B    mov         eax,14
>00433B80    jmp         00433D6F
 00433B85    mov         dword ptr [ecx+4],8
 00433B8C    mov         eax,16
>00433B91    jmp         00433D6F
 00433B96    mov         dword ptr [ecx+4],9
 00433B9D    mov         eax,18
>00433BA2    jmp         00433D6F
 00433BA7    mov         dword ptr [ecx+4],0A
 00433BAE    mov         eax,1A
>00433BB3    jmp         00433D6F
 00433BB8    mov         dword ptr [ecx+4],0B
 00433BBF    mov         eax,1C
>00433BC4    jmp         00433D6F
 00433BC9    mov         dword ptr [ecx+4],0C
 00433BD0    mov         eax,1E
>00433BD5    jmp         00433D6F
 00433BDA    mov         dword ptr [ecx+4],0D
 00433BE1    mov         eax,20
>00433BE6    jmp         00433D6F
 00433BEB    mov         dword ptr [ecx+4],0E
 00433BF2    mov         eax,24
>00433BF7    jmp         00433D6F
 00433BFC    mov         dword ptr [ecx+4],0F
 00433C03    mov         eax,28
>00433C08    jmp         00433D6F
 00433C0D    mov         dword ptr [ecx+4],10
 00433C14    mov         eax,2C
>00433C19    jmp         00433D6F
 00433C1E    mov         dword ptr [ecx+4],11
 00433C25    mov         eax,30
>00433C2A    jmp         00433D6F
 00433C2F    mov         dword ptr [ecx+4],12
 00433C36    mov         eax,34
>00433C3B    jmp         00433D6F
 00433C40    mov         dword ptr [ecx+4],13
 00433C47    mov         eax,38
>00433C4C    jmp         00433D6F
 00433C51    mov         dword ptr [ecx+4],14
 00433C58    mov         eax,3C
>00433C5D    jmp         00433D6F
 00433C62    mov         dword ptr [ecx+4],15
 00433C69    mov         eax,40
>00433C6E    jmp         00433D6F
 00433C73    mov         dword ptr [ecx+4],16
 00433C7A    mov         eax,44
>00433C7F    jmp         00433D6F
 00433C84    mov         dword ptr [ecx+4],17
 00433C8B    mov         eax,48
>00433C90    jmp         00433D6F
 00433C95    mov         dword ptr [ecx+4],18
 00433C9C    mov         eax,4C
>00433CA1    jmp         00433D6F
 00433CA6    mov         dword ptr [ecx+4],19
 00433CAD    mov         eax,50
>00433CB2    jmp         00433D6F
 00433CB7    mov         dword ptr [ecx+4],1A
 00433CBE    mov         eax,54
>00433CC3    jmp         00433D6F
 00433CC8    mov         dword ptr [ecx+4],1B
 00433CCF    mov         eax,58
>00433CD4    jmp         00433D6F
 00433CD9    mov         dword ptr [ecx+4],1C
 00433CE0    mov         eax,5C
>00433CE5    jmp         00433D6F
 00433CEA    mov         dword ptr [ecx+4],1D
 00433CF1    mov         eax,60
>00433CF6    jmp         00433D6F
 00433CF8    mov         dword ptr [ecx+4],1E
 00433CFF    mov         eax,61
>00433D04    jmp         00433D6F
 00433D06    mov         dword ptr [ecx+4],1F
 00433D0D    mov         eax,62
>00433D12    jmp         00433D6F
 00433D14    mov         dword ptr [ecx+4],20
 00433D1B    mov         eax,63
>00433D20    jmp         00433D6F
 00433D22    mov         dword ptr [ecx+4],21
 00433D29    mov         eax,64
>00433D2E    jmp         00433D6F
 00433D30    mov         dword ptr [ecx+4],22
 00433D37    mov         eax,65
>00433D3C    jmp         00433D6F
 00433D3E    mov         dword ptr [ecx+4],23
 00433D45    mov         eax,66
>00433D4A    jmp         00433D6F
 00433D4C    mov         dword ptr [ecx+4],24
 00433D53    mov         eax,67
>00433D58    jmp         00433D6F
 00433D5A    mov         dword ptr [ecx+4],25
 00433D61    mov         eax,68
>00433D66    jmp         00433D6F
 00433D68    xor         eax,eax
 00433D6A    mov         dword ptr [ecx+4],eax
 00433D6D    xor         eax,eax
 00433D6F    and         edx,7F
 00433D72    sub         edx,eax
 00433D74    inc         edx
 00433D75    mov         dword ptr [ecx+8],edx
 00433D78    ret
*}
end;

//00433D7C
procedure TThemeServices.PaintBorder(Control:TWinControl; EraseLRCorner:Boolean);
begin
{*
 00433D7C    push        ebp
 00433D7D    mov         ebp,esp
 00433D7F    add         esp,0FFFFFFBC
 00433D82    push        ebx
 00433D83    push        esi
 00433D84    push        edi
 00433D85    mov         ebx,ecx
 00433D87    mov         dword ptr [ebp-4],edx
 00433D8A    mov         esi,eax
 00433D8C    push        0EC
 00433D8E    mov         eax,dword ptr [ebp-4]
 00433D91    call        TWinControl.GetHandle
 00433D96    push        eax
 00433D97    call        user32.GetWindowLongA
 00433D9C    test        ah,2
>00433D9F    je          00433EDE
 00433DA5    lea         eax,[ebp-28]
 00433DA8    push        eax
 00433DA9    mov         eax,dword ptr [ebp-4]
 00433DAC    call        TWinControl.GetHandle
 00433DB1    push        eax
 00433DB2    call        user32.GetWindowRect
 00433DB7    mov         eax,dword ptr [ebp-24]
 00433DBA    neg         eax
 00433DBC    push        eax
 00433DBD    mov         eax,dword ptr [ebp-28]
 00433DC0    neg         eax
 00433DC2    push        eax
 00433DC3    lea         eax,[ebp-28]
 00433DC6    push        eax
 00433DC7    call        user32.OffsetRect
 00433DCC    mov         eax,dword ptr [ebp-4]
 00433DCF    call        TWinControl.GetHandle
 00433DD4    push        eax
 00433DD5    call        user32.GetWindowDC
 00433DDA    mov         dword ptr [ebp-8],eax
 00433DDD    xor         edx,edx
 00433DDF    push        ebp
 00433DE0    push        433ED7
 00433DE5    push        dword ptr fs:[edx]
 00433DE8    mov         dword ptr fs:[edx],esp
 00433DEB    push        esi
 00433DEC    lea         esi,[ebp-28]
 00433DEF    lea         edi,[ebp-18]
 00433DF2    movs        dword ptr [edi],dword ptr [esi]
 00433DF3    movs        dword ptr [edi],dword ptr [esi]
 00433DF4    movs        dword ptr [edi],dword ptr [esi]
 00433DF5    movs        dword ptr [edi],dword ptr [esi]
 00433DF6    pop         esi
 00433DF7    test        bl,bl
>00433DF9    je          00433E73
 00433DFB    push        0F0
 00433DFD    mov         eax,dword ptr [ebp-4]
 00433E00    call        TWinControl.GetHandle
 00433E05    push        eax
 00433E06    call        user32.GetWindowLongA
 00433E0B    test        eax,100000
>00433E10    je          00433E73
 00433E12    test        eax,200000
>00433E17    je          00433E73
 00433E19    push        2
 00433E1B    call        user32.GetSystemMetrics
 00433E20    mov         edi,eax
 00433E22    push        3
 00433E24    call        user32.GetSystemMetrics
 00433E29    mov         ebx,eax
 00433E2B    push        0FE
 00433E2D    push        0FE
 00433E2F    lea         eax,[ebp-18]
 00433E32    push        eax
 00433E33    call        user32.InflateRect
 00433E38    mov         eax,dword ptr [ebp-0C]
 00433E3B    push        eax
 00433E3C    lea         eax,[ebp-44]
 00433E3F    push        eax
 00433E40    mov         edx,dword ptr [ebp-0C]
 00433E43    sub         edx,ebx
 00433E45    mov         eax,dword ptr [ebp-10]
 00433E48    sub         eax,edi
 00433E4A    mov         ecx,dword ptr [ebp-10]
 00433E4D    call        Bounds
 00433E52    push        esi
 00433E53    lea         esi,[ebp-44]
 00433E56    lea         edi,[ebp-18]
 00433E59    movs        dword ptr [edi],dword ptr [esi]
 00433E5A    movs        dword ptr [edi],dword ptr [esi]
 00433E5B    movs        dword ptr [edi],dword ptr [esi]
 00433E5C    movs        dword ptr [edi],dword ptr [esi]
 00433E5D    pop         esi
 00433E5E    push        0F
 00433E60    call        user32.GetSysColorBrush
 00433E65    push        eax
 00433E66    lea         eax,[ebp-18]
 00433E69    push        eax
 00433E6A    mov         eax,dword ptr [ebp-8]
 00433E6D    push        eax
 00433E6E    call        user32.FillRect
 00433E73    mov         eax,dword ptr [ebp-1C]
 00433E76    sub         eax,2
 00433E79    push        eax
 00433E7A    mov         eax,dword ptr [ebp-20]
 00433E7D    sub         eax,2
 00433E80    push        eax
 00433E81    mov         eax,dword ptr [ebp-24]
 00433E84    add         eax,2
 00433E87    push        eax
 00433E88    mov         eax,dword ptr [ebp-28]
 00433E8B    add         eax,2
 00433E8E    push        eax
 00433E8F    mov         eax,dword ptr [ebp-8]
 00433E92    push        eax
 00433E93    call        gdi32.ExcludeClipRect
 00433E98    lea         ecx,[ebp-34]
 00433E9B    mov         dl,2
 00433E9D    mov         eax,esi
 00433E9F    call        TThemeServices.GetElementDetails
 00433EA4    lea         eax,[ebp-28]
 00433EA7    push        eax
 00433EA8    push        0
 00433EAA    lea         ecx,[ebp-34]
 00433EAD    mov         edx,dword ptr [ebp-8]
 00433EB0    mov         eax,esi
 00433EB2    call        TThemeServices.DrawElement
 00433EB7    xor         eax,eax
 00433EB9    pop         edx
 00433EBA    pop         ecx
 00433EBB    pop         ecx
 00433EBC    mov         dword ptr fs:[eax],edx
 00433EBF    push        433EDE
 00433EC4    mov         eax,dword ptr [ebp-8]
 00433EC7    push        eax
 00433EC8    mov         eax,dword ptr [ebp-4]
 00433ECB    call        TWinControl.GetHandle
 00433ED0    push        eax
 00433ED1    call        user32.ReleaseDC
 00433ED6    ret
>00433ED7    jmp         @HandleFinally
>00433EDC    jmp         00433EC4
 00433EDE    pop         edi
 00433EDF    pop         esi
 00433EE0    pop         ebx
 00433EE1    mov         esp,ebp
 00433EE3    pop         ebp
 00433EE4    ret
*}
end;

//00433EE8
procedure TThemeServices.UpdateThemes;
begin
{*
 00433EE8    push        ebx
 00433EE9    mov         ebx,eax
 00433EEB    cmp         byte ptr [ebx+6],0
>00433EEF    je          00433EF8
 00433EF1    mov         eax,ebx
 00433EF3    call        TThemeServices.UnloadThemeData
 00433EF8    call        UseThemes
 00433EFD    mov         byte ptr [ebx+6],al
 00433F00    pop         ebx
 00433F01    ret
*}
end;

Initialization
Finalization
//00433F04
{*
 00433F04    push        ebp
 00433F05    mov         ebp,esp
 00433F07    xor         eax,eax
 00433F09    push        ebp
 00433F0A    push        433F3F
 00433F0F    push        dword ptr fs:[eax]
 00433F12    mov         dword ptr fs:[eax],esp
 00433F15    inc         dword ptr ds:[5E0BE8]
>00433F1B    jne         00433F31
 00433F1D    mov         eax,[005E0BEC];InternalServices:TThemeServices
 00433F22    call        TObject.Free
 00433F27    mov         eax,5ACAE8
 00433F2C    call        @LStrClr
 00433F31    xor         eax,eax
 00433F33    pop         edx
 00433F34    pop         ecx
 00433F35    pop         ecx
 00433F36    mov         dword ptr fs:[eax],edx
 00433F39    push        433F46
 00433F3E    ret
>00433F3F    jmp         @HandleFinally
>00433F44    jmp         00433F3E
 00433F46    pop         ebp
 00433F47    ret
*}
end.