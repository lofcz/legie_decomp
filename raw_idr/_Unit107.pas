//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit107;

interface

uses
  SysUtils, Classes;

type
  THlaska = THlaska = record//size=0x10
f0:String;//f0
end;;
    //procedure sub_004B8568(?:?);//004B8568
    //procedure sub_004B8690(?:?; ?:?; ?:?; ?:?; ?:?);//004B8690
    //procedure sub_004B86D4(?:?; ?:?; ?:?);//004B86D4
    procedure sub_004B8EA8;//004B8EA8
    //procedure sub_004B8F20(?:?; ?:?; ?:?);//004B8F20
    //procedure sub_004B8FB4(?:?; ?:?; ?:?; ?:?);//004B8FB4
    //procedure sub_004B91A4(?:?; ?:?; ?:?; ?:?; ?:?);//004B91A4
    //procedure sub_004B9328(?:?);//004B9328
    //procedure sub_004B93E4(?:?);//004B93E4
    //procedure sub_004B9408(?:?; ?:?; ?:?; ?:?);//004B9408
    //procedure sub_004B9570(?:?; ?:?);//004B9570

implementation

//004B8568
{*procedure sub_004B8568(?:?);
begin
 004B8568    push        ebp
 004B8569    mov         ebp,esp
 004B856B    push        ecx
 004B856C    push        ebx
 004B856D    push        esi
 004B856E    mov         dword ptr [ebp-4],eax
 004B8571    mov         eax,dword ptr [ebp-4]
 004B8574    call        @LStrAddRef
 004B8579    xor         eax,eax
 004B857B    push        ebp
 004B857C    push        4B866E
 004B8581    push        dword ptr fs:[eax]
 004B8584    mov         dword ptr fs:[eax],esp
 004B8587    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B858C    mov         eax,dword ptr [eax]
 004B858E    mov         eax,dword ptr [eax+31C]
 004B8594    mov         eax,dword ptr [eax+34]
 004B8597    call        00477644
 004B859C    mov         ebx,eax
 004B859E    mov         edx,dword ptr [ebp-4]
 004B85A1    mov         eax,ebx
 004B85A3    call        TGLLibMaterial.SetName
 004B85A8    mov         eax,dword ptr [ebx+18]
 004B85AB    call        TGLMaterial.GetTexture
 004B85B0    xor         edx,edx
 004B85B2    call        TGLTexture.SetDisabled
 004B85B7    mov         dl,byte ptr ds:[4B867C];0x3 gvar_004B867C
 004B85BD    mov         eax,dword ptr [ebx+18]
 004B85C0    call        TGLMaterial.SetMaterialOptions
 004B85C5    mov         dl,1
 004B85C7    mov         eax,dword ptr [ebx+18]
 004B85CA    call        TGLMaterial.SetBlendingMode
 004B85CF    mov         eax,dword ptr [ebx+18]
 004B85D2    call        TGLMaterial.GetTexture
 004B85D7    mov         dl,3
 004B85D9    call        TGLTexture.SetTextureMode
 004B85DE    mov         eax,dword ptr [ebx+18]
 004B85E1    call        TGLMaterial.GetTexture
 004B85E6    xor         edx,edx
 004B85E8    call        TGLTexture.SetImageAlpha
 004B85ED    mov         eax,dword ptr [ebx+18]
 004B85F0    call        TGLMaterial.GetTexture
 004B85F5    mov         dl,1
 004B85F7    call        TGLTexture.SetTextureMode
 004B85FC    mov         eax,[005AE828];^gvar_005F5530:AnsiString
 004B8601    mov         ecx,4B8688;'.tga'
 004B8606    mov         edx,dword ptr [ebp-4]
 004B8609    call        @LStrCat3
 004B860E    mov         dl,1
 004B8610    mov         eax,[004B7D90];TTGAImage
 004B8615    call        TTGAImage.Create;TTGAImage.Create
 004B861A    mov         esi,eax
 004B861C    mov         edx,dword ptr ds:[5AE828];^gvar_005F5530:AnsiString
 004B8622    mov         edx,dword ptr [edx]
 004B8624    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B8629    mov         eax,dword ptr [eax]
 004B862B    mov         eax,dword ptr [eax+37C]
 004B8631    call        004A3668
 004B8636    mov         edx,eax
 004B8638    mov         eax,esi
 004B863A    mov         ecx,dword ptr [eax]
 004B863C    call        dword ptr [ecx+54];TTGAImage.LoadFromStream
 004B863F    mov         eax,dword ptr [ebx+18]
 004B8642    call        TGLMaterial.GetTexture
 004B8647    mov         eax,dword ptr [eax+24]
 004B864A    mov         edx,esi
 004B864C    mov         ecx,dword ptr [eax]
 004B864E    call        dword ptr [ecx+8]
 004B8651    mov         eax,esi
 004B8653    call        TObject.Free
 004B8658    xor         eax,eax
 004B865A    pop         edx
 004B865B    pop         ecx
 004B865C    pop         ecx
 004B865D    mov         dword ptr fs:[eax],edx
 004B8660    push        4B8675
 004B8665    lea         eax,[ebp-4]
 004B8668    call        @LStrClr
 004B866D    ret
>004B866E    jmp         @HandleFinally
>004B8673    jmp         004B8665
 004B8675    pop         esi
 004B8676    pop         ebx
 004B8677    pop         ecx
 004B8678    pop         ebp
 004B8679    ret
end;*}

//004B8690
{*procedure sub_004B8690(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004B8690    push        ebp
 004B8691    mov         ebp,esp
 004B8693    push        ebx
 004B8694    push        esi
 004B8695    mov         esi,dword ptr [ebp+8]
 004B8698    mov         ebx,dword ptr [ebp+0C]
 004B869B    cmp         al,byte ptr [ebx-1]
>004B869E    jne         004B86BD
 004B86A0    mov         eax,dword ptr [ebp+0C]
 004B86A3    mov         eax,dword ptr [eax-8]
 004B86A6    mov         byte ptr [eax],dl
 004B86A8    mov         eax,dword ptr [ebp+0C]
 004B86AB    mov         eax,dword ptr [eax-0C]
 004B86AE    mov         byte ptr [eax],cl
 004B86B0    mov         eax,dword ptr [ebp+0C]
 004B86B3    mov         eax,dword ptr [eax+8]
 004B86B6    mov         edx,esi
 004B86B8    call        @LStrAsg
 004B86BD    cmp         byte ptr ds:[5E1644],0;gvar_005E1644
>004B86C4    je          004B86CD
 004B86C6    mov         eax,esi
 004B86C8    call        004B8568
 004B86CD    pop         esi
 004B86CE    pop         ebx
 004B86CF    pop         ebp
 004B86D0    ret         4
end;*}

//004B86D4
{*procedure sub_004B86D4(?:?; ?:?; ?:?);
begin
 004B86D4    push        ebp
 004B86D5    mov         ebp,esp
 004B86D7    add         esp,0FFFFFFF4
 004B86DA    mov         dword ptr [ebp-0C],ecx
 004B86DD    mov         dword ptr [ebp-8],edx
 004B86E0    mov         byte ptr [ebp-1],al
 004B86E3    push        ebp
 004B86E4    push        4B8B98;'a'
 004B86E9    mov         cl,0A
 004B86EB    mov         dl,3
 004B86ED    mov         al,61
 004B86EF    call        004B8690
 004B86F4    pop         ecx
 004B86F5    push        ebp
 004B86F6    push        4B8BA4;'a_c'
 004B86FB    mov         cl,0B
 004B86FD    mov         dl,2
 004B86FF    mov         al,0E1
 004B8701    call        004B8690
 004B8706    pop         ecx
 004B8707    push        ebp
 004B8708    push        4B8BB0;'b'
 004B870D    mov         cl,0B
 004B870F    mov         dl,2
 004B8711    mov         al,62
 004B8713    call        004B8690
 004B8718    pop         ecx
 004B8719    push        ebp
 004B871A    push        4B8BBC;'c'
 004B871F    mov         cl,0B
 004B8721    mov         dl,2
 004B8723    mov         al,63
 004B8725    call        004B8690
 004B872A    pop         ecx
 004B872B    push        ebp
 004B872C    push        4B8BC8;'c_h'
 004B8731    mov         cl,0A
 004B8733    mov         dl,3
 004B8735    mov         al,0E8
 004B8737    call        004B8690
 004B873C    pop         ecx
 004B873D    push        ebp
 004B873E    push        4B8BD4;'d'
 004B8743    mov         cl,0A
 004B8745    mov         dl,2
 004B8747    mov         al,64
 004B8749    call        004B8690
 004B874E    pop         ecx
 004B874F    push        ebp
 004B8750    push        4B8BE0;'d_h'
 004B8755    mov         cl,0B
 004B8757    mov         dl,3
 004B8759    mov         al,0EF
 004B875B    call        004B8690
 004B8760    pop         ecx
 004B8761    push        ebp
 004B8762    push        4B8BEC;'e'
 004B8767    mov         cl,0A
 004B8769    mov         dl,3
 004B876B    mov         al,65
 004B876D    call        004B8690
 004B8772    pop         ecx
 004B8773    push        ebp
 004B8774    push        4B8BF8;'e_h'
 004B8779    mov         cl,0B
 004B877B    mov         dl,2
 004B877D    mov         al,0EC
 004B877F    call        004B8690
 004B8784    pop         ecx
 004B8785    push        ebp
 004B8786    push        4B8C04;'e_c'
 004B878B    mov         cl,0B
 004B878D    mov         dl,2
 004B878F    mov         al,0E9
 004B8791    call        004B8690
 004B8796    pop         ecx
 004B8797    push        ebp
 004B8798    push        4B8C10;'f'
 004B879D    mov         cl,0A
 004B879F    mov         dl,3
 004B87A1    mov         al,66
 004B87A3    call        004B8690
 004B87A8    pop         ecx
 004B87A9    push        ebp
 004B87AA    push        4B8C1C;'g'
 004B87AF    mov         cl,0B
 004B87B1    mov         dl,2
 004B87B3    mov         al,67
 004B87B5    call        004B8690
 004B87BA    pop         ecx
 004B87BB    push        ebp
 004B87BC    push        4B8C28;'h'
 004B87C1    mov         cl,0A
 004B87C3    mov         dl,3
 004B87C5    mov         al,68
 004B87C7    call        004B8690
 004B87CC    pop         ecx
 004B87CD    push        ebp
 004B87CE    push        4B8C34;'i'
 004B87D3    mov         cl,9
 004B87D5    mov         dl,4
 004B87D7    mov         al,69
 004B87D9    call        004B8690
 004B87DE    pop         ecx
 004B87DF    push        ebp
 004B87E0    push        4B8C40;'i_c'
 004B87E5    mov         cl,9
 004B87E7    mov         dl,3
 004B87E9    mov         al,0ED
 004B87EB    call        004B8690
 004B87F0    pop         ecx
 004B87F1    push        ebp
 004B87F2    push        4B8C4C;'j'
 004B87F7    mov         cl,0A
 004B87F9    mov         dl,2
 004B87FB    mov         al,6A
 004B87FD    call        004B8690
 004B8802    pop         ecx
 004B8803    push        ebp
 004B8804    push        4B8C58;'k'
 004B8809    mov         cl,0A
 004B880B    mov         dl,3
 004B880D    mov         al,6B
 004B880F    call        004B8690
 004B8814    pop         ecx
 004B8815    push        ebp
 004B8816    push        4B8C64;'l'
 004B881B    mov         cl,0A
 004B881D    mov         dl,3
 004B881F    mov         al,6C
 004B8821    call        004B8690
 004B8826    pop         ecx
 004B8827    push        ebp
 004B8828    push        4B8C70;'m'
 004B882D    mov         cl,0B
 004B882F    mov         dl,2
 004B8831    mov         al,6D
 004B8833    call        004B8690
 004B8838    pop         ecx
 004B8839    push        ebp
 004B883A    push        4B8C7C;'n'
 004B883F    mov         cl,0B
 004B8841    mov         dl,2
 004B8843    mov         al,6E
 004B8845    call        004B8690
 004B884A    pop         ecx
 004B884B    push        ebp
 004B884C    push        4B8C88;'n_h'
 004B8851    mov         cl,0B
 004B8853    mov         dl,2
 004B8855    mov         al,0F2
 004B8857    call        004B8690
 004B885C    pop         ecx
 004B885D    push        ebp
 004B885E    push        4B8C94;'o'
 004B8863    mov         cl,0A
 004B8865    mov         dl,2
 004B8867    mov         al,6F
 004B8869    call        004B8690
 004B886E    pop         ecx
 004B886F    push        ebp
 004B8870    push        4B8CA0;'o_c'
 004B8875    mov         cl,0A
 004B8877    mov         dl,3
 004B8879    mov         al,0F3
 004B887B    call        004B8690
 004B8880    pop         ecx
 004B8881    push        ebp
 004B8882    push        4B8CAC;'p'
 004B8887    mov         cl,0A
 004B8889    mov         dl,3
 004B888B    mov         al,70
 004B888D    call        004B8690
 004B8892    pop         ecx
 004B8893    push        ebp
 004B8894    push        4B8CB8;'q'
 004B8899    mov         cl,0B
 004B889B    mov         dl,2
 004B889D    mov         al,71
 004B889F    call        004B8690
 004B88A4    pop         ecx
 004B88A5    push        ebp
 004B88A6    push        4B8CC4;'r'
 004B88AB    mov         cl,0A
 004B88AD    mov         dl,3
 004B88AF    mov         al,72
 004B88B1    call        004B8690
 004B88B6    pop         ecx
 004B88B7    push        ebp
 004B88B8    push        4B8CD0;'r_h'
 004B88BD    mov         cl,0A
 004B88BF    mov         dl,3
 004B88C1    mov         al,0F8
 004B88C3    call        004B8690
 004B88C8    pop         ecx
 004B88C9    push        ebp
 004B88CA    push        4B8CDC;'s'
 004B88CF    mov         cl,0A
 004B88D1    mov         dl,3
 004B88D3    mov         al,73
 004B88D5    call        004B8690
 004B88DA    pop         ecx
 004B88DB    push        ebp
 004B88DC    push        4B8CE8;'s_h'
 004B88E1    mov         cl,0A
 004B88E3    mov         dl,3
 004B88E5    mov         al,9A
 004B88E7    call        004B8690
 004B88EC    pop         ecx
 004B88ED    push        ebp
 004B88EE    push        4B8CF4;'t'
 004B88F3    mov         cl,9
 004B88F5    mov         dl,4
 004B88F7    mov         al,74
 004B88F9    call        004B8690
 004B88FE    pop         ecx
 004B88FF    push        ebp
 004B8900    push        4B8D00;'t_h'
 004B8905    mov         cl,9
 004B8907    mov         dl,4
 004B8909    mov         al,9D
 004B890B    call        004B8690
 004B8910    pop         ecx
 004B8911    push        ebp
 004B8912    push        4B8D0C;'u'
 004B8917    mov         cl,0A
 004B8919    mov         dl,2
 004B891B    mov         al,75
 004B891D    call        004B8690
 004B8922    pop         ecx
 004B8923    push        ebp
 004B8924    push        4B8D18;'u_k'
 004B8929    mov         cl,0B
 004B892B    mov         dl,2
 004B892D    mov         al,0F9
 004B892F    call        004B8690
 004B8934    pop         ecx
 004B8935    push        ebp
 004B8936    push        4B8D24;'u_c'
 004B893B    mov         cl,0B
 004B893D    mov         dl,2
 004B893F    mov         al,0FA
 004B8941    call        004B8690
 004B8946    pop         ecx
 004B8947    push        ebp
 004B8948    push        4B8D30;'v'
 004B894D    mov         cl,0B
 004B894F    mov         dl,2
 004B8951    mov         al,76
 004B8953    call        004B8690
 004B8958    pop         ecx
 004B8959    push        ebp
 004B895A    push        4B8D3C;'w'
 004B895F    mov         cl,0B
 004B8961    mov         dl,2
 004B8963    mov         al,77
 004B8965    call        004B8690
 004B896A    pop         ecx
 004B896B    push        ebp
 004B896C    push        4B8D48;'x'
 004B8971    mov         cl,0B
 004B8973    mov         dl,3
 004B8975    mov         al,78
 004B8977    call        004B8690
 004B897C    pop         ecx
 004B897D    push        ebp
 004B897E    push        4B8D54;'y'
 004B8983    mov         cl,9
 004B8985    mov         dl,3
 004B8987    mov         al,79
 004B8989    call        004B8690
 004B898E    pop         ecx
 004B898F    push        ebp
 004B8990    push        4B8D60;'y_c'
 004B8995    mov         cl,9
 004B8997    mov         dl,4
 004B8999    mov         al,0FD
 004B899B    call        004B8690
 004B89A0    pop         ecx
 004B89A1    push        ebp
 004B89A2    push        4B8D6C;'z'
 004B89A7    mov         cl,0A
 004B89A9    mov         dl,3
 004B89AB    mov         al,7A
 004B89AD    call        004B8690
 004B89B2    pop         ecx
 004B89B3    push        ebp
 004B89B4    push        4B8D78;'z_h'
 004B89B9    mov         cl,0A
 004B89BB    mov         dl,2
 004B89BD    mov         al,9E
 004B89BF    call        004B8690
 004B89C4    pop         ecx
 004B89C5    push        ebp
 004B89C6    push        4B8D84;'pom'
 004B89CB    mov         cl,8
 004B89CD    mov         dl,4
 004B89CF    mov         al,2D
 004B89D1    call        004B8690
 004B89D6    pop         ecx
 004B89D7    push        ebp
 004B89D8    push        4B8D90;'lz'
 004B89DD    mov         cl,5
 004B89DF    mov         dl,5
 004B89E1    mov         al,28
 004B89E3    call        004B8690
 004B89E8    pop         ecx
 004B89E9    push        ebp
 004B89EA    push        4B8D9C;'pz'
 004B89EF    mov         cl,5
 004B89F1    mov         dl,5
 004B89F3    mov         al,29
 004B89F5    call        004B8690
 004B89FA    pop         ecx
 004B89FB    push        ebp
 004B89FC    push        4B8DA8;'dvo'
 004B8A01    mov         cl,4
 004B8A03    mov         dl,5
 004B8A05    mov         al,3A
 004B8A07    call        004B8690
 004B8A0C    pop         ecx
 004B8A0D    push        ebp
 004B8A0E    push        4B8DB4;'te'
 004B8A13    mov         cl,4
 004B8A15    mov         dl,6
 004B8A17    mov         al,2E
 004B8A19    call        004B8690
 004B8A1E    pop         ecx
 004B8A1F    push        ebp
 004B8A20    push        4B8DC0;'car'
 004B8A25    mov         cl,4
 004B8A27    mov         dl,5
 004B8A29    mov         al,2C
 004B8A2B    call        004B8690
 004B8A30    pop         ecx
 004B8A31    push        ebp
 004B8A32    push        4B8DCC;'ud'
 004B8A37    mov         cl,8
 004B8A39    mov         dl,4
 004B8A3B    mov         al,84
 004B8A3D    call        004B8690
 004B8A42    pop         ecx
 004B8A43    push        ebp
 004B8A44    push        4B8DD8;'un'
 004B8A49    mov         cl,8
 004B8A4B    mov         dl,4
 004B8A4D    mov         al,93
 004B8A4F    call        004B8690
 004B8A54    pop         ecx
 004B8A55    push        ebp
 004B8A56    push        4B8DE4;'0'
 004B8A5B    mov         cl,0A
 004B8A5D    mov         dl,3
 004B8A5F    mov         al,30
 004B8A61    call        004B8690
 004B8A66    pop         ecx
 004B8A67    push        ebp
 004B8A68    push        4B8DF0;'1'
 004B8A6D    mov         cl,9
 004B8A6F    mov         dl,4
 004B8A71    mov         al,31
 004B8A73    call        004B8690
 004B8A78    pop         ecx
 004B8A79    push        ebp
 004B8A7A    push        4B8DFC;'2'
 004B8A7F    mov         cl,0A
 004B8A81    mov         dl,3
 004B8A83    mov         al,32
 004B8A85    call        004B8690
 004B8A8A    pop         ecx
 004B8A8B    push        ebp
 004B8A8C    push        4B8E08;'3'
 004B8A91    mov         cl,0B
 004B8A93    mov         dl,3
 004B8A95    mov         al,33
 004B8A97    call        004B8690
 004B8A9C    pop         ecx
 004B8A9D    push        ebp
 004B8A9E    push        4B8E14;'4'
 004B8AA3    mov         cl,0A
 004B8AA5    mov         dl,2
 004B8AA7    mov         al,34
 004B8AA9    call        004B8690
 004B8AAE    pop         ecx
 004B8AAF    push        ebp
 004B8AB0    push        4B8E20;'5'
 004B8AB5    mov         cl,0A
 004B8AB7    mov         dl,2
 004B8AB9    mov         al,35
 004B8ABB    call        004B8690
 004B8AC0    pop         ecx
 004B8AC1    push        ebp
 004B8AC2    push        4B8E2C;'6'
 004B8AC7    mov         cl,0B
 004B8AC9    mov         dl,3
 004B8ACB    mov         al,36
 004B8ACD    call        004B8690
 004B8AD2    pop         ecx
 004B8AD3    push        ebp
 004B8AD4    push        4B8E38;'7'
 004B8AD9    mov         cl,0A
 004B8ADB    mov         dl,2
 004B8ADD    mov         al,37
 004B8ADF    call        004B8690
 004B8AE4    pop         ecx
 004B8AE5    push        ebp
 004B8AE6    push        4B8E44;'8'
 004B8AEB    mov         cl,9
 004B8AED    mov         dl,3
 004B8AEF    mov         al,38
 004B8AF1    call        004B8690
 004B8AF6    pop         ecx
 004B8AF7    push        ebp
 004B8AF8    push        4B8E50;'9'
 004B8AFD    mov         cl,9
 004B8AFF    mov         dl,3
 004B8B01    mov         al,39
 004B8B03    call        004B8690
 004B8B08    pop         ecx
 004B8B09    push        ebp
 004B8B0A    push        4B8E5C;'lom'
 004B8B0F    mov         cl,0A
 004B8B11    mov         dl,3
 004B8B13    mov         al,2F
 004B8B15    call        004B8690
 004B8B1A    pop         ecx
 004B8B1B    push        ebp
 004B8B1C    push        4B8E68;'vyk'
 004B8B21    mov         cl,4
 004B8B23    mov         dl,5
 004B8B25    mov         al,21
 004B8B27    call        004B8690
 004B8B2C    pop         ecx
 004B8B2D    push        ebp
 004B8B2E    push        4B8E74;'ot'
 004B8B33    mov         cl,0A
 004B8B35    mov         dl,2
 004B8B37    mov         al,3F
 004B8B39    call        004B8690
 004B8B3E    pop         ecx
 004B8B3F    push        ebp
 004B8B40    push        4B8E80;'plu'
 004B8B45    mov         cl,0B
 004B8B47    mov         dl,4
 004B8B49    mov         al,2B
 004B8B4B    call        004B8690
 004B8B50    pop         ecx
 004B8B51    push        ebp
 004B8B52    push        4B8E8C;'apo'
 004B8B57    mov         cl,3
 004B8B59    mov         dl,5
 004B8B5B    mov         al,27
 004B8B5D    call        004B8690
 004B8B62    pop         ecx
 004B8B63    push        ebp
 004B8B64    push        4B8E98;'and'
 004B8B69    mov         cl,0A
 004B8B6B    mov         dl,2
 004B8B6D    mov         al,26
 004B8B6F    call        004B8690
 004B8B74    pop         ecx
 004B8B75    push        ebp
 004B8B76    push        4B8EA4;'pro'
 004B8B7B    mov         cl,9
 004B8B7D    mov         dl,3
 004B8B7F    mov         al,25
 004B8B81    call        004B8690
 004B8B86    pop         ecx
 004B8B87    mov         esp,ebp
 004B8B89    pop         ebp
 004B8B8A    ret         4
end;*}

//004B8EA8
procedure sub_004B8EA8;
begin
{*
 004B8EA8    push        ebp
 004B8EA9    mov         ebp,esp
 004B8EAB    add         esp,0FFFFFFF8
 004B8EAE    push        ebx
 004B8EAF    push        esi
 004B8EB0    xor         eax,eax
 004B8EB2    mov         dword ptr [ebp-8],eax
 004B8EB5    lea         esi,[ebp-1]
 004B8EB8    xor         eax,eax
 004B8EBA    push        ebp
 004B8EBB    push        4B8F12
 004B8EC0    push        dword ptr fs:[eax]
 004B8EC3    mov         dword ptr fs:[eax],esp
 004B8EC6    mov         byte ptr ds:[5E1644],1;gvar_005E1644
 004B8ECD    lea         eax,[ebp-8]
 004B8ED0    push        eax
 004B8ED1    mov         ecx,esi
 004B8ED3    mov         edx,esi
 004B8ED5    mov         al,61
 004B8ED7    call        004B86D4
 004B8EDC    mov         byte ptr ds:[5E1644],0;gvar_005E1644
 004B8EE3    mov         byte ptr [esi],0
 004B8EE6    mov         ebx,5E1648;gvar_005E1648:AnsiString
 004B8EEB    mov         eax,ebx
 004B8EED    call        @LStrClr
 004B8EF2    inc         byte ptr [esi]
 004B8EF4    add         ebx,10
 004B8EF7    cmp         byte ptr [esi],1B
>004B8EFA    jne         004B8EEB
 004B8EFC    xor         eax,eax
 004B8EFE    pop         edx
 004B8EFF    pop         ecx
 004B8F00    pop         ecx
 004B8F01    mov         dword ptr fs:[eax],edx
 004B8F04    push        4B8F19
 004B8F09    lea         eax,[ebp-8]
 004B8F0C    call        @LStrClr
 004B8F11    ret
>004B8F12    jmp         @HandleFinally
>004B8F17    jmp         004B8F09
 004B8F19    pop         esi
 004B8F1A    pop         ebx
 004B8F1B    pop         ecx
 004B8F1C    pop         ecx
 004B8F1D    pop         ebp
 004B8F1E    ret
*}
end;

//004B8F20
{*procedure sub_004B8F20(?:?; ?:?; ?:?);
begin
 004B8F20    push        ebp
 004B8F21    mov         ebp,esp
 004B8F23    push        0
 004B8F25    push        0
 004B8F27    push        ebx
 004B8F28    push        esi
 004B8F29    push        edi
 004B8F2A    mov         edi,ecx
 004B8F2C    mov         esi,edx
 004B8F2E    mov         ebx,eax
 004B8F30    xor         eax,eax
 004B8F32    push        ebp
 004B8F33    push        4B8F8B
 004B8F38    push        dword ptr fs:[eax]
 004B8F3B    mov         dword ptr fs:[eax],esp
 004B8F3E    push        4B8FA4;'hl'
 004B8F43    lea         edx,[ebp-4]
 004B8F46    xor         eax,eax
 004B8F48    mov         al,bl
 004B8F4A    call        IntToStr
 004B8F4F    push        dword ptr [ebp-4]
 004B8F52    push        4B8FB0;'_'
 004B8F57    lea         edx,[ebp-8]
 004B8F5A    mov         eax,esi
 004B8F5C    call        IntToStr
 004B8F61    push        dword ptr [ebp-8]
 004B8F64    mov         eax,edi
 004B8F66    mov         edx,4
 004B8F6B    call        @LStrCatN
 004B8F70    xor         eax,eax
 004B8F72    pop         edx
 004B8F73    pop         ecx
 004B8F74    pop         ecx
 004B8F75    mov         dword ptr fs:[eax],edx
 004B8F78    push        4B8F92
 004B8F7D    lea         eax,[ebp-8]
 004B8F80    mov         edx,2
 004B8F85    call        @LStrArrayClr
 004B8F8A    ret
>004B8F8B    jmp         @HandleFinally
>004B8F90    jmp         004B8F7D
 004B8F92    pop         edi
 004B8F93    pop         esi
 004B8F94    pop         ebx
 004B8F95    pop         ecx
 004B8F96    pop         ecx
 004B8F97    pop         ebp
 004B8F98    ret
end;*}

//004B8FB4
{*procedure sub_004B8FB4(?:?; ?:?; ?:?; ?:?);
begin
 004B8FB4    push        ebp
 004B8FB5    mov         ebp,esp
 004B8FB7    add         esp,0FFFFFFF4
 004B8FBA    push        ebx
 004B8FBB    push        esi
 004B8FBC    push        edi
 004B8FBD    xor         ebx,ebx
 004B8FBF    mov         dword ptr [ebp-0C],ebx
 004B8FC2    mov         dword ptr [ebp-4],ecx
 004B8FC5    mov         edi,edx
 004B8FC7    mov         ebx,eax
 004B8FC9    xor         eax,eax
 004B8FCB    push        ebp
 004B8FCC    push        4B9193
 004B8FD1    push        dword ptr fs:[eax]
 004B8FD4    mov         dword ptr fs:[eax],esp
 004B8FD7    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B8FDC    mov         eax,dword ptr [eax]
 004B8FDE    mov         eax,dword ptr [eax+318]
 004B8FE4    mov         edx,dword ptr ds:[4A11D4];TGLHUDSprite
 004B8FEA    mov         si,0FFEE
 004B8FEE    call        @CallDynaInst
 004B8FF3    mov         esi,eax
 004B8FF5    mov         dword ptr [esi+0C],ebx
 004B8FF8    mov         eax,dword ptr [ebp+8]
 004B8FFB    add         ebx,dword ptr [eax-4]
 004B8FFE    mov         dword ptr [ebp-8],ebx
 004B9001    fild        dword ptr [ebp-8]
 004B9004    add         esp,0FFFFFFFC
 004B9007    fstp        dword ptr [esp]
 004B900A    wait
 004B900B    xor         edx,edx
 004B900D    mov         eax,dword ptr [esi+44]
 004B9010    call        TGLCoordinates.SetX
 004B9015    mov         dword ptr [ebp-8],edi
 004B9018    fild        dword ptr [ebp-8]
 004B901B    add         esp,0FFFFFFFC
 004B901E    fstp        dword ptr [esp]
 004B9021    wait
 004B9022    mov         edx,1
 004B9027    mov         eax,dword ptr [esi+44]
 004B902A    call        TGLCoordinates.SetX
 004B902F    lea         ecx,[ebp-0C]
 004B9032    mov         eax,dword ptr [ebp+8]
 004B9035    mov         al,byte ptr [eax-5]
 004B9038    mov         edx,dword ptr [ebp-4]
 004B903B    call        004B8F20
 004B9040    mov         edx,dword ptr [ebp-0C]
 004B9043    mov         eax,esi
 004B9045    mov         ecx,dword ptr [eax]
 004B9047    call        dword ptr [ecx+18]
 004B904A    mov         dl,1
 004B904C    mov         eax,esi
 004B904E    call        TGLSprite.SetNoZWrite
 004B9053    push        41800000
 004B9058    mov         eax,esi
 004B905A    call        TGLSprite.SetWidth
 004B905F    push        dword ptr [esi+98]
 004B9065    mov         eax,esi
 004B9067    call        TGLSprite.SetHeight
 004B906C    mov         eax,dword ptr [ebp+8]
 004B906F    mov         edx,dword ptr [eax-0C]
 004B9072    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B9077    mov         eax,dword ptr [eax]
 004B9079    mov         eax,dword ptr [eax+31C]
 004B907F    mov         eax,dword ptr [eax+34]
 004B9082    call        004776DC
 004B9087    mov         edx,dword ptr [eax+18]
 004B908A    mov         eax,dword ptr [esi+90]
 004B9090    mov         ecx,dword ptr [eax]
 004B9092    call        dword ptr [ecx+8]
 004B9095    mov         eax,dword ptr [ebp+8]
 004B9098    mov         al,byte ptr [eax+8]
 004B909B    sub         al,1
>004B909D    jb          004B90A9
>004B909F    je          004B9114
 004B90A1    dec         al
>004B90A3    jne         004B917D
 004B90A9    push        3F19999A
 004B90AE    mov         eax,dword ptr [esi+90]
 004B90B4    mov         eax,dword ptr [eax+18]
 004B90B7    mov         eax,dword ptr [eax+1C]
 004B90BA    xor         edx,edx
 004B90BC    call        TGLColor.SetRed
 004B90C1    push        3F19999A
 004B90C6    mov         eax,dword ptr [esi+90]
 004B90CC    mov         eax,dword ptr [eax+18]
 004B90CF    mov         eax,dword ptr [eax+1C]
 004B90D2    mov         edx,1
 004B90D7    call        TGLColor.SetRed
 004B90DC    push        3F000000
 004B90E1    mov         eax,dword ptr [esi+90]
 004B90E7    mov         eax,dword ptr [eax+18]
 004B90EA    mov         eax,dword ptr [eax+1C]
 004B90ED    mov         edx,2
 004B90F2    call        TGLColor.SetRed
 004B90F7    push        3F400000
 004B90FC    mov         eax,dword ptr [esi+90]
 004B9102    mov         eax,dword ptr [eax+18]
 004B9105    mov         eax,dword ptr [eax+1C]
 004B9108    mov         edx,3
 004B910D    call        TGLColor.SetRed
>004B9112    jmp         004B917D
 004B9114    push        3F800000
 004B9119    mov         eax,dword ptr [esi+90]
 004B911F    mov         eax,dword ptr [eax+18]
 004B9122    mov         eax,dword ptr [eax+1C]
 004B9125    xor         edx,edx
 004B9127    call        TGLColor.SetRed
 004B912C    push        3F800000
 004B9131    mov         eax,dword ptr [esi+90]
 004B9137    mov         eax,dword ptr [eax+18]
 004B913A    mov         eax,dword ptr [eax+1C]
 004B913D    mov         edx,1
 004B9142    call        TGLColor.SetRed
 004B9147    push        3F800000
 004B914C    mov         eax,dword ptr [esi+90]
 004B9152    mov         eax,dword ptr [eax+18]
 004B9155    mov         eax,dword ptr [eax+1C]
 004B9158    mov         edx,2
 004B915D    call        TGLColor.SetRed
 004B9162    push        3F400000
 004B9167    mov         eax,dword ptr [esi+90]
 004B916D    mov         eax,dword ptr [eax+18]
 004B9170    mov         eax,dword ptr [eax+1C]
 004B9173    mov         edx,3
 004B9178    call        TGLColor.SetRed
 004B917D    xor         eax,eax
 004B917F    pop         edx
 004B9180    pop         ecx
 004B9181    pop         ecx
 004B9182    mov         dword ptr fs:[eax],edx
 004B9185    push        4B919A
 004B918A    lea         eax,[ebp-0C]
 004B918D    call        @LStrClr
 004B9192    ret
>004B9193    jmp         @HandleFinally
>004B9198    jmp         004B918A
 004B919A    pop         edi
 004B919B    pop         esi
 004B919C    pop         ebx
 004B919D    mov         esp,ebp
 004B919F    pop         ebp
 004B91A0    ret
end;*}

//004B91A4
{*procedure sub_004B91A4(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004B91A4    push        ebp
 004B91A5    mov         ebp,esp
 004B91A7    add         esp,0FFFFFFE4
 004B91AA    push        ebx
 004B91AB    push        esi
 004B91AC    push        edi
 004B91AD    xor         ebx,ebx
 004B91AF    mov         dword ptr [ebp-1C],ebx
 004B91B2    mov         dword ptr [ebp-0C],ebx
 004B91B5    mov         dword ptr [ebp-10],ecx
 004B91B8    mov         dword ptr [ebp-4],edx
 004B91BB    mov         byte ptr [ebp-5],al
 004B91BE    mov         eax,dword ptr [ebp+10]
 004B91C1    call        @LStrAddRef
 004B91C6    xor         eax,eax
 004B91C8    push        ebp
 004B91C9    push        4B9316
 004B91CE    push        dword ptr fs:[eax]
 004B91D1    mov         dword ptr fs:[eax],esp
 004B91D4    lea         edx,[ebp-1C]
 004B91D7    mov         eax,dword ptr [ebp+10]
 004B91DA    call        AnsiLowerCase
 004B91DF    mov         edx,dword ptr [ebp-1C]
 004B91E2    lea         eax,[ebp+10]
 004B91E5    call        @LStrLAsg
 004B91EA    cmp         dword ptr [ebp+10],0
>004B91EE    jne         004B920B
 004B91F0    xor         eax,eax
 004B91F2    mov         al,byte ptr [ebp-5]
 004B91F5    add         eax,eax
 004B91F7    mov         edx,dword ptr [ebp-4]
 004B91FA    mov         dword ptr [eax*8+5E164C],edx;gvar_005E164C
 004B9201    mov         edx,dword ptr [ebp-10]
 004B9204    mov         dword ptr [eax*8+5E1650],edx;gvar_005E1650
 004B920B    xor         eax,eax
 004B920D    mov         al,byte ptr [ebp-5]
 004B9210    add         eax,eax
 004B9212    mov         eax,dword ptr [eax*8+5E1648];gvar_005E1648:AnsiString
 004B9219    mov         edx,dword ptr [ebp+10]
 004B921C    call        @LStrCmp
>004B9221    je          004B92F0
 004B9227    mov         al,byte ptr [ebp-5]
 004B922A    call        004B9328
 004B922F    cmp         dword ptr [ebp+10],0
>004B9233    je          004B92F0
 004B9239    xor         edi,edi
 004B923B    xor         eax,eax
 004B923D    mov         dword ptr [ebp-18],eax
 004B9240    mov         eax,dword ptr [ebp+10]
 004B9243    call        @LStrLen
 004B9248    mov         esi,eax
 004B924A    test        esi,esi
>004B924C    jle         004B92A4
 004B924E    mov         ebx,1
 004B9253    mov         eax,dword ptr [ebp+10]
 004B9256    mov         al,byte ptr [eax+ebx-1]
 004B925A    cmp         al,20
>004B925C    je          004B9299
 004B925E    lea         edx,[ebp-0C]
 004B9261    push        edx
 004B9262    lea         ecx,[ebp-12]
 004B9265    lea         edx,[ebp-11]
 004B9268    push        edx
 004B9269    pop         edx
 004B926A    call        004B86D4
 004B926F    push        ebp
 004B9270    xor         eax,eax
 004B9272    mov         al,byte ptr [ebp-11]
 004B9275    push        eax
 004B9276    mov         eax,edi
 004B9278    pop         edx
 004B9279    sub         eax,edx
 004B927B    mov         ecx,ebx
 004B927D    mov         edx,dword ptr [ebp-10]
 004B9280    call        004B8FB4
 004B9285    pop         ecx
 004B9286    xor         eax,eax
 004B9288    mov         al,byte ptr [ebp-12]
 004B928B    add         edi,eax
 004B928D    inc         edi
 004B928E    xor         eax,eax
 004B9290    mov         al,byte ptr [ebp-12]
 004B9293    inc         eax
 004B9294    add         dword ptr [ebp-18],eax
>004B9297    jmp         004B92A0
 004B9299    add         edi,8
 004B929C    add         dword ptr [ebp-18],8
 004B92A0    inc         ebx
 004B92A1    dec         esi
>004B92A2    jne         004B9253
 004B92A4    xor         eax,eax
 004B92A6    mov         al,byte ptr [ebp-5]
 004B92A9    mov         ebx,eax
 004B92AB    add         ebx,ebx
 004B92AD    lea         eax,[ebx*8+5E1648];gvar_005E1648:AnsiString
 004B92B4    mov         edx,dword ptr [ebp+10]
 004B92B7    call        @LStrAsg
 004B92BC    mov         eax,dword ptr [ebp-4]
 004B92BF    mov         dword ptr [ebx*8+5E164C],eax;gvar_005E164C
 004B92C6    mov         eax,dword ptr [ebp-10]
 004B92C9    mov         dword ptr [ebx*8+5E1650],eax;gvar_005E1650
 004B92D0    mov         eax,dword ptr [ebp-18]
 004B92D3    mov         dword ptr [ebx*8+5E1654],eax;gvar_005E1654
 004B92DA    cmp         byte ptr [ebp+0C],0
>004B92DE    je          004B92F0
 004B92E0    push        1
 004B92E2    mov         ecx,dword ptr [ebp-10]
 004B92E5    mov         edx,dword ptr [ebp-4]
 004B92E8    mov         al,byte ptr [ebp-5]
 004B92EB    call        004B9408
 004B92F0    xor         eax,eax
 004B92F2    pop         edx
 004B92F3    pop         ecx
 004B92F4    pop         ecx
 004B92F5    mov         dword ptr fs:[eax],edx
 004B92F8    push        4B931D
 004B92FD    lea         eax,[ebp-1C]
 004B9300    call        @LStrClr
 004B9305    lea         eax,[ebp-0C]
 004B9308    call        @LStrClr
 004B930D    lea         eax,[ebp+10]
 004B9310    call        @LStrClr
 004B9315    ret
>004B9316    jmp         @HandleFinally
>004B931B    jmp         004B92FD
 004B931D    pop         edi
 004B931E    pop         esi
 004B931F    pop         ebx
 004B9320    mov         esp,ebp
 004B9322    pop         ebp
 004B9323    ret         0C
end;*}

//004B9328
{*procedure sub_004B9328(?:?);
begin
 004B9328    push        ebp
 004B9329    mov         ebp,esp
 004B932B    push        0
 004B932D    push        ebx
 004B932E    push        esi
 004B932F    push        edi
 004B9330    mov         ebx,eax
 004B9332    xor         eax,eax
 004B9334    push        ebp
 004B9335    push        4B93D4
 004B933A    push        dword ptr fs:[eax]
 004B933D    mov         dword ptr fs:[eax],esp
 004B9340    xor         eax,eax
 004B9342    mov         al,bl
 004B9344    mov         esi,eax
 004B9346    add         esi,esi
 004B9348    cmp         dword ptr [esi*8+5E1648],0;gvar_005E1648:AnsiString
>004B9350    je          004B93BE
 004B9352    mov         eax,dword ptr [esi*8+5E1648];gvar_005E1648:AnsiString
 004B9359    call        @LStrLen
 004B935E    test        eax,eax
>004B9360    jle         004B93AC
 004B9362    mov         esi,eax
 004B9364    mov         edi,1
 004B9369    xor         eax,eax
 004B936B    mov         al,bl
 004B936D    add         eax,eax
 004B936F    mov         eax,dword ptr [eax*8+5E1648];gvar_005E1648:AnsiString
 004B9376    cmp         byte ptr [eax+edi-1],20
>004B937B    je          004B93A8
 004B937D    lea         ecx,[ebp-4]
 004B9380    mov         edx,edi
 004B9382    mov         eax,ebx
 004B9384    call        004B8F20
 004B9389    mov         edx,dword ptr [ebp-4]
 004B938C    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B9391    mov         eax,dword ptr [eax]
 004B9393    mov         eax,dword ptr [eax+2F8]
 004B9399    mov         eax,dword ptr [eax+34]
 004B939C    xor         ecx,ecx
 004B939E    call        0047D35C
 004B93A3    call        TObject.Free
 004B93A8    inc         edi
 004B93A9    dec         esi
>004B93AA    jne         004B9369
 004B93AC    xor         eax,eax
 004B93AE    mov         al,bl
 004B93B0    add         eax,eax
 004B93B2    lea         eax,[eax*8+5E1648];gvar_005E1648:AnsiString
 004B93B9    call        @LStrClr
 004B93BE    xor         eax,eax
 004B93C0    pop         edx
 004B93C1    pop         ecx
 004B93C2    pop         ecx
 004B93C3    mov         dword ptr fs:[eax],edx
 004B93C6    push        4B93DB
 004B93CB    lea         eax,[ebp-4]
 004B93CE    call        @LStrClr
 004B93D3    ret
>004B93D4    jmp         @HandleFinally
>004B93D9    jmp         004B93CB
 004B93DB    pop         edi
 004B93DC    pop         esi
 004B93DD    pop         ebx
 004B93DE    pop         ecx
 004B93DF    pop         ebp
 004B93E0    ret
end;*}

//004B93E4
{*procedure sub_004B93E4(?:?);
begin
 004B93E4    push        ebx
 004B93E5    push        ecx
 004B93E6    mov         byte ptr [esp],al
 004B93E9    xor         ebx,ebx
 004B93EB    cmp         byte ptr [esp],0
>004B93EF    jne         004B93F6
 004B93F1    cmp         bl,9
>004B93F4    je          004B93FD
 004B93F6    mov         eax,ebx
 004B93F8    call        004B9328
 004B93FD    inc         ebx
 004B93FE    cmp         bl,1B
>004B9401    jne         004B93EB
 004B9403    pop         edx
 004B9404    pop         ebx
 004B9405    ret
end;*}

//004B9408
{*procedure sub_004B9408(?:?; ?:?; ?:?; ?:?);
begin
 004B9408    push        ebp
 004B9409    mov         ebp,esp
 004B940B    add         esp,0FFFFFFEC
 004B940E    push        ebx
 004B940F    push        esi
 004B9410    push        edi
 004B9411    xor         ebx,ebx
 004B9413    mov         dword ptr [ebp-10],ebx
 004B9416    mov         dword ptr [ebp-8],ecx
 004B9419    mov         dword ptr [ebp-4],edx
 004B941C    mov         ebx,eax
 004B941E    xor         eax,eax
 004B9420    push        ebp
 004B9421    push        4B955D
 004B9426    push        dword ptr fs:[eax]
 004B9429    mov         dword ptr fs:[eax],esp
 004B942C    xor         eax,eax
 004B942E    mov         al,bl
 004B9430    mov         esi,eax
 004B9432    add         esi,esi
 004B9434    cmp         dword ptr [esi*8+5E1648],0;gvar_005E1648:AnsiString
>004B943C    je          004B9547
 004B9442    cmp         byte ptr [ebp+8],0
>004B9446    je          004B944C
 004B9448    mov         cl,2
>004B944A    jmp         004B944E
 004B944C    mov         cl,1
 004B944E    mov         eax,dword ptr [esi*8+5E1654];gvar_005E1654
 004B9455    xor         edx,edx
 004B9457    mov         dl,cl
 004B9459    mov         ecx,edx
 004B945B    cdq
 004B945C    idiv        eax,ecx
 004B945E    sub         dword ptr [ebp-4],eax
 004B9461    xor         eax,eax
 004B9463    mov         al,bl
 004B9465    mov         esi,eax
 004B9467    add         esi,esi
 004B9469    mov         eax,dword ptr [esi*8+5E164C];gvar_005E164C
 004B9470    cmp         eax,dword ptr [ebp-4]
>004B9473    jne         004B9485
 004B9475    mov         eax,dword ptr [esi*8+5E1650];gvar_005E1650
 004B947C    cmp         eax,dword ptr [ebp-8]
>004B947F    je          004B9547
 004B9485    mov         eax,dword ptr [esi*8+5E1648];gvar_005E1648:AnsiString
 004B948C    call        @LStrLen
 004B9491    mov         edi,eax
 004B9493    test        edi,edi
>004B9495    jle         004B952D
 004B949B    mov         esi,1
 004B94A0    xor         eax,eax
 004B94A2    mov         al,bl
 004B94A4    add         eax,eax
 004B94A6    mov         eax,dword ptr [eax*8+5E1648];gvar_005E1648:AnsiString
 004B94AD    cmp         byte ptr [eax+esi-1],20
>004B94B2    je          004B9525
 004B94B4    lea         ecx,[ebp-10]
 004B94B7    mov         edx,esi
 004B94B9    mov         eax,ebx
 004B94BB    call        004B8F20
 004B94C0    mov         edx,dword ptr [ebp-10]
 004B94C3    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B94C8    mov         eax,dword ptr [eax]
 004B94CA    mov         eax,dword ptr [eax+2F8]
 004B94D0    mov         eax,dword ptr [eax+34]
 004B94D3    xor         ecx,ecx
 004B94D5    call        0047D35C
 004B94DA    mov         edx,dword ptr ds:[4A11D4];TGLHUDSprite
 004B94E0    call        @AsClass
 004B94E5    mov         dword ptr [ebp-0C],eax
 004B94E8    mov         eax,dword ptr [ebp-0C]
 004B94EB    mov         eax,dword ptr [eax+0C];TGLHUDSprite.Tag:Integer
 004B94EE    add         eax,dword ptr [ebp-4]
 004B94F1    mov         dword ptr [ebp-14],eax
 004B94F4    fild        dword ptr [ebp-14]
 004B94F7    add         esp,0FFFFFFFC
 004B94FA    fstp        dword ptr [esp]
 004B94FD    wait
 004B94FE    mov         eax,dword ptr [ebp-0C]
 004B9501    mov         eax,dword ptr [eax+44];TGLHUDSprite.?f44:TGLCoordinates
 004B9504    xor         edx,edx
 004B9506    call        TGLCoordinates.SetX
 004B950B    fild        dword ptr [ebp-8]
 004B950E    add         esp,0FFFFFFFC
 004B9511    fstp        dword ptr [esp]
 004B9514    wait
 004B9515    mov         eax,dword ptr [ebp-0C]
 004B9518    mov         eax,dword ptr [eax+44];TGLHUDSprite.?f44:TGLCoordinates
 004B951B    mov         edx,1
 004B9520    call        TGLCoordinates.SetX
 004B9525    inc         esi
 004B9526    dec         edi
>004B9527    jne         004B94A0
 004B952D    xor         eax,eax
 004B952F    mov         al,bl
 004B9531    add         eax,eax
 004B9533    mov         edx,dword ptr [ebp-4]
 004B9536    mov         dword ptr [eax*8+5E164C],edx;gvar_005E164C
 004B953D    mov         edx,dword ptr [ebp-8]
 004B9540    mov         dword ptr [eax*8+5E1650],edx;gvar_005E1650
 004B9547    xor         eax,eax
 004B9549    pop         edx
 004B954A    pop         ecx
 004B954B    pop         ecx
 004B954C    mov         dword ptr fs:[eax],edx
 004B954F    push        4B9564
 004B9554    lea         eax,[ebp-10]
 004B9557    call        @LStrClr
 004B955C    ret
>004B955D    jmp         @HandleFinally
>004B9562    jmp         004B9554
 004B9564    pop         edi
 004B9565    pop         esi
 004B9566    pop         ebx
 004B9567    mov         esp,ebp
 004B9569    pop         ebp
 004B956A    ret         4
end;*}

//004B9570
{*procedure sub_004B9570(?:?; ?:?);
begin
 004B9570    push        ebp
 004B9571    mov         ebp,esp
 004B9573    push        0
 004B9575    push        ebx
 004B9576    push        esi
 004B9577    push        edi
 004B9578    mov         ebx,eax
 004B957A    xor         eax,eax
 004B957C    push        ebp
 004B957D    push        4B964A
 004B9582    push        dword ptr fs:[eax]
 004B9585    mov         dword ptr fs:[eax],esp
 004B9588    xor         eax,eax
 004B958A    mov         al,bl
 004B958C    mov         esi,eax
 004B958E    add         esi,esi
 004B9590    cmp         dword ptr [esi*8+5E1648],0;gvar_005E1648:AnsiString
>004B9598    je          004B9634
 004B959E    mov         eax,dword ptr [esi*8+5E1648];gvar_005E1648:AnsiString
 004B95A5    call        @LStrLen
 004B95AA    test        eax,eax
>004B95AC    jle         004B9634
 004B95B2    mov         esi,eax
 004B95B4    mov         edi,1
 004B95B9    xor         eax,eax
 004B95BB    mov         al,bl
 004B95BD    add         eax,eax
 004B95BF    mov         eax,dword ptr [eax*8+5E1648];gvar_005E1648:AnsiString
 004B95C6    cmp         byte ptr [eax+edi-1],20
>004B95CB    je          004B9630
 004B95CD    lea         ecx,[ebp-4]
 004B95D0    mov         edx,edi
 004B95D2    mov         eax,ebx
 004B95D4    call        004B8F20
 004B95D9    mov         edx,dword ptr [ebp-4]
 004B95DC    mov         eax,[005AE734];^gvar_005F5524:TForm1
 004B95E1    mov         eax,dword ptr [eax]
 004B95E3    mov         eax,dword ptr [eax+2F8]
 004B95E9    mov         eax,dword ptr [eax+34]
 004B95EC    xor         ecx,ecx
 004B95EE    call        0047D35C
 004B95F3    mov         edx,dword ptr ds:[4A11D4];TGLHUDSprite
 004B95F9    call        @AsClass
 004B95FE    mov         edx,eax
 004B9600    mov         eax,dword ptr [edx+90];TGLHUDSprite.?f90:TGLMaterial
 004B9606    mov         eax,dword ptr [eax+18];TGLMaterial.FrontProperties:TGLFaceProperties
 004B9609    mov         eax,dword ptr [eax+1C];TGLFaceProperties.Diffuse:TGLColor
 004B960C    fld         dword ptr [eax+24];TGLColor.Alpha:Single
 004B960F    fcomp       dword ptr [ebp+8]
 004B9612    fnstsw      al
 004B9614    sahf
>004B9615    je          004B9634
 004B9617    push        dword ptr [ebp+8]
 004B961A    mov         eax,dword ptr [edx+90];TGLHUDSprite.?f90:TGLMaterial
 004B9620    mov         eax,dword ptr [eax+18];TGLMaterial.FrontProperties:TGLFaceProperties
 004B9623    mov         eax,dword ptr [eax+1C];TGLFaceProperties.Diffuse:TGLColor
 004B9626    mov         edx,3
 004B962B    call        TGLColor.SetRed
 004B9630    inc         edi
 004B9631    dec         esi
>004B9632    jne         004B95B9
 004B9634    xor         eax,eax
 004B9636    pop         edx
 004B9637    pop         ecx
 004B9638    pop         ecx
 004B9639    mov         dword ptr fs:[eax],edx
 004B963C    push        4B9651
 004B9641    lea         eax,[ebp-4]
 004B9644    call        @LStrClr
 004B9649    ret
>004B964A    jmp         @HandleFinally
>004B964F    jmp         004B9641
 004B9651    pop         edi
 004B9652    pop         esi
 004B9653    pop         ebx
 004B9654    pop         ecx
 004B9655    pop         ebp
 004B9656    ret         4
end;*}

Initialization
Finalization
//004B965C
{*
 004B965C    push        ebp
 004B965D    mov         ebp,esp
 004B965F    xor         eax,eax
 004B9661    push        ebp
 004B9662    push        4B9698
 004B9667    push        dword ptr fs:[eax]
 004B966A    mov         dword ptr fs:[eax],esp
 004B966D    inc         dword ptr ds:[5E17F8]
>004B9673    jne         004B968A
 004B9675    mov         eax,5E1648;gvar_005E1648:AnsiString
 004B967A    mov         ecx,1B
 004B967F    mov         edx,dword ptr ds:[4B8548];THlaska
 004B9685    call        @FinalizeArray
 004B968A    xor         eax,eax
 004B968C    pop         edx
 004B968D    pop         ecx
 004B968E    pop         ecx
 004B968F    mov         dword ptr fs:[eax],edx
 004B9692    push        4B969F
 004B9697    ret
>004B9698    jmp         @HandleFinally
>004B969D    jmp         004B9697
 004B969F    pop         ebp
 004B96A0    ret
*}
end.