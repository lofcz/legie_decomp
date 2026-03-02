//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit64;

interface

uses
  SysUtils, Classes;

    //function sub_00560438:?;//00560438
    procedure sub_00560464;//00560464
    //procedure sub_0056046C(?:?; ?:AnsiString; ?:?);//0056046C
    //function sub_00560514:?;//00560514
    //procedure sub_00560FD8(?:?; ?:?; ?:?; ?:?; ?:?);//00560FD8
    //function sub_00561048:?;//00561048
    //procedure sub_00561070(?:?);//00561070
    procedure sub_005612D8;//005612D8
    procedure sub_005612FC;//005612FC
    //function sub_00561320:?;//00561320
    //procedure sub_00561358(?:?; ?:?);//00561358
    procedure sub_00561434;//00561434
    //function sub_0056144C:?;//0056144C
    //procedure sub_00561480(?:?);//00561480
    procedure sub_005614B0;//005614B0

implementation

//00560438
{*function sub_00560438:?;
begin
 00560438    push        ebx
 00560439    push        0
 0056043B    push        20
 0056043D    push        0AC44
 00560442    call        004A1C68
 00560447    test        al,al
>00560449    jne         00560452
 0056044B    push        0
 0056044D    call        004A1C60
 00560452    mov         eax,[005AE340];^gvar_005F552C:Longint
 00560457    movzx       eax,byte ptr [eax]
 0056045A    push        eax
 0056045B    call        004A1C78
 00560460    mov         eax,ebx
 00560462    pop         ebx
 00560463    ret
end;*}

//00560464
procedure sub_00560464;
begin
{*
 00560464    call        004A1C70
 00560469    ret
*}
end;

//0056046C
{*procedure sub_0056046C(?:?; ?:AnsiString; ?:?);
begin
 0056046C    push        ebp
 0056046D    mov         ebp,esp
 0056046F    push        ecx
 00560470    push        ebx
 00560471    push        esi
 00560472    mov         dword ptr [ebp-4],edx
 00560475    mov         esi,eax
 00560477    mov         eax,dword ptr [ebp-4]
 0056047A    call        @LStrAddRef
 0056047F    xor         eax,eax
 00560481    push        ebp
 00560482    push        560507
 00560487    push        dword ptr fs:[eax]
 0056048A    mov         dword ptr fs:[eax],esp
 0056048D    mov         dl,1
 0056048F    mov         eax,[00418640];TMemoryStream
 00560494    call        TObject.Create;TMemoryStream.Create
 00560499    mov         ebx,eax
 0056049B    mov         eax,[005AE734];^gvar_005F5524:TForm1
 005604A0    mov         eax,dword ptr [eax]
 005604A2    mov         eax,dword ptr [eax+37C]
 005604A8    mov         edx,dword ptr [ebp-4]
 005604AB    call        004A3668
 005604B0    mov         edx,eax
 005604B2    mov         eax,ebx
 005604B4    call        TMemoryStream.LoadFromStream
 005604B9    mov         eax,ebx
 005604BB    mov         edx,dword ptr [eax]
 005604BD    call        dword ptr [edx];TStream.GetSize
 005604BF    push        eax
 005604C0    push        0
 005604C2    push        8000
 005604C7    mov         eax,dword ptr [ebx+4];TMemoryStream.FMemory:Pointer
 005604CA    push        eax
 005604CB    push        0FF
 005604CD    call        004A1C88
 005604D2    mov         dword ptr [esi*4+5F5380],eax;gvar_005F5380
 005604D9    mov         eax,ebx
 005604DB    call        TObject.Free
 005604E0    cmp         dword ptr [esi*4+5F5380],0;gvar_005F5380
>005604E8    jne         005604F1
 005604EA    mov         eax,dword ptr [ebp+8]
 005604ED    mov         byte ptr [eax-1],0
 005604F1    xor         eax,eax
 005604F3    pop         edx
 005604F4    pop         ecx
 005604F5    pop         ecx
 005604F6    mov         dword ptr fs:[eax],edx
 005604F9    push        56050E
 005604FE    lea         eax,[ebp-4]
 00560501    call        @LStrClr
 00560506    ret
>00560507    jmp         @HandleFinally
>0056050C    jmp         005604FE
 0056050E    pop         esi
 0056050F    pop         ebx
 00560510    pop         ecx
 00560511    pop         ebp
 00560512    ret
end;*}

//00560514
{*function sub_00560514:?;
begin
 00560514    push        ebp
 00560515    mov         ebp,esp
 00560517    push        ecx
 00560518    push        ebx
 00560519    mov         ebx,dword ptr ds:[5AE734];^gvar_005F5524:TForm1
 0056051F    mov         byte ptr [ebp-1],1
 00560523    push        ebp
 00560524    mov         edx,560ACC;'dite.ogg'
 00560529    xor         eax,eax
 0056052B    call        0056046C
 00560530    pop         ecx
 00560531    push        ebp
 00560532    mov         edx,560AE0;'ptaci.ogg'
 00560537    mov         eax,1
 0056053C    call        0056046C
 00560541    pop         ecx
 00560542    push        ebp
 00560543    mov         edx,560AF4;'krysa.ogg'
 00560548    mov         eax,2
 0056054D    call        0056046C
 00560552    pop         ecx
 00560553    push        ebp
 00560554    mov         edx,560B08;'dvere.ogg'
 00560559    mov         eax,3
 0056055E    call        0056046C
 00560563    pop         ecx
 00560564    push        ebp
 00560565    mov         edx,560B1C;'zvon.ogg'
 0056056A    mov         eax,4
 0056056F    call        0056046C
 00560574    pop         ecx
 00560575    push        ebp
 00560576    mov         edx,560B30;'pivo.ogg'
 0056057B    mov         eax,5
 00560580    call        0056046C
 00560585    pop         ecx
 00560586    push        ebp
 00560587    mov         edx,560B44;'mince.ogg'
 0056058C    mov         eax,6
 00560591    call        0056046C
 00560596    pop         ecx
 00560597    push        ebp
 00560598    mov         edx,560B58;'louc.ogg'
 0056059D    mov         eax,7
 005605A2    call        0056046C
 005605A7    pop         ecx
 005605A8    push        ebp
 005605A9    mov         edx,560B6C;'krok1.ogg'
 005605AE    mov         eax,8
 005605B3    call        0056046C
 005605B8    pop         ecx
 005605B9    push        ebp
 005605BA    mov         edx,560B80;'krok2.ogg'
 005605BF    mov         eax,9
 005605C4    call        0056046C
 005605C9    pop         ecx
 005605CA    push        ebp
 005605CB    mov         edx,560B94;'krokb1.ogg'
 005605D0    mov         eax,0A
 005605D5    call        0056046C
 005605DA    pop         ecx
 005605DB    push        ebp
 005605DC    mov         edx,560BA8;'krokb2.ogg'
 005605E1    mov         eax,0B
 005605E6    call        0056046C
 005605EB    pop         ecx
 005605EC    push        ebp
 005605ED    mov         edx,560BBC;'zamceno.ogg'
 005605F2    mov         eax,0C
 005605F7    call        0056046C
 005605FC    pop         ecx
 005605FD    push        ebp
 005605FE    mov         edx,560BD0;'klika.ogg'
 00560603    mov         eax,0D
 00560608    call        0056046C
 0056060D    pop         ecx
 0056060E    push        ebp
 0056060F    mov         edx,560BE4;'vybuch.ogg'
 00560614    mov         eax,0E
 00560619    call        0056046C
 0056061E    pop         ecx
 0056061F    push        ebp
 00560620    mov         edx,560BF8;'kovar1.ogg'
 00560625    mov         eax,14
 0056062A    call        0056046C
 0056062F    pop         ecx
 00560630    push        ebp
 00560631    mov         edx,560C0C;'kovar2.ogg'
 00560636    mov         eax,15
 0056063B    call        0056046C
 00560640    pop         ecx
 00560641    push        ebp
 00560642    mov         edx,560C20;'kovar0.ogg'
 00560647    mov         eax,16
 0056064C    call        0056046C
 00560651    pop         ecx
 00560652    push        ebp
 00560653    mov         edx,560C34;'krik.ogg'
 00560658    mov         eax,17
 0056065D    call        0056046C
 00560662    pop         ecx
 00560663    push        ebp
 00560664    mov         edx,560C48;'brana.ogg'
 00560669    mov         eax,18
 0056066E    call        0056046C
 00560673    pop         ecx
 00560674    push        ebp
 00560675    mov         edx,560C5C;'cak0.ogg'
 0056067A    mov         eax,19
 0056067F    call        0056046C
 00560684    pop         ecx
 00560685    push        ebp
 00560686    mov         edx,560C70;'cvak.ogg'
 0056068B    mov         eax,1A
 00560690    call        0056046C
 00560695    pop         ecx
 00560696    push        ebp
 00560697    mov         edx,560C84;'vrz2.ogg'
 0056069C    mov         eax,1B
 005606A1    call        0056046C
 005606A6    pop         ecx
 005606A7    push        ebp
 005606A8    mov         edx,560C98;'cachtani.ogg'
 005606AD    mov         eax,1C
 005606B2    call        0056046C
 005606B7    pop         ecx
 005606B8    push        ebp
 005606B9    mov         edx,560CB0;'kun.ogg'
 005606BE    mov         eax,1D
 005606C3    call        0056046C
 005606C8    pop         ecx
 005606C9    push        ebp
 005606CA    mov         edx,560CC0;'sek.ogg'
 005606CF    mov         eax,1E
 005606D4    call        0056046C
 005606D9    pop         ecx
 005606DA    push        ebp
 005606DB    mov         edx,560CD0;'odemk.ogg'
 005606E0    mov         eax,1F
 005606E5    call        0056046C
 005606EA    pop         ecx
 005606EB    push        ebp
 005606EC    mov         edx,560CE4;'vrz.ogg'
 005606F1    mov         eax,20
 005606F6    call        0056046C
 005606FB    pop         ecx
 005606FC    push        ebp
 005606FD    mov         edx,560CF4;'horor.ogg'
 00560702    mov         eax,21
 00560707    call        0056046C
 0056070C    pop         ecx
 0056070D    push        ebp
 0056070E    mov         edx,560D08;'tyc.ogg'
 00560713    mov         eax,22
 00560718    call        0056046C
 0056071D    pop         ecx
 0056071E    push        ebp
 0056071F    mov         edx,560D18;'kybl.ogg'
 00560724    mov         eax,23
 00560729    call        0056046C
 0056072E    pop         ecx
 0056072F    push        ebp
 00560730    mov         edx,560D2C;'uhli.ogg'
 00560735    mov         eax,24
 0056073A    call        0056046C
 0056073F    pop         ecx
 00560740    push        ebp
 00560741    mov         edx,560D40;'paka.ogg'
 00560746    mov         eax,25
 0056074B    call        0056046C
 00560750    pop         ecx
 00560751    push        ebp
 00560752    mov         edx,560D54;'pramen.ogg'
 00560757    mov         eax,26
 0056075C    call        0056046C
 00560761    pop         ecx
 00560762    push        ebp
 00560763    mov         edx,560D68;'zapal.ogg'
 00560768    mov         eax,27
 0056076D    call        0056046C
 00560772    pop         ecx
 00560773    push        ebp
 00560774    mov         edx,560D7C;'ohen.ogg'
 00560779    mov         eax,28
 0056077E    call        0056046C
 00560783    pop         ecx
 00560784    push        ebp
 00560785    mov         edx,560D90;'skrt.ogg'
 0056078A    mov         eax,29
 0056078F    call        0056046C
 00560794    pop         ecx
 00560795    push        ebp
 00560796    mov         edx,560DA4;'zamc.ogg'
 0056079B    mov         eax,2A
 005607A0    call        0056046C
 005607A5    pop         ecx
 005607A6    push        ebp
 005607A7    mov         edx,560DB8;'vzduch.ogg'
 005607AC    mov         eax,2B
 005607B1    call        0056046C
 005607B6    pop         ecx
 005607B7    push        ebp
 005607B8    mov         edx,560DCC;'dohor.ogg'
 005607BD    mov         eax,2C
 005607C2    call        0056046C
 005607C7    pop         ecx
 005607C8    push        ebp
 005607C9    mov         edx,560DE0;'mon_0_z.ogg'
 005607CE    mov         eax,2D
 005607D3    call        0056046C
 005607D8    pop         ecx
 005607D9    push        ebp
 005607DA    mov         edx,560DF4;'sek2.ogg'
 005607DF    mov         eax,2E
 005607E4    call        0056046C
 005607E9    pop         ecx
 005607EA    push        ebp
 005607EB    mov         edx,560E08;'sek3.ogg'
 005607F0    mov         eax,2F
 005607F5    call        0056046C
 005607FA    pop         ecx
 005607FB    push        ebp
 005607FC    mov         edx,560E1C;'mon_0_s.ogg'
 00560801    mov         eax,30
 00560806    call        0056046C
 0056080B    pop         ecx
 0056080C    push        ebp
 0056080D    mov         edx,560E30;'hadr.ogg'
 00560812    mov         eax,31
 00560817    call        0056046C
 0056081C    pop         ecx
 0056081D    push        ebp
 0056081E    mov         edx,560E44;'zbroj.ogg'
 00560823    mov         eax,32
 00560828    call        0056046C
 0056082D    pop         ecx
 0056082E    push        ebp
 0056082F    mov         edx,560E58;'dum.ogg'
 00560834    mov         eax,33
 00560839    call        0056046C
 0056083E    pop         ecx
 0056083F    push        ebp
 00560840    mov         edx,560E68;'mon_0_x.ogg'
 00560845    mov         eax,34
 0056084A    call        0056046C
 0056084F    pop         ecx
 00560850    push        ebp
 00560851    mov         edx,560E7C;'mon_2_a.ogg'
 00560856    mov         eax,35
 0056085B    call        0056046C
 00560860    pop         ecx
 00560861    push        ebp
 00560862    mov         edx,560E90;'mon_2_b.ogg'
 00560867    mov         eax,36
 0056086C    call        0056046C
 00560871    pop         ecx
 00560872    push        ebp
 00560873    mov         edx,560EA4;'mon_1_a.ogg'
 00560878    mov         eax,37
 0056087D    call        0056046C
 00560882    pop         ecx
 00560883    push        ebp
 00560884    mov         edx,560EB8;'mon_1_b.ogg'
 00560889    mov         eax,38
 0056088E    call        0056046C
 00560893    pop         ecx
 00560894    push        ebp
 00560895    mov         edx,560ECC;'mon_1_c.ogg'
 0056089A    mov         eax,39
 0056089F    call        0056046C
 005608A4    pop         ecx
 005608A5    push        ebp
 005608A6    mov         edx,560EE0;'au.ogg'
 005608AB    mov         eax,3A
 005608B0    call        0056046C
 005608B5    pop         ecx
 005608B6    push        ebp
 005608B7    mov         edx,560EF0;'dum2.ogg'
 005608BC    mov         eax,3B
 005608C1    call        0056046C
 005608C6    pop         ecx
 005608C7    push        ebp
 005608C8    mov         edx,560F04;'vino.ogg'
 005608CD    mov         eax,3C
 005608D2    call        0056046C
 005608D7    pop         ecx
 005608D8    mov         dl,1
 005608DA    mov         eax,[00418640];TMemoryStream
 005608DF    call        TObject.Create;TMemoryStream.Create
 005608E4    mov         [005F54F8],eax;gvar_005F54F8:TMemoryStream
 005608E9    mov         eax,dword ptr [ebx]
 005608EB    mov         eax,dword ptr [eax+37C]
 005608F1    mov         edx,560F18;'dungeon.ogg'
 005608F6    call        004A3668
 005608FB    mov         edx,eax
 005608FD    mov         eax,[005F54F8];gvar_005F54F8:TMemoryStream
 00560902    call        TMemoryStream.LoadFromStream
 00560907    mov         dl,1
 00560909    mov         eax,[00418640];TMemoryStream
 0056090E    call        TObject.Create;TMemoryStream.Create
 00560913    mov         [005F54FC],eax;gvar_005F54FC:TMemoryStream
 00560918    mov         eax,dword ptr [ebx]
 0056091A    mov         eax,dword ptr [eax+37C]
 00560920    mov         edx,560F2C;'bourka.ogg'
 00560925    call        004A3668
 0056092A    mov         edx,eax
 0056092C    mov         eax,[005F54FC];gvar_005F54FC:TMemoryStream
 00560931    call        TMemoryStream.LoadFromStream
 00560936    mov         eax,[005AE3B8];^gvar_005AE0C8
 0056093B    cmp         byte ptr [eax],0
>0056093E    jne         00560A00
 00560944    mov         dl,1
 00560946    mov         eax,[00418640];TMemoryStream
 0056094B    call        TObject.Create;TMemoryStream.Create
 00560950    mov         [005F5500],eax;gvar_005F5500:TMemoryStream
 00560955    mov         eax,dword ptr [ebx]
 00560957    mov         eax,dword ptr [eax+37C]
 0056095D    mov         edx,560F40;'drezina.ogg'
 00560962    call        004A3668
 00560967    mov         edx,eax
 00560969    mov         eax,[005F5500];gvar_005F5500:TMemoryStream
 0056096E    call        TMemoryStream.LoadFromStream
 00560973    mov         dl,1
 00560975    mov         eax,[00418640];TMemoryStream
 0056097A    call        TObject.Create;TMemoryStream.Create
 0056097F    mov         [005F5504],eax;gvar_005F5504:TMemoryStream
 00560984    mov         eax,dword ptr [ebx]
 00560986    mov         eax,dword ptr [eax+37C]
 0056098C    mov         edx,560F54;'bitva.ogg'
 00560991    call        004A3668
 00560996    mov         edx,eax
 00560998    mov         eax,[005F5504];gvar_005F5504:TMemoryStream
 0056099D    call        TMemoryStream.LoadFromStream
 005609A2    mov         dl,1
 005609A4    mov         eax,[00418640];TMemoryStream
 005609A9    call        TObject.Create;TMemoryStream.Create
 005609AE    mov         [005F550C],eax;gvar_005F550C:TMemoryStream
 005609B3    mov         eax,dword ptr [ebx]
 005609B5    mov         eax,dword ptr [eax+37C]
 005609BB    mov         edx,560F68;'les.ogg'
 005609C0    call        004A3668
 005609C5    mov         edx,eax
 005609C7    mov         eax,[005F550C];gvar_005F550C:TMemoryStream
 005609CC    call        TMemoryStream.LoadFromStream
 005609D1    mov         dl,1
 005609D3    mov         eax,[00418640];TMemoryStream
 005609D8    call        TObject.Create;TMemoryStream.Create
 005609DD    mov         [005F5510],eax;gvar_005F5510:TMemoryStream
 005609E2    mov         eax,dword ptr [ebx]
 005609E4    mov         eax,dword ptr [eax+37C]
 005609EA    mov         edx,560F78;'ambient.ogg'
 005609EF    call        004A3668
 005609F4    mov         edx,eax
 005609F6    mov         eax,[005F5510];gvar_005F5510:TMemoryStream
 005609FB    call        TMemoryStream.LoadFromStream
 00560A00    mov         dl,1
 00560A02    mov         eax,[00418640];TMemoryStream
 00560A07    call        TObject.Create;TMemoryStream.Create
 00560A0C    mov         [005F5508],eax;gvar_005F5508:TMemoryStream
 00560A11    mov         eax,dword ptr [ebx]
 00560A13    mov         eax,dword ptr [eax+37C]
 00560A19    mov         edx,560F8C;'mesto.ogg'
 00560A1E    call        004A3668
 00560A23    mov         edx,eax
 00560A25    mov         eax,[005F5508];gvar_005F5508:TMemoryStream
 00560A2A    call        TMemoryStream.LoadFromStream
 00560A2F    mov         dl,1
 00560A31    mov         eax,[00418640];TMemoryStream
 00560A36    call        TObject.Create;TMemoryStream.Create
 00560A3B    mov         [005F5514],eax;gvar_005F5514:TMemoryStream
 00560A40    mov         eax,dword ptr [ebx]
 00560A42    mov         eax,dword ptr [eax+37C]
 00560A48    mov         edx,560FA0;'temphudba.ogg'
 00560A4D    call        004A3668
 00560A52    mov         edx,eax
 00560A54    mov         eax,[005F5514];gvar_005F5514:TMemoryStream
 00560A59    call        TMemoryStream.LoadFromStream
 00560A5E    mov         dl,1
 00560A60    mov         eax,[00418640];TMemoryStream
 00560A65    call        TObject.Create;TMemoryStream.Create
 00560A6A    mov         [005F5518],eax;gvar_005F5518:TMemoryStream
 00560A6F    mov         eax,dword ptr [ebx]
 00560A71    mov         eax,dword ptr [eax+37C]
 00560A77    mov         edx,560FB8;'dudy.ogg'
 00560A7C    call        004A3668
 00560A81    mov         edx,eax
 00560A83    mov         eax,[005F5518];gvar_005F5518:TMemoryStream
 00560A88    call        TMemoryStream.LoadFromStream
 00560A8D    mov         dl,1
 00560A8F    mov         eax,[00418640];TMemoryStream
 00560A94    call        TObject.Create;TMemoryStream.Create
 00560A99    mov         [005F551C],eax;gvar_005F551C:TMemoryStream
 00560A9E    mov         eax,dword ptr [ebx]
 00560AA0    mov         eax,dword ptr [eax+37C]
 00560AA6    mov         edx,560FCC;'sudokop.ogg'
 00560AAB    call        004A3668
 00560AB0    mov         edx,eax
 00560AB2    mov         eax,[005F551C];gvar_005F551C:TMemoryStream
 00560AB7    call        TMemoryStream.LoadFromStream
 00560ABC    mov         al,byte ptr [ebp-1]
 00560ABF    pop         ebx
 00560AC0    pop         ecx
 00560AC1    pop         ebp
 00560AC2    ret
end;*}

//00560FD8
{*procedure sub_00560FD8(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00560FD8    push        ebp
 00560FD9    mov         ebp,esp
 00560FDB    push        ecx
 00560FDC    push        ebx
 00560FDD    push        esi
 00560FDE    push        edi
 00560FDF    mov         byte ptr [ebp-1],cl
 00560FE2    mov         ebx,edx
 00560FE4    mov         edi,eax
 00560FE6    mov         esi,dword ptr [ebp+0C]
 00560FE9    mov         eax,esi
 00560FEB    mov         edx,dword ptr [eax]
 00560FED    call        dword ptr [edx]
 00560FEF    push        eax
 00560FF0    push        0
 00560FF2    push        8000
 00560FF7    mov         eax,dword ptr [esi+4]
 00560FFA    push        eax
 00560FFB    call        004A1CB8
 00561000    mov         dword ptr [edi],eax
 00561002    cmp         dword ptr [edi],0
>00561005    je          00561040
 00561007    cmp         byte ptr [ebp+8],0
>0056100B    je          00561019
 0056100D    push        2
 0056100F    mov         eax,dword ptr [edi]
 00561011    push        eax
 00561012    call        004A1CE0
>00561017    jmp         00561023
 00561019    push        1
 0056101B    mov         eax,dword ptr [edi]
 0056101D    push        eax
 0056101E    call        004A1CE0
 00561023    mov         eax,dword ptr [edi]
 00561025    push        eax
 00561026    mov         esi,ebx
 00561028    and         esi,0FF
 0056102E    push        esi
 0056102F    call        004A1CC0
 00561034    xor         eax,eax
 00561036    mov         al,byte ptr [ebp-1]
 00561039    push        eax
 0056103A    push        esi
 0056103B    call        004A1CA0
 00561040    pop         edi
 00561041    pop         esi
 00561042    pop         ebx
 00561043    pop         ecx
 00561044    pop         ebp
 00561045    ret         8
end;*}

//00561048
{*function sub_00561048:?;
begin
 00561048    mov         eax,[005AE670];^gvar_005F5575
 0056104D    cmp         byte ptr [eax],0
 00561050    sete        al
 00561053    mov         edx,dword ptr ds:[5AE670];^gvar_005F5575
 00561059    inc         byte ptr [edx]
 0056105B    mov         edx,dword ptr ds:[5AE670];^gvar_005F5575
 00561061    cmp         byte ptr [edx],2
>00561064    jbe         0056106F
 00561066    mov         edx,dword ptr ds:[5AE670];^gvar_005F5575
 0056106C    mov         byte ptr [edx],0
 0056106F    ret
end;*}

//00561070
{*procedure sub_00561070(?:?);
begin
 00561070    push        ebx
 00561071    mov         ebx,eax
 00561073    xor         eax,eax
 00561075    mov         al,bl
 00561077    cmp         eax,0A
>0056107A    ja          005612D4
 00561080    jmp         dword ptr [eax*4+561087]
 00561080    dd          005610B3
 00561080    dd          005610ED
 00561080    dd          00561132
 00561080    dd          00561150
 00561080    dd          00561195
 00561080    dd          005611DA
 00561080    dd          0056120C
 00561080    dd          0056122A
 00561080    dd          0056125C
 00561080    dd          0056128A
 00561080    dd          005612B8
 005610B3    movsx       eax,byte ptr ds:[5F537D];gvar_005F537D
 005610BA    xor         edx,edx
 005610BC    mov         dl,bl
 005610BE    cmp         ax,dx
>005610C1    je          005610DF
 005610C3    mov         eax,[005F54FC];gvar_005F54FC:TMemoryStream
 005610C8    push        eax
 005610C9    push        1
 005610CB    mov         eax,5F5378;gvar_005F5378
 005610D0    mov         cl,0FF
 005610D2    xor         edx,edx
 005610D4    call        00560FD8
 005610D9    mov         byte ptr ds:[5F537D],bl;gvar_005F537D
 005610DF    push        0FF
 005610E4    push        0
 005610E6    call        004A1CA0
 005610EB    pop         ebx
 005610EC    ret
 005610ED    movsx       eax,byte ptr ds:[5F537C];gvar_005F537C
 005610F4    xor         edx,edx
 005610F6    mov         dl,bl
 005610F8    cmp         ax,dx
>005610FB    je          005612D4
 00561101    call        00561048
 00561106    test        al,al
>00561108    je          0056112B
 0056110A    mov         eax,[005F5508];gvar_005F5508:TMemoryStream
 0056110F    push        eax
 00561110    push        0
 00561112    mov         eax,5F5374;gvar_005F5374
 00561117    mov         cl,2D
 00561119    mov         dl,1
 0056111B    call        00560FD8
 00561120    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
>00561126    jmp         005612D4
 0056112B    call        005612D8
 00561130    pop         ebx
 00561131    ret
 00561132    mov         eax,[005F5518];gvar_005F5518:TMemoryStream
 00561137    push        eax
 00561138    push        0
 0056113A    mov         eax,5F5374;gvar_005F5374
 0056113F    mov         cl,6E
 00561141    mov         dl,1
 00561143    call        00560FD8
 00561148    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
 0056114E    pop         ebx
 0056114F    ret
 00561150    movsx       eax,byte ptr ds:[5F537C];gvar_005F537C
 00561157    xor         edx,edx
 00561159    mov         dl,bl
 0056115B    cmp         ax,dx
>0056115E    je          005612D4
 00561164    call        00561048
 00561169    test        al,al
>0056116B    je          0056118E
 0056116D    mov         eax,[005F550C];gvar_005F550C:TMemoryStream
 00561172    push        eax
 00561173    push        0
 00561175    mov         eax,5F5374;gvar_005F5374
 0056117A    mov         cl,0A0
 0056117C    mov         dl,1
 0056117E    call        00560FD8
 00561183    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
>00561189    jmp         005612D4
 0056118E    call        005612D8
 00561193    pop         ebx
 00561194    ret
 00561195    movsx       eax,byte ptr ds:[5F537C];gvar_005F537C
 0056119C    xor         edx,edx
 0056119E    mov         dl,bl
 005611A0    cmp         ax,dx
>005611A3    je          005612D4
 005611A9    call        00561048
 005611AE    test        al,al
>005611B0    je          005611D3
 005611B2    mov         eax,[005F54F8];gvar_005F54F8:TMemoryStream
 005611B7    push        eax
 005611B8    push        0
 005611BA    mov         eax,5F5374;gvar_005F5374
 005611BF    mov         cl,0A0
 005611C1    mov         dl,1
 005611C3    call        00560FD8
 005611C8    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
>005611CE    jmp         005612D4
 005611D3    call        005612D8
 005611D8    pop         ebx
 005611D9    ret
 005611DA    movsx       eax,byte ptr ds:[5F537C];gvar_005F537C
 005611E1    xor         edx,edx
 005611E3    mov         dl,bl
 005611E5    cmp         ax,dx
>005611E8    je          005612D4
 005611EE    mov         eax,[005F54F8];gvar_005F54F8:TMemoryStream
 005611F3    push        eax
 005611F4    push        1
 005611F6    mov         eax,5F5374;gvar_005F5374
 005611FB    mov         cl,0A0
 005611FD    mov         dl,1
 005611FF    call        00560FD8
 00561204    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
 0056120A    pop         ebx
 0056120B    ret
 0056120C    mov         eax,[005F5500];gvar_005F5500:TMemoryStream
 00561211    push        eax
 00561212    push        0
 00561214    mov         eax,5F5374;gvar_005F5374
 00561219    mov         cl,0A0
 0056121B    mov         dl,1
 0056121D    call        00560FD8
 00561222    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
 00561228    pop         ebx
 00561229    ret
 0056122A    movsx       eax,byte ptr ds:[5F537D];gvar_005F537D
 00561231    xor         edx,edx
 00561233    mov         dl,bl
 00561235    cmp         ax,dx
>00561238    je          005612D4
 0056123E    mov         eax,[005F5510];gvar_005F5510:TMemoryStream
 00561243    push        eax
 00561244    push        1
 00561246    mov         eax,5F5378;gvar_005F5378
 0056124B    mov         cl,0B4
 0056124D    xor         edx,edx
 0056124F    call        00560FD8
 00561254    mov         byte ptr ds:[5F537D],bl;gvar_005F537D
 0056125A    pop         ebx
 0056125B    ret
 0056125C    movsx       eax,byte ptr ds:[5F537C];gvar_005F537C
 00561263    xor         edx,edx
 00561265    mov         dl,bl
 00561267    cmp         ax,dx
>0056126A    je          005612D4
 0056126C    mov         eax,[005F5504];gvar_005F5504:TMemoryStream
 00561271    push        eax
 00561272    push        1
 00561274    mov         eax,5F5374;gvar_005F5374
 00561279    mov         cl,0A0
 0056127B    mov         dl,1
 0056127D    call        00560FD8
 00561282    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
 00561288    pop         ebx
 00561289    ret
 0056128A    movsx       eax,byte ptr ds:[5F537C];gvar_005F537C
 00561291    xor         edx,edx
 00561293    mov         dl,bl
 00561295    cmp         ax,dx
>00561298    je          005612D4
 0056129A    mov         eax,[005F5514];gvar_005F5514:TMemoryStream
 0056129F    push        eax
 005612A0    push        1
 005612A2    mov         eax,5F5374;gvar_005F5374
 005612A7    xor         ecx,ecx
 005612A9    mov         dl,1
 005612AB    call        00560FD8
 005612B0    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
 005612B6    pop         ebx
 005612B7    ret
 005612B8    mov         eax,[005F551C];gvar_005F551C:TMemoryStream
 005612BD    push        eax
 005612BE    push        0
 005612C0    mov         eax,5F5374;gvar_005F5374
 005612C5    mov         cl,0B4
 005612C7    mov         dl,1
 005612C9    call        00560FD8
 005612CE    mov         byte ptr ds:[5F537C],bl;gvar_005F537C
 005612D4    pop         ebx
 005612D5    ret
end;*}

//005612D8
procedure sub_005612D8;
begin
{*
 005612D8    cmp         dword ptr ds:[5F5374],0;gvar_005F5374
>005612DF    je          005612F3
 005612E1    mov         eax,[005F5374];gvar_005F5374
 005612E6    push        eax
 005612E7    call        004A1CC8
 005612EC    xor         eax,eax
 005612EE    mov         [005F5374],eax;gvar_005F5374
 005612F3    mov         byte ptr ds:[5F537C],0FF;gvar_005F537C
 005612FA    ret
*}
end;

//005612FC
procedure sub_005612FC;
begin
{*
 005612FC    cmp         dword ptr ds:[5F5378],0;gvar_005F5378
>00561303    je          00561317
 00561305    mov         eax,[005F5378];gvar_005F5378
 0056130A    push        eax
 0056130B    call        004A1CC8
 00561310    xor         eax,eax
 00561312    mov         [005F5378],eax;gvar_005F5378
 00561317    mov         byte ptr ds:[5F537D],0FF;gvar_005F537D
 0056131E    ret
*}
end;

//00561320
{*function sub_00561320:?;
begin
 00561320    mov         eax,[005F5374];gvar_005F5374
 00561325    push        eax
 00561326    call        004A1CD0
 0056132B    add         eax,12C
 00561330    xor         edx,edx
 00561332    push        edx
 00561333    push        eax
 00561334    mov         eax,[005F5374];gvar_005F5374
 00561339    push        eax
 0056133A    call        004A1CD8
 0056133F    cdq
 00561340    cmp         edx,dword ptr [esp+4]
>00561344    jne         0056134E
 00561346    cmp         eax,dword ptr [esp]
 00561349    setbe       al
>0056134C    jmp         00561351
 0056134E    setle       al
 00561351    add         esp,8
 00561354    ret
end;*}

//00561358
{*procedure sub_00561358(?:?; ?:?);
begin
 00561358    push        ebx
 00561359    push        esi
 0056135A    push        ecx
 0056135B    mov         byte ptr [esp],dl
 0056135E    mov         ebx,eax
 00561360    cmp         byte ptr [esp],0
>00561364    je          0056142D
 0056136A    xor         eax,eax
 0056136C    mov         al,bl
 0056136E    mov         eax,dword ptr [eax*4+5F5380];gvar_005F5380
 00561375    push        eax
 00561376    push        0FF
 00561378    call        004A1C90
 0056137D    mov         esi,eax
 0056137F    xor         eax,eax
 00561381    mov         al,byte ptr [esp]
 00561384    push        eax
 00561385    push        esi
 00561386    call        004A1CA0
 0056138B    cmp         bl,7
>0056138E    jne         005613B0
 00561390    mov         dword ptr ds:[5F54EC],esi;gvar_005F54EC
 00561396    push        0FF
 00561398    mov         eax,[005F54EC];gvar_005F54EC
 0056139D    push        eax
 0056139E    call        004A1CA8
 005613A3    push        2
 005613A5    mov         eax,[005F54EC];gvar_005F54EC
 005613AA    push        eax
 005613AB    call        004A1CB0
 005613B0    cmp         bl,1C
>005613B3    jne         005613E3
 005613B5    mov         eax,[005AE578];^gvar_005FE498:Pointer
 005613BA    cmp         byte ptr [eax+1F0],6
>005613C1    jne         005613E3
 005613C3    mov         dword ptr ds:[5F54F0],esi;gvar_005F54F0
 005613C9    push        0
 005613CB    mov         eax,[005F54F0];gvar_005F54F0
 005613D0    push        eax
 005613D1    call        004A1CA0
 005613D6    push        2
 005613D8    mov         eax,[005F54F0];gvar_005F54F0
 005613DD    push        eax
 005613DE    call        004A1CB0
 005613E3    cmp         bl,26
>005613E6    jne         00561408
 005613E8    mov         dword ptr ds:[5F54F4],esi;gvar_005F54F4
 005613EE    push        0
 005613F0    mov         eax,[005F54F4];gvar_005F54F4
 005613F5    push        eax
 005613F6    call        004A1CA0
 005613FB    push        2
 005613FD    mov         eax,[005F54F4];gvar_005F54F4
 00561402    push        eax
 00561403    call        004A1CB0
 00561408    cmp         bl,28
>0056140B    jne         0056142D
 0056140D    mov         dword ptr ds:[5F54EC],esi;gvar_005F54EC
 00561413    push        0FF
 00561415    mov         eax,[005F54EC];gvar_005F54EC
 0056141A    push        eax
 0056141B    call        004A1CA8
 00561420    push        2
 00561422    mov         eax,[005F54EC];gvar_005F54EC
 00561427    push        eax
 00561428    call        004A1CB0
 0056142D    pop         edx
 0056142E    pop         esi
 0056142F    pop         ebx
 00561430    ret
end;*}

//00561434
procedure sub_00561434;
begin
{*
 00561434    push        ebx
 00561435    mov         bl,2
 00561437    xor         eax,eax
 00561439    mov         al,bl
 0056143B    push        eax
 0056143C    call        004A1C98
 00561441    inc         ebx
 00561442    cmp         bl,21
>00561445    jne         00561437
 00561447    pop         ebx
 00561448    ret
*}
end;

//0056144C
{*function sub_0056144C:?;
begin
 0056144C    push        ecx
 0056144D    call        004A1C80
 00561452    mov         dword ptr [esp],eax
 00561455    fild        dword ptr [esp]
 00561458    fld         tbyte ptr ds:[561474];2.55:Extended
 0056145E    fdivp       st(1),st
 00561460    call        @ROUND
 00561465    cmp         eax,64
>00561468    jle         0056146F
 0056146A    mov         eax,64
 0056146F    pop         edx
 00561470    ret
end;*}

//00561480
{*procedure sub_00561480(?:?);
begin
 00561480    push        ebx
 00561481    push        ecx
 00561482    mov         ebx,eax
 00561484    xor         eax,eax
 00561486    mov         al,bl
 00561488    mov         dword ptr [esp],eax
 0056148B    fild        dword ptr [esp]
 0056148E    fld         tbyte ptr ds:[5614A4];2.55:Extended
 00561494    fmulp       st(1),st
 00561496    call        @ROUND
 0056149B    push        eax
 0056149C    call        004A1C78
 005614A1    pop         edx
 005614A2    pop         ebx
 005614A3    ret
end;*}

//005614B0
procedure sub_005614B0;
begin
{*
 005614B0    mov         al,9
 005614B2    call        00561070
 005614B7    mov         al,7
 005614B9    call        00561070
 005614BE    ret
*}
end;

end.