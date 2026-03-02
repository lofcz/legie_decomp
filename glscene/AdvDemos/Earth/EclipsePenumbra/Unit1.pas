unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    EDTotalEclipseRadius: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure EDTotalEclipseRadiusKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses VectorGeometry, GLMisc;

function DiskArcSurface(diskRadius, sliceAngleRadians : Single) : Single;
begin
   Result:=Sqr(diskRadius)*( sliceAngleRadians        // whole slice surface
                            -0.5*Sin(2*sliceAngleRadians)); // slice triangle surface
end;

procedure DiskDiskIntersect(disk1Radius, disk2Radius, centersDistance : Single;
                            var disk1Alpha, disk2Alpha : Single);
var
   px : Single;
begin
   {  px²+py² = r1²
      (cd-px)²+py² = r2²  ->  cd² - 2.cd.px + px² + py² = r2²
                          ->  px = (r1² + cd² - r2²)/2.cd }
   px:=(Sqr(disk1Radius)+Sqr(centersDistance)-Sqr(disk2Radius))/(2*centersDistance);
   disk1Alpha:=ArcCos(px/disk1Radius);
   disk2Alpha:=ArcCos((centersDistance-px)/disk2Radius);
end;

function VisibleSurface(diskRadius, occultingDiskRadius, occultingDiskCenterDelta : Single) : Single;
var
   u, r0Pr1, r0Mr1, diskAlpha, occludingAlpha : Single;
begin
   u:=occultingDiskCenterDelta;
   r0Pr1:=diskRadius+occultingDiskRadius;
   r0Mr1:=Abs(diskRadius-occultingDiskRadius);
   Result:=PI*Sqr(diskRadius);
   if u>=r0Pr1 then
      Exit
   else if u>r0Mr1 then begin
      DiskDiskIntersect(diskRadius, occultingDiskRadius, occultingDiskCenterDelta,
                        diskAlpha, occludingAlpha);
      Result:= Result
              -DiskArcSurface(diskRadius, diskAlpha)
              -DiskArcSurface(occultingDiskRadius, occludingAlpha);
   end else Result:=Result-PI*Sqr(MinFloat(diskRadius, occultingDiskRadius));
end;

function Penumbra(radius, teRadius : Single) : Single;
var
   sunRadius, moonRadius, centerDelta : Single;
begin
{   if radius>teRadius then begin
      if radius>1 then
         Result:=1
      else begin }
         moonRadius:=1;
         //
         sunRadius:=moonRadius-teRadius*(1/400);
         centerDelta:=(moonRadius+sunRadius)*(radius-teRadius)/(1-teRadius);
         Result:=VisibleSurface(sunRadius, moonRadius, centerDelta);
         Result:=Result/(PI*Sqr(sunRadius));
{      end;
   end else Result:=0;}
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   bmp : TBitmap;
   y, x : Integer;
   col : TColor;
   teRadius, r, intensity : Single;
begin
   teRadius:=StrToFloatDef(EDTotalEclipseRadius.Text, 0);
   bmp:=TBitmap.Create;
   bmp.PixelFormat:=pf24bit;
   bmp.Width:=256;
   bmp.Height:=256;
   for y:=0 to 127 do begin
      for x:=0 to 127 do begin
         r:=Sqrt(Sqr(127.5-x)+Sqr(127.5-y))*(1/126.5);
         intensity:=Penumbra(r, teRadius);
         col:=RGB(Round(intensity*255), Round(intensity*255), Round(intensity*255));
         with bmp.Canvas do begin
            Pixels[x, y]:=col;
            Pixels[x, 255-y]:=col;
            Pixels[255-x, y]:=col;
            Pixels[255-x, 255-y]:=col;
         end;
      end;
   end;
   Image1.Picture.Bitmap:=bmp;
   bmp.Free;
end;

procedure TForm1.EDTotalEclipseRadiusKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key=#13 then begin
      Button1Click(Self);
      Key:=#0;
   end;
end;

end.
