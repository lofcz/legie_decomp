{
  FMOD 3.x API - Thin wrapper for Legie
  
  Uses the real FMOD 3.75 headers from fmod-3.75/api/delphi/.
  This unit handles FMOD_Load/FMOD_Unload and re-exports the 
  specific FSOUND functions used by the game.

  Import address -> FMOD function mapping (from _Unit63.pas analysis):
    004A1C60 -> FSOUND_SetOutput
    004A1C68 -> FSOUND_Init
    004A1C70 -> FSOUND_Close
    004A1C78 -> FSOUND_SetSFXMasterVolume
    004A1C80 -> FSOUND_GetSFXMasterVolume
    004A1C88 -> FSOUND_Sample_Load
    004A1C90 -> FSOUND_PlaySound
    004A1C98 -> FSOUND_StopSound
    004A1CA0 -> FSOUND_SetVolume
    004A1CA8 -> FSOUND_SetPan
    004A1CB0 -> FSOUND_SetLoopMode
    004A1CB8 -> FSOUND_Stream_Open
    004A1CC0 -> FSOUND_Stream_Play
    004A1CC8 -> FSOUND_Stream_Close
    004A1CD0 -> FSOUND_Stream_GetLengthMs
    004A1CD8 -> FSOUND_Stream_GetTime
    004A1CE0 -> FSOUND_Stream_SetMode

  The _Unit63 initialization section saves/restores the FPU control
  word (Set8087CW to $133F) which is standard for FMOD interop.
}
unit FMODApi;

interface

uses
  fmod, fmodtypes;

function  InitFMOD: Boolean;
procedure ShutdownFMOD;

implementation

var
  OldCW: Word;

function InitFMOD: Boolean;
begin
  OldCW := Get8087CW;
  Result := FMOD_Load(nil);
  if not Result then Exit;
  Set8087CW($133F);
end;

procedure ShutdownFMOD;
begin
  FMOD_Unload;
  Set8087CW(OldCW);
end;

end.
