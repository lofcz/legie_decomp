//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit VectorLists;

interface

uses
  SysUtils, Classes;

type
  TBaseList = class(TPersistentObject)
  public
    f8:dword;//f8
    fC:dword;//fC
    f10:dword;//f10
    f14:dword;//f14
    f18:byte;//f18
    f1C:dword;//f1C
    f20:Integer;//f20
    destructor Destroy; virtual;//00467FF8
    procedure Assign(Source:TPersistent); virtual;//v8//00468030
    constructor vC; virtual;//vC//00467FB4
    //procedure v1C(?:?); virtual;//v1C//004681D8
    //procedure sub_00466894(?:?); dynamic;//004680B8
    //procedure sub_00466814(?:?); dynamic;//00468070
  end;
  TBaseVectorList = class(TBaseList)
  public
    //procedure sub_00468938(?:?; ?:?); dynamic;//00468938
    procedure @AbstractError; dynamic;//00402BEC
    //procedure sub_00468658(?:?); dynamic;//00468658
    //procedure sub_004685A4(?:?); dynamic;//004685A4
    //procedure sub_00468578(?:?); dynamic;//00468578
    //procedure sub_004684A0(?:?); dynamic;//004684A0
    procedure sub_00468478; dynamic;//00468478
    //procedure sub_00468434(?:?); dynamic;//00468434
    //procedure sub_0046837C(?:?; ?:?); dynamic;//0046837C
    //procedure sub_00466894(?:?); dynamic;//00468354
    //procedure sub_00466814(?:?); dynamic;//0046833C
  end;
  TAffineVectorList = class(TBaseVectorList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//00468A48
    constructor Create; virtual;//vC//00468A04
    procedure v1C; virtual;//v1C//00468CBC
    //procedure sub_00468D00(?:?; ?:?; ?:?); dynamic;//00468D00
    //procedure sub_00468578(?:?); dynamic;//00468CD0
    procedure sub_00468478; dynamic;//00468CF4
  end;
  TVectorList = class(TBaseVectorList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//00468E74
    constructor Create; virtual;//vC//00468E30
    procedure v1C; virtual;//v1C//00468F6C
    //procedure sub_00468F80(?:?; ?:?; ?:?); dynamic;//00468F80
  end;
  TTexPointList = class(TBaseList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//00469098
    constructor Create; virtual;//vC//00469054
    procedure v1C; virtual;//v1C//00469118
  end;
  TIntegerList = class(TBaseList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//00469170
    constructor Create; virtual;//vC//0046912C
    procedure v1C; virtual;//v1C//00469270
  end;
  TSingleList = class(TBaseList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//00469318
    constructor Create; virtual;//vC//004692D4
    procedure v1C; virtual;//v1C//00469390
  end;
  TByteList = class(TBaseList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//004693E8
    constructor Create; virtual;//vC//004693A4
    procedure v1C; virtual;//v1C//0046945C
  end;
  TQuaternionList = class(TBaseVectorList)
  public
    f24:dword;//f24
    procedure Assign(Source:TPersistent); virtual;//v8//004694B4
    constructor Create; virtual;//vC//00469470
    procedure v1C; virtual;//v1C//00469528
    //procedure sub_00468938(?:?; ?:?); dynamic;//0046969C
    //procedure sub_0046953C(?:?; ?:?; ?:?); dynamic;//0046953C
  end;
    //procedure sub_00467EC0(?:?; ?:?; ?:TSingleList; ?:?);//00467EC0
    constructor sub_00467FB4;//00467FB4
    destructor Destroy;//00467FF8
    procedure Assign(Source:TPersistent);//00468030
    //procedure sub_00466814(?:?);//00468070
    //procedure sub_00466894(?:?);//004680B8
    //procedure sub_00468118(?:TBaseList; ?:?);//00468118
    //procedure sub_004681D8(?:?);//004681D8
    //procedure sub_00468208(?:TAffineVectorList; ?:?);//00468208
    //procedure sub_0046824C(?:?; ?:?);//0046824C
    //function sub_00468258(?:?):?;//00468258
    procedure sub_00468274(?:TIntegerList);//00468274
    procedure sub_00468280(?:TBaseList);//00468280
    //procedure sub_0046829C(?:?; ?:?; ?:?);//0046829C
    procedure sub_00468318(?:TIntegerList);//00468318
    //procedure sub_00466814(?:?);//0046833C
    //procedure sub_00466894(?:?);//00468354
    //procedure sub_0046837C(?:?; ?:?);//0046837C
    //procedure sub_00468434(?:?);//00468434
    procedure sub_00468478;//00468478
    //procedure sub_004684A0(?:?);//004684A0
    //procedure sub_00468578(?:?);//00468578
    //procedure sub_004685A4(?:?);//004685A4
    //procedure sub_00468658(?:?);//00468658
    //procedure sub_0046870C(?:TAffineVectorList; ?:?; ?:?; ?:?);//0046870C
    //procedure sub_00468858(?:?; ?:TAffineVectorList; ?:?);//00468858
    //procedure sub_00468938(?:?; ?:?);//00468938
    //function sub_004689F8(?:TBaseVectorList; ?:?):?;//004689F8
    constructor Create;//00468A04
    procedure Assign(Source:TPersistent);//00468A48
    //function sub_00468A90(?:TAffineVectorList; ?:Integer):?;//00468A90
    //procedure sub_00468AD0(?:?; ?:Integer; ?:Integer; ?:?);//00468AD0
    procedure sub_00468B5C(?:TAffineVectorList; ?:Integer);//00468B5C
    //function sub_00468B84(?:?; ?:?; ?:?; ?:?):?;//00468B84
    procedure sub_00468BCC(?:TAffineVectorList; ?:TAffineVectorList);//00468BCC
    procedure sub_00468C18(?:TAffineVectorList; ?:Integer; ?:Integer);//00468C18
    //function sub_00468C38(?:?; ?:?):?;//00468C38
    //function sub_00468C7C(?:?; ?:?):?;//00468C7C
    //procedure sub_00468C9C(?:TAffineVectorList; ?:?; ?:Integer);//00468C9C
    procedure sub_00468CBC;//00468CBC
    //procedure sub_00468578(?:?);//00468CD0
    //procedure sub_00468CE0(?:?; ?:?; ?:?);//00468CE0
    procedure sub_00468478;//00468CF4
    //procedure sub_00468D00(?:?; ?:?; ?:?);//00468D00
    //procedure sub_00468DD4(?:?; ?:?);//00468DD4
    //procedure sub_00468E04(?:?; ?:?);//00468E04
    constructor Create;//00468E30
    procedure Assign(Source:TPersistent);//00468E74
    //function sub_00468EB8(?:TVectorList; ?:?):?;//00468EB8
    //function sub_00468EF0(?:?; ?:?; ?:?):?;//00468EF0
    //procedure sub_00468F1C(?:TVectorList; ?:?);//00468F1C
    //procedure sub_00468F40(?:TVectorList; ?:?; ?:?; ?:?);//00468F40
    procedure sub_00468F6C;//00468F6C
    //procedure sub_00468F80(?:?; ?:?; ?:?);//00468F80
    constructor Create;//00469054
    procedure Assign(Source:TPersistent);//00469098
    //function sub_004690DC(?:TTexPointList; ?:?; ?:?):?;//004690DC
    procedure sub_00469118;//00469118
    constructor Create;//0046912C
    procedure Assign(Source:TPersistent);//00469170
    //function sub_004691B4(?:?; ?:?):?;//004691B4
    //procedure sub_004691E0(?:TIntegerList; ?:?; ?:Integer);//004691E0
    //procedure sub_00469218(?:TIntegerList; ?:?; ?:?; ?:?);//00469218
    //function sub_00469260(?:TIntegerList; ?:?):?;//00469260
    //procedure sub_00469268(?:?; ?:?; ?:?);//00469268
    procedure sub_00469270;//00469270
    //procedure sub_00469284(?:TIntegerList; ?:?; ?:?; ?:?);//00469284
    constructor Create;//004692D4
    procedure Assign(Source:TPersistent);//00469318
    //function sub_0046935C(?:TSingleList; ?:?):?;//0046935C
    procedure sub_00469390;//00469390
    constructor Create;//004693A4
    procedure Assign(Source:TPersistent);//004693E8
    //function sub_00469428(?:?; ?:?):?;//00469428
    //procedure sub_00469454(?:TByteList; ?:?; ?:?);//00469454
    procedure sub_0046945C;//0046945C
    constructor Create;//00469470
    procedure Assign(Source:TPersistent);//004694B4
    //procedure sub_004694F8(?:?; ?:?; ?:?);//004694F8
    //procedure sub_00469510(?:TQuaternionList; ?:?; ?:?);//00469510
    procedure sub_00469528;//00469528
    //procedure sub_0046953C(?:?; ?:?; ?:?);//0046953C
    //procedure sub_0046965C(?:?; ?:?; ?:?);//0046965C
    //procedure sub_00468938(?:?; ?:?);//0046969C

implementation

//00467EC0
{*procedure sub_00467EC0(?:?; ?:?; ?:TSingleList; ?:?);
begin
 00467EC0    push        ebp
 00467EC1    mov         ebp,esp
 00467EC3    add         esp,0FFFFFFEC
 00467EC6    push        ebx
 00467EC7    push        esi
 00467EC8    mov         dword ptr [ebp-0C],ecx
 00467ECB    mov         dword ptr [ebp-8],edx
 00467ECE    mov         dword ptr [ebp-4],eax
 00467ED1    mov         eax,dword ptr [ebp-0C]
 00467ED4    mov         eax,dword ptr [eax+24]
 00467ED7    mov         dword ptr [ebp-14],eax
 00467EDA    mov         eax,dword ptr [ebp-4]
 00467EDD    inc         eax
 00467EDE    cmp         eax,dword ptr [ebp-8]
>00467EE1    jge         00467F60
 00467EE3    mov         ebx,dword ptr [ebp-4]
 00467EE6    mov         esi,dword ptr [ebp-8]
 00467EE9    lea         eax,[esi+ebx]
 00467EEC    shr         eax,1
 00467EEE    mov         edx,dword ptr [ebp-0C]
 00467EF1    mov         edx,dword ptr [edx+24]
 00467EF4    lea         eax,[edx+eax*4]
 00467EF7    mov         eax,dword ptr [eax]
 00467EF9    mov         edx,dword ptr [ebp-14]
>00467EFC    jmp         00467EFF
 00467EFE    inc         ebx
 00467EFF    cmp         eax,dword ptr [edx+ebx*4]
>00467F02    jg          00467EFE
>00467F04    jmp         00467F07
 00467F06    dec         esi
 00467F07    cmp         eax,dword ptr [edx+esi*4]
>00467F0A    jl          00467F06
 00467F0C    cmp         esi,ebx
>00467F0E    jl          00467F3C
 00467F10    mov         ecx,dword ptr [edx+ebx*4]
 00467F13    mov         dword ptr [ebp-10],ecx
 00467F16    mov         ecx,dword ptr [edx+esi*4]
 00467F19    mov         dword ptr [edx+ebx*4],ecx
 00467F1C    mov         ecx,dword ptr [ebp-10]
 00467F1F    mov         dword ptr [edx+esi*4],ecx
 00467F22    mov         edx,dword ptr [ebp+8]
 00467F25    mov         edx,dword ptr [edx+8]
 00467F28    mov         ecx,dword ptr [edx+ebx*4]
 00467F2B    mov         dword ptr [ebp-10],ecx
 00467F2E    mov         ecx,dword ptr [edx+esi*4]
 00467F31    mov         dword ptr [edx+ebx*4],ecx
 00467F34    mov         ecx,dword ptr [ebp-10]
 00467F37    mov         dword ptr [edx+esi*4],ecx
 00467F3A    inc         ebx
 00467F3B    dec         esi
 00467F3C    cmp         esi,ebx
>00467F3E    jge         00467EF9
 00467F40    cmp         esi,dword ptr [ebp-4]
>00467F43    jle         00467F56
 00467F45    mov         eax,dword ptr [ebp+8]
 00467F48    push        eax
 00467F49    mov         ecx,dword ptr [ebp-0C]
 00467F4C    mov         edx,esi
 00467F4E    mov         eax,dword ptr [ebp-4]
 00467F51    call        00467EC0
 00467F56    mov         dword ptr [ebp-4],ebx
 00467F59    cmp         ebx,dword ptr [ebp-8]
>00467F5C    jl          00467EE3
>00467F5E    jmp         00467FA9
 00467F60    mov         eax,dword ptr [ebp-8]
 00467F63    cmp         eax,dword ptr [ebp-4]
>00467F66    jle         00467FA9
 00467F68    mov         edx,dword ptr [ebp-14]
 00467F6B    mov         eax,dword ptr [ebp-8]
 00467F6E    mov         eax,dword ptr [edx+eax*4]
 00467F71    mov         ecx,dword ptr [ebp-4]
 00467F74    cmp         eax,dword ptr [edx+ecx*4]
>00467F77    jge         00467FA9
 00467F79    mov         ebx,dword ptr [ebp-8]
 00467F7C    mov         esi,dword ptr [ebp-4]
 00467F7F    mov         eax,dword ptr [edx+ebx*4]
 00467F82    mov         dword ptr [ebp-10],eax
 00467F85    mov         eax,dword ptr [edx+esi*4]
 00467F88    mov         dword ptr [edx+ebx*4],eax
 00467F8B    mov         eax,dword ptr [ebp-10]
 00467F8E    mov         dword ptr [edx+esi*4],eax
 00467F91    mov         eax,dword ptr [ebp+8]
 00467F94    mov         edx,dword ptr [eax+8]
 00467F97    mov         eax,dword ptr [edx+ebx*4]
 00467F9A    mov         dword ptr [ebp-10],eax
 00467F9D    mov         eax,dword ptr [edx+esi*4]
 00467FA0    mov         dword ptr [edx+ebx*4],eax
 00467FA3    mov         eax,dword ptr [ebp-10]
 00467FA6    mov         dword ptr [edx+esi*4],eax
 00467FA9    pop         esi
 00467FAA    pop         ebx
 00467FAB    mov         esp,ebp
 00467FAD    pop         ebp
 00467FAE    ret         4
end;*}

//00467FB4
constructor sub_00467FB4;
begin
{*
 00467FB4    push        ebx
 00467FB5    push        esi
 00467FB6    test        dl,dl
>00467FB8    je          00467FC2
 00467FBA    add         esp,0FFFFFFF0
 00467FBD    call        @ClassCreate
 00467FC2    mov         ebx,edx
 00467FC4    mov         esi,eax
 00467FC6    xor         edx,edx
 00467FC8    mov         eax,esi
 00467FCA    call        004666E0
 00467FCF    mov         al,[00467FF4];0x2 gvar_00467FF4
 00467FD4    mov         byte ptr [esi+18],al;TBaseList.?f18:byte
 00467FD7    mov         eax,esi
 00467FD9    test        bl,bl
>00467FDB    je          00467FEC
 00467FDD    call        @AfterConstruction
 00467FE2    pop         dword ptr fs:[0]
 00467FE9    add         esp,0C
 00467FEC    mov         eax,esi
 00467FEE    pop         esi
 00467FEF    pop         ebx
 00467FF0    ret
*}
end;

//00467FF8
destructor TBaseList.Destroy;
begin
{*
 00467FF8    push        ebx
 00467FF9    push        esi
 00467FFA    call        @BeforeDestruction
 00467FFF    mov         ebx,edx
 00468001    mov         esi,eax
 00468003    mov         eax,esi
 00468005    call        00468280
 0046800A    mov         eax,dword ptr [esi+14];TBaseList.?f14:dword
 0046800D    test        eax,eax
>0046800F    je          00468016
 00468011    call        @FreeMem
 00468016    mov         edx,ebx
 00468018    and         dl,0FC
 0046801B    mov         eax,esi
 0046801D    call        TPersistentObject.Destroy
 00468022    test        bl,bl
>00468024    jle         0046802D
 00468026    mov         eax,esi
 00468028    call        @ClassDestroy
 0046802D    pop         esi
 0046802E    pop         ebx
 0046802F    ret
*}
end;

//00468030
procedure TBaseList.Assign(Source:TPersistent);
begin
{*
 00468030    push        ebx
 00468031    push        esi
 00468032    push        edi
 00468033    mov         esi,edx
 00468035    mov         ebx,eax
 00468037    mov         eax,esi
 00468039    mov         edx,dword ptr ds:[467864];TBaseList
 0046803F    call        @IsClass
 00468044    test        al,al
>00468046    je          00468062
 00468048    mov         edi,esi
 0046804A    mov         edx,dword ptr [edi+8]
 0046804D    mov         eax,ebx
 0046804F    mov         ecx,dword ptr [eax]
 00468051    call        dword ptr [ecx+1C];TBaseList.sub_004681D8
 00468054    mov         eax,dword ptr [edi+10]
 00468057    mov         dword ptr [ebx+10],eax;TBaseList.?f10:dword
 0046805A    mov         eax,dword ptr [ebx+0C];TBaseList.?fC:dword
 0046805D    mov         dword ptr [ebx+8],eax;TBaseList.?f8:dword
>00468060    jmp         0046806B
 00468062    mov         edx,esi
 00468064    mov         eax,ebx
 00468066    call        TPersistentObject.Assign
 0046806B    pop         edi
 0046806C    pop         esi
 0046806D    pop         ebx
 0046806E    ret
*}
end;

//00468070
{*procedure TBaseList.sub_00466814(?:?);
begin
 00468070    push        ebx
 00468071    push        esi
 00468072    mov         esi,edx
 00468074    mov         ebx,eax
 00468076    mov         edx,esi
 00468078    mov         eax,ebx
 0046807A    call        TPersistentObject.sub_00466814
 0046807F    xor         edx,edx
 00468081    mov         eax,esi
 00468083    mov         ecx,dword ptr [eax]
 00468085    call        dword ptr [ecx+8]
 00468088    mov         edx,dword ptr [ebx+8];TBaseList.?f8:dword
 0046808B    mov         eax,esi
 0046808D    mov         ecx,dword ptr [eax]
 0046808F    call        dword ptr [ecx+8]
 00468092    mov         edx,dword ptr [ebx+20];TBaseList.?f20:Integer
 00468095    mov         eax,esi
 00468097    mov         ecx,dword ptr [eax]
 00468099    call        dword ptr [ecx+8]
 0046809C    mov         eax,dword ptr [ebx+8];TBaseList.?f8:dword
 0046809F    test        eax,eax
>004680A1    jle         004680B3
 004680A3    mov         ecx,eax
 004680A5    imul        ecx,dword ptr [ebx+20];TBaseList.?f20:Integer
 004680A9    mov         edx,dword ptr [ebx+1C];TBaseList.?f1C:dword
 004680AC    mov         eax,esi
 004680AE    mov         ebx,dword ptr [eax]
 004680B0    call        dword ptr [ebx+4]
 004680B3    pop         esi
 004680B4    pop         ebx
 004680B5    ret
end;*}

//004680B8
{*procedure TBaseList.sub_00466894(?:?);
begin
 004680B8    push        ebx
 004680B9    push        esi
 004680BA    mov         esi,edx
 004680BC    mov         ebx,eax
 004680BE    mov         edx,esi
 004680C0    mov         eax,ebx
 004680C2    call        TPersistentObject.sub_00466894
 004680C7    mov         eax,esi
 004680C9    mov         edx,dword ptr [eax]
 004680CB    call        dword ptr [edx+0C]
 004680CE    test        eax,eax
>004680D0    jne         0046810A
 004680D2    mov         eax,esi
 004680D4    mov         edx,dword ptr [eax]
 004680D6    call        dword ptr [edx+0C]
 004680D9    mov         dword ptr [ebx+8],eax;TBaseList.?f8:dword
 004680DC    mov         eax,esi
 004680DE    mov         edx,dword ptr [eax]
 004680E0    call        dword ptr [edx+0C]
 004680E3    mov         dword ptr [ebx+20],eax;TBaseList.?f20:Integer
 004680E6    mov         edx,dword ptr [ebx+8];TBaseList.?f8:dword
 004680E9    mov         eax,ebx
 004680EB    mov         ecx,dword ptr [eax]
 004680ED    call        dword ptr [ecx+1C];TBaseList.sub_004681D8
 004680F0    mov         eax,dword ptr [ebx+8];TBaseList.?f8:dword
 004680F3    test        eax,eax
>004680F5    jle         00468113
 004680F7    mov         ecx,eax
 004680F9    imul        ecx,dword ptr [ebx+20];TBaseList.?f20:Integer
 004680FD    mov         edx,dword ptr [ebx+1C];TBaseList.?f1C:dword
 00468100    mov         eax,esi
 00468102    mov         ebx,dword ptr [eax]
 00468104    call        dword ptr [ebx+4]
 00468107    pop         esi
 00468108    pop         ebx
 00468109    ret
 0046810A    mov         edx,eax
 0046810C    mov         eax,ebx
 0046810E    call        00466914
 00468113    pop         esi
 00468114    pop         ebx
 00468115    ret
end;*}

//00468118
{*procedure sub_00468118(?:TBaseList; ?:?);
begin
 00468118    push        ebx
 00468119    push        esi
 0046811A    push        edi
 0046811B    mov         esi,edx
 0046811D    mov         ebx,eax
 0046811F    test        esi,esi
>00468121    jge         00468137
 00468123    mov         ecx,2C9
 00468128    mov         edx,468180;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 0046812D    mov         eax,4681C4;'Assertion failure'
 00468132    call        @Assert
 00468137    cmp         esi,dword ptr [ebx+0C]
>0046813A    jle         00468145
 0046813C    mov         edx,esi
 0046813E    mov         eax,ebx
 00468140    mov         ecx,dword ptr [eax]
 00468142    call        dword ptr [ecx+1C]
 00468145    mov         eax,dword ptr [ebx+8]
 00468148    cmp         esi,eax
>0046814A    jle         00468171
 0046814C    test        byte ptr [ebx+18],2
>00468150    je          00468171
 00468152    mov         edx,dword ptr [ebx+20]
 00468155    mov         ecx,edx
 00468157    imul        ecx,eax
 0046815A    mov         edi,dword ptr [ebx+1C]
 0046815D    lea         ecx,[edi+ecx]
 00468160    mov         edi,esi
 00468162    sub         edi,eax
 00468164    imul        edi,edx
 00468167    mov         edx,edi
 00468169    xor         eax,eax
 0046816B    xchg        eax,ecx
 0046816C    call        @FillChar
 00468171    mov         dword ptr [ebx+8],esi
 00468174    pop         edi
 00468175    pop         esi
 00468176    pop         ebx
 00468177    ret
end;*}

//004681D8
{*procedure sub_004681D8(?:?);
begin
 004681D8    push        ebx
 004681D9    push        esi
 004681DA    mov         esi,edx
 004681DC    mov         ebx,eax
 004681DE    cmp         esi,dword ptr [ebx+0C];TBaseList.?fC:dword
>004681E1    je          00468203
 004681E3    test        byte ptr [ebx+18],1;TBaseList.?f18:byte
>004681E7    je          004681F2
 004681E9    and         byte ptr [ebx+18],0FE;TBaseList.?f18:byte
 004681ED    xor         eax,eax
 004681EF    mov         dword ptr [ebx+1C],eax;TBaseList.?f1C:dword
 004681F2    mov         edx,esi
 004681F4    imul        edx,dword ptr [ebx+20];TBaseList.?f20:Integer
 004681F8    lea         eax,[ebx+1C];TBaseList.?f1C:dword
 004681FB    call        @ReallocMem
 00468200    mov         dword ptr [ebx+0C],esi;TBaseList.?fC:dword
 00468203    pop         esi
 00468204    pop         ebx
 00468205    ret
end;*}

//00468208
{*procedure sub_00468208(?:TAffineVectorList; ?:?);
begin
 00468208    push        ebx
 00468209    push        esi
 0046820A    push        edi
 0046820B    mov         esi,edx
 0046820D    mov         ebx,eax
 0046820F    mov         edi,esi
 00468211    mov         eax,edi
 00468213    add         eax,dword ptr [ebx+8]
 00468216    cmp         eax,dword ptr [ebx+0C]
>00468219    jle         00468224
 0046821B    mov         edx,eax
 0046821D    mov         eax,ebx
 0046821F    mov         ecx,dword ptr [eax]
 00468221    call        dword ptr [ecx+1C]
 00468224    mov         edx,dword ptr [ebx+8]
 00468227    mov         eax,dword ptr [ebx+20]
 0046822A    imul        edx,eax
 0046822D    mov         ecx,dword ptr [ebx+1C]
 00468230    lea         edx,[ecx+edx]
 00468233    mov         ecx,edi
 00468235    imul        ecx,eax
 00468238    mov         eax,ecx
 0046823A    xor         ecx,ecx
 0046823C    xchg        eax,edx
 0046823D    call        @FillChar
 00468242    add         dword ptr [ebx+8],edi
 00468245    pop         edi
 00468246    pop         esi
 00468247    pop         ebx
 00468248    ret
end;*}

//0046824C
{*procedure sub_0046824C(?:?; ?:?);
begin
 0046824C    cmp         edx,dword ptr [eax+0C]
>0046824F    jle         00468256
 00468251    mov         ecx,dword ptr [eax]
 00468253    call        dword ptr [ecx+1C]
 00468256    ret
end;*}

//00468258
{*function sub_00468258(?:?):?;
begin
 00468258    push        ebx
 00468259    mov         ebx,eax
 0046825B    cmp         dword ptr [ebx+14],0
>0046825F    jne         0046826C
 00468261    mov         eax,dword ptr [ebx+20]
 00468264    call        @GetMem
 00468269    mov         dword ptr [ebx+14],eax
 0046826C    mov         eax,dword ptr [ebx+14]
 0046826F    pop         ebx
 00468270    ret
end;*}

//00468274
procedure sub_00468274(?:TIntegerList);
begin
{*
 00468274    test        eax,eax
>00468276    je          0046827F
 00468278    xor         edx,edx
 0046827A    call        00468118
 0046827F    ret
*}
end;

//00468280
procedure sub_00468280(?:TBaseList);
begin
{*
 00468280    push        ebx
 00468281    mov         ebx,eax
 00468283    test        ebx,ebx
>00468285    je          00468299
 00468287    xor         edx,edx
 00468289    mov         eax,ebx
 0046828B    call        00468118
 00468290    xor         edx,edx
 00468292    mov         eax,ebx
 00468294    mov         ecx,dword ptr [eax]
 00468296    call        dword ptr [ecx+1C];TBaseList.sub_004681D8
 00468299    pop         ebx
 0046829A    ret
*}
end;

//0046829C
{*procedure sub_0046829C(?:?; ?:?; ?:?);
begin
 0046829C    push        ebx
 0046829D    push        esi
 0046829E    push        edi
 0046829F    push        ebp
 004682A0    mov         edi,ecx
 004682A2    mov         esi,edx
 004682A4    mov         ebx,eax
 004682A6    mov         ebp,dword ptr [ebx+20]
 004682A9    cmp         ebp,4
>004682AC    jne         004682BF
 004682AE    mov         eax,dword ptr [ebx+1C]
 004682B1    mov         edx,dword ptr [eax+esi*4]
 004682B4    mov         ecx,dword ptr [eax+edi*4]
 004682B7    mov         dword ptr [eax+esi*4],ecx
 004682BA    mov         dword ptr [eax+edi*4],edx
>004682BD    jmp         00468310
 004682BF    mov         eax,ebx
 004682C1    call        00468258
 004682C6    mov         edx,eax
 004682C8    mov         eax,esi
 004682CA    imul        eax,ebp
 004682CD    mov         ecx,dword ptr [ebx+1C]
 004682D0    lea         eax,[ecx+eax]
 004682D3    mov         ecx,dword ptr [ebx+20]
 004682D6    call        Move
 004682DB    mov         eax,dword ptr [ebx+20]
 004682DE    imul        esi,eax
 004682E1    mov         edx,dword ptr [ebx+1C]
 004682E4    add         edx,esi
 004682E6    mov         ecx,edi
 004682E8    imul        ecx,eax
 004682EB    mov         esi,dword ptr [ebx+1C]
 004682EE    lea         ecx,[esi+ecx]
 004682F1    xchg        eax,ecx
 004682F2    call        Move
 004682F7    mov         eax,ebx
 004682F9    call        00468258
 004682FE    mov         esi,dword ptr [ebx+20]
 00468301    imul        edi,esi
 00468304    mov         edx,dword ptr [ebx+1C]
 00468307    add         edx,edi
 00468309    mov         ecx,esi
 0046830B    call        Move
 00468310    pop         ebp
 00468311    pop         edi
 00468312    pop         esi
 00468313    pop         ebx
 00468314    ret
end;*}

//00468318
procedure sub_00468318(?:TIntegerList);
begin
{*
 00468318    push        ebx
 00468319    push        esi
 0046831A    push        edi
 0046831B    mov         edi,eax
 0046831D    xor         ebx,ebx
 0046831F    mov         esi,dword ptr [edi+8]
 00468322    dec         esi
 00468323    cmp         esi,ebx
>00468325    jle         00468338
 00468327    mov         ecx,esi
 00468329    mov         edx,ebx
 0046832B    mov         eax,edi
 0046832D    call        0046829C
 00468332    inc         ebx
 00468333    dec         esi
 00468334    cmp         esi,ebx
>00468336    jg          00468327
 00468338    pop         edi
 00468339    pop         esi
 0046833A    pop         ebx
 0046833B    ret
*}
end;

//0046833C
{*procedure TBaseVectorList.sub_00466814(?:?);
begin
 0046833C    push        ebx
 0046833D    mov         ebx,edx
 0046833F    mov         edx,ebx
 00468341    call        TBaseList.sub_00466814
 00468346    xor         edx,edx
 00468348    mov         eax,ebx
 0046834A    mov         ecx,dword ptr [eax]
 0046834C    call        dword ptr [ecx+8]
 0046834F    pop         ebx
 00468350    ret
end;*}

//00468354
{*procedure TBaseVectorList.sub_00466894(?:?);
begin
 00468354    push        ebx
 00468355    push        esi
 00468356    mov         esi,edx
 00468358    mov         ebx,eax
 0046835A    mov         edx,esi
 0046835C    mov         eax,ebx
 0046835E    call        TBaseList.sub_00466894
 00468363    mov         eax,esi
 00468365    mov         edx,dword ptr [eax]
 00468367    call        dword ptr [edx+0C]
 0046836A    test        eax,eax
>0046836C    je          00468377
 0046836E    mov         edx,eax
 00468370    mov         eax,ebx
 00468372    call        00466914
 00468377    pop         esi
 00468378    pop         ebx
 00468379    ret
end;*}

//0046837C
{*procedure TBaseVectorList.sub_0046837C(?:?; ?:?);
begin
 0046837C    push        ebx
 0046837D    push        esi
 0046837E    push        edi
 0046837F    add         esp,0FFFFFFEC
 00468382    mov         dword ptr [esp+8],ecx
 00468386    mov         dword ptr [esp+4],edx
 0046838A    mov         dword ptr [esp],eax
 0046838D    push        dword ptr ds:[5AD1D8]
 00468393    push        dword ptr ds:[5AD1D8]
 00468399    push        dword ptr ds:[5AD1D8]
 0046839F    mov         eax,dword ptr [esp+10]
 004683A3    call        0045C8DC
 004683A8    push        dword ptr ds:[5AD1DC]
 004683AE    push        dword ptr ds:[5AD1DC]
 004683B4    push        dword ptr ds:[5AD1DC]
 004683BA    mov         eax,dword ptr [esp+14]
 004683BE    call        0045C8DC
 004683C3    mov         eax,dword ptr [esp]
 004683C6    mov         edi,dword ptr [eax+8]
 004683C9    dec         edi
 004683CA    test        edi,edi
>004683CC    jl          0046842B
 004683CE    inc         edi
 004683CF    mov         dword ptr [esp+0C],0
 004683D7    mov         edx,dword ptr [esp+0C]
 004683DB    mov         eax,dword ptr [esp]
 004683DE    call        004689F8
 004683E3    mov         esi,eax
 004683E5    xor         ebx,ebx
 004683E7    mov         edx,dword ptr [esp+4]
 004683EB    mov         ecx,dword ptr [esp+8]
 004683EF    mov         eax,dword ptr [esi+ebx*4]
 004683F2    mov         dword ptr [esp+10],eax
 004683F6    fld         dword ptr [esp+10]
 004683FA    fcomp       dword ptr [edx]
 004683FC    fnstsw      al
 004683FE    sahf
>004683FF    jae         00468407
 00468401    mov         eax,dword ptr [esp+10]
 00468405    mov         dword ptr [edx],eax
 00468407    fld         dword ptr [esp+10]
 0046840B    fcomp       dword ptr [ecx]
 0046840D    fnstsw      al
 0046840F    sahf
>00468410    jbe         00468418
 00468412    mov         eax,dword ptr [esp+10]
 00468416    mov         dword ptr [ecx],eax
 00468418    inc         ebx
 00468419    add         ecx,4
 0046841C    add         edx,4
 0046841F    cmp         ebx,3
>00468422    jne         004683EF
 00468424    inc         dword ptr [esp+0C]
 00468428    dec         edi
>00468429    jne         004683D7
 0046842B    add         esp,14
 0046842E    pop         edi
 0046842F    pop         esi
 00468430    pop         ebx
 00468431    ret
end;*}

//00468434
{*procedure TBaseVectorList.sub_00468434(?:?);
begin
 00468434    push        ebx
 00468435    push        esi
 00468436    push        edi
 00468437    push        ebp
 00468438    mov         ebp,edx
 0046843A    mov         edi,eax
 0046843C    mov         eax,[005AE438];^gvar_005ACF18
 00468441    mov         edx,dword ptr [eax]
 00468443    mov         dword ptr [ebp],edx
 00468446    mov         edx,dword ptr [eax+4]
 00468449    mov         dword ptr [ebp+4],edx
 0046844C    mov         edx,dword ptr [eax+8]
 0046844F    mov         dword ptr [ebp+8],edx
 00468452    mov         ebx,dword ptr [edi+8];TBaseVectorList.?f8:dword
 00468455    dec         ebx
 00468456    test        ebx,ebx
>00468458    jl          00468473
 0046845A    inc         ebx
 0046845B    xor         esi,esi
 0046845D    mov         edx,esi
 0046845F    mov         eax,edi
 00468461    call        004689F8
 00468466    mov         edx,eax
 00468468    mov         eax,ebp
 0046846A    call        0045CADC
 0046846F    inc         esi
 00468470    dec         ebx
>00468471    jne         0046845D
 00468473    pop         ebp
 00468474    pop         edi
 00468475    pop         esi
 00468476    pop         ebx
 00468477    ret
end;*}

//00468478
procedure TBaseVectorList.sub_00468478;
begin
{*
 00468478    push        ebx
 00468479    push        esi
 0046847A    push        edi
 0046847B    mov         edi,eax
 0046847D    mov         ebx,dword ptr [edi+8];TBaseVectorList.?f8:dword
 00468480    dec         ebx
 00468481    test        ebx,ebx
>00468483    jl          0046849A
 00468485    inc         ebx
 00468486    xor         esi,esi
 00468488    mov         edx,esi
 0046848A    mov         eax,edi
 0046848C    call        004689F8
 00468491    call        0045D460
 00468496    inc         esi
 00468497    dec         ebx
>00468498    jne         00468488
 0046849A    pop         edi
 0046849B    pop         esi
 0046849C    pop         ebx
 0046849D    ret
*}
end;

//004684A0
{*procedure TBaseVectorList.sub_004684A0(?:?);
begin
 004684A0    push        ebx
 004684A1    push        esi
 004684A2    push        edi
 004684A3    push        ebp
 004684A4    add         esp,0FFFFFFF8
 004684A7    mov         ebp,edx
 004684A9    mov         edi,eax
 004684AB    mov         eax,dword ptr [ebp+8]
 004684AE    cmp         eax,dword ptr [edi+8];TBaseVectorList.?f8:dword
>004684B1    je          004684C7
 004684B3    mov         ecx,3F9
 004684B8    mov         edx,468520;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 004684BD    mov         eax,468564;'Assertion failure'
 004684C2    call        @Assert
 004684C7    xor         eax,eax
 004684C9    mov         dword ptr [esp],eax
 004684CC    mov         esi,dword ptr [edi+8];TBaseVectorList.?f8:dword
 004684CF    dec         esi
 004684D0    test        esi,esi
>004684D2    jl          0046850C
 004684D4    inc         esi
 004684D5    xor         ebx,ebx
 004684D7    mov         edx,ebx
 004684D9    mov         eax,ebp
 004684DB    call        004689F8
 004684E0    push        eax
 004684E1    mov         edx,ebx
 004684E3    mov         eax,edi
 004684E5    call        004689F8
 004684EA    pop         edx
 004684EB    call        0045D90C
 004684F0    fstp        dword ptr [esp+4]
 004684F4    wait
 004684F5    fld         dword ptr [esp+4]
 004684F9    fcomp       dword ptr [esp]
 004684FC    fnstsw      al
 004684FE    sahf
>004684FF    jbe         00468508
 00468501    mov         eax,dword ptr [esp+4]
 00468505    mov         dword ptr [esp],eax
 00468508    inc         ebx
 00468509    dec         esi
>0046850A    jne         004684D7
 0046850C    fld         dword ptr [esp]
 0046850F    pop         ecx
 00468510    pop         edx
 00468511    pop         ebp
 00468512    pop         edi
 00468513    pop         esi
 00468514    pop         ebx
 00468515    ret
end;*}

//00468578
{*procedure TBaseVectorList.sub_00468578(?:?);
begin
 00468578    push        ebx
 00468579    push        esi
 0046857A    push        edi
 0046857B    push        ebp
 0046857C    mov         ebp,edx
 0046857E    mov         edi,eax
 00468580    mov         ebx,dword ptr [edi+8];TBaseVectorList.?f8:dword
 00468583    dec         ebx
 00468584    test        ebx,ebx
>00468586    jl          0046859F
 00468588    inc         ebx
 00468589    xor         esi,esi
 0046858B    mov         edx,esi
 0046858D    mov         eax,edi
 0046858F    call        004689F8
 00468594    mov         edx,ebp
 00468596    call        0045CADC
 0046859B    inc         esi
 0046859C    dec         ebx
>0046859D    jne         0046858B
 0046859F    pop         ebp
 004685A0    pop         edi
 004685A1    pop         esi
 004685A2    pop         ebx
 004685A3    ret
end;*}

//004685A4
{*procedure TBaseVectorList.sub_004685A4(?:?);
begin
 004685A4    push        ebx
 004685A5    push        esi
 004685A6    push        edi
 004685A7    push        ebp
 004685A8    mov         ebp,edx
 004685AA    mov         edi,eax
 004685AC    mov         eax,dword ptr [edi+8];TBaseVectorList.?f8:dword
 004685AF    cmp         eax,dword ptr [ebp+8]
>004685B2    jle         004685C8
 004685B4    mov         ecx,412
 004685B9    mov         edx,468600;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 004685BE    mov         eax,468644;'Assertion failure'
 004685C3    call        @Assert
 004685C8    mov         esi,dword ptr [edi+8];TBaseVectorList.?f8:dword
 004685CB    dec         esi
 004685CC    test        esi,esi
>004685CE    jl          004685F0
 004685D0    inc         esi
 004685D1    xor         ebx,ebx
 004685D3    mov         edx,ebx
 004685D5    mov         eax,ebp
 004685D7    call        004689F8
 004685DC    push        eax
 004685DD    mov         edx,ebx
 004685DF    mov         eax,edi
 004685E1    call        004689F8
 004685E6    pop         edx
 004685E7    call        0045CADC
 004685EC    inc         ebx
 004685ED    dec         esi
>004685EE    jne         004685D3
 004685F0    pop         ebp
 004685F1    pop         edi
 004685F2    pop         esi
 004685F3    pop         ebx
 004685F4    ret
end;*}

//00468658
{*procedure TBaseVectorList.sub_00468658(?:?);
begin
 00468658    push        ebx
 00468659    push        esi
 0046865A    push        edi
 0046865B    push        ebp
 0046865C    mov         ebp,edx
 0046865E    mov         edi,eax
 00468660    mov         eax,dword ptr [edi+8];TBaseVectorList.?f8:dword
 00468663    cmp         eax,dword ptr [ebp+8]
>00468666    jle         0046867C
 00468668    mov         ecx,41D
 0046866D    mov         edx,4686B4;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 00468672    mov         eax,4686F8;'Assertion failure'
 00468677    call        @Assert
 0046867C    mov         esi,dword ptr [edi+8];TBaseVectorList.?f8:dword
 0046867F    dec         esi
 00468680    test        esi,esi
>00468682    jl          004686A4
 00468684    inc         esi
 00468685    xor         ebx,ebx
 00468687    mov         edx,ebx
 00468689    mov         eax,ebp
 0046868B    call        004689F8
 00468690    push        eax
 00468691    mov         edx,ebx
 00468693    mov         eax,edi
 00468695    call        004689F8
 0046869A    pop         edx
 0046869B    call        0045CC94
 004686A0    inc         ebx
 004686A1    dec         esi
>004686A2    jne         00468687
 004686A4    pop         ebp
 004686A5    pop         edi
 004686A6    pop         esi
 004686A7    pop         ebx
 004686A8    ret
end;*}

//0046870C
{*procedure sub_0046870C(?:TAffineVectorList; ?:?; ?:?; ?:?);
begin
 0046870C    push        ebp
 0046870D    mov         ebp,esp
 0046870F    add         esp,0FFFFFFEC
 00468712    push        ebx
 00468713    push        esi
 00468714    push        edi
 00468715    mov         edi,ecx
 00468717    mov         ebx,edx
 00468719    mov         esi,eax
 0046871B    mov         eax,dword ptr [edi+8]
 0046871E    cmp         eax,dword ptr [ebx+8]
>00468721    je          00468737
 00468723    mov         ecx,428
 00468728    mov         edx,4687F8;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 0046872D    mov         eax,46883C;'Assertion failure'
 00468732    call        @Assert
 00468737    cmp         edi,ebx
>00468739    je          004687DD
 0046873F    fld         dword ptr [ebp+8]
 00468742    fcomp       dword ptr ds:[468850];0:Single
 00468748    fnstsw      al
 0046874A    sahf
>0046874B    jne         0046875B
 0046874D    mov         edx,ebx
 0046874F    mov         eax,esi
 00468751    mov         ecx,dword ptr [eax]
 00468753    call        dword ptr [ecx+8]
>00468756    jmp         004687E6
 0046875B    fld         dword ptr [ebp+8]
 0046875E    fcomp       dword ptr ds:[468854];1:Single
 00468764    fnstsw      al
 00468766    sahf
>00468767    jne         00468774
 00468769    mov         edx,edi
 0046876B    mov         eax,esi
 0046876D    mov         ecx,dword ptr [eax]
 0046876F    call        dword ptr [ecx+8]
>00468772    jmp         004687E6
 00468774    mov         edx,dword ptr [ebx+8]
 00468777    mov         eax,esi
 00468779    mov         ecx,dword ptr [eax]
 0046877B    call        dword ptr [ecx+1C]
 0046877E    mov         eax,dword ptr [ebx+8]
 00468781    mov         dword ptr [esi+8],eax
 00468784    mov         eax,dword ptr [ebx+8]
 00468787    dec         eax
 00468788    test        eax,eax
>0046878A    jl          004687E6
 0046878C    inc         eax
 0046878D    mov         dword ptr [ebp-8],eax
 00468790    mov         dword ptr [ebp-4],0
 00468797    push        dword ptr [ebp+8]
 0046879A    mov         edx,dword ptr [ebp-4]
 0046879D    mov         eax,edi
 0046879F    call        004689F8
 004687A4    push        eax
 004687A5    mov         edx,dword ptr [ebp-4]
 004687A8    mov         eax,ebx
 004687AA    call        004689F8
 004687AF    lea         ecx,[ebp-14]
 004687B2    pop         edx
 004687B3    call        0045D074
 004687B8    mov         edx,dword ptr [ebp-4]
 004687BB    mov         eax,esi
 004687BD    call        004689F8
 004687C2    mov         edx,dword ptr [ebp-14]
 004687C5    mov         dword ptr [eax],edx
 004687C7    mov         edx,dword ptr [ebp-10]
 004687CA    mov         dword ptr [eax+4],edx
 004687CD    mov         edx,dword ptr [ebp-0C]
 004687D0    mov         dword ptr [eax+8],edx
 004687D3    inc         dword ptr [ebp-4]
 004687D6    dec         dword ptr [ebp-8]
>004687D9    jne         00468797
>004687DB    jmp         004687E6
 004687DD    mov         edx,ebx
 004687DF    mov         eax,esi
 004687E1    mov         ecx,dword ptr [eax]
 004687E3    call        dword ptr [ecx+8]
 004687E6    pop         edi
 004687E7    pop         esi
 004687E8    pop         ebx
 004687E9    mov         esp,ebp
 004687EB    pop         ebp
 004687EC    ret         4
end;*}

//00468858
{*procedure sub_00468858(?:?; ?:TAffineVectorList; ?:?);
begin
 00468858    push        ebp
 00468859    mov         ebp,esp
 0046885B    add         esp,0FFFFFFF0
 0046885E    push        ebx
 0046885F    push        esi
 00468860    push        edi
 00468861    mov         dword ptr [ebp-4],edx
 00468864    mov         esi,eax
 00468866    mov         eax,dword ptr [ebp-4]
 00468869    mov         eax,dword ptr [eax+8]
 0046886C    cmp         eax,dword ptr [esi+8]
>0046886F    je          00468885
 00468871    mov         ecx,43F
 00468876    mov         edx,4688E0;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 0046887B    mov         eax,468924;'Assertion failure'
 00468880    call        @Assert
 00468885    mov         edi,dword ptr [esi+8]
 00468888    dec         edi
 00468889    test        edi,edi
>0046888B    jl          004688CE
 0046888D    inc         edi
 0046888E    xor         ebx,ebx
 00468890    push        dword ptr [ebp+8]
 00468893    mov         edx,ebx
 00468895    mov         eax,dword ptr [ebp-4]
 00468898    call        004689F8
 0046889D    push        eax
 0046889E    mov         edx,ebx
 004688A0    mov         eax,esi
 004688A2    call        004689F8
 004688A7    lea         ecx,[ebp-10]
 004688AA    pop         edx
 004688AB    call        0045D164
 004688B0    mov         edx,ebx
 004688B2    mov         eax,esi
 004688B4    call        004689F8
 004688B9    mov         edx,dword ptr [ebp-10]
 004688BC    mov         dword ptr [eax],edx
 004688BE    mov         edx,dword ptr [ebp-0C]
 004688C1    mov         dword ptr [eax+4],edx
 004688C4    mov         edx,dword ptr [ebp-8]
 004688C7    mov         dword ptr [eax+8],edx
 004688CA    inc         ebx
 004688CB    dec         edi
>004688CC    jne         00468890
 004688CE    pop         edi
 004688CF    pop         esi
 004688D0    pop         ebx
 004688D1    mov         esp,ebp
 004688D3    pop         ebp
 004688D4    ret         4
end;*}

//00468938
{*procedure TBaseVectorList.sub_00468938(?:?; ?:?);
begin
 00468938    push        ebp
 00468939    mov         ebp,esp
 0046893B    push        ecx
 0046893C    push        ebx
 0046893D    push        esi
 0046893E    push        edi
 0046893F    mov         dword ptr [ebp-4],edx
 00468942    mov         edi,eax
 00468944    mov         eax,dword ptr [ebp-4]
 00468947    mov         eax,dword ptr [eax+8]
 0046894A    cmp         eax,dword ptr [edi+8];TBaseVectorList.?f8:dword
>0046894D    jge         00468963
 0046894F    mov         ecx,44C
 00468954    mov         edx,4689A0;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 00468959    mov         eax,4689E4;'Assertion failure'
 0046895E    call        @Assert
 00468963    mov         esi,dword ptr [edi+8];TBaseVectorList.?f8:dword
 00468966    dec         esi
 00468967    test        esi,esi
>00468969    jl          0046898F
 0046896B    inc         esi
 0046896C    xor         ebx,ebx
 0046896E    mov         edx,ebx
 00468970    mov         eax,dword ptr [ebp-4]
 00468973    call        004689F8
 00468978    push        eax
 00468979    mov         edx,ebx
 0046897B    mov         eax,edi
 0046897D    call        004689F8
 00468982    lea         ecx,[ebp+8]
 00468985    pop         edx
 00468986    call        0045CCF8
 0046898B    inc         ebx
 0046898C    dec         esi
>0046898D    jne         0046896E
 0046898F    pop         edi
 00468990    pop         esi
 00468991    pop         ebx
 00468992    pop         ecx
 00468993    pop         ebp
 00468994    ret         4
end;*}

//004689F8
{*function sub_004689F8(?:TBaseVectorList; ?:?):?;
begin
 004689F8    imul        edx,dword ptr [eax+20];TBaseVectorList.?f20:Integer
 004689FC    mov         eax,dword ptr [eax+1C];TBaseVectorList.?f1C:dword
 004689FF    add         eax,edx
 00468A01    ret
end;*}

//00468A04
constructor TAffineVectorList.Create;
begin
{*
 00468A04    push        ebx
 00468A05    push        esi
 00468A06    test        dl,dl
>00468A08    je          00468A12
 00468A0A    add         esp,0FFFFFFF0
 00468A0D    call        @ClassCreate
 00468A12    mov         ebx,edx
 00468A14    mov         esi,eax
 00468A16    mov         dword ptr [esi+20],0C;TAffineVectorList.?f20:Integer
 00468A1D    xor         edx,edx
 00468A1F    mov         eax,esi
 00468A21    call        00467FB4
 00468A26    mov         dword ptr [esi+10],10;TAffineVectorList.?f10:dword
 00468A2D    mov         eax,esi
 00468A2F    test        bl,bl
>00468A31    je          00468A42
 00468A33    call        @AfterConstruction
 00468A38    pop         dword ptr fs:[0]
 00468A3F    add         esp,0C
 00468A42    mov         eax,esi
 00468A44    pop         esi
 00468A45    pop         ebx
 00468A46    ret
*}
end;

//00468A48
procedure TAffineVectorList.Assign(Source:TPersistent);
begin
{*
 00468A48    push        ebx
 00468A49    push        esi
 00468A4A    mov         esi,edx
 00468A4C    mov         ebx,eax
 00468A4E    test        esi,esi
>00468A50    je          00468A83
 00468A52    mov         edx,esi
 00468A54    mov         eax,ebx
 00468A56    call        TBaseList.Assign
 00468A5B    mov         eax,esi
 00468A5D    mov         edx,dword ptr ds:[467A00];TAffineVectorList
 00468A63    call        @IsClass
 00468A68    test        al,al
>00468A6A    je          00468A8A
 00468A6C    mov         ecx,dword ptr [ebx+8];TAffineVectorList.?f8:dword
 00468A6F    shl         ecx,2
 00468A72    lea         ecx,[ecx+ecx*2]
 00468A75    mov         edx,dword ptr [ebx+24];TAffineVectorList.?f24:dword
 00468A78    mov         eax,dword ptr [esi+24]
 00468A7B    call        Move
 00468A80    pop         esi
 00468A81    pop         ebx
 00468A82    ret
 00468A83    mov         eax,ebx
 00468A85    call        00468280
 00468A8A    pop         esi
 00468A8B    pop         ebx
 00468A8C    ret
*}
end;

//00468A90
{*function sub_00468A90(?:TAffineVectorList; ?:Integer):?;
begin
 00468A90    push        ebx
 00468A91    push        esi
 00468A92    push        edi
 00468A93    mov         edi,edx
 00468A95    mov         ebx,eax
 00468A97    mov         esi,dword ptr [ebx+8]
 00468A9A    mov         eax,dword ptr [ebx+0C]
 00468A9D    cmp         esi,eax
>00468A9F    jne         00468AAD
 00468AA1    mov         edx,eax
 00468AA3    add         edx,dword ptr [ebx+10]
 00468AA6    mov         eax,ebx
 00468AA8    mov         ecx,dword ptr [eax]
 00468AAA    call        dword ptr [ecx+1C]
 00468AAD    lea         eax,[esi+esi*2]
 00468AB0    mov         edx,dword ptr [ebx+24]
 00468AB3    mov         ecx,dword ptr [edi]
 00468AB5    mov         dword ptr [edx+eax*4],ecx
 00468AB8    mov         ecx,dword ptr [edi+4]
 00468ABB    mov         dword ptr [edx+eax*4+4],ecx
 00468ABF    mov         ecx,dword ptr [edi+8]
 00468AC2    mov         dword ptr [edx+eax*4+8],ecx
 00468AC6    inc         dword ptr [ebx+8]
 00468AC9    mov         eax,esi
 00468ACB    pop         edi
 00468ACC    pop         esi
 00468ACD    pop         ebx
 00468ACE    ret
end;*}

//00468AD0
{*procedure sub_00468AD0(?:?; ?:Integer; ?:Integer; ?:?);
begin
 00468AD0    push        ebp
 00468AD1    mov         ebp,esp
 00468AD3    push        ecx
 00468AD4    push        ebx
 00468AD5    push        esi
 00468AD6    mov         dword ptr [ebp-4],ecx
 00468AD9    mov         esi,edx
 00468ADB    mov         ebx,eax
 00468ADD    add         dword ptr [ebx+8],3
>00468AE1    jmp         00468AEF
 00468AE3    mov         edx,eax
 00468AE5    add         edx,dword ptr [ebx+10]
 00468AE8    mov         eax,ebx
 00468AEA    mov         ecx,dword ptr [eax]
 00468AEC    call        dword ptr [ecx+1C]
 00468AEF    mov         eax,dword ptr [ebx+0C]
 00468AF2    cmp         eax,dword ptr [ebx+8]
>00468AF5    jl          00468AE3
 00468AF7    mov         eax,dword ptr [ebx+8]
 00468AFA    lea         eax,[eax+eax*2]
 00468AFD    mov         edx,dword ptr [ebx+24]
 00468B00    mov         ecx,dword ptr [esi]
 00468B02    mov         dword ptr [edx+eax*4-24],ecx
 00468B06    mov         ecx,dword ptr [esi+4]
 00468B09    mov         dword ptr [edx+eax*4-20],ecx
 00468B0D    mov         ecx,dword ptr [esi+8]
 00468B10    mov         dword ptr [edx+eax*4-1C],ecx
 00468B14    mov         eax,dword ptr [ebx+8]
 00468B17    lea         eax,[eax+eax*2]
 00468B1A    mov         edx,dword ptr [ebx+24]
 00468B1D    mov         ecx,dword ptr [ebp-4]
 00468B20    mov         esi,dword ptr [ecx]
 00468B22    mov         dword ptr [edx+eax*4-18],esi
 00468B26    mov         esi,dword ptr [ecx+4]
 00468B29    mov         dword ptr [edx+eax*4-14],esi
 00468B2D    mov         esi,dword ptr [ecx+8]
 00468B30    mov         dword ptr [edx+eax*4-10],esi
 00468B34    mov         eax,dword ptr [ebx+8]
 00468B37    lea         eax,[eax+eax*2]
 00468B3A    mov         edx,dword ptr [ebx+24]
 00468B3D    mov         ecx,dword ptr [ebp+8]
 00468B40    mov         ebx,dword ptr [ecx]
 00468B42    mov         dword ptr [edx+eax*4-0C],ebx
 00468B46    mov         ebx,dword ptr [ecx+4]
 00468B49    mov         dword ptr [edx+eax*4-8],ebx
 00468B4D    mov         ebx,dword ptr [ecx+8]
 00468B50    mov         dword ptr [edx+eax*4-4],ebx
 00468B54    pop         esi
 00468B55    pop         ebx
 00468B56    pop         ecx
 00468B57    pop         ebp
 00468B58    ret         4
end;*}

//00468B5C
procedure sub_00468B5C(?:TAffineVectorList; ?:Integer);
begin
{*
 00468B5C    push        ebx
 00468B5D    push        esi
 00468B5E    add         esp,0FFFFFFF4
 00468B61    mov         esi,edx
 00468B63    mov         ebx,eax
 00468B65    push        dword ptr [esi]
 00468B67    push        dword ptr [esi+4]
 00468B6A    push        0
 00468B6C    lea         eax,[esp+0C]
 00468B70    call        0045C8C4
 00468B75    mov         edx,esp
 00468B77    mov         eax,ebx
 00468B79    call        00468A90
 00468B7E    add         esp,0C
 00468B81    pop         esi
 00468B82    pop         ebx
 00468B83    ret
*}
end;

//00468B84
{*function sub_00468B84(?:?; ?:?; ?:?; ?:?):?;
begin
 00468B84    push        ebp
 00468B85    mov         ebp,esp
 00468B87    push        ebx
 00468B88    push        esi
 00468B89    mov         ebx,eax
 00468B8B    mov         esi,dword ptr [ebx+8]
 00468B8E    inc         dword ptr [ebx+8]
>00468B91    jmp         00468B9F
 00468B93    mov         edx,eax
 00468B95    add         edx,dword ptr [ebx+10]
 00468B98    mov         eax,ebx
 00468B9A    mov         ecx,dword ptr [eax]
 00468B9C    call        dword ptr [ecx+1C]
 00468B9F    mov         eax,dword ptr [ebx+0C]
 00468BA2    cmp         eax,dword ptr [ebx+8]
>00468BA5    jl          00468B93
 00468BA7    lea         eax,[esi+esi*2]
 00468BAA    mov         edx,dword ptr [ebx+24]
 00468BAD    lea         eax,[edx+eax*4]
 00468BB0    mov         edx,dword ptr [ebp+10]
 00468BB3    mov         dword ptr [eax],edx
 00468BB5    mov         edx,dword ptr [ebp+0C]
 00468BB8    mov         dword ptr [eax+4],edx
 00468BBB    mov         edx,dword ptr [ebp+8]
 00468BBE    mov         dword ptr [eax+8],edx
 00468BC1    mov         eax,esi
 00468BC3    pop         esi
 00468BC4    pop         ebx
 00468BC5    pop         ebp
 00468BC6    ret         0C
end;*}

//00468BCC
procedure sub_00468BCC(?:TAffineVectorList; ?:TAffineVectorList);
begin
{*
 00468BCC    push        ebx
 00468BCD    push        esi
 00468BCE    mov         ebx,edx
 00468BD0    mov         esi,eax
 00468BD2    test        ebx,ebx
>00468BD4    je          00468C13
 00468BD6    cmp         dword ptr [ebx+8],0
>00468BDA    jle         00468C13
 00468BDC    mov         eax,dword ptr [esi+8]
 00468BDF    add         eax,dword ptr [ebx+8]
 00468BE2    cmp         eax,dword ptr [esi+0C]
>00468BE5    jle         00468BF0
 00468BE7    mov         edx,eax
 00468BE9    mov         eax,esi
 00468BEB    mov         ecx,dword ptr [eax]
 00468BED    call        dword ptr [ecx+1C]
 00468BF0    mov         eax,dword ptr [esi+8]
 00468BF3    lea         eax,[eax+eax*2]
 00468BF6    mov         edx,dword ptr [esi+24]
 00468BF9    lea         edx,[edx+eax*4]
 00468BFC    mov         ecx,dword ptr [ebx+8]
 00468BFF    shl         ecx,2
 00468C02    lea         ecx,[ecx+ecx*2]
 00468C05    mov         eax,dword ptr [ebx+24]
 00468C08    call        Move
 00468C0D    mov         eax,dword ptr [ebx+8]
 00468C10    add         dword ptr [esi+8],eax
 00468C13    pop         esi
 00468C14    pop         ebx
 00468C15    ret
*}
end;

//00468C18
procedure sub_00468C18(?:TAffineVectorList; ?:Integer; ?:Integer);
begin
{*
 00468C18    push        ebx
 00468C19    mov         ebx,ecx
 00468C1B    lea         edx,[edx+edx*2]
 00468C1E    mov         eax,dword ptr [eax+24]
 00468C21    mov         ecx,dword ptr [eax+edx*4]
 00468C24    mov         dword ptr [ebx],ecx
 00468C26    mov         ecx,dword ptr [eax+edx*4+4]
 00468C2A    mov         dword ptr [ebx+4],ecx
 00468C2D    mov         ecx,dword ptr [eax+edx*4+8]
 00468C31    mov         dword ptr [ebx+8],ecx
 00468C34    pop         ebx
 00468C35    ret
*}
end;

//00468C38
{*function sub_00468C38(?:?; ?:?):?;
begin
 00468C38    push        ebx
 00468C39    push        esi
 00468C3A    push        edi
 00468C3B    push        ebp
 00468C3C    push        ecx
 00468C3D    mov         ebp,edx
 00468C3F    mov         edi,eax
 00468C41    mov         dword ptr [esp],0FFFFFFFF
 00468C48    mov         esi,dword ptr [edi+8]
 00468C4B    dec         esi
 00468C4C    test        esi,esi
>00468C4E    jl          00468C70
 00468C50    inc         esi
 00468C51    xor         ebx,ebx
 00468C53    lea         eax,[ebx+ebx*2]
 00468C56    mov         edx,dword ptr [edi+24]
 00468C59    lea         edx,[edx+eax*4]
 00468C5C    mov         eax,ebp
 00468C5E    call        0045D898
 00468C63    test        al,al
>00468C65    je          00468C6C
 00468C67    mov         dword ptr [esp],ebx
>00468C6A    jmp         00468C70
 00468C6C    inc         ebx
 00468C6D    dec         esi
>00468C6E    jne         00468C53
 00468C70    mov         eax,dword ptr [esp]
 00468C73    pop         edx
 00468C74    pop         ebp
 00468C75    pop         edi
 00468C76    pop         esi
 00468C77    pop         ebx
 00468C78    ret
end;*}

//00468C7C
{*function sub_00468C7C(?:?; ?:?):?;
begin
 00468C7C    push        ebx
 00468C7D    push        esi
 00468C7E    mov         esi,edx
 00468C80    mov         ebx,eax
 00468C82    mov         edx,esi
 00468C84    mov         eax,ebx
 00468C86    call        00468C38
 00468C8B    test        eax,eax
>00468C8D    jge         00468C98
 00468C8F    mov         edx,esi
 00468C91    mov         eax,ebx
 00468C93    call        00468A90
 00468C98    pop         esi
 00468C99    pop         ebx
 00468C9A    ret
end;*}

//00468C9C
{*procedure sub_00468C9C(?:TAffineVectorList; ?:?; ?:Integer);
begin
 00468C9C    push        ebx
 00468C9D    mov         ebx,ecx
 00468C9F    lea         edx,[edx+edx*2]
 00468CA2    mov         eax,dword ptr [eax+24]
 00468CA5    mov         ecx,dword ptr [ebx]
 00468CA7    mov         dword ptr [eax+edx*4],ecx
 00468CAA    mov         ecx,dword ptr [ebx+4]
 00468CAD    mov         dword ptr [eax+edx*4+4],ecx
 00468CB1    mov         ecx,dword ptr [ebx+8]
 00468CB4    mov         dword ptr [eax+edx*4+8],ecx
 00468CB8    pop         ebx
 00468CB9    ret
end;*}

//00468CBC
procedure sub_00468CBC;
begin
{*
 00468CBC    push        ebx
 00468CBD    mov         ebx,eax
 00468CBF    mov         eax,ebx
 00468CC1    call        004681D8
 00468CC6    mov         eax,dword ptr [ebx+1C];TAffineVectorList.?f1C:dword
 00468CC9    mov         dword ptr [ebx+24],eax;TAffineVectorList.?f24:dword
 00468CCC    pop         ebx
 00468CCD    ret
*}
end;

//00468CD0
{*procedure TAffineVectorList.sub_00468578(?:?);
begin
 00468CD0    mov         ecx,dword ptr [eax+24];TAffineVectorList.?f24:dword
 00468CD3    push        ecx
 00468CD4    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 00468CD7    xchg        eax,ecx
 00468CD8    call        0045CB40
 00468CDD    ret
end;*}

//00468CE0
{*procedure sub_00468CE0(?:?; ?:?; ?:?);
begin
 00468CE0    lea         edx,[edx+edx*2]
 00468CE3    mov         eax,dword ptr [eax+24]
 00468CE6    lea         eax,[eax+edx*4]
 00468CE9    mov         edx,ecx
 00468CEB    call        0045CADC
 00468CF0    ret
end;*}

//00468CF4
procedure TAffineVectorList.sub_00468478;
begin
{*
 00468CF4    mov         edx,dword ptr [eax+8];TAffineVectorList.?f8:dword
 00468CF7    mov         eax,dword ptr [eax+24];TAffineVectorList.?f24:dword
 00468CFA    call        0045D558
 00468CFF    ret
*}
end;

//00468D00
{*procedure TAffineVectorList.sub_00468D00(?:?; ?:?; ?:?);
begin
 00468D00    push        ebp
 00468D01    mov         ebp,esp
 00468D03    push        ebx
 00468D04    push        esi
 00468D05    push        edi
 00468D06    mov         edi,ecx
 00468D08    mov         esi,edx
 00468D0A    mov         ebx,eax
 00468D0C    mov         eax,esi
 00468D0E    mov         edx,dword ptr ds:[467A00];TAffineVectorList
 00468D14    call        @IsClass
 00468D19    test        al,al
>00468D1B    je          00468D6D
 00468D1D    mov         eax,edi
 00468D1F    mov         edx,dword ptr ds:[467A00];TAffineVectorList
 00468D25    call        @IsClass
 00468D2A    test        al,al
>00468D2C    je          00468D6D
 00468D2E    mov         eax,dword ptr [edi+8]
 00468D31    cmp         eax,dword ptr [esi+8]
>00468D34    je          00468D4A
 00468D36    mov         ecx,5BA
 00468D3B    mov         edx,468D7C;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 00468D40    mov         eax,468DC0;'Assertion failure'
 00468D45    call        @Assert
 00468D4A    mov         edx,dword ptr [esi+8]
 00468D4D    mov         eax,ebx
 00468D4F    mov         ecx,dword ptr [eax]
 00468D51    call        dword ptr [ecx+1C];TAffineVectorList.sub_00468CBC
 00468D54    mov         eax,dword ptr [esi+8]
 00468D57    mov         dword ptr [ebx+8],eax;TAffineVectorList.?f8:dword
 00468D5A    push        dword ptr [ebp+8]
 00468D5D    mov         edx,dword ptr [ebx+24];TAffineVectorList.?f24:dword
 00468D60    push        edx
 00468D61    mov         edx,dword ptr [edi+24]
 00468D64    mov         ecx,dword ptr [esi+24]
 00468D67    xchg        eax,ecx
 00468D68    call        0045D368
 00468D6D    pop         edi
 00468D6E    pop         esi
 00468D6F    pop         ebx
 00468D70    pop         ebp
 00468D71    ret         4
end;*}

//00468DD4
{*procedure sub_00468DD4(?:?; ?:?);
begin
 00468DD4    push        ebp
 00468DD5    mov         ebp,esp
 00468DD7    mov         edx,eax
 00468DD9    mov         ecx,dword ptr [edx+8]
 00468DDC    test        ecx,ecx
>00468DDE    jle         00468DFC
 00468DE0    fld         dword ptr [ebp+8]
 00468DE3    fcomp       dword ptr ds:[468E00];1:Single
 00468DE9    fnstsw      al
 00468DEB    sahf
>00468DEC    je          00468DFC
 00468DEE    mov         eax,dword ptr [edx+24]
 00468DF1    lea         edx,[ecx+ecx*2]
 00468DF4    lea         ecx,[ebp+8]
 00468DF7    call        0045F718
 00468DFC    pop         ebp
 00468DFD    ret         4
end;*}

//00468E04
{*procedure sub_00468E04(?:?; ?:?);
begin
 00468E04    push        ebx
 00468E05    push        esi
 00468E06    push        edi
 00468E07    push        ebp
 00468E08    mov         ebp,edx
 00468E0A    mov         edi,eax
 00468E0C    mov         ebx,dword ptr [edi+8]
 00468E0F    dec         ebx
 00468E10    test        ebx,ebx
>00468E12    jl          00468E2B
 00468E14    inc         ebx
 00468E15    xor         esi,esi
 00468E17    lea         eax,[esi+esi*2]
 00468E1A    mov         edx,dword ptr [edi+24]
 00468E1D    lea         eax,[edx+eax*4]
 00468E20    mov         edx,ebp
 00468E22    call        0045D7E0
 00468E27    inc         esi
 00468E28    dec         ebx
>00468E29    jne         00468E17
 00468E2B    pop         ebp
 00468E2C    pop         edi
 00468E2D    pop         esi
 00468E2E    pop         ebx
 00468E2F    ret
end;*}

//00468E30
constructor TVectorList.Create;
begin
{*
 00468E30    push        ebx
 00468E31    push        esi
 00468E32    test        dl,dl
>00468E34    je          00468E3E
 00468E36    add         esp,0FFFFFFF0
 00468E39    call        @ClassCreate
 00468E3E    mov         ebx,edx
 00468E40    mov         esi,eax
 00468E42    mov         dword ptr [esi+20],10;TVectorList.?f20:Integer
 00468E49    xor         edx,edx
 00468E4B    mov         eax,esi
 00468E4D    call        00467FB4
 00468E52    mov         dword ptr [esi+10],10;TVectorList.?f10:dword
 00468E59    mov         eax,esi
 00468E5B    test        bl,bl
>00468E5D    je          00468E6E
 00468E5F    call        @AfterConstruction
 00468E64    pop         dword ptr fs:[0]
 00468E6B    add         esp,0C
 00468E6E    mov         eax,esi
 00468E70    pop         esi
 00468E71    pop         ebx
 00468E72    ret
*}
end;

//00468E74
procedure TVectorList.Assign(Source:TPersistent);
begin
{*
 00468E74    push        ebx
 00468E75    push        esi
 00468E76    mov         esi,edx
 00468E78    mov         ebx,eax
 00468E7A    test        esi,esi
>00468E7C    je          00468EAC
 00468E7E    mov         edx,esi
 00468E80    mov         eax,ebx
 00468E82    call        TBaseList.Assign
 00468E87    mov         eax,esi
 00468E89    mov         edx,dword ptr ds:[467AC4];TVectorList
 00468E8F    call        @IsClass
 00468E94    test        al,al
>00468E96    je          00468EB3
 00468E98    mov         ecx,dword ptr [ebx+8];TVectorList.?f8:dword
 00468E9B    shl         ecx,4
 00468E9E    mov         edx,dword ptr [ebx+24];TVectorList.?f24:dword
 00468EA1    mov         eax,dword ptr [esi+24]
 00468EA4    call        Move
 00468EA9    pop         esi
 00468EAA    pop         ebx
 00468EAB    ret
 00468EAC    mov         eax,ebx
 00468EAE    call        00468280
 00468EB3    pop         esi
 00468EB4    pop         ebx
 00468EB5    ret
*}
end;

//00468EB8
{*function sub_00468EB8(?:TVectorList; ?:?):?;
begin
 00468EB8    push        ebx
 00468EB9    push        esi
 00468EBA    push        edi
 00468EBB    mov         edi,edx
 00468EBD    mov         ebx,eax
 00468EBF    mov         esi,dword ptr [ebx+8]
 00468EC2    mov         eax,dword ptr [ebx+0C]
 00468EC5    cmp         esi,eax
>00468EC7    jne         00468ED5
 00468EC9    mov         edx,eax
 00468ECB    add         edx,dword ptr [ebx+10]
 00468ECE    mov         eax,ebx
 00468ED0    mov         ecx,dword ptr [eax]
 00468ED2    call        dword ptr [ecx+1C]
 00468ED5    mov         eax,esi
 00468ED7    add         eax,eax
 00468ED9    mov         edx,dword ptr [ebx+24]
 00468EDC    push        esi
 00468EDD    mov         esi,edi
 00468EDF    lea         edi,[edx+eax*8]
 00468EE2    movs        dword ptr [edi],dword ptr [esi]
 00468EE3    movs        dword ptr [edi],dword ptr [esi]
 00468EE4    movs        dword ptr [edi],dword ptr [esi]
 00468EE5    movs        dword ptr [edi],dword ptr [esi]
 00468EE6    pop         esi
 00468EE7    inc         dword ptr [ebx+8]
 00468EEA    mov         eax,esi
 00468EEC    pop         edi
 00468EED    pop         esi
 00468EEE    pop         ebx
 00468EEF    ret
end;*}

//00468EF0
{*function sub_00468EF0(?:?; ?:?; ?:?):?;
begin
 00468EF0    push        ebp
 00468EF1    mov         ebp,esp
 00468EF3    add         esp,0FFFFFFF0
 00468EF6    push        ebx
 00468EF7    push        esi
 00468EF8    mov         esi,edx
 00468EFA    mov         ebx,eax
 00468EFC    push        dword ptr [ebp+8]
 00468EFF    lea         edx,[ebp-10]
 00468F02    mov         eax,esi
 00468F04    call        0045C908
 00468F09    lea         edx,[ebp-10]
 00468F0C    mov         eax,ebx
 00468F0E    call        00468EB8
 00468F13    pop         esi
 00468F14    pop         ebx
 00468F15    mov         esp,ebp
 00468F17    pop         ebp
 00468F18    ret         4
end;*}

//00468F1C
{*procedure sub_00468F1C(?:TVectorList; ?:?);
begin
 00468F1C    push        ebx
 00468F1D    push        esi
 00468F1E    add         esp,0FFFFFFF0
 00468F21    mov         esi,edx
 00468F23    mov         ebx,eax
 00468F25    mov         edx,esp
 00468F27    mov         eax,esi
 00468F29    call        0045C968
 00468F2E    mov         edx,esp
 00468F30    mov         eax,ebx
 00468F32    call        00468EB8
 00468F37    add         esp,10
 00468F3A    pop         esi
 00468F3B    pop         ebx
 00468F3C    ret
end;*}

//00468F40
{*procedure sub_00468F40(?:TVectorList; ?:?; ?:?; ?:?);
begin
 00468F40    push        ebp
 00468F41    mov         ebp,esp
 00468F43    add         esp,0FFFFFFF0
 00468F46    push        ebx
 00468F47    mov         ebx,eax
 00468F49    push        dword ptr [ebp+10]
 00468F4C    push        dword ptr [ebp+0C]
 00468F4F    push        dword ptr [ebp+8]
 00468F52    lea         eax,[ebp-10]
 00468F55    call        0045C948
 00468F5A    lea         edx,[ebp-10]
 00468F5D    mov         eax,ebx
 00468F5F    call        00468EB8
 00468F64    pop         ebx
 00468F65    mov         esp,ebp
 00468F67    pop         ebp
 00468F68    ret         0C
end;*}

//00468F6C
procedure sub_00468F6C;
begin
{*
 00468F6C    push        ebx
 00468F6D    mov         ebx,eax
 00468F6F    mov         eax,ebx
 00468F71    call        004681D8
 00468F76    mov         eax,dword ptr [ebx+1C];TVectorList.?f1C:dword
 00468F79    mov         dword ptr [ebx+24],eax;TVectorList.?f24:dword
 00468F7C    pop         ebx
 00468F7D    ret
*}
end;

//00468F80
{*procedure TVectorList.sub_00468F80(?:?; ?:?; ?:?);
begin
 00468F80    push        ebp
 00468F81    mov         ebp,esp
 00468F83    push        ebx
 00468F84    push        esi
 00468F85    push        edi
 00468F86    mov         edi,ecx
 00468F88    mov         esi,edx
 00468F8A    mov         ebx,eax
 00468F8C    mov         eax,esi
 00468F8E    mov         edx,dword ptr ds:[467AC4];TVectorList
 00468F94    call        @IsClass
 00468F99    test        al,al
>00468F9B    je          00468FED
 00468F9D    mov         eax,edi
 00468F9F    mov         edx,dword ptr ds:[467AC4];TVectorList
 00468FA5    call        @IsClass
 00468FAA    test        al,al
>00468FAC    je          00468FED
 00468FAE    mov         eax,dword ptr [edi+8]
 00468FB1    cmp         eax,dword ptr [esi+8]
>00468FB4    je          00468FCA
 00468FB6    mov         ecx,685
 00468FBB    mov         edx,468FFC;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 00468FC0    mov         eax,469040;'Assertion failure'
 00468FC5    call        @Assert
 00468FCA    mov         edx,dword ptr [esi+8]
 00468FCD    mov         eax,ebx
 00468FCF    mov         ecx,dword ptr [eax]
 00468FD1    call        dword ptr [ecx+1C];TVectorList.sub_00468F6C
 00468FD4    mov         eax,dword ptr [esi+8]
 00468FD7    mov         dword ptr [ebx+8],eax;TVectorList.?f8:dword
 00468FDA    push        dword ptr [ebp+8]
 00468FDD    mov         edx,dword ptr [ebx+24];TVectorList.?f24:dword
 00468FE0    push        edx
 00468FE1    mov         edx,dword ptr [edi+24]
 00468FE4    mov         ecx,dword ptr [esi+24]
 00468FE7    xchg        eax,ecx
 00468FE8    call        0045D200
 00468FED    pop         edi
 00468FEE    pop         esi
 00468FEF    pop         ebx
 00468FF0    pop         ebp
 00468FF1    ret         4
end;*}

//00469054
constructor TTexPointList.Create;
begin
{*
 00469054    push        ebx
 00469055    push        esi
 00469056    test        dl,dl
>00469058    je          00469062
 0046905A    add         esp,0FFFFFFF0
 0046905D    call        @ClassCreate
 00469062    mov         ebx,edx
 00469064    mov         esi,eax
 00469066    mov         dword ptr [esi+20],8;TTexPointList.?f20:Integer
 0046906D    xor         edx,edx
 0046906F    mov         eax,esi
 00469071    call        00467FB4
 00469076    mov         dword ptr [esi+10],10;TTexPointList.?f10:dword
 0046907D    mov         eax,esi
 0046907F    test        bl,bl
>00469081    je          00469092
 00469083    call        @AfterConstruction
 00469088    pop         dword ptr fs:[0]
 0046908F    add         esp,0C
 00469092    mov         eax,esi
 00469094    pop         esi
 00469095    pop         ebx
 00469096    ret
*}
end;

//00469098
procedure TTexPointList.Assign(Source:TPersistent);
begin
{*
 00469098    push        ebx
 00469099    push        esi
 0046909A    mov         esi,edx
 0046909C    mov         ebx,eax
 0046909E    test        esi,esi
>004690A0    je          004690D0
 004690A2    mov         edx,esi
 004690A4    mov         eax,ebx
 004690A6    call        TBaseList.Assign
 004690AB    mov         eax,esi
 004690AD    mov         edx,dword ptr ds:[467B70];TTexPointList
 004690B3    call        @IsClass
 004690B8    test        al,al
>004690BA    je          004690D7
 004690BC    mov         ecx,dword ptr [ebx+8];TTexPointList.?f8:dword
 004690BF    shl         ecx,3
 004690C2    mov         edx,dword ptr [ebx+24];TTexPointList.?f24:dword
 004690C5    mov         eax,dword ptr [esi+24]
 004690C8    call        Move
 004690CD    pop         esi
 004690CE    pop         ebx
 004690CF    ret
 004690D0    mov         eax,ebx
 004690D2    call        00468280
 004690D7    pop         esi
 004690D8    pop         ebx
 004690D9    ret
*}
end;

//004690DC
{*function sub_004690DC(?:TTexPointList; ?:?; ?:?):?;
begin
 004690DC    push        ebp
 004690DD    mov         ebp,esp
 004690DF    push        ebx
 004690E0    push        esi
 004690E1    mov         ebx,eax
 004690E3    mov         esi,dword ptr [ebx+8]
 004690E6    mov         eax,dword ptr [ebx+0C]
 004690E9    cmp         esi,eax
>004690EB    jne         004690F9
 004690ED    mov         edx,eax
 004690EF    add         edx,dword ptr [ebx+10]
 004690F2    mov         eax,ebx
 004690F4    mov         ecx,dword ptr [eax]
 004690F6    call        dword ptr [ecx+1C]
 004690F9    mov         eax,dword ptr [ebx+24]
 004690FC    lea         eax,[eax+esi*8]
 004690FF    mov         edx,dword ptr [ebp+0C]
 00469102    mov         dword ptr [eax],edx
 00469104    mov         edx,dword ptr [ebp+8]
 00469107    mov         dword ptr [eax+4],edx
 0046910A    inc         dword ptr [ebx+8]
 0046910D    mov         eax,esi
 0046910F    pop         esi
 00469110    pop         ebx
 00469111    pop         ebp
 00469112    ret         8
end;*}

//00469118
procedure sub_00469118;
begin
{*
 00469118    push        ebx
 00469119    mov         ebx,eax
 0046911B    mov         eax,ebx
 0046911D    call        004681D8
 00469122    mov         eax,dword ptr [ebx+1C];TTexPointList.?f1C:dword
 00469125    mov         dword ptr [ebx+24],eax;TTexPointList.?f24:dword
 00469128    pop         ebx
 00469129    ret
*}
end;

//0046912C
constructor TIntegerList.Create;
begin
{*
 0046912C    push        ebx
 0046912D    push        esi
 0046912E    test        dl,dl
>00469130    je          0046913A
 00469132    add         esp,0FFFFFFF0
 00469135    call        @ClassCreate
 0046913A    mov         ebx,edx
 0046913C    mov         esi,eax
 0046913E    mov         dword ptr [esi+20],4;TIntegerList.?f20:Integer
 00469145    xor         edx,edx
 00469147    mov         eax,esi
 00469149    call        00467FB4
 0046914E    mov         dword ptr [esi+10],10;TIntegerList.?f10:dword
 00469155    mov         eax,esi
 00469157    test        bl,bl
>00469159    je          0046916A
 0046915B    call        @AfterConstruction
 00469160    pop         dword ptr fs:[0]
 00469167    add         esp,0C
 0046916A    mov         eax,esi
 0046916C    pop         esi
 0046916D    pop         ebx
 0046916E    ret
*}
end;

//00469170
procedure TIntegerList.Assign(Source:TPersistent);
begin
{*
 00469170    push        ebx
 00469171    push        esi
 00469172    mov         esi,edx
 00469174    mov         ebx,eax
 00469176    test        esi,esi
>00469178    je          004691A8
 0046917A    mov         edx,esi
 0046917C    mov         eax,ebx
 0046917E    call        TBaseList.Assign
 00469183    mov         eax,esi
 00469185    mov         edx,dword ptr ds:[467C18];TIntegerList
 0046918B    call        @IsClass
 00469190    test        al,al
>00469192    je          004691AF
 00469194    mov         ecx,dword ptr [ebx+8];TIntegerList.?f8:dword
 00469197    shl         ecx,2
 0046919A    mov         edx,dword ptr [ebx+24];TIntegerList.?f24:dword
 0046919D    mov         eax,dword ptr [esi+24]
 004691A0    call        Move
 004691A5    pop         esi
 004691A6    pop         ebx
 004691A7    ret
 004691A8    mov         eax,ebx
 004691AA    call        00468280
 004691AF    pop         esi
 004691B0    pop         ebx
 004691B1    ret
*}
end;

//004691B4
{*function sub_004691B4(?:?; ?:?):?;
begin
 004691B4    push        ebx
 004691B5    push        esi
 004691B6    push        edi
 004691B7    mov         edi,edx
 004691B9    mov         ebx,eax
 004691BB    mov         esi,dword ptr [ebx+8]
 004691BE    mov         eax,dword ptr [ebx+0C]
 004691C1    cmp         esi,eax
>004691C3    jne         004691D1
 004691C5    mov         edx,eax
 004691C7    add         edx,dword ptr [ebx+10]
 004691CA    mov         eax,ebx
 004691CC    mov         ecx,dword ptr [eax]
 004691CE    call        dword ptr [ecx+1C]
 004691D1    mov         eax,dword ptr [ebx+24]
 004691D4    mov         dword ptr [eax+esi*4],edi
 004691D7    inc         dword ptr [ebx+8]
 004691DA    mov         eax,esi
 004691DC    pop         edi
 004691DD    pop         esi
 004691DE    pop         ebx
 004691DF    ret
end;*}

//004691E0
{*procedure sub_004691E0(?:TIntegerList; ?:?; ?:Integer);
begin
 004691E0    push        ebx
 004691E1    push        esi
 004691E2    push        edi
 004691E3    mov         edi,ecx
 004691E5    mov         esi,edx
 004691E7    mov         ebx,eax
 004691E9    add         dword ptr [ebx+8],2
>004691ED    jmp         004691FB
 004691EF    mov         edx,eax
 004691F1    add         edx,dword ptr [ebx+10]
 004691F4    mov         eax,ebx
 004691F6    mov         ecx,dword ptr [eax]
 004691F8    call        dword ptr [ecx+1C]
 004691FB    mov         eax,dword ptr [ebx+0C]
 004691FE    cmp         eax,dword ptr [ebx+8]
>00469201    jl          004691EF
 00469203    mov         eax,dword ptr [ebx+24]
 00469206    mov         edx,dword ptr [ebx+8]
 00469209    lea         eax,[eax+edx*4-8]
 0046920D    mov         dword ptr [eax],esi
 0046920F    mov         dword ptr [eax+4],edi
 00469212    pop         edi
 00469213    pop         esi
 00469214    pop         ebx
 00469215    ret
end;*}

//00469218
{*procedure sub_00469218(?:TIntegerList; ?:?; ?:?; ?:?);
begin
 00469218    push        ebp
 00469219    mov         ebp,esp
 0046921B    push        ecx
 0046921C    push        ebx
 0046921D    push        esi
 0046921E    mov         dword ptr [ebp-4],ecx
 00469221    mov         esi,edx
 00469223    mov         ebx,eax
 00469225    add         dword ptr [ebx+8],3
>00469229    jmp         00469237
 0046922B    mov         edx,eax
 0046922D    add         edx,dword ptr [ebx+10]
 00469230    mov         eax,ebx
 00469232    mov         ecx,dword ptr [eax]
 00469234    call        dword ptr [ecx+1C]
 00469237    mov         eax,dword ptr [ebx+0C]
 0046923A    cmp         eax,dword ptr [ebx+8]
>0046923D    jl          0046922B
 0046923F    mov         eax,dword ptr [ebx+24]
 00469242    mov         edx,dword ptr [ebx+8]
 00469245    lea         eax,[eax+edx*4-0C]
 00469249    mov         dword ptr [eax],esi
 0046924B    mov         edx,dword ptr [ebp-4]
 0046924E    mov         dword ptr [eax+4],edx
 00469251    mov         edx,dword ptr [ebp+8]
 00469254    mov         dword ptr [eax+8],edx
 00469257    pop         esi
 00469258    pop         ebx
 00469259    pop         ecx
 0046925A    pop         ebp
 0046925B    ret         4
end;*}

//00469260
{*function sub_00469260(?:TIntegerList; ?:?):?;
begin
 00469260    mov         eax,dword ptr [eax+24]
 00469263    mov         eax,dword ptr [eax+edx*4]
 00469266    ret
end;*}

//00469268
{*procedure sub_00469268(?:?; ?:?; ?:?);
begin
 00469268    mov         eax,dword ptr [eax+24]
 0046926B    mov         dword ptr [eax+edx*4],ecx
 0046926E    ret
end;*}

//00469270
procedure sub_00469270;
begin
{*
 00469270    push        ebx
 00469271    mov         ebx,eax
 00469273    mov         eax,ebx
 00469275    call        004681D8
 0046927A    mov         eax,dword ptr [ebx+1C];TIntegerList.?f1C:dword
 0046927D    mov         dword ptr [ebx+24],eax;TIntegerList.?f24:dword
 00469280    pop         ebx
 00469281    ret
*}
end;

//00469284
{*procedure sub_00469284(?:TIntegerList; ?:?; ?:?; ?:?);
begin
 00469284    push        ebp
 00469285    mov         ebp,esp
 00469287    push        ecx
 00469288    push        ebx
 00469289    push        esi
 0046928A    mov         dword ptr [ebp-4],ecx
 0046928D    mov         esi,edx
 0046928F    mov         ebx,eax
 00469291    cmp         dword ptr [ebp+8],0
>00469295    jle         004692CA
 00469297    mov         edx,dword ptr [ebx+8]
 0046929A    add         edx,dword ptr [ebp+8]
 0046929D    mov         eax,ebx
 0046929F    call        0046824C
 004692A4    mov         eax,dword ptr [ebx+8]
 004692A7    mov         edx,dword ptr [ebx+24]
 004692AA    lea         edx,[edx+eax*4]
 004692AD    mov         ecx,eax
 004692AF    add         ecx,dword ptr [ebp+8]
 004692B2    dec         ecx
 004692B3    sub         ecx,eax
>004692B5    jl          004692C4
 004692B7    inc         ecx
 004692B8    xchg        eax,ecx
 004692B9    mov         dword ptr [edx],esi
 004692BB    add         edx,4
 004692BE    add         esi,dword ptr [ebp-4]
 004692C1    dec         eax
>004692C2    jne         004692B9
 004692C4    mov         eax,dword ptr [ebp+8]
 004692C7    add         dword ptr [ebx+8],eax
 004692CA    pop         esi
 004692CB    pop         ebx
 004692CC    pop         ecx
 004692CD    pop         ebp
 004692CE    ret         4
end;*}

//004692D4
constructor TSingleList.Create;
begin
{*
 004692D4    push        ebx
 004692D5    push        esi
 004692D6    test        dl,dl
>004692D8    je          004692E2
 004692DA    add         esp,0FFFFFFF0
 004692DD    call        @ClassCreate
 004692E2    mov         ebx,edx
 004692E4    mov         esi,eax
 004692E6    mov         dword ptr [esi+20],4;TSingleList.?f20:Integer
 004692ED    xor         edx,edx
 004692EF    mov         eax,esi
 004692F1    call        00467FB4
 004692F6    mov         dword ptr [esi+10],10;TSingleList.?f10:dword
 004692FD    mov         eax,esi
 004692FF    test        bl,bl
>00469301    je          00469312
 00469303    call        @AfterConstruction
 00469308    pop         dword ptr fs:[0]
 0046930F    add         esp,0C
 00469312    mov         eax,esi
 00469314    pop         esi
 00469315    pop         ebx
 00469316    ret
*}
end;

//00469318
procedure TSingleList.Assign(Source:TPersistent);
begin
{*
 00469318    push        ebx
 00469319    push        esi
 0046931A    mov         esi,edx
 0046931C    mov         ebx,eax
 0046931E    test        esi,esi
>00469320    je          00469350
 00469322    mov         edx,esi
 00469324    mov         eax,ebx
 00469326    call        TBaseList.Assign
 0046932B    mov         eax,esi
 0046932D    mov         edx,dword ptr ds:[467CC0];TSingleList
 00469333    call        @IsClass
 00469338    test        al,al
>0046933A    je          00469357
 0046933C    mov         ecx,dword ptr [ebx+8];TSingleList.?f8:dword
 0046933F    shl         ecx,2
 00469342    mov         edx,dword ptr [ebx+24];TSingleList.?f24:dword
 00469345    mov         eax,dword ptr [esi+24]
 00469348    call        Move
 0046934D    pop         esi
 0046934E    pop         ebx
 0046934F    ret
 00469350    mov         eax,ebx
 00469352    call        00468280
 00469357    pop         esi
 00469358    pop         ebx
 00469359    ret
*}
end;

//0046935C
{*function sub_0046935C(?:TSingleList; ?:?):?;
begin
 0046935C    push        ebp
 0046935D    mov         ebp,esp
 0046935F    push        ebx
 00469360    push        esi
 00469361    mov         ebx,eax
 00469363    mov         esi,dword ptr [ebx+8]
 00469366    mov         eax,dword ptr [ebx+0C]
 00469369    cmp         esi,eax
>0046936B    jne         00469379
 0046936D    mov         edx,eax
 0046936F    add         edx,dword ptr [ebx+10]
 00469372    mov         eax,ebx
 00469374    mov         ecx,dword ptr [eax]
 00469376    call        dword ptr [ecx+1C]
 00469379    mov         eax,dword ptr [ebx+24]
 0046937C    mov         edx,dword ptr [ebp+8]
 0046937F    mov         dword ptr [eax+esi*4],edx
 00469382    inc         dword ptr [ebx+8]
 00469385    mov         eax,esi
 00469387    pop         esi
 00469388    pop         ebx
 00469389    pop         ebp
 0046938A    ret         4
end;*}

//00469390
procedure sub_00469390;
begin
{*
 00469390    push        ebx
 00469391    mov         ebx,eax
 00469393    mov         eax,ebx
 00469395    call        004681D8
 0046939A    mov         eax,dword ptr [ebx+1C];TSingleList.?f1C:dword
 0046939D    mov         dword ptr [ebx+24],eax;TSingleList.?f24:dword
 004693A0    pop         ebx
 004693A1    ret
*}
end;

//004693A4
constructor TByteList.Create;
begin
{*
 004693A4    push        ebx
 004693A5    push        esi
 004693A6    test        dl,dl
>004693A8    je          004693B2
 004693AA    add         esp,0FFFFFFF0
 004693AD    call        @ClassCreate
 004693B2    mov         ebx,edx
 004693B4    mov         esi,eax
 004693B6    mov         dword ptr [esi+20],1;TByteList.?f20:Integer
 004693BD    xor         edx,edx
 004693BF    mov         eax,esi
 004693C1    call        00467FB4
 004693C6    mov         dword ptr [esi+10],10;TByteList.?f10:dword
 004693CD    mov         eax,esi
 004693CF    test        bl,bl
>004693D1    je          004693E2
 004693D3    call        @AfterConstruction
 004693D8    pop         dword ptr fs:[0]
 004693DF    add         esp,0C
 004693E2    mov         eax,esi
 004693E4    pop         esi
 004693E5    pop         ebx
 004693E6    ret
*}
end;

//004693E8
procedure TByteList.Assign(Source:TPersistent);
begin
{*
 004693E8    push        ebx
 004693E9    push        esi
 004693EA    mov         esi,edx
 004693EC    mov         ebx,eax
 004693EE    test        esi,esi
>004693F0    je          0046941D
 004693F2    mov         edx,esi
 004693F4    mov         eax,ebx
 004693F6    call        TBaseList.Assign
 004693FB    mov         eax,esi
 004693FD    mov         edx,dword ptr ds:[467D64];TByteList
 00469403    call        @IsClass
 00469408    test        al,al
>0046940A    je          00469424
 0046940C    mov         ecx,dword ptr [ebx+8];TByteList.?f8:dword
 0046940F    mov         edx,dword ptr [ebx+24];TByteList.?f24:dword
 00469412    mov         eax,dword ptr [esi+24]
 00469415    call        Move
 0046941A    pop         esi
 0046941B    pop         ebx
 0046941C    ret
 0046941D    mov         eax,ebx
 0046941F    call        00468280
 00469424    pop         esi
 00469425    pop         ebx
 00469426    ret
*}
end;

//00469428
{*function sub_00469428(?:?; ?:?):?;
begin
 00469428    push        ebx
 00469429    push        esi
 0046942A    push        edi
 0046942B    mov         ebx,edx
 0046942D    mov         edi,eax
 0046942F    mov         esi,dword ptr [edi+8]
 00469432    mov         eax,dword ptr [edi+0C]
 00469435    cmp         esi,eax
>00469437    jne         00469445
 00469439    mov         edx,eax
 0046943B    add         edx,dword ptr [edi+10]
 0046943E    mov         eax,edi
 00469440    mov         ecx,dword ptr [eax]
 00469442    call        dword ptr [ecx+1C]
 00469445    mov         eax,dword ptr [edi+24]
 00469448    mov         byte ptr [eax+esi],bl
 0046944B    inc         dword ptr [edi+8]
 0046944E    mov         eax,esi
 00469450    pop         edi
 00469451    pop         esi
 00469452    pop         ebx
 00469453    ret
end;*}

//00469454
{*procedure sub_00469454(?:TByteList; ?:?; ?:?);
begin
 00469454    mov         eax,dword ptr [eax+24]
 00469457    mov         byte ptr [eax+edx],cl
 0046945A    ret
end;*}

//0046945C
procedure sub_0046945C;
begin
{*
 0046945C    push        ebx
 0046945D    mov         ebx,eax
 0046945F    mov         eax,ebx
 00469461    call        004681D8
 00469466    mov         eax,dword ptr [ebx+1C];TByteList.?f1C:dword
 00469469    mov         dword ptr [ebx+24],eax;TByteList.?f24:dword
 0046946C    pop         ebx
 0046946D    ret
*}
end;

//00469470
constructor TQuaternionList.Create;
begin
{*
 00469470    push        ebx
 00469471    push        esi
 00469472    test        dl,dl
>00469474    je          0046947E
 00469476    add         esp,0FFFFFFF0
 00469479    call        @ClassCreate
 0046947E    mov         ebx,edx
 00469480    mov         esi,eax
 00469482    mov         dword ptr [esi+20],10;TQuaternionList.?f20:Integer
 00469489    xor         edx,edx
 0046948B    mov         eax,esi
 0046948D    call        00467FB4
 00469492    mov         dword ptr [esi+10],10;TQuaternionList.?f10:dword
 00469499    mov         eax,esi
 0046949B    test        bl,bl
>0046949D    je          004694AE
 0046949F    call        @AfterConstruction
 004694A4    pop         dword ptr fs:[0]
 004694AB    add         esp,0C
 004694AE    mov         eax,esi
 004694B0    pop         esi
 004694B1    pop         ebx
 004694B2    ret
*}
end;

//004694B4
procedure TQuaternionList.Assign(Source:TPersistent);
begin
{*
 004694B4    push        ebx
 004694B5    push        esi
 004694B6    mov         esi,edx
 004694B8    mov         ebx,eax
 004694BA    test        esi,esi
>004694BC    je          004694EC
 004694BE    mov         edx,esi
 004694C0    mov         eax,ebx
 004694C2    call        TBaseList.Assign
 004694C7    mov         eax,esi
 004694C9    mov         edx,dword ptr ds:[467E04];TQuaternionList
 004694CF    call        @IsClass
 004694D4    test        al,al
>004694D6    je          004694F3
 004694D8    mov         ecx,dword ptr [ebx+8];TQuaternionList.?f8:dword
 004694DB    shl         ecx,4
 004694DE    mov         edx,dword ptr [ebx+24];TQuaternionList.?f24:dword
 004694E1    mov         eax,dword ptr [esi+24]
 004694E4    call        Move
 004694E9    pop         esi
 004694EA    pop         ebx
 004694EB    ret
 004694EC    mov         eax,ebx
 004694EE    call        00468280
 004694F3    pop         esi
 004694F4    pop         ebx
 004694F5    ret
*}
end;

//004694F8
{*procedure sub_004694F8(?:?; ?:?; ?:?);
begin
 004694F8    push        ebx
 004694F9    push        esi
 004694FA    push        edi
 004694FB    mov         ebx,ecx
 004694FD    add         edx,edx
 004694FF    mov         eax,dword ptr [eax+24]
 00469502    lea         esi,[eax+edx*8]
 00469505    mov         edi,ebx
 00469507    movs        dword ptr [edi],dword ptr [esi]
 00469508    movs        dword ptr [edi],dword ptr [esi]
 00469509    movs        dword ptr [edi],dword ptr [esi]
 0046950A    movs        dword ptr [edi],dword ptr [esi]
 0046950B    pop         edi
 0046950C    pop         esi
 0046950D    pop         ebx
 0046950E    ret
end;*}

//00469510
{*procedure sub_00469510(?:TQuaternionList; ?:?; ?:?);
begin
 00469510    push        ebx
 00469511    push        esi
 00469512    push        edi
 00469513    mov         ebx,ecx
 00469515    add         edx,edx
 00469517    mov         eax,dword ptr [eax+24]
 0046951A    lea         edi,[eax+edx*8]
 0046951D    mov         esi,ebx
 0046951F    movs        dword ptr [edi],dword ptr [esi]
 00469520    movs        dword ptr [edi],dword ptr [esi]
 00469521    movs        dword ptr [edi],dword ptr [esi]
 00469522    movs        dword ptr [edi],dword ptr [esi]
 00469523    pop         edi
 00469524    pop         esi
 00469525    pop         ebx
 00469526    ret
end;*}

//00469528
procedure sub_00469528;
begin
{*
 00469528    push        ebx
 00469529    mov         ebx,eax
 0046952B    mov         eax,ebx
 0046952D    call        004681D8
 00469532    mov         eax,dword ptr [ebx+1C];TQuaternionList.?f1C:dword
 00469535    mov         dword ptr [ebx+24],eax;TQuaternionList.?f24:dword
 00469538    pop         ebx
 00469539    ret
*}
end;

//0046953C
{*procedure TQuaternionList.sub_0046953C(?:?; ?:?; ?:?);
begin
 0046953C    push        ebp
 0046953D    mov         ebp,esp
 0046953F    add         esp,0FFFFFFC8
 00469542    push        ebx
 00469543    push        esi
 00469544    push        edi
 00469545    mov         dword ptr [ebp-8],ecx
 00469548    mov         dword ptr [ebp-4],edx
 0046954B    mov         edi,eax
 0046954D    mov         eax,dword ptr [ebp-4]
 00469550    mov         ebx,dword ptr ds:[467E04];TQuaternionList
 00469556    mov         edx,ebx
 00469558    call        @IsClass
 0046955D    test        al,al
>0046955F    je          004695F2
 00469565    mov         eax,dword ptr [ebp-8]
 00469568    mov         edx,ebx
 0046956A    call        @IsClass
 0046956F    test        al,al
>00469571    je          004695F2
 00469573    mov         eax,dword ptr [ebp-4]
 00469576    mov         eax,dword ptr [eax+8]
 00469579    mov         edx,dword ptr [ebp-8]
 0046957C    cmp         eax,dword ptr [edx+8]
>0046957F    je          00469595
 00469581    mov         ecx,0A8A
 00469586    mov         edx,469604;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 0046958B    mov         eax,469648;'Assertion failure'
 00469590    call        @Assert
 00469595    mov         eax,dword ptr [ebp-4]
 00469598    mov         edx,dword ptr [eax+8]
 0046959B    mov         eax,edi
 0046959D    mov         ecx,dword ptr [eax]
 0046959F    call        dword ptr [ecx+1C];TQuaternionList.sub_00469528
 004695A2    mov         eax,dword ptr [ebp-4]
 004695A5    mov         eax,dword ptr [eax+8]
 004695A8    mov         dword ptr [edi+8],eax;TQuaternionList.?f8:dword
 004695AB    mov         esi,eax
 004695AD    dec         esi
 004695AE    test        esi,esi
>004695B0    jl          004695F2
 004695B2    inc         esi
 004695B3    xor         ebx,ebx
 004695B5    push        dword ptr [ebp+8]
 004695B8    lea         ecx,[ebp-28]
 004695BB    mov         edx,ebx
 004695BD    mov         eax,dword ptr [ebp-8]
 004695C0    call        004694F8
 004695C5    lea         eax,[ebp-28]
 004695C8    push        eax
 004695C9    lea         ecx,[ebp-38]
 004695CC    mov         edx,ebx
 004695CE    mov         eax,dword ptr [ebp-4]
 004695D1    call        004694F8
 004695D6    lea         eax,[ebp-38]
 004695D9    lea         ecx,[ebp-18]
 004695DC    pop         edx
 004695DD    call        0045F7F0
 004695E2    lea         ecx,[ebp-18]
 004695E5    mov         edx,ebx
 004695E7    mov         eax,edi
 004695E9    call        00469510
 004695EE    inc         ebx
 004695EF    dec         esi
>004695F0    jne         004695B5
 004695F2    pop         edi
 004695F3    pop         esi
 004695F4    pop         ebx
 004695F5    mov         esp,ebp
 004695F7    pop         ebp
 004695F8    ret         4
end;*}

//0046965C
{*procedure sub_0046965C(?:?; ?:?; ?:?);
begin
 0046965C    push        ebp
 0046965D    mov         ebp,esp
 0046965F    add         esp,0FFFFFFE0
 00469662    push        ebx
 00469663    push        esi
 00469664    push        edi
 00469665    mov         esi,edx
 00469667    mov         ebx,eax
 00469669    push        dword ptr [ebp+8]
 0046966C    lea         ecx,[ebp-20]
 0046966F    mov         edx,esi
 00469671    mov         eax,[005AE468];^gvar_005AD034
 00469676    call        0045F7F0
 0046967B    lea         edx,[ebp-20]
 0046967E    lea         ecx,[ebp-10]
 00469681    mov         eax,ebx
 00469683    call        0045EDF4
 00469688    lea         esi,[ebp-10]
 0046968B    mov         edi,ebx
 0046968D    movs        dword ptr [edi],dword ptr [esi]
 0046968E    movs        dword ptr [edi],dword ptr [esi]
 0046968F    movs        dword ptr [edi],dword ptr [esi]
 00469690    movs        dword ptr [edi],dword ptr [esi]
 00469691    pop         edi
 00469692    pop         esi
 00469693    pop         ebx
 00469694    mov         esp,ebp
 00469696    pop         ebp
 00469697    ret         4
end;*}

//0046969C
{*procedure TQuaternionList.sub_00468938(?:?; ?:?);
begin
 0046969C    push        ebp
 0046969D    mov         ebp,esp
 0046969F    push        ecx
 004696A0    push        ebx
 004696A1    push        esi
 004696A2    push        edi
 004696A3    mov         dword ptr [ebp-4],edx
 004696A6    mov         edi,eax
 004696A8    mov         eax,dword ptr [ebp-4]
 004696AB    mov         eax,dword ptr [eax+8]
 004696AE    cmp         eax,dword ptr [edi+8];TQuaternionList.?f8:dword
>004696B1    jge         004696C7
 004696B3    mov         ecx,0A9E
 004696B8    mov         edx,469724;'C:\GLScene\glscene_v_1000714\Source\base\VectorLists.pas'
 004696BD    mov         eax,469768;'Assertion failure'
 004696C2    call        @Assert
 004696C7    mov         eax,dword ptr [ebp-4]
 004696CA    mov         edx,dword ptr ds:[467E04];TQuaternionList
 004696D0    call        @IsClass
 004696D5    test        al,al
>004696D7    je          00469707
 004696D9    mov         esi,dword ptr [edi+8];TQuaternionList.?f8:dword
 004696DC    dec         esi
 004696DD    test        esi,esi
>004696DF    jl          00469714
 004696E1    inc         esi
 004696E2    xor         ebx,ebx
 004696E4    push        dword ptr [ebp+8]
 004696E7    mov         edx,ebx
 004696E9    mov         eax,dword ptr [ebp-4]
 004696EC    call        004689F8
 004696F1    push        eax
 004696F2    mov         edx,ebx
 004696F4    mov         eax,edi
 004696F6    call        004689F8
 004696FB    pop         edx
 004696FC    call        0046965C
 00469701    inc         ebx
 00469702    dec         esi
>00469703    jne         004696E4
>00469705    jmp         00469714
 00469707    push        dword ptr [ebp+8]
 0046970A    mov         edx,dword ptr [ebp-4]
 0046970D    mov         eax,edi
 0046970F    call        TBaseVectorList.sub_00468938
 00469714    pop         edi
 00469715    pop         esi
 00469716    pop         ebx
 00469717    pop         ecx
 00469718    pop         ebp
 00469719    ret         4
end;*}

Initialization
//004697AC
{*
 004697AC    push        ebp
 004697AD    mov         ebp,esp
 004697AF    add         esp,0FFFFFFF0
 004697B2    sub         dword ptr ds:[5E133C],1
>004697B9    jae         004697E8
 004697BB    mov         eax,[00467A00];TAffineVectorList
 004697C0    mov         dword ptr [ebp-10],eax
 004697C3    mov         eax,[00467AC4];TVectorList
 004697C8    mov         dword ptr [ebp-0C],eax
 004697CB    mov         eax,[00467B70];TTexPointList
 004697D0    mov         dword ptr [ebp-8],eax
 004697D3    mov         eax,[00467CC0];TSingleList
 004697D8    mov         dword ptr [ebp-4],eax
 004697DB    lea         eax,[ebp-10]
 004697DE    mov         edx,3
 004697E3    call        RegisterClasses
 004697E8    mov         esp,ebp
 004697EA    pop         ebp
 004697EB    ret
*}
Finalization
end.