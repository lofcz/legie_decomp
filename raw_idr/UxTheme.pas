//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit UxTheme;

interface

uses
  SysUtils, Classes;

    procedure FreeThemeLibrary;//0042F430
    function InitThemeLibrary:Boolean;//0042F5F0
    function UseThemes:Boolean;//0042FD54

implementation

//0042F430
procedure FreeThemeLibrary;
begin
{*
 0042F430    push        ebp
 0042F431    mov         ebp,esp
 0042F433    mov         eax,[005E0B10];Lock:TCriticalSection
 0042F438    call        TCriticalSection.Enter
 0042F43D    xor         eax,eax
 0042F43F    push        ebp
 0042F440    push        42F5E7
 0042F445    push        dword ptr fs:[eax]
 0042F448    mov         dword ptr fs:[eax],esp
 0042F44B    cmp         dword ptr ds:[5E0B0C],0;ReferenceCount:Integer
>0042F452    jle         0042F45A
 0042F454    dec         dword ptr ds:[5E0B0C];ReferenceCount:Integer
 0042F45A    cmp         dword ptr ds:[5E0B08],0;ThemeLibrary:THandle
>0042F461    je          0042F5CF
 0042F467    cmp         dword ptr ds:[5E0B0C],0;ReferenceCount:Integer
>0042F46E    jne         0042F5CF
 0042F474    mov         eax,[005E0B08];ThemeLibrary:THandle
 0042F479    push        eax
 0042F47A    call        KERNEL32.FreeLibrary
 0042F47F    xor         eax,eax
 0042F481    mov         [005E0B08],eax;ThemeLibrary:THandle
 0042F486    xor         eax,eax
 0042F488    mov         [005E0A48],eax;OpenThemeData:function(val hwnd:Windows.HWND;val pszClassList:Windows.LPC...
 0042F48D    xor         eax,eax
 0042F48F    mov         [005E0A4C],eax;CloseThemeData:function(val hTheme:Windows.THandle):System.HRESULT stdcal...
 0042F494    xor         eax,eax
 0042F496    mov         [005E0A50],eax;DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 0042F49B    xor         eax,eax
 0042F49D    mov         [005E0A54],eax;DrawThemeText:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0042F4A2    xor         eax,eax
 0042F4A4    mov         [005E0A58],eax;GetThemeBackgroundContentRect:function(val hTheme:Windows.THandle;val hdc...
 0042F4A9    xor         eax,eax
 0042F4AB    mov         [005E0A5C],eax;GetThemeBackgroundExtent:function(val hTheme:Windows.THandle;val hdc:Wind...
 0042F4B0    xor         eax,eax
 0042F4B2    mov         [005E0A60],eax;GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 0042F4B7    xor         eax,eax
 0042F4B9    mov         [005E0A64],eax;GetThemeTextExtent:function(val hTheme:Windows.THandle;val hdc:Windows.HD...
 0042F4BE    xor         eax,eax
 0042F4C0    mov         [005E0A68],eax;GetThemeTextMetrics:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 0042F4C5    xor         eax,eax
 0042F4C7    mov         [005E0A6C],eax;GetThemeBackgroundRegion:function(val hTheme:Windows.THandle;val hdc:Wind...
 0042F4CC    xor         eax,eax
 0042F4CE    mov         [005E0A70],eax;HitTestThemeBackground:function(val hTheme:Windows.THandle;val hdc:Window...
 0042F4D3    xor         eax,eax
 0042F4D5    mov         [005E0A74],eax;DrawThemeEdge:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0042F4DA    xor         eax,eax
 0042F4DC    mov         [005E0A78],eax;DrawThemeIcon:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0042F4E1    xor         eax,eax
 0042F4E3    mov         [005E0A7C],eax;IsThemePartDefined:function(val hTheme:Windows.THandle;val iPartId:System...
 0042F4E8    xor         eax,eax
 0042F4EA    mov         [005E0A80],eax;IsThemeBackgroundPartiallyTransparent:function(val hTheme:Windows.THandle...
 0042F4EF    xor         eax,eax
 0042F4F1    mov         [005E0A84],eax;GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 0042F4F6    xor         eax,eax
 0042F4F8    mov         [005E0A88],eax;GetThemeMetric:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;va...
 0042F4FD    xor         eax,eax
 0042F4FF    mov         [005E0A8C],eax;GetThemeString:function(val hTheme:Windows.THandle;val iPartId:System.Int...
 0042F504    xor         eax,eax
 0042F506    mov         [005E0A90],eax;GetThemeBool:function(val hTheme:Windows.THandle;val iPartId:System.Integ...
 0042F50B    xor         eax,eax
 0042F50D    mov         [005E0A94],eax;GetThemeInt:function(val hTheme:Windows.THandle;val iPartId:System.Intege...
 0042F512    xor         eax,eax
 0042F514    mov         [005E0A98],eax;GetThemeEnumValue:function(val hTheme:Windows.THandle;val iPartId:System....
 0042F519    xor         eax,eax
 0042F51B    mov         [005E0A9C],eax;GetThemePosition:function(val hTheme:Windows.THandle;val iPartId:System.I...
 0042F520    xor         eax,eax
 0042F522    mov         [005E0AA0],eax;GetThemeFont:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val ...
 0042F527    xor         eax,eax
 0042F529    mov         [005E0AA4],eax;GetThemeRect:function(val hTheme:Windows.THandle;val iPartId:System.Integ...
 0042F52E    xor         eax,eax
 0042F530    mov         [005E0AA8],eax;GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;v...
 0042F535    xor         eax,eax
 0042F537    mov         [005E0AAC],eax;GetThemeIntList:function(val hTheme:Windows.THandle;val iPartId:System.In...
 0042F53C    xor         eax,eax
 0042F53E    mov         [005E0AB0],eax;GetThemePropertyOrigin:function(val hTheme:Windows.THandle;val iPartId:Sy...
 0042F543    xor         eax,eax
 0042F545    mov         [005E0AB4],eax;SetWindowTheme:function(val hwnd:Windows.HWND;val pszSubAppName:Windows.L...
 0042F54A    xor         eax,eax
 0042F54C    mov         [005E0AB8],eax;GetThemeFilename:function(val hTheme:Windows.THandle;val iPartId:System.I...
 0042F551    xor         eax,eax
 0042F553    mov         [005E0ABC],eax;GetThemeSysColor:function(val hTheme:Windows.THandle;val iColorId:System....
 0042F558    xor         eax,eax
 0042F55A    mov         [005E0AC0],eax;GetThemeSysColorBrush:function(val hTheme:Windows.THandle;val iColorId:Sy...
 0042F55F    xor         eax,eax
 0042F561    mov         [005E0AC4],eax;GetThemeSysBool:function(val hTheme:Windows.THandle;val iBoolId:System.In...
 0042F566    xor         eax,eax
 0042F568    mov         [005E0AC8],eax;GetThemeSysSize:function(val hTheme:Windows.THandle;val iSizeId:System.In...
 0042F56D    xor         eax,eax
 0042F56F    mov         [005E0ACC],eax;GetThemeSysFont:function(val hTheme:Windows.THandle;val iFontId:System.In...
 0042F574    xor         eax,eax
 0042F576    mov         [005E0AD0],eax;GetThemeSysString:function(val hTheme:Windows.THandle;val iStringId:Syste...
 0042F57B    xor         eax,eax
 0042F57D    mov         [005E0AD4],eax;GetThemeSysInt:function(val hTheme:Windows.THandle;val iIntId:System.Inte...
 0042F582    xor         eax,eax
 0042F584    mov         [005E0AD8],eax;IsThemeActive:BOOL stdcall
 0042F589    xor         eax,eax
 0042F58B    mov         [005E0ADC],eax;IsAppThemed:BOOL stdcall
 0042F590    xor         eax,eax
 0042F592    mov         [005E0AE0],eax;GetWindowTheme:function(val hwnd:Windows.HWND):Windows.THandle stdcall
 0042F597    xor         eax,eax
 0042F599    mov         [005E0AE4],eax;EnableThemeDialogTexture:function(val hwnd:Windows.HWND;val dwFlags:Windo...
 0042F59E    xor         eax,eax
 0042F5A0    mov         [005E0AE8],eax;IsThemeDialogTextureEnabled:function(val hwnd:Windows.HWND):Windows.BOOL ...
 0042F5A5    xor         eax,eax
 0042F5A7    mov         [005E0AEC],eax;GetThemeAppProperties:DWORD stdcall
 0042F5AC    xor         eax,eax
 0042F5AE    mov         [005E0AF0],eax;SetThemeAppProperties:procedure(val dwFlags:Windows.DWORD) stdcall
 0042F5B3    xor         eax,eax
 0042F5B5    mov         [005E0AF4],eax;GetCurrentThemeName:function(val pszThemeFileName:Windows.LPWSTR;val cchM...
 0042F5BA    xor         eax,eax
 0042F5BC    mov         [005E0AF8],eax;GetThemeDocumentationProperty:function(val pszThemeName:Windows.LPCWSTR;v...
 0042F5C1    xor         eax,eax
 0042F5C3    mov         [005E0AFC],eax;DrawThemeParentBackground:function(val hwnd:Windows.HWND;val hdc:Windows....
 0042F5C8    xor         eax,eax
 0042F5CA    mov         [005E0B00],eax;EnableTheming:function(val fEnable:Windows.BOOL):System.HRESULT stdcall
 0042F5CF    xor         eax,eax
 0042F5D1    pop         edx
 0042F5D2    pop         ecx
 0042F5D3    pop         ecx
 0042F5D4    mov         dword ptr fs:[eax],edx
 0042F5D7    push        42F5EE
 0042F5DC    mov         eax,[005E0B10];Lock:TCriticalSection
 0042F5E1    call        TCriticalSection.Leave
 0042F5E6    ret
>0042F5E7    jmp         @HandleFinally
>0042F5EC    jmp         0042F5DC
 0042F5EE    pop         ebp
 0042F5EF    ret
*}
end;

//0042F5F0
function InitThemeLibrary:Boolean;
begin
{*
 0042F5F0    push        ebp
 0042F5F1    mov         ebp,esp
 0042F5F3    push        ecx
 0042F5F4    push        ebx
 0042F5F5    mov         ebx,5E0B08;ThemeLibrary:THandle
 0042F5FA    mov         eax,[005E0B10];Lock:TCriticalSection
 0042F5FF    call        TCriticalSection.Enter
 0042F604    xor         eax,eax
 0042F606    push        ebp
 0042F607    push        42F9A3
 0042F60C    push        dword ptr fs:[eax]
 0042F60F    mov         dword ptr fs:[eax],esp
 0042F612    inc         dword ptr ds:[5E0B0C];ReferenceCount:Integer
 0042F618    cmp         dword ptr [ebx],0
>0042F61B    jne         0042F984
 0042F621    push        42F9B4
 0042F626    call        KERNEL32.LoadLibraryA
 0042F62B    mov         dword ptr [ebx],eax
 0042F62D    cmp         dword ptr [ebx],0
>0042F630    jbe         0042F984
 0042F636    push        42F9C0
 0042F63B    mov         eax,dword ptr [ebx]
 0042F63D    push        eax
 0042F63E    call        KERNEL32.GetProcAddress
 0042F643    mov         [005E0A48],eax;OpenThemeData:function(val hwnd:Windows.HWND;val pszClassList:Windows.LPC...
 0042F648    push        42F9D0
 0042F64D    mov         eax,dword ptr [ebx]
 0042F64F    push        eax
 0042F650    call        KERNEL32.GetProcAddress
 0042F655    mov         [005E0A4C],eax;CloseThemeData:function(val hTheme:Windows.THandle):System.HRESULT stdcal...
 0042F65A    push        42F9E0
 0042F65F    mov         eax,dword ptr [ebx]
 0042F661    push        eax
 0042F662    call        KERNEL32.GetProcAddress
 0042F667    mov         [005E0A50],eax;DrawThemeBackground:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 0042F66C    push        42F9F4
 0042F671    mov         eax,dword ptr [ebx]
 0042F673    push        eax
 0042F674    call        KERNEL32.GetProcAddress
 0042F679    mov         [005E0A54],eax;DrawThemeText:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0042F67E    push        42FA04
 0042F683    mov         eax,dword ptr [ebx]
 0042F685    push        eax
 0042F686    call        KERNEL32.GetProcAddress
 0042F68B    mov         [005E0A58],eax;GetThemeBackgroundContentRect:function(val hTheme:Windows.THandle;val hdc...
 0042F690    push        42FA04
 0042F695    mov         eax,dword ptr [ebx]
 0042F697    push        eax
 0042F698    call        KERNEL32.GetProcAddress
 0042F69D    mov         [005E0A5C],eax;GetThemeBackgroundExtent:function(val hTheme:Windows.THandle;val hdc:Wind...
 0042F6A2    push        42FA24
 0042F6A7    mov         eax,dword ptr [ebx]
 0042F6A9    push        eax
 0042F6AA    call        KERNEL32.GetProcAddress
 0042F6AF    mov         [005E0A60],eax;GetThemePartSize:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;...
 0042F6B4    push        42FA38
 0042F6B9    mov         eax,dword ptr [ebx]
 0042F6BB    push        eax
 0042F6BC    call        KERNEL32.GetProcAddress
 0042F6C1    mov         [005E0A64],eax;GetThemeTextExtent:function(val hTheme:Windows.THandle;val hdc:Windows.HD...
 0042F6C6    push        42FA4C
 0042F6CB    mov         eax,dword ptr [ebx]
 0042F6CD    push        eax
 0042F6CE    call        KERNEL32.GetProcAddress
 0042F6D3    mov         [005E0A68],eax;GetThemeTextMetrics:function(val hTheme:Windows.THandle;val hdc:Windows.H...
 0042F6D8    push        42FA60
 0042F6DD    mov         eax,dword ptr [ebx]
 0042F6DF    push        eax
 0042F6E0    call        KERNEL32.GetProcAddress
 0042F6E5    mov         [005E0A6C],eax;GetThemeBackgroundRegion:function(val hTheme:Windows.THandle;val hdc:Wind...
 0042F6EA    push        42FA7C
 0042F6EF    mov         eax,dword ptr [ebx]
 0042F6F1    push        eax
 0042F6F2    call        KERNEL32.GetProcAddress
 0042F6F7    mov         [005E0A70],eax;HitTestThemeBackground:function(val hTheme:Windows.THandle;val hdc:Window...
 0042F6FC    push        42FA94
 0042F701    mov         eax,dword ptr [ebx]
 0042F703    push        eax
 0042F704    call        KERNEL32.GetProcAddress
 0042F709    mov         [005E0A74],eax;DrawThemeEdge:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0042F70E    push        42FAA4
 0042F713    mov         eax,dword ptr [ebx]
 0042F715    push        eax
 0042F716    call        KERNEL32.GetProcAddress
 0042F71B    mov         [005E0A78],eax;DrawThemeIcon:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val...
 0042F720    push        42FAB4
 0042F725    mov         eax,dword ptr [ebx]
 0042F727    push        eax
 0042F728    call        KERNEL32.GetProcAddress
 0042F72D    mov         [005E0A7C],eax;IsThemePartDefined:function(val hTheme:Windows.THandle;val iPartId:System...
 0042F732    push        42FAC8
 0042F737    mov         eax,dword ptr [ebx]
 0042F739    push        eax
 0042F73A    call        KERNEL32.GetProcAddress
 0042F73F    mov         [005E0A80],eax;IsThemeBackgroundPartiallyTransparent:function(val hTheme:Windows.THandle...
 0042F744    push        42FAF0
 0042F749    mov         eax,dword ptr [ebx]
 0042F74B    push        eax
 0042F74C    call        KERNEL32.GetProcAddress
 0042F751    mov         [005E0A84],eax;GetThemeColor:function(val hTheme:Windows.THandle;val iPartId:System.Inte...
 0042F756    push        42FB00
 0042F75B    mov         eax,dword ptr [ebx]
 0042F75D    push        eax
 0042F75E    call        KERNEL32.GetProcAddress
 0042F763    mov         [005E0A88],eax;GetThemeMetric:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;va...
 0042F768    push        42FB10
 0042F76D    mov         eax,dword ptr [ebx]
 0042F76F    push        eax
 0042F770    call        KERNEL32.GetProcAddress
 0042F775    mov         [005E0A8C],eax;GetThemeString:function(val hTheme:Windows.THandle;val iPartId:System.Int...
 0042F77A    push        42FB20
 0042F77F    mov         eax,dword ptr [ebx]
 0042F781    push        eax
 0042F782    call        KERNEL32.GetProcAddress
 0042F787    mov         [005E0A90],eax;GetThemeBool:function(val hTheme:Windows.THandle;val iPartId:System.Integ...
 0042F78C    push        42FB30
 0042F791    mov         eax,dword ptr [ebx]
 0042F793    push        eax
 0042F794    call        KERNEL32.GetProcAddress
 0042F799    mov         [005E0A94],eax;GetThemeInt:function(val hTheme:Windows.THandle;val iPartId:System.Intege...
 0042F79E    push        42FB3C
 0042F7A3    mov         eax,dword ptr [ebx]
 0042F7A5    push        eax
 0042F7A6    call        KERNEL32.GetProcAddress
 0042F7AB    mov         [005E0A98],eax;GetThemeEnumValue:function(val hTheme:Windows.THandle;val iPartId:System....
 0042F7B0    push        42FB50
 0042F7B5    mov         eax,dword ptr [ebx]
 0042F7B7    push        eax
 0042F7B8    call        KERNEL32.GetProcAddress
 0042F7BD    mov         [005E0A9C],eax;GetThemePosition:function(val hTheme:Windows.THandle;val iPartId:System.I...
 0042F7C2    push        42FB64
 0042F7C7    mov         eax,dword ptr [ebx]
 0042F7C9    push        eax
 0042F7CA    call        KERNEL32.GetProcAddress
 0042F7CF    mov         [005E0AA0],eax;GetThemeFont:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;val ...
 0042F7D4    push        42FB74
 0042F7D9    mov         eax,dword ptr [ebx]
 0042F7DB    push        eax
 0042F7DC    call        KERNEL32.GetProcAddress
 0042F7E1    mov         [005E0AA4],eax;GetThemeRect:function(val hTheme:Windows.THandle;val iPartId:System.Integ...
 0042F7E6    push        42FB84
 0042F7EB    mov         eax,dword ptr [ebx]
 0042F7ED    push        eax
 0042F7EE    call        KERNEL32.GetProcAddress
 0042F7F3    mov         [005E0AA8],eax;GetThemeMargins:function(val hTheme:Windows.THandle;val hdc:Windows.HDC;v...
 0042F7F8    push        42FB94
 0042F7FD    mov         eax,dword ptr [ebx]
 0042F7FF    push        eax
 0042F800    call        KERNEL32.GetProcAddress
 0042F805    mov         [005E0AAC],eax;GetThemeIntList:function(val hTheme:Windows.THandle;val iPartId:System.In...
 0042F80A    push        42FBA4
 0042F80F    mov         eax,dword ptr [ebx]
 0042F811    push        eax
 0042F812    call        KERNEL32.GetProcAddress
 0042F817    mov         [005E0AB0],eax;GetThemePropertyOrigin:function(val hTheme:Windows.THandle;val iPartId:Sy...
 0042F81C    push        42FBBC
 0042F821    mov         eax,dword ptr [ebx]
 0042F823    push        eax
 0042F824    call        KERNEL32.GetProcAddress
 0042F829    mov         [005E0AB4],eax;SetWindowTheme:function(val hwnd:Windows.HWND;val pszSubAppName:Windows.L...
 0042F82E    push        42FBCC
 0042F833    mov         eax,dword ptr [ebx]
 0042F835    push        eax
 0042F836    call        KERNEL32.GetProcAddress
 0042F83B    mov         [005E0AB8],eax;GetThemeFilename:function(val hTheme:Windows.THandle;val iPartId:System.I...
 0042F840    push        42FBE0
 0042F845    mov         eax,dword ptr [ebx]
 0042F847    push        eax
 0042F848    call        KERNEL32.GetProcAddress
 0042F84D    mov         [005E0ABC],eax;GetThemeSysColor:function(val hTheme:Windows.THandle;val iColorId:System....
 0042F852    push        42FBF4
 0042F857    mov         eax,dword ptr [ebx]
 0042F859    push        eax
 0042F85A    call        KERNEL32.GetProcAddress
 0042F85F    mov         [005E0AC0],eax;GetThemeSysColorBrush:function(val hTheme:Windows.THandle;val iColorId:Sy...
 0042F864    push        42FC0C
 0042F869    mov         eax,dword ptr [ebx]
 0042F86B    push        eax
 0042F86C    call        KERNEL32.GetProcAddress
 0042F871    mov         [005E0AC4],eax;GetThemeSysBool:function(val hTheme:Windows.THandle;val iBoolId:System.In...
 0042F876    push        42FC1C
 0042F87B    mov         eax,dword ptr [ebx]
 0042F87D    push        eax
 0042F87E    call        KERNEL32.GetProcAddress
 0042F883    mov         [005E0AC8],eax;GetThemeSysSize:function(val hTheme:Windows.THandle;val iSizeId:System.In...
 0042F888    push        42FC2C
 0042F88D    mov         eax,dword ptr [ebx]
 0042F88F    push        eax
 0042F890    call        KERNEL32.GetProcAddress
 0042F895    mov         [005E0ACC],eax;GetThemeSysFont:function(val hTheme:Windows.THandle;val iFontId:System.In...
 0042F89A    push        42FC3C
 0042F89F    mov         eax,dword ptr [ebx]
 0042F8A1    push        eax
 0042F8A2    call        KERNEL32.GetProcAddress
 0042F8A7    mov         [005E0AD0],eax;GetThemeSysString:function(val hTheme:Windows.THandle;val iStringId:Syste...
 0042F8AC    push        42FC50
 0042F8B1    mov         eax,dword ptr [ebx]
 0042F8B3    push        eax
 0042F8B4    call        KERNEL32.GetProcAddress
 0042F8B9    mov         [005E0AD4],eax;GetThemeSysInt:function(val hTheme:Windows.THandle;val iIntId:System.Inte...
 0042F8BE    push        42FC60
 0042F8C3    mov         eax,dword ptr [ebx]
 0042F8C5    push        eax
 0042F8C6    call        KERNEL32.GetProcAddress
 0042F8CB    mov         [005E0AD8],eax;IsThemeActive:BOOL stdcall
 0042F8D0    push        42FC70
 0042F8D5    mov         eax,dword ptr [ebx]
 0042F8D7    push        eax
 0042F8D8    call        KERNEL32.GetProcAddress
 0042F8DD    mov         [005E0ADC],eax;IsAppThemed:BOOL stdcall
 0042F8E2    push        42FC7C
 0042F8E7    mov         eax,dword ptr [ebx]
 0042F8E9    push        eax
 0042F8EA    call        KERNEL32.GetProcAddress
 0042F8EF    mov         [005E0AE0],eax;GetWindowTheme:function(val hwnd:Windows.HWND):Windows.THandle stdcall
 0042F8F4    push        42FC8C
 0042F8F9    mov         eax,dword ptr [ebx]
 0042F8FB    push        eax
 0042F8FC    call        KERNEL32.GetProcAddress
 0042F901    mov         [005E0AE4],eax;EnableThemeDialogTexture:function(val hwnd:Windows.HWND;val dwFlags:Windo...
 0042F906    push        42FCA8
 0042F90B    mov         eax,dword ptr [ebx]
 0042F90D    push        eax
 0042F90E    call        KERNEL32.GetProcAddress
 0042F913    mov         [005E0AE8],eax;IsThemeDialogTextureEnabled:function(val hwnd:Windows.HWND):Windows.BOOL ...
 0042F918    push        42FCC4
 0042F91D    mov         eax,dword ptr [ebx]
 0042F91F    push        eax
 0042F920    call        KERNEL32.GetProcAddress
 0042F925    mov         [005E0AEC],eax;GetThemeAppProperties:DWORD stdcall
 0042F92A    push        42FCDC
 0042F92F    mov         eax,dword ptr [ebx]
 0042F931    push        eax
 0042F932    call        KERNEL32.GetProcAddress
 0042F937    mov         [005E0AF0],eax;SetThemeAppProperties:procedure(val dwFlags:Windows.DWORD) stdcall
 0042F93C    push        42FCF4
 0042F941    mov         eax,dword ptr [ebx]
 0042F943    push        eax
 0042F944    call        KERNEL32.GetProcAddress
 0042F949    mov         [005E0AF4],eax;GetCurrentThemeName:function(val pszThemeFileName:Windows.LPWSTR;val cchM...
 0042F94E    push        42FD08
 0042F953    mov         eax,dword ptr [ebx]
 0042F955    push        eax
 0042F956    call        KERNEL32.GetProcAddress
 0042F95B    mov         [005E0AF8],eax;GetThemeDocumentationProperty:function(val pszThemeName:Windows.LPCWSTR;v...
 0042F960    push        42FD28
 0042F965    mov         eax,dword ptr [ebx]
 0042F967    push        eax
 0042F968    call        KERNEL32.GetProcAddress
 0042F96D    mov         [005E0AFC],eax;DrawThemeParentBackground:function(val hwnd:Windows.HWND;val hdc:Windows....
 0042F972    push        42FD44
 0042F977    mov         eax,dword ptr [ebx]
 0042F979    push        eax
 0042F97A    call        KERNEL32.GetProcAddress
 0042F97F    mov         [005E0B00],eax;EnableTheming:function(val fEnable:Windows.BOOL):System.HRESULT stdcall
 0042F984    cmp         dword ptr [ebx],0
 0042F987    seta        byte ptr [ebp-1]
 0042F98B    xor         eax,eax
 0042F98D    pop         edx
 0042F98E    pop         ecx
 0042F98F    pop         ecx
 0042F990    mov         dword ptr fs:[eax],edx
 0042F993    push        42F9AA
 0042F998    mov         eax,[005E0B10];Lock:TCriticalSection
 0042F99D    call        TCriticalSection.Leave
 0042F9A2    ret
>0042F9A3    jmp         @HandleFinally
>0042F9A8    jmp         0042F998
 0042F9AA    mov         al,byte ptr [ebp-1]
 0042F9AD    pop         ebx
 0042F9AE    pop         ecx
 0042F9AF    pop         ebp
 0042F9B0    ret
*}
end;

//0042FD54
function UseThemes:Boolean;
begin
{*
 0042FD54    cmp         dword ptr ds:[5E0B08],0;ThemeLibrary:THandle
>0042FD5B    jbe         0042FD78
 0042FD5D    call        dword ptr ds:[5E0ADC]
 0042FD63    test        eax,eax
>0042FD65    je          0042FD71
 0042FD67    call        dword ptr ds:[5E0AD8]
 0042FD6D    test        eax,eax
>0042FD6F    jne         0042FD75
 0042FD71    xor         eax,eax
>0042FD73    jmp         0042FD7A
 0042FD75    mov         al,1
 0042FD77    ret
 0042FD78    xor         eax,eax
 0042FD7A    ret
*}
end;

Initialization
//0042FDD0
{*
 0042FDD0    sub         dword ptr ds:[5E0B04],1
>0042FDD7    jae         0042FDEA
 0042FDD9    mov         dl,1
 0042FDDB    mov         eax,[0042F2F0];TCriticalSection
 0042FDE0    call        TCriticalSection.Create
 0042FDE5    mov         [005E0B10],eax;Lock:TCriticalSection
 0042FDEA    ret
*}
Finalization
//0042FD7C
{*
 0042FD7C    push        ebp
 0042FD7D    mov         ebp,esp
 0042FD7F    xor         eax,eax
 0042FD81    push        ebp
 0042FD82    push        42FDC4
 0042FD87    push        dword ptr fs:[eax]
 0042FD8A    mov         dword ptr fs:[eax],esp
 0042FD8D    inc         dword ptr ds:[5E0B04]
>0042FD93    jne         0042FDB6
 0042FD95    cmp         dword ptr ds:[5E0B0C],0;ReferenceCount:Integer
>0042FD9C    jle         0042FDAC
 0042FD9E    call        FreeThemeLibrary
 0042FDA3    cmp         dword ptr ds:[5E0B0C],0;ReferenceCount:Integer
>0042FDAA    jg          0042FD9E
 0042FDAC    mov         eax,[005E0B10];Lock:TCriticalSection
 0042FDB1    call        TObject.Free
 0042FDB6    xor         eax,eax
 0042FDB8    pop         edx
 0042FDB9    pop         ecx
 0042FDBA    pop         ecx
 0042FDBB    mov         dword ptr fs:[eax],edx
 0042FDBE    push        42FDCB
 0042FDC3    ret
>0042FDC4    jmp         @HandleFinally
>0042FDC9    jmp         0042FDC3
 0042FDCB    pop         ebp
 0042FDCC    ret
*}
end.