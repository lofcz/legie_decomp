//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Contnrs;

interface

uses
  SysUtils, Classes;

type
  TObjectList = class(TList)
  public
    FOwnsObjects:Boolean;//f10
    procedure Notify(Ptr:Pointer; Action:TListNotification); virtual;//v4//0042D514
    constructor Create;//0042D478
    constructor Create(AOwnsObjects:Boolean);//0042D4B4
    procedure Insert(Index:Integer; AObject:TObject);//0042D50C
  end;
  TOrderedList = class(TObject)
  public
    FList:TList;//f4
    destructor Destroy; virtual;//0042D59C
    procedure PushItem; virtual; abstract;//v0//00402BEC
    function PopItem:Pointer; virtual;//v4//0042D5E0
    function PeekItem:Pointer; virtual;//v8//0042D5CC
    function Pop:Pointer;//0042D540
    function Push(AItem:Pointer):Pointer;//0042D548
    constructor Create;//0042D558
  end;
  TStack = class(TOrderedList)
  public
    procedure PushItem(AItem:Pointer); virtual;//v0//0042D600
  end;
    procedure sub_0042D470;//0042D470
    function GetItems(Index:Integer):TClass;//0042D4F8
    procedure Notify(Ptr:Pointer; Action:TListNotification);//0042D514
    destructor Destroy;//0042D59C
    function PeekItem:Pointer;//0042D5CC
    function PopItem:Pointer;//0042D5E0
    procedure PushItem(AItem:Pointer);//0042D600

implementation

//0042D470
procedure sub_0042D470;
begin
{*
 0042D470    call        TList.Add
 0042D475    ret
*}
end;

//0042D478
constructor TObjectList.Create;
begin
{*
 0042D478    push        ebx
 0042D479    push        esi
 0042D47A    test        dl,dl
>0042D47C    je          0042D486
 0042D47E    add         esp,0FFFFFFF0
 0042D481    call        @ClassCreate
 0042D486    mov         ebx,edx
 0042D488    mov         esi,eax
 0042D48A    xor         edx,edx
 0042D48C    mov         eax,esi
 0042D48E    call        TObject.Create
 0042D493    mov         byte ptr [esi+10],1
 0042D497    mov         eax,esi
 0042D499    test        bl,bl
>0042D49B    je          0042D4AC
 0042D49D    call        @AfterConstruction
 0042D4A2    pop         dword ptr fs:[0]
 0042D4A9    add         esp,0C
 0042D4AC    mov         eax,esi
 0042D4AE    pop         esi
 0042D4AF    pop         ebx
 0042D4B0    ret
*}
end;

//0042D4B4
constructor TObjectList.Create(AOwnsObjects:Boolean);
begin
{*
 0042D4B4    push        ebp
 0042D4B5    mov         ebp,esp
 0042D4B7    push        ecx
 0042D4B8    push        ebx
 0042D4B9    push        esi
 0042D4BA    test        dl,dl
>0042D4BC    je          0042D4C6
 0042D4BE    add         esp,0FFFFFFF0
 0042D4C1    call        @ClassCreate
 0042D4C6    mov         ebx,ecx
 0042D4C8    mov         byte ptr [ebp-1],dl
 0042D4CB    mov         esi,eax
 0042D4CD    xor         edx,edx
 0042D4CF    mov         eax,esi
 0042D4D1    call        TObject.Create
 0042D4D6    mov         byte ptr [esi+10],bl
 0042D4D9    mov         eax,esi
 0042D4DB    cmp         byte ptr [ebp-1],0
>0042D4DF    je          0042D4F0
 0042D4E1    call        @AfterConstruction
 0042D4E6    pop         dword ptr fs:[0]
 0042D4ED    add         esp,0C
 0042D4F0    mov         eax,esi
 0042D4F2    pop         esi
 0042D4F3    pop         ebx
 0042D4F4    pop         ecx
 0042D4F5    pop         ebp
 0042D4F6    ret
*}
end;

//0042D4F8
function TClassList.GetItems(Index:Integer):TClass;
begin
{*
 0042D4F8    push        ebx
 0042D4F9    push        esi
 0042D4FA    mov         esi,edx
 0042D4FC    mov         ebx,eax
 0042D4FE    mov         edx,esi
 0042D500    mov         eax,ebx
 0042D502    call        TList.Get
 0042D507    pop         esi
 0042D508    pop         ebx
 0042D509    ret
*}
end;

//0042D50C
procedure TObjectList.Insert(Index:Integer; AObject:TObject);
begin
{*
 0042D50C    call        TList.Insert
 0042D511    ret
*}
end;

//0042D514
procedure TObjectList.Notify(Ptr:Pointer; Action:TListNotification);
begin
{*
 0042D514    push        ebx
 0042D515    push        esi
 0042D516    push        edi
 0042D517    mov         ebx,ecx
 0042D519    mov         edi,edx
 0042D51B    mov         esi,eax
 0042D51D    cmp         byte ptr [esi+10],0
>0042D521    je          0042D52F
 0042D523    cmp         bl,2
>0042D526    jne         0042D52F
 0042D528    mov         eax,edi
 0042D52A    call        TObject.Free
 0042D52F    mov         ecx,ebx
 0042D531    mov         edx,edi
 0042D533    mov         eax,esi
 0042D535    call        TList.Notify
 0042D53A    pop         edi
 0042D53B    pop         esi
 0042D53C    pop         ebx
 0042D53D    ret
*}
end;

//0042D540
function TOrderedList.Pop:Pointer;
begin
{*
 0042D540    mov         edx,dword ptr [eax]
 0042D542    call        dword ptr [edx+4]
 0042D545    ret
*}
end;

//0042D548
function TOrderedList.Push(AItem:Pointer):Pointer;
begin
{*
 0042D548    push        ebx
 0042D549    mov         ebx,edx
 0042D54B    mov         edx,ebx
 0042D54D    mov         ecx,dword ptr [eax]
 0042D54F    call        dword ptr [ecx]
 0042D551    mov         eax,ebx
 0042D553    pop         ebx
 0042D554    ret
*}
end;

//0042D558
constructor TOrderedList.Create;
begin
{*
 0042D558    push        ebx
 0042D559    push        esi
 0042D55A    test        dl,dl
>0042D55C    je          0042D566
 0042D55E    add         esp,0FFFFFFF0
 0042D561    call        @ClassCreate
 0042D566    mov         ebx,edx
 0042D568    mov         esi,eax
 0042D56A    xor         edx,edx
 0042D56C    mov         eax,esi
 0042D56E    call        TObject.Create
 0042D573    mov         dl,1
 0042D575    mov         eax,[00417CEC];TList
 0042D57A    call        TObject.Create
 0042D57F    mov         dword ptr [esi+4],eax
 0042D582    mov         eax,esi
 0042D584    test        bl,bl
>0042D586    je          0042D597
 0042D588    call        @AfterConstruction
 0042D58D    pop         dword ptr fs:[0]
 0042D594    add         esp,0C
 0042D597    mov         eax,esi
 0042D599    pop         esi
 0042D59A    pop         ebx
 0042D59B    ret
*}
end;

//0042D59C
destructor TOrderedList.Destroy;
begin
{*
 0042D59C    push        ebx
 0042D59D    push        esi
 0042D59E    call        @BeforeDestruction
 0042D5A3    mov         ebx,edx
 0042D5A5    mov         esi,eax
 0042D5A7    mov         eax,dword ptr [esi+4]
 0042D5AA    call        TObject.Free
 0042D5AF    mov         edx,ebx
 0042D5B1    and         dl,0FC
 0042D5B4    mov         eax,esi
 0042D5B6    call        TObject.Destroy
 0042D5BB    test        bl,bl
>0042D5BD    jle         0042D5C6
 0042D5BF    mov         eax,esi
 0042D5C1    call        @ClassDestroy
 0042D5C6    pop         esi
 0042D5C7    pop         ebx
 0042D5C8    ret
*}
end;

//0042D5CC
function TOrderedList.PeekItem:Pointer;
begin
{*
 0042D5CC    mov         edx,dword ptr [eax+4]
 0042D5CF    mov         ecx,dword ptr [edx+8]
 0042D5D2    dec         ecx
 0042D5D3    mov         eax,edx
 0042D5D5    mov         edx,ecx
 0042D5D7    call        TList.Get
 0042D5DC    ret
*}
end;

//0042D5E0
function TOrderedList.PopItem:Pointer;
begin
{*
 0042D5E0    push        ebx
 0042D5E1    push        esi
 0042D5E2    mov         ebx,eax
 0042D5E4    mov         eax,ebx
 0042D5E6    mov         edx,dword ptr [eax]
 0042D5E8    call        dword ptr [edx+8]
 0042D5EB    mov         esi,eax
 0042D5ED    mov         eax,dword ptr [ebx+4]
 0042D5F0    mov         edx,dword ptr [eax+8]
 0042D5F3    dec         edx
 0042D5F4    call        TList.Delete
 0042D5F9    mov         eax,esi
 0042D5FB    pop         esi
 0042D5FC    pop         ebx
 0042D5FD    ret
*}
end;

//0042D600
procedure TStack.PushItem(AItem:Pointer);
begin
{*
 0042D600    mov         eax,dword ptr [eax+4]
 0042D603    call        TList.Add
 0042D608    ret
*}
end;

end.