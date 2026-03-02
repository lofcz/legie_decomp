//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit30;

interface

uses
  SysUtils, Classes;

    function ShellExecuteA(Operation:PAnsiChar; FileName:PAnsiChar; Parameters:PAnsiChar; Directory:PAnsiChar; ShowCmd:Integer):HINST; stdcall;//0042FE5C

implementation

//0042FE5C
function shell32.ShellExecuteA(Operation:PAnsiChar; FileName:PAnsiChar; Parameters:PAnsiChar; Directory:PAnsiChar; ShowCmd:Integer):HINST; stdcall;
begin
{*
 0042FE5C    jmp         dword ptr ds:[608814]
*}
end;

end.