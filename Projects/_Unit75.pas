//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit75;

interface

uses
  SysUtils, Classes;

type
  TGLTextLayout = (tlTop, tlCenter, tlBottom);
    //function sub_0046F4A8(?:?):?;//0046F4A8
    //function sub_0046F4B8:?;//0046F4B8
    //function sub_0046F4BC(?:?):?;//0046F4BC
    //function sub_0046F4C0(?:?):?;//0046F4C0
    procedure sub_0046F4C4;//0046F4C4
    procedure sub_0046F7F0;//0046F7F0
    //function sub_0046F874:?;//0046F874
    procedure sub_0046F87C;//0046F87C
    //procedure sub_0046F884(?:?);//0046F884

implementation

//0046F4A8
{*function sub_0046F4A8(?:?):?;
begin
 0046F4A8    test        eax,eax
>0046F4AA    jge         0046F4B7
 0046F4AC    and         eax,0FF
 0046F4B1    push        eax
 0046F4B2    call        user32.GetSysColor
 0046F4B7    ret
end;*}

//0046F4B8
{*function sub_0046F4B8:?;
begin
 0046F4B8    ret
end;*}

//0046F4BC
{*function sub_0046F4BC(?:?):?;
begin
 0046F4BC    shr         eax,8
 0046F4BF    ret
end;*}

//0046F4C0
{*function sub_0046F4C0(?:?):?;
begin
 0046F4C0    shr         eax,10
 0046F4C3    ret
end;*}

//0046F4C4
procedure sub_0046F4C4;
begin
{*
 0046F4C4    push        esi
 0046F4C5    push        edi
 0046F4C6    add         esp,0FFFFFFF0
 0046F4C9    push        3F800000
 0046F4CE    lea         edx,[esp+4]
 0046F4D2    mov         eax,0FF000000
 0046F4D7    call        00478438
 0046F4DC    mov         eax,[005AE700];^gvar_005AD27C
 0046F4E1    mov         esi,esp
 0046F4E3    mov         edi,eax
 0046F4E5    movs        dword ptr [edi],dword ptr [esi]
 0046F4E6    movs        dword ptr [edi],dword ptr [esi]
 0046F4E7    movs        dword ptr [edi],dword ptr [esi]
 0046F4E8    movs        dword ptr [edi],dword ptr [esi]
 0046F4E9    push        3F800000
 0046F4EE    lea         edx,[esp+4]
 0046F4F2    mov         eax,0FF000001
 0046F4F7    call        00478438
 0046F4FC    mov         eax,[005AE570];^gvar_005AD28C
 0046F501    mov         esi,esp
 0046F503    mov         edi,eax
 0046F505    movs        dword ptr [edi],dword ptr [esi]
 0046F506    movs        dword ptr [edi],dword ptr [esi]
 0046F507    movs        dword ptr [edi],dword ptr [esi]
 0046F508    movs        dword ptr [edi],dword ptr [esi]
 0046F509    push        3F800000
 0046F50E    lea         edx,[esp+4]
 0046F512    mov         eax,0FF000002
 0046F517    call        00478438
 0046F51C    mov         eax,[005AE104];^gvar_005AD29C
 0046F521    mov         esi,esp
 0046F523    mov         edi,eax
 0046F525    movs        dword ptr [edi],dword ptr [esi]
 0046F526    movs        dword ptr [edi],dword ptr [esi]
 0046F527    movs        dword ptr [edi],dword ptr [esi]
 0046F528    movs        dword ptr [edi],dword ptr [esi]
 0046F529    push        3F800000
 0046F52E    lea         edx,[esp+4]
 0046F532    mov         eax,0FF000003
 0046F537    call        00478438
 0046F53C    mov         eax,[005AE5A0];^gvar_005AD2AC
 0046F541    mov         esi,esp
 0046F543    mov         edi,eax
 0046F545    movs        dword ptr [edi],dword ptr [esi]
 0046F546    movs        dword ptr [edi],dword ptr [esi]
 0046F547    movs        dword ptr [edi],dword ptr [esi]
 0046F548    movs        dword ptr [edi],dword ptr [esi]
 0046F549    push        3F800000
 0046F54E    lea         edx,[esp+4]
 0046F552    mov         eax,0FF000004
 0046F557    call        00478438
 0046F55C    mov         eax,[005AE26C];^gvar_005AD2BC
 0046F561    mov         esi,esp
 0046F563    mov         edi,eax
 0046F565    movs        dword ptr [edi],dword ptr [esi]
 0046F566    movs        dword ptr [edi],dword ptr [esi]
 0046F567    movs        dword ptr [edi],dword ptr [esi]
 0046F568    movs        dword ptr [edi],dword ptr [esi]
 0046F569    push        3F800000
 0046F56E    lea         edx,[esp+4]
 0046F572    mov         eax,0FF000005
 0046F577    call        00478438
 0046F57C    mov         eax,[005AE158];^gvar_005AD2CC
 0046F581    mov         esi,esp
 0046F583    mov         edi,eax
 0046F585    movs        dword ptr [edi],dword ptr [esi]
 0046F586    movs        dword ptr [edi],dword ptr [esi]
 0046F587    movs        dword ptr [edi],dword ptr [esi]
 0046F588    movs        dword ptr [edi],dword ptr [esi]
 0046F589    push        3F800000
 0046F58E    lea         edx,[esp+4]
 0046F592    mov         eax,0FF000006
 0046F597    call        00478438
 0046F59C    mov         eax,[005AE4C8];^gvar_005AD2DC
 0046F5A1    mov         esi,esp
 0046F5A3    mov         edi,eax
 0046F5A5    movs        dword ptr [edi],dword ptr [esi]
 0046F5A6    movs        dword ptr [edi],dword ptr [esi]
 0046F5A7    movs        dword ptr [edi],dword ptr [esi]
 0046F5A8    movs        dword ptr [edi],dword ptr [esi]
 0046F5A9    push        3F800000
 0046F5AE    lea         edx,[esp+4]
 0046F5B2    mov         eax,0FF000007
 0046F5B7    call        00478438
 0046F5BC    mov         eax,[005AE6C0];^gvar_005AD2EC
 0046F5C1    mov         esi,esp
 0046F5C3    mov         edi,eax
 0046F5C5    movs        dword ptr [edi],dword ptr [esi]
 0046F5C6    movs        dword ptr [edi],dword ptr [esi]
 0046F5C7    movs        dword ptr [edi],dword ptr [esi]
 0046F5C8    movs        dword ptr [edi],dword ptr [esi]
 0046F5C9    push        3F800000
 0046F5CE    lea         edx,[esp+4]
 0046F5D2    mov         eax,0FF000008
 0046F5D7    call        00478438
 0046F5DC    mov         eax,[005AE5B4];^gvar_005AD2FC
 0046F5E1    mov         esi,esp
 0046F5E3    mov         edi,eax
 0046F5E5    movs        dword ptr [edi],dword ptr [esi]
 0046F5E6    movs        dword ptr [edi],dword ptr [esi]
 0046F5E7    movs        dword ptr [edi],dword ptr [esi]
 0046F5E8    movs        dword ptr [edi],dword ptr [esi]
 0046F5E9    push        3F800000
 0046F5EE    lea         edx,[esp+4]
 0046F5F2    mov         eax,0FF000009
 0046F5F7    call        00478438
 0046F5FC    mov         eax,[005AE450];^gvar_005AD30C
 0046F601    mov         esi,esp
 0046F603    mov         edi,eax
 0046F605    movs        dword ptr [edi],dword ptr [esi]
 0046F606    movs        dword ptr [edi],dword ptr [esi]
 0046F607    movs        dword ptr [edi],dword ptr [esi]
 0046F608    movs        dword ptr [edi],dword ptr [esi]
 0046F609    push        3F800000
 0046F60E    lea         edx,[esp+4]
 0046F612    mov         eax,0FF00000A
 0046F617    call        00478438
 0046F61C    mov         eax,[005AE738];^gvar_005AD31C
 0046F621    mov         esi,esp
 0046F623    mov         edi,eax
 0046F625    movs        dword ptr [edi],dword ptr [esi]
 0046F626    movs        dword ptr [edi],dword ptr [esi]
 0046F627    movs        dword ptr [edi],dword ptr [esi]
 0046F628    movs        dword ptr [edi],dword ptr [esi]
 0046F629    push        3F800000
 0046F62E    lea         edx,[esp+4]
 0046F632    mov         eax,0FF00000B
 0046F637    call        00478438
 0046F63C    mov         eax,[005AE470];^gvar_005AD32C
 0046F641    mov         esi,esp
 0046F643    mov         edi,eax
 0046F645    movs        dword ptr [edi],dword ptr [esi]
 0046F646    movs        dword ptr [edi],dword ptr [esi]
 0046F647    movs        dword ptr [edi],dword ptr [esi]
 0046F648    movs        dword ptr [edi],dword ptr [esi]
 0046F649    push        3F800000
 0046F64E    lea         edx,[esp+4]
 0046F652    mov         eax,0FF00000C
 0046F657    call        00478438
 0046F65C    mov         eax,[005AE15C];^gvar_005AD33C
 0046F661    mov         esi,esp
 0046F663    mov         edi,eax
 0046F665    movs        dword ptr [edi],dword ptr [esi]
 0046F666    movs        dword ptr [edi],dword ptr [esi]
 0046F667    movs        dword ptr [edi],dword ptr [esi]
 0046F668    movs        dword ptr [edi],dword ptr [esi]
 0046F669    push        3F800000
 0046F66E    lea         edx,[esp+4]
 0046F672    mov         eax,0FF00000D
 0046F677    call        00478438
 0046F67C    mov         eax,[005AE46C];^gvar_005AD34C
 0046F681    mov         esi,esp
 0046F683    mov         edi,eax
 0046F685    movs        dword ptr [edi],dword ptr [esi]
 0046F686    movs        dword ptr [edi],dword ptr [esi]
 0046F687    movs        dword ptr [edi],dword ptr [esi]
 0046F688    movs        dword ptr [edi],dword ptr [esi]
 0046F689    push        3F800000
 0046F68E    lea         edx,[esp+4]
 0046F692    mov         eax,0FF00000E
 0046F697    call        00478438
 0046F69C    mov         eax,[005AE17C];^gvar_005AD35C
 0046F6A1    mov         esi,esp
 0046F6A3    mov         edi,eax
 0046F6A5    movs        dword ptr [edi],dword ptr [esi]
 0046F6A6    movs        dword ptr [edi],dword ptr [esi]
 0046F6A7    movs        dword ptr [edi],dword ptr [esi]
 0046F6A8    movs        dword ptr [edi],dword ptr [esi]
 0046F6A9    push        3F800000
 0046F6AE    lea         edx,[esp+4]
 0046F6B2    mov         eax,0FF00000F
 0046F6B7    call        00478438
 0046F6BC    mov         eax,[005AE55C];^gvar_005AD36C
 0046F6C1    mov         esi,esp
 0046F6C3    mov         edi,eax
 0046F6C5    movs        dword ptr [edi],dword ptr [esi]
 0046F6C6    movs        dword ptr [edi],dword ptr [esi]
 0046F6C7    movs        dword ptr [edi],dword ptr [esi]
 0046F6C8    movs        dword ptr [edi],dword ptr [esi]
 0046F6C9    push        3F800000
 0046F6CE    lea         edx,[esp+4]
 0046F6D2    mov         eax,0FF000010
 0046F6D7    call        00478438
 0046F6DC    mov         eax,[005AE520];^gvar_005AD37C
 0046F6E1    mov         esi,esp
 0046F6E3    mov         edi,eax
 0046F6E5    movs        dword ptr [edi],dword ptr [esi]
 0046F6E6    movs        dword ptr [edi],dword ptr [esi]
 0046F6E7    movs        dword ptr [edi],dword ptr [esi]
 0046F6E8    movs        dword ptr [edi],dword ptr [esi]
 0046F6E9    push        3F800000
 0046F6EE    lea         edx,[esp+4]
 0046F6F2    mov         eax,0FF000011
 0046F6F7    call        00478438
 0046F6FC    mov         eax,[005AE4D0];^gvar_005AD38C
 0046F701    mov         esi,esp
 0046F703    mov         edi,eax
 0046F705    movs        dword ptr [edi],dword ptr [esi]
 0046F706    movs        dword ptr [edi],dword ptr [esi]
 0046F707    movs        dword ptr [edi],dword ptr [esi]
 0046F708    movs        dword ptr [edi],dword ptr [esi]
 0046F709    push        3F800000
 0046F70E    lea         edx,[esp+4]
 0046F712    mov         eax,0FF000012
 0046F717    call        00478438
 0046F71C    mov         eax,[005AE678];^gvar_005AD39C
 0046F721    mov         esi,esp
 0046F723    mov         edi,eax
 0046F725    movs        dword ptr [edi],dword ptr [esi]
 0046F726    movs        dword ptr [edi],dword ptr [esi]
 0046F727    movs        dword ptr [edi],dword ptr [esi]
 0046F728    movs        dword ptr [edi],dword ptr [esi]
 0046F729    push        3F800000
 0046F72E    lea         edx,[esp+4]
 0046F732    mov         eax,0FF000013
 0046F737    call        00478438
 0046F73C    mov         eax,[005AE278];^gvar_005AD3AC
 0046F741    mov         esi,esp
 0046F743    mov         edi,eax
 0046F745    movs        dword ptr [edi],dword ptr [esi]
 0046F746    movs        dword ptr [edi],dword ptr [esi]
 0046F747    movs        dword ptr [edi],dword ptr [esi]
 0046F748    movs        dword ptr [edi],dword ptr [esi]
 0046F749    push        3F800000
 0046F74E    lea         edx,[esp+4]
 0046F752    mov         eax,0FF000014
 0046F757    call        00478438
 0046F75C    mov         eax,[005AE2F8];^gvar_005AD3BC
 0046F761    mov         esi,esp
 0046F763    mov         edi,eax
 0046F765    movs        dword ptr [edi],dword ptr [esi]
 0046F766    movs        dword ptr [edi],dword ptr [esi]
 0046F767    movs        dword ptr [edi],dword ptr [esi]
 0046F768    movs        dword ptr [edi],dword ptr [esi]
 0046F769    push        3F800000
 0046F76E    lea         edx,[esp+4]
 0046F772    mov         eax,0FF000015
 0046F777    call        00478438
 0046F77C    mov         eax,[005AE56C];^gvar_005AD3CC
 0046F781    mov         esi,esp
 0046F783    mov         edi,eax
 0046F785    movs        dword ptr [edi],dword ptr [esi]
 0046F786    movs        dword ptr [edi],dword ptr [esi]
 0046F787    movs        dword ptr [edi],dword ptr [esi]
 0046F788    movs        dword ptr [edi],dword ptr [esi]
 0046F789    push        3F800000
 0046F78E    lea         edx,[esp+4]
 0046F792    mov         eax,0FF000016
 0046F797    call        00478438
 0046F79C    mov         eax,[005AE35C];^gvar_005AD3DC
 0046F7A1    mov         esi,esp
 0046F7A3    mov         edi,eax
 0046F7A5    movs        dword ptr [edi],dword ptr [esi]
 0046F7A6    movs        dword ptr [edi],dword ptr [esi]
 0046F7A7    movs        dword ptr [edi],dword ptr [esi]
 0046F7A8    movs        dword ptr [edi],dword ptr [esi]
 0046F7A9    push        3F800000
 0046F7AE    lea         edx,[esp+4]
 0046F7B2    mov         eax,0FF000017
 0046F7B7    call        00478438
 0046F7BC    mov         eax,[005AE410];^gvar_005AD3EC
 0046F7C1    mov         esi,esp
 0046F7C3    mov         edi,eax
 0046F7C5    movs        dword ptr [edi],dword ptr [esi]
 0046F7C6    movs        dword ptr [edi],dword ptr [esi]
 0046F7C7    movs        dword ptr [edi],dword ptr [esi]
 0046F7C8    movs        dword ptr [edi],dword ptr [esi]
 0046F7C9    push        3F800000
 0046F7CE    lea         edx,[esp+4]
 0046F7D2    mov         eax,0FF000018
 0046F7D7    call        00478438
 0046F7DC    mov         eax,[005AE558];^gvar_005AD3FC
 0046F7E1    mov         esi,esp
 0046F7E3    mov         edi,eax
 0046F7E5    movs        dword ptr [edi],dword ptr [esi]
 0046F7E6    movs        dword ptr [edi],dword ptr [esi]
 0046F7E7    movs        dword ptr [edi],dword ptr [esi]
 0046F7E8    movs        dword ptr [edi],dword ptr [esi]
 0046F7E9    add         esp,10
 0046F7EC    pop         edi
 0046F7ED    pop         esi
 0046F7EE    ret
*}
end;

//0046F7F0
procedure sub_0046F7F0;
begin
{*
 0046F7F0    push        ebp
 0046F7F1    mov         ebp,esp
 0046F7F3    push        0
 0046F7F5    push        0
 0046F7F7    xor         eax,eax
 0046F7F9    push        ebp
 0046F7FA    push        46F855
 0046F7FF    push        dword ptr fs:[eax]
 0046F802    mov         dword ptr fs:[eax],esp
 0046F805    call        KERNEL32.GetLastError
 0046F80A    lea         edx,[ebp-8]
 0046F80D    call        SysErrorMessage
 0046F812    mov         ecx,dword ptr [ebp-8]
 0046F815    lea         eax,[ebp-4]
 0046F818    mov         edx,46F868;'OS Error : '
 0046F81D    call        @LStrCat3
 0046F822    mov         ecx,dword ptr [ebp-4]
 0046F825    mov         dl,1
 0046F827    mov         eax,[004094C4];EOSError
 0046F82C    call        Exception.Create;EOSError.Create
 0046F831    mov         edx,eax
 0046F833    mov         eax,edx
 0046F835    call        @RaiseExcept
 0046F83A    xor         eax,eax
 0046F83C    pop         edx
 0046F83D    pop         ecx
 0046F83E    pop         ecx
 0046F83F    mov         dword ptr fs:[eax],edx
 0046F842    push        46F85C
 0046F847    lea         eax,[ebp-8]
 0046F84A    mov         edx,2
 0046F84F    call        @LStrArrayClr
 0046F854    ret
>0046F855    jmp         @HandleFinally
>0046F85A    jmp         0046F847
 0046F85C    pop         ecx
 0046F85D    pop         ecx
 0046F85E    pop         ebp
 0046F85F    ret
*}
end;

//0046F874
{*function sub_0046F874:?;
begin
 0046F874    call        TBitmap.GetScanline
 0046F879    ret
end;*}

//0046F87C
procedure sub_0046F87C;
begin
{*
 0046F87C    push        eax
 0046F87D    call        KERNEL32.QueryPerformanceCounter
 0046F882    ret
*}
end;

//0046F884
{*procedure sub_0046F884(?:?);
begin
 0046F884    push        ebx
 0046F885    mov         ebx,eax
 0046F887    push        ebx
 0046F888    call        KERNEL32.QueryPerformanceFrequency
 0046F88D    cmp         eax,1
 0046F890    sbb         eax,eax
 0046F892    inc         eax
 0046F893    pop         ebx
 0046F894    ret
end;*}

Initialization
//0046F8E0
{*
 0046F8E0    sub         dword ptr ds:[5E14D4],1
>0046F8E7    jae         0046F8F3
 0046F8E9    mov         eax,46F8D4
 0046F8EE    call        @InitResStringImports
 0046F8F3    ret
*}
Finalization
//0046F898
{*
 0046F898    push        ebp
 0046F899    mov         ebp,esp
 0046F89B    xor         eax,eax
 0046F89D    push        ebp
 0046F89E    push        46F8C9
 0046F8A3    push        dword ptr fs:[eax]
 0046F8A6    mov         dword ptr fs:[eax],esp
 0046F8A9    inc         dword ptr ds:[5E14D4]
>0046F8AF    jne         0046F8BB
 0046F8B1    mov         eax,5AD278
 0046F8B6    call        @LStrClr
 0046F8BB    xor         eax,eax
 0046F8BD    pop         edx
 0046F8BE    pop         ecx
 0046F8BF    pop         ecx
 0046F8C0    mov         dword ptr fs:[eax],edx
 0046F8C3    push        46F8D0
 0046F8C8    ret
>0046F8C9    jmp         @HandleFinally
>0046F8CE    jmp         0046F8C8
 0046F8D0    pop         ebp
 0046F8D1    ret
*}
end.