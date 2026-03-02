{
  Legie - Sound System
  Decompiled from _Unit64.pas (15 functions, 878 asm lines)
  
  Uses FMOD 3.75 (fmod.dll) for audio playback.
  Sound effects loaded as samples from PAK, music streamed from memory.
  
  Original FMOD import thunks (_Unit63) are replaced by fmod.pas unit.
  FPU control word handling from _Unit63 init/finalization is in FMODApi.pas.
}
unit SoundSystem;

interface

uses
  Classes, SysUtils, fmod, fmodtypes, LegieTypes;

function  SoundInit: Boolean;
procedure SoundShutdown;
function  LoadAllSFX: Boolean;
procedure PlayMusic(Track: Byte);
procedure StopMusic;
procedure StopAmbient;
function  IsMusicNearEnd: Boolean;
procedure PlaySFX(Index: Byte; Volume: Byte);
procedure StopAllSounds;
function  GetVolumePercent: Integer;
procedure SetVolumePercent(Pct: Byte);
procedure PlayStartupMusic;

implementation

{ Forward declaration for internal helpers }
procedure LoadSFXSample(Index: Integer; const FileName: AnsiString;
  var Success: Boolean); forward;
procedure PlayMusicStream(var Stream: PFSoundStream; Channel: Byte;
  Volume: Byte; Loop: Boolean; Source: TMemoryStream); forward;
function  ToggleSFXMode: Boolean; forward;

{ Returns the PAK file component from Form1 (offset $37C in TForm1) }
function GetPAKStream(const FileName: AnsiString): TStream;
var
  F: TObject;
begin
  F := TObject(Form1Ref);
  { Form1.pak is at field offset $37C -- the TGLVfsPAK component }
  { Original: mov eax,[eax+37C]; call 004A3668 (PAKGetStream) }
  Result := nil;
  // PAKGetStream is called via the PAK component's virtual method
  // This will be linked at integration time via GLVfsPAK
end;

// ─────────────────────────────────────────────────────────
// SoundInit (00560438)
//   FSOUND_Init(44100, 32, 0); on fail try FSOUND_SetOutput(0)
//   Set master volume from registry setting
// ─────────────────────────────────────────────────────────
function SoundInit: Boolean;
begin
  Result := FSOUND_Init(44100, 32, 0);
  if not Result then
    FSOUND_SetOutput(FSOUND_OUTPUT_NOSOUND);
  FSOUND_SetSFXMasterVolume(MasterVolume);
end;

// ─────────────────────────────────────────────────────────
// SoundShutdown (00560464)
// ─────────────────────────────────────────────────────────
procedure SoundShutdown;
begin
  FSOUND_Close;
end;

// ─────────────────────────────────────────────────────────
// LoadSFXSample (0056046C)
//   Load a single SFX from PAK into SFXSamples[Index].
//   EAX=Index, EDX=FileName, [EBP+8]=Success var
// ─────────────────────────────────────────────────────────
procedure LoadSFXSample(Index: Integer; const FileName: AnsiString;
  var Success: Boolean);
var
  MS: TMemoryStream;
  Strm: TStream;
begin
  MS := TMemoryStream.Create;
  try
    Strm := GetPAKStream(FileName);
    if Strm <> nil then
      MS.LoadFromStream(Strm);
    SFXSamples[Index] := FSOUND_Sample_Load(FSOUND_FREE,
      MS.Memory, FSOUND_LOADMEMORY, 0, MS.Size);
    if SFXSamples[Index] = nil then
      Success := False;
  finally
    MS.Free;
  end;
end;

// ─────────────────────────────────────────────────────────
// LoadAllSFX (00560514)
//   Load all 61 SFX samples + 10 music streams from PAK.
//   Full version loads extra tracks; demo skips some.
// ─────────────────────────────────────────────────────────
function LoadAllSFX: Boolean;
var
  Strm: TStream;
begin
  Result := True;

  { SFX samples: 0-14, 20-60 }
  LoadSFXSample(SFX_DITE,     'dite.ogg',     Result);
  LoadSFXSample(SFX_PTACI,    'ptaci.ogg',    Result);
  LoadSFXSample(SFX_KRYSA,    'krysa.ogg',    Result);
  LoadSFXSample(SFX_DVERE,    'dvere.ogg',    Result);
  LoadSFXSample(SFX_ZVON,     'zvon.ogg',     Result);
  LoadSFXSample(SFX_PIVO,     'pivo.ogg',     Result);
  LoadSFXSample(SFX_MINCE,    'mince.ogg',    Result);
  LoadSFXSample(SFX_LOUC,     'louc.ogg',     Result);
  LoadSFXSample(SFX_KROK1,    'krok1.ogg',    Result);
  LoadSFXSample(SFX_KROK2,    'krok2.ogg',    Result);
  LoadSFXSample(SFX_KROKB1,   'krokb1.ogg',   Result);
  LoadSFXSample(SFX_KROKB2,   'krokb2.ogg',   Result);
  LoadSFXSample(SFX_ZAMCENO,  'zamceno.ogg',  Result);
  LoadSFXSample(SFX_KLIKA,    'klika.ogg',    Result);
  LoadSFXSample(SFX_VYBUCH,   'vybuch.ogg',   Result);
  { gap: indices $0F-$13 unused }
  LoadSFXSample(SFX_KOVAR1,   'kovar1.ogg',   Result);
  LoadSFXSample(SFX_KOVAR2,   'kovar2.ogg',   Result);
  LoadSFXSample(SFX_KOVAR0,   'kovar0.ogg',   Result);
  LoadSFXSample(SFX_KRIK,     'krik.ogg',     Result);
  LoadSFXSample(SFX_BRANA,    'brana.ogg',    Result);
  LoadSFXSample(SFX_CAK0,     'cak0.ogg',     Result);
  LoadSFXSample(SFX_CVAK,     'cvak.ogg',     Result);
  LoadSFXSample(SFX_VRZ2,     'vrz2.ogg',     Result);
  LoadSFXSample(SFX_CACHTANI, 'cachtani.ogg', Result);
  LoadSFXSample(SFX_KUN,      'kun.ogg',      Result);
  LoadSFXSample(SFX_SEK,      'sek.ogg',      Result);
  LoadSFXSample(SFX_ODEMK,    'odemk.ogg',    Result);
  LoadSFXSample(SFX_VRZ,      'vrz.ogg',      Result);
  LoadSFXSample(SFX_HOROR,    'horor.ogg',    Result);
  LoadSFXSample(SFX_TYC,      'tyc.ogg',      Result);
  LoadSFXSample(SFX_KYBL,     'kybl.ogg',     Result);
  LoadSFXSample(SFX_UHLI,     'uhli.ogg',     Result);
  LoadSFXSample(SFX_PAKA,     'paka.ogg',     Result);
  LoadSFXSample(SFX_PRAMEN,   'pramen.ogg',   Result);
  LoadSFXSample(SFX_ZAPAL,    'zapal.ogg',    Result);
  LoadSFXSample(SFX_OHEN,     'ohen.ogg',     Result);
  LoadSFXSample(SFX_SKRT,     'skrt.ogg',     Result);
  LoadSFXSample(SFX_ZAMC,     'zamc.ogg',     Result);
  LoadSFXSample(SFX_VZDUCH,   'vzduch.ogg',   Result);
  LoadSFXSample(SFX_DOHOR,    'dohor.ogg',    Result);
  LoadSFXSample(SFX_MON_0_Z,  'mon_0_z.ogg',  Result);
  LoadSFXSample(SFX_SEK2,     'sek2.ogg',     Result);
  LoadSFXSample(SFX_SEK3,     'sek3.ogg',     Result);
  LoadSFXSample(SFX_MON_0_S,  'mon_0_s.ogg',  Result);
  LoadSFXSample(SFX_HADR,     'hadr.ogg',     Result);
  LoadSFXSample(SFX_ZBROJ,    'zbroj.ogg',    Result);
  LoadSFXSample(SFX_DUM,      'dum.ogg',      Result);
  LoadSFXSample(SFX_MON_0_X,  'mon_0_x.ogg',  Result);
  LoadSFXSample(SFX_MON_2_A,  'mon_2_a.ogg',  Result);
  LoadSFXSample(SFX_MON_2_B,  'mon_2_b.ogg',  Result);
  LoadSFXSample(SFX_MON_1_A,  'mon_1_a.ogg',  Result);
  LoadSFXSample(SFX_MON_1_B,  'mon_1_b.ogg',  Result);
  LoadSFXSample(SFX_MON_1_C,  'mon_1_c.ogg',  Result);
  LoadSFXSample(SFX_AU,       'au.ogg',       Result);
  LoadSFXSample(SFX_DUM2,     'dum2.ogg',     Result);
  LoadSFXSample(SFX_VINO,     'vino.ogg',     Result);

  { Music stream buffers - always loaded }
  StreamDungeon := TMemoryStream.Create;
  Strm := GetPAKStream('dungeon.ogg');
  if Strm <> nil then StreamDungeon.LoadFromStream(Strm);

  StreamBourka := TMemoryStream.Create;
  Strm := GetPAKStream('bourka.ogg');
  if Strm <> nil then StreamBourka.LoadFromStream(Strm);

  { Full version only tracks }
  if not IsDemo then
  begin
    StreamDrezina := TMemoryStream.Create;
    Strm := GetPAKStream('drezina.ogg');
    if Strm <> nil then StreamDrezina.LoadFromStream(Strm);

    StreamBitva := TMemoryStream.Create;
    Strm := GetPAKStream('bitva.ogg');
    if Strm <> nil then StreamBitva.LoadFromStream(Strm);

    StreamLes := TMemoryStream.Create;
    Strm := GetPAKStream('les.ogg');
    if Strm <> nil then StreamLes.LoadFromStream(Strm);

    StreamAmbient := TMemoryStream.Create;
    Strm := GetPAKStream('ambient.ogg');
    if Strm <> nil then StreamAmbient.LoadFromStream(Strm);
  end;

  { Always loaded }
  StreamMesto := TMemoryStream.Create;
  Strm := GetPAKStream('mesto.ogg');
  if Strm <> nil then StreamMesto.LoadFromStream(Strm);

  StreamTempHudba := TMemoryStream.Create;
  Strm := GetPAKStream('temphudba.ogg');
  if Strm <> nil then StreamTempHudba.LoadFromStream(Strm);

  StreamDudy := TMemoryStream.Create;
  Strm := GetPAKStream('dudy.ogg');
  if Strm <> nil then StreamDudy.LoadFromStream(Strm);

  StreamSudokop := TMemoryStream.Create;
  Strm := GetPAKStream('sudokop.ogg');
  if Strm <> nil then StreamSudokop.LoadFromStream(Strm);
end;

// ─────────────────────────────────────────────────────────
// PlayMusicStream (00560FD8)
//   Open+play a music stream from a TMemoryStream buffer.
//   Stream: ptr to PFSoundStream to fill; Channel: playback channel;
//   Volume: 0-255; Loop: loop mode; Source: memory buffer.
// ─────────────────────────────────────────────────────────
procedure PlayMusicStream(var Stream: PFSoundStream; Channel: Byte;
  Volume: Byte; Loop: Boolean; Source: TMemoryStream);
var
  Ch: Integer;
begin
  Stream := FSOUND_Stream_Open(Source.Memory,
    FSOUND_LOADMEMORY, 0, Source.Size);
  if Stream = nil then Exit;

  if Loop then
    FSOUND_Stream_SetMode(Stream, FSOUND_LOOP_NORMAL)
  else
    FSOUND_Stream_SetMode(Stream, FSOUND_LOOP_OFF);

  Ch := FSOUND_Stream_Play(Channel, Stream);
  FSOUND_SetVolume(Ch, Volume);
end;

// ─────────────────────────────────────────────────────────
// ToggleSFXMode (00561048)
//   Cycles SFXToggle 0->1->2->0. Returns True if was 0.
// ─────────────────────────────────────────────────────────
function ToggleSFXMode: Boolean;
begin
  Result := (SFXToggle = 0);
  Inc(SFXToggle);
  if SFXToggle > 2 then
    SFXToggle := 0;
end;

// ─────────────────────────────────────────────────────────
// PlayMusic (00561070)
//   Play a music track by index. Switch/case on track.
//   Some tracks require SFX toggle confirmation.
// ─────────────────────────────────────────────────────────
procedure PlayMusic(Track: Byte);
begin
  case Track of
    MUS_BOURKA: begin   { 0 - bourka as ambient }
      if CurrentAmbient <> Track then
      begin
        PlayMusicStream(AmbientStream, 0, $FF, True, StreamBourka);
        CurrentAmbient := Track;
      end;
      FSOUND_SetVolume(0, $FF);
    end;

    MUS_MESTO: begin     { 1 - mesto }
      if CurrentMusic <> Track then
      begin
        if ToggleSFXMode then
        begin
          PlayMusicStream(MusicStream, 1, $2D, True, StreamMesto);
          CurrentMusic := Track;
        end else
          StopMusic;
      end;
    end;

    MUS_DUDY: begin      { 2 - dudy }
      PlayMusicStream(MusicStream, 1, $6E, True, StreamDudy);
      CurrentMusic := Track;
    end;

    MUS_LES: begin       { 3 - les }
      if CurrentMusic <> Track then
      begin
        if ToggleSFXMode then
        begin
          PlayMusicStream(MusicStream, 1, $A0, True, StreamLes);
          CurrentMusic := Track;
        end else
          StopMusic;
      end;
    end;

    MUS_BITVA: begin     { 4 - bitva (from dungeon stream) }
      if CurrentMusic <> Track then
      begin
        if ToggleSFXMode then
        begin
          PlayMusicStream(MusicStream, 1, $A0, True, StreamDungeon);
          CurrentMusic := Track;
        end else
          StopMusic;
      end;
    end;

    MUS_DUNGEON: begin   { 5 - dungeon (loop, from dungeon stream) }
      if CurrentMusic <> Track then
      begin
        PlayMusicStream(MusicStream, 1, $A0, True, StreamDungeon);
        CurrentMusic := Track;
      end;
    end;

    MUS_DREZINA: begin   { 6 - drezina }
      PlayMusicStream(MusicStream, 1, $A0, True, StreamDrezina);
      CurrentMusic := Track;
    end;

    MUS_AMBIENT: begin   { 7 - ambient (as ambient stream) }
      if CurrentAmbient <> Track then
      begin
        PlayMusicStream(AmbientStream, 0, $B4, True, StreamAmbient);
        CurrentAmbient := Track;
      end;
    end;

    8: begin             { 8 - bitva (loop, from bitva stream) }
      if CurrentMusic <> Track then
      begin
        PlayMusicStream(MusicStream, 1, $A0, True, StreamBitva);
        CurrentMusic := Track;
      end;
    end;

    MUS_TEMPHUDBA: begin { 9 - temphudba (loop, volume=0 initially) }
      if CurrentMusic <> Track then
      begin
        PlayMusicStream(MusicStream, 1, 0, True, StreamTempHudba);
        CurrentMusic := Track;
      end;
    end;

    MUS_SUDOKOP: begin   { 10 - sudokop }
      PlayMusicStream(MusicStream, 1, $B4, True, StreamSudokop);
      CurrentMusic := Track;
    end;
  end;
end;

// ─────────────────────────────────────────────────────────
// StopMusic (005612D8)
// ─────────────────────────────────────────────────────────
procedure StopMusic;
begin
  if MusicStream <> nil then
  begin
    FSOUND_Stream_Close(MusicStream);
    MusicStream := nil;
  end;
  CurrentMusic := -1;
end;

// ─────────────────────────────────────────────────────────
// StopAmbient (005612FC)
// ─────────────────────────────────────────────────────────
procedure StopAmbient;
begin
  if AmbientStream <> nil then
  begin
    FSOUND_Stream_Close(AmbientStream);
    AmbientStream := nil;
  end;
  CurrentAmbient := -1;
end;

// ─────────────────────────────────────────────────────────
// IsMusicNearEnd (00561320)
//   Returns True if music stream position >= length - 300ms
// ─────────────────────────────────────────────────────────
function IsMusicNearEnd: Boolean;
var
  Len, Pos: Integer;
begin
  Len := FSOUND_Stream_GetLengthMs(MusicStream) + 300;
  Pos := FSOUND_Stream_GetTime(MusicStream);
  Result := (Pos >= Len);
end;

// ─────────────────────────────────────────────────────────
// PlaySFX (00561358)
//   Play sound effect at given volume. Volume=0 means don't play.
//   Special handling for looping sounds (indices 7,28,38,40).
// ─────────────────────────────────────────────────────────
procedure PlaySFX(Index: Byte; Volume: Byte);
var
  Ch: Integer;
begin
  if Volume = 0 then Exit;

  Ch := FSOUND_PlaySound(FSOUND_FREE, SFXSamples[Index]);
  FSOUND_SetVolume(Ch, Volume);

  { Louc/fire (SFX_LOUC=7) and Ohen (SFX_OHEN=$28): pan center, loop }
  if Index = SFX_LOUC then
  begin
    MusicChannel := Ch;
    FSOUND_SetPan(MusicChannel, $FF);
    FSOUND_SetLoopMode(MusicChannel, FSOUND_LOOP_NORMAL);
  end;

  { Cachtani/splashing ($1C): mute + loop when in area 6 }
  if Index = SFX_CACHTANI then
  begin
    if PByte(PChar(GameDataPtr) + $1F0)^ = 6 then
    begin
      SplashChannel := Ch;
      FSOUND_SetVolume(SplashChannel, 0);
      FSOUND_SetLoopMode(SplashChannel, FSOUND_LOOP_NORMAL);
    end;
  end;

  { Pramen/spring ($26): mute + loop }
  if Index = SFX_PRAMEN then
  begin
    SpringChannel := Ch;
    FSOUND_SetVolume(SpringChannel, 0);
    FSOUND_SetLoopMode(SpringChannel, FSOUND_LOOP_NORMAL);
  end;

  { Ohen/fire ($28): pan center, loop }
  if Index = SFX_OHEN then
  begin
    MusicChannel := Ch;
    FSOUND_SetPan(MusicChannel, $FF);
    FSOUND_SetLoopMode(MusicChannel, FSOUND_LOOP_NORMAL);
  end;
end;

// ─────────────────────────────────────────────────────────
// StopAllSounds (00561434)
//   Stop channels 2 through $20
// ─────────────────────────────────────────────────────────
procedure StopAllSounds;
var
  I: Integer;
begin
  for I := 2 to $20 do
    FSOUND_StopSound(I);
end;

// ─────────────────────────────────────────────────────────
// GetVolumePercent (0056144C)
//   Get master volume as 0..100 percentage
// ─────────────────────────────────────────────────────────
function GetVolumePercent: Integer;
begin
  Result := Round(FSOUND_GetSFXMasterVolume / 2.55);
  if Result > 100 then
    Result := 100;
end;

// ─────────────────────────────────────────────────────────
// SetVolumePercent (00561480)
//   Set master volume from 0..100 percentage
// ─────────────────────────────────────────────────────────
procedure SetVolumePercent(Pct: Byte);
begin
  FSOUND_SetSFXMasterVolume(Round(Pct * 2.55));
end;

// ─────────────────────────────────────────────────────────
// PlayStartupMusic (005614B0)
//   Play temphudba + ambient at startup
// ─────────────────────────────────────────────────────────
procedure PlayStartupMusic;
begin
  PlayMusic(MUS_TEMPHUDBA);
  PlayMusic(MUS_AMBIENT);
end;

end.
