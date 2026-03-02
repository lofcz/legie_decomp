//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
program legie_unpacked;

uses
  SysUtils, Classes;

{$R *.res}

//005AB9BC
begin
{*
 005AB9BC    push        ebp
 005AB9BD    mov         ebp,esp
 005AB9BF    add         esp,0FFFFFFF0
 005AB9C2    mov         eax,5AB5F4
 005AB9C7    call        @InitExe
 005AB9CC    push        5ABA4C;'legie'
 005AB9D1    push        0
 005AB9D3    push        0
 005AB9D5    call        00406A9C
 005AB9DA    call        KERNEL32.GetLastError
 005AB9DF    cmp         eax,0B7
>005AB9E4    jne         005ABA06
 005AB9E6    push        0
 005AB9E8    push        0
 005AB9EA    push        5ABA4C;'legie'
 005AB9EF    call        user32.RegisterWindowMessageA
 005AB9F4    push        eax
 005AB9F5    push        0FFFF
 005AB9FA    call        user32.SendMessageA
 005AB9FF    xor         eax,eax
 005ABA01    call        @Halt
 005ABA06    mov         eax,[005AE584];^Application:TApplication
 005ABA0B    mov         eax,dword ptr [eax]
 005ABA0D    call        TApplication.Initialize
 005ABA12    mov         eax,[005AE584];^Application:TApplication
 005ABA17    mov         eax,dword ptr [eax]
 005ABA19    mov         edx,5ABA5C;'Legie'
 005ABA1E    call        TApplication.SetTitle
 005ABA23    mov         ecx,dword ptr ds:[5AE734];^gvar_005F5524:TForm1
 005ABA29    mov         eax,[005AE584];^Application:TApplication
 005ABA2E    mov         eax,dword ptr [eax]
 005ABA30    mov         edx,dword ptr ds:[561598];TForm1
 005ABA36    call        TApplication.CreateForm
 005ABA3B    mov         eax,[005AE584];^Application:TApplication
 005ABA40    mov         eax,dword ptr [eax]
 005ABA42    call        TApplication.Run
 005ABA47    call        @Halt0
*}
end.
