//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ApplicationFileIO;

interface

uses
  SysUtils, Classes;

type
  TDataFile = class(TPersistent)
  public
    f4:dword;//f4
    f8:String;//f8
    destructor Destroy; virtual;//00465C04
    constructor vC; virtual;//vC//00465BC8
    //function v10:?; virtual;//v10//00465C2C
    //procedure sub_00465D9C(?:?); dynamic;//00465D9C
    procedure @AbstractError; dynamic;//00402BEC
    //procedure sub_00465CFC(?:?); dynamic;//00465CFC
    //procedure sub_00465C5C(?:?); dynamic;//00465C5C
    //procedure sub_00465C3C(?:?); dynamic;//00465C3C
    procedure sub_0041ADA4; dynamic;//00465C38
  end;
    //function sub_00465A4C:?;//00465A4C
    //function sub_00465A70(?:?; ?:?):?;//00465A70
    //function sub_00465B88:?;//00465B88
    constructor sub_00465BC8;//00465BC8
    destructor Destroy;//00465C04
    //function sub_00465C2C:?;//00465C2C
    procedure sub_0041ADA4;//00465C38
    //procedure sub_00465C3C(?:?);//00465C3C
    //procedure sub_00465C5C(?:?);//00465C5C
    //procedure sub_00465CFC(?:?);//00465CFC
    //procedure sub_00465D9C(?:?);//00465D9C

implementation

//00465A4C
{*function sub_00465A4C:?;
begin
 00465A4C    cmp         dword ptr ds:[5AD088],0;gvar_005AD088
>00465A53    je          00465A5E
 00465A55    cmp         dword ptr ds:[5AD08C],0;gvar_005AD08C
>00465A5C    jne         00465A6A
 00465A5E    cmp         dword ptr ds:[5AD090],0;gvar_005AD090
>00465A65    jne         00465A6A
 00465A67    xor         eax,eax
 00465A69    ret
 00465A6A    mov         al,1
 00465A6C    ret
end;*}

//00465A70
{*function sub_00465A70(?:?; ?:?):?;
begin
 00465A70    push        ebp
 00465A71    mov         ebp,esp
 00465A73    add         esp,0FFFFFFF8
 00465A76    push        ebx
 00465A77    push        esi
 00465A78    xor         ecx,ecx
 00465A7A    mov         dword ptr [ebp-8],ecx
 00465A7D    mov         word ptr [ebp-2],dx
 00465A81    mov         esi,eax
 00465A83    xor         eax,eax
 00465A85    push        ebp
 00465A86    push        465B4E
 00465A8B    push        dword ptr fs:[eax]
 00465A8E    mov         dword ptr fs:[eax],esp
 00465A91    cmp         dword ptr ds:[5AD088],0;gvar_005AD088
>00465A98    je          00465AAD
 00465A9A    mov         dx,word ptr [ebp-2]
 00465A9E    mov         eax,esi
 00465AA0    call        dword ptr ds:[5AD088]
 00465AA6    mov         ebx,eax
>00465AA8    jmp         00465B38
 00465AAD    xor         ebx,ebx
 00465AAF    cmp         dword ptr ds:[5AD090],0;gvar_005AD090
>00465AB6    je          00465AD8
 00465AB8    mov         eax,[005AD090];0x0 gvar_005AD090
 00465ABD    cmp         word ptr [eax+32],0
>00465AC2    je          00465AD8
 00465AC4    mov         ebx,dword ptr ds:[5AD090];0x0 gvar_005AD090
 00465ACA    mov         cx,word ptr [ebp-2]
 00465ACE    mov         edx,esi
 00465AD0    mov         eax,dword ptr [ebx+34]
 00465AD3    call        dword ptr [ebx+30]
 00465AD6    mov         ebx,eax
 00465AD8    test        ebx,ebx
>00465ADA    jne         00465B38
 00465ADC    mov         ax,word ptr [ebp-2]
 00465AE0    and         ax,0FFFF
 00465AE4    cmp         ax,0FFFF
>00465AE8    je          00465AF5
 00465AEA    mov         eax,esi
 00465AEC    call        FileExists
 00465AF1    test        al,al
>00465AF3    je          00465B0C
 00465AF5    mov         ax,word ptr [ebp-2]
 00465AF9    push        eax
 00465AFA    mov         ecx,esi
 00465AFC    mov         dl,1
 00465AFE    mov         eax,[00418550];TFileStream
 00465B03    call        TFileStream.Create;TFileStream.Create
 00465B08    mov         ebx,eax
>00465B0A    jmp         00465B38
 00465B0C    push        465B68;'File not found: "'
 00465B11    push        esi
 00465B12    push        465B84;'"'
 00465B17    lea         eax,[ebp-8]
 00465B1A    mov         edx,3
 00465B1F    call        @LStrCatN
 00465B24    mov         ecx,dword ptr [ebp-8]
 00465B27    mov         dl,1
 00465B29    mov         eax,[00408B30];Exception
 00465B2E    call        Exception.Create;Exception.Create
 00465B33    call        @RaiseExcept
 00465B38    xor         eax,eax
 00465B3A    pop         edx
 00465B3B    pop         ecx
 00465B3C    pop         ecx
 00465B3D    mov         dword ptr fs:[eax],edx
 00465B40    push        465B55
 00465B45    lea         eax,[ebp-8]
 00465B48    call        @LStrClr
 00465B4D    ret
>00465B4E    jmp         @HandleFinally
>00465B53    jmp         00465B45
 00465B55    mov         eax,ebx
 00465B57    pop         esi
 00465B58    pop         ebx
 00465B59    pop         ecx
 00465B5A    pop         ecx
 00465B5B    pop         ebp
 00465B5C    ret
end;*}

//00465B88
{*function sub_00465B88:?;
begin
 00465B88    push        ebx
 00465B89    cmp         dword ptr ds:[5AD08C],0;gvar_005AD08C
>00465B90    je          00465B9A
 00465B92    call        dword ptr ds:[5AD08C]
 00465B98    pop         ebx
 00465B99    ret
 00465B9A    cmp         dword ptr ds:[5AD090],0;gvar_005AD090
>00465BA1    je          00465BC0
 00465BA3    mov         edx,dword ptr ds:[5AD090];0x0 gvar_005AD090
 00465BA9    cmp         word ptr [edx+3A],0
>00465BAE    je          00465BC0
 00465BB0    mov         ebx,dword ptr ds:[5AD090];0x0 gvar_005AD090
 00465BB6    mov         edx,eax
 00465BB8    mov         eax,dword ptr [ebx+3C]
 00465BBB    call        dword ptr [ebx+38]
>00465BBE    jmp         00465BC5
 00465BC0    call        FileExists
 00465BC5    pop         ebx
 00465BC6    ret
end;*}

//00465BC8
constructor sub_00465BC8;
begin
{*
 00465BC8    push        ebx
 00465BC9    push        esi
 00465BCA    push        edi
 00465BCB    test        dl,dl
>00465BCD    je          00465BD7
 00465BCF    add         esp,0FFFFFFF0
 00465BD2    call        @ClassCreate
 00465BD7    mov         esi,ecx
 00465BD9    mov         ebx,edx
 00465BDB    mov         edi,eax
 00465BDD    xor         edx,edx
 00465BDF    mov         eax,edi
 00465BE1    call        TObject.Create
 00465BE6    mov         dword ptr [edi+4],esi;TDataFile.?f4:dword
 00465BE9    mov         eax,edi
 00465BEB    test        bl,bl
>00465BED    je          00465BFE
 00465BEF    call        @AfterConstruction
 00465BF4    pop         dword ptr fs:[0]
 00465BFB    add         esp,0C
 00465BFE    mov         eax,edi
 00465C00    pop         edi
 00465C01    pop         esi
 00465C02    pop         ebx
 00465C03    ret
*}
end;

//00465C04
destructor TDataFile.Destroy;
begin
{*
 00465C04    push        ebx
 00465C05    push        esi
 00465C06    call        @BeforeDestruction
 00465C0B    mov         ebx,edx
 00465C0D    mov         esi,eax
 00465C0F    mov         edx,ebx
 00465C11    and         dl,0FC
 00465C14    mov         eax,esi
 00465C16    call        TMemoryStream.Destroy
 00465C1B    test        bl,bl
>00465C1D    jle         00465C26
 00465C1F    mov         eax,esi
 00465C21    call        @ClassDestroy
 00465C26    pop         esi
 00465C27    pop         ebx
 00465C28    ret
*}
end;

//00465C2C
{*function sub_00465C2C:?;
begin
 00465C2C    mov         al,[00465C34];0x1 gvar_00465C34
 00465C31    ret
end;*}

//00465C38
procedure TDataFile.sub_0041ADA4;
begin
{*
 00465C38    mov         eax,dword ptr [eax+4];TDataFile.?f4:dword
 00465C3B    ret
*}
end;

//00465C3C
{*procedure TDataFile.sub_00465C3C(?:?);
begin
 00465C3C    push        ebx
 00465C3D    push        esi
 00465C3E    mov         esi,edx
 00465C40    mov         ebx,eax
 00465C42    test        ebx,ebx
>00465C44    je          00465C57
 00465C46    mov         eax,ebx
 00465C48    call        TObject.ClassType
 00465C4D    mov         ecx,esi
 00465C4F    mov         dl,1
 00465C51    call        dword ptr [eax+0C]
 00465C54    pop         esi
 00465C55    pop         ebx
 00465C56    ret
 00465C57    xor         eax,eax
 00465C59    pop         esi
 00465C5A    pop         ebx
 00465C5B    ret
end;*}

//00465C5C
{*procedure TDataFile.sub_00465C5C(?:?);
begin
 00465C5C    push        ebp
 00465C5D    mov         ebp,esp
 00465C5F    add         esp,0FFFFFFF8
 00465C62    push        ebx
 00465C63    push        esi
 00465C64    xor         ecx,ecx
 00465C66    mov         dword ptr [ebp-8],ecx
 00465C69    mov         esi,edx
 00465C6B    mov         ebx,eax
 00465C6D    xor         eax,eax
 00465C6F    push        ebp
 00465C70    push        465CED
 00465C75    push        dword ptr fs:[eax]
 00465C78    mov         dword ptr fs:[eax],esp
 00465C7B    lea         edx,[ebp-8]
 00465C7E    mov         eax,esi
 00465C80    call        ExtractFileName
 00465C85    mov         edx,dword ptr [ebp-8]
 00465C88    lea         eax,[ebx+8];TDataFile.?f8:String
 00465C8B    call        @LStrAsg
 00465C90    mov         dx,40
 00465C94    mov         eax,esi
 00465C96    call        00465A70
 00465C9B    mov         dword ptr [ebp-4],eax
 00465C9E    xor         eax,eax
 00465CA0    push        ebp
 00465CA1    push        465CD0
 00465CA6    push        dword ptr fs:[eax]
 00465CA9    mov         dword ptr fs:[eax],esp
 00465CAC    mov         edx,dword ptr [ebp-4]
 00465CAF    mov         eax,ebx
 00465CB1    mov         si,0FFFA
 00465CB5    call        @CallDynaInst;@AbstractError
 00465CBA    xor         eax,eax
 00465CBC    pop         edx
 00465CBD    pop         ecx
 00465CBE    pop         ecx
 00465CBF    mov         dword ptr fs:[eax],edx
 00465CC2    push        465CD7
 00465CC7    mov         eax,dword ptr [ebp-4]
 00465CCA    call        TObject.Free
 00465CCF    ret
>00465CD0    jmp         @HandleFinally
>00465CD5    jmp         00465CC7
 00465CD7    xor         eax,eax
 00465CD9    pop         edx
 00465CDA    pop         ecx
 00465CDB    pop         ecx
 00465CDC    mov         dword ptr fs:[eax],edx
 00465CDF    push        465CF4
 00465CE4    lea         eax,[ebp-8]
 00465CE7    call        @LStrClr
 00465CEC    ret
>00465CED    jmp         @HandleFinally
>00465CF2    jmp         00465CE4
 00465CF4    pop         esi
 00465CF5    pop         ebx
 00465CF6    pop         ecx
 00465CF7    pop         ecx
 00465CF8    pop         ebp
 00465CF9    ret
end;*}

//00465CFC
{*procedure TDataFile.sub_00465CFC(?:?);
begin
 00465CFC    push        ebp
 00465CFD    mov         ebp,esp
 00465CFF    add         esp,0FFFFFFF8
 00465D02    push        ebx
 00465D03    push        esi
 00465D04    xor         ecx,ecx
 00465D06    mov         dword ptr [ebp-8],ecx
 00465D09    mov         esi,edx
 00465D0B    mov         ebx,eax
 00465D0D    xor         eax,eax
 00465D0F    push        ebp
 00465D10    push        465D8D
 00465D15    push        dword ptr fs:[eax]
 00465D18    mov         dword ptr fs:[eax],esp
 00465D1B    lea         edx,[ebp-8]
 00465D1E    mov         eax,esi
 00465D20    call        ExtractFileName
 00465D25    mov         edx,dword ptr [ebp-8]
 00465D28    lea         eax,[ebx+8];TDataFile.?f8:String
 00465D2B    call        @LStrAsg
 00465D30    mov         dx,0FFFF
 00465D34    mov         eax,esi
 00465D36    call        00465A70
 00465D3B    mov         dword ptr [ebp-4],eax
 00465D3E    xor         eax,eax
 00465D40    push        ebp
 00465D41    push        465D70
 00465D46    push        dword ptr fs:[eax]
 00465D49    mov         dword ptr fs:[eax],esp
 00465D4C    mov         edx,dword ptr [ebp-4]
 00465D4F    mov         eax,ebx
 00465D51    mov         si,0FFF9
 00465D55    call        @CallDynaInst;TDataFile.sub_00465D9C
 00465D5A    xor         eax,eax
 00465D5C    pop         edx
 00465D5D    pop         ecx
 00465D5E    pop         ecx
 00465D5F    mov         dword ptr fs:[eax],edx
 00465D62    push        465D77
 00465D67    mov         eax,dword ptr [ebp-4]
 00465D6A    call        TObject.Free
 00465D6F    ret
>00465D70    jmp         @HandleFinally
>00465D75    jmp         00465D67
 00465D77    xor         eax,eax
 00465D79    pop         edx
 00465D7A    pop         ecx
 00465D7B    pop         ecx
 00465D7C    mov         dword ptr fs:[eax],edx
 00465D7F    push        465D94
 00465D84    lea         eax,[ebp-8]
 00465D87    call        @LStrClr
 00465D8C    ret
>00465D8D    jmp         @HandleFinally
>00465D92    jmp         00465D84
 00465D94    pop         esi
 00465D95    pop         ebx
 00465D96    pop         ecx
 00465D97    pop         ecx
 00465D98    pop         ebp
 00465D99    ret
end;*}

//00465D9C
{*procedure TDataFile.sub_00465D9C(?:?);
begin
 00465D9C    push        ebp
 00465D9D    mov         ebp,esp
 00465D9F    add         esp,0FFFFFDF4
 00465DA5    push        ebx
 00465DA6    push        esi
 00465DA7    xor         ecx,ecx
 00465DA9    mov         dword ptr [ebp-4],ecx
 00465DAC    mov         dword ptr [ebp-8],ecx
 00465DAF    mov         dword ptr [ebp-10C],ecx
 00465DB5    mov         esi,edx
 00465DB7    mov         ebx,eax
 00465DB9    xor         eax,eax
 00465DBB    push        ebp
 00465DBC    push        465E5D
 00465DC1    push        dword ptr fs:[eax]
 00465DC4    mov         dword ptr fs:[eax],esp
 00465DC7    push        465E74;'Export for '
 00465DCC    lea         edx,[ebp-108]
 00465DD2    mov         eax,dword ptr [ebx]
 00465DD4    call        TObject.ClassName
 00465DD9    lea         edx,[ebp-108]
 00465DDF    lea         eax,[ebp-8]
 00465DE2    call        @LStrFromString
 00465DE7    push        dword ptr [ebp-8]
 00465DEA    push        465E88;' to '
 00465DEF    lea         edx,[ebp-20C]
 00465DF5    mov         eax,dword ptr [esi]
 00465DF7    call        TObject.ClassName
 00465DFC    lea         edx,[ebp-20C]
 00465E02    lea         eax,[ebp-10C]
 00465E08    call        @LStrFromString
 00465E0D    push        dword ptr [ebp-10C]
 00465E13    push        465E98;' not available.'
 00465E18    lea         eax,[ebp-4]
 00465E1B    mov         edx,5
 00465E20    call        @LStrCatN
 00465E25    mov         eax,dword ptr [ebp-4]
 00465E28    mov         ecx,124
 00465E2D    mov         edx,465EB0;'C:\GLScene\glscene_v_1000714\Source\base\ApplicationFileIO.pas'
 00465E32    call        @Assert
 00465E37    xor         eax,eax
 00465E39    pop         edx
 00465E3A    pop         ecx
 00465E3B    pop         ecx
 00465E3C    mov         dword ptr fs:[eax],edx
 00465E3F    push        465E64
 00465E44    lea         eax,[ebp-10C]
 00465E4A    call        @LStrClr
 00465E4F    lea         eax,[ebp-8]
 00465E52    mov         edx,2
 00465E57    call        @LStrArrayClr
 00465E5C    ret
>00465E5D    jmp         @HandleFinally
>00465E62    jmp         00465E44
 00465E64    pop         esi
 00465E65    pop         ebx
 00465E66    mov         esp,ebp
 00465E68    pop         ebp
 00465E69    ret
end;*}

end.