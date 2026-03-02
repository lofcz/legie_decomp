//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit WinHelpViewer;

interface

uses
  SysUtils, Classes;

type
  TWinHelpViewer = class(TInterfacedObject)
  public
    FViewerID:Integer;//fC
    FLastCommandType:TWHCommandType;//f10
    FLastCommand:String;//f14
    FLastContext:Integer;//f18
    FHelpManager:IHelpManager;//f1C
    function HelpFile(const Name:AnsiString):AnsiString;//00435FEC
    procedure InternalShutDown;//004360BC
    function GetViewerName:AnsiString;//004360E4
    function UnderstandsKeyword(const HelpString:AnsiString):Integer;//004360F8
    function GetHelpStrings(const HelpString:AnsiString):TStringList;//00436170
    procedure ShowTableOfContents;//00436218
    procedure ShowHelp(const HelpString:AnsiString);//004362A0
    procedure SoftShutDown;//004363EC
    procedure ShutDown;//00436408
    function UnderstandsTopic(const Topic:AnsiString):Boolean;//00436438
    procedure DisplayTopic(const Topic:AnsiString);//004364A0
    function UnderstandsContext(const ContextID:Integer; const HelpFileName:AnsiString):Boolean;//004365B4
    procedure DisplayHelpByContext(const ContextID:Integer; const HelpFileName:AnsiString);//00436628
    function CallWinHelp(Handle:Longint; const HelpFileName:AnsiString; Command:Word; Data:Longint):Boolean;//004366B8
    function IsNewQuery(QueryType:TWHCommandType; Command:AnsiString; Context:Integer):Boolean;//00436888
    function CouldBeUnstableWindow(WndInfo:TWinHelpFinder):Boolean;//00436914
    function MakeWinHelpHappy:Boolean;//00436930
    procedure RestartWinHelp;//0043698C
    constructor Create;//00436A18
  end;
    //function sub_00436214:?;//00436214
    //procedure sub_004363E8(?:?; ?:?);//004363E8
    function WindowEnumerationTester(wnd:HWND; var Info:TWinHelpFinder):BOOL; stdcall;//004367B8
    function DialogEnumerationTester(wnd:HWND; var Info:TWinHelpFinder):BOOL; stdcall;//00436814
    function FindWinHelp:TWinHelpFinder;//0043686C
    //function sub_00436910:?;//00436910

implementation

//00435FEC
function TWinHelpViewer.HelpFile(const Name:AnsiString):AnsiString;
begin
{*
 00435FEC    push        ebp
 00435FED    mov         ebp,esp
 00435FEF    push        0
 00435FF1    push        0
 00435FF3    push        ebx
 00435FF4    push        esi
 00435FF5    push        edi
 00435FF6    mov         esi,ecx
 00435FF8    mov         edi,edx
 00435FFA    mov         ebx,eax
 00435FFC    xor         eax,eax
 00435FFE    push        ebp
 00435FFF    push        4360A1
 00436004    push        dword ptr fs:[eax]
 00436007    mov         dword ptr fs:[eax],esp
 0043600A    mov         eax,esi
 0043600C    call        @LStrClr
 00436011    test        edi,edi
>00436013    jne         00436028
 00436015    cmp         dword ptr [ebx+1C],0
>00436019    je          00436028
 0043601B    lea         edx,[ebp-4]
 0043601E    mov         eax,dword ptr [ebx+1C]
 00436021    mov         ecx,dword ptr [eax]
 00436023    call        dword ptr [ecx+10]
>00436026    jmp         00436032
 00436028    lea         eax,[ebp-4]
 0043602B    mov         edx,edi
 0043602D    call        @LStrLAsg
 00436032    cmp         dword ptr [ebp-4],0
>00436036    jne         0043604E
 00436038    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>0043603F    je          0043604E
 00436041    lea         edx,[ebp-4]
 00436044    mov         eax,[005E0BF8];WinHelpTester:IWinHelpTester
 00436049    mov         ecx,dword ptr [eax]
 0043604B    call        dword ptr [ecx+20]
 0043604E    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>00436055    je          0043607C
 00436057    lea         edx,[ebp-8]
 0043605A    mov         eax,[005E0BF8];WinHelpTester:IWinHelpTester
 0043605F    mov         ecx,dword ptr [eax]
 00436061    call        dword ptr [ecx+1C]
 00436064    push        dword ptr [ebp-8]
 00436067    push        4360B8;'\'
 0043606C    push        dword ptr [ebp-4]
 0043606F    lea         eax,[ebp-4]
 00436072    mov         edx,3
 00436077    call        @LStrCatN
 0043607C    mov         eax,esi
 0043607E    mov         edx,dword ptr [ebp-4]
 00436081    call        @LStrAsg
 00436086    xor         eax,eax
 00436088    pop         edx
 00436089    pop         ecx
 0043608A    pop         ecx
 0043608B    mov         dword ptr fs:[eax],edx
 0043608E    push        4360A8
 00436093    lea         eax,[ebp-8]
 00436096    mov         edx,2
 0043609B    call        @LStrArrayClr
 004360A0    ret
>004360A1    jmp         @HandleFinally
>004360A6    jmp         00436093
 004360A8    pop         edi
 004360A9    pop         esi
 004360AA    pop         ebx
 004360AB    pop         ecx
 004360AC    pop         ecx
 004360AD    pop         ebp
 004360AE    ret
*}
end;

//004360BC
procedure TWinHelpViewer.InternalShutDown;
begin
{*
 004360BC    push        ebx
 004360BD    mov         ebx,eax
 004360BF    mov         eax,ebx
 004360C1    call        TWinHelpViewer.SoftShutDown
 004360C6    cmp         dword ptr [ebx+1C],0
>004360CA    je          004360DF
 004360CC    mov         edx,dword ptr [ebx+0C]
 004360CF    mov         eax,dword ptr [ebx+1C]
 004360D2    mov         ecx,dword ptr [eax]
 004360D4    call        dword ptr [ecx+14]
 004360D7    lea         eax,[ebx+1C]
 004360DA    call        @IntfClear
 004360DF    pop         ebx
 004360E0    ret
*}
end;

//004360E4
function TWinHelpViewer.GetViewerName:AnsiString;
begin
{*
 004360E4    push        ebx
 004360E5    mov         ebx,edx
 004360E7    mov         eax,ebx
 004360E9    mov         edx,dword ptr ds:[5E0BFC];ViewerName:AnsiString
 004360EF    call        @LStrAsg
 004360F4    pop         ebx
 004360F5    ret
*}
end;

//004360F8
function TWinHelpViewer.UnderstandsKeyword(const HelpString:AnsiString):Integer;
begin
{*
 004360F8    push        ebp
 004360F9    mov         ebp,esp
 004360FB    push        0
 004360FD    push        ebx
 004360FE    push        esi
 004360FF    mov         esi,edx
 00436101    mov         ebx,eax
 00436103    xor         eax,eax
 00436105    push        ebp
 00436106    push        43615F
 0043610B    push        dword ptr fs:[eax]
 0043610E    mov         dword ptr fs:[eax],esp
 00436111    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>00436118    je          00436144
 0043611A    lea         ecx,[ebp-4]
 0043611D    xor         edx,edx
 0043611F    mov         eax,ebx
 00436121    call        TWinHelpViewer.HelpFile
 00436126    mov         ecx,dword ptr [ebp-4]
 00436129    mov         edx,esi
 0043612B    mov         eax,[005E0BF8];WinHelpTester:IWinHelpTester
 00436130    mov         ebx,dword ptr [eax]
 00436132    call        dword ptr [ebx+0C]
 00436135    test        al,al
>00436137    je          00436140
 00436139    mov         ebx,1
>0043613E    jmp         00436149
 00436140    xor         ebx,ebx
>00436142    jmp         00436149
 00436144    mov         ebx,1
 00436149    xor         eax,eax
 0043614B    pop         edx
 0043614C    pop         ecx
 0043614D    pop         ecx
 0043614E    mov         dword ptr fs:[eax],edx
 00436151    push        436166
 00436156    lea         eax,[ebp-4]
 00436159    call        @LStrClr
 0043615E    ret
>0043615F    jmp         @HandleFinally
>00436164    jmp         00436156
 00436166    mov         eax,ebx
 00436168    pop         esi
 00436169    pop         ebx
 0043616A    pop         ecx
 0043616B    pop         ebp
 0043616C    ret
*}
end;

//00436170
function TWinHelpViewer.GetHelpStrings(const HelpString:AnsiString):TStringList;
begin
{*
 00436170    push        ebp
 00436171    mov         ebp,esp
 00436173    push        0
 00436175    push        0
 00436177    push        ebx
 00436178    push        esi
 00436179    push        edi
 0043617A    mov         edi,edx
 0043617C    mov         esi,eax
 0043617E    xor         eax,eax
 00436180    push        ebp
 00436181    push        4361F8
 00436186    push        dword ptr fs:[eax]
 00436189    mov         dword ptr fs:[eax],esp
 0043618C    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>00436193    je          004361A5
 00436195    mov         edx,edi
 00436197    mov         eax,[005E0BF8];WinHelpTester:IWinHelpTester
 0043619C    mov         ecx,dword ptr [eax]
 0043619E    call        dword ptr [ecx+18]
 004361A1    mov         ebx,eax
>004361A3    jmp         004361DD
 004361A5    mov         dl,1
 004361A7    mov         eax,[00418350];TStringList
 004361AC    call        TObject.Create
 004361B1    mov         ebx,eax
 004361B3    lea         edx,[ebp-8]
 004361B6    mov         eax,esi
 004361B8    call        TWinHelpViewer.GetViewerName
 004361BD    push        dword ptr [ebp-8]
 004361C0    push        436210;': '
 004361C5    push        edi
 004361C6    lea         eax,[ebp-4]
 004361C9    mov         edx,3
 004361CE    call        @LStrCatN
 004361D3    mov         edx,dword ptr [ebp-4]
 004361D6    mov         eax,ebx
 004361D8    mov         ecx,dword ptr [eax]
 004361DA    call        dword ptr [ecx+38]
 004361DD    xor         eax,eax
 004361DF    pop         edx
 004361E0    pop         ecx
 004361E1    pop         ecx
 004361E2    mov         dword ptr fs:[eax],edx
 004361E5    push        4361FF
 004361EA    lea         eax,[ebp-8]
 004361ED    mov         edx,2
 004361F2    call        @LStrArrayClr
 004361F7    ret
>004361F8    jmp         @HandleFinally
>004361FD    jmp         004361EA
 004361FF    mov         eax,ebx
 00436201    pop         edi
 00436202    pop         esi
 00436203    pop         ebx
 00436204    pop         ecx
 00436205    pop         ecx
 00436206    pop         ebp
 00436207    ret
*}
end;

//00436214
{*function sub_00436214:?;
begin
 00436214    mov         al,1
 00436216    ret
end;*}

//00436218
procedure TWinHelpViewer.ShowTableOfContents;
begin
{*
 00436218    push        ebp
 00436219    mov         ebp,esp
 0043621B    push        0
 0043621D    push        0
 0043621F    push        ebx
 00436220    mov         ebx,eax
 00436222    xor         eax,eax
 00436224    push        ebp
 00436225    push        436293
 0043622A    push        dword ptr fs:[eax]
 0043622D    mov         dword ptr fs:[eax],esp
 00436230    mov         eax,ebx
 00436232    call        TWinHelpViewer.MakeWinHelpHappy
 00436237    test        al,al
>00436239    je          00436278
 0043623B    mov         byte ptr [ebx+10],2
 0043623F    lea         edx,[ebp-8]
 00436242    mov         eax,dword ptr [ebx+1C]
 00436245    mov         ecx,dword ptr [eax]
 00436247    call        dword ptr [ecx+10]
 0043624A    mov         edx,dword ptr [ebp-8]
 0043624D    lea         ecx,[ebp-4]
 00436250    mov         eax,ebx
 00436252    call        TWinHelpViewer.HelpFile
 00436257    cmp         dword ptr [ebp-4],0
>0043625B    je          00436278
 0043625D    push        0
 0043625F    push        3
 00436261    mov         eax,dword ptr [ebp-4]
 00436264    call        @LStrToPChar
 00436269    push        eax
 0043626A    mov         eax,dword ptr [ebx+1C]
 0043626D    mov         edx,dword ptr [eax]
 0043626F    call        dword ptr [edx+0C]
 00436272    push        eax
 00436273    call        user32.WinHelpA
 00436278    xor         eax,eax
 0043627A    pop         edx
 0043627B    pop         ecx
 0043627C    pop         ecx
 0043627D    mov         dword ptr fs:[eax],edx
 00436280    push        43629A
 00436285    lea         eax,[ebp-8]
 00436288    mov         edx,2
 0043628D    call        @LStrArrayClr
 00436292    ret
>00436293    jmp         @HandleFinally
>00436298    jmp         00436285
 0043629A    pop         ebx
 0043629B    pop         ecx
 0043629C    pop         ecx
 0043629D    pop         ebp
 0043629E    ret
*}
end;

//004362A0
procedure TWinHelpViewer.ShowHelp(const HelpString:AnsiString);
begin
{*
 004362A0    push        ebp
 004362A1    mov         ebp,esp
 004362A3    add         esp,0FFFFFFE4
 004362A6    push        ebx
 004362A7    push        esi
 004362A8    xor         ecx,ecx
 004362AA    mov         dword ptr [ebp-1C],ecx
 004362AD    mov         dword ptr [ebp-4],ecx
 004362B0    mov         dword ptr [ebp-8],ecx
 004362B3    mov         esi,edx
 004362B5    mov         ebx,eax
 004362B7    xor         eax,eax
 004362B9    push        ebp
 004362BA    push        436398
 004362BF    push        dword ptr fs:[eax]
 004362C2    mov         dword ptr fs:[eax],esp
 004362C5    test        esi,esi
>004362C7    jne         004362DF
 004362C9    mov         ecx,435E40;^gvar_005AF664
 004362CE    mov         dl,1
 004362D0    mov         eax,[0042E054];EHelpSystemException
 004362D5    call        Exception.CreateRes
 004362DA    call        @RaiseExcept
 004362DF    lea         eax,[ebp-4]
 004362E2    push        eax
 004362E3    mov         dword ptr [ebp-18],esi
 004362E6    mov         byte ptr [ebp-14],0B
 004362EA    lea         ecx,[ebp-1C]
 004362ED    xor         edx,edx
 004362EF    mov         eax,ebx
 004362F1    call        TWinHelpViewer.HelpFile
 004362F6    mov         eax,dword ptr [ebp-1C]
 004362F9    mov         dword ptr [ebp-10],eax
 004362FC    mov         byte ptr [ebp-0C],0B
 00436300    lea         edx,[ebp-18]
 00436303    mov         ecx,1
 00436308    mov         eax,4363B0;'IE(AL("%s",4),"AL(\"%0:s\",3)","JK(\"%1:s\",\"%0:s\")")'
 0043630D    call        Format
 00436312    mov         eax,ebx
 00436314    call        TWinHelpViewer.MakeWinHelpHappy
 00436319    test        al,al
>0043631B    je          00436375
 0043631D    lea         ecx,[ebp-8]
 00436320    xor         edx,edx
 00436322    mov         eax,ebx
 00436324    call        TWinHelpViewer.HelpFile
 00436329    push        0
 0043632B    mov         ecx,dword ptr [ebp-4]
 0043632E    mov         dl,1
 00436330    mov         eax,ebx
 00436332    call        TWinHelpViewer.IsNewQuery
 00436337    test        al,al
>00436339    je          00436375
 0043633B    cmp         dword ptr [ebp-8],0
>0043633F    je          00436375
 00436341    mov         byte ptr [ebx+10],1
 00436345    lea         eax,[ebx+14]
 00436348    mov         edx,dword ptr [ebp-4]
 0043634B    call        @LStrAsg
 00436350    mov         eax,dword ptr [ebp-4]
 00436353    call        @LStrToPChar
 00436358    push        eax
 00436359    push        102
 0043635E    mov         eax,dword ptr [ebp-8]
 00436361    call        @LStrToPChar
 00436366    push        eax
 00436367    mov         eax,dword ptr [ebx+1C]
 0043636A    mov         edx,dword ptr [eax]
 0043636C    call        dword ptr [edx+0C]
 0043636F    push        eax
 00436370    call        user32.WinHelpA
 00436375    xor         eax,eax
 00436377    pop         edx
 00436378    pop         ecx
 00436379    pop         ecx
 0043637A    mov         dword ptr fs:[eax],edx
 0043637D    push        43639F
 00436382    lea         eax,[ebp-1C]
 00436385    call        @LStrClr
 0043638A    lea         eax,[ebp-8]
 0043638D    mov         edx,2
 00436392    call        @LStrArrayClr
 00436397    ret
>00436398    jmp         @HandleFinally
>0043639D    jmp         00436382
 0043639F    pop         esi
 004363A0    pop         ebx
 004363A1    mov         esp,ebp
 004363A3    pop         ebp
 004363A4    ret
*}
end;

//004363E8
{*procedure sub_004363E8(?:?; ?:?);
begin
 004363E8    mov         dword ptr [eax+0C],edx
 004363EB    ret
end;*}

//004363EC
procedure TWinHelpViewer.SoftShutDown;
begin
{*
 004363EC    mov         byte ptr [eax+10],3
 004363F0    push        0
 004363F2    push        2
 004363F4    push        436404
 004363F9    push        0
 004363FB    call        user32.WinHelpA
 00436400    ret
*}
end;

//00436408
procedure TWinHelpViewer.ShutDown;
begin
{*
 00436408    push        ebx
 00436409    mov         ebx,eax
 0043640B    mov         eax,ebx
 0043640D    call        TWinHelpViewer.SoftShutDown
 00436412    cmp         dword ptr [ebx+1C],0
>00436416    je          00436420
 00436418    lea         eax,[ebx+1C]
 0043641B    call        @IntfClear
 00436420    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>00436427    je          00436433
 00436429    mov         eax,5E0BF8;WinHelpTester:IWinHelpTester
 0043642E    call        @IntfClear
 00436433    pop         ebx
 00436434    ret
*}
end;

//00436438
function TWinHelpViewer.UnderstandsTopic(const Topic:AnsiString):Boolean;
begin
{*
 00436438    push        ebp
 00436439    mov         ebp,esp
 0043643B    push        0
 0043643D    push        ebx
 0043643E    push        esi
 0043643F    push        edi
 00436440    mov         edi,edx
 00436442    mov         esi,eax
 00436444    xor         eax,eax
 00436446    push        ebp
 00436447    push        436490
 0043644C    push        dword ptr fs:[eax]
 0043644F    mov         dword ptr fs:[eax],esp
 00436452    mov         bl,1
 00436454    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>0043645B    je          0043647A
 0043645D    lea         ecx,[ebp-4]
 00436460    xor         edx,edx
 00436462    mov         eax,esi
 00436464    call        TWinHelpViewer.HelpFile
 00436469    mov         ecx,dword ptr [ebp-4]
 0043646C    mov         edx,edi
 0043646E    mov         eax,[005E0BF8];WinHelpTester:IWinHelpTester
 00436473    mov         ebx,dword ptr [eax]
 00436475    call        dword ptr [ebx+10]
 00436478    mov         ebx,eax
 0043647A    xor         eax,eax
 0043647C    pop         edx
 0043647D    pop         ecx
 0043647E    pop         ecx
 0043647F    mov         dword ptr fs:[eax],edx
 00436482    push        436497
 00436487    lea         eax,[ebp-4]
 0043648A    call        @LStrClr
 0043648F    ret
>00436490    jmp         @HandleFinally
>00436495    jmp         00436487
 00436497    mov         eax,ebx
 00436499    pop         edi
 0043649A    pop         esi
 0043649B    pop         ebx
 0043649C    pop         ecx
 0043649D    pop         ebp
 0043649E    ret
*}
end;

//004364A0
procedure TWinHelpViewer.DisplayTopic(const Topic:AnsiString);
begin
{*
 004364A0    push        ebp
 004364A1    mov         ebp,esp
 004364A3    add         esp,0FFFFFEF0
 004364A9    push        ebx
 004364AA    push        esi
 004364AB    xor         ecx,ecx
 004364AD    mov         dword ptr [ebp-110],ecx
 004364B3    mov         dword ptr [ebp-4],ecx
 004364B6    mov         esi,edx
 004364B8    mov         ebx,eax
 004364BA    xor         eax,eax
 004364BC    push        ebp
 004364BD    push        436596
 004364C2    push        dword ptr fs:[eax]
 004364C5    mov         dword ptr fs:[eax],esp
 004364C8    mov         dword ptr [ebp-10C],esi
 004364CE    mov         byte ptr [ebp-108],0B
 004364D5    lea         eax,[ebp-10C]
 004364DB    push        eax
 004364DC    push        0
 004364DE    mov         ecx,4365A4
 004364E3    lea         eax,[ebp-104]
 004364E9    mov         edx,0FF
 004364EE    call        StrLFmt
 004364F3    lea         ecx,[ebp-4]
 004364F6    xor         edx,edx
 004364F8    mov         eax,ebx
 004364FA    call        TWinHelpViewer.HelpFile
 004364FF    mov         eax,ebx
 00436501    call        TWinHelpViewer.MakeWinHelpHappy
 00436506    test        al,al
>00436508    je          00436575
 0043650A    push        0
 0043650C    lea         eax,[ebp-110]
 00436512    lea         edx,[ebp-104]
 00436518    mov         ecx,100
 0043651D    call        @LStrFromArray
 00436522    mov         ecx,dword ptr [ebp-110]
 00436528    mov         dl,1
 0043652A    mov         eax,ebx
 0043652C    call        TWinHelpViewer.IsNewQuery
 00436531    test        al,al
>00436533    je          00436575
 00436535    cmp         dword ptr [ebp-4],0
>00436539    je          00436575
 0043653B    mov         byte ptr [ebx+10],1
 0043653F    lea         eax,[ebx+14]
 00436542    lea         edx,[ebp-104]
 00436548    mov         ecx,100
 0043654D    call        @LStrFromArray
 00436552    lea         eax,[ebp-104]
 00436558    push        eax
 00436559    push        102
 0043655E    mov         eax,dword ptr [ebp-4]
 00436561    call        @LStrToPChar
 00436566    push        eax
 00436567    mov         eax,dword ptr [ebx+1C]
 0043656A    mov         edx,dword ptr [eax]
 0043656C    call        dword ptr [edx+0C]
 0043656F    push        eax
 00436570    call        user32.WinHelpA
 00436575    xor         eax,eax
 00436577    pop         edx
 00436578    pop         ecx
 00436579    pop         ecx
 0043657A    mov         dword ptr fs:[eax],edx
 0043657D    push        43659D
 00436582    lea         eax,[ebp-110]
 00436588    call        @LStrClr
 0043658D    lea         eax,[ebp-4]
 00436590    call        @LStrClr
 00436595    ret
>00436596    jmp         @HandleFinally
>0043659B    jmp         00436582
 0043659D    pop         esi
 0043659E    pop         ebx
 0043659F    mov         esp,ebp
 004365A1    pop         ebp
 004365A2    ret
*}
end;

//004365B4
function TWinHelpViewer.UnderstandsContext(const ContextID:Integer; const HelpFileName:AnsiString):Boolean;
begin
{*
 004365B4    push        ebp
 004365B5    mov         ebp,esp
 004365B7    add         esp,0FFFFFFF8
 004365BA    push        ebx
 004365BB    push        esi
 004365BC    push        edi
 004365BD    xor         ebx,ebx
 004365BF    mov         dword ptr [ebp-8],ebx
 004365C2    mov         dword ptr [ebp-4],ecx
 004365C5    mov         edi,edx
 004365C7    mov         esi,eax
 004365C9    xor         eax,eax
 004365CB    push        ebp
 004365CC    push        436616
 004365D1    push        dword ptr fs:[eax]
 004365D4    mov         dword ptr fs:[eax],esp
 004365D7    mov         bl,1
 004365D9    cmp         dword ptr ds:[5E0BF8],0;WinHelpTester:IWinHelpTester
>004365E0    je          00436600
 004365E2    lea         ecx,[ebp-8]
 004365E5    mov         edx,dword ptr [ebp-4]
 004365E8    mov         eax,esi
 004365EA    call        TWinHelpViewer.HelpFile
 004365EF    mov         ecx,dword ptr [ebp-8]
 004365F2    mov         edx,edi
 004365F4    mov         eax,[005E0BF8];WinHelpTester:IWinHelpTester
 004365F9    mov         ebx,dword ptr [eax]
 004365FB    call        dword ptr [ebx+14]
 004365FE    mov         ebx,eax
 00436600    xor         eax,eax
 00436602    pop         edx
 00436603    pop         ecx
 00436604    pop         ecx
 00436605    mov         dword ptr fs:[eax],edx
 00436608    push        43661D
 0043660D    lea         eax,[ebp-8]
 00436610    call        @LStrClr
 00436615    ret
>00436616    jmp         @HandleFinally
>0043661B    jmp         0043660D
 0043661D    mov         eax,ebx
 0043661F    pop         edi
 00436620    pop         esi
 00436621    pop         ebx
 00436622    pop         ecx
 00436623    pop         ecx
 00436624    pop         ebp
 00436625    ret
*}
end;

//00436628
procedure TWinHelpViewer.DisplayHelpByContext(const ContextID:Integer; const HelpFileName:AnsiString);
begin
{*
 00436628    push        ebp
 00436629    mov         ebp,esp
 0043662B    push        0
 0043662D    push        ebx
 0043662E    push        esi
 0043662F    push        edi
 00436630    mov         edi,ecx
 00436632    mov         esi,edx
 00436634    mov         ebx,eax
 00436636    xor         eax,eax
 00436638    push        ebp
 00436639    push        4366A8
 0043663E    push        dword ptr fs:[eax]
 00436641    mov         dword ptr fs:[eax],esp
 00436644    lea         ecx,[ebp-4]
 00436647    mov         edx,edi
 00436649    mov         eax,ebx
 0043664B    call        TWinHelpViewer.HelpFile
 00436650    mov         eax,ebx
 00436652    call        TWinHelpViewer.MakeWinHelpHappy
 00436657    test        al,al
>00436659    je          00436692
 0043665B    push        esi
 0043665C    xor         ecx,ecx
 0043665E    xor         edx,edx
 00436660    mov         eax,ebx
 00436662    call        TWinHelpViewer.IsNewQuery
 00436667    test        al,al
>00436669    je          00436692
 0043666B    cmp         dword ptr [ebp-4],0
>0043666F    je          00436692
 00436671    mov         byte ptr [ebx+10],0
 00436675    mov         dword ptr [ebx+18],esi
 00436678    push        esi
 00436679    push        1
 0043667B    mov         eax,dword ptr [ebp-4]
 0043667E    call        @LStrToPChar
 00436683    push        eax
 00436684    mov         eax,dword ptr [ebx+1C]
 00436687    mov         edx,dword ptr [eax]
 00436689    call        dword ptr [edx+0C]
 0043668C    push        eax
 0043668D    call        user32.WinHelpA
 00436692    xor         eax,eax
 00436694    pop         edx
 00436695    pop         ecx
 00436696    pop         ecx
 00436697    mov         dword ptr fs:[eax],edx
 0043669A    push        4366AF
 0043669F    lea         eax,[ebp-4]
 004366A2    call        @LStrClr
 004366A7    ret
>004366A8    jmp         @HandleFinally
>004366AD    jmp         0043669F
 004366AF    pop         edi
 004366B0    pop         esi
 004366B1    pop         ebx
 004366B2    pop         ecx
 004366B3    pop         ebp
 004366B4    ret
*}
end;

//004366B8
function TWinHelpViewer.CallWinHelp(Handle:Longint; const HelpFileName:AnsiString; Command:Word; Data:Longint):Boolean;
begin
{*
 004366B8    push        ebp
 004366B9    mov         ebp,esp
 004366BB    push        0
 004366BD    push        0
 004366BF    push        0
 004366C1    push        0
 004366C3    push        0
 004366C5    push        ebx
 004366C6    push        esi
 004366C7    push        edi
 004366C8    mov         dword ptr [ebp-8],ecx
 004366CB    mov         dword ptr [ebp-4],edx
 004366CE    mov         esi,eax
 004366D0    mov         edi,dword ptr [ebp+0C]
 004366D3    xor         eax,eax
 004366D5    push        ebp
 004366D6    push        4367A3
 004366DB    push        dword ptr fs:[eax]
 004366DE    mov         dword ptr fs:[eax],esp
 004366E1    xor         ebx,ebx
 004366E3    mov         eax,esi
 004366E5    call        TWinHelpViewer.MakeWinHelpHappy
 004366EA    test        al,al
>004366EC    je          00436788
 004366F2    cmp         di,102
>004366F7    je          00436720
 004366F9    cmp         di,105
>004366FE    je          00436720
 00436700    cmp         di,201
>00436705    je          00436720
 00436707    cmp         di,0A
>0043670B    je          00436720
 0043670D    cmp         di,8
>00436711    je          00436720
 00436713    cmp         di,1
>00436717    je          00436720
 00436719    cmp         di,101
>0043671E    jne         0043673B
 00436720    push        0
 00436722    lea         edx,[ebp-0C]
 00436725    movzx       eax,di
 00436728    call        IntToStr
 0043672D    mov         ecx,dword ptr [ebp-0C]
 00436730    mov         dl,1
 00436732    mov         eax,esi
 00436734    call        TWinHelpViewer.IsNewQuery
>00436739    jmp         0043673D
 0043673B    mov         al,1
 0043673D    test        al,al
>0043673F    je          00436788
 00436741    mov         byte ptr [esi+10],1
 00436745    lea         edx,[ebp-10]
 00436748    movzx       eax,di
 0043674B    call        IntToStr
 00436750    mov         edx,dword ptr [ebp-10]
 00436753    lea         eax,[esi+14]
 00436756    call        @LStrAsg
 0043675B    mov         eax,dword ptr [ebp+8]
 0043675E    push        eax
 0043675F    movzx       eax,di
 00436762    push        eax
 00436763    lea         ecx,[ebp-14]
 00436766    mov         edx,dword ptr [ebp-8]
 00436769    mov         eax,esi
 0043676B    call        TWinHelpViewer.HelpFile
 00436770    mov         eax,dword ptr [ebp-14]
 00436773    call        @LStrToPChar
 00436778    push        eax
 00436779    mov         eax,dword ptr [ebp-4]
 0043677C    push        eax
 0043677D    call        user32.WinHelpA
 00436782    cmp         eax,1
 00436785    sbb         ebx,ebx
 00436787    inc         ebx
 00436788    xor         eax,eax
 0043678A    pop         edx
 0043678B    pop         ecx
 0043678C    pop         ecx
 0043678D    mov         dword ptr fs:[eax],edx
 00436790    push        4367AA
 00436795    lea         eax,[ebp-14]
 00436798    mov         edx,3
 0043679D    call        @LStrArrayClr
 004367A2    ret
>004367A3    jmp         @HandleFinally
>004367A8    jmp         00436795
 004367AA    mov         eax,ebx
 004367AC    pop         edi
 004367AD    pop         esi
 004367AE    pop         ebx
 004367AF    mov         esp,ebp
 004367B1    pop         ebp
 004367B2    ret         8
*}
end;

//004367B8
function WindowEnumerationTester(wnd:HWND; var Info:TWinHelpFinder):BOOL; stdcall;
begin
{*
 004367B8    push        ebp
 004367B9    mov         ebp,esp
 004367BB    add         esp,0FFFFFF00
 004367C1    push        ebx
 004367C2    push        esi
 004367C3    mov         ebx,dword ptr [ebp+0C]
 004367C6    mov         esi,dword ptr [ebp+8]
 004367C9    push        100
 004367CE    lea         eax,[ebp-100]
 004367D4    push        eax
 004367D5    push        esi
 004367D6    call        user32.GetClassNameA
 004367DB    mov         edx,436808
 004367E0    lea         eax,[ebp-100]
 004367E6    call        StrIComp
 004367EB    test        eax,eax
>004367ED    jne         004367F6
 004367EF    mov         dword ptr [ebx+4],esi
 004367F2    mov         byte ptr [ebx+0C],1
 004367F6    mov         al,byte ptr [ebx+0C]
 004367F9    xor         al,1
 004367FB    neg         al
 004367FD    sbb         eax,eax
 004367FF    pop         esi
 00436800    pop         ebx
 00436801    mov         esp,ebp
 00436803    pop         ebp
 00436804    ret         8
*}
end;

//00436814
function DialogEnumerationTester(wnd:HWND; var Info:TWinHelpFinder):BOOL; stdcall;
begin
{*
 00436814    push        ebp
 00436815    mov         ebp,esp
 00436817    add         esp,0FFFFFF00
 0043681D    push        ebx
 0043681E    push        esi
 0043681F    mov         ebx,dword ptr [ebp+0C]
 00436822    mov         esi,dword ptr [ebp+8]
 00436825    push        100
 0043682A    lea         eax,[ebp-100]
 00436830    push        eax
 00436831    push        esi
 00436832    call        user32.GetClassNameA
 00436837    mov         edx,436864
 0043683C    lea         eax,[ebp-100]
 00436842    call        StrComp
 00436847    test        eax,eax
>00436849    jne         00436852
 0043684B    mov         byte ptr [ebx+0D],1
 0043684F    mov         dword ptr [ebx+8],esi
 00436852    mov         al,byte ptr [ebx+0D]
 00436855    xor         al,1
 00436857    neg         al
 00436859    sbb         eax,eax
 0043685B    pop         esi
 0043685C    pop         ebx
 0043685D    mov         esp,ebp
 0043685F    pop         ebp
 00436860    ret         8
*}
end;

//0043686C
function FindWinHelp:TWinHelpFinder;
begin
{*
 0043686C    mov         byte ptr [eax+0C],0
 00436870    mov         byte ptr [eax+0D],0
 00436874    xor         edx,edx
 00436876    mov         dword ptr [eax+4],edx
 00436879    push        eax
 0043687A    push        4367B8;WindowEnumerationTester:BOOL
 0043687F    call        user32.EnumWindows
 00436884    ret
*}
end;

//00436888
function TWinHelpViewer.IsNewQuery(QueryType:TWHCommandType; Command:AnsiString; Context:Integer):Boolean;
begin
{*
 00436888    push        ebp
 00436889    mov         ebp,esp
 0043688B    add         esp,0FFFFFFE8
 0043688E    push        ebx
 0043688F    push        esi
 00436890    mov         dword ptr [ebp-4],ecx
 00436893    mov         ebx,edx
 00436895    mov         esi,eax
 00436897    mov         eax,dword ptr [ebp-4]
 0043689A    call        @LStrAddRef
 0043689F    xor         eax,eax
 004368A1    push        ebp
 004368A2    push        4368FE
 004368A7    push        dword ptr fs:[eax]
 004368AA    mov         dword ptr fs:[eax],esp
 004368AD    mov         byte ptr [ebp-5],1
 004368B1    lea         eax,[ebp-18]
 004368B4    call        FindWinHelp
 004368B9    cmp         byte ptr [ebp-0C],0
>004368BD    je          004368E8
 004368BF    cmp         bl,byte ptr [esi+10]
>004368C2    jne         004368E8
 004368C4    sub         bl,1
>004368C7    jb          004368DE
>004368C9    jne         004368E8
 004368CB    mov         edx,dword ptr [esi+14]
 004368CE    mov         eax,dword ptr [ebp-4]
 004368D1    call        CompareStr
 004368D6    test        eax,eax
 004368D8    setne       byte ptr [ebp-5]
>004368DC    jmp         004368E8
 004368DE    mov         eax,dword ptr [ebp+8]
 004368E1    cmp         eax,dword ptr [esi+18]
 004368E4    setne       byte ptr [ebp-5]
 004368E8    xor         eax,eax
 004368EA    pop         edx
 004368EB    pop         ecx
 004368EC    pop         ecx
 004368ED    mov         dword ptr fs:[eax],edx
 004368F0    push        436905
 004368F5    lea         eax,[ebp-4]
 004368F8    call        @LStrClr
 004368FD    ret
>004368FE    jmp         @HandleFinally
>00436903    jmp         004368F5
 00436905    mov         al,byte ptr [ebp-5]
 00436908    pop         esi
 00436909    pop         ebx
 0043690A    mov         esp,ebp
 0043690C    pop         ebp
 0043690D    ret         4
*}
end;

//00436910
{*function sub_00436910:?;
begin
 00436910    xor         eax,eax
 00436912    ret
end;*}

//00436914
function TWinHelpViewer.CouldBeUnstableWindow(WndInfo:TWinHelpFinder):Boolean;
begin
{*
 00436914    push        esi
 00436915    push        edi
 00436916    add         esp,0FFFFFFF0
 00436919    mov         esi,edx
 0043691B    lea         edi,[esp]
 0043691E    movs        dword ptr [edi],dword ptr [esi]
 0043691F    movs        dword ptr [edi],dword ptr [esi]
 00436920    movs        dword ptr [edi],dword ptr [esi]
 00436921    movs        dword ptr [edi],dword ptr [esi]
 00436922    mov         al,byte ptr [esp+0D]
 00436926    xor         al,1
 00436928    add         esp,10
 0043692B    pop         edi
 0043692C    pop         esi
 0043692D    ret
*}
end;

//00436930
function TWinHelpViewer.MakeWinHelpHappy:Boolean;
begin
{*
 00436930    push        ebx
 00436931    push        esi
 00436932    add         esp,0FFFFFFF0
 00436935    mov         esi,eax
 00436937    xor         ebx,ebx
 00436939    mov         eax,esp
 0043693B    call        FindWinHelp
 00436940    cmp         byte ptr [esp+0C],0
>00436945    je          00436961
 00436947    mov         eax,esp
 00436949    push        eax
 0043694A    push        436814;DialogEnumerationTester:BOOL
 0043694F    push        0
 00436951    mov         eax,dword ptr [esp+10]
 00436955    push        eax
 00436956    call        user32.GetWindowThreadProcessId
 0043695B    push        eax
 0043695C    call        user32.EnumThreadWindows
 00436961    mov         edx,esp
 00436963    mov         eax,esi
 00436965    call        00436910
 0043696A    test        al,al
>0043696C    jne         00436984
 0043696E    mov         edx,esp
 00436970    mov         eax,esi
 00436972    call        TWinHelpViewer.CouldBeUnstableWindow
 00436977    test        al,al
>00436979    je          00436982
 0043697B    mov         eax,esi
 0043697D    call        TWinHelpViewer.RestartWinHelp
 00436982    mov         bl,1
 00436984    mov         eax,ebx
 00436986    add         esp,10
 00436989    pop         esi
 0043698A    pop         ebx
 0043698B    ret
*}
end;

//0043698C
procedure TWinHelpViewer.RestartWinHelp;
begin
{*
 0043698C    push        ebp
 0043698D    mov         ebp,esp
 0043698F    push        0
 00436991    push        ebx
 00436992    push        esi
 00436993    mov         esi,eax
 00436995    xor         eax,eax
 00436997    push        ebp
 00436998    push        436A09
 0043699D    push        dword ptr fs:[eax]
 004369A0    mov         dword ptr fs:[eax],esp
 004369A3    mov         eax,esi
 004369A5    call        TWinHelpViewer.SoftShutDown
 004369AA    call        KERNEL32.GetTickCount
 004369AF    mov         ebx,eax
 004369B1    push        0
 004369B3    call        KERNEL32.Sleep
 004369B8    call        KERNEL32.GetTickCount
 004369BD    sub         eax,ebx
 004369BF    cmp         eax,3E8
>004369C4    jbe         004369B1
 004369C6    lea         ecx,[ebp-4]
 004369C9    xor         edx,edx
 004369CB    mov         eax,esi
 004369CD    call        TWinHelpViewer.HelpFile
 004369D2    cmp         dword ptr [ebp-4],0
>004369D6    je          004369F3
 004369D8    push        0
 004369DA    push        9
 004369DC    mov         eax,dword ptr [ebp-4]
 004369DF    call        @LStrToPChar
 004369E4    push        eax
 004369E5    mov         eax,dword ptr [esi+1C]
 004369E8    mov         edx,dword ptr [eax]
 004369EA    call        dword ptr [edx+0C]
 004369ED    push        eax
 004369EE    call        user32.WinHelpA
 004369F3    xor         eax,eax
 004369F5    pop         edx
 004369F6    pop         ecx
 004369F7    pop         ecx
 004369F8    mov         dword ptr fs:[eax],edx
 004369FB    push        436A10
 00436A00    lea         eax,[ebp-4]
 00436A03    call        @LStrClr
 00436A08    ret
>00436A09    jmp         @HandleFinally
>00436A0E    jmp         00436A00
 00436A10    pop         esi
 00436A11    pop         ebx
 00436A12    pop         ecx
 00436A13    pop         ebp
 00436A14    ret
*}
end;

//00436A18
constructor TWinHelpViewer.Create;
begin
{*
 00436A18    push        ebx
 00436A19    push        esi
 00436A1A    test        dl,dl
>00436A1C    je          00436A26
 00436A1E    add         esp,0FFFFFFF0
 00436A21    call        @ClassCreate
 00436A26    mov         ebx,edx
 00436A28    mov         esi,eax
 00436A2A    xor         edx,edx
 00436A2C    mov         eax,esi
 00436A2E    call        TObject.Create
 00436A33    mov         eax,5E0C08;HelpViewerIntf:ICustomHelpViewer
 00436A38    mov         edx,esi
 00436A3A    test        edx,edx
>00436A3C    je          00436A41
 00436A3E    sub         edx,0FFFFFFE0
 00436A41    call        @IntfCopy
 00436A46    mov         eax,esi
 00436A48    test        bl,bl
>00436A4A    je          00436A5B
 00436A4C    call        @AfterConstruction
 00436A51    pop         dword ptr fs:[0]
 00436A58    add         esp,0C
 00436A5B    mov         eax,esi
 00436A5D    pop         esi
 00436A5E    pop         ebx
 00436A5F    ret
*}
end;

Initialization
//00436B04
{*
 00436B04    push        ebp
 00436B05    mov         ebp,esp
 00436B07    xor         eax,eax
 00436B09    push        ebp
 00436B0A    push        436B56
 00436B0F    push        dword ptr fs:[eax]
 00436B12    mov         dword ptr fs:[eax],esp
 00436B15    sub         dword ptr ds:[5E0C00],1
>00436B1C    jae         00436B48
 00436B1E    mov         dl,1
 00436B20    mov         eax,[00435F74];TWinHelpViewer
 00436B25    call        TWinHelpViewer.Create
 00436B2A    mov         [005E0C04],eax;HelpViewer:TWinHelpViewer
 00436B2F    mov         eax,[005E0C04];HelpViewer:TWinHelpViewer
 00436B34    add         eax,1C
 00436B37    call        @IntfClear
 00436B3C    mov         edx,eax
 00436B3E    mov         eax,[005E0C08];HelpViewerIntf:ICustomHelpViewer
 00436B43    call        RegisterViewer
 00436B48    xor         eax,eax
 00436B4A    pop         edx
 00436B4B    pop         ecx
 00436B4C    pop         ecx
 00436B4D    mov         dword ptr fs:[eax],edx
 00436B50    push        436B5D
 00436B55    ret
>00436B56    jmp         @HandleFinally
>00436B5B    jmp         00436B55
 00436B5D    pop         ebp
 00436B5E    ret
*}
Finalization
//00436A8C
{*
 00436A8C    push        ebp
 00436A8D    mov         ebp,esp
 00436A8F    xor         eax,eax
 00436A91    push        ebp
 00436A92    push        436AFA
 00436A97    push        dword ptr fs:[eax]
 00436A9A    mov         dword ptr fs:[eax],esp
 00436A9D    inc         dword ptr ds:[5E0C00]
>00436AA3    jne         00436AEC
 00436AA5    mov         eax,[005E0C04];HelpViewer:TWinHelpViewer
 00436AAA    cmp         dword ptr [eax+1C],0
>00436AAE    je          00436ABA
 00436AB0    mov         eax,[005E0C04];HelpViewer:TWinHelpViewer
 00436AB5    call        TWinHelpViewer.InternalShutDown
 00436ABA    mov         eax,5E0C08;HelpViewerIntf:ICustomHelpViewer
 00436ABF    call        @IntfClear
 00436AC4    mov         eax,5E0BF8;WinHelpTester:IWinHelpTester
 00436AC9    call        @IntfClear
 00436ACE    mov         eax,5E0C08;HelpViewerIntf:ICustomHelpViewer
 00436AD3    call        @IntfClear
 00436AD8    mov         eax,5E0BFC;ViewerName:AnsiString
 00436ADD    call        @LStrClr
 00436AE2    mov         eax,5E0BF8;WinHelpTester:IWinHelpTester
 00436AE7    call        @IntfClear
 00436AEC    xor         eax,eax
 00436AEE    pop         edx
 00436AEF    pop         ecx
 00436AF0    pop         ecx
 00436AF1    mov         dword ptr fs:[eax],edx
 00436AF4    push        436B01
 00436AF9    ret
>00436AFA    jmp         @HandleFinally
>00436AFF    jmp         00436AF9
 00436B01    pop         ebp
 00436B02    ret
*}
end.