//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit SyncObjs;

interface

uses
  SysUtils, Classes;

type
  TSynchroObject = class(TObject)
  public
    procedure v0; virtual;//v0//0042F358
    procedure v4; virtual;//v4//0042F35C
  end;
  TCriticalSection = class(TSynchroObject)
  public
    FSection:TRTLCriticalSection;//f4
    destructor Destroy; virtual;//0042F3A0
    procedure Acquire; virtual;//v0//0042F3D0
    procedure Release; virtual;//v4//0042F3DC
    constructor Create;//0042F360
    procedure Enter;//0042F3E8
    procedure Leave;//0042F3F0
  end;
    procedure sub_0042F358;//0042F358
    procedure sub_0042F35C;//0042F35C
    destructor Destroy;//0042F3A0
    procedure Acquire;//0042F3D0
    procedure Release;//0042F3DC

implementation

//0042F358
procedure sub_0042F358;
begin
{*
 0042F358    ret
*}
end;

//0042F35C
procedure sub_0042F35C;
begin
{*
 0042F35C    ret
*}
end;

//0042F360
constructor TCriticalSection.Create;
begin
{*
 0042F360    push        ebx
 0042F361    push        esi
 0042F362    test        dl,dl
>0042F364    je          0042F36E
 0042F366    add         esp,0FFFFFFF0
 0042F369    call        @ClassCreate
 0042F36E    mov         ebx,edx
 0042F370    mov         esi,eax
 0042F372    xor         edx,edx
 0042F374    mov         eax,esi
 0042F376    call        TObject.Create
 0042F37B    lea         eax,[esi+4]
 0042F37E    push        eax
 0042F37F    call        KERNEL32.InitializeCriticalSection
 0042F384    mov         eax,esi
 0042F386    test        bl,bl
>0042F388    je          0042F399
 0042F38A    call        @AfterConstruction
 0042F38F    pop         dword ptr fs:[0]
 0042F396    add         esp,0C
 0042F399    mov         eax,esi
 0042F39B    pop         esi
 0042F39C    pop         ebx
 0042F39D    ret
*}
end;

//0042F3A0
destructor TCriticalSection.Destroy;
begin
{*
 0042F3A0    push        ebx
 0042F3A1    push        esi
 0042F3A2    call        @BeforeDestruction
 0042F3A7    mov         ebx,edx
 0042F3A9    mov         esi,eax
 0042F3AB    lea         eax,[esi+4]
 0042F3AE    push        eax
 0042F3AF    call        KERNEL32.DeleteCriticalSection
 0042F3B4    mov         edx,ebx
 0042F3B6    and         dl,0FC
 0042F3B9    mov         eax,esi
 0042F3BB    call        TObject.Destroy
 0042F3C0    test        bl,bl
>0042F3C2    jle         0042F3CB
 0042F3C4    mov         eax,esi
 0042F3C6    call        @ClassDestroy
 0042F3CB    pop         esi
 0042F3CC    pop         ebx
 0042F3CD    ret
*}
end;

//0042F3D0
procedure TCriticalSection.Acquire;
begin
{*
 0042F3D0    add         eax,4
 0042F3D3    push        eax
 0042F3D4    call        KERNEL32.EnterCriticalSection
 0042F3D9    ret
*}
end;

//0042F3DC
procedure TCriticalSection.Release;
begin
{*
 0042F3DC    add         eax,4
 0042F3DF    push        eax
 0042F3E0    call        KERNEL32.LeaveCriticalSection
 0042F3E5    ret
*}
end;

//0042F3E8
procedure TCriticalSection.Enter;
begin
{*
 0042F3E8    mov         edx,dword ptr [eax]
 0042F3EA    call        dword ptr [edx]
 0042F3EC    ret
*}
end;

//0042F3F0
procedure TCriticalSection.Leave;
begin
{*
 0042F3F0    mov         edx,dword ptr [eax]
 0042F3F2    call        dword ptr [edx+4]
 0042F3F5    ret
*}
end;

end.