//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLFile3DS;

interface

uses
  SysUtils, Classes;

type
  TGL3DSVectorFile = class(TVectorFile)
  public
    //function v10:?; virtual;//v10//0049E864
    //procedure sub_0049EE0C(?:?); dynamic;//0049EE0C
  end;
    //function sub_0049E864:?;//0049E864
    //procedure sub_0049E870(?:TMaterialList; ?:?; ?:?; ?:?);//0049E870
    //function sub_0049EB08(?:?):?;//0049EB08
    //function sub_0049ECEC(?:Pointer; ?:?):Boolean;//0049ECEC
    //function sub_0049ECF4(?:Pointer; ?:?):Boolean;//0049ECF4
    //procedure sub_0049ECFC(?:?; ?:?; ?:?; ?:?);//0049ECFC
    //function sub_0049ED18(?:?; ?:?; ?:Pointer):?;//0049ED18
    //procedure sub_0049ED28(?:?; ?:?);//0049ED28
    //procedure sub_0049EE0C(?:?);//0049EE0C

implementation

//0049E864
{*function sub_0049E864:?;
begin
 0049E864    mov         al,[0049E86C];0x1 gvar_0049E86C
 0049E869    ret
end;*}

//0049E870
{*procedure sub_0049E870(?:TMaterialList; ?:?; ?:?; ?:?);
begin
 0049E870    push        ebp
 0049E871    mov         ebp,esp
 0049E873    add         esp,0FFFFFFD4
 0049E876    push        ebx
 0049E877    push        esi
 0049E878    push        edi
 0049E879    xor         ebx,ebx
 0049E87B    mov         dword ptr [ebp-2C],ebx
 0049E87E    mov         dword ptr [ebp-4],ecx
 0049E881    mov         edi,edx
 0049E883    xor         edx,edx
 0049E885    push        ebp
 0049E886    push        49EA8C
 0049E88B    push        dword ptr fs:[edx]
 0049E88E    mov         dword ptr fs:[edx],esp
 0049E891    mov         edx,edi
 0049E893    call        0049A5D0
 0049E898    mov         ebx,eax
 0049E89A    test        ebx,ebx
>0049E89C    jne         0049E8B2
 0049E89E    mov         ecx,50
 0049E8A3    mov         edx,49EAA4;'C:\GLScene\glscene_v_1000714\Source\fileformats\GLFile3ds.pas'
 0049E8A8    mov         eax,49EAEC;'Assertion failure'
 0049E8AD    call        @Assert
 0049E8B2    mov         eax,dword ptr [ebp+8]
 0049E8B5    mov         eax,dword ptr [eax-4]
 0049E8B8    mov         si,0FFFF
 0049E8BC    call        @CallDynaInst
 0049E8C1    mov         edx,dword ptr ds:[48DBF0];TGLBaseMesh
 0049E8C7    call        @IsClass
 0049E8CC    test        al,al
>0049E8CE    je          0049EA6E
 0049E8D4    mov         eax,dword ptr [ebp+8]
 0049E8D7    mov         eax,dword ptr [eax-4]
 0049E8DA    mov         si,0FFFF
 0049E8DE    call        @CallDynaInst
 0049E8E3    mov         esi,dword ptr [eax+9C]
 0049E8E9    test        esi,esi
>0049E8EB    je          0049EA64
 0049E8F1    mov         eax,dword ptr [ebp-4]
 0049E8F4    mov         edx,edi
 0049E8F6    call        @LStrAsg
 0049E8FB    mov         eax,dword ptr [esi+34]
 0049E8FE    mov         edx,edi
 0049E900    call        004776DC
 0049E905    mov         dword ptr [ebp-8],eax
 0049E908    cmp         dword ptr [ebp-8],0
>0049E90C    jne         0049EA76
 0049E912    mov         eax,dword ptr [esi+34]
 0049E915    call        00477644
 0049E91A    mov         dword ptr [ebp-8],eax
 0049E91D    mov         edx,edi
 0049E91F    mov         eax,dword ptr [ebp-8]
 0049E922    call        TGLLibMaterial.SetName
 0049E927    mov         eax,dword ptr [ebp-8]
 0049E92A    mov         eax,dword ptr [eax+18]
 0049E92D    mov         esi,dword ptr [eax+18]
 0049E930    push        dword ptr [ebx+4]
 0049E933    push        dword ptr [ebx+8]
 0049E936    push        dword ptr [ebx+0C]
 0049E939    push        3F800000
 0049E93E    lea         eax,[ebp-28]
 0049E941    call        0045C928
 0049E946    lea         edx,[ebp-28]
 0049E949    mov         eax,dword ptr [esi+18]
 0049E94C    call        00472B48
 0049E951    push        dword ptr [ebx+10]
 0049E954    push        dword ptr [ebx+14]
 0049E957    push        dword ptr [ebx+18]
 0049E95A    push        3F800000
 0049E95F    lea         eax,[ebp-28]
 0049E962    call        0045C928
 0049E967    lea         edx,[ebp-28]
 0049E96A    mov         eax,dword ptr [esi+1C]
 0049E96D    call        00472B48
 0049E972    push        dword ptr [ebx+1C]
 0049E975    push        dword ptr [ebx+20]
 0049E978    push        dword ptr [ebx+24]
 0049E97B    push        3F800000
 0049E980    lea         eax,[ebp-18]
 0049E983    call        0045C928
 0049E988    fld         dword ptr ds:[49EB00];1:Single
 0049E98E    fsub        dword ptr [ebx+28]
 0049E991    add         esp,0FFFFFFFC
 0049E994    fstp        dword ptr [esp]
 0049E997    wait
 0049E998    lea         eax,[ebp-18]
 0049E99B    call        0045D78C
 0049E9A0    lea         edx,[ebp-18]
 0049E9A3    mov         eax,dword ptr [esi+20]
 0049E9A6    call        00472B48
 0049E9AB    fld         dword ptr ds:[49EB00];1:Single
 0049E9B1    fsub        dword ptr [ebx+2C]
 0049E9B4    fmul        dword ptr ds:[49EB04];128:Single
 0049E9BA    add         esp,0FFFFFFFC
 0049E9BD    fstp        dword ptr [esp]
 0049E9C0    wait
 0049E9C1    call        0045F6EC
 0049E9C6    mov         edx,eax
 0049E9C8    xor         eax,eax
 0049E9CA    call        0045F710
 0049E9CF    mov         edx,eax
 0049E9D1    mov         eax,esi
 0049E9D3    call        TGLFaceProperties.SetShininess
 0049E9D8    lea         edx,[ebp-2C]
 0049E9DB    mov         eax,dword ptr [ebx+54]
 0049E9DE    call        Trim
 0049E9E3    cmp         dword ptr [ebp-2C],0
>0049E9E7    je          0049EA76
 0049E9ED    xor         edx,edx
 0049E9EF    push        ebp
 0049E9F0    push        49EA33
 0049E9F5    push        dword ptr fs:[edx]
 0049E9F8    mov         dword ptr fs:[edx],esp
 0049E9FB    mov         eax,dword ptr [ebp-8]
 0049E9FE    mov         eax,dword ptr [eax+18]
 0049EA01    call        TGLMaterial.GetTexture
 0049EA06    mov         edi,eax
 0049EA08    mov         edx,dword ptr [ebx+54]
 0049EA0B    mov         eax,dword ptr [edi+24]
 0049EA0E    mov         si,0FFFC
 0049EA12    call        @CallDynaInst
 0049EA17    xor         edx,edx
 0049EA19    mov         eax,edi
 0049EA1B    call        TGLTexture.SetDisabled
 0049EA20    mov         dl,1
 0049EA22    mov         eax,edi
 0049EA24    call        TGLTexture.SetTextureMode
 0049EA29    xor         eax,eax
 0049EA2B    pop         edx
 0049EA2C    pop         ecx
 0049EA2D    pop         ecx
 0049EA2E    mov         dword ptr fs:[eax],edx
>0049EA31    jmp         0049EA76
>0049EA33    jmp         @HandleOnException
 0049EA38    dd          1
 0049EA3C    dd          00472694;ETexture
 0049EA40    dd          0049EA44
 0049EA44    mov         eax,dword ptr [ebp+8]
 0049EA47    mov         eax,dword ptr [eax-4]
 0049EA4A    call        00494320
 0049EA4F    cmp         byte ptr [eax+0B6],0
>0049EA56    jne         0049EA5D
 0049EA58    call        @RaiseAgain
 0049EA5D    call        @DoneExcept
>0049EA62    jmp         0049EA76
 0049EA64    mov         eax,dword ptr [ebp-4]
 0049EA67    call        @LStrClr
>0049EA6C    jmp         0049EA76
 0049EA6E    mov         eax,dword ptr [ebp-4]
 0049EA71    call        @LStrClr
 0049EA76    xor         eax,eax
 0049EA78    pop         edx
 0049EA79    pop         ecx
 0049EA7A    pop         ecx
 0049EA7B    mov         dword ptr fs:[eax],edx
 0049EA7E    push        49EA93
 0049EA83    lea         eax,[ebp-2C]
 0049EA86    call        @LStrClr
 0049EA8B    ret
>0049EA8C    jmp         @HandleFinally
>0049EA91    jmp         0049EA83
 0049EA93    pop         edi
 0049EA94    pop         esi
 0049EA95    pop         ebx
 0049EA96    mov         esp,ebp
 0049EA98    pop         ebp
 0049EA99    ret
end;*}

//0049EB08
{*function sub_0049EB08(?:?):?;
begin
 0049EB08    push        ebp
 0049EB09    mov         ebp,esp
 0049EB0B    add         esp,0FFFFFFF4
 0049EB0E    push        ebx
 0049EB0F    push        esi
 0049EB10    push        edi
 0049EB11    xor         ecx,ecx
 0049EB13    mov         dword ptr [ebp-0C],ecx
 0049EB16    xor         ecx,ecx
 0049EB18    push        ebp
 0049EB19    push        49EC75
 0049EB1E    push        dword ptr fs:[ecx]
 0049EB21    mov         dword ptr fs:[ecx],esp
 0049EB24    mov         dword ptr [ebp-4],0FFFFFFFF
 0049EB2B    call        0049A5D0
 0049EB30    mov         ebx,eax
 0049EB32    test        ebx,ebx
>0049EB34    jne         0049EB4A
 0049EB36    mov         ecx,7C
 0049EB3B    mov         edx,49EC90;'C:\GLScene\glscene_v_1000714\Source\fileformats\GLFile3ds.pas'
 0049EB40    mov         eax,49ECD8;'Assertion failure'
 0049EB45    call        @Assert
 0049EB4A    mov         eax,dword ptr [ebp+8]
 0049EB4D    mov         eax,dword ptr [eax-4]
 0049EB50    mov         si,0FFFF
 0049EB54    call        @CallDynaInst
 0049EB59    mov         edx,dword ptr ds:[48DBF0];TGLBaseMesh
 0049EB5F    call        @IsClass
 0049EB64    test        al,al
>0049EB66    je          0049EC5F
 0049EB6C    mov         eax,dword ptr [ebp+8]
 0049EB6F    mov         eax,dword ptr [eax-4]
 0049EB72    mov         si,0FFFF
 0049EB76    call        @CallDynaInst
 0049EB7B    mov         esi,dword ptr [eax+0A0]
 0049EB81    test        esi,esi
>0049EB83    je          0049EC5F
 0049EB89    lea         edx,[ebp-0C]
 0049EB8C    mov         eax,dword ptr [ebx+5F4]
 0049EB92    call        Trim
 0049EB97    cmp         dword ptr [ebp-0C],0
>0049EB9B    je          0049EC5F
 0049EBA1    mov         edx,dword ptr [ebx+5F4]
 0049EBA7    mov         eax,dword ptr [esi+34]
 0049EBAA    call        004776DC
 0049EBAF    mov         dword ptr [ebp-8],eax
 0049EBB2    cmp         dword ptr [ebp-8],0
>0049EBB6    jne         0049EC4D
 0049EBBC    mov         eax,dword ptr [esi+34]
 0049EBBF    call        00477644
 0049EBC4    mov         dword ptr [ebp-8],eax
 0049EBC7    mov         edx,dword ptr [ebx+5F4]
 0049EBCD    mov         eax,dword ptr [ebp-8]
 0049EBD0    call        TGLLibMaterial.SetName
 0049EBD5    xor         edx,edx
 0049EBD7    push        ebp
 0049EBD8    push        49EC1E
 0049EBDD    push        dword ptr fs:[edx]
 0049EBE0    mov         dword ptr fs:[edx],esp
 0049EBE3    mov         eax,dword ptr [ebp-8]
 0049EBE6    mov         eax,dword ptr [eax+18]
 0049EBE9    call        TGLMaterial.GetTexture
 0049EBEE    mov         edi,eax
 0049EBF0    mov         edx,dword ptr [ebx+5F4]
 0049EBF6    mov         eax,dword ptr [edi+24]
 0049EBF9    mov         si,0FFFC
 0049EBFD    call        @CallDynaInst
 0049EC02    xor         edx,edx
 0049EC04    mov         eax,edi
 0049EC06    call        TGLTexture.SetDisabled
 0049EC0B    mov         dl,1
 0049EC0D    mov         eax,edi
 0049EC0F    call        TGLTexture.SetTextureMode
 0049EC14    xor         eax,eax
 0049EC16    pop         edx
 0049EC17    pop         ecx
 0049EC18    pop         ecx
 0049EC19    mov         dword ptr fs:[eax],edx
>0049EC1C    jmp         0049EC4D
>0049EC1E    jmp         @HandleOnException
 0049EC23    dd          1
 0049EC27    dd          00472694;ETexture
 0049EC2B    dd          0049EC2F
 0049EC2F    mov         eax,dword ptr [ebp+8]
 0049EC32    mov         eax,dword ptr [eax-4]
 0049EC35    call        00494320
 0049EC3A    cmp         byte ptr [eax+0B6],0
>0049EC41    jne         0049EC48
 0049EC43    call        @RaiseAgain
 0049EC48    call        @DoneExcept
 0049EC4D    mov         eax,dword ptr [ebp-8]
 0049EC50    call        TCollectionItem.GetIndex
 0049EC55    mov         dword ptr [ebp-4],eax
 0049EC58    mov         eax,dword ptr [ebp+8]
 0049EC5B    mov         byte ptr [eax-5],1
 0049EC5F    xor         eax,eax
 0049EC61    pop         edx
 0049EC62    pop         ecx
 0049EC63    pop         ecx
 0049EC64    mov         dword ptr fs:[eax],edx
 0049EC67    push        49EC7C
 0049EC6C    lea         eax,[ebp-0C]
 0049EC6F    call        @LStrClr
 0049EC74    ret
>0049EC75    jmp         @HandleFinally
>0049EC7A    jmp         0049EC6C
 0049EC7C    mov         eax,dword ptr [ebp-4]
 0049EC7F    pop         edi
 0049EC80    pop         esi
 0049EC81    pop         ebx
 0049EC82    mov         esp,ebp
 0049EC84    pop         ebp
 0049EC85    ret
end;*}

//0049ECEC
{*function sub_0049ECEC(?:Pointer; ?:?):Boolean;
begin
 0049ECEC    bt          dword ptr [eax],edx
 0049ECEF    setb        al
 0049ECF2    ret
end;*}

//0049ECF4
{*function sub_0049ECF4(?:Pointer; ?:?):Boolean;
begin
 0049ECF4    bts         dword ptr [eax],edx
 0049ECF7    setb        al
 0049ECFA    ret
end;*}

//0049ECFC
{*procedure sub_0049ECFC(?:?; ?:?; ?:?; ?:?);
begin
 0049ECFC    push        ebp
 0049ECFD    mov         ebp,esp
 0049ECFF    push        ebx
 0049ED00    bsf         ebx,edx
 0049ED03    mov         edx,dword ptr [ebp+8]
 0049ED06    shl         eax,7
 0049ED09    add         eax,edx
 0049ED0B    lea         edx,[eax+ebx*4]
 0049ED0E    mov         dword ptr [edx],ecx
 0049ED10    pop         ebx
 0049ED11    pop         ebp
 0049ED12    ret         4
end;*}

//0049ED18
{*function sub_0049ED18(?:?; ?:?; ?:Pointer):?;
begin
 0049ED18    push        ebx
 0049ED19    bsf         ebx,edx
 0049ED1C    shl         eax,7
 0049ED1F    add         eax,ecx
 0049ED21    lea         ecx,[eax+ebx*4]
 0049ED24    mov         eax,dword ptr [ecx]
 0049ED26    pop         ebx
 0049ED27    ret
end;*}

//0049ED28
{*procedure sub_0049ED28(?:?; ?:?);
begin
 0049ED28    push        ebp
 0049ED29    mov         ebp,esp
 0049ED2B    add         esp,0FFFFFFF4
 0049ED2E    push        ebx
 0049ED2F    push        esi
 0049ED30    push        edi
 0049ED31    mov         esi,eax
 0049ED33    mov         edi,dword ptr [ebp+8]
 0049ED36    add         edi,0FFFFFFE8
 0049ED39    mov         eax,dword ptr [ebp+8]
 0049ED3C    mov         eax,dword ptr [eax-14]
 0049ED3F    mov         ebx,dword ptr [eax+0C]
 0049ED42    lea         ecx,[ebp-0C]
 0049ED45    mov         edx,esi
 0049ED47    mov         eax,ebx
 0049ED49    call        00468C18
 0049ED4E    lea         edx,[ebp-0C]
 0049ED51    mov         eax,ebx
 0049ED53    call        00468A90
 0049ED58    mov         edx,dword ptr ds:[5AE438];^gvar_005ACF18
 0049ED5E    mov         eax,dword ptr [ebp+8]
 0049ED61    mov         eax,dword ptr [eax-14]
 0049ED64    mov         eax,dword ptr [eax+10]
 0049ED67    call        00468A90
 0049ED6C    mov         eax,dword ptr [edi]
 0049ED6E    inc         eax
 0049ED6F    mov         edx,eax
 0049ED71    shl         edx,7
 0049ED74    mov         eax,dword ptr [ebp+8]
 0049ED77    add         eax,0FFFFFFF4
 0049ED7A    call        @ReallocMem
 0049ED7F    mov         eax,dword ptr [edi]
 0049ED81    shl         eax,4
 0049ED84    mov         edx,dword ptr [ebp+8]
 0049ED87    mov         edx,dword ptr [edx-0C]
 0049ED8A    lea         eax,[edx+eax*8]
 0049ED8D    mov         ecx,0FF
 0049ED92    mov         edx,80
 0049ED97    call        @FillChar
 0049ED9C    mov         eax,dword ptr [edi]
 0049ED9E    inc         eax
 0049ED9F    test        eax,eax
>0049EDA1    jns         0049EDA6
 0049EDA3    add         eax,7
 0049EDA6    sar         eax,3
 0049EDA9    mov         edx,dword ptr [edi]
 0049EDAB    test        edx,edx
>0049EDAD    jns         0049EDB2
 0049EDAF    add         edx,7
 0049EDB2    sar         edx,3
 0049EDB5    cmp         eax,edx
>0049EDB7    je          0049EDDE
 0049EDB9    mov         edx,eax
 0049EDBB    inc         edx
 0049EDBC    mov         eax,dword ptr [ebp+8]
 0049EDBF    add         eax,0FFFFFFF0
 0049EDC2    call        @ReallocMem
 0049EDC7    mov         eax,dword ptr [edi]
 0049EDC9    test        eax,eax
>0049EDCB    jns         0049EDD0
 0049EDCD    add         eax,7
 0049EDD0    sar         eax,3
 0049EDD3    mov         edx,dword ptr [ebp+8]
 0049EDD6    mov         edx,dword ptr [edx-10]
 0049EDD9    mov         byte ptr [edx+eax+1],0
 0049EDDE    mov         eax,dword ptr [ebp+8]
 0049EDE1    mov         eax,dword ptr [eax-14]
 0049EDE4    mov         ebx,dword ptr [eax+1C]
 0049EDE7    cmp         dword ptr [ebx+8],0
>0049EDEB    jle         0049EE03
 0049EDED    lea         ecx,[ebp-0C]
 0049EDF0    mov         edx,esi
 0049EDF2    mov         eax,ebx
 0049EDF4    call        00468C18
 0049EDF9    lea         edx,[ebp-0C]
 0049EDFC    mov         eax,ebx
 0049EDFE    call        00468A90
 0049EE03    inc         dword ptr [edi]
 0049EE05    pop         edi
 0049EE06    pop         esi
 0049EE07    pop         ebx
 0049EE08    mov         esp,ebp
 0049EE0A    pop         ebp
 0049EE0B    ret
end;*}

//0049EE0C
{*procedure TGL3DSVectorFile.sub_0049EE0C(?:?);
begin
 0049EE0C    push        ebp
 0049EE0D    mov         ebp,esp
 0049EE0F    add         esp,0FFFFFF70
 0049EE15    push        ebx
 0049EE16    push        esi
 0049EE17    push        edi
 0049EE18    xor         ecx,ecx
 0049EE1A    mov         dword ptr [ebp-90],ecx
 0049EE20    mov         dword ptr [ebp-1C],edx
 0049EE23    mov         dword ptr [ebp-4],eax
 0049EE26    xor         eax,eax
 0049EE28    push        ebp
 0049EE29    push        49F5A0
 0049EE2E    push        dword ptr fs:[eax]
 0049EE31    mov         dword ptr fs:[eax],esp
 0049EE34    mov         dl,1
 0049EE36    mov         eax,[0049A380];TFile3DS
 0049EE3B    call        TFile3DS.Create;TFile3DS.Create
 0049EE40    mov         dword ptr [ebp-38],eax
 0049EE43    xor         edx,edx
 0049EE45    push        ebp
 0049EE46    push        49F580
 0049EE4B    push        dword ptr fs:[edx]
 0049EE4E    mov         dword ptr fs:[edx],esp
 0049EE51    mov         edx,dword ptr [ebp-1C]
 0049EE54    mov         eax,dword ptr [ebp-38]
 0049EE57    call        0049B18C
 0049EE5C    mov         eax,dword ptr [ebp-4]
 0049EE5F    cmp         byte ptr [eax+0C],0;TGL3DSVectorFile.?fC:byte
 0049EE63    sete        al
 0049EE66    xor         al,1
 0049EE68    mov         byte ptr [ebp-31],al
 0049EE6B    mov         eax,dword ptr [ebp-38]
 0049EE6E    mov         eax,dword ptr [eax+28];TFile3DS.?f28:TObjectList
 0049EE71    call        0049A790
 0049EE76    dec         eax
 0049EE77    test        eax,eax
>0049EE79    jl          0049F56A
 0049EE7F    inc         eax
 0049EE80    mov         dword ptr [ebp-3C],eax
 0049EE83    mov         dword ptr [ebp-24],0
 0049EE8A    mov         eax,dword ptr [ebp-38]
 0049EE8D    mov         eax,dword ptr [eax+28];TFile3DS.?f28:TObjectList
 0049EE90    mov         edx,dword ptr [ebp-24]
 0049EE93    call        0049A7C0
 0049EE98    mov         edi,eax
 0049EE9A    cmp         byte ptr [edi+4],0
>0049EE9E    jne         0049F55E
 0049EEA4    cmp         word ptr [edi+0C],3
>0049EEA9    jb          0049F55E
 0049EEAF    mov         byte ptr [ebp-5],0
 0049EEB3    mov         eax,dword ptr [ebp-4]
 0049EEB6    call        00494320
 0049EEBB    mov         ecx,dword ptr [eax+0C8]
 0049EEC1    mov         dl,1
 0049EEC3    mov         eax,[0048D104];TMeshObject
 0049EEC8    call        TMeshObject.Create;TMeshObject.Create
 0049EECD    mov         dword ptr [ebp-14],eax
 0049EED0    mov         eax,dword ptr [ebp-38]
 0049EED3    mov         eax,dword ptr [eax+28];TFile3DS.?f28:TObjectList
 0049EED6    mov         edx,dword ptr [ebp-24]
 0049EED9    call        0049A7C0
 0049EEDE    mov         edx,dword ptr [eax]
 0049EEE0    mov         eax,dword ptr [ebp-14]
 0049EEE3    add         eax,8;TMeshObject.?f8:String
 0049EEE6    call        @LStrAsg
 0049EEEB    mov         eax,dword ptr [ebp-14]
 0049EEEE    mov         byte ptr [eax+2C],2;TMeshObject.?f2C:byte
 0049EEF2    movzx       edx,word ptr [edi+0C]
 0049EEF6    mov         eax,dword ptr [ebp-14]
 0049EEF9    mov         eax,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 0049EEFC    mov         ecx,dword ptr [eax]
 0049EEFE    call        dword ptr [ecx+1C];TAffineVectorList.sub_00468CBC
 0049EF01    movzx       edx,word ptr [edi+0C]
 0049EF05    mov         eax,dword ptr [ebp-14]
 0049EF08    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049EF0B    call        00468208
 0049EF10    cmp         word ptr [edi+1C],0
>0049EF15    jbe         0049EF66
 0049EF17    movzx       edx,word ptr [edi+0C]
 0049EF1B    mov         eax,dword ptr [ebp-14]
 0049EF1E    mov         eax,dword ptr [eax+1C];TMeshObject.?f1C:TAffineVectorList
 0049EF21    mov         ecx,dword ptr [eax]
 0049EF23    call        dword ptr [ecx+1C];TAffineVectorList.sub_00468CBC
 0049EF26    movzx       eax,word ptr [edi+0C]
 0049EF2A    dec         eax
 0049EF2B    test        eax,eax
>0049EF2D    jl          0049EF91
 0049EF2F    inc         eax
 0049EF30    mov         dword ptr [ebp-40],eax
 0049EF33    xor         ebx,ebx
 0049EF35    lea         eax,[ebx+ebx*2]
 0049EF38    mov         edx,dword ptr [edi+10]
 0049EF3B    lea         eax,[edx+eax*4]
 0049EF3E    mov         edx,eax
 0049EF40    mov         eax,dword ptr [ebp-14]
 0049EF43    mov         eax,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 0049EF46    call        00468A90
 0049EF4B    mov         eax,dword ptr [edi+20]
 0049EF4E    lea         eax,[eax+ebx*8]
 0049EF51    mov         edx,eax
 0049EF53    mov         eax,dword ptr [ebp-14]
 0049EF56    mov         eax,dword ptr [eax+1C];TMeshObject.?f1C:TAffineVectorList
 0049EF59    call        00468B5C
 0049EF5E    inc         ebx
 0049EF5F    dec         dword ptr [ebp-40]
>0049EF62    jne         0049EF35
>0049EF64    jmp         0049EF91
 0049EF66    movzx       eax,word ptr [edi+0C]
 0049EF6A    dec         eax
 0049EF6B    test        eax,eax
>0049EF6D    jl          0049EF91
 0049EF6F    inc         eax
 0049EF70    mov         dword ptr [ebp-40],eax
 0049EF73    xor         ebx,ebx
 0049EF75    lea         eax,[ebx+ebx*2]
 0049EF78    mov         edx,dword ptr [edi+10]
 0049EF7B    lea         eax,[edx+eax*4]
 0049EF7E    mov         edx,eax
 0049EF80    mov         eax,dword ptr [ebp-14]
 0049EF83    mov         eax,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 0049EF86    call        00468A90
 0049EF8B    inc         ebx
 0049EF8C    dec         dword ptr [ebp-40]
>0049EF8F    jne         0049EF75
 0049EF91    movzx       eax,word ptr [edi+0C]
 0049EF95    mov         dword ptr [ebp-18],eax
 0049EF98    movzx       eax,word ptr [edi+0C]
 0049EF9C    shr         eax,3
 0049EF9F    inc         eax
 0049EFA0    call        AllocMem
 0049EFA5    mov         dword ptr [ebp-10],eax
 0049EFA8    movzx       eax,word ptr [edi+0C]
 0049EFAC    shl         eax,7
 0049EFAF    call        @GetMem
 0049EFB4    mov         dword ptr [ebp-0C],eax
 0049EFB7    cmp         dword ptr [edi+0B8],0
>0049EFBE    jne         0049F0FC
 0049EFC4    movzx       eax,word ptr [edi+0B0]
 0049EFCB    dec         eax
 0049EFCC    test        eax,eax
>0049EFCE    jl          0049F345
 0049EFD4    inc         eax
 0049EFD5    mov         dword ptr [ebp-40],eax
 0049EFD8    mov         dword ptr [ebp-28],0
 0049EFDF    mov         eax,dword ptr [edi+0B4]
 0049EFE5    mov         edx,dword ptr [ebp-28]
 0049EFE8    lea         eax,[eax+edx*8]
 0049EFEB    mov         dword ptr [ebp-44],eax
 0049EFEE    mov         eax,dword ptr [ebp-14]
 0049EFF1    mov         ebx,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 0049EFF4    lea         ecx,[ebp-80]
 0049EFF7    mov         eax,dword ptr [ebp-44]
 0049EFFA    movzx       edx,word ptr [eax+2]
 0049EFFE    mov         eax,ebx
 0049F000    call        00468C18
 0049F005    lea         eax,[ebp-80]
 0049F008    push        eax
 0049F009    lea         ecx,[ebp-8C]
 0049F00F    mov         eax,dword ptr [ebp-44]
 0049F012    movzx       edx,word ptr [eax]
 0049F015    mov         eax,ebx
 0049F017    call        00468C18
 0049F01C    lea         eax,[ebp-8C]
 0049F022    lea         ecx,[ebp-5C]
 0049F025    pop         edx
 0049F026    call        0045CBA8
 0049F02B    lea         ecx,[ebp-80]
 0049F02E    mov         eax,dword ptr [ebp-44]
 0049F031    movzx       edx,word ptr [eax+2]
 0049F035    mov         eax,ebx
 0049F037    call        00468C18
 0049F03C    lea         eax,[ebp-80]
 0049F03F    push        eax
 0049F040    lea         ecx,[ebp-8C]
 0049F046    mov         eax,dword ptr [ebp-44]
 0049F049    movzx       edx,word ptr [eax+4]
 0049F04D    mov         eax,ebx
 0049F04F    call        00468C18
 0049F054    lea         eax,[ebp-8C]
 0049F05A    lea         ecx,[ebp-68]
 0049F05D    pop         edx
 0049F05E    call        0045CBA8
 0049F063    cmp         byte ptr [ebp-31],0
>0049F067    je          0049F079
 0049F069    lea         ecx,[ebp-74]
 0049F06C    lea         edx,[ebp-68]
 0049F06F    lea         eax,[ebp-5C]
 0049F072    call        0045CEA8
>0049F077    jmp         0049F087
 0049F079    lea         ecx,[ebp-74]
 0049F07C    lea         edx,[ebp-5C]
 0049F07F    lea         eax,[ebp-68]
 0049F082    call        0045CEA8
 0049F087    xor         esi,esi
 0049F089    mov         eax,dword ptr [ebp-44]
 0049F08C    mov         bx,word ptr [eax+esi*2]
 0049F090    movzx       edx,bx
 0049F093    mov         eax,dword ptr [ebp-10]
 0049F096    call        0049ECEC
 0049F09B    test        al,al
>0049F09D    je          0049F0C9
 0049F09F    push        ebp
 0049F0A0    movzx       eax,bx
 0049F0A3    call        0049ED28
 0049F0A8    pop         ecx
 0049F0A9    mov         eax,dword ptr [ebp-44]
 0049F0AC    mov         dx,word ptr [ebp-18]
 0049F0B0    dec         edx
 0049F0B1    mov         word ptr [eax+esi*2],dx
 0049F0B5    lea         ecx,[ebp-74]
 0049F0B8    mov         edx,dword ptr [ebp-18]
 0049F0BB    dec         edx
 0049F0BC    mov         eax,dword ptr [ebp-14]
 0049F0BF    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F0C2    call        00468C9C
>0049F0C7    jmp         0049F0E5
 0049F0C9    lea         ecx,[ebp-74]
 0049F0CC    movzx       edx,bx
 0049F0CF    mov         eax,dword ptr [ebp-14]
 0049F0D2    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F0D5    call        00468C9C
 0049F0DA    movzx       edx,bx
 0049F0DD    mov         eax,dword ptr [ebp-10]
 0049F0E0    call        0049ECF4
 0049F0E5    inc         esi
 0049F0E6    cmp         esi,3
>0049F0E9    jne         0049F089
 0049F0EB    inc         dword ptr [ebp-28]
 0049F0EE    dec         dword ptr [ebp-40]
>0049F0F1    jne         0049EFDF
>0049F0F7    jmp         0049F345
 0049F0FC    movzx       eax,word ptr [edi+0B0]
 0049F103    dec         eax
 0049F104    test        eax,eax
>0049F106    jl          0049F345
 0049F10C    inc         eax
 0049F10D    mov         dword ptr [ebp-40],eax
 0049F110    mov         dword ptr [ebp-28],0
 0049F117    mov         eax,dword ptr [edi+0B4]
 0049F11D    mov         edx,dword ptr [ebp-28]
 0049F120    lea         eax,[eax+edx*8]
 0049F123    mov         dword ptr [ebp-48],eax
 0049F126    mov         eax,dword ptr [ebp-14]
 0049F129    mov         ebx,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 0049F12C    lea         ecx,[ebp-80]
 0049F12F    mov         eax,dword ptr [ebp-48]
 0049F132    movzx       edx,word ptr [eax+2]
 0049F136    mov         eax,ebx
 0049F138    call        00468C18
 0049F13D    lea         eax,[ebp-80]
 0049F140    push        eax
 0049F141    lea         ecx,[ebp-8C]
 0049F147    mov         eax,dword ptr [ebp-48]
 0049F14A    movzx       edx,word ptr [eax]
 0049F14D    mov         eax,ebx
 0049F14F    call        00468C18
 0049F154    lea         eax,[ebp-8C]
 0049F15A    lea         ecx,[ebp-5C]
 0049F15D    pop         edx
 0049F15E    call        0045CBA8
 0049F163    lea         ecx,[ebp-80]
 0049F166    mov         eax,dword ptr [ebp-48]
 0049F169    movzx       edx,word ptr [eax+2]
 0049F16D    mov         eax,ebx
 0049F16F    call        00468C18
 0049F174    lea         eax,[ebp-80]
 0049F177    push        eax
 0049F178    lea         ecx,[ebp-8C]
 0049F17E    mov         eax,dword ptr [ebp-48]
 0049F181    movzx       edx,word ptr [eax+4]
 0049F185    mov         eax,ebx
 0049F187    call        00468C18
 0049F18C    lea         eax,[ebp-8C]
 0049F192    lea         ecx,[ebp-68]
 0049F195    pop         edx
 0049F196    call        0045CBA8
 0049F19B    cmp         byte ptr [ebp-31],0
>0049F19F    je          0049F1B1
 0049F1A1    lea         ecx,[ebp-74]
 0049F1A4    lea         edx,[ebp-68]
 0049F1A7    lea         eax,[ebp-5C]
 0049F1AA    call        0045CEA8
>0049F1AF    jmp         0049F1BF
 0049F1B1    lea         ecx,[ebp-74]
 0049F1B4    lea         edx,[ebp-5C]
 0049F1B7    lea         eax,[ebp-68]
 0049F1BA    call        0045CEA8
 0049F1BF    mov         eax,dword ptr [edi+0B8]
 0049F1C5    mov         edx,dword ptr [ebp-28]
 0049F1C8    mov         eax,dword ptr [eax+edx*4]
 0049F1CB    mov         dword ptr [ebp-30],eax
 0049F1CE    xor         esi,esi
 0049F1D0    mov         eax,dword ptr [ebp-48]
 0049F1D3    mov         bx,word ptr [eax+esi*2]
 0049F1D7    movzx       edx,bx
 0049F1DA    mov         eax,dword ptr [ebp-10]
 0049F1DD    call        0049ECEC
 0049F1E2    test        al,al
>0049F1E4    je          0049F2E1
 0049F1EA    cmp         dword ptr [ebp-30],0
>0049F1EE    jne         0049F229
 0049F1F0    push        ebp
 0049F1F1    movzx       eax,bx
 0049F1F4    call        0049ED28
 0049F1F9    pop         ecx
 0049F1FA    mov         eax,dword ptr [ebp-48]
 0049F1FD    mov         dx,word ptr [ebp-18]
 0049F201    dec         edx
 0049F202    mov         word ptr [eax+esi*2],dx
 0049F206    lea         ecx,[ebp-74]
 0049F209    mov         edx,dword ptr [ebp-18]
 0049F20C    dec         edx
 0049F20D    mov         eax,dword ptr [ebp-14]
 0049F210    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F213    call        00468C9C
 0049F218    mov         edx,dword ptr [ebp-18]
 0049F21B    dec         edx
 0049F21C    mov         eax,dword ptr [ebp-10]
 0049F21F    call        0049ECF4
>0049F224    jmp         0049F32F
 0049F229    movzx       eax,bx
 0049F22C    mov         ecx,dword ptr [ebp-0C]
 0049F22F    mov         edx,dword ptr [ebp-30]
 0049F232    call        0049ED18
 0049F237    mov         dword ptr [ebp-2C],eax
 0049F23A    cmp         dword ptr [ebp-2C],0
>0049F23E    jge         0049F29E
 0049F240    push        ebp
 0049F241    movzx       eax,bx
 0049F244    call        0049ED28
 0049F249    pop         ecx
 0049F24A    mov         eax,dword ptr [ebp-48]
 0049F24D    mov         dx,word ptr [ebp-18]
 0049F251    dec         edx
 0049F252    mov         word ptr [eax+esi*2],dx
 0049F256    lea         ecx,[ebp-74]
 0049F259    mov         edx,dword ptr [ebp-18]
 0049F25C    dec         edx
 0049F25D    mov         eax,dword ptr [ebp-14]
 0049F260    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F263    call        00468C9C
 0049F268    mov         eax,dword ptr [ebp-0C]
 0049F26B    push        eax
 0049F26C    mov         ecx,dword ptr [ebp-18]
 0049F26F    dec         ecx
 0049F270    movzx       eax,bx
 0049F273    mov         edx,dword ptr [ebp-30]
 0049F276    call        0049ECFC
 0049F27B    mov         edx,dword ptr [ebp-0C]
 0049F27E    push        edx
 0049F27F    mov         eax,dword ptr [ebp-18]
 0049F282    dec         eax
 0049F283    mov         ecx,eax
 0049F285    mov         edx,dword ptr [ebp-30]
 0049F288    call        0049ECFC
 0049F28D    mov         edx,dword ptr [ebp-18]
 0049F290    dec         edx
 0049F291    mov         eax,dword ptr [ebp-10]
 0049F294    call        0049ECF4
>0049F299    jmp         0049F32F
 0049F29E    lea         ecx,[ebp-8C]
 0049F2A4    mov         eax,dword ptr [ebp-14]
 0049F2A7    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F2AA    mov         edx,dword ptr [ebp-2C]
 0049F2AD    call        00468C18
 0049F2B2    lea         eax,[ebp-8C]
 0049F2B8    lea         ecx,[ebp-80]
 0049F2BB    lea         edx,[ebp-74]
 0049F2BE    call        0045CA78
 0049F2C3    lea         ecx,[ebp-80]
 0049F2C6    mov         eax,dword ptr [ebp-14]
 0049F2C9    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F2CC    mov         edx,dword ptr [ebp-2C]
 0049F2CF    call        00468C9C
 0049F2D4    mov         eax,dword ptr [ebp-48]
 0049F2D7    mov         dx,word ptr [ebp-2C]
 0049F2DB    mov         word ptr [eax+esi*2],dx
>0049F2DF    jmp         0049F32F
 0049F2E1    lea         ecx,[ebp-74]
 0049F2E4    movzx       edx,bx
 0049F2E7    mov         eax,dword ptr [ebp-14]
 0049F2EA    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F2ED    call        00468C9C
 0049F2F2    movzx       eax,bx
 0049F2F5    shl         eax,4
 0049F2F8    mov         edx,dword ptr [ebp-0C]
 0049F2FB    lea         eax,[edx+eax*8]
 0049F2FE    mov         ecx,0FF
 0049F303    mov         edx,80
 0049F308    call        @FillChar
 0049F30D    cmp         dword ptr [ebp-30],0
>0049F311    je          0049F324
 0049F313    mov         edx,dword ptr [ebp-0C]
 0049F316    push        edx
 0049F317    movzx       eax,bx
 0049F31A    mov         ecx,eax
 0049F31C    mov         edx,dword ptr [ebp-30]
 0049F31F    call        0049ECFC
 0049F324    movzx       edx,bx
 0049F327    mov         eax,dword ptr [ebp-10]
 0049F32A    call        0049ECF4
 0049F32F    inc         esi
 0049F330    cmp         esi,3
>0049F333    jne         0049F1D0
 0049F339    inc         dword ptr [ebp-28]
 0049F33C    dec         dword ptr [ebp-40]
>0049F33F    jne         0049F117
 0049F345    mov         eax,dword ptr [ebp-10]
 0049F348    call        @FreeMem
 0049F34D    mov         eax,dword ptr [ebp-0C]
 0049F350    call        @FreeMem
 0049F355    mov         eax,dword ptr [ebp-14]
 0049F358    mov         eax,dword ptr [eax+0C];TMeshObject.?fC:TAffineVectorList
 0049F35B    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 0049F35E    cmp         eax,dword ptr [ebp-18]
>0049F361    je          0049F377
 0049F363    mov         ecx,16C
 0049F368    mov         edx,49F5B8;'C:\GLScene\glscene_v_1000714\Source\fileformats\GLFile3ds.pas'
 0049F36D    mov         eax,49F600;'Assertion failure'
 0049F372    call        @Assert
 0049F377    mov         eax,dword ptr [ebp-14]
 0049F37A    mov         eax,dword ptr [eax+10];TMeshObject.?f10:TAffineVectorList
 0049F37D    mov         si,0FFF2
 0049F381    call        @CallDynaInst;TAffineVectorList.sub_00468478
 0049F386    cmp         word ptr [edi+0DA],0
>0049F38E    je          0049F39A
 0049F390    mov         eax,[005AE21C];^gvar_005AD708
 0049F395    cmp         byte ptr [eax],0
>0049F398    jne         0049F40C
 0049F39A    mov         eax,dword ptr [ebp-14]
 0049F39D    mov         ecx,dword ptr [eax+28];TMeshObject.?f28:TFaceGroups
 0049F3A0    mov         dl,1
 0049F3A2    mov         eax,[0048D6E4];TFGVertexIndexList
 0049F3A7    call        TFGVertexIndexList.Create;TFGVertexIndexList.Create
 0049F3AC    mov         esi,eax
 0049F3AE    lea         eax,[esi+0C];TFGVertexIndexList.?fC:String
 0049F3B1    call        @LStrClr
 0049F3B6    movzx       eax,word ptr [edi+0B0]
 0049F3BD    dec         eax
 0049F3BE    test        eax,eax
>0049F3C0    jl          0049F507
 0049F3C6    inc         eax
 0049F3C7    mov         dword ptr [ebp-40],eax
 0049F3CA    xor         ebx,ebx
 0049F3CC    mov         eax,dword ptr [edi+0B4]
 0049F3D2    movzx       edx,word ptr [eax+ebx*8]
 0049F3D6    mov         eax,esi
 0049F3D8    call        004938E4
 0049F3DD    mov         eax,dword ptr [edi+0B4]
 0049F3E3    movzx       edx,word ptr [eax+ebx*8+2]
 0049F3E8    mov         eax,esi
 0049F3EA    call        004938E4
 0049F3EF    mov         eax,dword ptr [edi+0B4]
 0049F3F5    movzx       edx,word ptr [eax+ebx*8+4]
 0049F3FA    mov         eax,esi
 0049F3FC    call        004938E4
 0049F401    inc         ebx
 0049F402    dec         dword ptr [ebp-40]
>0049F405    jne         0049F3CC
>0049F407    jmp         0049F507
 0049F40C    movzx       eax,word ptr [edi+0DA]
 0049F413    dec         eax
 0049F414    test        eax,eax
>0049F416    jl          0049F507
 0049F41C    inc         eax
 0049F41D    mov         dword ptr [ebp-40],eax
 0049F420    mov         dword ptr [ebp-20],0
 0049F427    mov         eax,dword ptr [ebp-14]
 0049F42A    mov         ecx,dword ptr [eax+28];TMeshObject.?f28:TFaceGroups
 0049F42D    mov         dl,1
 0049F42F    mov         eax,[0048D6E4];TFGVertexIndexList
 0049F434    call        TFGVertexIndexList.Create;TFGVertexIndexList.Create
 0049F439    mov         esi,eax
 0049F43B    push        ebp
 0049F43C    mov         ebx,dword ptr [ebp-20]
 0049F43F    lea         ebx,[ebx+ebx*2]
 0049F442    mov         eax,dword ptr [edi+0DC]
 0049F448    mov         edx,dword ptr [eax+ebx*4]
 0049F44B    lea         ecx,[ebp-90]
 0049F451    mov         eax,dword ptr [ebp-38]
 0049F454    mov         eax,dword ptr [eax+24];TFile3DS.?f24:TMaterialList
 0049F457    call        0049E870
 0049F45C    pop         ecx
 0049F45D    mov         edx,dword ptr [ebp-90]
 0049F463    lea         eax,[esi+0C];TFGVertexIndexList.?fC:String
 0049F466    call        @LStrAsg
 0049F46B    push        ebp
 0049F46C    mov         eax,dword ptr [edi+0DC]
 0049F472    mov         edx,dword ptr [eax+ebx*4]
 0049F475    mov         eax,dword ptr [ebp-38]
 0049F478    mov         eax,dword ptr [eax+24];TFile3DS.?f24:TMaterialList
 0049F47B    call        0049EB08
 0049F480    pop         ecx
 0049F481    mov         dword ptr [esi+14],eax;TFGVertexIndexList.?f14:dword
 0049F484    mov         eax,dword ptr [edi+0DC]
 0049F48A    lea         eax,[eax+ebx*4]
 0049F48D    mov         dword ptr [ebp-4C],eax
 0049F490    mov         eax,dword ptr [ebp-4C]
 0049F493    movzx       eax,word ptr [eax+4]
 0049F497    dec         eax
 0049F498    test        eax,eax
>0049F49A    jl          0049F4FB
 0049F49C    inc         eax
 0049F49D    mov         dword ptr [ebp-50],eax
 0049F4A0    xor         ebx,ebx
 0049F4A2    mov         eax,dword ptr [ebp-4C]
 0049F4A5    mov         eax,dword ptr [eax+8]
 0049F4A8    movzx       eax,word ptr [eax+ebx*2]
 0049F4AC    mov         edx,dword ptr [edi+0B4]
 0049F4B2    movzx       edx,word ptr [edx+eax*8]
 0049F4B6    mov         eax,esi
 0049F4B8    call        004938E4
 0049F4BD    mov         eax,dword ptr [ebp-4C]
 0049F4C0    mov         eax,dword ptr [eax+8]
 0049F4C3    movzx       eax,word ptr [eax+ebx*2]
 0049F4C7    mov         edx,dword ptr [edi+0B4]
 0049F4CD    movzx       edx,word ptr [edx+eax*8+2]
 0049F4D2    mov         eax,esi
 0049F4D4    call        004938E4
 0049F4D9    mov         eax,dword ptr [ebp-4C]
 0049F4DC    mov         eax,dword ptr [eax+8]
 0049F4DF    movzx       eax,word ptr [eax+ebx*2]
 0049F4E3    mov         edx,dword ptr [edi+0B4]
 0049F4E9    movzx       edx,word ptr [edx+eax*8+4]
 0049F4EE    mov         eax,esi
 0049F4F0    call        004938E4
 0049F4F5    inc         ebx
 0049F4F6    dec         dword ptr [ebp-50]
>0049F4F9    jne         0049F4A2
 0049F4FB    inc         dword ptr [ebp-20]
 0049F4FE    dec         dword ptr [ebp-40]
>0049F501    jne         0049F427
 0049F507    cmp         byte ptr [ebp-5],0
>0049F50B    je          0049F55E
 0049F50D    mov         eax,dword ptr [ebp-14]
 0049F510    mov         eax,dword ptr [eax+1C];TMeshObject.?f1C:TAffineVectorList
 0049F513    mov         eax,dword ptr [eax+8];TAffineVectorList.?f8:dword
 0049F516    dec         eax
 0049F517    test        eax,eax
>0049F519    jl          0049F55E
 0049F51B    inc         eax
 0049F51C    mov         dword ptr [ebp-40],eax
 0049F51F    xor         ebx,ebx
 0049F521    lea         ecx,[ebp-80]
 0049F524    mov         eax,dword ptr [ebp-14]
 0049F527    mov         eax,dword ptr [eax+1C];TMeshObject.?f1C:TAffineVectorList
 0049F52A    mov         edx,ebx
 0049F52C    call        00468C18
 0049F531    push        dword ptr [ebp-80]
 0049F534    lea         ecx,[ebp-8C]
 0049F53A    mov         eax,dword ptr [ebp-14]
 0049F53D    mov         eax,dword ptr [eax+1C];TMeshObject.?f1C:TAffineVectorList
 0049F540    mov         edx,ebx
 0049F542    call        00468C18
 0049F547    push        dword ptr [ebp-88]
 0049F54D    mov         eax,dword ptr [ebp-14]
 0049F550    mov         eax,dword ptr [eax+20];TMeshObject.?f20:TTexPointList
 0049F553    call        004690DC
 0049F558    inc         ebx
 0049F559    dec         dword ptr [ebp-40]
>0049F55C    jne         0049F521
 0049F55E    inc         dword ptr [ebp-24]
 0049F561    dec         dword ptr [ebp-3C]
>0049F564    jne         0049EE8A
 0049F56A    xor         eax,eax
 0049F56C    pop         edx
 0049F56D    pop         ecx
 0049F56E    pop         ecx
 0049F56F    mov         dword ptr fs:[eax],edx
 0049F572    push        49F587
 0049F577    mov         eax,dword ptr [ebp-38]
 0049F57A    call        TObject.Free
 0049F57F    ret
>0049F580    jmp         @HandleFinally
>0049F585    jmp         0049F577
 0049F587    xor         eax,eax
 0049F589    pop         edx
 0049F58A    pop         ecx
 0049F58B    pop         ecx
 0049F58C    mov         dword ptr fs:[eax],edx
 0049F58F    push        49F5A7
 0049F594    lea         eax,[ebp-90]
 0049F59A    call        @LStrClr
 0049F59F    ret
>0049F5A0    jmp         @HandleFinally
>0049F5A5    jmp         0049F594
 0049F5A7    pop         edi
 0049F5A8    pop         esi
 0049F5A9    pop         ebx
 0049F5AA    mov         esp,ebp
 0049F5AC    pop         ebp
 0049F5AD    ret
end;*}

Initialization
//0049F644
{*
 0049F644    sub         dword ptr ds:[5E158C],1
>0049F64B    jae         0049F677
 0049F64D    mov         ecx,dword ptr ds:[49E7B8];TGL3DSVectorFile
 0049F653    mov         edx,49F680;'3D Studio files'
 0049F658    mov         eax,49F698;'3ds'
 0049F65D    call        0048EB2C
 0049F662    mov         ecx,dword ptr ds:[49E7B8];TGL3DSVectorFile
 0049F668    mov         edx,49F6A4;'3D Studio project files'
 0049F66D    mov         eax,49F6C4;'prj'
 0049F672    call        0048EB2C
 0049F677    ret
*}
Finalization
end.