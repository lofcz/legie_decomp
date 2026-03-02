//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit94;

interface

uses
  SysUtils, Classes;

type
  TNodeList = TNodeList = record//size=0x14
f4:String;//f4
f8:String;//f8
end;;
  TBitmap3DS = TBitmap3DS = record//size=0x78
f0:String;//f0
end;;
  TMapSet3DS = TMapSet3DS = record//size=0xF0
f0:TBitmap3DS;//f0
f78:TBitmap3DS;//f78
end;;
  TRMapSet3DS = TRMapSet3DS = record//size=0x100
f0:TBitmap3DS;//f0
f88:TBitmap3DS;//f88
end;;
  TMaterial3DS = TMaterial3DS = record//size=0x7E4
f0:String;//f0
f54:TMapSet3DS;//f54
f144:TMapSet3DS;//f144
f234:TMapSet3DS;//f234
f324:TMapSet3DS;//f324
f414:TMapSet3DS;//f414
f504:TMapSet3DS;//f504
f5F4:TMapSet3DS;//f5F4
f6E4:TRMapSet3DS;//f6E4
end;;
  TObjMat3DS = TObjMat3DS = record//size=0xC
f0:String;//f0
end;;
  .1 = array [1..6] of String;
  TMesh3DS = TMesh3DS = record//size=0xF0
f0:String;//f0
fC0:.1;//fC0
fE8:String;//fE8
end;;
  TLight3DS = TLight3DS = record//size=0x38
f0:String;//f0
end;;
  TCamera3DS = TCamera3DS = record//size=0x30
f0:String;//f0
end;;
  TKFCamera3DS = TKFCamera3DS = record//size=0x54
f0:String;//f0
f4:String;//f4
f3C:String;//f3C
end;;
  TKFMesh3DS = TKFMesh3DS = record//size=0x84
f0:String;//f0
f4:String;//f4
f18:String;//f18
end;;
  TKFOmni3DS = TKFOmni3DS = record//size=0x2C
f0:String;//f0
f4:String;//f4
end;;
  TKFSpot3DS = TKFSpot3DS = record//size=0x74
f0:String;//f0
f4:String;//f4
f5C:String;//f5C
end;;

implementation

end.