//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit114;

interface

uses
  SysUtils, Classes;

    //procedure sub_004B96AC(?:?; ?:?; ?:?; ?:?);//004B96AC
    procedure sub_004B97BC;//004B97BC
    procedure sub_004B9934;//004B9934
    procedure sub_004BAC40;//004BAC40

implementation

//004B96AC
{*procedure sub_004B96AC(?:?; ?:?; ?:?; ?:?);
begin
 004B96AC    push        ebp
 004B96AD    mov         ebp,esp
 004B96AF    push        ecx
 004B96B0    push        ebx
 004B96B1    push        esi
 004B96B2    mov         esi,ecx
 004B96B4    mov         byte ptr [ebp-1],dl
 004B96B7    mov         ebx,eax
 004B96B9    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B96BE    mov         eax,dword ptr [eax]
 004B96C0    mov         eax,dword ptr [eax+31C]
 004B96C6    mov         eax,dword ptr [eax+34]
 004B96C9    mov         edx,4B97B4;'fade'
 004B96CE    call        004776DC
 004B96D3    mov         dl,byte ptr [ebp-1]
 004B96D6    sub         dl,1
>004B96D9    jb          004B96E3
>004B96DB    je          004B96FE
 004B96DD    dec         dl
>004B96DF    je          004B971C
>004B96E1    jmp         004B973E
 004B96E3    push        0
 004B96E5    push        0
 004B96E7    push        0
 004B96E9    push        3F800000
 004B96EE    mov         eax,dword ptr [eax+18]
 004B96F1    mov         eax,dword ptr [eax+18]
 004B96F4    mov         eax,dword ptr [eax+1C]
 004B96F7    call        00472C84
>004B96FC    jmp         004B973E
 004B96FE    push        3E19999A
 004B9703    push        0
 004B9705    push        0
 004B9707    push        3F800000
 004B970C    mov         eax,dword ptr [eax+18]
 004B970F    mov         eax,dword ptr [eax+18]
 004B9712    mov         eax,dword ptr [eax+1C]
 004B9715    call        00472C84
>004B971A    jmp         004B973E
 004B971C    push        3F800000
 004B9721    push        3F800000
 004B9726    push        3F800000
 004B972B    push        3F800000
 004B9730    mov         eax,dword ptr [eax+18]
 004B9733    mov         eax,dword ptr [eax+18]
 004B9736    mov         eax,dword ptr [eax+1C]
 004B9739    call        00472C84
 004B973E    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9743    mov         byte ptr [eax],bl
 004B9745    mov         eax,[005AE5C4];^gvar_005F5D38
 004B974A    mov         edx,dword ptr [ebp+8]
 004B974D    mov         dword ptr [eax+8],edx
 004B9750    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9755    mov         word ptr [eax+0C],si
 004B9759    sub         bl,0FF
>004B975C    je          004B9780
 004B975E    dec         bl
>004B9760    je          004B9768
 004B9762    dec         bl
>004B9764    je          004B9774
>004B9766    jmp         004B97A3
 004B9768    mov         eax,[005AE5C4];^gvar_005F5D38
 004B976D    xor         edx,edx
 004B976F    mov         dword ptr [eax+4],edx
>004B9772    jmp         004B97A3
 004B9774    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9779    xor         edx,edx
 004B977B    mov         dword ptr [eax+4],edx
>004B977E    jmp         004B97A3
 004B9780    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9785    mov         dword ptr [eax+4],3F800000
 004B978C    cmp         byte ptr [ebp-1],1
>004B9790    jne         004B979E
 004B9792    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9797    mov         dword ptr [eax+4],3F333333
 004B979E    call        004B97BC
 004B97A3    pop         esi
 004B97A4    pop         ebx
 004B97A5    pop         ecx
 004B97A6    pop         ebp
 004B97A7    ret         4
end;*}

//004B97BC
procedure sub_004B97BC;
begin
{*
 004B97BC    mov         eax,[005AE5C4];^gvar_005F5D38
 004B97C1    cmp         byte ptr [eax],0
>004B97C4    je          004B991A
 004B97CA    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B97CF    mov         eax,dword ptr [eax]
 004B97D1    mov         eax,dword ptr [eax+31C]
 004B97D7    mov         eax,dword ptr [eax+34]
 004B97DA    mov         edx,4B9924;'fade'
 004B97DF    call        004776DC
 004B97E4    mov         edx,dword ptr ds:[5AE5C4];^gvar_005F5D38
 004B97EA    push        dword ptr [edx+4]
 004B97ED    mov         eax,dword ptr [eax+18]
 004B97F0    mov         eax,dword ptr [eax+18]
 004B97F3    mov         eax,dword ptr [eax+1C]
 004B97F6    mov         edx,3
 004B97FB    call        TGLColor.SetRed
 004B9800    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9805    mov         al,byte ptr [eax]
 004B9807    sub         al,0FF
>004B9809    je          004B989E
 004B980F    sub         al,2
>004B9811    jne         004B991A
 004B9817    mov         eax,[005AE178];^gvar_005F5574
 004B981C    cmp         byte ptr [eax],0
>004B981F    je          004B982F
 004B9821    mov         eax,[005AE784];^gvar_005F555A
 004B9826    cmp         byte ptr [eax],1
>004B9829    je          004B991A
 004B982F    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B9834    mov         eax,dword ptr [eax]
 004B9836    mov         eax,dword ptr [eax+368]
 004B983C    mov         dl,1
 004B983E    mov         ecx,dword ptr [eax]
 004B9840    call        dword ptr [ecx+3C]
 004B9843    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9848    fld         dword ptr [eax+4]
 004B984B    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9850    fadd        dword ptr [eax+8]
 004B9853    fcomp       dword ptr ds:[4B992C];1:Single
 004B9859    fnstsw      al
 004B985B    sahf
>004B985C    jae         004B987C
 004B985E    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9863    fld         dword ptr [eax+4]
 004B9866    mov         eax,[005AE5C4];^gvar_005F5D38
 004B986B    fadd        dword ptr [eax+8]
 004B986E    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9873    fstp        dword ptr [eax+4]
 004B9876    wait
>004B9877    jmp         004B991A
 004B987C    mov         eax,[005AE5C4];^gvar_005F5D38
 004B9881    mov         dword ptr [eax+4],3F800000
 004B9888    mov         eax,[005AE5C4];^gvar_005F5D38
 004B988D    mov         byte ptr [eax],0
 004B9890    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B9895    mov         eax,dword ptr [eax]
 004B9897    call        005AA308
>004B989C    jmp         004B991A
 004B989E    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B98A3    mov         eax,dword ptr [eax]
 004B98A5    mov         eax,dword ptr [eax+368]
 004B98AB    mov         dl,1
 004B98AD    mov         ecx,dword ptr [eax]
 004B98AF    call        dword ptr [ecx+3C]
 004B98B2    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98B7    fld         dword ptr [eax+4]
 004B98BA    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98BF    fsub        dword ptr [eax+8]
 004B98C2    fcomp       dword ptr ds:[4B9930];0:Single
 004B98C8    fnstsw      al
 004B98CA    sahf
>004B98CB    jbe         004B98E8
 004B98CD    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98D2    fld         dword ptr [eax+4]
 004B98D5    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98DA    fsub        dword ptr [eax+8]
 004B98DD    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98E2    fstp        dword ptr [eax+4]
 004B98E5    wait
>004B98E6    jmp         004B991A
 004B98E8    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98ED    xor         edx,edx
 004B98EF    mov         dword ptr [eax+4],edx
 004B98F2    mov         eax,[005AE5C4];^gvar_005F5D38
 004B98F7    mov         byte ptr [eax],0
 004B98FA    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B98FF    mov         eax,dword ptr [eax]
 004B9901    mov         eax,dword ptr [eax+368]
 004B9907    xor         edx,edx
 004B9909    mov         ecx,dword ptr [eax]
 004B990B    call        dword ptr [ecx+3C]
 004B990E    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B9913    mov         eax,dword ptr [eax]
 004B9915    call        005AA308
 004B991A    ret
*}
end;

//004B9934
procedure sub_004B9934;
begin
{*
 004B9934    push        ebp
 004B9935    mov         ebp,esp
 004B9937    xor         ecx,ecx
 004B9939    push        ecx
 004B993A    push        ecx
 004B993B    push        ecx
 004B993C    push        ecx
 004B993D    push        ecx
 004B993E    push        ebx
 004B993F    push        esi
 004B9940    push        edi
 004B9941    mov         ebx,dword ptr ds:[5AE734];^gvar_005F5524:TForm1
 004B9947    mov         edi,dword ptr ds:[5AE5F0];^gvar_00607DF0:TGLActor
 004B994D    xor         eax,eax
 004B994F    push        ebp
 004B9950    push        4BA9B4
 004B9955    push        dword ptr fs:[eax]
 004B9958    mov         dword ptr fs:[eax],esp
 004B995B    mov         eax,dword ptr [ebx]
 004B995D    mov         ecx,dword ptr [eax+304]
 004B9963    mov         dl,1
 004B9965    mov         eax,[0048E564];TGLActor
 004B996A    call        TGLActor.Create;TGLActor.Create
 004B996F    mov         edx,dword ptr ds:[5AE65C];^gvar_00607DE8:TGLActor
 004B9975    mov         dword ptr [edx],eax
 004B9977    mov         edx,dword ptr ds:[5AE65C];^gvar_00607DE8:TGLActor
 004B997D    mov         edx,dword ptr [edx]
 004B997F    mov         eax,dword ptr [ebx]
 004B9981    mov         eax,dword ptr [eax+304]
 004B9987    mov         si,0FFEC
 004B998B    call        @CallDynaInst
 004B9990    mov         eax,[005AE65C];^gvar_00607DE8:TGLActor
 004B9995    mov         eax,dword ptr [eax]
 004B9997    mov         edx,4BA9CC;'opilec'
 004B999C    mov         ecx,dword ptr [eax]
 004B999E    call        dword ptr [ecx+18]
 004B99A1    mov         eax,dword ptr [ebx]
 004B99A3    mov         edx,dword ptr [eax+314]
 004B99A9    mov         eax,[005AE65C];^gvar_00607DE8:TGLActor
 004B99AE    mov         eax,dword ptr [eax]
 004B99B0    mov         eax,dword ptr [eax+90]
 004B99B6    call        TGLMaterial.SetMaterialLibrary
 004B99BB    mov         eax,dword ptr [ebx]
 004B99BD    mov         ecx,dword ptr [eax+304]
 004B99C3    mov         dl,1
 004B99C5    mov         eax,[0048E564];TGLActor
 004B99CA    call        TGLActor.Create;TGLActor.Create
 004B99CF    mov         edx,dword ptr ds:[5AE4FC];^gvar_00607DEC:TGLActor
 004B99D5    mov         dword ptr [edx],eax
 004B99D7    mov         edx,dword ptr ds:[5AE4FC];^gvar_00607DEC:TGLActor
 004B99DD    mov         edx,dword ptr [edx]
 004B99DF    mov         eax,dword ptr [ebx]
 004B99E1    mov         eax,dword ptr [eax+304]
 004B99E7    mov         si,0FFEC
 004B99EB    call        @CallDynaInst
 004B99F0    mov         eax,[005AE4FC];^gvar_00607DEC:TGLActor
 004B99F5    mov         eax,dword ptr [eax]
 004B99F7    mov         edx,4BA9DC;'opilec2'
 004B99FC    mov         ecx,dword ptr [eax]
 004B99FE    call        dword ptr [ecx+18]
 004B9A01    mov         eax,dword ptr [ebx]
 004B9A03    mov         edx,dword ptr [eax+314]
 004B9A09    mov         eax,[005AE4FC];^gvar_00607DEC:TGLActor
 004B9A0E    mov         eax,dword ptr [eax]
 004B9A10    mov         eax,dword ptr [eax+90]
 004B9A16    call        TGLMaterial.SetMaterialLibrary
 004B9A1B    mov         eax,dword ptr [ebx]
 004B9A1D    mov         ecx,dword ptr [eax+304]
 004B9A23    mov         dl,1
 004B9A25    mov         eax,[0048E564];TGLActor
 004B9A2A    call        TGLActor.Create;TGLActor.Create
 004B9A2F    mov         dword ptr [edi],eax
 004B9A31    mov         edx,dword ptr [edi]
 004B9A33    mov         eax,dword ptr [ebx]
 004B9A35    mov         eax,dword ptr [eax+308]
 004B9A3B    mov         si,0FFEC
 004B9A3F    call        @CallDynaInst
 004B9A44    mov         eax,dword ptr [edi]
 004B9A46    mov         edx,4BA9EC;'hrdina'
 004B9A4B    mov         ecx,dword ptr [eax]
 004B9A4D    call        dword ptr [ecx+18]
 004B9A50    mov         eax,dword ptr [ebx]
 004B9A52    mov         edx,dword ptr [eax+314]
 004B9A58    mov         eax,dword ptr [edi]
 004B9A5A    mov         eax,dword ptr [eax+90]
 004B9A60    call        TGLMaterial.SetMaterialLibrary
 004B9A65    push        3F800000
 004B9A6A    mov         eax,dword ptr [edi]
 004B9A6C    mov         eax,dword ptr [eax+4C]
 004B9A6F    mov         edx,1
 004B9A74    call        TGLCoordinates.SetX
 004B9A79    push        0
 004B9A7B    mov         eax,dword ptr [edi]
 004B9A7D    mov         eax,dword ptr [eax+4C]
 004B9A80    xor         edx,edx
 004B9A82    call        TGLCoordinates.SetX
 004B9A87    push        0
 004B9A89    mov         eax,dword ptr [edi]
 004B9A8B    mov         eax,dword ptr [eax+4C]
 004B9A8E    mov         edx,2
 004B9A93    call        TGLCoordinates.SetX
 004B9A98    push        0
 004B9A9A    mov         eax,dword ptr [edi]
 004B9A9C    mov         eax,dword ptr [eax+48]
 004B9A9F    xor         edx,edx
 004B9AA1    call        TGLCoordinates.SetX
 004B9AA6    push        0
 004B9AA8    mov         eax,dword ptr [edi]
 004B9AAA    mov         eax,dword ptr [eax+48]
 004B9AAD    mov         edx,1
 004B9AB2    call        TGLCoordinates.SetX
 004B9AB7    push        0BF800000
 004B9ABC    mov         eax,dword ptr [edi]
 004B9ABE    mov         eax,dword ptr [eax+48]
 004B9AC1    mov         edx,2
 004B9AC6    call        TGLCoordinates.SetX
 004B9ACB    mov         eax,dword ptr [ebx]
 004B9ACD    mov         ecx,dword ptr [eax+304]
 004B9AD3    mov         dl,1
 004B9AD5    mov         eax,[0048E564];TGLActor
 004B9ADA    call        TGLActor.Create;TGLActor.Create
 004B9ADF    mov         edx,dword ptr ds:[5AE5E4];^gvar_00607E3C:TGLActor
 004B9AE5    mov         dword ptr [edx],eax
 004B9AE7    mov         edx,dword ptr ds:[5AE5E4];^gvar_00607E3C:TGLActor
 004B9AED    mov         edx,dword ptr [edx]
 004B9AEF    mov         eax,dword ptr [ebx]
 004B9AF1    mov         eax,dword ptr [eax+308]
 004B9AF7    mov         si,0FFEC
 004B9AFB    call        @CallDynaInst
 004B9B00    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B05    mov         eax,dword ptr [eax]
 004B9B07    mov         edx,4BA9FC;'hrdina_zbroj'
 004B9B0C    mov         ecx,dword ptr [eax]
 004B9B0E    call        dword ptr [ecx+18]
 004B9B11    mov         eax,dword ptr [ebx]
 004B9B13    mov         edx,dword ptr [eax+314]
 004B9B19    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B1E    mov         eax,dword ptr [eax]
 004B9B20    mov         eax,dword ptr [eax+90]
 004B9B26    call        TGLMaterial.SetMaterialLibrary
 004B9B2B    push        3F800000
 004B9B30    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B35    mov         eax,dword ptr [eax]
 004B9B37    mov         eax,dword ptr [eax+4C]
 004B9B3A    mov         edx,1
 004B9B3F    call        TGLCoordinates.SetX
 004B9B44    push        0
 004B9B46    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B4B    mov         eax,dword ptr [eax]
 004B9B4D    mov         eax,dword ptr [eax+4C]
 004B9B50    xor         edx,edx
 004B9B52    call        TGLCoordinates.SetX
 004B9B57    push        0
 004B9B59    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B5E    mov         eax,dword ptr [eax]
 004B9B60    mov         eax,dword ptr [eax+4C]
 004B9B63    mov         edx,2
 004B9B68    call        TGLCoordinates.SetX
 004B9B6D    push        0
 004B9B6F    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B74    mov         eax,dword ptr [eax]
 004B9B76    mov         eax,dword ptr [eax+48]
 004B9B79    xor         edx,edx
 004B9B7B    call        TGLCoordinates.SetX
 004B9B80    push        0
 004B9B82    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9B87    mov         eax,dword ptr [eax]
 004B9B89    mov         eax,dword ptr [eax+48]
 004B9B8C    mov         edx,1
 004B9B91    call        TGLCoordinates.SetX
 004B9B96    push        0BF800000
 004B9B9B    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004B9BA0    mov         eax,dword ptr [eax]
 004B9BA2    mov         eax,dword ptr [eax+48]
 004B9BA5    mov         edx,2
 004B9BAA    call        TGLCoordinates.SetX
 004B9BAF    mov         eax,dword ptr [ebx]
 004B9BB1    mov         ecx,dword ptr [eax+304]
 004B9BB7    mov         dl,1
 004B9BB9    mov         eax,[0048E564];TGLActor
 004B9BBE    call        TGLActor.Create;TGLActor.Create
 004B9BC3    mov         edx,dword ptr ds:[5AE7CC];^gvar_00607E34:TGLActor
 004B9BC9    mov         dword ptr [edx],eax
 004B9BCB    mov         edx,dword ptr ds:[5AE7CC];^gvar_00607E34:TGLActor
 004B9BD1    mov         edx,dword ptr [edx]
 004B9BD3    mov         eax,dword ptr [ebx]
 004B9BD5    mov         eax,dword ptr [eax+308]
 004B9BDB    mov         si,0FFEC
 004B9BDF    call        @CallDynaInst
 004B9BE4    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9BE9    mov         eax,dword ptr [eax]
 004B9BEB    mov         edx,4BAA14;'hrdina_prilba'
 004B9BF0    mov         ecx,dword ptr [eax]
 004B9BF2    call        dword ptr [ecx+18]
 004B9BF5    mov         eax,dword ptr [ebx]
 004B9BF7    mov         edx,dword ptr [eax+314]
 004B9BFD    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C02    mov         eax,dword ptr [eax]
 004B9C04    mov         eax,dword ptr [eax+90]
 004B9C0A    call        TGLMaterial.SetMaterialLibrary
 004B9C0F    push        3F800000
 004B9C14    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C19    mov         eax,dword ptr [eax]
 004B9C1B    mov         eax,dword ptr [eax+4C]
 004B9C1E    mov         edx,1
 004B9C23    call        TGLCoordinates.SetX
 004B9C28    push        0
 004B9C2A    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C2F    mov         eax,dword ptr [eax]
 004B9C31    mov         eax,dword ptr [eax+4C]
 004B9C34    xor         edx,edx
 004B9C36    call        TGLCoordinates.SetX
 004B9C3B    push        0
 004B9C3D    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C42    mov         eax,dword ptr [eax]
 004B9C44    mov         eax,dword ptr [eax+4C]
 004B9C47    mov         edx,2
 004B9C4C    call        TGLCoordinates.SetX
 004B9C51    push        0
 004B9C53    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C58    mov         eax,dword ptr [eax]
 004B9C5A    mov         eax,dword ptr [eax+48]
 004B9C5D    xor         edx,edx
 004B9C5F    call        TGLCoordinates.SetX
 004B9C64    push        0
 004B9C66    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C6B    mov         eax,dword ptr [eax]
 004B9C6D    mov         eax,dword ptr [eax+48]
 004B9C70    mov         edx,1
 004B9C75    call        TGLCoordinates.SetX
 004B9C7A    push        0BF800000
 004B9C7F    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004B9C84    mov         eax,dword ptr [eax]
 004B9C86    mov         eax,dword ptr [eax+48]
 004B9C89    mov         edx,2
 004B9C8E    call        TGLCoordinates.SetX
 004B9C93    mov         eax,dword ptr [ebx]
 004B9C95    mov         ecx,dword ptr [eax+304]
 004B9C9B    mov         dl,1
 004B9C9D    mov         eax,[0048E564];TGLActor
 004B9CA2    call        TGLActor.Create;TGLActor.Create
 004B9CA7    mov         edx,dword ptr ds:[5AE2D0];^gvar_00607E30:TGLActor
 004B9CAD    mov         dword ptr [edx],eax
 004B9CAF    mov         edx,dword ptr ds:[5AE2D0];^gvar_00607E30:TGLActor
 004B9CB5    mov         edx,dword ptr [edx]
 004B9CB7    mov         eax,dword ptr [ebx]
 004B9CB9    mov         eax,dword ptr [eax+308]
 004B9CBF    mov         si,0FFEC
 004B9CC3    call        @CallDynaInst
 004B9CC8    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9CCD    mov         eax,dword ptr [eax]
 004B9CCF    mov         edx,4BAA2C;'hrdina_kutna'
 004B9CD4    mov         ecx,dword ptr [eax]
 004B9CD6    call        dword ptr [ecx+18]
 004B9CD9    mov         eax,dword ptr [ebx]
 004B9CDB    mov         edx,dword ptr [eax+314]
 004B9CE1    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9CE6    mov         eax,dword ptr [eax]
 004B9CE8    mov         eax,dword ptr [eax+90]
 004B9CEE    call        TGLMaterial.SetMaterialLibrary
 004B9CF3    push        3F800000
 004B9CF8    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9CFD    mov         eax,dword ptr [eax]
 004B9CFF    mov         eax,dword ptr [eax+4C]
 004B9D02    mov         edx,1
 004B9D07    call        TGLCoordinates.SetX
 004B9D0C    push        0
 004B9D0E    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9D13    mov         eax,dword ptr [eax]
 004B9D15    mov         eax,dword ptr [eax+4C]
 004B9D18    xor         edx,edx
 004B9D1A    call        TGLCoordinates.SetX
 004B9D1F    push        0
 004B9D21    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9D26    mov         eax,dword ptr [eax]
 004B9D28    mov         eax,dword ptr [eax+4C]
 004B9D2B    mov         edx,2
 004B9D30    call        TGLCoordinates.SetX
 004B9D35    push        0
 004B9D37    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9D3C    mov         eax,dword ptr [eax]
 004B9D3E    mov         eax,dword ptr [eax+48]
 004B9D41    xor         edx,edx
 004B9D43    call        TGLCoordinates.SetX
 004B9D48    push        0
 004B9D4A    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9D4F    mov         eax,dword ptr [eax]
 004B9D51    mov         eax,dword ptr [eax+48]
 004B9D54    mov         edx,1
 004B9D59    call        TGLCoordinates.SetX
 004B9D5E    push        0BF800000
 004B9D63    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004B9D68    mov         eax,dword ptr [eax]
 004B9D6A    mov         eax,dword ptr [eax+48]
 004B9D6D    mov         edx,2
 004B9D72    call        TGLCoordinates.SetX
 004B9D77    mov         eax,dword ptr [ebx]
 004B9D79    mov         ecx,dword ptr [eax+304]
 004B9D7F    mov         dl,1
 004B9D81    mov         eax,[0048E564];TGLActor
 004B9D86    call        TGLActor.Create;TGLActor.Create
 004B9D8B    mov         edx,dword ptr ds:[5AE820];^gvar_00607E40:TGLActor
 004B9D91    mov         dword ptr [edx],eax
 004B9D93    mov         edx,dword ptr ds:[5AE820];^gvar_00607E40:TGLActor
 004B9D99    mov         edx,dword ptr [edx]
 004B9D9B    mov         eax,dword ptr [ebx]
 004B9D9D    mov         eax,dword ptr [eax+308]
 004B9DA3    mov         si,0FFEC
 004B9DA7    call        @CallDynaInst
 004B9DAC    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9DB1    mov         eax,dword ptr [eax]
 004B9DB3    mov         edx,4BAA44;'hrdina_rohy'
 004B9DB8    mov         ecx,dword ptr [eax]
 004B9DBA    call        dword ptr [ecx+18]
 004B9DBD    mov         eax,dword ptr [ebx]
 004B9DBF    mov         edx,dword ptr [eax+314]
 004B9DC5    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9DCA    mov         eax,dword ptr [eax]
 004B9DCC    mov         eax,dword ptr [eax+90]
 004B9DD2    call        TGLMaterial.SetMaterialLibrary
 004B9DD7    push        3F800000
 004B9DDC    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9DE1    mov         eax,dword ptr [eax]
 004B9DE3    mov         eax,dword ptr [eax+4C]
 004B9DE6    mov         edx,1
 004B9DEB    call        TGLCoordinates.SetX
 004B9DF0    push        0
 004B9DF2    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9DF7    mov         eax,dword ptr [eax]
 004B9DF9    mov         eax,dword ptr [eax+4C]
 004B9DFC    xor         edx,edx
 004B9DFE    call        TGLCoordinates.SetX
 004B9E03    push        0
 004B9E05    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9E0A    mov         eax,dword ptr [eax]
 004B9E0C    mov         eax,dword ptr [eax+4C]
 004B9E0F    mov         edx,2
 004B9E14    call        TGLCoordinates.SetX
 004B9E19    push        0
 004B9E1B    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9E20    mov         eax,dword ptr [eax]
 004B9E22    mov         eax,dword ptr [eax+48]
 004B9E25    xor         edx,edx
 004B9E27    call        TGLCoordinates.SetX
 004B9E2C    push        0
 004B9E2E    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9E33    mov         eax,dword ptr [eax]
 004B9E35    mov         eax,dword ptr [eax+48]
 004B9E38    mov         edx,1
 004B9E3D    call        TGLCoordinates.SetX
 004B9E42    push        0BF800000
 004B9E47    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004B9E4C    mov         eax,dword ptr [eax]
 004B9E4E    mov         eax,dword ptr [eax+48]
 004B9E51    mov         edx,2
 004B9E56    call        TGLCoordinates.SetX
 004B9E5B    mov         eax,dword ptr [ebx]
 004B9E5D    mov         ecx,dword ptr [eax+304]
 004B9E63    mov         dl,1
 004B9E65    mov         eax,[0048E564];TGLActor
 004B9E6A    call        TGLActor.Create;TGLActor.Create
 004B9E6F    mov         edx,dword ptr ds:[5AE6DC];^gvar_00607E38:TGLActor
 004B9E75    mov         dword ptr [edx],eax
 004B9E77    mov         edx,dword ptr ds:[5AE6DC];^gvar_00607E38:TGLActor
 004B9E7D    mov         edx,dword ptr [edx]
 004B9E7F    mov         eax,dword ptr [ebx]
 004B9E81    mov         eax,dword ptr [eax+308]
 004B9E87    mov         si,0FFEC
 004B9E8B    call        @CallDynaInst
 004B9E90    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9E95    mov         eax,dword ptr [eax]
 004B9E97    mov         edx,4BAA58;'hrdina_stit'
 004B9E9C    mov         ecx,dword ptr [eax]
 004B9E9E    call        dword ptr [ecx+18]
 004B9EA1    mov         eax,dword ptr [ebx]
 004B9EA3    mov         edx,dword ptr [eax+314]
 004B9EA9    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9EAE    mov         eax,dword ptr [eax]
 004B9EB0    mov         eax,dword ptr [eax+90]
 004B9EB6    call        TGLMaterial.SetMaterialLibrary
 004B9EBB    push        3F800000
 004B9EC0    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9EC5    mov         eax,dword ptr [eax]
 004B9EC7    mov         eax,dword ptr [eax+4C]
 004B9ECA    mov         edx,1
 004B9ECF    call        TGLCoordinates.SetX
 004B9ED4    push        0
 004B9ED6    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9EDB    mov         eax,dword ptr [eax]
 004B9EDD    mov         eax,dword ptr [eax+4C]
 004B9EE0    xor         edx,edx
 004B9EE2    call        TGLCoordinates.SetX
 004B9EE7    push        0
 004B9EE9    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9EEE    mov         eax,dword ptr [eax]
 004B9EF0    mov         eax,dword ptr [eax+4C]
 004B9EF3    mov         edx,2
 004B9EF8    call        TGLCoordinates.SetX
 004B9EFD    push        0
 004B9EFF    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9F04    mov         eax,dword ptr [eax]
 004B9F06    mov         eax,dword ptr [eax+48]
 004B9F09    xor         edx,edx
 004B9F0B    call        TGLCoordinates.SetX
 004B9F10    push        0
 004B9F12    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9F17    mov         eax,dword ptr [eax]
 004B9F19    mov         eax,dword ptr [eax+48]
 004B9F1C    mov         edx,1
 004B9F21    call        TGLCoordinates.SetX
 004B9F26    push        0BF800000
 004B9F2B    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004B9F30    mov         eax,dword ptr [eax]
 004B9F32    mov         eax,dword ptr [eax+48]
 004B9F35    mov         edx,2
 004B9F3A    call        TGLCoordinates.SetX
 004B9F3F    mov         byte ptr [ebp-1],0
 004B9F43    mov         edi,dword ptr ds:[5AE3FC];^gvar_00607E68:TGLActor
 004B9F49    mov         eax,dword ptr [ebx]
 004B9F4B    mov         ecx,dword ptr [eax+304]
 004B9F51    mov         dl,1
 004B9F53    mov         eax,[0048E564];TGLActor
 004B9F58    call        TGLActor.Create;TGLActor.Create
 004B9F5D    mov         esi,eax
 004B9F5F    mov         dword ptr [edi],esi
 004B9F61    mov         eax,dword ptr [ebx]
 004B9F63    mov         eax,dword ptr [eax+304]
 004B9F69    mov         edx,esi
 004B9F6B    mov         si,0FFEC
 004B9F6F    call        @CallDynaInst
 004B9F74    mov         esi,dword ptr [edi]
 004B9F76    lea         edx,[ebp-0C]
 004B9F79    xor         eax,eax
 004B9F7B    mov         al,byte ptr [ebp-1]
 004B9F7E    call        IntToStr
 004B9F83    mov         ecx,dword ptr [ebp-0C]
 004B9F86    lea         eax,[ebp-8]
 004B9F89    mov         edx,4BAA6C;'ohen'
 004B9F8E    call        @LStrCat3
 004B9F93    mov         edx,dword ptr [ebp-8]
 004B9F96    mov         eax,esi
 004B9F98    mov         ecx,dword ptr [eax]
 004B9F9A    call        dword ptr [ecx+18]
 004B9F9D    mov         eax,dword ptr [ebx]
 004B9F9F    mov         edx,dword ptr [eax+314]
 004B9FA5    mov         eax,dword ptr [esi+90]
 004B9FAB    call        TGLMaterial.SetMaterialLibrary
 004B9FB0    inc         byte ptr [ebp-1]
 004B9FB3    add         edi,4
 004B9FB6    cmp         byte ptr [ebp-1],4
>004B9FBA    jne         004B9F49
 004B9FBC    mov         byte ptr [ebp-1],0
 004B9FC0    mov         edi,dword ptr ds:[5AE38C];^gvar_00607E78:TGLActor
 004B9FC6    mov         eax,dword ptr [ebx]
 004B9FC8    mov         ecx,dword ptr [eax+304]
 004B9FCE    mov         dl,1
 004B9FD0    mov         eax,[0048E564];TGLActor
 004B9FD5    call        TGLActor.Create;TGLActor.Create
 004B9FDA    mov         esi,eax
 004B9FDC    mov         dword ptr [edi],esi
 004B9FDE    mov         edx,esi
 004B9FE0    mov         eax,dword ptr [ebx]
 004B9FE2    mov         eax,dword ptr [eax+304]
 004B9FE8    mov         si,0FFEC
 004B9FEC    call        @CallDynaInst
 004B9FF1    mov         esi,dword ptr [edi]
 004B9FF3    lea         edx,[ebp-14]
 004B9FF6    xor         eax,eax
 004B9FF8    mov         al,byte ptr [ebp-1]
 004B9FFB    call        IntToStr
 004BA000    mov         ecx,dword ptr [ebp-14]
 004BA003    lea         eax,[ebp-10]
 004BA006    mov         edx,4BAA7C;'kapucin'
 004BA00B    call        @LStrCat3
 004BA010    mov         edx,dword ptr [ebp-10]
 004BA013    mov         eax,esi
 004BA015    mov         ecx,dword ptr [eax]
 004BA017    call        dword ptr [ecx+18]
 004BA01A    mov         eax,dword ptr [ebx]
 004BA01C    mov         edx,dword ptr [eax+314]
 004BA022    mov         eax,dword ptr [esi+90]
 004BA028    call        TGLMaterial.SetMaterialLibrary
 004BA02D    inc         byte ptr [ebp-1]
 004BA030    add         edi,4
 004BA033    cmp         byte ptr [ebp-1],3
>004BA037    jne         004B9FC6
 004BA039    mov         eax,dword ptr [ebx]
 004BA03B    mov         ecx,dword ptr [eax+304]
 004BA041    mov         dl,1
 004BA043    mov         eax,[0048E564];TGLActor
 004BA048    call        TGLActor.Create;TGLActor.Create
 004BA04D    mov         edx,dword ptr ds:[5AE7AC];^gvar_00607DF4:TGLActor
 004BA053    mov         dword ptr [edx],eax
 004BA055    mov         edx,dword ptr ds:[5AE7AC];^gvar_00607DF4:TGLActor
 004BA05B    mov         edx,dword ptr [edx]
 004BA05D    mov         eax,dword ptr [ebx]
 004BA05F    mov         eax,dword ptr [eax+304]
 004BA065    mov         si,0FFEC
 004BA069    call        @CallDynaInst
 004BA06E    mov         eax,[005AE7AC];^gvar_00607DF4:TGLActor
 004BA073    mov         eax,dword ptr [eax]
 004BA075    mov         edx,4BAA8C;'hostinsky'
 004BA07A    mov         ecx,dword ptr [eax]
 004BA07C    call        dword ptr [ecx+18]
 004BA07F    mov         eax,dword ptr [ebx]
 004BA081    mov         edx,dword ptr [eax+314]
 004BA087    mov         eax,[005AE7AC];^gvar_00607DF4:TGLActor
 004BA08C    mov         eax,dword ptr [eax]
 004BA08E    mov         eax,dword ptr [eax+90]
 004BA094    call        TGLMaterial.SetMaterialLibrary
 004BA099    mov         eax,dword ptr [ebx]
 004BA09B    mov         ecx,dword ptr [eax+304]
 004BA0A1    mov         dl,1
 004BA0A3    mov         eax,[0048E564];TGLActor
 004BA0A8    call        TGLActor.Create;TGLActor.Create
 004BA0AD    mov         edx,dword ptr ds:[5AE4F8];^gvar_00607E60:TGLActor
 004BA0B3    mov         dword ptr [edx],eax
 004BA0B5    mov         edx,dword ptr ds:[5AE4F8];^gvar_00607E60:TGLActor
 004BA0BB    mov         edx,dword ptr [edx]
 004BA0BD    mov         eax,dword ptr [ebx]
 004BA0BF    mov         eax,dword ptr [eax+304]
 004BA0C5    mov         si,0FFEC
 004BA0C9    call        @CallDynaInst
 004BA0CE    mov         eax,[005AE4F8];^gvar_00607E60:TGLActor
 004BA0D3    mov         eax,dword ptr [eax]
 004BA0D5    mov         edx,4BAAA0;'krysy'
 004BA0DA    mov         ecx,dword ptr [eax]
 004BA0DC    call        dword ptr [ecx+18]
 004BA0DF    mov         eax,dword ptr [ebx]
 004BA0E1    mov         edx,dword ptr [eax+314]
 004BA0E7    mov         eax,[005AE4F8];^gvar_00607E60:TGLActor
 004BA0EC    mov         eax,dword ptr [eax]
 004BA0EE    mov         eax,dword ptr [eax+90]
 004BA0F4    call        TGLMaterial.SetMaterialLibrary
 004BA0F9    mov         eax,dword ptr [ebx]
 004BA0FB    mov         ecx,dword ptr [eax+304]
 004BA101    mov         dl,1
 004BA103    mov         eax,[0048E564];TGLActor
 004BA108    call        TGLActor.Create;TGLActor.Create
 004BA10D    mov         edx,dword ptr ds:[5AE45C];^gvar_00607E54:TGLActor
 004BA113    mov         dword ptr [edx],eax
 004BA115    mov         edx,dword ptr ds:[5AE45C];^gvar_00607E54:TGLActor
 004BA11B    mov         edx,dword ptr [edx]
 004BA11D    mov         eax,dword ptr [ebx]
 004BA11F    mov         eax,dword ptr [eax+304]
 004BA125    mov         si,0FFEC
 004BA129    call        @CallDynaInst
 004BA12E    mov         eax,[005AE45C];^gvar_00607E54:TGLActor
 004BA133    mov         eax,dword ptr [eax]
 004BA135    mov         edx,4BAAB0;'hostinsky_korbel'
 004BA13A    mov         ecx,dword ptr [eax]
 004BA13C    call        dword ptr [ecx+18]
 004BA13F    mov         eax,dword ptr [ebx]
 004BA141    mov         edx,dword ptr [eax+314]
 004BA147    mov         eax,[005AE45C];^gvar_00607E54:TGLActor
 004BA14C    mov         eax,dword ptr [eax]
 004BA14E    mov         eax,dword ptr [eax+90]
 004BA154    call        TGLMaterial.SetMaterialLibrary
 004BA159    mov         eax,dword ptr [ebx]
 004BA15B    mov         ecx,dword ptr [eax+304]
 004BA161    mov         dl,1
 004BA163    mov         eax,[0048E564];TGLActor
 004BA168    call        TGLActor.Create;TGLActor.Create
 004BA16D    mov         edx,dword ptr ds:[5AE1A8];^gvar_00607E5C:TGLActor
 004BA173    mov         dword ptr [edx],eax
 004BA175    mov         edx,dword ptr ds:[5AE1A8];^gvar_00607E5C:TGLActor
 004BA17B    mov         edx,dword ptr [edx]
 004BA17D    mov         eax,dword ptr [ebx]
 004BA17F    mov         eax,dword ptr [eax+304]
 004BA185    mov         si,0FFEC
 004BA189    call        @CallDynaInst
 004BA18E    mov         eax,[005AE1A8];^gvar_00607E5C:TGLActor
 004BA193    mov         eax,dword ptr [eax]
 004BA195    mov         edx,4BAACC;'opilec2_korbel'
 004BA19A    mov         ecx,dword ptr [eax]
 004BA19C    call        dword ptr [ecx+18]
 004BA19F    mov         eax,dword ptr [ebx]
 004BA1A1    mov         edx,dword ptr [eax+314]
 004BA1A7    mov         eax,[005AE1A8];^gvar_00607E5C:TGLActor
 004BA1AC    mov         eax,dword ptr [eax]
 004BA1AE    mov         eax,dword ptr [eax+90]
 004BA1B4    call        TGLMaterial.SetMaterialLibrary
 004BA1B9    mov         eax,dword ptr [ebx]
 004BA1BB    mov         ecx,dword ptr [eax+304]
 004BA1C1    mov         dl,1
 004BA1C3    mov         eax,[0048E564];TGLActor
 004BA1C8    call        TGLActor.Create;TGLActor.Create
 004BA1CD    mov         edx,dword ptr ds:[5AE2F0];^gvar_00607E58:TGLActor
 004BA1D3    mov         dword ptr [edx],eax
 004BA1D5    mov         edx,dword ptr ds:[5AE2F0];^gvar_00607E58:TGLActor
 004BA1DB    mov         edx,dword ptr [edx]
 004BA1DD    mov         eax,dword ptr [ebx]
 004BA1DF    mov         eax,dword ptr [eax+304]
 004BA1E5    mov         si,0FFEC
 004BA1E9    call        @CallDynaInst
 004BA1EE    mov         eax,[005AE2F0];^gvar_00607E58:TGLActor
 004BA1F3    mov         eax,dword ptr [eax]
 004BA1F5    mov         edx,4BAAE4;'opilec_korbel'
 004BA1FA    mov         ecx,dword ptr [eax]
 004BA1FC    call        dword ptr [ecx+18]
 004BA1FF    mov         eax,dword ptr [ebx]
 004BA201    mov         edx,dword ptr [eax+314]
 004BA207    mov         eax,[005AE2F0];^gvar_00607E58:TGLActor
 004BA20C    mov         eax,dword ptr [eax]
 004BA20E    mov         eax,dword ptr [eax+90]
 004BA214    call        TGLMaterial.SetMaterialLibrary
 004BA219    mov         eax,dword ptr [ebx]
 004BA21B    mov         ecx,dword ptr [eax+304]
 004BA221    mov         dl,1
 004BA223    mov         eax,[0048E564];TGLActor
 004BA228    call        TGLActor.Create;TGLActor.Create
 004BA22D    mov         edx,dword ptr ds:[5AE378];^gvar_00607DF8:TGLActor
 004BA233    mov         dword ptr [edx],eax
 004BA235    mov         edx,dword ptr ds:[5AE378];^gvar_00607DF8:TGLActor
 004BA23B    mov         edx,dword ptr [edx]
 004BA23D    mov         eax,dword ptr [ebx]
 004BA23F    mov         eax,dword ptr [eax+304]
 004BA245    mov         si,0FFEC
 004BA249    call        @CallDynaInst
 004BA24E    mov         eax,[005AE378];^gvar_00607DF8:TGLActor
 004BA253    mov         eax,dword ptr [eax]
 004BA255    mov         edx,4BAAFC;'skorapkar'
 004BA25A    mov         ecx,dword ptr [eax]
 004BA25C    call        dword ptr [ecx+18]
 004BA25F    mov         eax,dword ptr [ebx]
 004BA261    mov         edx,dword ptr [eax+314]
 004BA267    mov         eax,[005AE378];^gvar_00607DF8:TGLActor
 004BA26C    mov         eax,dword ptr [eax]
 004BA26E    mov         eax,dword ptr [eax+90]
 004BA274    call        TGLMaterial.SetMaterialLibrary
 004BA279    mov         eax,dword ptr [ebx]
 004BA27B    mov         ecx,dword ptr [eax+304]
 004BA281    mov         dl,1
 004BA283    mov         eax,[0048E564];TGLActor
 004BA288    call        TGLActor.Create;TGLActor.Create
 004BA28D    mov         edx,dword ptr ds:[5AE330];^gvar_00607DFC:TGLActor
 004BA293    mov         dword ptr [edx],eax
 004BA295    mov         edx,dword ptr ds:[5AE330];^gvar_00607DFC:TGLActor
 004BA29B    mov         edx,dword ptr [edx]
 004BA29D    mov         eax,dword ptr [ebx]
 004BA29F    mov         eax,dword ptr [eax+304]
 004BA2A5    mov         si,0FFEC
 004BA2A9    call        @CallDynaInst
 004BA2AE    mov         eax,[005AE330];^gvar_00607DFC:TGLActor
 004BA2B3    mov         eax,dword ptr [eax]
 004BA2B5    mov         edx,4BAB10;'skorapky'
 004BA2BA    mov         ecx,dword ptr [eax]
 004BA2BC    call        dword ptr [ecx+18]
 004BA2BF    mov         eax,dword ptr [ebx]
 004BA2C1    mov         edx,dword ptr [eax+314]
 004BA2C7    mov         eax,[005AE330];^gvar_00607DFC:TGLActor
 004BA2CC    mov         eax,dword ptr [eax]
 004BA2CE    mov         eax,dword ptr [eax+90]
 004BA2D4    call        TGLMaterial.SetMaterialLibrary
 004BA2D9    mov         eax,dword ptr [ebx]
 004BA2DB    mov         ecx,dword ptr [eax+304]
 004BA2E1    mov         dl,1
 004BA2E3    mov         eax,[0048E564];TGLActor
 004BA2E8    call        TGLActor.Create;TGLActor.Create
 004BA2ED    mov         edx,dword ptr ds:[5AE404];^gvar_00607E20:TGLActor
 004BA2F3    mov         dword ptr [edx],eax
 004BA2F5    mov         edx,dword ptr ds:[5AE404];^gvar_00607E20:TGLActor
 004BA2FB    mov         edx,dword ptr [edx]
 004BA2FD    mov         eax,dword ptr [ebx]
 004BA2FF    mov         eax,dword ptr [eax+304]
 004BA305    mov         si,0FFEC
 004BA309    call        @CallDynaInst
 004BA30E    mov         eax,[005AE404];^gvar_00607E20:TGLActor
 004BA313    mov         eax,dword ptr [eax]
 004BA315    mov         edx,4BAB24;'staneks'
 004BA31A    mov         ecx,dword ptr [eax]
 004BA31C    call        dword ptr [ecx+18]
 004BA31F    mov         eax,dword ptr [ebx]
 004BA321    mov         edx,dword ptr [eax+314]
 004BA327    mov         eax,[005AE404];^gvar_00607E20:TGLActor
 004BA32C    mov         eax,dword ptr [eax]
 004BA32E    mov         eax,dword ptr [eax+90]
 004BA334    call        TGLMaterial.SetMaterialLibrary
 004BA339    mov         eax,dword ptr [ebx]
 004BA33B    mov         ecx,dword ptr [eax+304]
 004BA341    mov         dl,1
 004BA343    mov         eax,[0048E564];TGLActor
 004BA348    call        TGLActor.Create;TGLActor.Create
 004BA34D    mov         edx,dword ptr ds:[5AE220];^gvar_00607E28:TGLActor
 004BA353    mov         dword ptr [edx],eax
 004BA355    mov         edx,dword ptr ds:[5AE220];^gvar_00607E28:TGLActor
 004BA35B    mov         edx,dword ptr [edx]
 004BA35D    mov         eax,dword ptr [ebx]
 004BA35F    mov         eax,dword ptr [eax+304]
 004BA365    mov         si,0FFEC
 004BA369    call        @CallDynaInst
 004BA36E    mov         eax,[005AE220];^gvar_00607E28:TGLActor
 004BA373    mov         eax,dword ptr [eax]
 004BA375    mov         edx,4BAB34;'vahy'
 004BA37A    mov         ecx,dword ptr [eax]
 004BA37C    call        dword ptr [ecx+18]
 004BA37F    mov         eax,dword ptr [ebx]
 004BA381    mov         edx,dword ptr [eax+314]
 004BA387    mov         eax,[005AE220];^gvar_00607E28:TGLActor
 004BA38C    mov         eax,dword ptr [eax]
 004BA38E    mov         eax,dword ptr [eax+90]
 004BA394    call        TGLMaterial.SetMaterialLibrary
 004BA399    mov         eax,dword ptr [ebx]
 004BA39B    mov         ecx,dword ptr [eax+304]
 004BA3A1    mov         dl,1
 004BA3A3    mov         eax,[0048E564];TGLActor
 004BA3A8    call        TGLActor.Create;TGLActor.Create
 004BA3AD    mov         edx,dword ptr ds:[5AE24C];^gvar_00607E48:TGLActor
 004BA3B3    mov         dword ptr [edx],eax
 004BA3B5    mov         edx,dword ptr ds:[5AE24C];^gvar_00607E48:TGLActor
 004BA3BB    mov         edx,dword ptr [edx]
 004BA3BD    mov         eax,dword ptr [ebx]
 004BA3BF    mov         eax,dword ptr [eax+304]
 004BA3C5    mov         si,0FFEC
 004BA3C9    call        @CallDynaInst
 004BA3CE    mov         eax,[005AE24C];^gvar_00607E48:TGLActor
 004BA3D3    mov         eax,dword ptr [eax]
 004BA3D5    mov         edx,4BAB44;'kun'
 004BA3DA    mov         ecx,dword ptr [eax]
 004BA3DC    call        dword ptr [ecx+18]
 004BA3DF    mov         eax,dword ptr [ebx]
 004BA3E1    mov         edx,dword ptr [eax+314]
 004BA3E7    mov         eax,[005AE24C];^gvar_00607E48:TGLActor
 004BA3EC    mov         eax,dword ptr [eax]
 004BA3EE    mov         eax,dword ptr [eax+90]
 004BA3F4    call        TGLMaterial.SetMaterialLibrary
 004BA3F9    mov         eax,dword ptr [ebx]
 004BA3FB    mov         ecx,dword ptr [eax+304]
 004BA401    mov         dl,1
 004BA403    mov         eax,[0048E564];TGLActor
 004BA408    call        TGLActor.Create;TGLActor.Create
 004BA40D    mov         edx,dword ptr ds:[5AE81C];^gvar_00607E44:TGLActor
 004BA413    mov         dword ptr [edx],eax
 004BA415    mov         edx,dword ptr ds:[5AE81C];^gvar_00607E44:TGLActor
 004BA41B    mov         edx,dword ptr [edx]
 004BA41D    mov         eax,dword ptr [ebx]
 004BA41F    mov         eax,dword ptr [eax+304]
 004BA425    mov         si,0FFEC
 004BA429    call        @CallDynaInst
 004BA42E    mov         eax,[005AE81C];^gvar_00607E44:TGLActor
 004BA433    mov         eax,dword ptr [eax]
 004BA435    mov         edx,4BAB50;'vozka'
 004BA43A    mov         ecx,dword ptr [eax]
 004BA43C    call        dword ptr [ecx+18]
 004BA43F    mov         eax,dword ptr [ebx]
 004BA441    mov         edx,dword ptr [eax+314]
 004BA447    mov         eax,[005AE81C];^gvar_00607E44:TGLActor
 004BA44C    mov         eax,dword ptr [eax]
 004BA44E    mov         eax,dword ptr [eax+90]
 004BA454    call        TGLMaterial.SetMaterialLibrary
 004BA459    mov         eax,dword ptr [ebx]
 004BA45B    mov         ecx,dword ptr [eax+304]
 004BA461    mov         dl,1
 004BA463    mov         eax,[0048E564];TGLActor
 004BA468    call        TGLActor.Create;TGLActor.Create
 004BA46D    mov         edx,dword ptr ds:[5AE0FC];^gvar_00607E50:TGLActor
 004BA473    mov         dword ptr [edx],eax
 004BA475    mov         edx,dword ptr ds:[5AE0FC];^gvar_00607E50:TGLActor
 004BA47B    mov         edx,dword ptr [edx]
 004BA47D    mov         eax,dword ptr [ebx]
 004BA47F    mov         eax,dword ptr [eax+304]
 004BA485    mov         si,0FFEC
 004BA489    call        @CallDynaInst
 004BA48E    mov         eax,[005AE0FC];^gvar_00607E50:TGLActor
 004BA493    mov         eax,dword ptr [eax]
 004BA495    mov         edx,4BAB60;'drevorub'
 004BA49A    mov         ecx,dword ptr [eax]
 004BA49C    call        dword ptr [ecx+18]
 004BA49F    mov         eax,dword ptr [ebx]
 004BA4A1    mov         edx,dword ptr [eax+314]
 004BA4A7    mov         eax,[005AE0FC];^gvar_00607E50:TGLActor
 004BA4AC    mov         eax,dword ptr [eax]
 004BA4AE    mov         eax,dword ptr [eax+90]
 004BA4B4    call        TGLMaterial.SetMaterialLibrary
 004BA4B9    mov         eax,dword ptr [ebx]
 004BA4BB    mov         ecx,dword ptr [eax+304]
 004BA4C1    mov         dl,1
 004BA4C3    mov         eax,[0048E564];TGLActor
 004BA4C8    call        TGLActor.Create;TGLActor.Create
 004BA4CD    mov         edx,dword ptr ds:[5AE4B0];^gvar_00607E4C:TGLActor
 004BA4D3    mov         dword ptr [edx],eax
 004BA4D5    mov         edx,dword ptr ds:[5AE4B0];^gvar_00607E4C:TGLActor
 004BA4DB    mov         edx,dword ptr [edx]
 004BA4DD    mov         eax,dword ptr [ebx]
 004BA4DF    mov         eax,dword ptr [eax+304]
 004BA4E5    mov         si,0FFEC
 004BA4E9    call        @CallDynaInst
 004BA4EE    mov         eax,[005AE4B0];^gvar_00607E4C:TGLActor
 004BA4F3    mov         eax,dword ptr [eax]
 004BA4F5    mov         edx,4BAB74;'bazina'
 004BA4FA    mov         ecx,dword ptr [eax]
 004BA4FC    call        dword ptr [ecx+18]
 004BA4FF    mov         eax,dword ptr [ebx]
 004BA501    mov         edx,dword ptr [eax+314]
 004BA507    mov         eax,[005AE4B0];^gvar_00607E4C:TGLActor
 004BA50C    mov         eax,dword ptr [eax]
 004BA50E    mov         eax,dword ptr [eax+90]
 004BA514    call        TGLMaterial.SetMaterialLibrary
 004BA519    mov         eax,dword ptr [ebx]
 004BA51B    mov         ecx,dword ptr [eax+304]
 004BA521    mov         dl,1
 004BA523    mov         eax,[0048E564];TGLActor
 004BA528    call        TGLActor.Create;TGLActor.Create
 004BA52D    mov         edx,dword ptr ds:[5AE274];^gvar_00607E24:TGLActor
 004BA533    mov         dword ptr [edx],eax
 004BA535    mov         edx,dword ptr ds:[5AE274];^gvar_00607E24:TGLActor
 004BA53B    mov         edx,dword ptr [edx]
 004BA53D    mov         eax,dword ptr [ebx]
 004BA53F    mov         eax,dword ptr [eax+304]
 004BA545    mov         si,0FFEC
 004BA549    call        @CallDynaInst
 004BA54E    mov         eax,[005AE274];^gvar_00607E24:TGLActor
 004BA553    mov         eax,dword ptr [eax]
 004BA555    mov         edx,4BAB84;'poutac'
 004BA55A    mov         ecx,dword ptr [eax]
 004BA55C    call        dword ptr [ecx+18]
 004BA55F    mov         eax,dword ptr [ebx]
 004BA561    mov         edx,dword ptr [eax+314]
 004BA567    mov         eax,[005AE274];^gvar_00607E24:TGLActor
 004BA56C    mov         eax,dword ptr [eax]
 004BA56E    mov         eax,dword ptr [eax+90]
 004BA574    call        TGLMaterial.SetMaterialLibrary
 004BA579    mov         eax,dword ptr [ebx]
 004BA57B    mov         ecx,dword ptr [eax+334]
 004BA581    mov         dl,1
 004BA583    mov         eax,[0048E564];TGLActor
 004BA588    call        TGLActor.Create;TGLActor.Create
 004BA58D    mov         edx,dword ptr ds:[5AE218];^gvar_00607DE4:TGLActor
 004BA593    mov         dword ptr [edx],eax
 004BA595    mov         edx,dword ptr ds:[5AE218];^gvar_00607DE4:TGLActor
 004BA59B    mov         edx,dword ptr [edx]
 004BA59D    mov         eax,dword ptr [ebx]
 004BA59F    mov         eax,dword ptr [eax+334]
 004BA5A5    mov         si,0FFEC
 004BA5A9    call        @CallDynaInst
 004BA5AE    mov         eax,[005AE218];^gvar_00607DE4:TGLActor
 004BA5B3    mov         eax,dword ptr [eax]
 004BA5B5    mov         edx,4BAB94;'nepritel'
 004BA5BA    mov         ecx,dword ptr [eax]
 004BA5BC    call        dword ptr [ecx+18]
 004BA5BF    mov         eax,dword ptr [ebx]
 004BA5C1    mov         edx,dword ptr [eax+314]
 004BA5C7    mov         eax,[005AE218];^gvar_00607DE4:TGLActor
 004BA5CC    mov         eax,dword ptr [eax]
 004BA5CE    mov         eax,dword ptr [eax+90]
 004BA5D4    call        TGLMaterial.SetMaterialLibrary
 004BA5D9    mov         eax,dword ptr [ebx]
 004BA5DB    mov         ecx,dword ptr [eax+304]
 004BA5E1    mov         dl,1
 004BA5E3    mov         eax,[0048E564];TGLActor
 004BA5E8    call        TGLActor.Create;TGLActor.Create
 004BA5ED    mov         edx,dword ptr ds:[5AE82C];^gvar_00607E00:TGLActor
 004BA5F3    mov         dword ptr [edx],eax
 004BA5F5    mov         edx,dword ptr ds:[5AE82C];^gvar_00607E00:TGLActor
 004BA5FB    mov         edx,dword ptr [edx]
 004BA5FD    mov         eax,dword ptr [ebx]
 004BA5FF    mov         eax,dword ptr [eax+304]
 004BA605    mov         si,0FFEC
 004BA609    call        @CallDynaInst
 004BA60E    mov         eax,[005AE82C];^gvar_00607E00:TGLActor
 004BA613    mov         eax,dword ptr [eax]
 004BA615    mov         edx,4BABA8;'dudak'
 004BA61A    mov         ecx,dword ptr [eax]
 004BA61C    call        dword ptr [ecx+18]
 004BA61F    mov         eax,dword ptr [ebx]
 004BA621    mov         edx,dword ptr [eax+314]
 004BA627    mov         eax,[005AE82C];^gvar_00607E00:TGLActor
 004BA62C    mov         eax,dword ptr [eax]
 004BA62E    mov         eax,dword ptr [eax+90]
 004BA634    call        TGLMaterial.SetMaterialLibrary
 004BA639    mov         eax,dword ptr [ebx]
 004BA63B    mov         ecx,dword ptr [eax+304]
 004BA641    mov         dl,1
 004BA643    mov         eax,[0048E564];TGLActor
 004BA648    call        TGLActor.Create;TGLActor.Create
 004BA64D    mov         edx,dword ptr ds:[5AE750];^gvar_00607E04:TGLActor
 004BA653    mov         dword ptr [edx],eax
 004BA655    mov         edx,dword ptr ds:[5AE750];^gvar_00607E04:TGLActor
 004BA65B    mov         edx,dword ptr [edx]
 004BA65D    mov         eax,dword ptr [ebx]
 004BA65F    mov         eax,dword ptr [eax+304]
 004BA665    mov         si,0FFEC
 004BA669    call        @CallDynaInst
 004BA66E    mov         eax,[005AE750];^gvar_00607E04:TGLActor
 004BA673    mov         eax,dword ptr [eax]
 004BA675    mov         edx,4BABB8;'kovar'
 004BA67A    mov         ecx,dword ptr [eax]
 004BA67C    call        dword ptr [ecx+18]
 004BA67F    mov         eax,dword ptr [ebx]
 004BA681    mov         edx,dword ptr [eax+314]
 004BA687    mov         eax,[005AE750];^gvar_00607E04:TGLActor
 004BA68C    mov         eax,dword ptr [eax]
 004BA68E    mov         eax,dword ptr [eax+90]
 004BA694    call        TGLMaterial.SetMaterialLibrary
 004BA699    mov         eax,dword ptr [ebx]
 004BA69B    mov         ecx,dword ptr [eax+304]
 004BA6A1    mov         dl,1
 004BA6A3    mov         eax,[0048E564];TGLActor
 004BA6A8    call        TGLActor.Create;TGLActor.Create
 004BA6AD    mov         edx,dword ptr ds:[5AE1E0];^gvar_00607E08:TGLActor
 004BA6B3    mov         dword ptr [edx],eax
 004BA6B5    mov         edx,dword ptr ds:[5AE1E0];^gvar_00607E08:TGLActor
 004BA6BB    mov         edx,dword ptr [edx]
 004BA6BD    mov         eax,dword ptr [ebx]
 004BA6BF    mov         eax,dword ptr [eax+304]
 004BA6C5    mov         si,0FFEC
 004BA6C9    call        @CallDynaInst
 004BA6CE    mov         eax,[005AE1E0];^gvar_00607E08:TGLActor
 004BA6D3    mov         eax,dword ptr [eax]
 004BA6D5    mov         edx,4BABC8;'straz'
 004BA6DA    mov         ecx,dword ptr [eax]
 004BA6DC    call        dword ptr [ecx+18]
 004BA6DF    mov         eax,dword ptr [ebx]
 004BA6E1    mov         edx,dword ptr [eax+314]
 004BA6E7    mov         eax,[005AE1E0];^gvar_00607E08:TGLActor
 004BA6EC    mov         eax,dword ptr [eax]
 004BA6EE    mov         eax,dword ptr [eax+90]
 004BA6F4    call        TGLMaterial.SetMaterialLibrary
 004BA6F9    mov         eax,dword ptr [ebx]
 004BA6FB    mov         ecx,dword ptr [eax+304]
 004BA701    mov         dl,1
 004BA703    mov         eax,[0048E564];TGLActor
 004BA708    call        TGLActor.Create;TGLActor.Create
 004BA70D    mov         edx,dword ptr ds:[5AE59C];^gvar_00607E0C:TGLActor
 004BA713    mov         dword ptr [edx],eax
 004BA715    mov         edx,dword ptr ds:[5AE59C];^gvar_00607E0C:TGLActor
 004BA71B    mov         edx,dword ptr [edx]
 004BA71D    mov         eax,dword ptr [ebx]
 004BA71F    mov         eax,dword ptr [eax+304]
 004BA725    mov         si,0FFEC
 004BA729    call        @CallDynaInst
 004BA72E    mov         eax,[005AE59C];^gvar_00607E0C:TGLActor
 004BA733    mov         eax,dword ptr [eax]
 004BA735    mov         edx,4BABD8;'delnik'
 004BA73A    mov         ecx,dword ptr [eax]
 004BA73C    call        dword ptr [ecx+18]
 004BA73F    mov         eax,dword ptr [ebx]
 004BA741    mov         edx,dword ptr [eax+314]
 004BA747    mov         eax,[005AE59C];^gvar_00607E0C:TGLActor
 004BA74C    mov         eax,dword ptr [eax]
 004BA74E    mov         eax,dword ptr [eax+90]
 004BA754    call        TGLMaterial.SetMaterialLibrary
 004BA759    mov         eax,dword ptr [ebx]
 004BA75B    mov         ecx,dword ptr [eax+304]
 004BA761    mov         dl,1
 004BA763    mov         eax,[0048E564];TGLActor
 004BA768    call        TGLActor.Create;TGLActor.Create
 004BA76D    mov         edx,dword ptr ds:[5AE794];^gvar_00607E2C:TGLActor
 004BA773    mov         dword ptr [edx],eax
 004BA775    mov         edx,dword ptr ds:[5AE794];^gvar_00607E2C:TGLActor
 004BA77B    mov         edx,dword ptr [edx]
 004BA77D    mov         eax,dword ptr [ebx]
 004BA77F    mov         eax,dword ptr [eax+304]
 004BA785    mov         si,0FFEC
 004BA789    call        @CallDynaInst
 004BA78E    mov         eax,[005AE794];^gvar_00607E2C:TGLActor
 004BA793    mov         eax,dword ptr [eax]
 004BA795    mov         edx,4BABE8;'deva'
 004BA79A    mov         ecx,dword ptr [eax]
 004BA79C    call        dword ptr [ecx+18]
 004BA79F    mov         eax,dword ptr [ebx]
 004BA7A1    mov         edx,dword ptr [eax+314]
 004BA7A7    mov         eax,[005AE794];^gvar_00607E2C:TGLActor
 004BA7AC    mov         eax,dword ptr [eax]
 004BA7AE    mov         eax,dword ptr [eax+90]
 004BA7B4    call        TGLMaterial.SetMaterialLibrary
 004BA7B9    mov         eax,dword ptr [ebx]
 004BA7BB    mov         ecx,dword ptr [eax+304]
 004BA7C1    mov         dl,1
 004BA7C3    mov         eax,[0048E564];TGLActor
 004BA7C8    call        TGLActor.Create;TGLActor.Create
 004BA7CD    mov         edx,dword ptr ds:[5AE478];^gvar_00607E10:TGLActor
 004BA7D3    mov         dword ptr [edx],eax
 004BA7D5    mov         edx,dword ptr ds:[5AE478];^gvar_00607E10:TGLActor
 004BA7DB    mov         edx,dword ptr [edx]
 004BA7DD    mov         eax,dword ptr [ebx]
 004BA7DF    mov         eax,dword ptr [eax+304]
 004BA7E5    mov         si,0FFEC
 004BA7E9    call        @CallDynaInst
 004BA7EE    mov         eax,[005AE478];^gvar_00607E10:TGLActor
 004BA7F3    mov         eax,dword ptr [eax]
 004BA7F5    mov         edx,4BABF8;'vlajka'
 004BA7FA    mov         ecx,dword ptr [eax]
 004BA7FC    call        dword ptr [ecx+18]
 004BA7FF    mov         eax,dword ptr [ebx]
 004BA801    mov         edx,dword ptr [eax+314]
 004BA807    mov         eax,[005AE478];^gvar_00607E10:TGLActor
 004BA80C    mov         eax,dword ptr [eax]
 004BA80E    mov         eax,dword ptr [eax+90]
 004BA814    call        TGLMaterial.SetMaterialLibrary
 004BA819    mov         eax,dword ptr [ebx]
 004BA81B    mov         ecx,dword ptr [eax+304]
 004BA821    mov         dl,1
 004BA823    mov         eax,[0048E564];TGLActor
 004BA828    call        TGLActor.Create;TGLActor.Create
 004BA82D    mov         edx,dword ptr ds:[5AE28C];^gvar_00607E64:TGLActor
 004BA833    mov         dword ptr [edx],eax
 004BA835    mov         edx,dword ptr ds:[5AE28C];^gvar_00607E64:TGLActor
 004BA83B    mov         edx,dword ptr [edx]
 004BA83D    mov         eax,dword ptr [ebx]
 004BA83F    mov         eax,dword ptr [eax+304]
 004BA845    mov         si,0FFEC
 004BA849    call        @CallDynaInst
 004BA84E    mov         eax,[005AE28C];^gvar_00607E64:TGLActor
 004BA853    mov         eax,dword ptr [eax]
 004BA855    mov         edx,4BAC08;'cihly'
 004BA85A    mov         ecx,dword ptr [eax]
 004BA85C    call        dword ptr [ecx+18]
 004BA85F    mov         eax,dword ptr [ebx]
 004BA861    mov         edx,dword ptr [eax+314]
 004BA867    mov         eax,[005AE28C];^gvar_00607E64:TGLActor
 004BA86C    mov         eax,dword ptr [eax]
 004BA86E    mov         eax,dword ptr [eax+90]
 004BA874    call        TGLMaterial.SetMaterialLibrary
 004BA879    mov         eax,dword ptr [ebx]
 004BA87B    mov         ecx,dword ptr [eax+348]
 004BA881    mov         dl,1
 004BA883    mov         eax,[0048E564];TGLActor
 004BA888    call        TGLActor.Create;TGLActor.Create
 004BA88D    mov         edx,dword ptr ds:[5AE720];^gvar_00607E14:TGLActor
 004BA893    mov         dword ptr [edx],eax
 004BA895    mov         edx,dword ptr ds:[5AE720];^gvar_00607E14:TGLActor
 004BA89B    mov         edx,dword ptr [edx]
 004BA89D    mov         eax,dword ptr [ebx]
 004BA89F    mov         eax,dword ptr [eax+348]
 004BA8A5    mov         si,0FFEC
 004BA8A9    call        @CallDynaInst
 004BA8AE    mov         eax,[005AE720];^gvar_00607E14:TGLActor
 004BA8B3    mov         eax,dword ptr [eax]
 004BA8B5    mov         edx,4BAC18;'logo'
 004BA8BA    mov         ecx,dword ptr [eax]
 004BA8BC    call        dword ptr [ecx+18]
 004BA8BF    mov         eax,dword ptr [ebx]
 004BA8C1    mov         edx,dword ptr [eax+314]
 004BA8C7    mov         eax,[005AE720];^gvar_00607E14:TGLActor
 004BA8CC    mov         eax,dword ptr [eax]
 004BA8CE    mov         eax,dword ptr [eax+90]
 004BA8D4    call        TGLMaterial.SetMaterialLibrary
 004BA8D9    mov         eax,dword ptr [ebx]
 004BA8DB    mov         ecx,dword ptr [eax+304]
 004BA8E1    mov         dl,1
 004BA8E3    mov         eax,[0048E564];TGLActor
 004BA8E8    call        TGLActor.Create;TGLActor.Create
 004BA8ED    mov         edx,dword ptr ds:[5AE1B0];^gvar_00607E1C:TGLActor
 004BA8F3    mov         dword ptr [edx],eax
 004BA8F5    mov         edx,dword ptr ds:[5AE1B0];^gvar_00607E1C:TGLActor
 004BA8FB    mov         edx,dword ptr [edx]
 004BA8FD    mov         eax,dword ptr [ebx]
 004BA8FF    mov         eax,dword ptr [eax+304]
 004BA905    mov         si,0FFEC
 004BA909    call        @CallDynaInst
 004BA90E    mov         eax,[005AE1B0];^gvar_00607E1C:TGLActor
 004BA913    mov         eax,dword ptr [eax]
 004BA915    mov         edx,4BAC28;'sejdir'
 004BA91A    mov         ecx,dword ptr [eax]
 004BA91C    call        dword ptr [ecx+18]
 004BA91F    mov         eax,dword ptr [ebx]
 004BA921    mov         edx,dword ptr [eax+314]
 004BA927    mov         eax,[005AE1B0];^gvar_00607E1C:TGLActor
 004BA92C    mov         eax,dword ptr [eax]
 004BA92E    mov         eax,dword ptr [eax+90]
 004BA934    call        TGLMaterial.SetMaterialLibrary
 004BA939    mov         eax,dword ptr [ebx]
 004BA93B    mov         ecx,dword ptr [eax+304]
 004BA941    mov         dl,1
 004BA943    mov         eax,[0048E564];TGLActor
 004BA948    call        TGLActor.Create;TGLActor.Create
 004BA94D    mov         edx,dword ptr ds:[5AE1DC];^gvar_00607E18:TGLActor
 004BA953    mov         dword ptr [edx],eax
 004BA955    mov         edx,dword ptr ds:[5AE1DC];^gvar_00607E18:TGLActor
 004BA95B    mov         edx,dword ptr [edx]
 004BA95D    mov         eax,dword ptr [ebx]
 004BA95F    mov         eax,dword ptr [eax+304]
 004BA965    mov         si,0FFEC
 004BA969    call        @CallDynaInst
 004BA96E    mov         eax,[005AE1DC];^gvar_00607E18:TGLActor
 004BA973    mov         eax,dword ptr [eax]
 004BA975    mov         edx,4BAC38;'babice'
 004BA97A    mov         ecx,dword ptr [eax]
 004BA97C    call        dword ptr [ecx+18]
 004BA97F    mov         eax,dword ptr [ebx]
 004BA981    mov         edx,dword ptr [eax+314]
 004BA987    mov         eax,[005AE1DC];^gvar_00607E18:TGLActor
 004BA98C    mov         eax,dword ptr [eax]
 004BA98E    mov         eax,dword ptr [eax+90]
 004BA994    call        TGLMaterial.SetMaterialLibrary
 004BA999    xor         eax,eax
 004BA99B    pop         edx
 004BA99C    pop         ecx
 004BA99D    pop         ecx
 004BA99E    mov         dword ptr fs:[eax],edx
 004BA9A1    push        4BA9BB
 004BA9A6    lea         eax,[ebp-14]
 004BA9A9    mov         edx,4
 004BA9AE    call        @LStrArrayClr
 004BA9B3    ret
>004BA9B4    jmp         @HandleFinally
>004BA9B9    jmp         004BA9A6
 004BA9BB    pop         edi
 004BA9BC    pop         esi
 004BA9BD    pop         ebx
 004BA9BE    mov         esp,ebp
 004BA9C0    pop         ebp
 004BA9C1    ret
*}
end;

//004BAC40
procedure sub_004BAC40;
begin
{*
 004BAC40    push        ebx
 004BAC41    push        esi
 004BAC42    push        ecx
 004BAC43    mov         eax,[005AE65C];^gvar_00607DE8:TGLActor
 004BAC48    mov         eax,dword ptr [eax]
 004BAC4A    mov         eax,dword ptr [eax+0C8]
 004BAC50    mov         si,0FFF3
 004BAC54    call        @CallDynaInst
 004BAC59    mov         eax,[005AE65C];^gvar_00607DE8:TGLActor
 004BAC5E    mov         eax,dword ptr [eax]
 004BAC60    xor         edx,edx
 004BAC62    mov         ecx,dword ptr [eax]
 004BAC64    call        dword ptr [ecx+3C]
 004BAC67    mov         eax,[005AE4FC];^gvar_00607DEC:TGLActor
 004BAC6C    mov         eax,dword ptr [eax]
 004BAC6E    mov         eax,dword ptr [eax+0C8]
 004BAC74    mov         si,0FFF3
 004BAC78    call        @CallDynaInst
 004BAC7D    mov         eax,[005AE4FC];^gvar_00607DEC:TGLActor
 004BAC82    mov         eax,dword ptr [eax]
 004BAC84    xor         edx,edx
 004BAC86    mov         ecx,dword ptr [eax]
 004BAC88    call        dword ptr [ecx+3C]
 004BAC8B    mov         eax,[005AE5F0];^gvar_00607DF0:TGLActor
 004BAC90    mov         eax,dword ptr [eax]
 004BAC92    mov         eax,dword ptr [eax+0C8]
 004BAC98    mov         si,0FFF3
 004BAC9C    call        @CallDynaInst
 004BACA1    mov         eax,[005AE5F0];^gvar_00607DF0:TGLActor
 004BACA6    mov         eax,dword ptr [eax]
 004BACA8    xor         edx,edx
 004BACAA    mov         ecx,dword ptr [eax]
 004BACAC    call        dword ptr [ecx+3C]
 004BACAF    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004BACB4    mov         eax,dword ptr [eax]
 004BACB6    mov         eax,dword ptr [eax+0C8]
 004BACBC    mov         si,0FFF3
 004BACC0    call        @CallDynaInst
 004BACC5    mov         eax,[005AE7CC];^gvar_00607E34:TGLActor
 004BACCA    mov         eax,dword ptr [eax]
 004BACCC    xor         edx,edx
 004BACCE    mov         ecx,dword ptr [eax]
 004BACD0    call        dword ptr [ecx+3C]
 004BACD3    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004BACD8    mov         eax,dword ptr [eax]
 004BACDA    mov         eax,dword ptr [eax+0C8]
 004BACE0    mov         si,0FFF3
 004BACE4    call        @CallDynaInst
 004BACE9    mov         eax,[005AE2D0];^gvar_00607E30:TGLActor
 004BACEE    mov         eax,dword ptr [eax]
 004BACF0    xor         edx,edx
 004BACF2    mov         ecx,dword ptr [eax]
 004BACF4    call        dword ptr [ecx+3C]
 004BACF7    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004BACFC    mov         eax,dword ptr [eax]
 004BACFE    mov         eax,dword ptr [eax+0C8]
 004BAD04    mov         si,0FFF3
 004BAD08    call        @CallDynaInst
 004BAD0D    mov         eax,[005AE5E4];^gvar_00607E3C:TGLActor
 004BAD12    mov         eax,dword ptr [eax]
 004BAD14    xor         edx,edx
 004BAD16    mov         ecx,dword ptr [eax]
 004BAD18    call        dword ptr [ecx+3C]
 004BAD1B    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004BAD20    mov         eax,dword ptr [eax]
 004BAD22    mov         eax,dword ptr [eax+0C8]
 004BAD28    mov         si,0FFF3
 004BAD2C    call        @CallDynaInst
 004BAD31    mov         eax,[005AE6DC];^gvar_00607E38:TGLActor
 004BAD36    mov         eax,dword ptr [eax]
 004BAD38    xor         edx,edx
 004BAD3A    mov         ecx,dword ptr [eax]
 004BAD3C    call        dword ptr [ecx+3C]
 004BAD3F    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004BAD44    mov         eax,dword ptr [eax]
 004BAD46    mov         eax,dword ptr [eax+0C8]
 004BAD4C    mov         si,0FFF3
 004BAD50    call        @CallDynaInst
 004BAD55    mov         eax,[005AE820];^gvar_00607E40:TGLActor
 004BAD5A    mov         eax,dword ptr [eax]
 004BAD5C    xor         edx,edx
 004BAD5E    mov         ecx,dword ptr [eax]
 004BAD60    call        dword ptr [ecx+3C]
 004BAD63    mov         eax,[005AE1B0];^gvar_00607E1C:TGLActor
 004BAD68    mov         eax,dword ptr [eax]
 004BAD6A    mov         eax,dword ptr [eax+0C8]
 004BAD70    mov         si,0FFF3
 004BAD74    call        @CallDynaInst
 004BAD79    mov         eax,[005AE1B0];^gvar_00607E1C:TGLActor
 004BAD7E    mov         eax,dword ptr [eax]
 004BAD80    xor         edx,edx
 004BAD82    mov         ecx,dword ptr [eax]
 004BAD84    call        dword ptr [ecx+3C]
 004BAD87    mov         eax,[005AE404];^gvar_00607E20:TGLActor
 004BAD8C    mov         eax,dword ptr [eax]
 004BAD8E    mov         eax,dword ptr [eax+0C8]
 004BAD94    mov         si,0FFF3
 004BAD98    call        @CallDynaInst
 004BAD9D    mov         eax,[005AE404];^gvar_00607E20:TGLActor
 004BADA2    mov         eax,dword ptr [eax]
 004BADA4    xor         edx,edx
 004BADA6    mov         ecx,dword ptr [eax]
 004BADA8    call        dword ptr [ecx+3C]
 004BADAB    mov         eax,[005AE220];^gvar_00607E28:TGLActor
 004BADB0    mov         eax,dword ptr [eax]
 004BADB2    mov         eax,dword ptr [eax+0C8]
 004BADB8    mov         si,0FFF3
 004BADBC    call        @CallDynaInst
 004BADC1    mov         eax,[005AE220];^gvar_00607E28:TGLActor
 004BADC6    mov         eax,dword ptr [eax]
 004BADC8    xor         edx,edx
 004BADCA    mov         ecx,dword ptr [eax]
 004BADCC    call        dword ptr [ecx+3C]
 004BADCF    mov         eax,[005AE24C];^gvar_00607E48:TGLActor
 004BADD4    mov         eax,dword ptr [eax]
 004BADD6    mov         eax,dword ptr [eax+0C8]
 004BADDC    mov         si,0FFF3
 004BADE0    call        @CallDynaInst
 004BADE5    mov         eax,[005AE24C];^gvar_00607E48:TGLActor
 004BADEA    mov         eax,dword ptr [eax]
 004BADEC    xor         edx,edx
 004BADEE    mov         ecx,dword ptr [eax]
 004BADF0    call        dword ptr [ecx+3C]
 004BADF3    mov         eax,[005AE81C];^gvar_00607E44:TGLActor
 004BADF8    mov         eax,dword ptr [eax]
 004BADFA    mov         eax,dword ptr [eax+0C8]
 004BAE00    mov         si,0FFF3
 004BAE04    call        @CallDynaInst
 004BAE09    mov         eax,[005AE81C];^gvar_00607E44:TGLActor
 004BAE0E    mov         eax,dword ptr [eax]
 004BAE10    xor         edx,edx
 004BAE12    mov         ecx,dword ptr [eax]
 004BAE14    call        dword ptr [ecx+3C]
 004BAE17    mov         eax,[005AE0FC];^gvar_00607E50:TGLActor
 004BAE1C    mov         eax,dword ptr [eax]
 004BAE1E    mov         eax,dword ptr [eax+0C8]
 004BAE24    mov         si,0FFF3
 004BAE28    call        @CallDynaInst
 004BAE2D    mov         eax,[005AE0FC];^gvar_00607E50:TGLActor
 004BAE32    mov         eax,dword ptr [eax]
 004BAE34    xor         edx,edx
 004BAE36    mov         ecx,dword ptr [eax]
 004BAE38    call        dword ptr [ecx+3C]
 004BAE3B    mov         eax,[005AE4B0];^gvar_00607E4C:TGLActor
 004BAE40    mov         eax,dword ptr [eax]
 004BAE42    mov         eax,dword ptr [eax+0C8]
 004BAE48    mov         si,0FFF3
 004BAE4C    call        @CallDynaInst
 004BAE51    mov         eax,[005AE4B0];^gvar_00607E4C:TGLActor
 004BAE56    mov         eax,dword ptr [eax]
 004BAE58    xor         edx,edx
 004BAE5A    mov         ecx,dword ptr [eax]
 004BAE5C    call        dword ptr [ecx+3C]
 004BAE5F    mov         byte ptr [esp],4
 004BAE63    mov         ebx,dword ptr ds:[5AE3FC];^gvar_00607E68:TGLActor
 004BAE69    mov         eax,dword ptr [ebx]
 004BAE6B    mov         eax,dword ptr [eax+0C8]
 004BAE71    mov         si,0FFF3
 004BAE75    call        @CallDynaInst
 004BAE7A    xor         edx,edx
 004BAE7C    mov         eax,dword ptr [ebx]
 004BAE7E    mov         ecx,dword ptr [eax]
 004BAE80    call        dword ptr [ecx+3C]
 004BAE83    add         ebx,4
 004BAE86    dec         byte ptr [esp]
>004BAE89    jne         004BAE69
 004BAE8B    mov         byte ptr [esp],3
 004BAE8F    mov         ebx,dword ptr ds:[5AE38C];^gvar_00607E78:TGLActor
 004BAE95    mov         eax,dword ptr [ebx]
 004BAE97    mov         eax,dword ptr [eax+0C8]
 004BAE9D    mov         si,0FFF3
 004BAEA1    call        @CallDynaInst
 004BAEA6    xor         edx,edx
 004BAEA8    mov         eax,dword ptr [ebx]
 004BAEAA    mov         ecx,dword ptr [eax]
 004BAEAC    call        dword ptr [ecx+3C]
 004BAEAF    add         ebx,4
 004BAEB2    dec         byte ptr [esp]
>004BAEB5    jne         004BAE95
 004BAEB7    mov         eax,[005AE7AC];^gvar_00607DF4:TGLActor
 004BAEBC    mov         eax,dword ptr [eax]
 004BAEBE    mov         eax,dword ptr [eax+0C8]
 004BAEC4    mov         si,0FFF3
 004BAEC8    call        @CallDynaInst
 004BAECD    mov         eax,[005AE7AC];^gvar_00607DF4:TGLActor
 004BAED2    mov         eax,dword ptr [eax]
 004BAED4    xor         edx,edx
 004BAED6    mov         ecx,dword ptr [eax]
 004BAED8    call        dword ptr [ecx+3C]
 004BAEDB    mov         eax,[005AE4F8];^gvar_00607E60:TGLActor
 004BAEE0    mov         eax,dword ptr [eax]
 004BAEE2    mov         eax,dword ptr [eax+0C8]
 004BAEE8    mov         si,0FFF3
 004BAEEC    call        @CallDynaInst
 004BAEF1    mov         eax,[005AE4F8];^gvar_00607E60:TGLActor
 004BAEF6    mov         eax,dword ptr [eax]
 004BAEF8    xor         edx,edx
 004BAEFA    mov         ecx,dword ptr [eax]
 004BAEFC    call        dword ptr [ecx+3C]
 004BAEFF    mov         eax,[005AE45C];^gvar_00607E54:TGLActor
 004BAF04    mov         eax,dword ptr [eax]
 004BAF06    mov         eax,dword ptr [eax+0C8]
 004BAF0C    mov         si,0FFF3
 004BAF10    call        @CallDynaInst
 004BAF15    mov         eax,[005AE45C];^gvar_00607E54:TGLActor
 004BAF1A    mov         eax,dword ptr [eax]
 004BAF1C    xor         edx,edx
 004BAF1E    mov         ecx,dword ptr [eax]
 004BAF20    call        dword ptr [ecx+3C]
 004BAF23    mov         eax,[005AE2F0];^gvar_00607E58:TGLActor
 004BAF28    mov         eax,dword ptr [eax]
 004BAF2A    mov         eax,dword ptr [eax+0C8]
 004BAF30    mov         si,0FFF3
 004BAF34    call        @CallDynaInst
 004BAF39    mov         eax,[005AE2F0];^gvar_00607E58:TGLActor
 004BAF3E    mov         eax,dword ptr [eax]
 004BAF40    xor         edx,edx
 004BAF42    mov         ecx,dword ptr [eax]
 004BAF44    call        dword ptr [ecx+3C]
 004BAF47    mov         eax,[005AE1A8];^gvar_00607E5C:TGLActor
 004BAF4C    mov         eax,dword ptr [eax]
 004BAF4E    mov         eax,dword ptr [eax+0C8]
 004BAF54    mov         si,0FFF3
 004BAF58    call        @CallDynaInst
 004BAF5D    mov         eax,[005AE1A8];^gvar_00607E5C:TGLActor
 004BAF62    mov         eax,dword ptr [eax]
 004BAF64    xor         edx,edx
 004BAF66    mov         ecx,dword ptr [eax]
 004BAF68    call        dword ptr [ecx+3C]
 004BAF6B    mov         eax,[005AE378];^gvar_00607DF8:TGLActor
 004BAF70    mov         eax,dword ptr [eax]
 004BAF72    mov         eax,dword ptr [eax+0C8]
 004BAF78    mov         si,0FFF3
 004BAF7C    call        @CallDynaInst
 004BAF81    mov         eax,[005AE378];^gvar_00607DF8:TGLActor
 004BAF86    mov         eax,dword ptr [eax]
 004BAF88    xor         edx,edx
 004BAF8A    mov         ecx,dword ptr [eax]
 004BAF8C    call        dword ptr [ecx+3C]
 004BAF8F    mov         eax,[005AE330];^gvar_00607DFC:TGLActor
 004BAF94    mov         eax,dword ptr [eax]
 004BAF96    mov         eax,dword ptr [eax+0C8]
 004BAF9C    mov         si,0FFF3
 004BAFA0    call        @CallDynaInst
 004BAFA5    mov         eax,[005AE330];^gvar_00607DFC:TGLActor
 004BAFAA    mov         eax,dword ptr [eax]
 004BAFAC    xor         edx,edx
 004BAFAE    mov         ecx,dword ptr [eax]
 004BAFB0    call        dword ptr [ecx+3C]
 004BAFB3    mov         eax,[005AE218];^gvar_00607DE4:TGLActor
 004BAFB8    mov         eax,dword ptr [eax]
 004BAFBA    mov         eax,dword ptr [eax+0C8]
 004BAFC0    mov         si,0FFF3
 004BAFC4    call        @CallDynaInst
 004BAFC9    mov         eax,[005AE218];^gvar_00607DE4:TGLActor
 004BAFCE    mov         eax,dword ptr [eax]
 004BAFD0    xor         edx,edx
 004BAFD2    mov         ecx,dword ptr [eax]
 004BAFD4    call        dword ptr [ecx+3C]
 004BAFD7    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004BAFDC    mov         eax,dword ptr [eax]
 004BAFDE    mov         eax,dword ptr [eax+320]
 004BAFE4    mov         eax,dword ptr [eax+0C8]
 004BAFEA    mov         si,0FFF3
 004BAFEE    call        @CallDynaInst
 004BAFF3    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004BAFF8    mov         eax,dword ptr [eax]
 004BAFFA    mov         eax,dword ptr [eax+320]
 004BB000    xor         edx,edx
 004BB002    mov         ecx,dword ptr [eax]
 004BB004    call        dword ptr [ecx+3C]
 004BB007    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004BB00C    mov         eax,dword ptr [eax]
 004BB00E    mov         eax,dword ptr [eax+324]
 004BB014    mov         eax,dword ptr [eax+0C8]
 004BB01A    mov         si,0FFF3
 004BB01E    call        @CallDynaInst
 004BB023    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004BB028    mov         eax,dword ptr [eax]
 004BB02A    mov         eax,dword ptr [eax+324]
 004BB030    xor         edx,edx
 004BB032    mov         ecx,dword ptr [eax]
 004BB034    call        dword ptr [ecx+3C]
 004BB037    mov         eax,[005AE82C];^gvar_00607E00:TGLActor
 004BB03C    mov         eax,dword ptr [eax]
 004BB03E    mov         eax,dword ptr [eax+0C8]
 004BB044    mov         si,0FFF3
 004BB048    call        @CallDynaInst
 004BB04D    mov         eax,[005AE82C];^gvar_00607E00:TGLActor
 004BB052    mov         eax,dword ptr [eax]
 004BB054    xor         edx,edx
 004BB056    mov         ecx,dword ptr [eax]
 004BB058    call        dword ptr [ecx+3C]
 004BB05B    mov         eax,[005AE750];^gvar_00607E04:TGLActor
 004BB060    mov         eax,dword ptr [eax]
 004BB062    mov         eax,dword ptr [eax+0C8]
 004BB068    mov         si,0FFF3
 004BB06C    call        @CallDynaInst
 004BB071    mov         eax,[005AE750];^gvar_00607E04:TGLActor
 004BB076    mov         eax,dword ptr [eax]
 004BB078    xor         edx,edx
 004BB07A    mov         ecx,dword ptr [eax]
 004BB07C    call        dword ptr [ecx+3C]
 004BB07F    mov         eax,[005AE720];^gvar_00607E14:TGLActor
 004BB084    mov         eax,dword ptr [eax]
 004BB086    mov         eax,dword ptr [eax+0C8]
 004BB08C    mov         si,0FFF3
 004BB090    call        @CallDynaInst
 004BB095    mov         eax,[005AE720];^gvar_00607E14:TGLActor
 004BB09A    mov         eax,dword ptr [eax]
 004BB09C    xor         edx,edx
 004BB09E    mov         ecx,dword ptr [eax]
 004BB0A0    call        dword ptr [ecx+3C]
 004BB0A3    mov         eax,[005AE1DC];^gvar_00607E18:TGLActor
 004BB0A8    mov         eax,dword ptr [eax]
 004BB0AA    mov         eax,dword ptr [eax+0C8]
 004BB0B0    mov         si,0FFF3
 004BB0B4    call        @CallDynaInst
 004BB0B9    mov         eax,[005AE1DC];^gvar_00607E18:TGLActor
 004BB0BE    mov         eax,dword ptr [eax]
 004BB0C0    xor         edx,edx
 004BB0C2    mov         ecx,dword ptr [eax]
 004BB0C4    call        dword ptr [ecx+3C]
 004BB0C7    mov         eax,[005AE274];^gvar_00607E24:TGLActor
 004BB0CC    mov         eax,dword ptr [eax]
 004BB0CE    mov         eax,dword ptr [eax+0C8]
 004BB0D4    mov         si,0FFF3
 004BB0D8    call        @CallDynaInst
 004BB0DD    mov         eax,[005AE274];^gvar_00607E24:TGLActor
 004BB0E2    mov         eax,dword ptr [eax]
 004BB0E4    xor         edx,edx
 004BB0E6    mov         ecx,dword ptr [eax]
 004BB0E8    call        dword ptr [ecx+3C]
 004BB0EB    mov         eax,[005AE1E0];^gvar_00607E08:TGLActor
 004BB0F0    mov         eax,dword ptr [eax]
 004BB0F2    mov         eax,dword ptr [eax+0C8]
 004BB0F8    mov         si,0FFF3
 004BB0FC    call        @CallDynaInst
 004BB101    mov         eax,[005AE1E0];^gvar_00607E08:TGLActor
 004BB106    mov         eax,dword ptr [eax]
 004BB108    xor         edx,edx
 004BB10A    mov         ecx,dword ptr [eax]
 004BB10C    call        dword ptr [ecx+3C]
 004BB10F    mov         eax,[005AE59C];^gvar_00607E0C:TGLActor
 004BB114    mov         eax,dword ptr [eax]
 004BB116    mov         eax,dword ptr [eax+0C8]
 004BB11C    mov         si,0FFF3
 004BB120    call        @CallDynaInst
 004BB125    mov         eax,[005AE59C];^gvar_00607E0C:TGLActor
 004BB12A    mov         eax,dword ptr [eax]
 004BB12C    xor         edx,edx
 004BB12E    mov         ecx,dword ptr [eax]
 004BB130    call        dword ptr [ecx+3C]
 004BB133    mov         eax,[005AE478];^gvar_00607E10:TGLActor
 004BB138    mov         eax,dword ptr [eax]
 004BB13A    mov         eax,dword ptr [eax+0C8]
 004BB140    mov         si,0FFF3
 004BB144    call        @CallDynaInst
 004BB149    mov         eax,[005AE478];^gvar_00607E10:TGLActor
 004BB14E    mov         eax,dword ptr [eax]
 004BB150    xor         edx,edx
 004BB152    mov         ecx,dword ptr [eax]
 004BB154    call        dword ptr [ecx+3C]
 004BB157    mov         eax,[005AE28C];^gvar_00607E64:TGLActor
 004BB15C    mov         eax,dword ptr [eax]
 004BB15E    mov         eax,dword ptr [eax+0C8]
 004BB164    mov         si,0FFF3
 004BB168    call        @CallDynaInst
 004BB16D    mov         eax,[005AE28C];^gvar_00607E64:TGLActor
 004BB172    mov         eax,dword ptr [eax]
 004BB174    xor         edx,edx
 004BB176    mov         ecx,dword ptr [eax]
 004BB178    call        dword ptr [ecx+3C]
 004BB17B    mov         eax,[005AE794];^gvar_00607E2C:TGLActor
 004BB180    mov         eax,dword ptr [eax]
 004BB182    mov         eax,dword ptr [eax+0C8]
 004BB188    mov         si,0FFF3
 004BB18C    call        @CallDynaInst
 004BB191    mov         eax,[005AE794];^gvar_00607E2C:TGLActor
 004BB196    mov         eax,dword ptr [eax]
 004BB198    xor         edx,edx
 004BB19A    mov         ecx,dword ptr [eax]
 004BB19C    call        dword ptr [ecx+3C]
 004BB19F    pop         edx
 004BB1A0    pop         esi
 004BB1A1    pop         ebx
 004BB1A2    ret
*}
end;

end.