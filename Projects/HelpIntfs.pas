//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit HelpIntfs;

interface

uses
  SysUtils, Classes, ;

type
  EHelpSystemException = class(Exception)
  end;
  THelpViewerNode = class(TObject)
  public
    FViewer:ICustomHelpViewer;//f4
    FViewerID:Integer;//f8
    constructor Create(const Viewer:ICustomHelpViewer);//0042E398
  end;
  THelpManager = class(TInterfacedObject)
  public
    FHelpSelector:IHelpSelector;//fC
    FViewerList:TObjectList;//f10
    FExtendedViewerList:TObjectList;//f14
    FSpecialWinHelpViewerList:TObjectList;//f18
    FMinCookie:Integer;//f1C
    FHandle:Longint;//f20
    FHelpFile:String;//f24
    constructor Create;//0042E3D4
    function RegisterViewer(const newViewer:ICustomHelpViewer):IHelpManager;//0042E448
    procedure UnloadAllViewers;//0042E568
    procedure DoSoftShutDown;//0042E5A8
    procedure DoTableOfContents;//0042E5D8
    function CallSpecialWinHelp(Handle:Longint; const HelpFile:AnsiString; Command:Word; Data:Longint):Boolean;//0042E778
    procedure ShowContextHelp(const ContextID:Longint; const HelpFileName:AnsiString);//0042EA94
    procedure AssignHelpSelector(Selector:IHelpSelector);//0042ECAC
    function Hook(Handle:Longint; HelpFile:AnsiString; Command:Word; Data:Longint):Boolean;//0042ED08
    function GetHelpFile:AnsiString;//0042EDB4
    destructor Destroy;//0042EE54
  end;
    function RegisterViewer(const newViewer:ICustomHelpViewer; var Manager:IHelpManager):Integer;//0042E2BC
    function GetHelpSystem(var System:IHelpSystem):Integer;//0042E340
    //procedure sub_0042E880(?:?; ?:?; ?:?);//0042E880
    procedure sub_0042EBA8;//0042EBA8
    //procedure sub_0042EBB0(?:?; ?:?; ?:?);//0042EBB0
    //function sub_0042EDB0(?:?):?;//0042EDB0
    //procedure sub_0042EDC8(?:?; ?:?);//0042EDC8

implementation

//0042E2BC
function RegisterViewer(const newViewer:ICustomHelpViewer; var Manager:IHelpManager):Integer;
begin
{*
 0042E2BC    push        ebp
 0042E2BD    mov         ebp,esp
 0042E2BF    add         esp,0FFFFFFF8
 0042E2C2    push        ebx
 0042E2C3    xor         ecx,ecx
 0042E2C5    mov         dword ptr [ebp-8],ecx
 0042E2C8    mov         dword ptr [ebp-4],edx
 0042E2CB    mov         ebx,eax
 0042E2CD    mov         eax,dword ptr [ebp-4]
 0042E2D0    test        eax,eax
>0042E2D2    je          0042E2D8
 0042E2D4    xor         edx,edx
 0042E2D6    mov         dword ptr [eax],edx
 0042E2D8    xor         eax,eax
 0042E2DA    push        ebp
 0042E2DB    push        42E332
 0042E2E0    push        dword ptr fs:[eax]
 0042E2E3    mov         dword ptr fs:[eax],esp
 0042E2E6    cmp         dword ptr ds:[5E0A04],0;HelpManager:THelpManager
>0042E2ED    jne         0042E300
 0042E2EF    mov         dl,1
 0042E2F1    mov         eax,[0042E228];THelpManager
 0042E2F6    call        THelpManager.Create
 0042E2FB    mov         [005E0A04],eax;HelpManager:THelpManager
 0042E300    lea         ecx,[ebp-8]
 0042E303    mov         edx,ebx
 0042E305    mov         eax,[005E0A04];HelpManager:THelpManager
 0042E30A    call        THelpManager.RegisterViewer
 0042E30F    mov         edx,dword ptr [ebp-8]
 0042E312    mov         eax,dword ptr [ebp-4]
 0042E315    call        @IntfCopy
 0042E31A    xor         ebx,ebx
 0042E31C    xor         eax,eax
 0042E31E    pop         edx
 0042E31F    pop         ecx
 0042E320    pop         ecx
 0042E321    mov         dword ptr fs:[eax],edx
 0042E324    push        42E339
 0042E329    lea         eax,[ebp-8]
 0042E32C    call        @IntfClear
 0042E331    ret
>0042E332    jmp         @HandleFinally
>0042E337    jmp         0042E329
 0042E339    mov         eax,ebx
 0042E33B    pop         ebx
 0042E33C    pop         ecx
 0042E33D    pop         ecx
 0042E33E    pop         ebp
 0042E33F    ret
*}
end;

//0042E340
function GetHelpSystem(var System:IHelpSystem):Integer;
begin
{*
 0042E340    push        ebp
 0042E341    mov         ebp,esp
 0042E343    push        ebx
 0042E344    mov         ebx,eax
 0042E346    test        ebx,ebx
>0042E348    je          0042E34E
 0042E34A    xor         eax,eax
 0042E34C    mov         dword ptr [ebx],eax
 0042E34E    cmp         dword ptr ds:[5E0A04],0;HelpManager:THelpManager
>0042E355    jne         0042E368
 0042E357    mov         dl,1
 0042E359    mov         eax,[0042E228];THelpManager
 0042E35E    call        THelpManager.Create
 0042E363    mov         [005E0A04],eax;HelpManager:THelpManager
 0042E368    mov         eax,ebx
 0042E36A    mov         edx,dword ptr ds:[5E0A04];HelpManager:THelpManager
 0042E370    test        edx,edx
>0042E372    je          0042E377
 0042E374    sub         edx,0FFFFFFF8
 0042E377    mov         ecx,42E388
 0042E37C    call        @IntfCast
 0042E381    xor         eax,eax
 0042E383    pop         ebx
 0042E384    pop         ebp
 0042E385    ret
*}
end;

//0042E398
constructor THelpViewerNode.Create(const Viewer:ICustomHelpViewer);
begin
{*
 0042E398    push        ebx
 0042E399    push        esi
 0042E39A    push        edi
 0042E39B    test        dl,dl
>0042E39D    je          0042E3A7
 0042E39F    add         esp,0FFFFFFF0
 0042E3A2    call        @ClassCreate
 0042E3A7    mov         esi,ecx
 0042E3A9    mov         ebx,edx
 0042E3AB    mov         edi,eax
 0042E3AD    lea         eax,[edi+4]
 0042E3B0    mov         edx,esi
 0042E3B2    call        @IntfCopy
 0042E3B7    mov         eax,edi
 0042E3B9    test        bl,bl
>0042E3BB    je          0042E3CC
 0042E3BD    call        @AfterConstruction
 0042E3C2    pop         dword ptr fs:[0]
 0042E3C9    add         esp,0C
 0042E3CC    mov         eax,edi
 0042E3CE    pop         edi
 0042E3CF    pop         esi
 0042E3D0    pop         ebx
 0042E3D1    ret
*}
end;

//0042E3D4
constructor THelpManager.Create;
begin
{*
 0042E3D4    push        ebx
 0042E3D5    push        esi
 0042E3D6    test        dl,dl
>0042E3D8    je          0042E3E2
 0042E3DA    add         esp,0FFFFFFF0
 0042E3DD    call        @ClassCreate
 0042E3E2    mov         ebx,edx
 0042E3E4    mov         esi,eax
 0042E3E6    xor         edx,edx
 0042E3E8    mov         eax,esi
 0042E3EA    call        TObject.Create
 0042E3EF    mov         dl,1
 0042E3F1    mov         eax,[0042D340];TObjectList
 0042E3F6    call        TObjectList.Create
 0042E3FB    mov         dword ptr [esi+10],eax
 0042E3FE    mov         dl,1
 0042E400    mov         eax,[0042D340];TObjectList
 0042E405    call        TObjectList.Create
 0042E40A    mov         dword ptr [esi+14],eax
 0042E40D    mov         dl,1
 0042E40F    mov         eax,[0042D340];TObjectList
 0042E414    call        TObjectList.Create
 0042E419    mov         dword ptr [esi+18],eax
 0042E41C    lea         eax,[esi+24]
 0042E41F    call        @LStrClr
 0042E424    mov         dword ptr [esi+1C],1
 0042E42B    mov         eax,esi
 0042E42D    test        bl,bl
>0042E42F    je          0042E440
 0042E431    call        @AfterConstruction
 0042E436    pop         dword ptr fs:[0]
 0042E43D    add         esp,0C
 0042E440    mov         eax,esi
 0042E442    pop         esi
 0042E443    pop         ebx
 0042E444    ret
*}
end;

//0042E448
function THelpManager.RegisterViewer(const newViewer:ICustomHelpViewer):IHelpManager;
begin
{*
 0042E448    push        ebp
 0042E449    mov         ebp,esp
 0042E44B    push        0
 0042E44D    push        0
 0042E44F    push        0
 0042E451    push        ebx
 0042E452    push        esi
 0042E453    push        edi
 0042E454    mov         dword ptr [ebp-4],ecx
 0042E457    mov         edi,edx
 0042E459    mov         ebx,eax
 0042E45B    xor         eax,eax
 0042E45D    push        ebp
 0042E45E    push        42E549
 0042E463    push        dword ptr fs:[eax]
 0042E466    mov         dword ptr fs:[eax],esp
 0042E469    mov         ecx,edi
 0042E46B    mov         dl,1
 0042E46D    mov         eax,[0042E0B8];THelpViewerNode
 0042E472    call        THelpViewerNode.Create
 0042E477    mov         esi,eax
 0042E479    mov         eax,dword ptr [ebx+1C]
 0042E47C    mov         dword ptr [esi+8],eax
 0042E47F    mov         eax,dword ptr [ebx+10]
 0042E482    mov         edx,dword ptr [eax+8]
 0042E485    mov         ecx,esi
 0042E487    call        TObjectList.Insert
 0042E48C    mov         edx,dword ptr [esi+8]
 0042E48F    mov         eax,edi
 0042E491    mov         ecx,dword ptr [eax]
 0042E493    call        dword ptr [ecx+24]
 0042E496    lea         eax,[ebp-8]
 0042E499    call        @IntfClear
 0042E49E    mov         ecx,eax
 0042E4A0    mov         edx,42E558
 0042E4A5    mov         eax,edi
 0042E4A7    call        Supports
 0042E4AC    test        al,al
>0042E4AE    je          0042E4D4
 0042E4B0    mov         ecx,dword ptr [ebp-8]
 0042E4B3    mov         dl,1
 0042E4B5    mov         eax,[0042E0B8];THelpViewerNode
 0042E4BA    call        THelpViewerNode.Create
 0042E4BF    mov         esi,eax
 0042E4C1    mov         eax,dword ptr [ebx+1C]
 0042E4C4    mov         dword ptr [esi+8],eax
 0042E4C7    mov         eax,dword ptr [ebx+14]
 0042E4CA    mov         edx,dword ptr [eax+8]
 0042E4CD    mov         ecx,esi
 0042E4CF    call        TObjectList.Insert
 0042E4D4    lea         eax,[ebp-0C]
 0042E4D7    call        @IntfClear
 0042E4DC    mov         ecx,eax
 0042E4DE    mov         edx,42E558
 0042E4E3    mov         eax,edi
 0042E4E5    call        Supports
 0042E4EA    test        al,al
>0042E4EC    je          0042E512
 0042E4EE    mov         ecx,dword ptr [ebp-0C]
 0042E4F1    mov         dl,1
 0042E4F3    mov         eax,[0042E0B8];THelpViewerNode
 0042E4F8    call        THelpViewerNode.Create
 0042E4FD    mov         esi,eax
 0042E4FF    mov         eax,dword ptr [ebx+1C]
 0042E502    mov         dword ptr [esi+8],eax
 0042E505    mov         eax,dword ptr [ebx+18]
 0042E508    mov         edx,dword ptr [eax+8]
 0042E50B    mov         ecx,esi
 0042E50D    call        TObjectList.Insert
 0042E512    inc         dword ptr [ebx+1C]
 0042E515    mov         eax,dword ptr [ebp-4]
 0042E518    mov         edx,ebx
 0042E51A    test        edx,edx
>0042E51C    je          0042E521
 0042E51E    sub         edx,0FFFFFFF8
 0042E521    mov         ecx,42E558
 0042E526    call        @IntfCast
 0042E52B    xor         eax,eax
 0042E52D    pop         edx
 0042E52E    pop         ecx
 0042E52F    pop         ecx
 0042E530    mov         dword ptr fs:[eax],edx
 0042E533    push        42E550
 0042E538    lea         eax,[ebp-0C]
 0042E53B    call        @IntfClear
 0042E540    lea         eax,[ebp-8]
 0042E543    call        @IntfClear
 0042E548    ret
>0042E549    jmp         @HandleFinally
>0042E54E    jmp         0042E538
 0042E550    pop         edi
 0042E551    pop         esi
 0042E552    pop         ebx
 0042E553    mov         esp,ebp
 0042E555    pop         ebp
 0042E556    ret
*}
end;

//0042E568
procedure THelpManager.UnloadAllViewers;
begin
{*
 0042E568    push        ebx
 0042E569    push        esi
 0042E56A    push        edi
 0042E56B    mov         ebx,eax
>0042E56D    jmp         0042E581
 0042E56F    mov         edx,edi
 0042E571    dec         edx
 0042E572    mov         eax,esi
 0042E574    call        TClassList.GetItems
 0042E579    mov         eax,dword ptr [eax+4]
 0042E57C    mov         edx,dword ptr [eax]
 0042E57E    call        dword ptr [edx+2C]
 0042E581    mov         esi,dword ptr [ebx+10]
 0042E584    mov         edi,dword ptr [esi+8]
 0042E587    test        edi,edi
>0042E589    jg          0042E56F
 0042E58B    mov         eax,dword ptr [ebx+10]
 0042E58E    mov         edx,dword ptr [eax]
 0042E590    call        dword ptr [edx+8]
 0042E593    mov         eax,dword ptr [ebx+14]
 0042E596    mov         edx,dword ptr [eax]
 0042E598    call        dword ptr [edx+8]
 0042E59B    mov         eax,dword ptr [ebx+18]
 0042E59E    mov         edx,dword ptr [eax]
 0042E5A0    call        dword ptr [edx+8]
 0042E5A3    pop         edi
 0042E5A4    pop         esi
 0042E5A5    pop         ebx
 0042E5A6    ret
*}
end;

//0042E5A8
procedure THelpManager.DoSoftShutDown;
begin
{*
 0042E5A8    push        ebx
 0042E5A9    push        esi
 0042E5AA    push        edi
 0042E5AB    mov         edi,eax
 0042E5AD    mov         eax,dword ptr [edi+10]
 0042E5B0    mov         ebx,dword ptr [eax+8]
 0042E5B3    dec         ebx
 0042E5B4    test        ebx,ebx
>0042E5B6    jl          0042E5D1
 0042E5B8    inc         ebx
 0042E5B9    xor         esi,esi
 0042E5BB    mov         eax,dword ptr [edi+10]
 0042E5BE    mov         edx,esi
 0042E5C0    call        TClassList.GetItems
 0042E5C5    mov         eax,dword ptr [eax+4]
 0042E5C8    mov         edx,dword ptr [eax]
 0042E5CA    call        dword ptr [edx+28]
 0042E5CD    inc         esi
 0042E5CE    dec         ebx
>0042E5CF    jne         0042E5BB
 0042E5D1    pop         edi
 0042E5D2    pop         esi
 0042E5D3    pop         ebx
 0042E5D4    ret
*}
end;

//0042E5D8
procedure THelpManager.DoTableOfContents;
begin
{*
 0042E5D8    push        ebp
 0042E5D9    mov         ebp,esp
 0042E5DB    add         esp,0FFFFFFF0
 0042E5DE    push        ebx
 0042E5DF    push        esi
 0042E5E0    xor         edx,edx
 0042E5E2    mov         dword ptr [ebp-10],edx
 0042E5E5    mov         ebx,eax
 0042E5E7    xor         eax,eax
 0042E5E9    push        ebp
 0042E5EA    push        42E76A
 0042E5EF    push        dword ptr fs:[eax]
 0042E5F2    mov         dword ptr fs:[eax],esp
 0042E5F5    mov         esi,dword ptr [ebx+10]
 0042E5F8    cmp         dword ptr [esi+8],1
>0042E5FC    jne         0042E62E
 0042E5FE    mov         eax,esi
 0042E600    xor         edx,edx
 0042E602    call        TClassList.GetItems
 0042E607    mov         eax,dword ptr [eax+4]
 0042E60A    mov         edx,dword ptr [eax]
 0042E60C    call        dword ptr [edx+18]
 0042E60F    test        al,al
>0042E611    je          0042E754
 0042E617    mov         eax,dword ptr [ebx+10]
 0042E61A    xor         edx,edx
 0042E61C    call        TClassList.GetItems
 0042E621    mov         eax,dword ptr [eax+4]
 0042E624    mov         edx,dword ptr [eax]
 0042E626    call        dword ptr [edx+1C]
>0042E629    jmp         0042E754
 0042E62E    cmp         dword ptr [ebx+0C],0
>0042E632    je          0042E70C
 0042E638    mov         dl,1
 0042E63A    mov         eax,[00418350];TStringList
 0042E63F    call        TObject.Create
 0042E644    mov         dword ptr [ebp-4],eax
 0042E647    xor         eax,eax
 0042E649    push        ebp
 0042E64A    push        42E705
 0042E64F    push        dword ptr fs:[eax]
 0042E652    mov         dword ptr fs:[eax],esp
 0042E655    mov         eax,dword ptr [ebx+10]
 0042E658    mov         eax,dword ptr [eax+8]
 0042E65B    dec         eax
 0042E65C    test        eax,eax
>0042E65E    jl          0042E6A4
 0042E660    inc         eax
 0042E661    mov         dword ptr [ebp-0C],eax
 0042E664    mov         dword ptr [ebp-8],0
 0042E66B    mov         eax,dword ptr [ebx+10]
 0042E66E    mov         edx,dword ptr [ebp-8]
 0042E671    call        TClassList.GetItems
 0042E676    mov         esi,eax
 0042E678    mov         eax,dword ptr [esi+4]
 0042E67B    mov         edx,dword ptr [eax]
 0042E67D    call        dword ptr [edx+18]
 0042E680    test        al,al
>0042E682    je          0042E69C
 0042E684    lea         edx,[ebp-10]
 0042E687    mov         eax,dword ptr [esi+4]
 0042E68A    mov         ecx,dword ptr [eax]
 0042E68C    call        dword ptr [ecx+0C]
 0042E68F    mov         edx,dword ptr [ebp-10]
 0042E692    mov         ecx,esi
 0042E694    mov         eax,dword ptr [ebp-4]
 0042E697    mov         esi,dword ptr [eax]
 0042E699    call        dword ptr [esi+3C]
 0042E69C    inc         dword ptr [ebp-8]
 0042E69F    dec         dword ptr [ebp-0C]
>0042E6A2    jne         0042E66B
 0042E6A4    mov         eax,dword ptr [ebp-4]
 0042E6A7    mov         edx,dword ptr [eax]
 0042E6A9    call        dword ptr [edx+14]
 0042E6AC    dec         eax
>0042E6AD    jle         0042E6DD
 0042E6AF    mov         eax,dword ptr [ebp-4]
 0042E6B2    mov         edx,dword ptr [eax]
 0042E6B4    call        dword ptr [edx+90]
 0042E6BA    mov         eax,dword ptr [ebx+0C]
 0042E6BD    mov         edx,dword ptr [ebp-4]
 0042E6C0    mov         ecx,dword ptr [eax]
 0042E6C2    call        dword ptr [ecx+10]
 0042E6C5    mov         dword ptr [ebp-8],eax
 0042E6C8    mov         edx,dword ptr [ebp-8]
 0042E6CB    mov         eax,dword ptr [ebp-4]
 0042E6CE    mov         ecx,dword ptr [eax]
 0042E6D0    call        dword ptr [ecx+18]
 0042E6D3    mov         eax,dword ptr [eax+4]
 0042E6D6    mov         edx,dword ptr [eax]
 0042E6D8    call        dword ptr [edx+1C]
>0042E6DB    jmp         0042E6EF
 0042E6DD    xor         edx,edx
 0042E6DF    mov         eax,dword ptr [ebp-4]
 0042E6E2    mov         ecx,dword ptr [eax]
 0042E6E4    call        dword ptr [ecx+18]
 0042E6E7    mov         eax,dword ptr [eax+4]
 0042E6EA    mov         edx,dword ptr [eax]
 0042E6EC    call        dword ptr [edx+1C]
 0042E6EF    xor         eax,eax
 0042E6F1    pop         edx
 0042E6F2    pop         ecx
 0042E6F3    pop         ecx
 0042E6F4    mov         dword ptr fs:[eax],edx
 0042E6F7    push        42E754
 0042E6FC    mov         eax,dword ptr [ebp-4]
 0042E6FF    call        TObject.Free
 0042E704    ret
>0042E705    jmp         @HandleFinally
>0042E70A    jmp         0042E6FC
 0042E70C    mov         esi,dword ptr [ebx+10]
 0042E70F    cmp         dword ptr [esi+8],0
>0042E713    jle         0042E73E
 0042E715    mov         eax,esi
 0042E717    xor         edx,edx
 0042E719    call        TClassList.GetItems
 0042E71E    mov         eax,dword ptr [eax+4]
 0042E721    mov         edx,dword ptr [eax]
 0042E723    call        dword ptr [edx+18]
 0042E726    test        al,al
>0042E728    je          0042E73E
 0042E72A    mov         eax,dword ptr [ebx+10]
 0042E72D    xor         edx,edx
 0042E72F    call        TClassList.GetItems
 0042E734    mov         eax,dword ptr [eax+4]
 0042E737    mov         edx,dword ptr [eax]
 0042E739    call        dword ptr [edx+1C]
>0042E73C    jmp         0042E754
 0042E73E    mov         ecx,42E29C;^gvar_005AF664
 0042E743    mov         dl,1
 0042E745    mov         eax,[0042E054];EHelpSystemException
 0042E74A    call        Exception.CreateRes
 0042E74F    call        @RaiseExcept
 0042E754    xor         eax,eax
 0042E756    pop         edx
 0042E757    pop         ecx
 0042E758    pop         ecx
 0042E759    mov         dword ptr fs:[eax],edx
 0042E75C    push        42E771
 0042E761    lea         eax,[ebp-10]
 0042E764    call        @LStrClr
 0042E769    ret
>0042E76A    jmp         @HandleFinally
>0042E76F    jmp         0042E761
 0042E771    pop         esi
 0042E772    pop         ebx
 0042E773    mov         esp,ebp
 0042E775    pop         ebp
 0042E776    ret
*}
end;

//0042E778
function THelpManager.CallSpecialWinHelp(Handle:Longint; const HelpFile:AnsiString; Command:Word; Data:Longint):Boolean;
begin
{*
 0042E778    push        ebp
 0042E779    mov         ebp,esp
 0042E77B    push        0
 0042E77D    push        0
 0042E77F    push        0
 0042E781    push        0
 0042E783    push        ebx
 0042E784    push        esi
 0042E785    push        edi
 0042E786    mov         esi,ecx
 0042E788    mov         dword ptr [ebp-4],edx
 0042E78B    mov         edi,eax
 0042E78D    xor         eax,eax
 0042E78F    push        ebp
 0042E790    push        42E85D
 0042E795    push        dword ptr fs:[eax]
 0042E798    mov         dword ptr fs:[eax],esp
 0042E79B    xor         ebx,ebx
 0042E79D    test        esi,esi
>0042E79F    je          0042E7AB
 0042E7A1    lea         eax,[edi+24]
 0042E7A4    mov         edx,esi
 0042E7A6    call        @LStrAsg
 0042E7AB    mov         eax,dword ptr [edi+18]
 0042E7AE    mov         eax,dword ptr [eax+8]
 0042E7B1    test        eax,eax
>0042E7B3    jle         0042E834
 0042E7B5    dec         eax
>0042E7B6    jne         0042E7F7
 0042E7B8    xor         edx,edx
 0042E7BA    mov         eax,dword ptr [edi+18]
 0042E7BD    call        TClassList.GetItems
 0042E7C2    mov         edx,dword ptr [eax+4]
 0042E7C5    lea         eax,[ebp-8]
 0042E7C8    call        @IntfCopy
 0042E7CD    mov         ax,word ptr [ebp+0C]
 0042E7D1    push        eax
 0042E7D2    mov         eax,dword ptr [ebp+8]
 0042E7D5    push        eax
 0042E7D6    lea         eax,[ebp-0C]
 0042E7D9    mov         edx,dword ptr [ebp-8]
 0042E7DC    mov         ecx,42E870
 0042E7E1    call        @IntfCast
 0042E7E6    mov         eax,dword ptr [ebp-0C]
 0042E7E9    mov         ecx,esi
 0042E7EB    mov         edx,dword ptr [ebp-4]
 0042E7EE    mov         ebx,dword ptr [eax]
 0042E7F0    call        dword ptr [ebx+40]
 0042E7F3    mov         ebx,eax
>0042E7F5    jmp         0042E834
 0042E7F7    xor         edx,edx
 0042E7F9    mov         eax,dword ptr [edi+18]
 0042E7FC    call        TClassList.GetItems
 0042E801    mov         edx,dword ptr [eax+4]
 0042E804    lea         eax,[ebp-8]
 0042E807    call        @IntfCopy
 0042E80C    mov         ax,word ptr [ebp+0C]
 0042E810    push        eax
 0042E811    mov         eax,dword ptr [ebp+8]
 0042E814    push        eax
 0042E815    lea         eax,[ebp-10]
 0042E818    mov         edx,dword ptr [ebp-8]
 0042E81B    mov         ecx,42E870
 0042E820    call        @IntfCast
 0042E825    mov         eax,dword ptr [ebp-10]
 0042E828    mov         ecx,esi
 0042E82A    mov         edx,dword ptr [ebp-4]
 0042E82D    mov         ebx,dword ptr [eax]
 0042E82F    call        dword ptr [ebx+40]
 0042E832    mov         ebx,eax
 0042E834    xor         eax,eax
 0042E836    pop         edx
 0042E837    pop         ecx
 0042E838    pop         ecx
 0042E839    mov         dword ptr fs:[eax],edx
 0042E83C    push        42E864
 0042E841    lea         eax,[ebp-10]
 0042E844    mov         edx,dword ptr ds:[42DFDC];ISpecialWinHelpViewer
 0042E84A    mov         ecx,2
 0042E84F    call        @FinalizeArray
 0042E854    lea         eax,[ebp-8]
 0042E857    call        @IntfClear
 0042E85C    ret
>0042E85D    jmp         @HandleFinally
>0042E862    jmp         0042E841
 0042E864    mov         eax,ebx
 0042E866    pop         edi
 0042E867    pop         esi
 0042E868    pop         ebx
 0042E869    mov         esp,ebp
 0042E86B    pop         ebp
 0042E86C    ret         8
*}
end;

//0042E880
{*procedure sub_0042E880(?:?; ?:?; ?:?);
begin
 0042E880    push        ebp
 0042E881    mov         ebp,esp
 0042E883    add         esp,0FFFFFFD0
 0042E886    push        ebx
 0042E887    push        esi
 0042E888    push        edi
 0042E889    xor         ebx,ebx
 0042E88B    mov         dword ptr [ebp-30],ebx
 0042E88E    mov         dword ptr [ebp-20],ebx
 0042E891    mov         ebx,ecx
 0042E893    mov         dword ptr [ebp-8],edx
 0042E896    mov         dword ptr [ebp-4],eax
 0042E899    xor         eax,eax
 0042E89B    push        ebp
 0042E89C    push        42EA85
 0042E8A1    push        dword ptr fs:[eax]
 0042E8A4    mov         dword ptr fs:[eax],esp
 0042E8A7    xor         eax,eax
 0042E8A9    mov         dword ptr [ebp-10],eax
 0042E8AC    xor         edi,edi
 0042E8AE    test        ebx,ebx
>0042E8B0    je          0042E8BF
 0042E8B2    mov         eax,dword ptr [ebp-4]
 0042E8B5    add         eax,24
 0042E8B8    mov         edx,ebx
 0042E8BA    call        @LStrAsg
 0042E8BF    mov         eax,dword ptr [ebp-4]
 0042E8C2    mov         eax,dword ptr [eax+10]
 0042E8C5    mov         eax,dword ptr [eax+8]
 0042E8C8    test        eax,eax
>0042E8CA    jle         0042EA67
 0042E8D0    mov         ebx,eax
 0042E8D2    dec         ebx
 0042E8D3    test        ebx,ebx
>0042E8D5    jl          0042E8FE
 0042E8D7    inc         ebx
 0042E8D8    xor         esi,esi
 0042E8DA    mov         eax,dword ptr [ebp-4]
 0042E8DD    mov         eax,dword ptr [eax+10]
 0042E8E0    mov         edx,esi
 0042E8E2    call        TClassList.GetItems
 0042E8E7    mov         eax,dword ptr [eax+4]
 0042E8EA    mov         edx,dword ptr [ebp-8]
 0042E8ED    mov         ecx,dword ptr [eax]
 0042E8EF    call        dword ptr [ecx+10]
 0042E8F2    test        eax,eax
>0042E8F4    jle         0042E8FA
 0042E8F6    mov         dword ptr [ebp-10],esi
 0042E8F9    inc         edi
 0042E8FA    inc         esi
 0042E8FB    dec         ebx
>0042E8FC    jne         0042E8DA
 0042E8FE    test        edi,edi
>0042E900    jne         0042E92D
 0042E902    mov         eax,dword ptr [ebp-8]
 0042E905    call        @LStrToPChar
 0042E90A    mov         dword ptr [ebp-2C],eax
 0042E90D    mov         byte ptr [ebp-28],6
 0042E911    lea         eax,[ebp-2C]
 0042E914    push        eax
 0042E915    push        0
 0042E917    mov         ecx,42E2A4;^gvar_005AF664
 0042E91C    mov         dl,1
 0042E91E    mov         eax,[0042E054];EHelpSystemException
 0042E923    call        Exception.CreateResFmt;EHelpSystemException.Create
 0042E928    call        @RaiseExcept
 0042E92D    cmp         edi,1
>0042E930    jne         0042E94B
 0042E932    mov         eax,dword ptr [ebp-4]
 0042E935    mov         eax,dword ptr [eax+10]
 0042E938    mov         edx,dword ptr [ebp-10]
 0042E93B    call        TClassList.GetItems
 0042E940    mov         eax,dword ptr [eax+4]
 0042E943    mov         edx,dword ptr [ebp-8]
 0042E946    mov         ecx,dword ptr [eax]
 0042E948    call        dword ptr [ecx+20]
 0042E94B    dec         edi
>0042E94C    jle         0042EA67
 0042E952    mov         dl,1
 0042E954    mov         eax,[00418350];TStringList
 0042E959    call        TObject.Create;TStringList.Create
 0042E95E    mov         dword ptr [ebp-14],eax
 0042E961    mov         eax,dword ptr [ebp-4]
 0042E964    mov         eax,dword ptr [eax+10]
 0042E967    mov         ebx,dword ptr [eax+8]
 0042E96A    dec         ebx
 0042E96B    test        ebx,ebx
>0042E96D    jl          0042E9ED
 0042E96F    inc         ebx
 0042E970    xor         esi,esi
 0042E972    mov         eax,dword ptr [ebp-4]
 0042E975    mov         eax,dword ptr [eax+10]
 0042E978    mov         edx,esi
 0042E97A    call        TClassList.GetItems
 0042E97F    mov         dword ptr [ebp-1C],eax
 0042E982    mov         eax,dword ptr [ebp-1C]
 0042E985    mov         eax,dword ptr [eax+4]
 0042E988    mov         edx,dword ptr [ebp-8]
 0042E98B    mov         ecx,dword ptr [eax]
 0042E98D    call        dword ptr [ecx+10]
 0042E990    test        eax,eax
>0042E992    jle         0042E9E9
 0042E994    mov         eax,dword ptr [ebp-1C]
 0042E997    mov         eax,dword ptr [eax+4]
 0042E99A    mov         edx,dword ptr [ebp-8]
 0042E99D    mov         ecx,dword ptr [eax]
 0042E99F    call        dword ptr [ecx+14]
 0042E9A2    mov         dword ptr [ebp-18],eax
 0042E9A5    mov         eax,dword ptr [ebp-18]
 0042E9A8    mov         edx,dword ptr [eax]
 0042E9AA    call        dword ptr [edx+14]
 0042E9AD    dec         eax
 0042E9AE    test        eax,eax
>0042E9B0    jl          0042E9E1
 0042E9B2    inc         eax
 0042E9B3    mov         dword ptr [ebp-24],eax
 0042E9B6    mov         dword ptr [ebp-0C],0
 0042E9BD    lea         ecx,[ebp-30]
 0042E9C0    mov         edx,dword ptr [ebp-0C]
 0042E9C3    mov         eax,dword ptr [ebp-18]
 0042E9C6    mov         edi,dword ptr [eax]
 0042E9C8    call        dword ptr [edi+0C]
 0042E9CB    mov         edx,dword ptr [ebp-30]
 0042E9CE    mov         ecx,dword ptr [ebp-1C]
 0042E9D1    mov         eax,dword ptr [ebp-14]
 0042E9D4    mov         edi,dword ptr [eax]
 0042E9D6    call        dword ptr [edi+3C];TStringList.AddObject
 0042E9D9    inc         dword ptr [ebp-0C]
 0042E9DC    dec         dword ptr [ebp-24]
>0042E9DF    jne         0042E9BD
 0042E9E1    mov         eax,dword ptr [ebp-18]
 0042E9E4    call        TObject.Free
 0042E9E9    inc         esi
 0042E9EA    dec         ebx
>0042E9EB    jne         0042E972
 0042E9ED    mov         eax,dword ptr [ebp-4]
 0042E9F0    cmp         dword ptr [eax+0C],0
>0042E9F4    je          0042EA3B
 0042E9F6    mov         eax,dword ptr [ebp-14]
 0042E9F9    mov         edx,dword ptr [eax]
 0042E9FB    call        dword ptr [edx+90];TStringList.Sort
 0042EA01    mov         eax,dword ptr [ebp-4]
 0042EA04    mov         eax,dword ptr [eax+0C]
 0042EA07    mov         edx,dword ptr [ebp-14]
 0042EA0A    mov         ecx,dword ptr [eax]
 0042EA0C    call        dword ptr [ecx+0C]
 0042EA0F    mov         ebx,eax
 0042EA11    test        ebx,ebx
>0042EA13    jl          0042EA5F
 0042EA15    mov         edx,ebx
 0042EA17    mov         eax,dword ptr [ebp-14]
 0042EA1A    mov         ecx,dword ptr [eax]
 0042EA1C    call        dword ptr [ecx+18];TStringList.GetObject
 0042EA1F    mov         esi,eax
 0042EA21    lea         ecx,[ebp-20]
 0042EA24    mov         edx,ebx
 0042EA26    mov         eax,dword ptr [ebp-14]
 0042EA29    mov         ebx,dword ptr [eax]
 0042EA2B    call        dword ptr [ebx+0C];TStringList.Get
 0042EA2E    mov         eax,dword ptr [esi+4]
 0042EA31    mov         edx,dword ptr [ebp-20]
 0042EA34    mov         ecx,dword ptr [eax]
 0042EA36    call        dword ptr [ecx+20]
>0042EA39    jmp         0042EA5F
 0042EA3B    xor         edx,edx
 0042EA3D    mov         eax,dword ptr [ebp-14]
 0042EA40    mov         ecx,dword ptr [eax]
 0042EA42    call        dword ptr [ecx+18];TStringList.GetObject
 0042EA45    mov         esi,eax
 0042EA47    lea         ecx,[ebp-20]
 0042EA4A    xor         edx,edx
 0042EA4C    mov         eax,dword ptr [ebp-14]
 0042EA4F    mov         ebx,dword ptr [eax]
 0042EA51    call        dword ptr [ebx+0C];TStringList.Get
 0042EA54    mov         eax,dword ptr [esi+4]
 0042EA57    mov         edx,dword ptr [ebp-20]
 0042EA5A    mov         ecx,dword ptr [eax]
 0042EA5C    call        dword ptr [ecx+20]
 0042EA5F    mov         eax,dword ptr [ebp-14]
 0042EA62    call        TObject.Free
 0042EA67    xor         eax,eax
 0042EA69    pop         edx
 0042EA6A    pop         ecx
 0042EA6B    pop         ecx
 0042EA6C    mov         dword ptr fs:[eax],edx
 0042EA6F    push        42EA8C
 0042EA74    lea         eax,[ebp-30]
 0042EA77    call        @LStrClr
 0042EA7C    lea         eax,[ebp-20]
 0042EA7F    call        @LStrClr
 0042EA84    ret
>0042EA85    jmp         @HandleFinally
>0042EA8A    jmp         0042EA74
 0042EA8C    pop         edi
 0042EA8D    pop         esi
 0042EA8E    pop         ebx
 0042EA8F    mov         esp,ebp
 0042EA91    pop         ebp
 0042EA92    ret
end;*}

//0042EA94
procedure THelpManager.ShowContextHelp(const ContextID:Longint; const HelpFileName:AnsiString);
begin
{*
 0042EA94    push        ebp
 0042EA95    mov         ebp,esp
 0042EA97    add         esp,0FFFFFFE8
 0042EA9A    push        ebx
 0042EA9B    push        esi
 0042EA9C    push        edi
 0042EA9D    xor         ebx,ebx
 0042EA9F    mov         dword ptr [ebp-18],ebx
 0042EAA2    mov         dword ptr [ebp-14],ebx
 0042EAA5    mov         dword ptr [ebp-10],ebx
 0042EAA8    mov         dword ptr [ebp-8],ecx
 0042EAAB    mov         dword ptr [ebp-4],edx
 0042EAAE    mov         esi,eax
 0042EAB0    xor         eax,eax
 0042EAB2    push        ebp
 0042EAB3    push        42EB87
 0042EAB8    push        dword ptr fs:[eax]
 0042EABB    mov         dword ptr fs:[eax],esp
 0042EABE    cmp         dword ptr [ebp-8],0
>0042EAC2    je          0042EACF
 0042EAC4    lea         eax,[esi+24]
 0042EAC7    mov         edx,dword ptr [ebp-8]
 0042EACA    call        @LStrAsg
 0042EACF    mov         eax,dword ptr [esi+14]
 0042EAD2    mov         eax,dword ptr [eax+8]
 0042EAD5    test        eax,eax
>0042EAD7    jne         0042EAF1
 0042EAD9    mov         ecx,42E2AC;^gvar_005AF664
 0042EADE    mov         dl,1
 0042EAE0    mov         eax,[0042E054];EHelpSystemException
 0042EAE5    call        Exception.CreateRes
 0042EAEA    call        @RaiseExcept
>0042EAEF    jmp         0042EB5E
 0042EAF1    mov         ebx,eax
 0042EAF3    dec         ebx
 0042EAF4    test        ebx,ebx
>0042EAF6    jl          0042EB5E
 0042EAF8    inc         ebx
 0042EAF9    mov         dword ptr [ebp-0C],0
 0042EB00    mov         edx,dword ptr [ebp-0C]
 0042EB03    mov         eax,dword ptr [esi+14]
 0042EB06    call        TClassList.GetItems
 0042EB0B    mov         edx,dword ptr [eax+4]
 0042EB0E    lea         eax,[ebp-10]
 0042EB11    call        @IntfCopy
 0042EB16    lea         eax,[ebp-14]
 0042EB19    mov         edx,dword ptr [ebp-10]
 0042EB1C    mov         ecx,42EB98
 0042EB21    call        @IntfCast
 0042EB26    mov         eax,dword ptr [ebp-14]
 0042EB29    mov         ecx,dword ptr [ebp-8]
 0042EB2C    mov         edx,dword ptr [ebp-4]
 0042EB2F    mov         edi,dword ptr [eax]
 0042EB31    call        dword ptr [edi+38]
 0042EB34    test        al,al
>0042EB36    je          0042EB58
 0042EB38    lea         eax,[ebp-18]
 0042EB3B    mov         edx,dword ptr [ebp-10]
 0042EB3E    mov         ecx,42EB98
 0042EB43    call        @IntfCast
 0042EB48    mov         eax,dword ptr [ebp-18]
 0042EB4B    mov         ecx,dword ptr [ebp-8]
 0042EB4E    mov         edx,dword ptr [ebp-4]
 0042EB51    mov         ebx,dword ptr [eax]
 0042EB53    call        dword ptr [ebx+3C]
>0042EB56    jmp         0042EB5E
 0042EB58    inc         dword ptr [ebp-0C]
 0042EB5B    dec         ebx
>0042EB5C    jne         0042EB00
 0042EB5E    xor         eax,eax
 0042EB60    pop         edx
 0042EB61    pop         ecx
 0042EB62    pop         ecx
 0042EB63    mov         dword ptr fs:[eax],edx
 0042EB66    push        42EB8E
 0042EB6B    lea         eax,[ebp-18]
 0042EB6E    mov         edx,dword ptr ds:[42DFA0];IExtendedHelpViewer
 0042EB74    mov         ecx,2
 0042EB79    call        @FinalizeArray
 0042EB7E    lea         eax,[ebp-10]
 0042EB81    call        @IntfClear
 0042EB86    ret
>0042EB87    jmp         @HandleFinally
>0042EB8C    jmp         0042EB6B
 0042EB8E    pop         edi
 0042EB8F    pop         esi
 0042EB90    pop         ebx
 0042EB91    mov         esp,ebp
 0042EB93    pop         ebp
 0042EB94    ret
*}
end;

//0042EBA8
procedure sub_0042EBA8;
begin
{*
 0042EBA8    call        THelpManager.DoTableOfContents
 0042EBAD    ret
*}
end;

//0042EBB0
{*procedure sub_0042EBB0(?:?; ?:?; ?:?);
begin
 0042EBB0    push        ebp
 0042EBB1    mov         ebp,esp
 0042EBB3    push        0
 0042EBB5    push        0
 0042EBB7    push        0
 0042EBB9    push        0
 0042EBBB    push        ebx
 0042EBBC    push        esi
 0042EBBD    push        edi
 0042EBBE    mov         ebx,ecx
 0042EBC0    mov         dword ptr [ebp-4],edx
 0042EBC3    mov         esi,eax
 0042EBC5    xor         eax,eax
 0042EBC7    push        ebp
 0042EBC8    push        42EC8B
 0042EBCD    push        dword ptr fs:[eax]
 0042EBD0    mov         dword ptr fs:[eax],esp
 0042EBD3    test        ebx,ebx
>0042EBD5    je          0042EBE1
 0042EBD7    lea         eax,[esi+24]
 0042EBDA    mov         edx,ebx
 0042EBDC    call        @LStrAsg
 0042EBE1    mov         eax,dword ptr [esi+14]
 0042EBE4    mov         eax,dword ptr [eax+8]
 0042EBE7    test        eax,eax
>0042EBE9    jne         0042EC03
 0042EBEB    mov         ecx,42E2B4;^gvar_005AF664
 0042EBF0    mov         dl,1
 0042EBF2    mov         eax,[0042E054];EHelpSystemException
 0042EBF7    call        Exception.CreateRes;EHelpSystemException.Create
 0042EBFC    call        @RaiseExcept
>0042EC01    jmp         0042EC62
 0042EC03    mov         ebx,eax
 0042EC05    dec         ebx
 0042EC06    test        ebx,ebx
>0042EC08    jl          0042EC62
 0042EC0A    inc         ebx
 0042EC0B    xor         edi,edi
 0042EC0D    mov         edx,edi
 0042EC0F    mov         eax,dword ptr [esi+14]
 0042EC12    call        TClassList.GetItems
 0042EC17    mov         edx,dword ptr [eax+4]
 0042EC1A    lea         eax,[ebp-8]
 0042EC1D    call        @IntfCopy
 0042EC22    lea         eax,[ebp-0C]
 0042EC25    mov         edx,dword ptr [ebp-8]
 0042EC28    mov         ecx,42EC9C;['{B0FC9366-5F0E-11D3-A3B9-00C04F79AD3A}']
 0042EC2D    call        @IntfCast
 0042EC32    mov         eax,dword ptr [ebp-0C]
 0042EC35    mov         edx,dword ptr [ebp-4]
 0042EC38    mov         ecx,dword ptr [eax]
 0042EC3A    call        dword ptr [ecx+30]
 0042EC3D    test        al,al
>0042EC3F    je          0042EC5E
 0042EC41    lea         eax,[ebp-10]
 0042EC44    mov         edx,dword ptr [ebp-8]
 0042EC47    mov         ecx,42EC9C;['{B0FC9366-5F0E-11D3-A3B9-00C04F79AD3A}']
 0042EC4C    call        @IntfCast
 0042EC51    mov         eax,dword ptr [ebp-10]
 0042EC54    mov         edx,dword ptr [ebp-4]
 0042EC57    mov         ecx,dword ptr [eax]
 0042EC59    call        dword ptr [ecx+34]
>0042EC5C    jmp         0042EC62
 0042EC5E    inc         edi
 0042EC5F    dec         ebx
>0042EC60    jne         0042EC0D
 0042EC62    xor         eax,eax
 0042EC64    pop         edx
 0042EC65    pop         ecx
 0042EC66    pop         ecx
 0042EC67    mov         dword ptr fs:[eax],edx
 0042EC6A    push        42EC92
 0042EC6F    lea         eax,[ebp-10]
 0042EC72    mov         edx,dword ptr ds:[42DFA0];IExtendedHelpViewer
 0042EC78    mov         ecx,2
 0042EC7D    call        @FinalizeArray
 0042EC82    lea         eax,[ebp-8]
 0042EC85    call        @IntfClear
 0042EC8A    ret
>0042EC8B    jmp         @HandleFinally
>0042EC90    jmp         0042EC6F
 0042EC92    pop         edi
 0042EC93    pop         esi
 0042EC94    pop         ebx
 0042EC95    mov         esp,ebp
 0042EC97    pop         ebp
 0042EC98    ret
end;*}

//0042ECAC
procedure THelpManager.AssignHelpSelector(Selector:IHelpSelector);
begin
{*
 0042ECAC    push        ebp
 0042ECAD    mov         ebp,esp
 0042ECAF    push        ecx
 0042ECB0    push        ebx
 0042ECB1    mov         dword ptr [ebp-4],edx
 0042ECB4    mov         ebx,eax
 0042ECB6    mov         eax,dword ptr [ebp-4]
 0042ECB9    call        @IntfAddRef
 0042ECBE    xor         eax,eax
 0042ECC0    push        ebp
 0042ECC1    push        42ECFB
 0042ECC6    push        dword ptr fs:[eax]
 0042ECC9    mov         dword ptr fs:[eax],esp
 0042ECCC    cmp         dword ptr [ebx+0C],0
>0042ECD0    je          0042ECDA
 0042ECD2    lea         eax,[ebx+0C]
 0042ECD5    call        @IntfClear
 0042ECDA    lea         eax,[ebx+0C]
 0042ECDD    mov         edx,dword ptr [ebp-4]
 0042ECE0    call        @IntfCopy
 0042ECE5    xor         eax,eax
 0042ECE7    pop         edx
 0042ECE8    pop         ecx
 0042ECE9    pop         ecx
 0042ECEA    mov         dword ptr fs:[eax],edx
 0042ECED    push        42ED02
 0042ECF2    lea         eax,[ebp-4]
 0042ECF5    call        @IntfClear
 0042ECFA    ret
>0042ECFB    jmp         @HandleFinally
>0042ED00    jmp         0042ECF2
 0042ED02    pop         ebx
 0042ED03    pop         ecx
 0042ED04    pop         ebp
 0042ED05    ret
*}
end;

//0042ED08
function THelpManager.Hook(Handle:Longint; HelpFile:AnsiString; Command:Word; Data:Longint):Boolean;
begin
{*
 0042ED08    push        ebp
 0042ED09    mov         ebp,esp
 0042ED0B    push        ecx
 0042ED0C    push        ebx
 0042ED0D    push        esi
 0042ED0E    push        edi
 0042ED0F    mov         dword ptr [ebp-4],ecx
 0042ED12    mov         edi,edx
 0042ED14    mov         ebx,eax
 0042ED16    mov         esi,dword ptr [ebp+0C]
 0042ED19    mov         eax,dword ptr [ebp-4]
 0042ED1C    call        @LStrAddRef
 0042ED21    xor         eax,eax
 0042ED23    push        ebp
 0042ED24    push        42ED9D
 0042ED29    push        dword ptr fs:[eax]
 0042ED2C    mov         dword ptr fs:[eax],esp
 0042ED2F    cmp         dword ptr [ebp-4],0
>0042ED33    je          0042ED40
 0042ED35    lea         eax,[ebx+24]
 0042ED38    mov         edx,dword ptr [ebp-4]
 0042ED3B    call        @LStrAsg
 0042ED40    mov         eax,esi
 0042ED42    dec         ax
>0042ED45    je          0042ED53
 0042ED47    dec         ax
>0042ED4A    je          0042ED62
 0042ED4C    dec         ax
>0042ED4F    je          0042ED6B
>0042ED51    jmp         0042ED74
 0042ED53    mov         ecx,dword ptr [ebp-4]
 0042ED56    mov         edx,dword ptr [ebp+8]
 0042ED59    mov         eax,ebx
 0042ED5B    call        THelpManager.ShowContextHelp
>0042ED60    jmp         0042ED85
 0042ED62    mov         eax,ebx
 0042ED64    call        THelpManager.DoSoftShutDown
>0042ED69    jmp         0042ED85
 0042ED6B    mov         eax,ebx
 0042ED6D    call        THelpManager.DoTableOfContents
>0042ED72    jmp         0042ED85
 0042ED74    push        esi
 0042ED75    mov         eax,dword ptr [ebp+8]
 0042ED78    push        eax
 0042ED79    mov         ecx,dword ptr [ebp-4]
 0042ED7C    mov         edx,edi
 0042ED7E    mov         eax,ebx
 0042ED80    call        THelpManager.CallSpecialWinHelp
 0042ED85    mov         bl,1
 0042ED87    xor         eax,eax
 0042ED89    pop         edx
 0042ED8A    pop         ecx
 0042ED8B    pop         ecx
 0042ED8C    mov         dword ptr fs:[eax],edx
 0042ED8F    push        42EDA4
 0042ED94    lea         eax,[ebp-4]
 0042ED97    call        @LStrClr
 0042ED9C    ret
>0042ED9D    jmp         @HandleFinally
>0042EDA2    jmp         0042ED94
 0042EDA4    mov         eax,ebx
 0042EDA6    pop         edi
 0042EDA7    pop         esi
 0042EDA8    pop         ebx
 0042EDA9    pop         ecx
 0042EDAA    pop         ebp
 0042EDAB    ret         8
*}
end;

//0042EDB0
{*function sub_0042EDB0(?:?):?;
begin
 0042EDB0    mov         eax,dword ptr [eax+20]
 0042EDB3    ret
end;*}

//0042EDB4
function THelpManager.GetHelpFile:AnsiString;
begin
{*
 0042EDB4    push        ebx
 0042EDB5    push        esi
 0042EDB6    mov         esi,edx
 0042EDB8    mov         ebx,eax
 0042EDBA    mov         eax,esi
 0042EDBC    mov         edx,dword ptr [ebx+24]
 0042EDBF    call        @LStrAsg
 0042EDC4    pop         esi
 0042EDC5    pop         ebx
 0042EDC6    ret
*}
end;

//0042EDC8
{*procedure sub_0042EDC8(?:?; ?:?);
begin
 0042EDC8    push        ebx
 0042EDC9    push        esi
 0042EDCA    push        edi
 0042EDCB    mov         edi,edx
 0042EDCD    mov         esi,eax
 0042EDCF    mov         eax,dword ptr [esi+10]
 0042EDD2    mov         ebx,dword ptr [eax+8]
 0042EDD5    dec         ebx
 0042EDD6    cmp         ebx,0
>0042EDD9    jl          0042EDFA
 0042EDDB    mov         edx,ebx
 0042EDDD    mov         eax,dword ptr [esi+10]
 0042EDE0    call        TClassList.GetItems
 0042EDE5    cmp         edi,dword ptr [eax+8]
>0042EDE8    jne         0042EDF4
 0042EDEA    mov         edx,ebx
 0042EDEC    mov         eax,dword ptr [esi+10]
 0042EDEF    call        TList.Delete
 0042EDF4    dec         ebx
 0042EDF5    cmp         ebx,0FFFFFFFF
>0042EDF8    jne         0042EDDB
 0042EDFA    mov         eax,dword ptr [esi+14]
 0042EDFD    mov         ebx,dword ptr [eax+8]
 0042EE00    dec         ebx
 0042EE01    cmp         ebx,0
>0042EE04    jl          0042EE25
 0042EE06    mov         edx,ebx
 0042EE08    mov         eax,dword ptr [esi+14]
 0042EE0B    call        TClassList.GetItems
 0042EE10    cmp         edi,dword ptr [eax+8]
>0042EE13    jne         0042EE1F
 0042EE15    mov         edx,ebx
 0042EE17    mov         eax,dword ptr [esi+14]
 0042EE1A    call        TList.Delete
 0042EE1F    dec         ebx
 0042EE20    cmp         ebx,0FFFFFFFF
>0042EE23    jne         0042EE06
 0042EE25    mov         eax,dword ptr [esi+18]
 0042EE28    mov         ebx,dword ptr [eax+8]
 0042EE2B    dec         ebx
 0042EE2C    cmp         ebx,0
>0042EE2F    jl          0042EE50
 0042EE31    mov         edx,ebx
 0042EE33    mov         eax,dword ptr [esi+18]
 0042EE36    call        TClassList.GetItems
 0042EE3B    cmp         edi,dword ptr [eax+8]
>0042EE3E    jne         0042EE4A
 0042EE40    mov         edx,ebx
 0042EE42    mov         eax,dword ptr [esi+18]
 0042EE45    call        TList.Delete
 0042EE4A    dec         ebx
 0042EE4B    cmp         ebx,0FFFFFFFF
>0042EE4E    jne         0042EE31
 0042EE50    pop         edi
 0042EE51    pop         esi
 0042EE52    pop         ebx
 0042EE53    ret
end;*}

//0042EE54
destructor THelpManager.Destroy;
begin
{*
 0042EE54    push        ebx
 0042EE55    push        esi
 0042EE56    call        @BeforeDestruction
 0042EE5B    mov         ebx,edx
 0042EE5D    mov         esi,eax
 0042EE5F    mov         eax,esi
 0042EE61    call        THelpManager.UnloadAllViewers
 0042EE66    cmp         dword ptr [esi+0C],0
>0042EE6A    je          0042EE74
 0042EE6C    lea         eax,[esi+0C]
 0042EE6F    call        @IntfClear
 0042EE74    mov         eax,dword ptr [esi+18]
 0042EE77    call        TObject.Free
 0042EE7C    mov         eax,dword ptr [esi+14]
 0042EE7F    call        TObject.Free
 0042EE84    mov         eax,dword ptr [esi+10]
 0042EE87    call        TObject.Free
 0042EE8C    mov         edx,ebx
 0042EE8E    and         dl,0FC
 0042EE91    mov         eax,esi
 0042EE93    call        TObject.Destroy
 0042EE98    test        bl,bl
>0042EE9A    jle         0042EEA3
 0042EE9C    mov         eax,esi
 0042EE9E    call        @ClassDestroy
 0042EEA3    pop         esi
 0042EEA4    pop         ebx
 0042EEA5    ret
*}
end;

Initialization
Finalization
//0042EEA8
{*
 0042EEA8    push        ebp
 0042EEA9    mov         ebp,esp
 0042EEAB    xor         eax,eax
 0042EEAD    push        ebp
 0042EEAE    push        42EEDF
 0042EEB3    push        dword ptr fs:[eax]
 0042EEB6    mov         dword ptr fs:[eax],esp
 0042EEB9    inc         dword ptr ds:[5E0A00]
>0042EEBF    jne         0042EED1
 0042EEC1    cmp         dword ptr ds:[5E0A04],0;HelpManager:THelpManager
>0042EEC8    je          0042EED1
 0042EECA    xor         eax,eax
 0042EECC    mov         [005E0A04],eax;HelpManager:THelpManager
 0042EED1    xor         eax,eax
 0042EED3    pop         edx
 0042EED4    pop         ecx
 0042EED5    pop         ecx
 0042EED6    mov         dword ptr fs:[eax],edx
 0042EED9    push        42EEE6
 0042EEDE    ret
>0042EEDF    jmp         @HandleFinally
>0042EEE4    jmp         0042EEDE
 0042EEE6    pop         ebp
 0042EEE7    ret
*}
end.