//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XCollection;

interface

uses
  SysUtils, Classes;

type
  TXCollectionItem = class(TPersistent)
  public
    f4:dword;//f4
    Name:String;//f8
    destructor Destroy; virtual;//0046DE28
    procedure Assign(Source:TPersistent); virtual;//v8//0046DE6C
    procedure SetName(Value:String); virtual;//vC//0046DEA0
    //procedure v10(?:?); virtual;//v10//0046DEB8
    //procedure v14(?:?); virtual;//v14//0046DED4
    constructor v18; virtual;//v18//0046DC4C
    procedure v1C; virtual; abstract;//v1C//00402BEC
    //procedure v20(?:?); virtual;//v20//0046E060
    //procedure v24(?:?); virtual;//v24//0046E070
    //function v28:?; virtual;//v28//0046E07C
    //function v2C:?; virtual;//v2C//0046E080
    procedure sub_0046DFA4; dynamic;//0046DFA4
    //procedure GetNamePath(?:?); dynamic;//0046DFA8
    procedure sub_0041ADA4; dynamic;//0046DEB4
  end;
  TXCollection = class(TPersistent)
  public
    f4:dword;//f4
    f8:TList;//f8
    fC:Integer;//fC
    destructor Destroy; virtual;//0046E0D0
    procedure Assign(Source:TPersistent); virtual;//v8//0046E11C
    constructor vC; virtual;//vC//0046E084
    constructor Create; virtual;//v10//0046E4CC
    //function v14(?:?):?; virtual;//v14//0046E5DC
    //procedure GetNamePath(?:?); dynamic;//0046E4EC
    procedure sub_0041ADA4; dynamic;//0046E4E8
  end;
    constructor sub_0046DC4C;//0046DC4C
    destructor Destroy;//0046DE28
    procedure Assign(Source:TPersistent);//0046DE6C
    procedure SetName(Value:String);//0046DEA0
    procedure sub_0041ADA4;//0046DEB4
    //procedure sub_0046DEB8(?:?);//0046DEB8
    //procedure sub_0046DED4(?:?);//0046DED4
    procedure sub_0046DFA4;//0046DFA4
    //procedure GetNamePath(?:?);//0046DFA8
    //function sub_0046E048(?:TXCollectionItem):?;//0046E048
    //procedure sub_0046E060(?:?);//0046E060
    //procedure sub_0046E070(?:?);//0046E070
    //function sub_0046E07C:?;//0046E07C
    //function sub_0046E080:?;//0046E080
    constructor sub_0046E084;//0046E084
    destructor Destroy;//0046E0D0
    procedure Assign(Source:TPersistent);//0046E11C
    procedure sub_0046E1B0(?:dword);//0046E1B0
    constructor Create;//0046E4CC
    //function sub_0046E4D4(?:TXCollection; ?:?):?;//0046E4D4
    procedure sub_0041ADA4;//0046E4E8
    //procedure GetNamePath(?:?);//0046E4EC
    procedure sub_0046E5A0(?:TXCollection);//0046E5A0
    //function sub_0046E5DC(?:?):?;//0046E5DC

implementation

//0046DC4C
constructor sub_0046DC4C;
begin
{*
 0046DC4C    push        ebp
 0046DC4D    mov         ebp,esp
 0046DC4F    add         esp,0FFFFFDF0
 0046DC55    push        ebx
 0046DC56    push        esi
 0046DC57    push        edi
 0046DC58    xor         ebx,ebx
 0046DC5A    mov         dword ptr [ebp-210],ebx
 0046DC60    mov         dword ptr [ebp-4],ebx
 0046DC63    mov         dword ptr [ebp-8],ebx
 0046DC66    mov         dword ptr [ebp-10C],ebx
 0046DC6C    test        dl,dl
>0046DC6E    je          0046DC78
 0046DC70    add         esp,0FFFFFFF0
 0046DC73    call        @ClassCreate
 0046DC78    mov         esi,ecx
 0046DC7A    mov         ebx,edx
 0046DC7C    mov         edi,eax
 0046DC7E    xor         eax,eax
 0046DC80    push        ebp
 0046DC81    push        46DD81
 0046DC86    push        dword ptr fs:[eax]
 0046DC89    mov         dword ptr fs:[eax],esp
 0046DC8C    xor         edx,edx
 0046DC8E    mov         eax,edi
 0046DC90    call        TObject.Create
 0046DC95    mov         dword ptr [edi+4],esi;TXCollectionItem.?f4:dword
 0046DC98    test        esi,esi
>0046DC9A    je          0046DD37
 0046DCA0    mov         eax,edi
 0046DCA2    call        TObject.ClassType
 0046DCA7    mov         edx,eax
 0046DCA9    mov         eax,esi
 0046DCAB    mov         ecx,dword ptr [eax]
 0046DCAD    call        dword ptr [ecx+14]
 0046DCB0    test        al,al
>0046DCB2    jne         0046DD24
 0046DCB4    push        46DDB0;'Addition of '
 0046DCB9    lea         edx,[ebp-108]
 0046DCBF    mov         eax,dword ptr [edi]
 0046DCC1    call        TObject.ClassName
 0046DCC6    lea         edx,[ebp-108]
 0046DCCC    lea         eax,[ebp-8]
 0046DCCF    call        @LStrFromString
 0046DCD4    push        dword ptr [ebp-8]
 0046DCD7    push        46DDC8;' to '
 0046DCDC    lea         edx,[ebp-20C]
 0046DCE2    mov         eax,dword ptr [esi]
 0046DCE4    call        TObject.ClassName
 0046DCE9    lea         edx,[ebp-20C]
 0046DCEF    lea         eax,[ebp-10C]
 0046DCF5    call        @LStrFromString
 0046DCFA    push        dword ptr [ebp-10C]
 0046DD00    push        46DDD8;' rejected.'
 0046DD05    lea         eax,[ebp-4]
 0046DD08    mov         edx,5
 0046DD0D    call        @LStrCatN
 0046DD12    mov         eax,dword ptr [ebp-4]
 0046DD15    mov         ecx,11C
 0046DD1A    mov         edx,46DDEC;'C:\GLScene\glscene_v_1000714\Source\base\XCollection.pas'
 0046DD1F    call        @Assert
 0046DD24    mov         edx,edi
 0046DD26    mov         eax,dword ptr [esi+8]
 0046DD29    call        TList.Add
 0046DD2E    mov         eax,dword ptr [esi+8]
 0046DD31    mov         eax,dword ptr [eax+8]
 0046DD34    mov         dword ptr [esi+0C],eax
 0046DD37    lea         edx,[ebp-210]
 0046DD3D    mov         eax,dword ptr [edi]
 0046DD3F    call        dword ptr [eax+1C];@AbstractError
 0046DD42    mov         edx,dword ptr [ebp-210]
 0046DD48    lea         eax,[edi+8];TXCollectionItem.Name:String
 0046DD4B    call        @LStrAsg
 0046DD50    xor         eax,eax
 0046DD52    pop         edx
 0046DD53    pop         ecx
 0046DD54    pop         ecx
 0046DD55    mov         dword ptr fs:[eax],edx
 0046DD58    push        46DD88
 0046DD5D    lea         eax,[ebp-210]
 0046DD63    call        @LStrClr
 0046DD68    lea         eax,[ebp-10C]
 0046DD6E    call        @LStrClr
 0046DD73    lea         eax,[ebp-8]
 0046DD76    mov         edx,2
 0046DD7B    call        @LStrArrayClr
 0046DD80    ret
>0046DD81    jmp         @HandleFinally
>0046DD86    jmp         0046DD5D
 0046DD88    mov         eax,edi
 0046DD8A    test        bl,bl
>0046DD8C    je          0046DD9D
 0046DD8E    call        @AfterConstruction
 0046DD93    pop         dword ptr fs:[0]
 0046DD9A    add         esp,0C
 0046DD9D    mov         eax,edi
 0046DD9F    pop         edi
 0046DDA0    pop         esi
 0046DDA1    pop         ebx
 0046DDA2    mov         esp,ebp
 0046DDA4    pop         ebp
 0046DDA5    ret
*}
end;

//0046DE28
destructor TXCollectionItem.Destroy;
begin
{*
 0046DE28    push        ebx
 0046DE29    push        esi
 0046DE2A    call        @BeforeDestruction
 0046DE2F    mov         ebx,edx
 0046DE31    mov         esi,eax
 0046DE33    mov         eax,dword ptr [esi+4];TXCollectionItem.?f4:dword
 0046DE36    test        eax,eax
>0046DE38    je          0046DE50
 0046DE3A    mov         eax,dword ptr [eax+8]
 0046DE3D    mov         edx,esi
 0046DE3F    call        TList.Remove
 0046DE44    mov         eax,dword ptr [esi+4];TXCollectionItem.?f4:dword
 0046DE47    mov         edx,dword ptr [eax+8]
 0046DE4A    mov         edx,dword ptr [edx+8]
 0046DE4D    mov         dword ptr [eax+0C],edx
 0046DE50    mov         edx,ebx
 0046DE52    and         dl,0FC
 0046DE55    mov         eax,esi
 0046DE57    call        TMemoryStream.Destroy
 0046DE5C    test        bl,bl
>0046DE5E    jle         0046DE67
 0046DE60    mov         eax,esi
 0046DE62    call        @ClassDestroy
 0046DE67    pop         esi
 0046DE68    pop         ebx
 0046DE69    ret
*}
end;

//0046DE6C
procedure TXCollectionItem.Assign(Source:TPersistent);
begin
{*
 0046DE6C    push        ebx
 0046DE6D    push        esi
 0046DE6E    mov         esi,edx
 0046DE70    mov         ebx,eax
 0046DE72    mov         eax,esi
 0046DE74    mov         edx,dword ptr ds:[46D9F0];TXCollectionItem
 0046DE7A    call        @IsClass
 0046DE7F    test        al,al
>0046DE81    je          0046DE91
 0046DE83    lea         eax,[ebx+8];TXCollectionItem.Name:String
 0046DE86    mov         edx,dword ptr [esi+8]
 0046DE89    call        @LStrAsg
 0046DE8E    pop         esi
 0046DE8F    pop         ebx
 0046DE90    ret
 0046DE91    mov         edx,esi
 0046DE93    mov         eax,ebx
 0046DE95    call        TPersistent.Assign
 0046DE9A    pop         esi
 0046DE9B    pop         ebx
 0046DE9C    ret
*}
end;

//0046DEA0
procedure TXCollectionItem.SetName(Value:String);
begin
{*
 0046DEA0    push        ebx
 0046DEA1    push        esi
 0046DEA2    mov         esi,edx
 0046DEA4    mov         ebx,eax
 0046DEA6    lea         eax,[ebx+8];TXCollectionItem.Name:String
 0046DEA9    mov         edx,esi
 0046DEAB    call        @LStrAsg
 0046DEB0    pop         esi
 0046DEB1    pop         ebx
 0046DEB2    ret
*}
end;

//0046DEB4
procedure TXCollectionItem.sub_0041ADA4;
begin
{*
 0046DEB4    mov         eax,dword ptr [eax+4];TXCollectionItem.?f4:dword
 0046DEB7    ret
*}
end;

//0046DEB8
{*procedure sub_0046DEB8(?:?);
begin
 0046DEB8    push        ebx
 0046DEB9    push        esi
 0046DEBA    mov         esi,edx
 0046DEBC    mov         ebx,eax
 0046DEBE    xor         edx,edx
 0046DEC0    mov         eax,esi
 0046DEC2    call        TWriter.WriteInteger
 0046DEC7    mov         edx,dword ptr [ebx+8];TXCollectionItem.Name:String
 0046DECA    mov         eax,esi
 0046DECC    call        TWriter.WriteString
 0046DED1    pop         esi
 0046DED2    pop         ebx
 0046DED3    ret
end;*}

//0046DED4
{*procedure sub_0046DED4(?:?);
begin
 0046DED4    push        ebp
 0046DED5    mov         ebp,esp
 0046DED7    push        0
 0046DED9    push        ebx
 0046DEDA    push        esi
 0046DEDB    mov         esi,edx
 0046DEDD    mov         ebx,eax
 0046DEDF    xor         eax,eax
 0046DEE1    push        ebp
 0046DEE2    push        46DF37
 0046DEE7    push        dword ptr fs:[eax]
 0046DEEA    mov         dword ptr fs:[eax],esp
 0046DEED    mov         eax,esi
 0046DEEF    call        TReader.ReadInteger
 0046DEF4    test        eax,eax
>0046DEF6    je          0046DF0C
 0046DEF8    mov         ecx,154
 0046DEFD    mov         edx,46DF4C;'C:\GLScene\glscene_v_1000714\Source\base\XCollection.pas'
 0046DF02    mov         eax,46DF90;'Assertion failure'
 0046DF07    call        @Assert
 0046DF0C    lea         edx,[ebp-4]
 0046DF0F    mov         eax,esi
 0046DF11    call        TReader.ReadString
 0046DF16    mov         edx,dword ptr [ebp-4]
 0046DF19    lea         eax,[ebx+8];TXCollectionItem.Name:String
 0046DF1C    call        @LStrAsg
 0046DF21    xor         eax,eax
 0046DF23    pop         edx
 0046DF24    pop         ecx
 0046DF25    pop         ecx
 0046DF26    mov         dword ptr fs:[eax],edx
 0046DF29    push        46DF3E
 0046DF2E    lea         eax,[ebp-4]
 0046DF31    call        @LStrClr
 0046DF36    ret
>0046DF37    jmp         @HandleFinally
>0046DF3C    jmp         0046DF2E
 0046DF3E    pop         esi
 0046DF3F    pop         ebx
 0046DF40    pop         ecx
 0046DF41    pop         ebp
 0046DF42    ret
end;*}

//0046DFA4
procedure TXCollectionItem.sub_0046DFA4;
begin
{*
 0046DFA4    ret
*}
end;

//0046DFA8
{*procedure TXCollectionItem.GetNamePath(?:?);
begin
 0046DFA8    push        ebp
 0046DFA9    mov         ebp,esp
 0046DFAB    add         esp,0FFFFFFEC
 0046DFAE    push        ebx
 0046DFAF    push        esi
 0046DFB0    push        edi
 0046DFB1    xor         ecx,ecx
 0046DFB3    mov         dword ptr [ebp-14],ecx
 0046DFB6    mov         edi,edx
 0046DFB8    mov         ebx,eax
 0046DFBA    xor         eax,eax
 0046DFBC    push        ebp
 0046DFBD    push        46E029
 0046DFC2    push        dword ptr fs:[eax]
 0046DFC5    mov         dword ptr fs:[eax],esp
 0046DFC8    cmp         dword ptr [ebx+4],0;TXCollectionItem.?f4:dword
>0046DFCC    je          0046E00A
 0046DFCE    push        edi
 0046DFCF    lea         edx,[ebp-14]
 0046DFD2    mov         eax,dword ptr [ebx+4];TXCollectionItem.?f4:dword
 0046DFD5    mov         si,0FFFE
 0046DFD9    call        @CallDynaInst
 0046DFDE    mov         eax,dword ptr [ebp-14]
 0046DFE1    mov         dword ptr [ebp-10],eax
 0046DFE4    mov         byte ptr [ebp-0C],0B
 0046DFE8    mov         eax,ebx
 0046DFEA    call        0046E048
 0046DFEF    mov         dword ptr [ebp-8],eax
 0046DFF2    mov         byte ptr [ebp-4],0
 0046DFF6    lea         edx,[ebp-10]
 0046DFF9    mov         ecx,1
 0046DFFE    mov         eax,46E040;'%s[%d]'
 0046E003    call        Format
>0046E008    jmp         0046E013
 0046E00A    mov         edx,edi
 0046E00C    mov         eax,ebx
 0046E00E    call        TPersistent.GetNamePath
 0046E013    xor         eax,eax
 0046E015    pop         edx
 0046E016    pop         ecx
 0046E017    pop         ecx
 0046E018    mov         dword ptr fs:[eax],edx
 0046E01B    push        46E030
 0046E020    lea         eax,[ebp-14]
 0046E023    call        @LStrClr
 0046E028    ret
>0046E029    jmp         @HandleFinally
>0046E02E    jmp         0046E020
 0046E030    pop         edi
 0046E031    pop         esi
 0046E032    pop         ebx
 0046E033    mov         esp,ebp
 0046E035    pop         ebp
 0046E036    ret
end;*}

//0046E048
{*function sub_0046E048(?:TXCollectionItem):?;
begin
 0046E048    mov         edx,dword ptr [eax+4];TXCollectionItem.?f4:dword
 0046E04B    test        edx,edx
>0046E04D    je          0046E059
 0046E04F    mov         edx,dword ptr [edx+8]
 0046E052    xchg        eax,edx
 0046E053    call        TList.IndexOf
 0046E058    ret
 0046E059    or          eax,0FFFFFFFF
 0046E05C    ret
end;*}

//0046E060
{*procedure sub_0046E060(?:?);
begin
 0046E060    push        ebx
 0046E061    push        esi
 0046E062    mov         esi,edx
 0046E064    mov         ebx,eax
 0046E066    mov         edx,esi
 0046E068    mov         eax,ebx
 0046E06A    call        dword ptr [eax+1C]
 0046E06D    pop         esi
 0046E06E    pop         ebx
 0046E06F    ret
end;*}

//0046E070
{*procedure sub_0046E070(?:?);
begin
 0046E070    push        ebx
 0046E071    mov         ebx,edx
 0046E073    mov         eax,ebx
 0046E075    call        @LStrClr
 0046E07A    pop         ebx
 0046E07B    ret
end;*}

//0046E07C
{*function sub_0046E07C:?;
begin
 0046E07C    xor         eax,eax
 0046E07E    ret
end;*}

//0046E080
{*function sub_0046E080:?;
begin
 0046E080    mov         al,1
 0046E082    ret
end;*}

//0046E084
constructor sub_0046E084;
begin
{*
 0046E084    push        ebx
 0046E085    push        esi
 0046E086    push        edi
 0046E087    test        dl,dl
>0046E089    je          0046E093
 0046E08B    add         esp,0FFFFFFF0
 0046E08E    call        @ClassCreate
 0046E093    mov         esi,ecx
 0046E095    mov         ebx,edx
 0046E097    mov         edi,eax
 0046E099    xor         edx,edx
 0046E09B    mov         eax,edi
 0046E09D    call        TObject.Create
 0046E0A2    mov         dword ptr [edi+4],esi;TXCollection.?f4:dword
 0046E0A5    mov         dl,1
 0046E0A7    mov         eax,[00417CEC];TList
 0046E0AC    call        TObject.Create;TList.Create
 0046E0B1    mov         dword ptr [edi+8],eax;TXCollection.?f8:TList
 0046E0B4    mov         eax,edi
 0046E0B6    test        bl,bl
>0046E0B8    je          0046E0C9
 0046E0BA    call        @AfterConstruction
 0046E0BF    pop         dword ptr fs:[0]
 0046E0C6    add         esp,0C
 0046E0C9    mov         eax,edi
 0046E0CB    pop         edi
 0046E0CC    pop         esi
 0046E0CD    pop         ebx
 0046E0CE    ret
*}
end;

//0046E0D0
destructor TXCollection.Destroy;
begin
{*
 0046E0D0    push        ebx
 0046E0D1    push        esi
 0046E0D2    call        @BeforeDestruction
 0046E0D7    mov         ebx,edx
 0046E0D9    mov         esi,eax
 0046E0DB    cmp         word ptr ds:[5E14BE],0;gvar_005E14BE
>0046E0E3    je          0046E0F3
 0046E0E5    mov         edx,esi
 0046E0E7    mov         eax,dword ptr ds:[5E14C0];gvar_005E14C0
 0046E0ED    call        dword ptr ds:[5E14BC]
 0046E0F3    mov         eax,esi
 0046E0F5    call        0046E5A0
 0046E0FA    mov         eax,dword ptr [esi+8];TXCollection.?f8:TList
 0046E0FD    call        TObject.Free
 0046E102    mov         edx,ebx
 0046E104    and         dl,0FC
 0046E107    mov         eax,esi
 0046E109    call        TMemoryStream.Destroy
 0046E10E    test        bl,bl
>0046E110    jle         0046E119
 0046E112    mov         eax,esi
 0046E114    call        @ClassDestroy
 0046E119    pop         esi
 0046E11A    pop         ebx
 0046E11B    ret
*}
end;

//0046E11C
procedure TXCollection.Assign(Source:TPersistent);
begin
{*
 0046E11C    push        ebx
 0046E11D    push        esi
 0046E11E    push        edi
 0046E11F    push        ebp
 0046E120    push        ecx
 0046E121    mov         esi,edx
 0046E123    mov         ebx,eax
 0046E125    test        esi,esi
>0046E127    jne         0046E132
 0046E129    mov         eax,ebx
 0046E12B    call        0046E5A0
>0046E130    jmp         0046E1A0
 0046E132    mov         eax,esi
 0046E134    call        TObject.ClassType
 0046E139    mov         edi,eax
 0046E13B    mov         eax,ebx
 0046E13D    call        TObject.ClassType
 0046E142    cmp         edi,eax
>0046E144    jne         0046E197
 0046E146    mov         eax,ebx
 0046E148    call        0046E5A0
 0046E14D    mov         edi,esi
 0046E14F    mov         eax,dword ptr [edi+8]
 0046E152    mov         edx,dword ptr [eax+8]
 0046E155    mov         eax,dword ptr [ebx+8];TXCollection.?f8:TList
 0046E158    call        TList.SetCapacity
 0046E15D    mov         ebp,dword ptr [edi+0C]
 0046E160    dec         ebp
 0046E161    test        ebp,ebp
>0046E163    jl          0046E1A0
 0046E165    inc         ebp
 0046E166    mov         dword ptr [esp],0
 0046E16D    mov         eax,dword ptr [esi+8]
 0046E170    mov         edx,dword ptr [esp]
 0046E173    call        TList.Get
 0046E178    mov         edi,eax
 0046E17A    mov         eax,edi
 0046E17C    call        TObject.ClassType
 0046E181    mov         ecx,ebx
 0046E183    mov         dl,1
 0046E185    call        dword ptr [eax+18]
 0046E188    mov         edx,edi
 0046E18A    mov         ecx,dword ptr [eax]
 0046E18C    call        dword ptr [ecx+8]
 0046E18F    inc         dword ptr [esp]
 0046E192    dec         ebp
>0046E193    jne         0046E16D
>0046E195    jmp         0046E1A0
 0046E197    mov         edx,esi
 0046E199    mov         eax,ebx
 0046E19B    call        TPersistent.Assign
 0046E1A0    mov         eax,dword ptr [ebx+8];TXCollection.?f8:TList
 0046E1A3    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 0046E1A6    mov         dword ptr [ebx+0C],eax;TXCollection.?fC:Integer
 0046E1A9    pop         edx
 0046E1AA    pop         ebp
 0046E1AB    pop         edi
 0046E1AC    pop         esi
 0046E1AD    pop         ebx
 0046E1AE    ret
*}
end;

//0046E1B0
procedure sub_0046E1B0(?:dword);
begin
{*
 0046E1B0    push        ebx
 0046E1B1    push        esi
 0046E1B2    push        edi
 0046E1B3    push        ebp
 0046E1B4    mov         ebp,eax
 0046E1B6    mov         eax,dword ptr [ebp+8]
 0046E1B9    mov         ebx,dword ptr [eax+8]
 0046E1BC    dec         ebx
 0046E1BD    test        ebx,ebx
>0046E1BF    jl          0046E1DB
 0046E1C1    inc         ebx
 0046E1C2    xor         edi,edi
 0046E1C4    mov         eax,dword ptr [ebp+8]
 0046E1C7    mov         edx,edi
 0046E1C9    call        TList.Get
 0046E1CE    mov         si,0FFFD
 0046E1D2    call        @CallDynaInst
 0046E1D7    inc         edi
 0046E1D8    dec         ebx
>0046E1D9    jne         0046E1C4
 0046E1DB    pop         ebp
 0046E1DC    pop         edi
 0046E1DD    pop         esi
 0046E1DE    pop         ebx
 0046E1DF    ret
*}
end;

//0046E4CC
constructor TXCollectionItem.Create;
begin
{*
 0046E4CC    mov         eax,[0046D9F0];TXCollectionItem
 0046E4D1    ret
*}
end;

//0046E4D4
{*function sub_0046E4D4(?:TXCollection; ?:?):?;
begin
 0046E4D4    push        ebx
 0046E4D5    push        esi
 0046E4D6    mov         esi,edx
 0046E4D8    mov         ebx,eax
 0046E4DA    mov         edx,esi
 0046E4DC    mov         eax,dword ptr [ebx+8]
 0046E4DF    call        TList.Get
 0046E4E4    pop         esi
 0046E4E5    pop         ebx
 0046E4E6    ret
end;*}

//0046E4E8
procedure TXCollection.sub_0041ADA4;
begin
{*
 0046E4E8    mov         eax,dword ptr [eax+4];TXCollection.?f4:dword
 0046E4EB    ret
*}
end;

//0046E4EC
{*procedure TXCollection.GetNamePath(?:?);
begin
 0046E4EC    push        ebp
 0046E4ED    mov         ebp,esp
 0046E4EF    add         esp,0FFFFFEFC
 0046E4F5    push        ebx
 0046E4F6    push        esi
 0046E4F7    push        edi
 0046E4F8    xor         ecx,ecx
 0046E4FA    mov         dword ptr [ebp-4],ecx
 0046E4FD    mov         edi,edx
 0046E4FF    mov         ebx,eax
 0046E501    xor         eax,eax
 0046E503    push        ebp
 0046E504    push        46E57A
 0046E509    push        dword ptr fs:[eax]
 0046E50C    mov         dword ptr fs:[eax],esp
 0046E50F    lea         edx,[ebp-104]
 0046E515    mov         eax,dword ptr [ebx]
 0046E517    call        TObject.ClassName
 0046E51C    lea         edx,[ebp-104]
 0046E522    mov         eax,edi
 0046E524    call        @LStrFromString
 0046E529    mov         eax,ebx
 0046E52B    mov         si,0FFFF
 0046E52F    call        @CallDynaInst;TXCollection.sub_0041ADA4
 0046E534    test        eax,eax
>0046E536    je          0046E564
 0046E538    mov         eax,ebx
 0046E53A    mov         si,0FFFF
 0046E53E    call        @CallDynaInst;TXCollection.sub_0041ADA4
 0046E543    lea         edx,[ebp-4]
 0046E546    mov         si,0FFFE
 0046E54A    call        @CallDynaInst
 0046E54F    cmp         dword ptr [ebp-4],0
>0046E553    je          0046E564
 0046E555    mov         eax,edi
 0046E557    mov         ecx,46E590;'.XCollection'
 0046E55C    mov         edx,dword ptr [ebp-4]
 0046E55F    call        @LStrCat3
 0046E564    xor         eax,eax
 0046E566    pop         edx
 0046E567    pop         ecx
 0046E568    pop         ecx
 0046E569    mov         dword ptr fs:[eax],edx
 0046E56C    push        46E581
 0046E571    lea         eax,[ebp-4]
 0046E574    call        @LStrClr
 0046E579    ret
>0046E57A    jmp         @HandleFinally
>0046E57F    jmp         0046E571
 0046E581    pop         edi
 0046E582    pop         esi
 0046E583    pop         ebx
 0046E584    mov         esp,ebp
 0046E586    pop         ebp
 0046E587    ret
end;*}

//0046E5A0
procedure sub_0046E5A0(?:TXCollection);
begin
{*
 0046E5A0    push        ebx
 0046E5A1    push        esi
 0046E5A2    push        edi
 0046E5A3    mov         esi,eax
 0046E5A5    mov         eax,dword ptr [esi+8];TXCollection.?f8:TList
 0046E5A8    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 0046E5AB    dec         ebx
 0046E5AC    test        ebx,ebx
>0046E5AE    jl          0046E5CB
 0046E5B0    inc         ebx
 0046E5B1    xor         edi,edi
 0046E5B3    mov         eax,dword ptr [esi+8];TXCollection.?f8:TList
 0046E5B6    mov         edx,edi
 0046E5B8    call        TList.Get
 0046E5BD    xor         edx,edx
 0046E5BF    mov         dword ptr [eax+4],edx
 0046E5C2    call        TObject.Free
 0046E5C7    inc         edi
 0046E5C8    dec         ebx
>0046E5C9    jne         0046E5B3
 0046E5CB    mov         eax,dword ptr [esi+8];TXCollection.?f8:TList
 0046E5CE    mov         edx,dword ptr [eax]
 0046E5D0    call        dword ptr [edx+8];TList.Clear
 0046E5D3    xor         eax,eax
 0046E5D5    mov         dword ptr [esi+0C],eax;TXCollection.?fC:Integer
 0046E5D8    pop         edi
 0046E5D9    pop         esi
 0046E5DA    pop         ebx
 0046E5DB    ret
*}
end;

//0046E5DC
{*function sub_0046E5DC(?:?):?;
begin
 0046E5DC    push        ebx
 0046E5DD    push        esi
 0046E5DE    push        edi
 0046E5DF    push        ebp
 0046E5E0    add         esp,0FFFFFFF8
 0046E5E3    mov         dword ptr [esp],edx
 0046E5E6    mov         edi,eax
 0046E5E8    mov         byte ptr [esp+4],1
 0046E5ED    mov         edx,edi
 0046E5EF    mov         eax,dword ptr [esp]
 0046E5F2    call        dword ptr [eax+2C]
 0046E5F5    test        al,al
>0046E5F7    jne         0046E600
 0046E5F9    mov         byte ptr [esp+4],0
>0046E5FE    jmp         0046E679
 0046E600    mov         eax,dword ptr [esp]
 0046E603    call        dword ptr [eax+28]
 0046E606    test        al,al
>0046E608    je          0046E635
 0046E60A    mov         ebx,dword ptr [edi+0C];TXCollection.?fC:Integer
 0046E60D    dec         ebx
 0046E60E    test        ebx,ebx
>0046E610    jl          0046E635
 0046E612    inc         ebx
 0046E613    xor         esi,esi
 0046E615    mov         edx,esi
 0046E617    mov         eax,edi
 0046E619    call        0046E4D4
 0046E61E    mov         edx,dword ptr [esp]
 0046E621    call        @IsClass
 0046E626    test        al,al
>0046E628    je          0046E631
 0046E62A    mov         byte ptr [esp+4],0
>0046E62F    jmp         0046E635
 0046E631    inc         esi
 0046E632    dec         ebx
>0046E633    jne         0046E615
 0046E635    cmp         byte ptr [esp+4],0
>0046E63A    je          0046E679
 0046E63C    mov         ebx,dword ptr [edi+0C];TXCollection.?fC:Integer
 0046E63F    dec         ebx
 0046E640    test        ebx,ebx
>0046E642    jl          0046E679
 0046E644    inc         ebx
 0046E645    xor         esi,esi
 0046E647    mov         edx,esi
 0046E649    mov         eax,edi
 0046E64B    call        0046E4D4
 0046E650    call        TObject.ClassType
 0046E655    mov         ebp,eax
 0046E657    mov         eax,ebp
 0046E659    call        dword ptr [eax+28]
 0046E65C    test        al,al
>0046E65E    je          0046E675
 0046E660    mov         edx,ebp
 0046E662    mov         eax,dword ptr [esp]
 0046E665    call        TObject.InheritsFrom
 0046E66A    test        al,al
>0046E66C    je          0046E675
 0046E66E    mov         byte ptr [esp+4],0
>0046E673    jmp         0046E679
 0046E675    inc         esi
 0046E676    dec         ebx
>0046E677    jne         0046E647
 0046E679    mov         al,byte ptr [esp+4]
 0046E67D    pop         ecx
 0046E67E    pop         edx
 0046E67F    pop         ebp
 0046E680    pop         edi
 0046E681    pop         esi
 0046E682    pop         ebx
 0046E683    ret
end;*}

Initialization
Finalization
//0046E684
{*
 0046E684    push        ebp
 0046E685    mov         ebp,esp
 0046E687    xor         eax,eax
 0046E689    push        ebp
 0046E68A    push        46E6B5
 0046E68F    push        dword ptr fs:[eax]
 0046E692    mov         dword ptr fs:[eax],esp
 0046E695    inc         dword ptr ds:[5E14B4]
>0046E69B    jne         0046E6A7
 0046E69D    mov         eax,[005E14B8];gvar_005E14B8
 0046E6A2    call        TObject.Free
 0046E6A7    xor         eax,eax
 0046E6A9    pop         edx
 0046E6AA    pop         ecx
 0046E6AB    pop         ecx
 0046E6AC    mov         dword ptr fs:[eax],edx
 0046E6AF    push        46E6BC
 0046E6B4    ret
>0046E6B5    jmp         @HandleFinally
>0046E6BA    jmp         0046E6B4
 0046E6BC    pop         ebp
 0046E6BD    ret
*}
end.