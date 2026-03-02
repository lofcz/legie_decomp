program Legie;

uses
  Windows, Messages, SysUtils, Forms,
  Unit1 in 'Unit1.pas' {Form1},
  LegieTypes in 'LegieTypes.pas',
  SoundSystem in 'SoundSystem.pas',
  FMODApi in 'FMODApi.pas',
  GameTextTable in 'GameTextTable.pas',
  CutsceneSystem in 'CutsceneSystem.pas';

{$R *.res}

begin
  { Single-instance check disabled during development
    (IDE form designer window also has caption 'Legie') }

  try
    Application.Initialize;
    Application.Title := 'Legie';
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  except
    on E: Exception do
      MessageBox(0, PChar(E.ClassName + ': ' + E.Message),
        'Legie - Startup Error', MB_OK or MB_ICONERROR);
  end;
end.
