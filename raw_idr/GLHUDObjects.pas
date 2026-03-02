//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLHUDObjects;

interface

uses
  SysUtils, Classes, GLBitmapFont, GLTexture;

type
  TGLHUDSprite = class(TGLSprite)
  public
    XTiles:Integer;//fB0
    YTiles:Integer;//fB4
    constructor Create(AOwner:TComponent); virtual;//v2C//004A14EC
    //procedure v68(?:?); virtual;//v68//004A15A0
    procedure SetXTiles(Value:Integer);//004A1560
    procedure SetYTiles(Value:Integer);//004A1580
  end;
  TGLHUDText = class(TGLImmaterialSceneObject)
  public
    BitmapFont:TGLCustomBitmapFont;//f98
    Text:String;//f9C
    Rotation:Single;//fA0
    Alignment:TAlignment;//fA4
    Layout:TGLTextLayout;//fA5
    ModulateColor:TGLColor;//fA8
    destructor Destroy; virtual;//004A18C0
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//004A18FC
    constructor Create(AOwner:TComponent); virtual;//v2C//004A185C
    //procedure v68(?:?); virtual;//v68//004A19F8
    procedure SetBitmapFont(Value:TGLCustomBitmapFont);//004A192C
    procedure SetText(Value:String);//004A197C
    //procedure SetRotation(Value:Single; ?:?);//004A19A0
    procedure SetAlignment(Value:TAlignment);//004A19BC
    procedure SetLayout(Value:TGLTextLayout);//004A19D4
    procedure SetModulateColor(Value:TGLColor);//004A19EC
  end;
    constructor Create(AOwner:TComponent);//004A14EC
    //procedure sub_004A15A0(?:?);//004A15A0
    constructor Create(AOwner:TComponent);//004A185C
    destructor Destroy;//004A18C0
    procedure Notification(AComponent:TComponent; Operation:TOperation);//004A18FC
    //procedure sub_004A19F8(?:?);//004A19F8

implementation

//004A14EC
constructor TGLHUDSprite.Create(AOwner:TComponent);
begin
{*
 004A14EC    push        ebx
 004A14ED    push        esi
 004A14EE    test        dl,dl
>004A14F0    je          004A14FA
 004A14F2    add         esp,0FFFFFFF0
 004A14F5    call        @ClassCreate
 004A14FA    mov         ebx,edx
 004A14FC    mov         esi,eax
 004A14FE    xor         edx,edx
 004A1500    mov         eax,esi
 004A1502    call        TGLSprite.Create
 004A1507    mov         al,byte ptr [esi+3C];TGLHUDSprite.?f3C:byte
 004A150A    or          al,byte ptr ds:[4A155C];0x9 gvar_004A155C
 004A1510    mov         byte ptr [esi+3C],al;TGLHUDSprite.?f3C:byte
 004A1513    push        41800000
 004A1518    mov         eax,esi
 004A151A    call        TGLSprite.SetWidth
 004A151F    push        41800000
 004A1524    mov         eax,esi
 004A1526    call        TGLSprite.SetHeight
 004A152B    mov         dword ptr [esi+0B0],1;TGLHUDSprite.XTiles:Integer
 004A1535    mov         dword ptr [esi+0B4],1;TGLHUDSprite.YTiles:Integer
 004A153F    mov         eax,esi
 004A1541    test        bl,bl
>004A1543    je          004A1554
 004A1545    call        @AfterConstruction
 004A154A    pop         dword ptr fs:[0]
 004A1551    add         esp,0C
 004A1554    mov         eax,esi
 004A1556    pop         esi
 004A1557    pop         ebx
 004A1558    ret
*}
end;

//004A1560
procedure TGLHUDSprite.SetXTiles(Value:Integer);
begin
{*
 004A1560    push        esi
 004A1561    mov         esi,eax
 004A1563    cmp         edx,dword ptr [esi+0B0];TGLHUDSprite.XTiles:Integer
>004A1569    je          004A157C
 004A156B    mov         dword ptr [esi+0B0],edx;TGLHUDSprite.XTiles:Integer
 004A1571    mov         eax,esi
 004A1573    mov         si,0FFE7
 004A1577    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A157C    pop         esi
 004A157D    ret
*}
end;

//004A1580
procedure TGLHUDSprite.SetYTiles(Value:Integer);
begin
{*
 004A1580    push        esi
 004A1581    mov         esi,eax
 004A1583    cmp         edx,dword ptr [esi+0B4];TGLHUDSprite.YTiles:Integer
>004A1589    je          004A159C
 004A158B    mov         dword ptr [esi+0B4],edx;TGLHUDSprite.YTiles:Integer
 004A1591    mov         eax,esi
 004A1593    mov         si,0FFE7
 004A1597    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A159C    pop         esi
 004A159D    ret
*}
end;

//004A15A0
{*procedure sub_004A15A0(?:?);
begin
 004A15A0    push        ebp
 004A15A1    mov         ebp,esp
 004A15A3    add         esp,0FFFFFFE8
 004A15A6    push        ebx
 004A15A7    push        esi
 004A15A8    push        edi
 004A15A9    mov         esi,edx
 004A15AB    mov         ebx,eax
 004A15AD    mov         edi,dword ptr ds:[5AE164];^gvar_005E1344
 004A15B3    cmp         byte ptr [esi+0FA],0
>004A15BA    jne         004A183E
 004A15C0    mov         edx,esi
 004A15C2    mov         eax,dword ptr [ebx+90];TGLHUDSprite.?f90:TGLMaterial
 004A15C8    call        00476434
 004A15CD    fld         dword ptr [ebx+0A4];TGLHUDSprite.AlphaChannel:Single
 004A15D3    fcomp       dword ptr ds:[4A1848];1:Single
 004A15D9    fnstsw      al
 004A15DB    sahf
>004A15DC    je          004A1619
 004A15DE    cmp         dword ptr [esi+54],0
>004A15E2    jle         004A1606
 004A15E4    mov         eax,dword ptr [ebx+90];TGLHUDSprite.?f90:TGLMaterial
 004A15EA    mov         eax,dword ptr [eax+18];TGLMaterial.FrontProperties:TGLFaceProperties
 004A15ED    mov         eax,dword ptr [eax+1C];TGLFaceProperties.Diffuse:TGLColor
 004A15F0    push        dword ptr [ebx+0A4];TGLHUDSprite.AlphaChannel:Single
 004A15F6    push        dword ptr [eax+20];TGLColor.Blue:Single
 004A15F9    push        dword ptr [eax+1C];TGLColor.Green:Single
 004A15FC    push        dword ptr [eax+18];TGLColor.Red:Single
 004A15FF    call        OpenGL32.glColor4f
>004A1604    jmp         004A1619
 004A1606    push        dword ptr [ebx+0A4];TGLHUDSprite.AlphaChannel:Single
 004A160C    mov         eax,dword ptr [esi+5C]
 004A160F    mov         edx,404
 004A1614    call        0046D7F0
 004A1619    push        1700
 004A161E    call        OpenGL32.glMatrixMode
 004A1623    call        OpenGL32.glPushMatrix
 004A1628    mov         eax,dword ptr [ebx+5C];TGLHUDSprite.?f5C:TComponent
 004A162B    mov         eax,dword ptr [eax+4C]
 004A162E    add         eax,0AC
 004A1633    push        eax
 004A1634    call        OpenGL32.glLoadMatrixf
 004A1639    mov         eax,dword ptr [esi+44]
 004A163C    cmp         eax,60
>004A163F    jne         004A164A
 004A1641    mov         dword ptr [ebp-14],3F800000
>004A1648    jmp         004A165A
 004A164A    mov         dword ptr [ebp-18],eax
 004A164D    fild        dword ptr [ebp-18]
 004A1650    fdiv        dword ptr ds:[4A184C];96:Single
 004A1656    fstp        dword ptr [ebp-14]
 004A1659    wait
 004A165A    push        3F800000
 004A165F    fild        dword ptr [esi+40]
 004A1662    fdivr       dword ptr ds:[4A1850];2:Single
 004A1668    add         esp,0FFFFFFFC
 004A166B    fstp        dword ptr [esp]
 004A166E    wait
 004A166F    fild        dword ptr [esi+3C]
 004A1672    fdivr       dword ptr ds:[4A1850];2:Single
 004A1678    add         esp,0FFFFFFFC
 004A167B    fstp        dword ptr [esp]
 004A167E    wait
 004A167F    call        OpenGL32.glScalef
 004A1684    mov         eax,dword ptr [ebx+44];TGLHUDSprite.?f44:TGLCoordinates
 004A1687    push        dword ptr [eax+20];TGLCoordinates.Z:Single
 004A168A    fld         dword ptr [ebp-14]
 004A168D    fmul        dword ptr [eax+1C];TGLCoordinates.Y:Single
 004A1690    fild        dword ptr [esi+40]
 004A1693    fmul        dword ptr ds:[4A1854];0.5:Single
 004A1699    fsubrp      st(1),st
 004A169B    add         esp,0FFFFFFFC
 004A169E    fstp        dword ptr [esp]
 004A16A1    wait
 004A16A2    fld         dword ptr [ebp-14]
 004A16A5    fmul        dword ptr [eax+18];TGLCoordinates.X:Single
 004A16A8    fild        dword ptr [esi+3C]
 004A16AB    fmul        dword ptr ds:[4A1854];0.5:Single
 004A16B1    fsubp       st(1),st
 004A16B3    add         esp,0FFFFFFFC
 004A16B6    fstp        dword ptr [esp]
 004A16B9    wait
 004A16BA    call        OpenGL32.glTranslatef
 004A16BF    fld         dword ptr [ebx+0A0];TGLHUDSprite.Rotation:Single
 004A16C5    fcomp       dword ptr ds:[4A1858];0:Single
 004A16CB    fnstsw      al
 004A16CD    sahf
>004A16CE    je          004A16E4
 004A16D0    push        3F800000
 004A16D5    push        0
 004A16D7    push        0
 004A16D9    push        dword ptr [ebx+0A0];TGLHUDSprite.Rotation:Single
 004A16DF    call        OpenGL32.glRotatef
 004A16E4    push        1701
 004A16E9    call        OpenGL32.glMatrixMode
 004A16EE    call        OpenGL32.glPushMatrix
 004A16F3    call        OpenGL32.glLoadIdentity
 004A16F8    push        2000
 004A16FD    call        OpenGL32.glPushAttrib
 004A1702    push        0B71
 004A1707    call        OpenGL32.glDisable
 004A170C    push        0
 004A170E    call        OpenGL32.glDepthMask
 004A1713    fld         dword ptr [ebx+98];TGLHUDSprite.Width:Single
 004A1719    fchs
 004A171B    fmul        dword ptr ds:[4A1854];0.5:Single
 004A1721    fmul        dword ptr [ebp-14]
 004A1724    fstp        dword ptr [ebp-4]
 004A1727    wait
 004A1728    fld         dword ptr [ebx+98];TGLHUDSprite.Width:Single
 004A172E    fmul        dword ptr [ebp-14]
 004A1731    fadd        dword ptr [ebp-4]
 004A1734    fstp        dword ptr [ebp-0C]
 004A1737    wait
 004A1738    fld         dword ptr [ebx+9C];TGLHUDSprite.Height:Single
 004A173E    fmul        dword ptr ds:[4A1854];0.5:Single
 004A1744    fmul        dword ptr [ebp-14]
 004A1747    fstp        dword ptr [ebp-8]
 004A174A    wait
 004A174B    fld         dword ptr [ebx+9C];TGLHUDSprite.Height:Single
 004A1751    fmul        dword ptr [ebp-14]
 004A1754    fsubr       dword ptr [ebp-8]
 004A1757    fstp        dword ptr [ebp-10]
 004A175A    wait
 004A175B    push        7
 004A175D    call        OpenGL32.glBegin
 004A1762    mov         eax,[005AE58C];^gvar_005ACEF4
 004A1767    push        eax
 004A1768    call        OpenGL32.glNormal3fv
 004A176D    push        0
 004A176F    push        0
 004A1771    mov         eax,dword ptr [edi]
 004A1773    call        eax
 004A1775    push        dword ptr [ebp-10]
 004A1778    push        dword ptr [ebp-4]
 004A177B    call        OpenGL32.glVertex2f
 004A1780    push        0
 004A1782    fild        dword ptr [ebx+0B0];TGLHUDSprite.XTiles:Integer
 004A1788    add         esp,0FFFFFFFC
 004A178B    fstp        dword ptr [esp]
 004A178E    wait
 004A178F    mov         eax,dword ptr [edi]
 004A1791    call        eax
 004A1793    push        dword ptr [ebp-10]
 004A1796    push        dword ptr [ebp-0C]
 004A1799    call        OpenGL32.glVertex2f
 004A179E    fild        dword ptr [ebx+0B4];TGLHUDSprite.YTiles:Integer
 004A17A4    add         esp,0FFFFFFFC
 004A17A7    fstp        dword ptr [esp]
 004A17AA    wait
 004A17AB    fild        dword ptr [ebx+0B0];TGLHUDSprite.XTiles:Integer
 004A17B1    add         esp,0FFFFFFFC
 004A17B4    fstp        dword ptr [esp]
 004A17B7    wait
 004A17B8    mov         eax,dword ptr [edi]
 004A17BA    call        eax
 004A17BC    push        dword ptr [ebp-8]
 004A17BF    push        dword ptr [ebp-0C]
 004A17C2    call        OpenGL32.glVertex2f
 004A17C7    fild        dword ptr [ebx+0B4];TGLHUDSprite.YTiles:Integer
 004A17CD    add         esp,0FFFFFFFC
 004A17D0    fstp        dword ptr [esp]
 004A17D3    wait
 004A17D4    push        0
 004A17D6    mov         eax,dword ptr [edi]
 004A17D8    call        eax
 004A17DA    push        dword ptr [ebp-8]
 004A17DD    push        dword ptr [ebp-4]
 004A17E0    call        OpenGL32.glVertex2f
 004A17E5    call        OpenGL32.glEnd
 004A17EA    push        0FF
 004A17EC    call        OpenGL32.glDepthMask
 004A17F1    call        OpenGL32.glPopAttrib
 004A17F6    call        OpenGL32.glPopMatrix
 004A17FB    push        1700
 004A1800    call        OpenGL32.glMatrixMode
 004A1805    call        OpenGL32.glPopMatrix
 004A180A    mov         edx,esi
 004A180C    mov         eax,dword ptr [ebx+90];TGLHUDSprite.?f90:TGLMaterial
 004A1812    call        00476760
 004A1817    test        al,al
>004A1819    jne         004A15CD
 004A181F    mov         eax,ebx
 004A1821    call        0047BA94
 004A1826    test        eax,eax
>004A1828    jle         004A183E
 004A182A    push        esi
 004A182B    mov         eax,ebx
 004A182D    call        0047BA94
 004A1832    mov         ecx,eax
 004A1834    dec         ecx
 004A1835    xor         edx,edx
 004A1837    mov         eax,ebx
 004A1839    mov         ebx,dword ptr [eax]
 004A183B    call        dword ptr [ebx+6C];TGLHUDSprite.sub_0047D7AC
 004A183E    pop         edi
 004A183F    pop         esi
 004A1840    pop         ebx
 004A1841    mov         esp,ebp
 004A1843    pop         ebp
 004A1844    ret         4
end;*}

//004A185C
constructor TGLHUDText.Create(AOwner:TComponent);
begin
{*
 004A185C    push        ebx
 004A185D    push        esi
 004A185E    test        dl,dl
>004A1860    je          004A186A
 004A1862    add         esp,0FFFFFFF0
 004A1865    call        @ClassCreate
 004A186A    mov         ebx,edx
 004A186C    mov         esi,eax
 004A186E    xor         edx,edx
 004A1870    mov         eax,esi
 004A1872    call        TGLCustomSceneObject.Create
 004A1877    mov         al,byte ptr [esi+3C];TGLHUDText.?f3C:byte
 004A187A    or          al,byte ptr ds:[4A18BC];0x9 gvar_004A18BC
 004A1880    mov         byte ptr [esi+3C],al;TGLHUDText.?f3C:byte
 004A1883    mov         eax,[005AE830];^gvar_005AD44C
 004A1888    push        eax
 004A1889    push        0
 004A188B    push        0
 004A188D    mov         ecx,esi
 004A188F    mov         dl,1
 004A1891    mov         eax,[00470BF8];TGLColor
 004A1896    call        TGLColor.Create;TGLColor.Create
 004A189B    mov         dword ptr [esi+0A8],eax;TGLHUDText.ModulateColor:TGLColor
 004A18A1    mov         eax,esi
 004A18A3    test        bl,bl
>004A18A5    je          004A18B6
 004A18A7    call        @AfterConstruction
 004A18AC    pop         dword ptr fs:[0]
 004A18B3    add         esp,0C
 004A18B6    mov         eax,esi
 004A18B8    pop         esi
 004A18B9    pop         ebx
 004A18BA    ret
*}
end;

//004A18C0
destructor TGLHUDText.Destroy;
begin
{*
 004A18C0    push        ebx
 004A18C1    push        esi
 004A18C2    call        @BeforeDestruction
 004A18C7    mov         ebx,edx
 004A18C9    mov         esi,eax
 004A18CB    mov         eax,dword ptr [esi+0A8];TGLHUDText.ModulateColor:TGLColor
 004A18D1    call        TObject.Free
 004A18D6    xor         edx,edx
 004A18D8    mov         eax,esi
 004A18DA    call        TGLHUDText.SetBitmapFont
 004A18DF    mov         edx,ebx
 004A18E1    and         dl,0FC
 004A18E4    mov         eax,esi
 004A18E6    call        TGLCustomSceneObject.Destroy
 004A18EB    test        bl,bl
>004A18ED    jle         004A18F6
 004A18EF    mov         eax,esi
 004A18F1    call        @ClassDestroy
 004A18F6    pop         esi
 004A18F7    pop         ebx
 004A18F8    ret
*}
end;

//004A18FC
procedure TGLHUDText.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 004A18FC    push        ebx
 004A18FD    push        esi
 004A18FE    push        edi
 004A18FF    mov         ebx,ecx
 004A1901    mov         esi,edx
 004A1903    mov         edi,eax
 004A1905    cmp         bl,1
>004A1908    jne         004A191B
 004A190A    cmp         esi,dword ptr [edi+98];TGLHUDText.BitmapFont:TGLCustomBitmapFont
>004A1910    jne         004A191B
 004A1912    xor         edx,edx
 004A1914    mov         eax,edi
 004A1916    call        TGLHUDText.SetBitmapFont
 004A191B    mov         ecx,ebx
 004A191D    mov         edx,esi
 004A191F    mov         eax,edi
 004A1921    call        TComponent.Notification
 004A1926    pop         edi
 004A1927    pop         esi
 004A1928    pop         ebx
 004A1929    ret
*}
end;

//004A192C
procedure TGLHUDText.SetBitmapFont(Value:TGLCustomBitmapFont);
begin
{*
 004A192C    push        esi
 004A192D    push        edi
 004A192E    push        ebp
 004A192F    mov         edi,edx
 004A1931    mov         esi,eax
 004A1933    mov         ebp,dword ptr [esi+98];TGLHUDText.BitmapFont:TGLCustomBitmapFont
 004A1939    cmp         edi,ebp
>004A193B    je          004A1977
 004A193D    test        ebp,ebp
>004A193F    je          004A194A
 004A1941    mov         edx,esi
 004A1943    mov         eax,ebp
 004A1945    mov         ecx,dword ptr [eax]
 004A1947    call        dword ptr [ecx+40];TGLCustomBitmapFont.sub_004A0484
 004A194A    mov         ebp,edi
 004A194C    mov         dword ptr [esi+98],ebp;TGLHUDText.BitmapFont:TGLCustomBitmapFont
 004A1952    test        ebp,ebp
>004A1954    je          004A196C
 004A1956    mov         edx,esi
 004A1958    mov         eax,ebp
 004A195A    mov         ecx,dword ptr [eax]
 004A195C    call        dword ptr [ecx+3C];TGLCustomBitmapFont.sub_004A03F0
 004A195F    mov         edx,esi
 004A1961    mov         eax,dword ptr [esi+98];TGLHUDText.BitmapFont:TGLCustomBitmapFont
 004A1967    call        TComponent.FreeNotification
 004A196C    mov         eax,esi
 004A196E    mov         si,0FFE7
 004A1972    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A1977    pop         ebp
 004A1978    pop         edi
 004A1979    pop         esi
 004A197A    ret
*}
end;

//004A197C
procedure TGLHUDText.SetText(Value:String);
begin
{*
 004A197C    push        ebx
 004A197D    push        esi
 004A197E    mov         esi,edx
 004A1980    mov         ebx,eax
 004A1982    lea         eax,[ebx+9C];TGLHUDText.Text:String
 004A1988    mov         edx,esi
 004A198A    call        @LStrAsg
 004A198F    mov         eax,ebx
 004A1991    mov         si,0FFE7
 004A1995    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A199A    pop         esi
 004A199B    pop         ebx
 004A199C    ret
*}
end;

//004A19A0
{*procedure TGLHUDText.SetRotation(Value:Single; ?:?);
begin
 004A19A0    push        ebp
 004A19A1    mov         ebp,esp
 004A19A3    push        esi
 004A19A4    mov         edx,dword ptr [ebp+8]
 004A19A7    mov         dword ptr [eax+0A0],edx;TGLHUDText.Rotation:Single
 004A19AD    mov         si,0FFE7
 004A19B1    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A19B6    pop         esi
 004A19B7    pop         ebp
 004A19B8    ret         4
end;*}

//004A19BC
procedure TGLHUDText.SetAlignment(Value:TAlignment);
begin
{*
 004A19BC    push        esi
 004A19BD    mov         esi,eax
 004A19BF    mov         byte ptr [esi+0A4],dl;TGLHUDText.Alignment:TAlignment
 004A19C5    mov         eax,esi
 004A19C7    mov         si,0FFE7
 004A19CB    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A19D0    pop         esi
 004A19D1    ret
*}
end;

//004A19D4
procedure TGLHUDText.SetLayout(Value:TGLTextLayout);
begin
{*
 004A19D4    push        esi
 004A19D5    mov         esi,eax
 004A19D7    mov         byte ptr [esi+0A5],dl;TGLHUDText.Layout:TGLTextLayout
 004A19DD    mov         eax,esi
 004A19DF    mov         si,0FFE7
 004A19E3    call        @CallDynaInst;TGLBaseSceneObject.sub_0047CEC8
 004A19E8    pop         esi
 004A19E9    ret
*}
end;

//004A19EC
procedure TGLHUDText.SetModulateColor(Value:TGLColor);
begin
{*
 004A19EC    mov         eax,dword ptr [eax+0A8];TGLHUDText.ModulateColor:TGLColor
 004A19F2    mov         ecx,dword ptr [eax]
 004A19F4    call        dword ptr [ecx+8];TGLColor.Assign
 004A19F7    ret
*}
end;

//004A19F8
{*procedure sub_004A19F8(?:?);
begin
 004A19F8    push        ebp
 004A19F9    mov         ebp,esp
 004A19FB    add         esp,0FFFFFFF8
 004A19FE    push        ebx
 004A19FF    push        esi
 004A1A00    mov         esi,edx
 004A1A02    mov         ebx,eax
 004A1A04    cmp         dword ptr [ebx+98],0;TGLHUDText.BitmapFont:TGLCustomBitmapFont
>004A1A0B    je          004A1B92
 004A1A11    cmp         dword ptr [ebx+9C],0;TGLHUDText.Text:String
>004A1A18    je          004A1B92
 004A1A1E    mov         eax,dword ptr [esi+5C]
 004A1A21    mov         ecx,1B02
 004A1A26    mov         edx,408
 004A1A2B    call        0046D670
 004A1A30    push        1700
 004A1A35    call        OpenGL32.glMatrixMode
 004A1A3A    call        OpenGL32.glPushMatrix
 004A1A3F    mov         eax,dword ptr [ebx+5C];TGLHUDText.?f5C:TComponent
 004A1A42    mov         eax,dword ptr [eax+4C]
 004A1A45    add         eax,0AC
 004A1A4A    push        eax
 004A1A4B    call        OpenGL32.glLoadMatrixf
 004A1A50    mov         eax,dword ptr [esi+44]
 004A1A53    cmp         eax,60
>004A1A56    jne         004A1A61
 004A1A58    mov         dword ptr [ebp-4],3F800000
>004A1A5F    jmp         004A1A71
 004A1A61    mov         dword ptr [ebp-8],eax
 004A1A64    fild        dword ptr [ebp-8]
 004A1A67    fdiv        dword ptr ds:[4A1BBC];96:Single
 004A1A6D    fstp        dword ptr [ebp-4]
 004A1A70    wait
 004A1A71    push        3F800000
 004A1A76    fild        dword ptr [esi+40]
 004A1A79    fdivr       dword ptr ds:[4A1BC0];2:Single
 004A1A7F    add         esp,0FFFFFFFC
 004A1A82    fstp        dword ptr [esp]
 004A1A85    wait
 004A1A86    fild        dword ptr [esi+3C]
 004A1A89    fdivr       dword ptr ds:[4A1BC0];2:Single
 004A1A8F    add         esp,0FFFFFFFC
 004A1A92    fstp        dword ptr [esp]
 004A1A95    wait
 004A1A96    call        OpenGL32.glScalef
 004A1A9B    mov         eax,dword ptr [ebx+44];TGLHUDText.?f44:TGLCoordinates
 004A1A9E    push        dword ptr [eax+20];TGLCoordinates.Z:Single
 004A1AA1    fld         dword ptr [eax+1C];TGLCoordinates.Y:Single
 004A1AA4    fmul        dword ptr [ebp-4]
 004A1AA7    fild        dword ptr [esi+40]
 004A1AAA    fdiv        dword ptr ds:[4A1BC0];2:Single
 004A1AB0    fsubrp      st(1),st
 004A1AB2    add         esp,0FFFFFFFC
 004A1AB5    fstp        dword ptr [esp]
 004A1AB8    wait
 004A1AB9    fld         dword ptr [eax+18];TGLCoordinates.X:Single
 004A1ABC    fmul        dword ptr [ebp-4]
 004A1ABF    fild        dword ptr [esi+3C]
 004A1AC2    fdiv        dword ptr ds:[4A1BC0];2:Single
 004A1AC8    fsubp       st(1),st
 004A1ACA    add         esp,0FFFFFFFC
 004A1ACD    fstp        dword ptr [esp]
 004A1AD0    wait
 004A1AD1    call        OpenGL32.glTranslatef
 004A1AD6    fld         dword ptr [ebx+0A0];TGLHUDText.Rotation:Single
 004A1ADC    fcomp       dword ptr ds:[4A1BC4];0:Single
 004A1AE2    fnstsw      al
 004A1AE4    sahf
>004A1AE5    je          004A1AFB
 004A1AE7    push        3F800000
 004A1AEC    push        0
 004A1AEE    push        0
 004A1AF0    push        dword ptr [ebx+0A0];TGLHUDText.Rotation:Single
 004A1AF6    call        OpenGL32.glRotatef
 004A1AFB    push        3F800000
 004A1B00    mov         eax,dword ptr [ebx+50];TGLHUDText.?f50:TGLCoordinates
 004A1B03    fld         dword ptr [eax+1C];TGLCoordinates.Y:Single
 004A1B06    fmul        dword ptr [ebp-4]
 004A1B09    add         esp,0FFFFFFFC
 004A1B0C    fstp        dword ptr [esp]
 004A1B0F    wait
 004A1B10    fld         dword ptr [eax+18];TGLCoordinates.X:Single
 004A1B13    fmul        dword ptr [ebp-4]
 004A1B16    add         esp,0FFFFFFFC
 004A1B19    fstp        dword ptr [esp]
 004A1B1C    wait
 004A1B1D    call        OpenGL32.glScalef
 004A1B22    push        1701
 004A1B27    call        OpenGL32.glMatrixMode
 004A1B2C    call        OpenGL32.glPushMatrix
 004A1B31    call        OpenGL32.glLoadIdentity
 004A1B36    push        2000
 004A1B3B    call        OpenGL32.glPushAttrib
 004A1B40    push        0B71
 004A1B45    call        OpenGL32.glDisable
 004A1B4A    mov         al,byte ptr [ebx+0A4];TGLHUDText.Alignment:TAlignment
 004A1B50    push        eax
 004A1B51    mov         al,byte ptr [ebx+0A5];TGLHUDText.Layout:TGLTextLayout
 004A1B57    push        eax
 004A1B58    mov         eax,dword ptr [ebx+0A8];TGLHUDText.ModulateColor:TGLColor
 004A1B5E    add         eax,18;TGLColor.Red:Single
 004A1B61    push        eax
 004A1B62    push        0
 004A1B64    push        0
 004A1B66    mov         edx,esi
 004A1B68    mov         ecx,dword ptr [ebx+9C];TGLHUDText.Text:String
 004A1B6E    mov         eax,dword ptr [ebx+98];TGLHUDText.BitmapFont:TGLCustomBitmapFont
 004A1B74    call        004A0888
 004A1B79    call        OpenGL32.glPopAttrib
 004A1B7E    call        OpenGL32.glPopMatrix
 004A1B83    push        1700
 004A1B88    call        OpenGL32.glMatrixMode
 004A1B8D    call        OpenGL32.glPopMatrix
 004A1B92    mov         eax,ebx
 004A1B94    call        0047BA94
 004A1B99    test        eax,eax
>004A1B9B    jle         004A1BB1
 004A1B9D    push        esi
 004A1B9E    mov         eax,ebx
 004A1BA0    call        0047BA94
 004A1BA5    mov         ecx,eax
 004A1BA7    dec         ecx
 004A1BA8    xor         edx,edx
 004A1BAA    mov         eax,ebx
 004A1BAC    mov         ebx,dword ptr [eax]
 004A1BAE    call        dword ptr [ebx+6C];TGLHUDText.sub_0047D7AC
 004A1BB1    pop         esi
 004A1BB2    pop         ebx
 004A1BB3    pop         ecx
 004A1BB4    pop         ecx
 004A1BB5    pop         ebp
 004A1BB6    ret         4
end;*}

Initialization
//004A1BF8
{*
 004A1BF8    push        ebp
 004A1BF9    mov         ebp,esp
 004A1BFB    add         esp,0FFFFFFF8
 004A1BFE    sub         dword ptr ds:[5E1594],1
>004A1C05    jae         004A1C24
 004A1C07    mov         eax,[004A1310];TGLHUDText
 004A1C0C    mov         dword ptr [ebp-8],eax
 004A1C0F    mov         eax,[004A11D4];TGLHUDSprite
 004A1C14    mov         dword ptr [ebp-4],eax
 004A1C17    lea         eax,[ebp-8]
 004A1C1A    mov         edx,1
 004A1C1F    call        RegisterClasses
 004A1C24    pop         ecx
 004A1C25    pop         ecx
 004A1C26    pop         ebp
 004A1C27    ret
*}
Finalization
end.