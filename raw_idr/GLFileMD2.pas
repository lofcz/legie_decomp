//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit GLFileMD2;

interface

uses
  SysUtils, Classes;

type
  TGLMD2VectorFile = class(TVectorFile)
  public
    //function v10:?; virtual;//v10//00496C34
    //procedure sub_00496C40(?:?); dynamic;//00496C40
  end;
    //function sub_00496C34:?;//00496C34
    //procedure sub_00496C40(?:?);//00496C40

implementation

//00496C34
{*function sub_00496C34:?;
begin
 00496C34    mov         al,[00496C3C];0x1 gvar_00496C3C
 00496C39    ret
end;*}

//00496C40
{*procedure TGLMD2VectorFile.sub_00496C40(?:?);
begin
 00496C40    push        ebp
 00496C41    mov         ebp,esp
 00496C43    add         esp,0FFFFFFDC
 00496C46    push        ebx
 00496C47    push        esi
 00496C48    push        edi
 00496C49    xor         ecx,ecx
 00496C4B    mov         dword ptr [ebp-24],ecx
 00496C4E    mov         dword ptr [ebp-20],ecx
 00496C51    mov         ebx,edx
 00496C53    mov         dword ptr [ebp-4],eax
 00496C56    xor         eax,eax
 00496C58    push        ebp
 00496C59    push        496F31
 00496C5E    push        dword ptr fs:[eax]
 00496C61    mov         dword ptr fs:[eax],esp
 00496C64    mov         dl,1
 00496C66    mov         eax,[0049667C];TFileMD2
 00496C6B    call        TFileMD2.Create;TFileMD2.Create
 00496C70    mov         dword ptr [ebp-8],eax
 00496C73    mov         edx,ebx
 00496C75    mov         eax,dword ptr [ebp-8]
 00496C78    call        004967B8
 00496C7D    xor         eax,eax
 00496C7F    push        ebp
 00496C80    push        496F0F
 00496C85    push        dword ptr fs:[eax]
 00496C88    mov         dword ptr fs:[eax],esp
 00496C8B    mov         eax,dword ptr [ebp-4]
 00496C8E    call        00494320
 00496C93    mov         ecx,dword ptr [eax+0C8]
 00496C99    mov         dl,1
 00496C9B    mov         eax,[0048D448];TMorphableMeshObject
 00496CA0    call        TMeshObject.Create;TMorphableMeshObject.Create
 00496CA5    mov         dword ptr [ebp-0C],eax
 00496CA8    mov         eax,dword ptr [ebp-0C]
 00496CAB    mov         byte ptr [eax+2C],2;TMorphableMeshObject.?f2C:byte
 00496CAF    mov         eax,dword ptr [ebp-0C]
 00496CB2    mov         ecx,dword ptr [eax+28];TMorphableMeshObject.?f28:TFaceGroups
 00496CB5    mov         dl,1
 00496CB7    mov         eax,[0048D8A4];TFGIndexTexCoordList
 00496CBC    call        TFGVertexIndexList.Create;TFGIndexTexCoordList.Create
 00496CC1    mov         dword ptr [ebp-10],eax
 00496CC4    mov         eax,dword ptr [ebp-10]
 00496CC7    add         eax,0C;TFGIndexTexCoordList.?fC:String
 00496CCA    call        @LStrClr
 00496CCF    mov         eax,dword ptr [ebp-8]
 00496CD2    mov         edx,dword ptr [eax+0C];TFileMD2.?fC:dword
 00496CD5    lea         edx,[edx+edx*2]
 00496CD8    mov         eax,dword ptr [ebp-10]
 00496CDB    mov         eax,dword ptr [eax+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00496CDE    mov         ecx,dword ptr [eax]
 00496CE0    call        dword ptr [ecx+1C];TIntegerList.sub_00469270
 00496CE3    mov         eax,dword ptr [ebp-8]
 00496CE6    mov         edx,dword ptr [eax+0C];TFileMD2.?fC:dword
 00496CE9    lea         edx,[edx+edx*2]
 00496CEC    mov         eax,dword ptr [ebp-10]
 00496CEF    mov         eax,dword ptr [eax+24];TFGIndexTexCoordList.?f24:TAffineVectorList
 00496CF2    mov         ecx,dword ptr [eax]
 00496CF4    call        dword ptr [ecx+1C];TAffineVectorList.sub_00468CBC
 00496CF7    mov         eax,dword ptr [ebp-8]
 00496CFA    mov         eax,dword ptr [eax+0C];TFileMD2.?fC:dword
 00496CFD    dec         eax
 00496CFE    test        eax,eax
>00496D00    jl          00496D67
 00496D02    inc         eax
 00496D03    mov         dword ptr [ebp-18],eax
 00496D06    xor         ebx,ebx
 00496D08    lea         eax,[ebx+ebx*8]
 00496D0B    mov         edx,dword ptr [ebp-8]
 00496D0E    mov         edx,dword ptr [edx+10];TFileMD2.?f10:dword
 00496D11    lea         esi,[edx+eax*4]
 00496D14    push        dword ptr [esi+0C]
 00496D17    fld         dword ptr [esi+10]
 00496D1A    fchs
 00496D1C    add         esp,0FFFFFFFC
 00496D1F    fstp        dword ptr [esp]
 00496D22    wait
 00496D23    mov         edx,dword ptr [esi]
 00496D25    mov         eax,dword ptr [ebp-10]
 00496D28    call        004940C4
 00496D2D    push        dword ptr [esi+14]
 00496D30    fld         dword ptr [esi+18]
 00496D33    fchs
 00496D35    add         esp,0FFFFFFFC
 00496D38    fstp        dword ptr [esp]
 00496D3B    wait
 00496D3C    mov         edx,dword ptr [esi+4]
 00496D3F    mov         eax,dword ptr [ebp-10]
 00496D42    call        004940C4
 00496D47    push        dword ptr [esi+1C]
 00496D4A    fld         dword ptr [esi+20]
 00496D4D    fchs
 00496D4F    add         esp,0FFFFFFFC
 00496D52    fstp        dword ptr [esp]
 00496D55    wait
 00496D56    mov         edx,dword ptr [esi+8]
 00496D59    mov         eax,dword ptr [ebp-10]
 00496D5C    call        004940C4
 00496D61    inc         ebx
 00496D62    dec         dword ptr [ebp-18]
>00496D65    jne         00496D08
 00496D67    mov         eax,dword ptr [ebp-8]
 00496D6A    mov         eax,dword ptr [eax+4];TFileMD2.?f4:dword
 00496D6D    dec         eax
 00496D6E    test        eax,eax
>00496D70    jl          00496E07
 00496D76    inc         eax
 00496D77    mov         dword ptr [ebp-18],eax
 00496D7A    xor         ebx,ebx
 00496D7C    mov         eax,dword ptr [ebp-0C]
 00496D7F    mov         ecx,dword ptr [eax+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 00496D82    mov         dl,1
 00496D84    mov         eax,[0048D2B8];TMeshMorphTarget
 00496D89    call        TMeshMorphTarget.Create;TMeshMorphTarget.Create
 00496D8E    mov         dword ptr [ebp-14],eax
 00496D91    lea         edx,[ebp-20]
 00496D94    mov         eax,ebx
 00496D96    call        IntToStr
 00496D9B    mov         ecx,dword ptr [ebp-20]
 00496D9E    mov         eax,dword ptr [ebp-14]
 00496DA1    add         eax,8;TMeshMorphTarget.?f8:String
 00496DA4    mov         edx,496F48;'Frame'
 00496DA9    call        @LStrCat3
 00496DAE    mov         eax,dword ptr [ebp-8]
 00496DB1    mov         edx,dword ptr [eax+8];TFileMD2.?f8:dword
 00496DB4    mov         eax,dword ptr [ebp-14]
 00496DB7    mov         eax,dword ptr [eax+0C];TMeshMorphTarget.?fC:TAffineVectorList
 00496DBA    mov         ecx,dword ptr [eax]
 00496DBC    call        dword ptr [ecx+1C];TAffineVectorList.sub_00468CBC
 00496DBF    mov         eax,dword ptr [ebp-8]
 00496DC2    mov         edi,dword ptr [eax+8];TFileMD2.?f8:dword
 00496DC5    dec         edi
 00496DC6    test        edi,edi
>00496DC8    jl          00496DEB
 00496DCA    inc         edi
 00496DCB    xor         esi,esi
 00496DCD    mov         eax,dword ptr [ebp-8]
 00496DD0    mov         eax,dword ptr [eax+14];TFileMD2.?f14:dword
 00496DD3    mov         eax,dword ptr [eax+ebx*4]
 00496DD6    lea         edx,[esi+esi*2]
 00496DD9    lea         edx,[eax+edx*4]
 00496DDC    mov         eax,dword ptr [ebp-14]
 00496DDF    mov         eax,dword ptr [eax+0C];TMeshMorphTarget.?fC:TAffineVectorList
 00496DE2    call        00468A90
 00496DE7    inc         esi
 00496DE8    dec         edi
>00496DE9    jne         00496DCD
 00496DEB    push        0
 00496DED    mov         eax,dword ptr [ebp-10]
 00496DF0    mov         edx,dword ptr [eax+1C];TFGIndexTexCoordList.?f1C:TIntegerList
 00496DF3    xor         ecx,ecx
 00496DF5    mov         eax,dword ptr [ebp-14]
 00496DF8    call        0048EFF8
 00496DFD    inc         ebx
 00496DFE    dec         dword ptr [ebp-18]
>00496E01    jne         00496D7C
 00496E07    mov         eax,dword ptr [ebp-4]
 00496E0A    mov         si,0FFFF
 00496E0E    call        @CallDynaInst;TDataFile.sub_0041ADA4
 00496E13    mov         edx,dword ptr ds:[48E564];TGLActor
 00496E19    call        @IsClass
 00496E1E    test        al,al
>00496E20    je          00496EE3
 00496E26    mov         eax,dword ptr [ebp-4]
 00496E29    mov         si,0FFFF
 00496E2D    call        @CallDynaInst;TDataFile.sub_0041ADA4
 00496E32    mov         eax,dword ptr [eax+108]
 00496E38    mov         dword ptr [ebp-1C],eax
 00496E3B    mov         eax,dword ptr [ebp-1C]
 00496E3E    call        TCollection.Clear
 00496E43    mov         eax,dword ptr [ebp-8]
 00496E46    mov         eax,dword ptr [eax+18];TFileMD2.?f18:TStringList
 00496E49    mov         edx,dword ptr [eax]
 00496E4B    call        dword ptr [edx+14];TStringList.sub_0041C750
 00496E4E    dec         eax
 00496E4F    test        eax,eax
>00496E51    jl          00496EE3
 00496E57    inc         eax
 00496E58    mov         dword ptr [ebp-18],eax
 00496E5B    xor         ebx,ebx
 00496E5D    mov         eax,dword ptr [ebp-1C]
 00496E60    call        00495648
 00496E65    mov         esi,eax
 00496E67    lea         ecx,[ebp-24]
 00496E6A    mov         eax,dword ptr [ebp-8]
 00496E6D    mov         eax,dword ptr [eax+18];TFileMD2.?f18:TStringList
 00496E70    mov         edx,ebx
 00496E72    mov         edi,dword ptr [eax]
 00496E74    call        dword ptr [edi+0C];TStringList.Get
 00496E77    mov         edx,dword ptr [ebp-24]
 00496E7A    lea         eax,[esi+0C]
 00496E7D    call        @LStrAsg
 00496E82    xor         edx,edx
 00496E84    mov         eax,esi
 00496E86    call        TActorAnimation.SetReference
 00496E8B    mov         eax,dword ptr [ebp-8]
 00496E8E    mov         eax,dword ptr [eax+18];TFileMD2.?f18:TStringList
 00496E91    mov         edx,ebx
 00496E93    mov         ecx,dword ptr [eax]
 00496E95    call        dword ptr [ecx+18];TStringList.GetObject
 00496E98    mov         edx,eax
 00496E9A    mov         eax,esi
 00496E9C    call        TActorAnimation.SetStartFrame
 00496EA1    mov         eax,dword ptr [ebp-8]
 00496EA4    mov         eax,dword ptr [eax+18];TFileMD2.?f18:TStringList
 00496EA7    mov         edx,dword ptr [eax]
 00496EA9    call        dword ptr [edx+14];TStringList.sub_0041C750
 00496EAC    dec         eax
 00496EAD    cmp         ebx,eax
>00496EAF    jge         00496ECB
 00496EB1    lea         edx,[ebx+1]
 00496EB4    mov         eax,dword ptr [ebp-8]
 00496EB7    mov         eax,dword ptr [eax+18];TFileMD2.?f18:TStringList
 00496EBA    mov         ecx,dword ptr [eax]
 00496EBC    call        dword ptr [ecx+18];TStringList.GetObject
 00496EBF    mov         edx,eax
 00496EC1    dec         edx
 00496EC2    mov         eax,esi
 00496EC4    call        TActorAnimation.SetEndFrame
>00496EC9    jmp         00496ED9
 00496ECB    mov         eax,dword ptr [ebp-8]
 00496ECE    mov         edx,dword ptr [eax+4];TFileMD2.?f4:dword
 00496ED1    dec         edx
 00496ED2    mov         eax,esi
 00496ED4    call        TActorAnimation.SetEndFrame
 00496ED9    inc         ebx
 00496EDA    dec         dword ptr [ebp-18]
>00496EDD    jne         00496E5D
 00496EE3    mov         eax,dword ptr [ebp-0C]
 00496EE6    mov         eax,dword ptr [eax+44];TMorphableMeshObject.?f44:TMeshMorphTargetList
 00496EE9    cmp         dword ptr [eax+0C],0;TMeshMorphTargetList.?fC:dword
>00496EED    jle         00496EF9
 00496EEF    xor         edx,edx
 00496EF1    mov         eax,dword ptr [ebp-0C]
 00496EF4    call        00492680
 00496EF9    xor         eax,eax
 00496EFB    pop         edx
 00496EFC    pop         ecx
 00496EFD    pop         ecx
 00496EFE    mov         dword ptr fs:[eax],edx
 00496F01    push        496F16
 00496F06    mov         eax,dword ptr [ebp-8]
 00496F09    call        TObject.Free
 00496F0E    ret
>00496F0F    jmp         @HandleFinally
>00496F14    jmp         00496F06
 00496F16    xor         eax,eax
 00496F18    pop         edx
 00496F19    pop         ecx
 00496F1A    pop         ecx
 00496F1B    mov         dword ptr fs:[eax],edx
 00496F1E    push        496F38
 00496F23    lea         eax,[ebp-24]
 00496F26    mov         edx,2
 00496F2B    call        @LStrArrayClr
 00496F30    ret
>00496F31    jmp         @HandleFinally
>00496F36    jmp         00496F23
 00496F38    pop         edi
 00496F39    pop         esi
 00496F3A    pop         ebx
 00496F3B    mov         esp,ebp
 00496F3D    pop         ebp
 00496F3E    ret
end;*}

Initialization
//00496F80
{*
 00496F80    sub         dword ptr ds:[5E1578],1
>00496F87    jae         00496F9E
 00496F89    mov         ecx,dword ptr ds:[496B88];TGLMD2VectorFile
 00496F8F    mov         edx,496FA8;'Quake II model files'
 00496F94    mov         eax,496FC8;'md2'
 00496F99    call        0048EB2C
 00496F9E    ret
*}
Finalization
end.