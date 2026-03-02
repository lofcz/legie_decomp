//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit66;

interface

uses
  SysUtils, Classes;

    procedure glAlphaFunc(ref:Single); stdcall;//0045FECC
    procedure glBegin; stdcall;//0045FED4
    glBindTexture;//0045FEDC
    procedure glBlendFunc(dfactor:Cardinal); stdcall;//0045FEE4
    procedure glCallList; stdcall;//0045FEEC
    procedure glClear; stdcall;//0045FEF4
    procedure glClearColor(green:Single; blue:Single; alpha:Single); stdcall;//0045FEFC
    procedure glColor3f(green:Single; blue:Single); stdcall;//0045FF04
    procedure glColor3fv; stdcall;//0045FF0C
    //function glColor4f(green:Single; blue:Single; alpha:Single):?; stdcall;//0045FF14
    //function glColor4fv:?; stdcall;//0045FF1C
    procedure glColorMask(green:ByteBool; blue:ByteBool; alpha:ByteBool); stdcall;//0045FF24
    procedure glColorMaterial(mode:Cardinal); stdcall;//0045FF2C
    glColorPointer;//0045FF34
    glCopyTexSubImage2D;//0045FF3C
    procedure glDeleteLists(range:Integer); stdcall;//0045FF44
    glDeleteTextures;//0045FF4C
    procedure glDepthFunc; stdcall;//0045FF54
    procedure glDepthMask; stdcall;//0045FF5C
    procedure glDisable; stdcall;//0045FF64
    glDisableClientState;//0045FF6C
    glDrawArrays;//0045FF74
    glDrawElements;//0045FF7C
    procedure glDrawPixels(height:Integer; format:Cardinal; pixeltype:Cardinal; pixels:Pointer); stdcall;//0045FF84
    procedure glEnable; stdcall;//0045FF8C
    glEnableClientState;//0045FF94
    procedure glEnd;//0045FF9C
    procedure glEndList;//0045FFA4
    procedure glEvalCoord1f; stdcall;//0045FFAC
    procedure glFogf(param:Single); stdcall;//0045FFB4
    procedure glFogfv(params:PGLfloat); stdcall;//0045FFBC
    procedure glFogi(param:Integer); stdcall;//0045FFC4
    procedure glFrontFace; stdcall;//0045FFCC
    procedure glFrustum(right:Double; bottom:Double; top:Double; zNear:Double; zFar:Double); stdcall;//0045FFD4
    function glGenLists:Cardinal; stdcall;//0045FFDC
    glGenTextures;//0045FFE4
    function glGetError:Cardinal;//0045FFEC
    procedure glGetFloatv(params:PGLfloat); stdcall;//0045FFF4
    procedure glGetIntegerv(params:PGLInt); stdcall;//0045FFFC
    function glGetString:PChar; stdcall;//00460004
    procedure glGetTexLevelParameteriv(level:Integer; pname:Cardinal; params:PGLInt); stdcall;//0046000C
    procedure glHint(mode:Cardinal); stdcall;//00460014
    glInterleavedArrays;//0046001C
    //function glIsTexture:?;//00460024
    procedure glLightModelfv(params:PGLfloat); stdcall;//0046002C
    procedure glLightModeli(param:Integer); stdcall;//00460034
    procedure glLightf(pname:Cardinal; param:Single); stdcall;//0046003C
    procedure glLightfv(pname:Cardinal; params:PGLfloat); stdcall;//00460044
    procedure glLineStipple(pattern:Word); stdcall;//0046004C
    procedure glLineWidth; stdcall;//00460054
    procedure glLoadIdentity;//0046005C
    procedure glLoadMatrixf; stdcall;//00460064
    procedure glLoadName; stdcall;//0046006C
    procedure glMap1f(u1:Single; u2:Single; stride:Integer; order:Integer; Points:PGLfloat); stdcall;//00460074
    procedure glMaterialfv(pname:Cardinal; params:PGLfloat); stdcall;//0046007C
    procedure glMateriali(pname:Cardinal; param:Integer); stdcall;//00460084
    procedure glMatrixMode; stdcall;//0046008C
    procedure glMultMatrixf; stdcall;//00460094
    procedure glNewList(mode:Cardinal); stdcall;//0046009C
    procedure glNormal3f(ny:Single; nz:Single); stdcall;//004600A4
    procedure glNormal3fv; stdcall;//004600AC
    glNormalPointer;//004600B4
    procedure glOrtho(right:Double; bottom:Double; top:Double; zNear:Double; zFar:Double); stdcall;//004600BC
    procedure glPixelStorei(param:Integer); stdcall;//004600C4
    procedure glPointSize; stdcall;//004600CC
    //function glPolygonMode(mode:Cardinal):?; stdcall;//004600D4
    procedure glPopAttrib;//004600DC
    procedure glPopMatrix;//004600E4
    procedure glPopName;//004600EC
    procedure glPushAttrib; stdcall;//004600F4
    procedure glPushMatrix;//004600FC
    procedure glPushName; stdcall;//00460104
    procedure glRasterPos2f(y:Single); stdcall;//0046010C
    procedure glReadPixels(y:Integer; width:Integer; height:Integer; format:Cardinal; _type:Cardinal; pixels:Pointer); stdcall;//00460114
    procedure glRotatef(x:Single; y:Single; z:Single); stdcall;//0046011C
    procedure glScalef(y:Single; z:Single); stdcall;//00460124
    procedure glShadeModel; stdcall;//0046012C
    procedure glTexCoord2f(t:Single); stdcall;//00460134
    procedure glTexCoord2fv; stdcall;//0046013C
    procedure glTexCoord3f(t:Single; r:Single); stdcall;//00460144
    procedure glTexCoord3fv; stdcall;//0046014C
    procedure glTexCoord4f(t:Single; r:Single; q:Single); stdcall;//00460154
    procedure glTexCoord4fv; stdcall;//0046015C
    glTexCoordPointer;//00460164
    procedure glTexEnvfv(pname:Cardinal; params:PGLfloat); stdcall;//0046016C
    procedure glTexEnvi(pname:Cardinal; param:Integer); stdcall;//00460174
    procedure glTexGenf(pname:Cardinal; param:Single); stdcall;//0046017C
    procedure glTexGenfv(pname:Cardinal; params:PGLfloat); stdcall;//00460184
    procedure glTexGeni(pname:Cardinal; param:Integer); stdcall;//0046018C
    procedure glTexGeniv(pname:Cardinal; params:PGLInt); stdcall;//00460194
    procedure glTexImage2D(level:Integer; components:Integer; width:Integer; height:Integer; border:Integer; format:Cardinal; _type:Cardinal; pixels:Pointer); stdcall;//0046019C
    procedure glTexParameteri(pname:Cardinal; param:Integer); stdcall;//004601A4
    procedure glTranslatef(y:Single; z:Single); stdcall;//004601AC
    procedure glVertex2f(y:Single); stdcall;//004601B4
    procedure glVertex3f(y:Single; z:Single); stdcall;//004601BC
    //function glVertex3fv:?; stdcall;//004601C4
    procedure glVertex4fv; stdcall;//004601CC
    glVertexPointer;//004601D4
    procedure glViewport(y:Integer; width:Integer; height:Integer); stdcall;//004601DC
    function gluErrorString:PChar; stdcall;//004601E4
    function gluGetString:PChar; stdcall;//004601EC
    procedure gluOrtho2D(right:Double; bottom:Double; top:Double); stdcall;//004601F4
    procedure gluPickMatrix(y:Double; width:Double; height:Double; viewport:PGLInt); stdcall;//004601FC
    procedure gluLookAt(eyey:Double; eyez:Double; centerx:Double; centery:Double; centerz:Double; upx:Double; upy:Double; upz:Double); stdcall;//00460204
    function gluScaleImage(widthin:Integer; heightin:Integer; typein:Cardinal; datain:Pointer; widthout:Integer; heightout:Integer; typeout:Cardinal; dataout:Pointer):Integer; stdcall;//0046020C
    function gluBuild2DMipmaps(components:Integer; width:Integer; height:Integer; format:Cardinal; atype:Cardinal; data:Pointer):Integer; stdcall;//00460214
    function gluNewNurbsRenderer:GLUnurbsObj;//0046021C
    procedure gluDeleteNurbsRenderer; stdcall;//00460224
    procedure gluBeginCurve; stdcall;//0046022C
    procedure gluEndCurve; stdcall;//00460234
    procedure gluNurbsCurve(nknots:Integer; knot:PGLfloat; stride:Integer; ctlpts:PGLfloat; order:Integer; _type:Cardinal); stdcall;//0046023C
    procedure gluNurbsProperty(prop:Cardinal; value:Single); stdcall;//00460244
    function wglGetProcAddress:Pointer; stdcall;//0046024C
    function wglCreateContext:HGLRC; stdcall;//00460254
    function wglDeleteContext:LongBool; stdcall;//0046025C
    function wglGetCurrentDC:HDC;//00460264
    function wglMakeCurrent(p2:HGLRC):LongBool; stdcall;//0046026C
    function wglShareLists(p2:HGLRC):LongBool; stdcall;//00460274
    //function sub_0046028C:?;//0046028C
    procedure sub_00460294;//00460294
    procedure sub_00463810;//00463810
    //procedure sub_00463A6C(?:AnsiString; ?:?; ?:?);//00463A6C
    //function sub_00463C0C(?:AnsiString; ?:?):?;//00463C0C
    procedure sub_00463C68;//00463C68
    //function sub_00464EC8(?:AnsiString; ?:?):Boolean;//00464EC8
    procedure sub_00464EE4;//00464EE4
    procedure sub_00465098;//00465098
    //function sub_004650D0:?;//004650D0
    //function sub_00465150(?:?; ?:?):?;//00465150
    function sub_004651C8:Boolean;//004651C8

implementation

//0045FECC
procedure OpenGL32.glAlphaFunc(ref:Single); stdcall;
begin
{*
 0045FECC    jmp         dword ptr ds:[6089BC]
*}
end;

//0045FED4
procedure OpenGL32.glBegin; stdcall;
begin
{*
 0045FED4    jmp         dword ptr ds:[6089B8]
*}
end;

//0045FEE4
procedure OpenGL32.glBlendFunc(dfactor:Cardinal); stdcall;
begin
{*
 0045FEE4    jmp         dword ptr ds:[6089B0]
*}
end;

//0045FEEC
procedure OpenGL32.glCallList; stdcall;
begin
{*
 0045FEEC    jmp         dword ptr ds:[6089AC]
*}
end;

//0045FEF4
procedure OpenGL32.glClear; stdcall;
begin
{*
 0045FEF4    jmp         dword ptr ds:[6089A8]
*}
end;

//0045FEFC
procedure OpenGL32.glClearColor(green:Single; blue:Single; alpha:Single); stdcall;
begin
{*
 0045FEFC    jmp         dword ptr ds:[6089A4]
*}
end;

//0045FF04
procedure OpenGL32.glColor3f(green:Single; blue:Single); stdcall;
begin
{*
 0045FF04    jmp         dword ptr ds:[6089A0]
*}
end;

//0045FF0C
procedure OpenGL32.glColor3fv; stdcall;
begin
{*
 0045FF0C    jmp         dword ptr ds:[60899C]
*}
end;

//0045FF14
{*function OpenGL32.glColor4f(green:Single; blue:Single; alpha:Single):?; stdcall;
begin
 0045FF14    jmp         dword ptr ds:[608998]
end;*}

//0045FF1C
{*function OpenGL32.glColor4fv:?; stdcall;
begin
 0045FF1C    jmp         dword ptr ds:[608994]
end;*}

//0045FF24
procedure OpenGL32.glColorMask(green:ByteBool; blue:ByteBool; alpha:ByteBool); stdcall;
begin
{*
 0045FF24    jmp         dword ptr ds:[608990]
*}
end;

//0045FF2C
procedure OpenGL32.glColorMaterial(mode:Cardinal); stdcall;
begin
{*
 0045FF2C    jmp         dword ptr ds:[60898C]
*}
end;

//0045FF44
procedure OpenGL32.glDeleteLists(range:Integer); stdcall;
begin
{*
 0045FF44    jmp         dword ptr ds:[608980]
*}
end;

//0045FF54
procedure OpenGL32.glDepthFunc; stdcall;
begin
{*
 0045FF54    jmp         dword ptr ds:[608978]
*}
end;

//0045FF5C
procedure OpenGL32.glDepthMask; stdcall;
begin
{*
 0045FF5C    jmp         dword ptr ds:[608974]
*}
end;

//0045FF64
procedure OpenGL32.glDisable; stdcall;
begin
{*
 0045FF64    jmp         dword ptr ds:[608970]
*}
end;

//0045FF84
procedure OpenGL32.glDrawPixels(height:Integer; format:Cardinal; pixeltype:Cardinal; pixels:Pointer); stdcall;
begin
{*
 0045FF84    jmp         dword ptr ds:[608960]
*}
end;

//0045FF8C
procedure OpenGL32.glEnable; stdcall;
begin
{*
 0045FF8C    jmp         dword ptr ds:[60895C]
*}
end;

//0045FF9C
procedure OpenGL32.glEnd;
begin
{*
 0045FF9C    jmp         dword ptr ds:[608954]
*}
end;

//0045FFA4
procedure OpenGL32.glEndList;
begin
{*
 0045FFA4    jmp         dword ptr ds:[608950]
*}
end;

//0045FFAC
procedure OpenGL32.glEvalCoord1f; stdcall;
begin
{*
 0045FFAC    jmp         dword ptr ds:[60894C]
*}
end;

//0045FFB4
procedure OpenGL32.glFogf(param:Single); stdcall;
begin
{*
 0045FFB4    jmp         dword ptr ds:[608948]
*}
end;

//0045FFBC
procedure OpenGL32.glFogfv(params:PGLfloat); stdcall;
begin
{*
 0045FFBC    jmp         dword ptr ds:[608944]
*}
end;

//0045FFC4
procedure OpenGL32.glFogi(param:Integer); stdcall;
begin
{*
 0045FFC4    jmp         dword ptr ds:[608940]
*}
end;

//0045FFCC
procedure OpenGL32.glFrontFace; stdcall;
begin
{*
 0045FFCC    jmp         dword ptr ds:[60893C]
*}
end;

//0045FFD4
procedure OpenGL32.glFrustum(right:Double; bottom:Double; top:Double; zNear:Double; zFar:Double); stdcall;
begin
{*
 0045FFD4    jmp         dword ptr ds:[608938]
*}
end;

//0045FFDC
function OpenGL32.glGenLists:Cardinal; stdcall;
begin
{*
 0045FFDC    jmp         dword ptr ds:[608934]
*}
end;

//0045FFEC
function OpenGL32.glGetError:Cardinal;
begin
{*
 0045FFEC    jmp         dword ptr ds:[60892C]
*}
end;

//0045FFF4
procedure OpenGL32.glGetFloatv(params:PGLfloat); stdcall;
begin
{*
 0045FFF4    jmp         dword ptr ds:[608928]
*}
end;

//0045FFFC
procedure OpenGL32.glGetIntegerv(params:PGLInt); stdcall;
begin
{*
 0045FFFC    jmp         dword ptr ds:[608924]
*}
end;

//00460004
function OpenGL32.glGetString:PChar; stdcall;
begin
{*
 00460004    jmp         dword ptr ds:[608920]
*}
end;

//0046000C
procedure OpenGL32.glGetTexLevelParameteriv(level:Integer; pname:Cardinal; params:PGLInt); stdcall;
begin
{*
 0046000C    jmp         dword ptr ds:[60891C]
*}
end;

//00460014
procedure OpenGL32.glHint(mode:Cardinal); stdcall;
begin
{*
 00460014    jmp         dword ptr ds:[608918]
*}
end;

//00460024
{*function OpenGL32.glIsTexture:?;
begin
 00460024    jmp         dword ptr ds:[608910]
end;*}

//0046002C
procedure OpenGL32.glLightModelfv(params:PGLfloat); stdcall;
begin
{*
 0046002C    jmp         dword ptr ds:[60890C]
*}
end;

//00460034
procedure OpenGL32.glLightModeli(param:Integer); stdcall;
begin
{*
 00460034    jmp         dword ptr ds:[608908]
*}
end;

//0046003C
procedure OpenGL32.glLightf(pname:Cardinal; param:Single); stdcall;
begin
{*
 0046003C    jmp         dword ptr ds:[608904]
*}
end;

//00460044
procedure OpenGL32.glLightfv(pname:Cardinal; params:PGLfloat); stdcall;
begin
{*
 00460044    jmp         dword ptr ds:[608900]
*}
end;

//0046004C
procedure OpenGL32.glLineStipple(pattern:Word); stdcall;
begin
{*
 0046004C    jmp         dword ptr ds:[6088FC]
*}
end;

//00460054
procedure OpenGL32.glLineWidth; stdcall;
begin
{*
 00460054    jmp         dword ptr ds:[6088F8]
*}
end;

//0046005C
procedure OpenGL32.glLoadIdentity;
begin
{*
 0046005C    jmp         dword ptr ds:[6088F4]
*}
end;

//00460064
procedure OpenGL32.glLoadMatrixf; stdcall;
begin
{*
 00460064    jmp         dword ptr ds:[6088F0]
*}
end;

//0046006C
procedure OpenGL32.glLoadName; stdcall;
begin
{*
 0046006C    jmp         dword ptr ds:[6088EC]
*}
end;

//00460074
procedure OpenGL32.glMap1f(u1:Single; u2:Single; stride:Integer; order:Integer; Points:PGLfloat); stdcall;
begin
{*
 00460074    jmp         dword ptr ds:[6088E8]
*}
end;

//0046007C
procedure OpenGL32.glMaterialfv(pname:Cardinal; params:PGLfloat); stdcall;
begin
{*
 0046007C    jmp         dword ptr ds:[6088E4]
*}
end;

//00460084
procedure OpenGL32.glMateriali(pname:Cardinal; param:Integer); stdcall;
begin
{*
 00460084    jmp         dword ptr ds:[6088E0]
*}
end;

//0046008C
procedure OpenGL32.glMatrixMode; stdcall;
begin
{*
 0046008C    jmp         dword ptr ds:[6088DC]
*}
end;

//00460094
procedure OpenGL32.glMultMatrixf; stdcall;
begin
{*
 00460094    jmp         dword ptr ds:[6088D8]
*}
end;

//0046009C
procedure OpenGL32.glNewList(mode:Cardinal); stdcall;
begin
{*
 0046009C    jmp         dword ptr ds:[6088D4]
*}
end;

//004600A4
procedure OpenGL32.glNormal3f(ny:Single; nz:Single); stdcall;
begin
{*
 004600A4    jmp         dword ptr ds:[6088D0]
*}
end;

//004600AC
procedure OpenGL32.glNormal3fv; stdcall;
begin
{*
 004600AC    jmp         dword ptr ds:[6088CC]
*}
end;

//004600BC
procedure OpenGL32.glOrtho(right:Double; bottom:Double; top:Double; zNear:Double; zFar:Double); stdcall;
begin
{*
 004600BC    jmp         dword ptr ds:[6088C4]
*}
end;

//004600C4
procedure OpenGL32.glPixelStorei(param:Integer); stdcall;
begin
{*
 004600C4    jmp         dword ptr ds:[6088C0]
*}
end;

//004600CC
procedure OpenGL32.glPointSize; stdcall;
begin
{*
 004600CC    jmp         dword ptr ds:[6088BC]
*}
end;

//004600D4
{*function OpenGL32.glPolygonMode(mode:Cardinal):?; stdcall;
begin
 004600D4    jmp         dword ptr ds:[6088B8]
end;*}

//004600DC
procedure OpenGL32.glPopAttrib;
begin
{*
 004600DC    jmp         dword ptr ds:[6088B4]
*}
end;

//004600E4
procedure OpenGL32.glPopMatrix;
begin
{*
 004600E4    jmp         dword ptr ds:[6088B0]
*}
end;

//004600EC
procedure OpenGL32.glPopName;
begin
{*
 004600EC    jmp         dword ptr ds:[6088AC]
*}
end;

//004600F4
procedure OpenGL32.glPushAttrib; stdcall;
begin
{*
 004600F4    jmp         dword ptr ds:[6088A8]
*}
end;

//004600FC
procedure OpenGL32.glPushMatrix;
begin
{*
 004600FC    jmp         dword ptr ds:[6088A4]
*}
end;

//00460104
procedure OpenGL32.glPushName; stdcall;
begin
{*
 00460104    jmp         dword ptr ds:[6088A0]
*}
end;

//0046010C
procedure OpenGL32.glRasterPos2f(y:Single); stdcall;
begin
{*
 0046010C    jmp         dword ptr ds:[60889C]
*}
end;

//00460114
procedure OpenGL32.glReadPixels(y:Integer; width:Integer; height:Integer; format:Cardinal; _type:Cardinal; pixels:Pointer); stdcall;
begin
{*
 00460114    jmp         dword ptr ds:[608898]
*}
end;

//0046011C
procedure OpenGL32.glRotatef(x:Single; y:Single; z:Single); stdcall;
begin
{*
 0046011C    jmp         dword ptr ds:[608894]
*}
end;

//00460124
procedure OpenGL32.glScalef(y:Single; z:Single); stdcall;
begin
{*
 00460124    jmp         dword ptr ds:[608890]
*}
end;

//0046012C
procedure OpenGL32.glShadeModel; stdcall;
begin
{*
 0046012C    jmp         dword ptr ds:[60888C]
*}
end;

//00460134
procedure OpenGL32.glTexCoord2f(t:Single); stdcall;
begin
{*
 00460134    jmp         dword ptr ds:[608888]
*}
end;

//0046013C
procedure OpenGL32.glTexCoord2fv; stdcall;
begin
{*
 0046013C    jmp         dword ptr ds:[608884]
*}
end;

//00460144
procedure OpenGL32.glTexCoord3f(t:Single; r:Single); stdcall;
begin
{*
 00460144    jmp         dword ptr ds:[608880]
*}
end;

//0046014C
procedure OpenGL32.glTexCoord3fv; stdcall;
begin
{*
 0046014C    jmp         dword ptr ds:[60887C]
*}
end;

//00460154
procedure OpenGL32.glTexCoord4f(t:Single; r:Single; q:Single); stdcall;
begin
{*
 00460154    jmp         dword ptr ds:[608878]
*}
end;

//0046015C
procedure OpenGL32.glTexCoord4fv; stdcall;
begin
{*
 0046015C    jmp         dword ptr ds:[608874]
*}
end;

//0046016C
procedure OpenGL32.glTexEnvfv(pname:Cardinal; params:PGLfloat); stdcall;
begin
{*
 0046016C    jmp         dword ptr ds:[60886C]
*}
end;

//00460174
procedure OpenGL32.glTexEnvi(pname:Cardinal; param:Integer); stdcall;
begin
{*
 00460174    jmp         dword ptr ds:[608868]
*}
end;

//0046017C
procedure OpenGL32.glTexGenf(pname:Cardinal; param:Single); stdcall;
begin
{*
 0046017C    jmp         dword ptr ds:[608864]
*}
end;

//00460184
procedure OpenGL32.glTexGenfv(pname:Cardinal; params:PGLfloat); stdcall;
begin
{*
 00460184    jmp         dword ptr ds:[608860]
*}
end;

//0046018C
procedure OpenGL32.glTexGeni(pname:Cardinal; param:Integer); stdcall;
begin
{*
 0046018C    jmp         dword ptr ds:[60885C]
*}
end;

//00460194
procedure OpenGL32.glTexGeniv(pname:Cardinal; params:PGLInt); stdcall;
begin
{*
 00460194    jmp         dword ptr ds:[608858]
*}
end;

//0046019C
procedure OpenGL32.glTexImage2D(level:Integer; components:Integer; width:Integer; height:Integer; border:Integer; format:Cardinal; _type:Cardinal; pixels:Pointer); stdcall;
begin
{*
 0046019C    jmp         dword ptr ds:[608854]
*}
end;

//004601A4
procedure OpenGL32.glTexParameteri(pname:Cardinal; param:Integer); stdcall;
begin
{*
 004601A4    jmp         dword ptr ds:[608850]
*}
end;

//004601AC
procedure OpenGL32.glTranslatef(y:Single; z:Single); stdcall;
begin
{*
 004601AC    jmp         dword ptr ds:[60884C]
*}
end;

//004601B4
procedure OpenGL32.glVertex2f(y:Single); stdcall;
begin
{*
 004601B4    jmp         dword ptr ds:[608848]
*}
end;

//004601BC
procedure OpenGL32.glVertex3f(y:Single; z:Single); stdcall;
begin
{*
 004601BC    jmp         dword ptr ds:[608844]
*}
end;

//004601C4
{*function OpenGL32.glVertex3fv:?; stdcall;
begin
 004601C4    jmp         dword ptr ds:[608840]
end;*}

//004601CC
procedure OpenGL32.glVertex4fv; stdcall;
begin
{*
 004601CC    jmp         dword ptr ds:[60883C]
*}
end;

//004601DC
procedure OpenGL32.glViewport(y:Integer; width:Integer; height:Integer); stdcall;
begin
{*
 004601DC    jmp         dword ptr ds:[608834]
*}
end;

//004601E4
function GLU32.gluErrorString:PChar; stdcall;
begin
{*
 004601E4    jmp         dword ptr ds:[6089F4]
*}
end;

//004601EC
function GLU32.gluGetString:PChar; stdcall;
begin
{*
 004601EC    jmp         dword ptr ds:[6089F0]
*}
end;

//004601F4
procedure GLU32.gluOrtho2D(right:Double; bottom:Double; top:Double); stdcall;
begin
{*
 004601F4    jmp         dword ptr ds:[6089EC]
*}
end;

//004601FC
procedure GLU32.gluPickMatrix(y:Double; width:Double; height:Double; viewport:PGLInt); stdcall;
begin
{*
 004601FC    jmp         dword ptr ds:[6089E8]
*}
end;

//00460204
procedure GLU32.gluLookAt(eyey:Double; eyez:Double; centerx:Double; centery:Double; centerz:Double; upx:Double; upy:Double; upz:Double); stdcall;
begin
{*
 00460204    jmp         dword ptr ds:[6089E4]
*}
end;

//0046020C
function GLU32.gluScaleImage(widthin:Integer; heightin:Integer; typein:Cardinal; datain:Pointer; widthout:Integer; heightout:Integer; typeout:Cardinal; dataout:Pointer):Integer; stdcall;
begin
{*
 0046020C    jmp         dword ptr ds:[6089E0]
*}
end;

//00460214
function GLU32.gluBuild2DMipmaps(components:Integer; width:Integer; height:Integer; format:Cardinal; atype:Cardinal; data:Pointer):Integer; stdcall;
begin
{*
 00460214    jmp         dword ptr ds:[6089DC]
*}
end;

//0046021C
function GLU32.gluNewNurbsRenderer:GLUnurbsObj;
begin
{*
 0046021C    jmp         dword ptr ds:[6089D8]
*}
end;

//00460224
procedure GLU32.gluDeleteNurbsRenderer; stdcall;
begin
{*
 00460224    jmp         dword ptr ds:[6089D4]
*}
end;

//0046022C
procedure GLU32.gluBeginCurve; stdcall;
begin
{*
 0046022C    jmp         dword ptr ds:[6089D0]
*}
end;

//00460234
procedure GLU32.gluEndCurve; stdcall;
begin
{*
 00460234    jmp         dword ptr ds:[6089CC]
*}
end;

//0046023C
procedure GLU32.gluNurbsCurve(nknots:Integer; knot:PGLfloat; stride:Integer; ctlpts:PGLfloat; order:Integer; _type:Cardinal); stdcall;
begin
{*
 0046023C    jmp         dword ptr ds:[6089C8]
*}
end;

//00460244
procedure GLU32.gluNurbsProperty(prop:Cardinal; value:Single); stdcall;
begin
{*
 00460244    jmp         dword ptr ds:[6089C4]
*}
end;

//0046024C
function OpenGL32.wglGetProcAddress:Pointer; stdcall;
begin
{*
 0046024C    jmp         dword ptr ds:[608830]
*}
end;

//00460254
function OpenGL32.wglCreateContext:HGLRC; stdcall;
begin
{*
 00460254    jmp         dword ptr ds:[60882C]
*}
end;

//0046025C
function OpenGL32.wglDeleteContext:LongBool; stdcall;
begin
{*
 0046025C    jmp         dword ptr ds:[608828]
*}
end;

//00460264
function OpenGL32.wglGetCurrentDC:HDC;
begin
{*
 00460264    jmp         dword ptr ds:[608824]
*}
end;

//0046026C
function OpenGL32.wglMakeCurrent(p2:HGLRC):LongBool; stdcall;
begin
{*
 0046026C    jmp         dword ptr ds:[608820]
*}
end;

//00460274
function OpenGL32.wglShareLists(p2:HGLRC):LongBool; stdcall;
begin
{*
 00460274    jmp         dword ptr ds:[60881C]
*}
end;

//0046028C
{*function sub_0046028C:?;
begin
 0046028C    push        eax
 0046028D    call        OpenGL32.wglGetProcAddress
 00460292    ret
end;*}

//00460294
procedure sub_00460294;
begin
{*
 00460294    mov         eax,4617E0
 00460299    call        0046028C
 0046029E    mov         [005E0D3C],eax;gvar_005E0D3C
 004602A3    mov         eax,4617F4
 004602A8    call        0046028C
 004602AD    mov         [005E0D40],eax;gvar_005E0D40
 004602B2    mov         eax,461804
 004602B7    call        0046028C
 004602BC    mov         [005E0D44],eax;gvar_005E0D44
 004602C1    mov         eax,461814
 004602C6    call        0046028C
 004602CB    mov         [005E0D48],eax;gvar_005E0D48
 004602D0    mov         eax,461824
 004602D5    call        0046028C
 004602DA    mov         [005E0D4C],eax;gvar_005E0D4C
 004602DF    mov         eax,461834
 004602E4    call        0046028C
 004602E9    mov         [005E0D50],eax;gvar_005E0D50
 004602EE    mov         eax,461834
 004602F3    call        0046028C
 004602F8    mov         [005E0D54],eax;gvar_005E0D54
 004602FD    mov         eax,461848
 00460302    call        0046028C
 00460307    mov         [005E0D58],eax;gvar_005E0D58
 0046030C    mov         eax,46185C
 00460311    call        0046028C
 00460316    mov         [005E0D5C],eax;gvar_005E0D5C
 0046031B    mov         eax,461874
 00460320    call        0046028C
 00460325    mov         [005E0D60],eax;gvar_005E0D60
 0046032A    mov         eax,46188C
 0046032F    call        0046028C
 00460334    mov         [005E0D64],eax;gvar_005E0D64
 00460339    mov         eax,46189C
 0046033E    call        0046028C
 00460343    mov         [005E0D68],eax;gvar_005E0D68
 00460348    mov         eax,4618B8
 0046034D    call        0046028C
 00460352    mov         [005E0D6C],eax;gvar_005E0D6C
 00460357    mov         eax,4618D4
 0046035C    call        0046028C
 00460361    mov         [005E0D70],eax;gvar_005E0D70
 00460366    mov         eax,4618EC
 0046036B    call        0046028C
 00460370    mov         [005E0D74],eax;gvar_005E0D74
 00460375    mov         eax,461904
 0046037A    call        0046028C
 0046037F    mov         [005E0D78],eax;gvar_005E0D78
 00460384    mov         eax,461920
 00460389    call        0046028C
 0046038E    mov         [005E0D7C],eax;gvar_005E0D7C
 00460393    mov         eax,46193C
 00460398    call        0046028C
 0046039D    mov         [005E0D80],eax;gvar_005E0D80
 004603A2    mov         eax,461954
 004603A7    call        0046028C
 004603AC    mov         [005E0D84],eax;gvar_005E0D84
 004603B1    mov         eax,461968
 004603B6    call        0046028C
 004603BB    mov         [005E0D88],eax;gvar_005E0D88
 004603C0    mov         eax,461980
 004603C5    call        0046028C
 004603CA    mov         [005E0D8C],eax;gvar_005E0D8C
 004603CF    mov         eax,461998
 004603D4    call        0046028C
 004603D9    mov         [005E0D90],eax;gvar_005E0D90
 004603DE    mov         eax,4619B4
 004603E3    call        0046028C
 004603E8    mov         [005E0D94],eax;gvar_005E0D94
 004603ED    mov         eax,4619CC
 004603F2    call        0046028C
 004603F7    mov         [005E0D98],eax;gvar_005E0D98
 004603FC    mov         eax,4619E8
 00460401    call        0046028C
 00460406    mov         [005E0D9C],eax;gvar_005E0D9C
 0046040B    mov         eax,461A04
 00460410    call        0046028C
 00460415    mov         [005E0DA0],eax;gvar_005E0DA0
 0046041A    mov         eax,461A20
 0046041F    call        0046028C
 00460424    mov         [005E0DA4],eax;gvar_005E0DA4
 00460429    mov         eax,461A2C
 0046042E    call        0046028C
 00460433    mov         [005E0DA8],eax;gvar_005E0DA8
 00460438    mov         eax,461A40
 0046043D    call        0046028C
 00460442    mov         [005E0DAC],eax;gvar_005E0DAC
 00460447    mov         eax,461A50
 0046044C    call        0046028C
 00460451    mov         [005E0DB0],eax;gvar_005E0DB0
 00460456    mov         eax,461A6C
 0046045B    call        0046028C
 00460460    mov         [005E0DB4],eax;gvar_005E0DB4
 00460465    mov         eax,461A88
 0046046A    call        0046028C
 0046046F    mov         [005E0DB8],eax;gvar_005E0DB8
 00460474    mov         eax,461A94
 00460479    call        0046028C
 0046047E    mov         [005E0DBC],eax;gvar_005E0DBC
 00460483    mov         eax,461AA4
 00460488    call        0046028C
 0046048D    mov         [005E0DC0],eax;gvar_005E0DC0
 00460492    mov         eax,461AB0
 00460497    call        0046028C
 0046049C    mov         [005E0DC4],eax;gvar_005E0DC4
 004604A1    mov         eax,461AC8
 004604A6    call        0046028C
 004604AB    mov         [005E0DC8],eax;gvar_005E0DC8
 004604B0    mov         eax,461AE0
 004604B5    call        0046028C
 004604BA    mov         [005E0EA0],eax;gvar_005E0EA0
 004604BF    mov         eax,461AF8
 004604C4    call        0046028C
 004604C9    mov         [005E0EA8],eax;gvar_005E0EA8
 004604CE    mov         eax,461B08
 004604D3    call        0046028C
 004604D8    mov         [005E0EAC],eax;gvar_005E0EAC
 004604DD    mov         eax,461B1C
 004604E2    call        0046028C
 004604E7    mov         [005E0ECC],eax;gvar_005E0ECC
 004604EC    mov         eax,461B30
 004604F1    call        0046028C
 004604F6    mov         [005E0ED4],eax;gvar_005E0ED4
 004604FB    mov         eax,461B4C
 00460500    call        0046028C
 00460505    mov         [005E0ED0],eax;gvar_005E0ED0
 0046050A    mov         eax,461B68
 0046050F    call        0046028C
 00460514    mov         [005E0EB0],eax;gvar_005E0EB0
 00460519    mov         eax,461B7C
 0046051E    call        0046028C
 00460523    mov         [005E0EB4],eax;gvar_005E0EB4
 00460528    mov         eax,461B94
 0046052D    call        0046028C
 00460532    mov         [005E0EB8],eax;gvar_005E0EB8
 00460537    mov         eax,461BA8
 0046053C    call        0046028C
 00460541    mov         [005E0EBC],eax;gvar_005E0EBC
 00460546    mov         eax,461BC0
 0046054B    call        0046028C
 00460550    mov         [005E0EC0],eax;gvar_005E0EC0
 00460555    mov         eax,461BD8
 0046055A    call        0046028C
 0046055F    mov         [005E0ED8],eax;gvar_005E0ED8
 00460564    mov         eax,461BE8
 00460569    call        0046028C
 0046056E    mov         [005E0EDC],eax;gvar_005E0EDC
 00460573    mov         eax,461BFC
 00460578    call        0046028C
 0046057D    mov         [005E0EE4],eax;gvar_005E0EE4
 00460582    mov         eax,461C10
 00460587    call        0046028C
 0046058C    mov         [005E0EEC],eax;gvar_005E0EEC
 00460591    mov         eax,461C24
 00460596    call        0046028C
 0046059B    mov         [005E0EF0],eax;gvar_005E0EF0
 004605A0    mov         eax,461C38
 004605A5    call        0046028C
 004605AA    mov         [005E0EF4],eax;gvar_005E0EF4
 004605AF    mov         eax,461C4C
 004605B4    call        0046028C
 004605B9    mov         [005E0EC8],eax;gvar_005E0EC8
 004605BE    mov         eax,461C60
 004605C3    call        0046028C
 004605C8    mov         [005E0EC4],eax;gvar_005E0EC4
 004605CD    mov         eax,461C74
 004605D2    call        0046028C
 004605D7    mov         [005E0EA4],eax;gvar_005E0EA4
 004605DC    mov         eax,461C88
 004605E1    call        0046028C
 004605E6    mov         [005E0EE8],eax;gvar_005E0EE8
 004605EB    mov         eax,461CA0
 004605F0    call        0046028C
 004605F5    mov         [005E0E9C],eax;gvar_005E0E9C
 004605FA    mov         eax,461CBC
 004605FF    call        0046028C
 00460604    mov         [005E0EE0],eax;gvar_005E0EE0
 00460609    mov         eax,461CCC
 0046060E    call        0046028C
 00460613    mov         [005E0EF8],eax;gvar_005E0EF8
 00460618    mov         eax,461CDC
 0046061D    call        0046028C
 00460622    mov         [005E0EFC],eax;gvar_005E0EFC
 00460627    mov         eax,461CF0
 0046062C    call        0046028C
 00460631    mov         [005E0E08],eax;gvar_005E0E08
 00460636    mov         eax,461D08
 0046063B    call        0046028C
 00460640    mov         [005E0E0C],eax;gvar_005E0E0C
 00460645    mov         eax,461D20
 0046064A    call        0046028C
 0046064F    mov         [005E0E10],eax;gvar_005E0E10
 00460654    mov         eax,461D38
 00460659    call        0046028C
 0046065E    mov         [005E0E14],eax;gvar_005E0E14
 00460663    mov         eax,461D50
 00460668    call        0046028C
 0046066D    mov         [005E0E18],eax;gvar_005E0E18
 00460672    mov         eax,461D68
 00460677    call        0046028C
 0046067C    mov         [005E0E1C],eax;gvar_005E0E1C
 00460681    mov         eax,461D80
 00460686    call        0046028C
 0046068B    mov         [005E0E20],eax;gvar_005E0E20
 00460690    mov         eax,461D98
 00460695    call        0046028C
 0046069A    mov         [005E0E24],eax;gvar_005E0E24
 0046069F    mov         eax,461DB0
 004606A4    call        0046028C
 004606A9    mov         [005E0E28],eax;gvar_005E0E28
 004606AE    mov         eax,461DC8
 004606B3    call        0046028C
 004606B8    mov         [005E0E2C],eax;gvar_005E0E2C
 004606BD    mov         eax,461DE0
 004606C2    call        0046028C
 004606C7    mov         [005E0E30],eax;gvar_005E0E30
 004606CC    mov         eax,461DF8
 004606D1    call        0046028C
 004606D6    mov         [005E0E34],eax;gvar_005E0E34
 004606DB    mov         eax,461E10
 004606E0    call        0046028C
 004606E5    mov         [005E0E38],eax;gvar_005E0E38
 004606EA    mov         eax,461E28
 004606EF    call        0046028C
 004606F4    mov         [005E0E3C],eax;gvar_005E0E3C
 004606F9    mov         eax,461E40
 004606FE    call        0046028C
 00460703    mov         [005E0E40],eax;gvar_005E0E40
 00460708    mov         eax,461E58
 0046070D    call        0046028C
 00460712    mov         [005E0E44],eax;gvar_005E0E44
 00460717    mov         eax,461E70
 0046071C    call        0046028C
 00460721    mov         [005E0E48],eax;gvar_005E0E48
 00460726    mov         eax,461E88
 0046072B    call        0046028C
 00460730    mov         [005E0E4C],eax;gvar_005E0E4C
 00460735    mov         eax,461EA0
 0046073A    call        0046028C
 0046073F    mov         [005E0E50],eax;gvar_005E0E50
 00460744    mov         eax,461EB8
 00460749    call        0046028C
 0046074E    mov         [005E0E54],eax;gvar_005E0E54
 00460753    mov         eax,461ED0
 00460758    call        0046028C
 0046075D    mov         [005E0E58],eax;gvar_005E0E58
 00460762    mov         eax,461EE8
 00460767    call        0046028C
 0046076C    mov         [005E0E5C],eax;gvar_005E0E5C
 00460771    mov         eax,461F00
 00460776    call        0046028C
 0046077B    mov         [005E0E60],eax;gvar_005E0E60
 00460780    mov         eax,461F18
 00460785    call        0046028C
 0046078A    mov         [005E0E64],eax;gvar_005E0E64
 0046078F    mov         eax,461F30
 00460794    call        0046028C
 00460799    mov         [005E0E68],eax;gvar_005E0E68
 0046079E    mov         eax,461F48
 004607A3    call        0046028C
 004607A8    mov         [005E0E6C],eax;gvar_005E0E6C
 004607AD    mov         eax,461F60
 004607B2    call        0046028C
 004607B7    mov         [005E0E70],eax;gvar_005E0E70
 004607BC    mov         eax,461F78
 004607C1    call        0046028C
 004607C6    mov         [005E0E74],eax;gvar_005E0E74
 004607CB    mov         eax,461F90
 004607D0    call        0046028C
 004607D5    mov         [005E0E78],eax;gvar_005E0E78
 004607DA    mov         eax,461FA8
 004607DF    call        0046028C
 004607E4    mov         [005E0E7C],eax;gvar_005E0E7C
 004607E9    mov         eax,461FC0
 004607EE    call        0046028C
 004607F3    mov         [005E0E80],eax;gvar_005E0E80
 004607F8    mov         eax,461FD8
 004607FD    call        0046028C
 00460802    mov         [005E0E84],eax;gvar_005E0E84
 00460807    mov         eax,461FF0
 0046080C    call        0046028C
 00460811    mov         [005E0E88],eax;gvar_005E0E88
 00460816    mov         eax,462004
 0046081B    call        0046028C
 00460820    mov         [005E0E8C],eax;gvar_005E0E8C
 00460825    mov         eax,462020
 0046082A    call        0046028C
 0046082F    mov         [005E0F00],eax;gvar_005E0F00
 00460834    mov         eax,462038
 00460839    call        0046028C
 0046083E    mov         [005E0F04],eax;gvar_005E0F04
 00460843    mov         eax,462050
 00460848    call        0046028C
 0046084D    mov         [005E0F08],eax;gvar_005E0F08
 00460852    mov         eax,462068
 00460857    call        0046028C
 0046085C    mov         [005E0F0C],eax;gvar_005E0F0C
 00460861    mov         eax,462080
 00460866    call        0046028C
 0046086B    mov         [005E0F10],eax;gvar_005E0F10
 00460870    mov         eax,46209C
 00460875    call        0046028C
 0046087A    mov         [005E0F14],eax;gvar_005E0F14
 0046087F    mov         eax,4620B8
 00460884    call        0046028C
 00460889    mov         [005E0F18],eax;gvar_005E0F18
 0046088E    mov         eax,4620D4
 00460893    call        0046028C
 00460898    mov         [005E0F1C],eax;gvar_005E0F1C
 0046089D    mov         eax,4620F0
 004608A2    call        0046028C
 004608A7    mov         [005E0F20],eax;gvar_005E0F20
 004608AC    mov         eax,462104
 004608B1    call        0046028C
 004608B6    mov         [005E0F24],eax;gvar_005E0F24
 004608BB    mov         eax,462114
 004608C0    call        0046028C
 004608C5    mov         [005E0F28],eax;gvar_005E0F28
 004608CA    mov         eax,462130
 004608CF    call        0046028C
 004608D4    mov         [005E0F2C],eax;gvar_005E0F2C
 004608D9    mov         eax,46214C
 004608DE    call        0046028C
 004608E3    mov         [005E0F30],eax;gvar_005E0F30
 004608E8    mov         eax,462168
 004608ED    call        0046028C
 004608F2    mov         [005E0F34],eax;gvar_005E0F34
 004608F7    mov         eax,462188
 004608FC    call        0046028C
 00460901    mov         [005E0F38],eax;gvar_005E0F38
 00460906    mov         eax,4621A8
 0046090B    call        0046028C
 00460910    mov         [005E0F3C],eax;gvar_005E0F3C
 00460915    mov         eax,4621C8
 0046091A    call        0046028C
 0046091F    mov         [005E0F40],eax;gvar_005E0F40
 00460924    mov         eax,4621E4
 00460929    call        0046028C
 0046092E    mov         [005E0F44],eax;gvar_005E0F44
 00460933    mov         eax,4621F8
 00460938    call        0046028C
 0046093D    mov         [005E0F48],eax;gvar_005E0F48
 00460942    mov         eax,46220C
 00460947    call        0046028C
 0046094C    mov         [005E0F4C],eax;gvar_005E0F4C
 00460951    mov         eax,462220
 00460956    call        0046028C
 0046095B    mov         [005E0F50],eax;gvar_005E0F50
 00460960    mov         eax,462234
 00460965    call        0046028C
 0046096A    mov         [005E0F54],eax;gvar_005E0F54
 0046096F    mov         eax,462248
 00460974    call        0046028C
 00460979    mov         [005E0F58],eax;gvar_005E0F58
 0046097E    mov         eax,46225C
 00460983    call        0046028C
 00460988    mov         [005E0F5C],eax;gvar_005E0F5C
 0046098D    mov         eax,462270
 00460992    call        0046028C
 00460997    mov         [005E0F60],eax;gvar_005E0F60
 0046099C    mov         eax,462284
 004609A1    call        0046028C
 004609A6    mov         [005E0F64],eax;gvar_005E0F64
 004609AB    mov         eax,462298
 004609B0    call        0046028C
 004609B5    mov         [005E0F68],eax;gvar_005E0F68
 004609BA    mov         eax,4622AC
 004609BF    call        0046028C
 004609C4    mov         [005E0F6C],eax;gvar_005E0F6C
 004609C9    mov         eax,4622C0
 004609CE    call        0046028C
 004609D3    mov         [005E0F70],eax;gvar_005E0F70
 004609D8    mov         eax,4622D4
 004609DD    call        0046028C
 004609E2    mov         [005E0F74],eax;gvar_005E0F74
 004609E7    mov         eax,4622EC
 004609EC    call        0046028C
 004609F1    mov         [005E0F78],eax;gvar_005E0F78
 004609F6    mov         eax,462304
 004609FB    call        0046028C
 00460A00    mov         [005E0F7C],eax;gvar_005E0F7C
 00460A05    mov         eax,46231C
 00460A0A    call        0046028C
 00460A0F    mov         [005E0F80],eax;gvar_005E0F80
 00460A14    mov         eax,462334
 00460A19    call        0046028C
 00460A1E    mov         [005E0F84],eax;gvar_005E0F84
 00460A23    mov         eax,46234C
 00460A28    call        0046028C
 00460A2D    mov         [005E0F88],eax;gvar_005E0F88
 00460A32    mov         eax,462364
 00460A37    call        0046028C
 00460A3C    mov         [005E0F8C],eax;gvar_005E0F8C
 00460A41    mov         eax,46237C
 00460A46    call        0046028C
 00460A4B    mov         [005E0F90],eax;gvar_005E0F90
 00460A50    mov         eax,462394
 00460A55    call        0046028C
 00460A5A    mov         [005E0F94],eax;gvar_005E0F94
 00460A5F    mov         eax,4623AC
 00460A64    call        0046028C
 00460A69    mov         [005E0F98],eax;gvar_005E0F98
 00460A6E    mov         eax,4623C4
 00460A73    call        0046028C
 00460A78    mov         [005E0F9C],eax;gvar_005E0F9C
 00460A7D    mov         eax,4623DC
 00460A82    call        0046028C
 00460A87    mov         [005E0FA0],eax;gvar_005E0FA0
 00460A8C    mov         eax,4623F4
 00460A91    call        0046028C
 00460A96    mov         [005E0FA4],eax;gvar_005E0FA4
 00460A9B    mov         eax,46240C
 00460AA0    call        0046028C
 00460AA5    mov         [005E0FA8],eax;gvar_005E0FA8
 00460AAA    mov         eax,462424
 00460AAF    call        0046028C
 00460AB4    mov         [005E0FAC],eax;gvar_005E0FAC
 00460AB9    mov         eax,46243C
 00460ABE    call        0046028C
 00460AC3    mov         [005E0FB0],eax;gvar_005E0FB0
 00460AC8    mov         eax,462454
 00460ACD    call        0046028C
 00460AD2    mov         [005E0FB4],eax;gvar_005E0FB4
 00460AD7    mov         eax,46246C
 00460ADC    call        0046028C
 00460AE1    mov         [005E0FB8],eax;gvar_005E0FB8
 00460AE6    mov         eax,462484
 00460AEB    call        0046028C
 00460AF0    mov         [005E0FBC],eax;gvar_005E0FBC
 00460AF5    mov         eax,46249C
 00460AFA    call        0046028C
 00460AFF    mov         [005E0FC0],eax;gvar_005E0FC0
 00460B04    mov         eax,4624B4
 00460B09    call        0046028C
 00460B0E    mov         [005E0FC4],eax;gvar_005E0FC4
 00460B13    mov         eax,4624CC
 00460B18    call        0046028C
 00460B1D    mov         [005E0FC8],eax;gvar_005E0FC8
 00460B22    mov         eax,4624E4
 00460B27    call        0046028C
 00460B2C    mov         [005E0FCC],eax;gvar_005E0FCC
 00460B31    mov         eax,4624FC
 00460B36    call        0046028C
 00460B3B    mov         [005E0FD0],eax;gvar_005E0FD0
 00460B40    mov         eax,462514
 00460B45    call        0046028C
 00460B4A    mov         [005E0FD4],eax;gvar_005E0FD4
 00460B4F    mov         eax,462530
 00460B54    call        0046028C
 00460B59    mov         [005E0FD8],eax;gvar_005E0FD8
 00460B5E    mov         eax,462550
 00460B63    call        0046028C
 00460B68    mov         [005E0FDC],eax;gvar_005E0FDC
 00460B6D    mov         eax,462570
 00460B72    call        0046028C
 00460B77    mov         [005E0FE0],eax;gvar_005E0FE0
 00460B7C    mov         eax,462584
 00460B81    call        0046028C
 00460B86    mov         [005E0FE4],eax;gvar_005E0FE4
 00460B8B    mov         eax,462598
 00460B90    call        0046028C
 00460B95    mov         [005E0FE8],eax;gvar_005E0FE8
 00460B9A    mov         eax,4625AC
 00460B9F    call        0046028C
 00460BA4    mov         [005E0FEC],eax;gvar_005E0FEC
 00460BA9    mov         eax,4625C0
 00460BAE    call        0046028C
 00460BB3    mov         [005E0FF0],eax;gvar_005E0FF0
 00460BB8    mov         eax,4625DC
 00460BBD    call        0046028C
 00460BC2    mov         [005E0FF4],eax;gvar_005E0FF4
 00460BC7    mov         eax,4625F8
 00460BCC    call        0046028C
 00460BD1    mov         [005E0FF8],eax;gvar_005E0FF8
 00460BD6    mov         eax,462614
 00460BDB    call        0046028C
 00460BE0    mov         [005E0FFC],eax;gvar_005E0FFC
 00460BE5    mov         eax,462630
 00460BEA    call        0046028C
 00460BEF    mov         [005E1000],eax;gvar_005E1000
 00460BF4    mov         eax,462650
 00460BF9    call        0046028C
 00460BFE    mov         [005E1004],eax;gvar_005E1004
 00460C03    mov         eax,462670
 00460C08    call        0046028C
 00460C0D    mov         [005E1008],eax;gvar_005E1008
 00460C12    mov         eax,462690
 00460C17    call        0046028C
 00460C1C    mov         [005E100C],eax;gvar_005E100C
 00460C21    mov         eax,4626B0
 00460C26    call        0046028C
 00460C2B    mov         [005E1010],eax;gvar_005E1010
 00460C30    mov         eax,4626D0
 00460C35    call        0046028C
 00460C3A    mov         [005E1014],eax;gvar_005E1014
 00460C3F    mov         eax,4626F0
 00460C44    call        0046028C
 00460C49    mov         [005E1018],eax;gvar_005E1018
 00460C4E    mov         eax,462710
 00460C53    call        0046028C
 00460C58    mov         [005E101C],eax;gvar_005E101C
 00460C5D    mov         eax,462730
 00460C62    call        0046028C
 00460C67    mov         [005E1020],eax;gvar_005E1020
 00460C6C    mov         eax,462744
 00460C71    call        0046028C
 00460C76    mov         [005E1024],eax;gvar_005E1024
 00460C7B    mov         eax,46275C
 00460C80    call        0046028C
 00460C85    mov         [005E1028],eax;gvar_005E1028
 00460C8A    mov         eax,462774
 00460C8F    call        0046028C
 00460C94    mov         [005E102C],eax;gvar_005E102C
 00460C99    mov         eax,46278C
 00460C9E    call        0046028C
 00460CA3    mov         [005E1030],eax;gvar_005E1030
 00460CA8    mov         eax,4627A4
 00460CAD    call        0046028C
 00460CB2    mov         [005E1034],eax;gvar_005E1034
 00460CB7    mov         eax,4627C4
 00460CBC    call        0046028C
 00460CC1    mov         [005E1038],eax;gvar_005E1038
 00460CC6    mov         eax,4627D4
 00460CCB    call        0046028C
 00460CD0    mov         [005E103C],eax;gvar_005E103C
 00460CD5    mov         eax,4627E4
 00460CDA    call        0046028C
 00460CDF    mov         [005E1040],eax;gvar_005E1040
 00460CE4    mov         eax,4627F8
 00460CE9    call        0046028C
 00460CEE    mov         [005E1044],eax;gvar_005E1044
 00460CF3    mov         eax,462808
 00460CF8    call        0046028C
 00460CFD    mov         [005E1048],eax;gvar_005E1048
 00460D02    mov         eax,462818
 00460D07    call        0046028C
 00460D0C    mov         [005E104C],eax;gvar_005E104C
 00460D11    mov         eax,462828
 00460D16    call        0046028C
 00460D1B    mov         [005E1050],eax;gvar_005E1050
 00460D20    mov         eax,46283C
 00460D25    call        0046028C
 00460D2A    mov         [005E1054],eax;gvar_005E1054
 00460D2F    mov         eax,462854
 00460D34    call        0046028C
 00460D39    mov         [005E1058],eax;gvar_005E1058
 00460D3E    mov         eax,462864
 00460D43    call        0046028C
 00460D48    mov         [005E105C],eax;gvar_005E105C
 00460D4D    mov         eax,462878
 00460D52    call        0046028C
 00460D57    mov         [005E1060],eax;gvar_005E1060
 00460D5C    mov         eax,462894
 00460D61    call        0046028C
 00460D66    mov         [005E1064],eax;gvar_005E1064
 00460D6B    mov         eax,4628AC
 00460D70    call        0046028C
 00460D75    mov         [005E1068],eax;gvar_005E1068
 00460D7A    mov         eax,4628C0
 00460D7F    call        0046028C
 00460D84    mov         [005E106C],eax;gvar_005E106C
 00460D89    mov         eax,4628D0
 00460D8E    call        0046028C
 00460D93    mov         [005E1070],eax;gvar_005E1070
 00460D98    mov         eax,4628E4
 00460D9D    call        0046028C
 00460DA2    mov         [005E1074],eax;gvar_005E1074
 00460DA7    mov         eax,4628FC
 00460DAC    call        0046028C
 00460DB1    mov         [005E1078],eax;gvar_005E1078
 00460DB6    mov         eax,462910
 00460DBB    call        0046028C
 00460DC0    mov         [005E107C],eax;gvar_005E107C
 00460DC5    mov         eax,462924
 00460DCA    call        0046028C
 00460DCF    mov         [005E1080],eax;gvar_005E1080
 00460DD4    mov         eax,462940
 00460DD9    call        0046028C
 00460DDE    mov         [005E1084],eax;gvar_005E1084
 00460DE3    mov         eax,462954
 00460DE8    call        0046028C
 00460DED    mov         [005E1088],eax;gvar_005E1088
 00460DF2    mov         eax,462968
 00460DF7    call        0046028C
 00460DFC    mov         [005E108C],eax;gvar_005E108C
 00460E01    mov         eax,462980
 00460E06    call        0046028C
 00460E0B    mov         [005E1090],eax;gvar_005E1090
 00460E10    mov         eax,462998
 00460E15    call        0046028C
 00460E1A    mov         [005E1094],eax;gvar_005E1094
 00460E1F    mov         eax,4629A8
 00460E24    call        0046028C
 00460E29    mov         [005E1098],eax;gvar_005E1098
 00460E2E    mov         eax,4629B8
 00460E33    call        0046028C
 00460E38    mov         [005E109C],eax;gvar_005E109C
 00460E3D    mov         eax,4629C8
 00460E42    call        0046028C
 00460E47    mov         [005E10A0],eax;gvar_005E10A0
 00460E4C    mov         eax,4629D8
 00460E51    call        0046028C
 00460E56    mov         [005E10A4],eax;gvar_005E10A4
 00460E5B    mov         eax,4629E8
 00460E60    call        0046028C
 00460E65    mov         [005E10A8],eax;gvar_005E10A8
 00460E6A    mov         eax,4629F8
 00460E6F    call        0046028C
 00460E74    mov         [005E10AC],eax;gvar_005E10AC
 00460E79    mov         eax,462A08
 00460E7E    call        0046028C
 00460E83    mov         [005E10B0],eax;gvar_005E10B0
 00460E88    mov         eax,462A18
 00460E8D    call        0046028C
 00460E92    mov         [005E10B4],eax;gvar_005E10B4
 00460E97    mov         eax,462A28
 00460E9C    call        0046028C
 00460EA1    mov         [005E10B8],eax;gvar_005E10B8
 00460EA6    mov         eax,462A38
 00460EAB    call        0046028C
 00460EB0    mov         [005E10BC],eax;gvar_005E10BC
 00460EB5    mov         eax,462A48
 00460EBA    call        0046028C
 00460EBF    mov         [005E10C0],eax;gvar_005E10C0
 00460EC4    mov         eax,462A58
 00460EC9    call        0046028C
 00460ECE    mov         [005E10C4],eax;gvar_005E10C4
 00460ED3    mov         eax,462A68
 00460ED8    call        0046028C
 00460EDD    mov         [005E10C8],eax;gvar_005E10C8
 00460EE2    mov         eax,462A78
 00460EE7    call        0046028C
 00460EEC    mov         [005E10CC],eax;gvar_005E10CC
 00460EF1    mov         eax,462A88
 00460EF6    call        0046028C
 00460EFB    mov         [005E10D0],eax;gvar_005E10D0
 00460F00    mov         eax,462A98
 00460F05    call        0046028C
 00460F0A    mov         [005E10D4],eax;gvar_005E10D4
 00460F0F    mov         eax,462AB0
 00460F14    call        0046028C
 00460F19    mov         [005E10D8],eax;gvar_005E10D8
 00460F1E    mov         eax,462AC8
 00460F23    call        0046028C
 00460F28    mov         [005E10DC],eax;gvar_005E10DC
 00460F2D    mov         eax,462AE0
 00460F32    call        0046028C
 00460F37    mov         [005E10E0],eax;gvar_005E10E0
 00460F3C    mov         eax,462AFC
 00460F41    call        0046028C
 00460F46    mov         [005E10E4],eax;gvar_005E10E4
 00460F4B    mov         eax,462B18
 00460F50    call        0046028C
 00460F55    mov         [005E10E8],eax;gvar_005E10E8
 00460F5A    mov         eax,462B28
 00460F5F    call        0046028C
 00460F64    mov         [005E10EC],eax;gvar_005E10EC
 00460F69    mov         eax,462B40
 00460F6E    call        0046028C
 00460F73    mov         [005E10F0],eax;gvar_005E10F0
 00460F78    mov         eax,462B58
 00460F7D    call        0046028C
 00460F82    mov         [005E10F4],eax;gvar_005E10F4
 00460F87    mov         eax,462B70
 00460F8C    call        0046028C
 00460F91    mov         [005E10F8],eax;gvar_005E10F8
 00460F96    mov         eax,462B84
 00460F9B    call        0046028C
 00460FA0    mov         [005E10FC],eax;gvar_005E10FC
 00460FA5    mov         eax,462B98
 00460FAA    call        0046028C
 00460FAF    mov         [005E1100],eax;gvar_005E1100
 00460FB4    mov         eax,462BB0
 00460FB9    call        0046028C
 00460FBE    mov         [005E1104],eax;gvar_005E1104
 00460FC3    mov         eax,462BC8
 00460FC8    call        0046028C
 00460FCD    mov         [005E1108],eax;gvar_005E1108
 00460FD2    mov         eax,462BE0
 00460FD7    call        0046028C
 00460FDC    mov         [005E110C],eax;gvar_005E110C
 00460FE1    mov         eax,462BF8
 00460FE6    call        0046028C
 00460FEB    mov         [005E1110],eax;gvar_005E1110
 00460FF0    mov         eax,462C08
 00460FF5    call        0046028C
 00460FFA    mov         [005E1114],eax;gvar_005E1114
 00460FFF    mov         eax,462C18
 00461004    call        0046028C
 00461009    mov         [005E1118],eax;gvar_005E1118
 0046100E    mov         eax,462C2C
 00461013    call        0046028C
 00461018    mov         [005E111C],eax;gvar_005E111C
 0046101D    mov         eax,462C40
 00461022    call        0046028C
 00461027    mov         [005E1120],eax;gvar_005E1120
 0046102C    mov         eax,462C54
 00461031    call        0046028C
 00461036    mov         [005E1124],eax;gvar_005E1124
 0046103B    mov         eax,462C74
 00461040    call        0046028C
 00461045    mov         [005E1128],eax;gvar_005E1128
 0046104A    mov         eax,462C94
 0046104F    call        0046028C
 00461054    mov         [005E112C],eax;gvar_005E112C
 00461059    mov         eax,462CAC
 0046105E    call        0046028C
 00461063    mov         [005E1130],eax;gvar_005E1130
 00461068    mov         eax,462CC4
 0046106D    call        0046028C
 00461072    mov         [005E1134],eax;gvar_005E1134
 00461077    mov         eax,462CDC
 0046107C    call        0046028C
 00461081    mov         [005E1138],eax;gvar_005E1138
 00461086    mov         eax,462CF4
 0046108B    call        0046028C
 00461090    mov         [005E113C],eax;gvar_005E113C
 00461095    mov         eax,462D0C
 0046109A    call        0046028C
 0046109F    mov         [005E1140],eax;gvar_005E1140
 004610A4    mov         eax,462D24
 004610A9    call        0046028C
 004610AE    mov         [005E1144],eax;gvar_005E1144
 004610B3    mov         eax,462D3C
 004610B8    call        0046028C
 004610BD    mov         [005E1148],eax;gvar_005E1148
 004610C2    mov         eax,462D54
 004610C7    call        0046028C
 004610CC    mov         [005E114C],eax;gvar_005E114C
 004610D1    mov         eax,462D6C
 004610D6    call        0046028C
 004610DB    mov         [005E1150],eax;gvar_005E1150
 004610E0    mov         eax,462D84
 004610E5    call        0046028C
 004610EA    mov         [005E1154],eax;gvar_005E1154
 004610EF    mov         eax,462D9C
 004610F4    call        0046028C
 004610F9    mov         [005E1158],eax;gvar_005E1158
 004610FE    mov         eax,462DB4
 00461103    call        0046028C
 00461108    mov         [005E115C],eax;gvar_005E115C
 0046110D    mov         eax,462DCC
 00461112    call        0046028C
 00461117    mov         [005E1160],eax;gvar_005E1160
 0046111C    mov         eax,462DE4
 00461121    call        0046028C
 00461126    mov         [005E1164],eax;gvar_005E1164
 0046112B    mov         eax,462DFC
 00461130    call        0046028C
 00461135    mov         [005E1168],eax;gvar_005E1168
 0046113A    mov         eax,462E14
 0046113F    call        0046028C
 00461144    mov         [005E116C],eax;gvar_005E116C
 00461149    mov         eax,462E2C
 0046114E    call        0046028C
 00461153    mov         [005E1170],eax;gvar_005E1170
 00461158    mov         eax,462E48
 0046115D    call        0046028C
 00461162    mov         [005E1174],eax;gvar_005E1174
 00461167    mov         eax,462E60
 0046116C    call        0046028C
 00461171    mov         [005E1178],eax;gvar_005E1178
 00461176    mov         eax,462E78
 0046117B    call        0046028C
 00461180    mov         [005E117C],eax;gvar_005E117C
 00461185    mov         eax,462E88
 0046118A    call        0046028C
 0046118F    mov         [005E1180],eax;gvar_005E1180
 00461194    mov         eax,462E98
 00461199    call        0046028C
 0046119E    mov         [005E1184],eax;gvar_005E1184
 004611A3    mov         eax,462EA8
 004611A8    call        0046028C
 004611AD    mov         [005E1188],eax;gvar_005E1188
 004611B2    mov         eax,462EB8
 004611B7    call        0046028C
 004611BC    mov         [005E118C],eax;gvar_005E118C
 004611C1    mov         eax,462ED0
 004611C6    call        0046028C
 004611CB    mov         [005E1190],eax;gvar_005E1190
 004611D0    mov         eax,462EE8
 004611D5    call        0046028C
 004611DA    mov         [005E1194],eax;gvar_005E1194
 004611DF    mov         eax,462F04
 004611E4    call        0046028C
 004611E9    mov         [005E1198],eax;gvar_005E1198
 004611EE    mov         eax,462F1C
 004611F3    call        0046028C
 004611F8    mov         [005E119C],eax;gvar_005E119C
 004611FD    mov         eax,462F30
 00461202    call        0046028C
 00461207    mov         [005E11A0],eax;gvar_005E11A0
 0046120C    mov         eax,462F40
 00461211    call        0046028C
 00461216    mov         [005E11A4],eax;gvar_005E11A4
 0046121B    mov         eax,462F58
 00461220    call        0046028C
 00461225    mov         [005E11A8],eax;gvar_005E11A8
 0046122A    mov         eax,462F70
 0046122F    call        0046028C
 00461234    mov         [005E11AC],eax;gvar_005E11AC
 00461239    mov         eax,462F88
 0046123E    call        0046028C
 00461243    mov         [005E11B0],eax;gvar_005E11B0
 00461248    mov         eax,462FA0
 0046124D    call        0046028C
 00461252    mov         [005E11B4],eax;gvar_005E11B4
 00461257    mov         eax,462FB4
 0046125C    call        0046028C
 00461261    mov         [005E11B8],eax;gvar_005E11B8
 00461266    mov         eax,462FC8
 0046126B    call        0046028C
 00461270    mov         [005E11BC],eax;gvar_005E11BC
 00461275    mov         eax,462FE0
 0046127A    call        0046028C
 0046127F    mov         [005E11C0],eax;gvar_005E11C0
 00461284    mov         eax,463000
 00461289    call        0046028C
 0046128E    mov         [005E11C4],eax;gvar_005E11C4
 00461293    mov         eax,463020
 00461298    call        0046028C
 0046129D    mov         [005E11C8],eax;gvar_005E11C8
 004612A2    mov         eax,463044
 004612A7    call        0046028C
 004612AC    mov         [005E11CC],eax;gvar_005E11CC
 004612B1    mov         eax,463068
 004612B6    call        0046028C
 004612BB    mov         [005E11D0],eax;gvar_005E11D0
 004612C0    mov         eax,463090
 004612C5    call        0046028C
 004612CA    mov         [005E11D4],eax;gvar_005E11D4
 004612CF    mov         eax,4630B8
 004612D4    call        0046028C
 004612D9    mov         [005E11D8],eax;gvar_005E11D8
 004612DE    mov         eax,4630C8
 004612E3    call        0046028C
 004612E8    mov         [005E11DC],eax;gvar_005E11DC
 004612ED    mov         eax,4630DC
 004612F2    call        0046028C
 004612F7    mov         [005E11E0],eax;gvar_005E11E0
 004612FC    mov         eax,4630EC
 00461301    call        0046028C
 00461306    mov         [005E11E4],eax;gvar_005E11E4
 0046130B    mov         eax,4630FC
 00461310    call        0046028C
 00461315    mov         [005E11E8],eax;gvar_005E11E8
 0046131A    mov         eax,46310C
 0046131F    call        0046028C
 00461324    mov         [005E11EC],eax;gvar_005E11EC
 00461329    mov         eax,463118
 0046132E    call        0046028C
 00461333    mov         [005E11F0],eax;gvar_005E11F0
 00461338    mov         eax,463128
 0046133D    call        0046028C
 00461342    mov         [005E11F4],eax;gvar_005E11F4
 00461347    mov         eax,463140
 0046134C    call        0046028C
 00461351    mov         [005E11F8],eax;gvar_005E11F8
 00461356    mov         eax,46315C
 0046135B    call        0046028C
 00461360    mov         [005E11FC],eax;gvar_005E11FC
 00461365    mov         eax,463174
 0046136A    call        0046028C
 0046136F    mov         [005E1200],eax;gvar_005E1200
 00461374    mov         eax,46318C
 00461379    call        0046028C
 0046137E    mov         [005E1204],eax;gvar_005E1204
 00461383    mov         eax,4631A4
 00461388    call        0046028C
 0046138D    mov         [005E1208],eax;gvar_005E1208
 00461392    mov         eax,4631BC
 00461397    call        0046028C
 0046139C    mov         [005E120C],eax;gvar_005E120C
 004613A1    mov         eax,4631D8
 004613A6    call        0046028C
 004613AB    mov         [005E1210],eax;gvar_005E1210
 004613B0    mov         eax,4631EC
 004613B5    call        0046028C
 004613BA    mov         [005E1214],eax;gvar_005E1214
 004613BF    mov         eax,463200
 004613C4    call        0046028C
 004613C9    mov         [005E1218],eax;gvar_005E1218
 004613CE    mov         eax,463210
 004613D3    call        0046028C
 004613D8    mov         [005E121C],eax;gvar_005E121C
 004613DD    mov         eax,463224
 004613E2    call        0046028C
 004613E7    mov         [005E1220],eax;gvar_005E1220
 004613EC    mov         eax,46323C
 004613F1    call        0046028C
 004613F6    mov         [005E0E90],eax;gvar_005E0E90
 004613FB    mov         eax,463254
 00461400    call        0046028C
 00461405    mov         [005E0E94],eax;gvar_005E0E94
 0046140A    mov         eax,463270
 0046140F    call        0046028C
 00461414    mov         [005E0E98],eax;gvar_005E0E98
 00461419    mov         eax,463290
 0046141E    call        0046028C
 00461423    mov         [005E1224],eax;gvar_005E1224
 00461428    mov         eax,4632A8
 0046142D    call        0046028C
 00461432    mov         [005E1228],eax;gvar_005E1228
 00461437    mov         eax,4632B8
 0046143C    call        0046028C
 00461441    mov         [005E122C],eax;gvar_005E122C
 00461446    mov         eax,4632CC
 0046144B    call        0046028C
 00461450    mov         [005E1230],eax;gvar_005E1230
 00461455    mov         eax,4632E0
 0046145A    call        0046028C
 0046145F    mov         [005E1234],eax;gvar_005E1234
 00461464    mov         eax,4632F0
 00461469    call        0046028C
 0046146E    mov         [005E1238],eax;gvar_005E1238
 00461473    mov         eax,46330C
 00461478    call        0046028C
 0046147D    mov         [005E123C],eax;gvar_005E123C
 00461482    mov         eax,463328
 00461487    call        0046028C
 0046148C    mov         [005E1240],eax;gvar_005E1240
 00461491    mov         eax,46333C
 00461496    call        0046028C
 0046149B    mov         [005E1244],eax;gvar_005E1244
 004614A0    mov         eax,463354
 004614A5    call        0046028C
 004614AA    mov         [005E1248],eax;gvar_005E1248
 004614AF    mov         eax,46336C
 004614B4    call        0046028C
 004614B9    mov         [005E124C],eax;gvar_005E124C
 004614BE    mov         eax,463384
 004614C3    call        0046028C
 004614C8    mov         [005E1250],eax;gvar_005E1250
 004614CD    mov         eax,46339C
 004614D2    call        0046028C
 004614D7    mov         [005E1254],eax;gvar_005E1254
 004614DC    mov         eax,4633B4
 004614E1    call        0046028C
 004614E6    mov         [005E1258],eax;gvar_005E1258
 004614EB    mov         eax,4633D0
 004614F0    call        0046028C
 004614F5    mov         [005E125C],eax;gvar_005E125C
 004614FA    mov         eax,4633E0
 004614FF    call        0046028C
 00461504    mov         [005E1260],eax;gvar_005E1260
 00461509    mov         eax,4633F0
 0046150E    call        0046028C
 00461513    mov         [005E1264],eax;gvar_005E1264
 00461518    mov         eax,463408
 0046151D    call        0046028C
 00461522    mov         [005E1268],eax;gvar_005E1268
 00461527    mov         eax,463420
 0046152C    call        0046028C
 00461531    mov         [005E126C],eax;gvar_005E126C
 00461536    mov         eax,463438
 0046153B    call        0046028C
 00461540    mov         [005E1270],eax;gvar_005E1270
 00461545    mov         eax,463450
 0046154A    call        0046028C
 0046154F    mov         [005E1274],eax;gvar_005E1274
 00461554    mov         eax,46346C
 00461559    call        0046028C
 0046155E    mov         [005E1278],eax;gvar_005E1278
 00461563    mov         eax,463488
 00461568    call        0046028C
 0046156D    mov         [005E127C],eax;gvar_005E127C
 00461572    mov         eax,4634A4
 00461577    call        0046028C
 0046157C    mov         [005E1280],eax;gvar_005E1280
 00461581    mov         eax,4634B4
 00461586    call        0046028C
 0046158B    mov         [005E1284],eax;gvar_005E1284
 00461590    mov         eax,4634CC
 00461595    call        0046028C
 0046159A    mov         [005E1288],eax;gvar_005E1288
 0046159F    mov         eax,4634E0
 004615A4    call        0046028C
 004615A9    mov         [005E128C],eax;gvar_005E128C
 004615AE    mov         eax,4634F4
 004615B3    call        0046028C
 004615B8    mov         [005E1290],eax;gvar_005E1290
 004615BD    mov         eax,463508
 004615C2    call        0046028C
 004615C7    mov         [005E1294],eax;gvar_005E1294
 004615CC    mov         eax,46351C
 004615D1    call        0046028C
 004615D6    mov         [005E1298],eax;gvar_005E1298
 004615DB    mov         eax,463530
 004615E0    call        0046028C
 004615E5    mov         [005E129C],eax;gvar_005E129C
 004615EA    mov         eax,463544
 004615EF    call        0046028C
 004615F4    mov         [005E12A0],eax;gvar_005E12A0
 004615F9    mov         eax,463558
 004615FE    call        0046028C
 00461603    mov         [005E12A4],eax;gvar_005E12A4
 00461608    mov         eax,46356C
 0046160D    call        0046028C
 00461612    mov         [005E12A8],eax;gvar_005E12A8
 00461617    mov         eax,463580
 0046161C    call        0046028C
 00461621    mov         [005E12AC],eax;gvar_005E12AC
 00461626    mov         eax,463594
 0046162B    call        0046028C
 00461630    mov         [005E12B0],eax;gvar_005E12B0
 00461635    mov         eax,4635A8
 0046163A    call        0046028C
 0046163F    mov         [005E12B4],eax;gvar_005E12B4
 00461644    mov         eax,4635BC
 00461649    call        0046028C
 0046164E    mov         [005E12B8],eax;gvar_005E12B8
 00461653    mov         eax,4635D0
 00461658    call        0046028C
 0046165D    mov         [005E12BC],eax;gvar_005E12BC
 00461662    mov         eax,4635E4
 00461667    call        0046028C
 0046166C    mov         [005E12C0],eax;gvar_005E12C0
 00461671    mov         eax,4635F8
 00461676    call        0046028C
 0046167B    mov         [005E12C4],eax;gvar_005E12C4
 00461680    mov         eax,46360C
 00461685    call        0046028C
 0046168A    mov         [005E12C8],eax;gvar_005E12C8
 0046168F    mov         eax,463620
 00461694    call        0046028C
 00461699    mov         [005E12CC],eax;gvar_005E12CC
 0046169E    mov         eax,463634
 004616A3    call        0046028C
 004616A8    mov         [005E12D0],eax;gvar_005E12D0
 004616AD    mov         eax,463648
 004616B2    call        0046028C
 004616B7    mov         [005E12D4],eax;gvar_005E12D4
 004616BC    mov         eax,46365C
 004616C1    call        0046028C
 004616C6    mov         [005E12D8],eax;gvar_005E12D8
 004616CB    mov         eax,463670
 004616D0    call        0046028C
 004616D5    mov         [005E12DC],eax;gvar_005E12DC
 004616DA    mov         eax,463684
 004616DF    call        0046028C
 004616E4    mov         [005E12E0],eax;gvar_005E12E0
 004616E9    mov         eax,463698
 004616EE    call        0046028C
 004616F3    mov         [005E12E4],eax;gvar_005E12E4
 004616F8    mov         eax,4636AC
 004616FD    call        0046028C
 00461702    mov         [005E12E8],eax;gvar_005E12E8
 00461707    mov         eax,4636C4
 0046170C    call        0046028C
 00461711    mov         [005E12EC],eax;gvar_005E12EC
 00461716    mov         eax,4636DC
 0046171B    call        0046028C
 00461720    mov         [005E12F0],eax;gvar_005E12F0
 00461725    mov         eax,4636F4
 0046172A    call        0046028C
 0046172F    mov         [005E12F4],eax;gvar_005E12F4
 00461734    mov         eax,46370C
 00461739    call        0046028C
 0046173E    mov         [005E12F8],eax;gvar_005E12F8
 00461743    mov         eax,463724
 00461748    call        0046028C
 0046174D    mov         [005E12FC],eax;gvar_005E12FC
 00461752    mov         eax,46373C
 00461757    call        0046028C
 0046175C    mov         [005E1300],eax;gvar_005E1300
 00461761    mov         eax,463754
 00461766    call        0046028C
 0046176B    mov         [005E1304],eax;gvar_005E1304
 00461770    mov         eax,46376C
 00461775    call        0046028C
 0046177A    mov         [005E1308],eax;gvar_005E1308
 0046177F    mov         eax,463784
 00461784    call        0046028C
 00461789    mov         [005E130C],eax;gvar_005E130C
 0046178E    mov         eax,46379C
 00461793    call        0046028C
 00461798    mov         [005E1310],eax;gvar_005E1310
 0046179D    mov         eax,4637B4
 004617A2    call        0046028C
 004617A7    mov         [005E1314],eax;gvar_005E1314
 004617AC    mov         eax,4637CC
 004617B1    call        0046028C
 004617B6    mov         [005E1318],eax;gvar_005E1318
 004617BB    mov         eax,4637E4
 004617C0    call        0046028C
 004617C5    mov         [005E131C],eax;gvar_005E131C
 004617CA    mov         eax,4637FC
 004617CF    call        0046028C
 004617D4    mov         [005E1320],eax;gvar_005E1320
 004617D9    call        00463810
 004617DE    ret
*}
end;

//00463810
procedure sub_00463810;
begin
{*
 00463810    mov         eax,4638F4
 00463815    call        0046028C
 0046381A    mov         [005E0DCC],eax;gvar_005E0DCC
 0046381F    mov         eax,463910
 00463824    call        0046028C
 00463829    mov         [005E0DD0],eax;gvar_005E0DD0
 0046382E    mov         eax,463930
 00463833    call        0046028C
 00463838    mov         [005E0DD4],eax;gvar_005E0DD4
 0046383D    mov         eax,463950
 00463842    call        0046028C
 00463847    mov         [005E0DD8],eax;gvar_005E0DD8
 0046384C    mov         eax,463968
 00463851    call        0046028C
 00463856    mov         [005E0DDC],eax;gvar_005E0DDC
 0046385B    mov         eax,46397C
 00463860    call        0046028C
 00463865    mov         [005E0DE0],eax;gvar_005E0DE0
 0046386A    mov         eax,463990
 0046386F    call        0046028C
 00463874    mov         [005E0DE4],eax;gvar_005E0DE4
 00463879    mov         eax,4639A8
 0046387E    call        0046028C
 00463883    mov         [005E0DE8],eax;gvar_005E0DE8
 00463888    mov         eax,4639C0
 0046388D    call        0046028C
 00463892    mov         [005E0DEC],eax;gvar_005E0DEC
 00463897    mov         eax,4639D4
 0046389C    call        0046028C
 004638A1    mov         [005E0DF0],eax;gvar_005E0DF0
 004638A6    mov         eax,4639F0
 004638AB    call        0046028C
 004638B0    mov         [005E0DF4],eax;gvar_005E0DF4
 004638B5    mov         eax,463A0C
 004638BA    call        0046028C
 004638BF    mov         [005E0DF8],eax;gvar_005E0DF8
 004638C4    mov         eax,463A24
 004638C9    call        0046028C
 004638CE    mov         [005E0DFC],eax;gvar_005E0DFC
 004638D3    mov         eax,463A40
 004638D8    call        0046028C
 004638DD    mov         [005E0E00],eax;gvar_005E0E00
 004638E2    mov         eax,463A54
 004638E7    call        0046028C
 004638EC    mov         [005E0E04],eax;gvar_005E0E04
 004638F1    ret
*}
end;

//00463A6C
{*procedure sub_00463A6C(?:AnsiString; ?:?; ?:?);
begin
 00463A6C    push        ebp
 00463A6D    mov         ebp,esp
 00463A6F    add         esp,0FFFFFFEC
 00463A72    push        ebx
 00463A73    push        esi
 00463A74    push        edi
 00463A75    xor         ebx,ebx
 00463A77    mov         dword ptr [ebp-14],ebx
 00463A7A    mov         dword ptr [ebp-10],ebx
 00463A7D    mov         dword ptr [ebp-0C],ecx
 00463A80    mov         dword ptr [ebp-8],edx
 00463A83    mov         dword ptr [ebp-4],eax
 00463A86    mov         eax,dword ptr [ebp-4]
 00463A89    call        @LStrAddRef
 00463A8E    xor         eax,eax
 00463A90    push        ebp
 00463A91    push        463BEF
 00463A96    push        dword ptr fs:[eax]
 00463A99    mov         dword ptr fs:[eax],esp
 00463A9C    xor         eax,eax
 00463A9E    push        ebp
 00463A9F    push        463BB4
 00463AA4    push        dword ptr fs:[eax]
 00463AA7    mov         dword ptr fs:[eax],esp
 00463AAA    mov         edx,dword ptr [ebp-4]
 00463AAD    mov         eax,463C08;'.'
 00463AB2    call        @LStrPos
 00463AB7    mov         ebx,eax
 00463AB9    cmp         ebx,1
>00463ABC    jle         00463BA5
 00463AC2    mov         eax,dword ptr [ebp-4]
 00463AC5    call        @LStrLen
 00463ACA    cmp         ebx,eax
>00463ACC    jge         00463BA5
 00463AD2    mov         eax,dword ptr [ebp-4]
 00463AD5    mov         al,byte ptr [eax+ebx-2]
 00463AD9    add         al,0D0
 00463ADB    sub         al,0A
>00463ADD    jae         00463BA5
 00463AE3    mov         eax,dword ptr [ebp-4]
 00463AE6    mov         al,byte ptr [eax+ebx]
 00463AE9    add         al,0D0
 00463AEB    sub         al,0A
>00463AED    jae         00463BA5
 00463AF3    dec         ebx
>00463AF4    jmp         00463AF7
 00463AF6    dec         ebx
 00463AF7    test        ebx,ebx
>00463AF9    jle         00463B08
 00463AFB    mov         eax,dword ptr [ebp-4]
 00463AFE    mov         al,byte ptr [eax+ebx-1]
 00463B02    add         al,0D0
 00463B04    sub         al,0A
>00463B06    jb          00463AF6
 00463B08    lea         eax,[ebp-4]
 00463B0B    mov         ecx,ebx
 00463B0D    mov         edx,1
 00463B12    call        @LStrDelete
 00463B17    mov         edx,dword ptr [ebp-4]
 00463B1A    mov         eax,463C08;'.'
 00463B1F    call        @LStrPos
 00463B24    mov         ebx,eax
 00463B26    inc         ebx
>00463B27    jmp         00463B2A
 00463B29    inc         ebx
 00463B2A    mov         eax,dword ptr [ebp-4]
 00463B2D    call        @LStrLen
 00463B32    cmp         ebx,eax
>00463B34    jg          00463B43
 00463B36    mov         eax,dword ptr [ebp-4]
 00463B39    mov         al,byte ptr [eax+ebx-1]
 00463B3D    add         al,0D0
 00463B3F    sub         al,0A
>00463B41    jb          00463B29
 00463B43    lea         eax,[ebp-4]
 00463B46    mov         ecx,0FF
 00463B4B    mov         edx,ebx
 00463B4D    call        @LStrDelete
 00463B52    mov         edx,dword ptr [ebp-4]
 00463B55    mov         eax,463C08;'.'
 00463B5A    call        @LStrPos
 00463B5F    mov         ebx,eax
 00463B61    lea         eax,[ebp-10]
 00463B64    push        eax
 00463B65    mov         ecx,ebx
 00463B67    dec         ecx
 00463B68    mov         edx,1
 00463B6D    mov         eax,dword ptr [ebp-4]
 00463B70    call        @LStrCopy
 00463B75    mov         eax,dword ptr [ebp-10]
 00463B78    call        StrToInt
 00463B7D    mov         edx,dword ptr [ebp-8]
 00463B80    mov         dword ptr [edx],eax
 00463B82    lea         eax,[ebp-14]
 00463B85    push        eax
 00463B86    lea         edx,[ebx+1]
 00463B89    mov         ecx,0FF
 00463B8E    mov         eax,dword ptr [ebp-4]
 00463B91    call        @LStrCopy
 00463B96    mov         eax,dword ptr [ebp-14]
 00463B99    call        StrToInt
 00463B9E    mov         edx,dword ptr [ebp-0C]
 00463BA1    mov         dword ptr [edx],eax
>00463BA3    jmp         00463BAA
 00463BA5    call        Abort
 00463BAA    xor         eax,eax
 00463BAC    pop         edx
 00463BAD    pop         ecx
 00463BAE    pop         ecx
 00463BAF    mov         dword ptr fs:[eax],edx
>00463BB2    jmp         00463BCC
>00463BB4    jmp         @HandleAnyException
 00463BB9    mov         eax,dword ptr [ebp-0C]
 00463BBC    xor         edx,edx
 00463BBE    mov         dword ptr [eax],edx
 00463BC0    mov         eax,dword ptr [ebp-8]
 00463BC3    xor         edx,edx
 00463BC5    mov         dword ptr [eax],edx
 00463BC7    call        @DoneExcept
 00463BCC    xor         eax,eax
 00463BCE    pop         edx
 00463BCF    pop         ecx
 00463BD0    pop         ecx
 00463BD1    mov         dword ptr fs:[eax],edx
 00463BD4    push        463BF6
 00463BD9    lea         eax,[ebp-14]
 00463BDC    mov         edx,2
 00463BE1    call        @LStrArrayClr
 00463BE6    lea         eax,[ebp-4]
 00463BE9    call        @LStrClr
 00463BEE    ret
>00463BEF    jmp         @HandleFinally
>00463BF4    jmp         00463BD9
 00463BF6    pop         edi
 00463BF7    pop         esi
 00463BF8    pop         ebx
 00463BF9    mov         esp,ebp
 00463BFB    pop         ebp
 00463BFC    ret
end;*}

//00463C0C
{*function sub_00463C0C(?:AnsiString; ?:?):?;
begin
 00463C0C    push        ebp
 00463C0D    mov         ebp,esp
 00463C0F    push        ebx
 00463C10    push        esi
 00463C11    push        edi
 00463C12    mov         esi,eax
 00463C14    mov         eax,dword ptr [ebp+8]
 00463C17    mov         edx,dword ptr [eax-4]
 00463C1A    mov         eax,esi
 00463C1C    call        @LStrPos
 00463C21    mov         ebx,eax
 00463C23    test        ebx,ebx
 00463C25    setg        al
 00463C28    test        al,al
>00463C2A    je          00463C63
 00463C2C    mov         eax,esi
 00463C2E    call        @LStrLen
 00463C33    mov         edi,eax
 00463C35    add         edi,ebx
 00463C37    dec         edi
 00463C38    mov         eax,dword ptr [ebp+8]
 00463C3B    mov         eax,dword ptr [eax-4]
 00463C3E    call        @LStrLen
 00463C43    cmp         edi,eax
>00463C45    je          00463C61
 00463C47    mov         eax,esi
 00463C49    call        @LStrLen
 00463C4E    add         ebx,eax
 00463C50    mov         eax,dword ptr [ebp+8]
 00463C53    mov         eax,dword ptr [eax-4]
 00463C56    cmp         byte ptr [eax+ebx-1],20
>00463C5B    je          00463C61
 00463C5D    xor         eax,eax
>00463C5F    jmp         00463C63
 00463C61    mov         al,1
 00463C63    pop         edi
 00463C64    pop         esi
 00463C65    pop         ebx
 00463C66    pop         ebp
 00463C67    ret
end;*}

//00463C68
procedure sub_00463C68;
begin
{*
 00463C68    push        ebp
 00463C69    mov         ebp,esp
 00463C6B    add         esp,0FFFFFFF4
 00463C6E    xor         eax,eax
 00463C70    mov         dword ptr [ebp-4],eax
 00463C73    xor         eax,eax
 00463C75    push        ebp
 00463C76    push        46439E
 00463C7B    push        dword ptr fs:[eax]
 00463C7E    mov         dword ptr fs:[eax],esp
 00463C81    push        1F02
 00463C86    call        OpenGL32.glGetString
 00463C8B    mov         edx,eax
 00463C8D    lea         eax,[ebp-4]
 00463C90    call        @LStrFromPChar
 00463C95    lea         ecx,[ebp-0C]
 00463C98    lea         edx,[ebp-8]
 00463C9B    mov         eax,dword ptr [ebp-4]
 00463C9E    call        00463A6C
 00463CA3    mov         byte ptr ds:[5E0CD4],1;gvar_005E0CD4
 00463CAA    cmp         dword ptr [ebp-0C],1
>00463CAE    jge         00463CBA
 00463CB0    cmp         dword ptr [ebp-8],1
>00463CB4    jg          00463CBA
 00463CB6    xor         eax,eax
>00463CB8    jmp         00463CBC
 00463CBA    mov         al,1
 00463CBC    mov         [005E0CD5],al;gvar_005E0CD5
 00463CC1    cmp         dword ptr [ebp-0C],2
>00463CC5    jge         00463CD1
 00463CC7    cmp         dword ptr [ebp-8],1
>00463CCB    jg          00463CD1
 00463CCD    xor         eax,eax
>00463CCF    jmp         00463CD3
 00463CD1    mov         al,1
 00463CD3    mov         [005E0CD6],al;gvar_005E0CD6
 00463CD8    cmp         dword ptr [ebp-0C],3
>00463CDC    jge         00463CE8
 00463CDE    cmp         dword ptr [ebp-8],1
>00463CE2    jg          00463CE8
 00463CE4    xor         eax,eax
>00463CE6    jmp         00463CEA
 00463CE8    mov         al,1
 00463CEA    mov         [005E0CD7],al;gvar_005E0CD7
 00463CEF    cmp         dword ptr [ebp-0C],4
>00463CF3    jge         00463CFF
 00463CF5    cmp         dword ptr [ebp-8],1
>00463CF9    jg          00463CFF
 00463CFB    xor         eax,eax
>00463CFD    jmp         00463D01
 00463CFF    mov         al,1
 00463D01    mov         [005E0CD8],al;gvar_005E0CD8
 00463D06    cmp         dword ptr [ebp-0C],5
>00463D0A    jge         00463D16
 00463D0C    cmp         dword ptr [ebp-8],1
>00463D10    jg          00463D16
 00463D12    xor         eax,eax
>00463D14    jmp         00463D18
 00463D16    mov         al,1
 00463D18    mov         [005E0CD9],al;gvar_005E0CD9
 00463D1D    push        189C0
 00463D22    call        GLU32.gluGetString
 00463D27    mov         edx,eax
 00463D29    lea         eax,[ebp-4]
 00463D2C    call        @LStrFromPChar
 00463D31    lea         ecx,[ebp-0C]
 00463D34    lea         edx,[ebp-8]
 00463D37    mov         eax,dword ptr [ebp-4]
 00463D3A    call        00463A6C
 00463D3F    mov         byte ptr ds:[5E0CDA],1;gvar_005E0CDA
 00463D46    cmp         dword ptr [ebp-0C],1
>00463D4A    jg          00463D56
 00463D4C    cmp         dword ptr [ebp-8],1
>00463D50    jg          00463D56
 00463D52    xor         eax,eax
>00463D54    jmp         00463D58
 00463D56    mov         al,1
 00463D58    mov         [005E0CDB],al;gvar_005E0CDB
 00463D5D    cmp         dword ptr [ebp-0C],2
>00463D61    jg          00463D6D
 00463D63    cmp         dword ptr [ebp-8],1
>00463D67    jg          00463D6D
 00463D69    xor         eax,eax
>00463D6B    jmp         00463D6F
 00463D6D    mov         al,1
 00463D6F    mov         [005E0CDC],al;gvar_005E0CDC
 00463D74    push        1F03
 00463D79    call        OpenGL32.glGetString
 00463D7E    lea         edx,[ebp-4]
 00463D81    call        StrPas
 00463D86    push        ebp
 00463D87    mov         eax,4643B4;'GL_3DFX_multisample'
 00463D8C    call        00463C0C
 00463D91    pop         ecx
 00463D92    mov         [005E0CDD],al;gvar_005E0CDD
 00463D97    push        ebp
 00463D98    mov         eax,4643D0;'GL_3DFX_tbuffer'
 00463D9D    call        00463C0C
 00463DA2    pop         ecx
 00463DA3    mov         [005E0CDE],al;gvar_005E0CDE
 00463DA8    push        ebp
 00463DA9    mov         eax,4643E8;'GL_3DFX_texture_compression_FXT1'
 00463DAE    call        00463C0C
 00463DB3    pop         ecx
 00463DB4    mov         [005E0CDF],al;gvar_005E0CDF
 00463DB9    push        ebp
 00463DBA    mov         eax,464414;'GL_ARB_imaging'
 00463DBF    call        00463C0C
 00463DC4    pop         ecx
 00463DC5    mov         [005E0CE0],al;gvar_005E0CE0
 00463DCA    push        ebp
 00463DCB    mov         eax,46442C;' GL_ARB_multisample'
 00463DD0    call        00463C0C
 00463DD5    pop         ecx
 00463DD6    mov         [005E0CE1],al;gvar_005E0CE1
 00463DDB    push        ebp
 00463DDC    mov         eax,464448;'GL_ARB_multitexture'
 00463DE1    call        00463C0C
 00463DE6    pop         ecx
 00463DE7    mov         [005E0CE2],al;gvar_005E0CE2
 00463DEC    push        ebp
 00463DED    mov         eax,464464;'GL_ARB_depth_texture'
 00463DF2    call        00463C0C
 00463DF7    pop         ecx
 00463DF8    mov         [005E0CE3],al;gvar_005E0CE3
 00463DFD    push        ebp
 00463DFE    mov         eax,464484;'GL_ARB_shadow'
 00463E03    call        00463C0C
 00463E08    pop         ecx
 00463E09    mov         [005E0CE4],al;gvar_005E0CE4
 00463E0E    push        ebp
 00463E0F    mov         eax,46449C;'GL_ARB_texture_border_clamp'
 00463E14    call        00463C0C
 00463E19    pop         ecx
 00463E1A    mov         [005E0CE5],al;gvar_005E0CE5
 00463E1F    push        ebp
 00463E20    mov         eax,4644C0;'GL_ARB_texture_compression'
 00463E25    call        00463C0C
 00463E2A    pop         ecx
 00463E2B    mov         [005E0CE6],al;gvar_005E0CE6
 00463E30    push        ebp
 00463E31    mov         eax,4644E4;'GL_ARB_texture_cube_map'
 00463E36    call        00463C0C
 00463E3B    pop         ecx
 00463E3C    mov         [005E0CE7],al;gvar_005E0CE7
 00463E41    push        ebp
 00463E42    mov         eax,464504;'GL_ARB_transpose_matrix'
 00463E47    call        00463C0C
 00463E4C    pop         ecx
 00463E4D    mov         [005E0CE8],al;gvar_005E0CE8
 00463E52    push        ebp
 00463E53    mov         eax,464524;'GL_ARB_vertex_blend'
 00463E58    call        00463C0C
 00463E5D    pop         ecx
 00463E5E    mov         [005E0CE9],al;gvar_005E0CE9
 00463E63    push        ebp
 00463E64    mov         eax,464540;'GL_ARB_point_parameters'
 00463E69    call        00463C0C
 00463E6E    pop         ecx
 00463E6F    mov         [005E0CEA],al;gvar_005E0CEA
 00463E74    push        ebp
 00463E75    mov         eax,464560;'GL_ARB_texture_env_combine'
 00463E7A    call        00463C0C
 00463E7F    pop         ecx
 00463E80    mov         [005E0CEB],al;gvar_005E0CEB
 00463E85    push        ebp
 00463E86    mov         eax,464584;'GL_ARB_texture_env_crossbar'
 00463E8B    call        00463C0C
 00463E90    pop         ecx
 00463E91    mov         [005E0CEC],al;gvar_005E0CEC
 00463E96    push        ebp
 00463E97    mov         eax,4645A8;'GL_ARB_texture_env_dot3'
 00463E9C    call        00463C0C
 00463EA1    pop         ecx
 00463EA2    mov         [005E0CED],al;gvar_005E0CED
 00463EA7    push        ebp
 00463EA8    mov         eax,4645C8;'GL_ARB_vertex_program'
 00463EAD    call        00463C0C
 00463EB2    pop         ecx
 00463EB3    mov         [005E0CEE],al;gvar_005E0CEE
 00463EB8    push        ebp
 00463EB9    mov         eax,4645E8;'GL_ARB_vertex_buffer_object'
 00463EBE    call        00463C0C
 00463EC3    pop         ecx
 00463EC4    mov         [005E0CEF],al;gvar_005E0CEF
 00463EC9    push        ebp
 00463ECA    mov         eax,46460C;'GL_ARB_shader_objects'
 00463ECF    call        00463C0C
 00463ED4    pop         ecx
 00463ED5    mov         [005E0CF0],al;gvar_005E0CF0
 00463EDA    push        ebp
 00463EDB    mov         eax,46462C;'GL_ARB_vertex_shader'
 00463EE0    call        00463C0C
 00463EE5    pop         ecx
 00463EE6    mov         [005E0CF1],al;gvar_005E0CF1
 00463EEB    push        ebp
 00463EEC    mov         eax,46464C;'GL_ARB_fragment_shader'
 00463EF1    call        00463C0C
 00463EF6    pop         ecx
 00463EF7    mov         [005E0CF2],al;gvar_005E0CF2
 00463EFC    push        ebp
 00463EFD    mov         eax,46466C;'GL_ARB_fragment_program'
 00463F02    call        00463C0C
 00463F07    pop         ecx
 00463F08    mov         [005E0CF3],al;gvar_005E0CF3
 00463F0D    push        ebp
 00463F0E    mov         eax,46468C;'GL_EXT_abgr'
 00463F13    call        00463C0C
 00463F18    pop         ecx
 00463F19    mov         [005E0CF4],al;gvar_005E0CF4
 00463F1E    push        ebp
 00463F1F    mov         eax,4646A0;'GL_EXT_bgra'
 00463F24    call        00463C0C
 00463F29    pop         ecx
 00463F2A    mov         [005E0CF5],al;gvar_005E0CF5
 00463F2F    push        ebp
 00463F30    mov         eax,4646B4;'GL_EXT_blend_color'
 00463F35    call        00463C0C
 00463F3A    pop         ecx
 00463F3B    mov         [005E0CF6],al;gvar_005E0CF6
 00463F40    push        ebp
 00463F41    mov         eax,4646D0;'GL_EXT_blend_func_separate'
 00463F46    call        00463C0C
 00463F4B    pop         ecx
 00463F4C    mov         [005E0CF7],al;gvar_005E0CF7
 00463F51    push        ebp
 00463F52    mov         eax,4646F4;'GL_EXT_blend_logic_op'
 00463F57    call        00463C0C
 00463F5C    pop         ecx
 00463F5D    mov         [005E0CF8],al;gvar_005E0CF8
 00463F62    push        ebp
 00463F63    mov         eax,464714;'GL_EXT_blend_minmax'
 00463F68    call        00463C0C
 00463F6D    pop         ecx
 00463F6E    mov         [005E0CF9],al;gvar_005E0CF9
 00463F73    push        ebp
 00463F74    mov         eax,464730;'GL_EXT_blend_subtract'
 00463F79    call        00463C0C
 00463F7E    pop         ecx
 00463F7F    mov         [005E0CFA],al;gvar_005E0CFA
 00463F84    push        ebp
 00463F85    mov         eax,464750;'GL_EXT_Cg_shader'
 00463F8A    call        00463C0C
 00463F8F    pop         ecx
 00463F90    mov         [005E0CFB],al;gvar_005E0CFB
 00463F95    push        ebp
 00463F96    mov         eax,46476C;'GL_EXT_compiled_vertex_array'
 00463F9B    call        00463C0C
 00463FA0    pop         ecx
 00463FA1    mov         [005E0CFC],al;gvar_005E0CFC
 00463FA6    push        ebp
 00463FA7    mov         eax,464794;'GL_EXT_copy_texture'
 00463FAC    call        00463C0C
 00463FB1    pop         ecx
 00463FB2    mov         [005E0CFD],al;gvar_005E0CFD
 00463FB7    push        ebp
 00463FB8    mov         eax,4647B0;'GL_EXT_draw_range_elements'
 00463FBD    call        00463C0C
 00463FC2    pop         ecx
 00463FC3    mov         [005E0CFE],al;gvar_005E0CFE
 00463FC8    push        ebp
 00463FC9    mov         eax,4647D4;'GL_EXT_fog_coord'
 00463FCE    call        00463C0C
 00463FD3    pop         ecx
 00463FD4    mov         [005E0CFF],al;gvar_005E0CFF
 00463FD9    push        ebp
 00463FDA    mov         eax,4647F0;'GL_EXT_multi_draw_arrays'
 00463FDF    call        00463C0C
 00463FE4    pop         ecx
 00463FE5    mov         [005E0D00],al;gvar_005E0D00
 00463FEA    push        ebp
 00463FEB    mov         eax,464814;'GL_EXT_multisample'
 00463FF0    call        00463C0C
 00463FF5    pop         ecx
 00463FF6    mov         [005E0D01],al;gvar_005E0D01
 00463FFB    push        ebp
 00463FFC    mov         eax,464830;'GL_EXT_packed_pixels'
 00464001    call        00463C0C
 00464006    pop         ecx
 00464007    mov         [005E0D02],al;gvar_005E0D02
 0046400C    push        ebp
 0046400D    mov         eax,464850;'GL_EXT_paletted_texture'
 00464012    call        00463C0C
 00464017    pop         ecx
 00464018    mov         [005E0D03],al;gvar_005E0D03
 0046401D    push        ebp
 0046401E    mov         eax,464870;'GL_EXT_polygon_offset'
 00464023    call        00463C0C
 00464028    pop         ecx
 00464029    mov         [005E0D04],al;gvar_005E0D04
 0046402E    push        ebp
 0046402F    mov         eax,464890;'GL_EXT_rescale_normal'
 00464034    call        00463C0C
 00464039    pop         ecx
 0046403A    mov         [005E0D05],al;gvar_005E0D05
 0046403F    push        ebp
 00464040    mov         eax,4648B0;'GL_EXT_secondary_color'
 00464045    call        00463C0C
 0046404A    pop         ecx
 0046404B    mov         [005E0D06],al;gvar_005E0D06
 00464050    push        ebp
 00464051    mov         eax,4648D0;'GL_EXT_separate_specular_color'
 00464056    call        00463C0C
 0046405B    pop         ecx
 0046405C    mov         [005E0D07],al;gvar_005E0D07
 00464061    push        ebp
 00464062    mov         eax,4648F8;'GL_EXT_shared_texture_palette'
 00464067    call        00463C0C
 0046406C    pop         ecx
 0046406D    mov         [005E0D08],al;gvar_005E0D08
 00464072    push        ebp
 00464073    mov         eax,464920;'GL_EXT_stencil_wrap'
 00464078    call        00463C0C
 0046407D    pop         ecx
 0046407E    mov         [005E0D09],al;gvar_005E0D09
 00464083    push        ebp
 00464084    mov         eax,46493C;'EXT_stencil_two_side'
 00464089    call        00463C0C
 0046408E    pop         ecx
 0046408F    mov         [005E0D0A],al;gvar_005E0D0A
 00464094    push        ebp
 00464095    mov         eax,46495C;'GL_EXT_texture_compression_s3tc'
 0046409A    call        00463C0C
 0046409F    pop         ecx
 004640A0    mov         [005E0D0B],al;gvar_005E0D0B
 004640A5    push        ebp
 004640A6    mov         eax,464984;'GL_EXT_texture_cube_map'
 004640AB    call        00463C0C
 004640B0    pop         ecx
 004640B1    mov         [005E0D0C],al;gvar_005E0D0C
 004640B6    push        ebp
 004640B7    mov         eax,4649A4;'GL_EXT_texture_edge_clamp'
 004640BC    call        00463C0C
 004640C1    pop         ecx
 004640C2    mov         [005E0D0D],al;gvar_005E0D0D
 004640C7    push        ebp
 004640C8    mov         eax,4649C8;'GL_EXT_texture_env_add'
 004640CD    call        00463C0C
 004640D2    pop         ecx
 004640D3    mov         [005E0D0E],al;gvar_005E0D0E
 004640D8    push        ebp
 004640D9    mov         eax,4649E8;'GL_EXT_texture_env_combine'
 004640DE    call        00463C0C
 004640E3    pop         ecx
 004640E4    mov         [005E0D0F],al;gvar_005E0D0F
 004640E9    push        ebp
 004640EA    mov         eax,464A0C;'GL_EXT_texture_filter_anisotropic'
 004640EF    call        00463C0C
 004640F4    pop         ecx
 004640F5    mov         [005E0D10],al;gvar_005E0D10
 004640FA    push        ebp
 004640FB    mov         eax,464A38;'GL_EXT_texture_lod_bias'
 00464100    call        00463C0C
 00464105    pop         ecx
 00464106    mov         [005E0D11],al;gvar_005E0D11
 0046410B    push        ebp
 0046410C    mov         eax,464A58;'GL_EXT_texture_object'
 00464111    call        00463C0C
 00464116    pop         ecx
 00464117    mov         [005E0D12],al;gvar_005E0D12
 0046411C    push        ebp
 0046411D    mov         eax,464A78;'GL_EXT_texture3D'
 00464122    call        00463C0C
 00464127    pop         ecx
 00464128    mov         [005E0D13],al;gvar_005E0D13
 0046412D    push        ebp
 0046412E    mov         eax,464A94;'GL_EXT_clip_volume_hint'
 00464133    call        00463C0C
 00464138    pop         ecx
 00464139    mov         [005E0D14],al;gvar_005E0D14
 0046413E    push        ebp
 0046413F    mov         eax,464AB4;'GL_HP_occlusion_test'
 00464144    call        00463C0C
 00464149    pop         ecx
 0046414A    mov         [005E0D15],al;gvar_005E0D15
 0046414F    push        ebp
 00464150    mov         eax,464AD4;'GL_IBM_rasterpos_clip'
 00464155    call        00463C0C
 0046415A    pop         ecx
 0046415B    mov         [005E0D16],al;gvar_005E0D16
 00464160    push        ebp
 00464161    mov         eax,464AF4;'GL_KTX_buffer_region'
 00464166    call        00463C0C
 0046416B    pop         ecx
 0046416C    mov         [005E0D17],al;gvar_005E0D17
 00464171    push        ebp
 00464172    mov         eax,464B14;'GL_MESA_resize_buffers'
 00464177    call        00463C0C
 0046417C    pop         ecx
 0046417D    mov         [005E0D18],al;gvar_005E0D18
 00464182    push        ebp
 00464183    mov         eax,464B34;'GL_NV_blend_square'
 00464188    call        00463C0C
 0046418D    pop         ecx
 0046418E    mov         [005E0D19],al;gvar_005E0D19
 00464193    push        ebp
 00464194    mov         eax,464B50;'GL_NV_fog_distance'
 00464199    call        00463C0C
 0046419E    pop         ecx
 0046419F    mov         [005E0D1A],al;gvar_005E0D1A
 004641A4    push        ebp
 004641A5    mov         eax,464B6C;'GL_NV_light_max_exponent'
 004641AA    call        00463C0C
 004641AF    pop         ecx
 004641B0    mov         [005E0D1B],al;gvar_005E0D1B
 004641B5    push        ebp
 004641B6    mov         eax,464B90;'GL_NV_register_combiners'
 004641BB    call        00463C0C
 004641C0    pop         ecx
 004641C1    mov         [005E0D1C],al;gvar_005E0D1C
 004641C6    push        ebp
 004641C7    mov         eax,464BB4;'GL_NV_texgen_reflection'
 004641CC    call        00463C0C
 004641D1    pop         ecx
 004641D2    mov         [005E0D1D],al;gvar_005E0D1D
 004641D7    push        ebp
 004641D8    mov         eax,464BD4;'GL_NV_texture_env_combine4'
 004641DD    call        00463C0C
 004641E2    pop         ecx
 004641E3    mov         [005E0D1E],al;gvar_005E0D1E
 004641E8    push        ebp
 004641E9    mov         eax,464BF8;'GL_NV_vertex_array_range'
 004641EE    call        00463C0C
 004641F3    pop         ecx
 004641F4    mov         [005E0D1F],al;gvar_005E0D1F
 004641F9    push        ebp
 004641FA    mov         eax,464C1C;'GL_NV_multisample_filter_hint'
 004641FF    call        00463C0C
 00464204    pop         ecx
 00464205    mov         [005E0D21],al;gvar_005E0D21
 0046420A    push        ebp
 0046420B    mov         eax,464C44;'GL_NV_vertex_program'
 00464210    call        00463C0C
 00464215    pop         ecx
 00464216    mov         [005E0D20],al;gvar_005E0D20
 0046421B    push        ebp
 0046421C    mov         eax,464C64;'GL_NV_fence'
 00464221    call        00463C0C
 00464226    pop         ecx
 00464227    mov         [005E0D22],al;gvar_005E0D22
 0046422C    push        ebp
 0046422D    mov         eax,464C78;'GL_NV_occlusion_query'
 00464232    call        00463C0C
 00464237    pop         ecx
 00464238    mov         [005E0D23],al;gvar_005E0D23
 0046423D    push        ebp
 0046423E    mov         eax,464C98;'GL_NV_texture_rectangle'
 00464243    call        00463C0C
 00464248    pop         ecx
 00464249    mov         [005E0D24],al;gvar_005E0D24
 0046424E    push        ebp
 0046424F    mov         eax,464CB8;'GL_ATI_texture_float'
 00464254    call        00463C0C
 00464259    pop         ecx
 0046425A    mov         [005E0D25],al;gvar_005E0D25
 0046425F    push        ebp
 00464260    mov         eax,464CD8;'GL_ATI_draw_buffers'
 00464265    call        00463C0C
 0046426A    pop         ecx
 0046426B    mov         [005E0D26],al;gvar_005E0D26
 00464270    push        ebp
 00464271    mov         eax,464CF4;'GL_SGI_color_matrix'
 00464276    call        00463C0C
 0046427B    pop         ecx
 0046427C    mov         [005E0D27],al;gvar_005E0D27
 00464281    push        ebp
 00464282    mov         eax,464D10;'GL_SGIS_generate_mipmap'
 00464287    call        00463C0C
 0046428C    pop         ecx
 0046428D    mov         [005E0D28],al;gvar_005E0D28
 00464292    push        ebp
 00464293    mov         eax,464D30;'GL_SGIS_multisample'
 00464298    call        00463C0C
 0046429D    pop         ecx
 0046429E    mov         [005E0D29],al;gvar_005E0D29
 004642A3    push        ebp
 004642A4    mov         eax,464D4C;'GL_SGIS_texture_border_clamp'
 004642A9    call        00463C0C
 004642AE    pop         ecx
 004642AF    mov         [005E0D2A],al;gvar_005E0D2A
 004642B4    push        ebp
 004642B5    mov         eax,464D74;'GL_SGIS_texture_color_mask'
 004642BA    call        00463C0C
 004642BF    pop         ecx
 004642C0    mov         [005E0D2B],al;gvar_005E0D2B
 004642C5    push        ebp
 004642C6    mov         eax,464D98;'GL_SGIS_texture_edge_clamp'
 004642CB    call        00463C0C
 004642D0    pop         ecx
 004642D1    mov         [005E0D2C],al;gvar_005E0D2C
 004642D6    push        ebp
 004642D7    mov         eax,464DBC;'GL_SGIS_texture_lod'
 004642DC    call        00463C0C
 004642E1    pop         ecx
 004642E2    mov         [005E0D2D],al;gvar_005E0D2D
 004642E7    push        ebp
 004642E8    mov         eax,464DD8;'GL_SGIX_depth_texture'
 004642ED    call        00463C0C
 004642F2    pop         ecx
 004642F3    mov         [005E0D2E],al;gvar_005E0D2E
 004642F8    push        ebp
 004642F9    mov         eax,464DF8;'GL_SGIX_shadow'
 004642FE    call        00463C0C
 00464303    pop         ecx
 00464304    mov         [005E0D2F],al;gvar_005E0D2F
 00464309    push        ebp
 0046430A    mov         eax,464E10;'GL_SGIX_shadow_ambient'
 0046430F    call        00463C0C
 00464314    pop         ecx
 00464315    mov         [005E0D30],al;gvar_005E0D30
 0046431A    push        ebp
 0046431B    mov         eax,464E30;'GL_WIN_swap_hint'
 00464320    call        00463C0C
 00464325    pop         ecx
 00464326    mov         [005E0D31],al;gvar_005E0D31
 0046432B    push        ebp
 0046432C    mov         eax,464E4C;'WGL_ARB_extensions_string'
 00464331    call        00463C0C
 00464336    pop         ecx
 00464337    mov         [005E0D34],al;gvar_005E0D34:Boolean
 0046433C    push        189C1
 00464341    call        GLU32.gluGetString
 00464346    mov         edx,eax
 00464348    lea         eax,[ebp-4]
 0046434B    call        @LStrFromPChar
 00464350    push        ebp
 00464351    mov         eax,464E70;'GLU_EXT_TEXTURE'
 00464356    call        00463C0C
 0046435B    pop         ecx
 0046435C    mov         [005E0D39],al;gvar_005E0D39
 00464361    push        ebp
 00464362    mov         eax,464E88;'GLU_EXT_object_space_tess'
 00464367    call        00463C0C
 0046436C    pop         ecx
 0046436D    mov         [005E0D3A],al;gvar_005E0D3A
 00464372    push        ebp
 00464373    mov         eax,464EAC;'GLU_EXT_nurbs_tessellator'
 00464378    call        00463C0C
 0046437D    pop         ecx
 0046437E    mov         [005E0D3B],al;gvar_005E0D3B
 00464383    call        00464EE4
 00464388    xor         eax,eax
 0046438A    pop         edx
 0046438B    pop         ecx
 0046438C    pop         ecx
 0046438D    mov         dword ptr fs:[eax],edx
 00464390    push        4643A5
 00464395    lea         eax,[ebp-4]
 00464398    call        @LStrClr
 0046439D    ret
>0046439E    jmp         @HandleFinally
>004643A3    jmp         00464395
 004643A5    mov         esp,ebp
 004643A7    pop         ebp
 004643A8    ret
*}
end;

//00464EC8
{*function sub_00464EC8(?:AnsiString; ?:?):Boolean;
begin
 00464EC8    push        ebp
 00464EC9    mov         ebp,esp
 00464ECB    push        ebx
 00464ECC    mov         ebx,eax
 00464ECE    mov         eax,dword ptr [ebp+8]
 00464ED1    mov         edx,dword ptr [eax-4]
 00464ED4    mov         eax,ebx
 00464ED6    call        @LStrPos
 00464EDB    test        eax,eax
 00464EDD    setg        al
 00464EE0    pop         ebx
 00464EE1    pop         ebp
 00464EE2    ret
end;*}

//00464EE4
procedure sub_00464EE4;
begin
{*
 00464EE4    push        ebp
 00464EE5    mov         ebp,esp
 00464EE7    push        0
 00464EE9    xor         eax,eax
 00464EEB    push        ebp
 00464EEC    push        464FAD
 00464EF1    push        dword ptr fs:[eax]
 00464EF4    mov         dword ptr fs:[eax],esp
 00464EF7    cmp         dword ptr ds:[5E0DCC],0;gvar_005E0DCC
>00464EFE    je          00464F18
 00464F00    call        OpenGL32.wglGetCurrentDC
 00464F05    push        eax
 00464F06    call        dword ptr ds:[5E0DCC]
 00464F0C    mov         edx,eax
 00464F0E    lea         eax,[ebp-4]
 00464F11    call        @LStrFromPChar
>00464F16    jmp         00464F20
 00464F18    lea         eax,[ebp-4]
 00464F1B    call        @LStrClr
 00464F20    push        ebp
 00464F21    mov         eax,464FC0;'WGL_ARB_multisample'
 00464F26    call        00464EC8
 00464F2B    pop         ecx
 00464F2C    mov         [005E0D33],al;gvar_005E0D33:Boolean
 00464F31    push        ebp
 00464F32    mov         eax,464FDC;'WGL_EXT_swap_control'
 00464F37    call        00464EC8
 00464F3C    pop         ecx
 00464F3D    mov         [005E0D32],al;gvar_005E0D32:Boolean
 00464F42    push        ebp
 00464F43    mov         eax,464FFC;'WGL_ARB_buffer_region'
 00464F48    call        00464EC8
 00464F4D    pop         ecx
 00464F4E    mov         [005E0D37],al;gvar_005E0D37:Boolean
 00464F53    push        ebp
 00464F54    mov         eax,46501C;'WGL_ARB_extensions_string'
 00464F59    call        00464EC8
 00464F5E    pop         ecx
 00464F5F    mov         [005E0D34],al;gvar_005E0D34:Boolean
 00464F64    push        ebp
 00464F65    mov         eax,465040;'WGL_ARB_pbuffer '
 00464F6A    call        00464EC8
 00464F6F    pop         ecx
 00464F70    mov         [005E0D36],al;gvar_005E0D36:Boolean
 00464F75    push        ebp
 00464F76    mov         eax,46505C;'WGL_ARB_pixel_format'
 00464F7B    call        00464EC8
 00464F80    pop         ecx
 00464F81    mov         [005E0D35],al;gvar_005E0D35:Boolean
 00464F86    push        ebp
 00464F87    mov         eax,46507C;'WGL_ATI_pixel_format_float'
 00464F8C    call        00464EC8
 00464F91    pop         ecx
 00464F92    mov         [005E0D38],al;gvar_005E0D38:Boolean
 00464F97    xor         eax,eax
 00464F99    pop         edx
 00464F9A    pop         ecx
 00464F9B    pop         ecx
 00464F9C    mov         dword ptr fs:[eax],edx
 00464F9F    push        464FB4
 00464FA4    lea         eax,[ebp-4]
 00464FA7    call        @LStrClr
 00464FAC    ret
>00464FAD    jmp         @HandleFinally
>00464FB2    jmp         00464FA4
 00464FB4    pop         ecx
 00464FB5    pop         ebp
 00464FB6    ret
*}
end;

//00465098
procedure sub_00465098;
begin
{*
 00465098    cmp         dword ptr ds:[5E1328],0;gvar_005E1328:HMODULE
>0046509F    je          004650B3
 004650A1    mov         eax,[005E1328];gvar_005E1328:HMODULE
 004650A6    push        eax
 004650A7    call        KERNEL32.FreeLibrary
 004650AC    xor         eax,eax
 004650AE    mov         [005E1328],eax;gvar_005E1328:HMODULE
 004650B3    cmp         dword ptr ds:[5E132C],0;gvar_005E132C:HMODULE
>004650BA    je          004650CE
 004650BC    mov         eax,[005E132C];gvar_005E132C:HMODULE
 004650C1    push        eax
 004650C2    call        KERNEL32.FreeLibrary
 004650C7    xor         eax,eax
 004650C9    mov         [005E132C],eax;gvar_005E132C:HMODULE
 004650CE    ret
*}
end;

//004650D0
{*function sub_004650D0:?;
begin
 004650D0    push        ebp
 004650D1    mov         ebp,esp
 004650D3    push        0
 004650D5    push        0
 004650D7    push        ebx
 004650D8    xor         eax,eax
 004650DA    push        ebp
 004650DB    push        465140
 004650E0    push        dword ptr fs:[eax]
 004650E3    mov         dword ptr fs:[eax],esp
 004650E6    cmp         dword ptr ds:[5E1328],0;gvar_005E1328:HMODULE
>004650ED    je          004650F8
 004650EF    cmp         dword ptr ds:[5E132C],0;gvar_005E132C:HMODULE
>004650F6    jne         00465123
 004650F8    lea         edx,[ebp-4]
 004650FB    mov         eax,460284;^gvar_005AF664
 00465100    call        LoadStr
 00465105    mov         eax,dword ptr [ebp-4]
 00465108    push        eax
 00465109    lea         edx,[ebp-8]
 0046510C    mov         eax,46027C;^gvar_005AF664
 00465111    call        LoadStr
 00465116    mov         eax,dword ptr [ebp-8]
 00465119    pop         edx
 0046511A    call        00465150
 0046511F    mov         ebx,eax
>00465121    jmp         00465125
 00465123    mov         bl,1
 00465125    xor         eax,eax
 00465127    pop         edx
 00465128    pop         ecx
 00465129    pop         ecx
 0046512A    mov         dword ptr fs:[eax],edx
 0046512D    push        465147
 00465132    lea         eax,[ebp-8]
 00465135    mov         edx,2
 0046513A    call        @LStrArrayClr
 0046513F    ret
>00465140    jmp         @HandleFinally
>00465145    jmp         00465132
 00465147    mov         eax,ebx
 00465149    pop         ebx
 0046514A    pop         ecx
 0046514B    pop         ecx
 0046514C    pop         ebp
 0046514D    ret
end;*}

//00465150
{*function sub_00465150(?:?; ?:?):?;
begin
 00465150    push        ebx
 00465151    push        esi
 00465152    push        edi
 00465153    mov         edi,edx
 00465155    mov         esi,eax
 00465157    xor         ebx,ebx
 00465159    call        00465098
 0046515E    mov         eax,esi
 00465160    call        @LStrToPChar
 00465165    push        eax
 00465166    call        KERNEL32.LoadLibraryA
 0046516B    mov         [005E1328],eax;gvar_005E1328:HMODULE
 00465170    mov         eax,edi
 00465172    call        @LStrToPChar
 00465177    push        eax
 00465178    call        KERNEL32.LoadLibraryA
 0046517D    mov         [005E132C],eax;gvar_005E132C:HMODULE
 00465182    cmp         dword ptr ds:[5E1328],0;gvar_005E1328:HMODULE
>00465189    je          00465198
 0046518B    cmp         dword ptr ds:[5E132C],0;gvar_005E132C:HMODULE
>00465192    je          00465198
 00465194    mov         bl,1
>00465196    jmp         004651C0
 00465198    cmp         dword ptr ds:[5E1328],0;gvar_005E1328:HMODULE
>0046519F    je          004651AC
 004651A1    mov         eax,[005E1328];gvar_005E1328:HMODULE
 004651A6    push        eax
 004651A7    call        KERNEL32.FreeLibrary
 004651AC    cmp         dword ptr ds:[5E132C],0;gvar_005E132C:HMODULE
>004651B3    je          004651C0
 004651B5    mov         eax,[005E132C];gvar_005E132C:HMODULE
 004651BA    push        eax
 004651BB    call        KERNEL32.FreeLibrary
 004651C0    mov         eax,ebx
 004651C2    pop         edi
 004651C3    pop         esi
 004651C4    pop         ebx
 004651C5    ret
end;*}

//004651C8
function sub_004651C8:Boolean;
begin
{*
 004651C8    push        4651E0
 004651CD    mov         eax,[005E1328];gvar_005E1328:HMODULE
 004651D2    push        eax
 004651D3    call        KERNEL32.GetProcAddress
 004651D8    test        eax,eax
 004651DA    setne       al
 004651DD    ret
*}
end;

Initialization
//0046522C
{*
 0046522C    sub         dword ptr ds:[5E1324],1
>00465233    jae         0046523E
 00465235    mov         ax,133F
 00465239    call        Set8087CW
 0046523E    ret
*}
Finalization
end.