//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit118;

interface

uses
  SysUtils, Classes;

    //function sub_004A370C(?:?; ?:?; ?:?; ?:?):?;//004A370C
    //function sub_004A3760(?:?; ?:?):?;//004A3760
    //function sub_004A37A0(?:?; ?:?; ?:?):?;//004A37A0
    //procedure sub_004A3C1C(?:?);//004A3C1C
    //procedure sub_004A4684(?:?; ?:?; ?:?; ?:?; ?:?);//004A4684
    procedure sub_004A46E4;//004A46E4

implementation

//004A370C
{*function sub_004A370C(?:?; ?:?; ?:?; ?:?):?;
begin
 004A370C    push        ebp
 004A370D    mov         ebp,esp
 004A370F    push        esi
 004A3710    cmp         byte ptr [ebp+8],0
>004A3714    jne         004A3738
 004A3716    sub         al,1
>004A3718    jb          004A3726
>004A371A    je          004A372A
 004A371C    dec         al
>004A371E    je          004A372F
 004A3720    dec         al
>004A3722    je          004A3733
>004A3724    jmp         004A3758
 004A3726    mov         esi,edx
>004A3728    jmp         004A3758
 004A372A    mov         esi,edx
 004A372C    dec         esi
>004A372D    jmp         004A3758
 004A372F    mov         esi,edx
>004A3731    jmp         004A3758
 004A3733    lea         esi,[edx+1]
>004A3736    jmp         004A3758
 004A3738    sub         al,1
>004A373A    jb          004A3748
>004A373C    je          004A374D
 004A373E    dec         al
>004A3740    je          004A3751
 004A3742    dec         al
>004A3744    je          004A3756
>004A3746    jmp         004A3758
 004A3748    mov         esi,ecx
 004A374A    dec         esi
>004A374B    jmp         004A3758
 004A374D    mov         esi,ecx
>004A374F    jmp         004A3758
 004A3751    lea         esi,[ecx+1]
>004A3754    jmp         004A3758
 004A3756    mov         esi,ecx
 004A3758    mov         eax,esi
 004A375A    pop         esi
 004A375B    pop         ebp
 004A375C    ret         4
end;*}

//004A3760
{*function sub_004A3760(?:?; ?:?):?;
begin
 004A3760    push        ebp
 004A3761    mov         ebp,esp
 004A3763    add         esp,0FFFFFFF4
 004A3766    push        esi
 004A3767    push        edi
 004A3768    mov         esi,eax
 004A376A    lea         edi,[ebp-0C]
 004A376D    movs        dword ptr [edi],dword ptr [esi]
 004A376E    movs        dword ptr [edi],dword ptr [esi]
 004A376F    movs        dword ptr [edi],dword ptr [esi]
 004A3770    mov         eax,dword ptr [ebp+8]
 004A3773    mov         eax,dword ptr [eax-4]
 004A3776    cmp         eax,dword ptr [ebp-0C]
>004A3779    jne         004A3791
 004A377B    mov         eax,dword ptr [ebp+8]
 004A377E    mov         eax,dword ptr [eax-8]
 004A3781    cmp         eax,dword ptr [ebp-8]
>004A3784    jne         004A3791
 004A3786    mov         eax,dword ptr [ebp+8]
 004A3789    mov         al,byte ptr [eax-9]
 004A378C    cmp         al,byte ptr [ebp-4]
>004A378F    je          004A3795
 004A3791    xor         eax,eax
>004A3793    jmp         004A3797
 004A3795    mov         al,1
 004A3797    pop         edi
 004A3798    pop         esi
 004A3799    mov         esp,ebp
 004A379B    pop         ebp
 004A379C    ret
end;*}

//004A37A0
{*function sub_004A37A0(?:?; ?:?; ?:?):?;
begin
 004A37A0    push        ebp
 004A37A1    mov         ebp,esp
 004A37A3    add         esp,0FFFFFFF4
 004A37A6    push        ebx
 004A37A7    push        esi
 004A37A8    push        edi
 004A37A9    mov         dword ptr [ebp-8],ecx
 004A37AC    mov         dword ptr [ebp-4],edx
 004A37AF    mov         byte ptr [ebp-9],al
 004A37B2    xor         ebx,ebx
 004A37B4    mov         eax,[005AE224];^gvar_005F5577
 004A37B9    cmp         byte ptr [eax],2
>004A37BC    jne         004A3C12
 004A37C2    cmp         byte ptr [ebp-9],0C8
>004A37C6    je          004A37FB
 004A37C8    push        1
 004A37CA    mov         ecx,dword ptr [ebp-8]
 004A37CD    mov         edx,dword ptr [ebp-4]
 004A37D0    mov         al,byte ptr [ebp-9]
 004A37D3    call        004A370C
 004A37D8    mov         ebx,eax
 004A37DA    push        0
 004A37DC    mov         ecx,dword ptr [ebp-8]
 004A37DF    mov         edx,dword ptr [ebp-4]
 004A37E2    mov         al,byte ptr [ebp-9]
 004A37E5    call        004A370C
 004A37EA    add         eax,eax
 004A37EC    lea         eax,[eax+eax*2]
 004A37EF    mov         edx,dword ptr ds:[5AE240];^gvar_005F6204
 004A37F5    lea         eax,[edx+eax*8]
 004A37F8    mov         bl,byte ptr [eax+ebx*2]
 004A37FB    mov         edi,13
 004A3800    mov         esi,dword ptr ds:[5AE4B8];^gvar_005F5F0C
 004A3806    add         esi,24
 004A3809    cmp         byte ptr [esi],0
>004A380C    je          004A3834
 004A380E    push        ebp
 004A380F    lea         eax,[esi-18]
 004A3812    call        004A3760
 004A3817    pop         ecx
 004A3818    test        al,al
>004A381A    jne         004A382A
 004A381C    push        ebp
 004A381D    lea         eax,[esi-0C]
 004A3820    call        004A3760
 004A3825    pop         ecx
 004A3826    test        al,al
>004A3828    je          004A3834
 004A382A    cmp         byte ptr [esi-24],2
>004A382E    je          004A3834
 004A3830    xor         ebx,ebx
>004A3832    jmp         004A383A
 004A3834    add         esi,28
 004A3837    dec         edi
>004A3838    jne         004A3809
 004A383A    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A383F    cmp         byte ptr [eax+1F0],2
>004A3846    jne         004A3870
 004A3848    cmp         dword ptr [ebp-4],12
>004A384C    jne         004A385C
 004A384E    cmp         dword ptr [ebp-8],11
>004A3852    jne         004A385C
 004A3854    cmp         byte ptr [ebp-9],2
>004A3858    jne         004A385C
 004A385A    xor         ebx,ebx
 004A385C    cmp         dword ptr [ebp-4],12
>004A3860    jne         004A3870
 004A3862    cmp         dword ptr [ebp-8],12
>004A3866    jne         004A3870
 004A3868    cmp         byte ptr [ebp-9],0
>004A386C    jne         004A3870
 004A386E    xor         ebx,ebx
 004A3870    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A3875    cmp         byte ptr [eax+1F0],3
>004A387C    jne         004A38E2
 004A387E    cmp         dword ptr [ebp-4],8
>004A3882    jne         004A3892
 004A3884    cmp         dword ptr [ebp-8],4
>004A3888    jne         004A3892
 004A388A    cmp         byte ptr [ebp-9],3
>004A388E    jne         004A3892
 004A3890    xor         ebx,ebx
 004A3892    cmp         dword ptr [ebp-4],3
>004A3896    jne         004A38A6
 004A3898    cmp         dword ptr [ebp-8],4
>004A389C    jne         004A38A6
 004A389E    cmp         byte ptr [ebp-9],0
>004A38A2    jne         004A38A6
 004A38A4    xor         ebx,ebx
 004A38A6    cmp         dword ptr [ebp-4],3
>004A38AA    jne         004A38BA
 004A38AC    cmp         dword ptr [ebp-8],4
>004A38B0    jne         004A38BA
 004A38B2    cmp         byte ptr [ebp-9],1
>004A38B6    jne         004A38BA
 004A38B8    xor         ebx,ebx
 004A38BA    cmp         dword ptr [ebp-4],2
>004A38BE    jne         004A38CE
 004A38C0    cmp         dword ptr [ebp-8],4
>004A38C4    jne         004A38CE
 004A38C6    cmp         byte ptr [ebp-9],3
>004A38CA    jne         004A38CE
 004A38CC    xor         ebx,ebx
 004A38CE    cmp         dword ptr [ebp-4],3
>004A38D2    jne         004A38E2
 004A38D4    cmp         dword ptr [ebp-8],3
>004A38D8    jne         004A38E2
 004A38DA    cmp         byte ptr [ebp-9],2
>004A38DE    jne         004A38E2
 004A38E0    xor         ebx,ebx
 004A38E2    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A38E7    cmp         byte ptr [eax+1F0],4
>004A38EE    jne         004A39A3
 004A38F4    cmp         dword ptr [ebp-4],0D
>004A38F8    jne         004A3908
 004A38FA    cmp         dword ptr [ebp-8],0C
>004A38FE    jne         004A3908
 004A3900    cmp         byte ptr [ebp-9],1
>004A3904    jne         004A3908
 004A3906    xor         ebx,ebx
 004A3908    cmp         dword ptr [ebp-4],0C
>004A390C    jne         004A392B
 004A390E    cmp         dword ptr [ebp-8],7
>004A3912    jne         004A392B
 004A3914    cmp         byte ptr [ebp-9],3
>004A3918    jne         004A392B
 004A391A    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A391F    cmp         word ptr [eax+26C],2
>004A3927    je          004A392B
 004A3929    xor         ebx,ebx
 004A392B    cmp         dword ptr [ebp-4],9
>004A392F    jne         004A393F
 004A3931    cmp         dword ptr [ebp-8],0D
>004A3935    jne         004A393F
 004A3937    cmp         byte ptr [ebp-9],0
>004A393B    jne         004A393F
 004A393D    xor         ebx,ebx
 004A393F    cmp         dword ptr [ebp-4],0A
>004A3943    jne         004A3953
 004A3945    cmp         dword ptr [ebp-8],0C
>004A3949    jne         004A3953
 004A394B    cmp         byte ptr [ebp-9],1
>004A394F    jne         004A3953
 004A3951    xor         ebx,ebx
 004A3953    cmp         dword ptr [ebp-4],9
>004A3957    jne         004A3967
 004A3959    cmp         dword ptr [ebp-8],0B
>004A395D    jne         004A3967
 004A395F    cmp         byte ptr [ebp-9],2
>004A3963    jne         004A3967
 004A3965    xor         ebx,ebx
 004A3967    cmp         dword ptr [ebp-4],9
>004A396B    jne         004A397B
 004A396D    cmp         dword ptr [ebp-8],0C
>004A3971    jne         004A397B
 004A3973    cmp         byte ptr [ebp-9],3
>004A3977    jne         004A397B
 004A3979    xor         ebx,ebx
 004A397B    cmp         dword ptr [ebp-4],9
>004A397F    jne         004A398F
 004A3981    cmp         dword ptr [ebp-8],0C
>004A3985    jne         004A398F
 004A3987    cmp         byte ptr [ebp-9],2
>004A398B    jne         004A398F
 004A398D    xor         ebx,ebx
 004A398F    cmp         dword ptr [ebp-4],9
>004A3993    jne         004A39A3
 004A3995    cmp         dword ptr [ebp-8],0C
>004A3999    jne         004A39A3
 004A399B    cmp         byte ptr [ebp-9],0
>004A399F    jne         004A39A3
 004A39A1    xor         ebx,ebx
 004A39A3    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A39A8    cmp         byte ptr [eax+1F0],0C
>004A39AF    jne         004A3A73
 004A39B5    cmp         dword ptr [ebp-4],6
>004A39B9    jne         004A39D8
 004A39BB    cmp         dword ptr [ebp-8],0D
>004A39BF    jne         004A39D8
 004A39C1    cmp         byte ptr [ebp-9],2
>004A39C5    jne         004A39D8
 004A39C7    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A39CC    cmp         word ptr [eax+306],2
>004A39D4    jae         004A39D8
 004A39D6    xor         ebx,ebx
 004A39D8    cmp         dword ptr [ebp-4],0A
>004A39DC    jne         004A39FB
 004A39DE    cmp         dword ptr [ebp-8],9
>004A39E2    jne         004A39FB
 004A39E4    cmp         byte ptr [ebp-9],0
>004A39E8    jne         004A39FB
 004A39EA    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A39EF    cmp         word ptr [eax+27E],6
>004A39F7    je          004A39FB
 004A39F9    xor         ebx,ebx
 004A39FB    cmp         dword ptr [ebp-4],8
>004A39FF    jne         004A3A0F
 004A3A01    cmp         dword ptr [ebp-8],0F
>004A3A05    jne         004A3A0F
 004A3A07    cmp         byte ptr [ebp-9],0
>004A3A0B    jne         004A3A0F
 004A3A0D    xor         ebx,ebx
 004A3A0F    cmp         dword ptr [ebp-4],9
>004A3A13    jne         004A3A23
 004A3A15    cmp         dword ptr [ebp-8],0F
>004A3A19    jne         004A3A23
 004A3A1B    cmp         byte ptr [ebp-9],0
>004A3A1F    jne         004A3A23
 004A3A21    xor         ebx,ebx
 004A3A23    cmp         dword ptr [ebp-4],9
>004A3A27    jne         004A3A37
 004A3A29    cmp         dword ptr [ebp-8],0E
>004A3A2D    jne         004A3A37
 004A3A2F    cmp         byte ptr [ebp-9],2
>004A3A33    jne         004A3A37
 004A3A35    xor         ebx,ebx
 004A3A37    cmp         dword ptr [ebp-4],9
>004A3A3B    jne         004A3A4B
 004A3A3D    cmp         dword ptr [ebp-8],0E
>004A3A41    jne         004A3A4B
 004A3A43    cmp         byte ptr [ebp-9],0
>004A3A47    jne         004A3A4B
 004A3A49    xor         ebx,ebx
 004A3A4B    cmp         dword ptr [ebp-4],8
>004A3A4F    jne         004A3A5F
 004A3A51    cmp         dword ptr [ebp-8],0E
>004A3A55    jne         004A3A5F
 004A3A57    cmp         byte ptr [ebp-9],2
>004A3A5B    jne         004A3A5F
 004A3A5D    xor         ebx,ebx
 004A3A5F    cmp         dword ptr [ebp-4],9
>004A3A63    jne         004A3A73
 004A3A65    cmp         dword ptr [ebp-8],0D
>004A3A69    jne         004A3A73
 004A3A6B    cmp         byte ptr [ebp-9],2
>004A3A6F    jne         004A3A73
 004A3A71    xor         ebx,ebx
 004A3A73    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A3A78    cmp         byte ptr [eax+1F0],0D
>004A3A7F    jne         004A3AF4
 004A3A81    cmp         dword ptr [ebp-4],7
>004A3A85    jne         004A3A95
 004A3A87    cmp         dword ptr [ebp-8],10
>004A3A8B    jne         004A3A95
 004A3A8D    cmp         byte ptr [ebp-9],2
>004A3A91    jne         004A3A95
 004A3A93    xor         ebx,ebx
 004A3A95    cmp         dword ptr [ebp-4],7
>004A3A99    jne         004A3AA9
 004A3A9B    cmp         dword ptr [ebp-8],9
>004A3A9F    jne         004A3AA9
 004A3AA1    cmp         byte ptr [ebp-9],3
>004A3AA5    jne         004A3AA9
 004A3AA7    xor         ebx,ebx
 004A3AA9    cmp         dword ptr [ebp-4],8
>004A3AAD    jne         004A3ABD
 004A3AAF    cmp         dword ptr [ebp-8],9
>004A3AB3    jne         004A3ABD
 004A3AB5    cmp         byte ptr [ebp-9],1
>004A3AB9    jne         004A3ABD
 004A3ABB    xor         ebx,ebx
 004A3ABD    cmp         dword ptr [ebp-4],0E
>004A3AC1    jne         004A3AE0
 004A3AC3    cmp         dword ptr [ebp-8],10
>004A3AC7    jne         004A3AE0
 004A3AC9    cmp         byte ptr [ebp-9],0
>004A3ACD    jne         004A3AE0
 004A3ACF    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A3AD4    cmp         word ptr [eax+29C],2
>004A3ADC    jae         004A3AE0
 004A3ADE    xor         ebx,ebx
 004A3AE0    cmp         dword ptr [ebp-4],0B
>004A3AE4    jne         004A3AF4
 004A3AE6    cmp         dword ptr [ebp-8],9
>004A3AEA    jne         004A3AF4
 004A3AEC    cmp         byte ptr [ebp-9],0
>004A3AF0    jne         004A3AF4
 004A3AF2    xor         ebx,ebx
 004A3AF4    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A3AF9    cmp         byte ptr [eax+1F0],8
>004A3B00    jne         004A3BA6
 004A3B06    cmp         dword ptr [ebp-4],9
>004A3B0A    jne         004A3B1A
 004A3B0C    cmp         dword ptr [ebp-8],5
>004A3B10    jne         004A3B1A
 004A3B12    cmp         byte ptr [ebp-9],3
>004A3B16    jne         004A3B1A
 004A3B18    xor         ebx,ebx
 004A3B1A    cmp         dword ptr [ebp-4],9
>004A3B1E    jne         004A3B2E
 004A3B20    cmp         dword ptr [ebp-8],6
>004A3B24    jne         004A3B2E
 004A3B26    cmp         byte ptr [ebp-9],1
>004A3B2A    jne         004A3B2E
 004A3B2C    xor         ebx,ebx
 004A3B2E    cmp         dword ptr [ebp-4],9
>004A3B32    jne         004A3B42
 004A3B34    cmp         dword ptr [ebp-8],7
>004A3B38    jne         004A3B42
 004A3B3A    cmp         byte ptr [ebp-9],1
>004A3B3E    jne         004A3B42
 004A3B40    xor         ebx,ebx
 004A3B42    cmp         dword ptr [ebp-4],0A
>004A3B46    jne         004A3B56
 004A3B48    cmp         dword ptr [ebp-8],5
>004A3B4C    jne         004A3B56
 004A3B4E    cmp         byte ptr [ebp-9],1
>004A3B52    jne         004A3B56
 004A3B54    xor         ebx,ebx
 004A3B56    cmp         dword ptr [ebp-4],8
>004A3B5A    jne         004A3B6A
 004A3B5C    cmp         dword ptr [ebp-8],6
>004A3B60    jne         004A3B6A
 004A3B62    cmp         byte ptr [ebp-9],3
>004A3B66    jne         004A3B6A
 004A3B68    xor         ebx,ebx
 004A3B6A    cmp         dword ptr [ebp-4],4
>004A3B6E    jne         004A3B7E
 004A3B70    cmp         dword ptr [ebp-8],6
>004A3B74    jne         004A3B7E
 004A3B76    cmp         byte ptr [ebp-9],2
>004A3B7A    jne         004A3B7E
 004A3B7C    xor         ebx,ebx
 004A3B7E    cmp         dword ptr [ebp-4],4
>004A3B82    jne         004A3B92
 004A3B84    cmp         dword ptr [ebp-8],8
>004A3B88    jne         004A3B92
 004A3B8A    cmp         byte ptr [ebp-9],0
>004A3B8E    jne         004A3B92
 004A3B90    xor         ebx,ebx
 004A3B92    cmp         dword ptr [ebp-4],4
>004A3B96    jne         004A3BA6
 004A3B98    cmp         dword ptr [ebp-8],4
>004A3B9C    jne         004A3BA6
 004A3B9E    cmp         byte ptr [ebp-9],0
>004A3BA2    jne         004A3BA6
 004A3BA4    xor         ebx,ebx
 004A3BA6    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A3BAB    cmp         byte ptr [eax+1F0],0A
>004A3BB2    jne         004A3BC8
 004A3BB4    cmp         dword ptr [ebp-4],12
>004A3BB8    jne         004A3BC8
 004A3BBA    cmp         dword ptr [ebp-8],3
>004A3BBE    jne         004A3BC8
 004A3BC0    cmp         byte ptr [ebp-9],0
>004A3BC4    jne         004A3BC8
 004A3BC6    xor         ebx,ebx
 004A3BC8    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A3BCD    cmp         byte ptr [eax+1F0],0B
>004A3BD4    jne         004A3BFE
 004A3BD6    cmp         dword ptr [ebp-4],7
>004A3BDA    jne         004A3BEA
 004A3BDC    cmp         dword ptr [ebp-8],0F
>004A3BE0    jne         004A3BEA
 004A3BE2    cmp         byte ptr [ebp-9],1
>004A3BE6    jne         004A3BEA
 004A3BE8    xor         ebx,ebx
 004A3BEA    cmp         dword ptr [ebp-4],0B
>004A3BEE    jne         004A3BFE
 004A3BF0    cmp         dword ptr [ebp-8],0D
>004A3BF4    jne         004A3BFE
 004A3BF6    cmp         byte ptr [ebp-9],0
>004A3BFA    jne         004A3BFE
 004A3BFC    xor         ebx,ebx
 004A3BFE    mov         eax,[005AE258];^gvar_005AE0D0
 004A3C03    cmp         byte ptr [eax],0
>004A3C06    je          004A3C0A
 004A3C08    mov         bl,1
 004A3C0A    cmp         byte ptr [ebp-9],0C8
>004A3C0E    jne         004A3C12
 004A3C10    xor         ebx,ebx
 004A3C12    mov         eax,ebx
 004A3C14    pop         edi
 004A3C15    pop         esi
 004A3C16    pop         ebx
 004A3C17    mov         esp,ebp
 004A3C19    pop         ebp
 004A3C1A    ret
end;*}

//004A3C1C
{*procedure sub_004A3C1C(?:?);
begin
 004A3C1C    push        ebx
 004A3C1D    push        esi
 004A3C1E    push        ecx
 004A3C1F    mov         ecx,dword ptr ds:[5AE240];^gvar_005F6204
 004A3C25    mov         esi,18
 004A3C2A    mov         dword ptr [esp],ecx
 004A3C2D    mov         ebx,18
 004A3C32    mov         edx,dword ptr [esp]
 004A3C35    mov         byte ptr [edx],0
 004A3C38    mov         byte ptr [edx+1],0
 004A3C3C    add         edx,30
 004A3C3F    dec         ebx
>004A3C40    jne         004A3C35
 004A3C42    add         dword ptr [esp],2
 004A3C46    dec         esi
>004A3C47    jne         004A3C2D
 004A3C49    cmp         al,2
>004A3C4B    jne         004A3C70
 004A3C4D    mov         byte ptr [ecx+384],1
 004A3C54    mov         byte ptr [ecx+3B4],1
 004A3C5B    mov         byte ptr [ecx+382],1
 004A3C62    mov         byte ptr [ecx+3B2],1
 004A3C69    mov         byte ptr [ecx+352],1
 004A3C70    cmp         al,3
>004A3C72    jne         004A3D34
 004A3C78    mov         byte ptr [ecx+98],1
 004A3C7F    mov         byte ptr [ecx+0C0],1
 004A3C86    mov         byte ptr [ecx+1B8],1
 004A3C8D    mov         byte ptr [ecx+0C2],1
 004A3C94    mov         byte ptr [ecx+0C4],1
 004A3C9B    mov         byte ptr [ecx+66],1
 004A3C9F    mov         byte ptr [ecx+96],1
 004A3CA6    mov         byte ptr [ecx+0C6],1
 004A3CAD    mov         byte ptr [ecx+0F6],1
 004A3CB4    mov         byte ptr [ecx+38],1
 004A3CB8    mov         byte ptr [ecx+68],1
 004A3CBC    mov         byte ptr [ecx+0F8],1
 004A3CC3    mov         byte ptr [ecx+128],1
 004A3CCA    mov         byte ptr [ecx+158],1
 004A3CD1    mov         byte ptr [ecx+188],1
 004A3CD8    mov         byte ptr [ecx+6A],1
 004A3CDC    mov         byte ptr [ecx+9A],1
 004A3CE3    mov         byte ptr [ecx+0FA],1
 004A3CEA    mov         byte ptr [ecx+9C],1
 004A3CF1    mov         byte ptr [ecx+0FC],1
 004A3CF8    mov         byte ptr [ecx+6E],1
 004A3CFC    mov         byte ptr [ecx+9E],1
 004A3D03    mov         byte ptr [ecx+0CE],1
 004A3D0A    mov         byte ptr [ecx+0FE],1
 004A3D11    mov         byte ptr [ecx+0D0],1
 004A3D18    mov         byte ptr [ecx+0D2],1
 004A3D1F    mov         byte ptr [ecx+156],1
 004A3D26    mov         byte ptr [ecx+154],1
 004A3D2D    mov         byte ptr [ecx+0D4],1
 004A3D34    cmp         al,4
>004A3D36    jne         004A3E5B
 004A3D3C    mov         byte ptr [ecx+1C8],1
 004A3D43    mov         byte ptr [ecx+258],1
 004A3D4A    mov         byte ptr [ecx+1EF],1
 004A3D51    mov         byte ptr [ecx+1EE],1
 004A3D58    mov         byte ptr [ecx+24A],1
 004A3D5F    mov         byte ptr [ecx+24C],1
 004A3D66    mov         byte ptr [ecx+24E],1
 004A3D6D    mov         byte ptr [ecx+1F0],1
 004A3D74    mov         byte ptr [ecx+250],1
 004A3D7B    mov         byte ptr [ecx+1C2],1
 004A3D82    mov         byte ptr [ecx+1F2],1
 004A3D89    mov         byte ptr [ecx+252],1
 004A3D90    mov         byte ptr [ecx+1C4],1
 004A3D97    mov         byte ptr [ecx+224],1
 004A3D9E    mov         byte ptr [ecx+254],1
 004A3DA5    mov         byte ptr [ecx+284],1
 004A3DAC    mov         byte ptr [ecx+2B4],1
 004A3DB3    mov         byte ptr [ecx+196],1
 004A3DBA    mov         byte ptr [ecx+1C6],1
 004A3DC1    mov         byte ptr [ecx+1F6],1
 004A3DC8    mov         byte ptr [ecx+226],1
 004A3DCF    mov         byte ptr [ecx+2B6],1
 004A3DD6    mov         byte ptr [ecx+2E6],1
 004A3DDD    mov         byte ptr [ecx+138],1
 004A3DE4    mov         byte ptr [ecx+168],1
 004A3DEB    mov         byte ptr [ecx+198],1
 004A3DF2    mov         byte ptr [ecx+1F8],1
 004A3DF9    mov         byte ptr [ecx+288],1
 004A3E00    mov         byte ptr [ecx+2B8],1
 004A3E07    mov         byte ptr [ecx+19A],1
 004A3E0E    mov         byte ptr [ecx+1CA],1
 004A3E15    mov         byte ptr [ecx+1FA],1
 004A3E1C    mov         byte ptr [ecx+22A],1
 004A3E23    mov         byte ptr [ecx+22C],1
 004A3E2A    mov         byte ptr [ecx+25C],1
 004A3E31    mov         byte ptr [ecx+28C],1
 004A3E38    mov         byte ptr [ecx+22E],1
 004A3E3F    mov         byte ptr [ecx+37E],1
 004A3E46    mov         byte ptr [ecx+230],1
 004A3E4D    mov         byte ptr [ecx+27E],1
 004A3E54    mov         byte ptr [ecx+2AE],1
 004A3E5B    cmp         al,1
>004A3E5D    jne         004A4053
 004A3E63    mov         byte ptr [ecx+122],1
 004A3E6A    mov         byte ptr [ecx+0C4],1
 004A3E71    mov         byte ptr [ecx+0F4],1
 004A3E78    mov         byte ptr [ecx+124],1
 004A3E7F    mov         byte ptr [ecx+154],1
 004A3E86    mov         byte ptr [ecx+244],1
 004A3E8D    mov         byte ptr [ecx+66],1
 004A3E91    mov         byte ptr [ecx+96],1
 004A3E98    mov         byte ptr [ecx+0F6],1
 004A3E9F    mov         byte ptr [ecx+156],1
 004A3EA6    mov         byte ptr [ecx+186],1
 004A3EAD    mov         byte ptr [ecx+1B6],1
 004A3EB4    mov         byte ptr [ecx+216],1
 004A3EBB    mov         byte ptr [ecx+246],1
 004A3EC2    mov         byte ptr [ecx+276],1
 004A3EC9    mov         byte ptr [ecx+98],1
 004A3ED0    mov         byte ptr [ecx+0C8],1
 004A3ED7    mov         byte ptr [ecx+0F8],1
 004A3EDE    mov         byte ptr [ecx+128],1
 004A3EE5    mov         byte ptr [ecx+158],1
 004A3EEC    mov         byte ptr [ecx+1B8],1
 004A3EF3    mov         byte ptr [ecx+1E8],1
 004A3EFA    mov         byte ptr [ecx+218],1
 004A3F01    mov         byte ptr [ecx+278],1
 004A3F08    mov         byte ptr [ecx+6A],1
 004A3F0C    mov         byte ptr [ecx+9A],1
 004A3F13    mov         byte ptr [ecx+0FA],1
 004A3F1A    mov         byte ptr [ecx+18A],1
 004A3F21    mov         byte ptr [ecx+1BA],1
 004A3F28    mov         byte ptr [ecx+21A],1
 004A3F2F    mov         byte ptr [ecx+27A],1
 004A3F36    mov         byte ptr [ecx+6C],1
 004A3F3A    mov         byte ptr [ecx+0FC],1
 004A3F41    mov         byte ptr [ecx+12C],1
 004A3F48    mov         byte ptr [ecx+18C],1
 004A3F4F    mov         byte ptr [ecx+21C],1
 004A3F56    mov         byte ptr [ecx+27C],1
 004A3F5D    mov         byte ptr [ecx+6E],1
 004A3F61    mov         byte ptr [ecx+9E],1
 004A3F68    mov         byte ptr [ecx+0CE],1
 004A3F6F    mov         byte ptr [ecx+1BE],1
 004A3F76    mov         byte ptr [ecx+1EE],1
 004A3F7D    mov         byte ptr [ecx+27E],1
 004A3F84    mov         byte ptr [ecx+0A0],1
 004A3F8B    mov         byte ptr [ecx+130],1
 004A3F92    mov         byte ptr [ecx+160],1
 004A3F99    mov         byte ptr [ecx+190],1
 004A3FA0    mov         byte ptr [ecx+1C0],1
 004A3FA7    mov         byte ptr [ecx+220],1
 004A3FAE    mov         byte ptr [ecx+250],1
 004A3FB5    mov         byte ptr [ecx+280],1
 004A3FBC    mov         byte ptr [ecx+2B0],1
 004A3FC3    mov         byte ptr [ecx+0A2],1
 004A3FCA    mov         byte ptr [ecx+0D2],1
 004A3FD1    mov         byte ptr [ecx+102],1
 004A3FD8    mov         byte ptr [ecx+132],1
 004A3FDF    mov         byte ptr [ecx+1C2],1
 004A3FE6    mov         byte ptr [ecx+1F2],1
 004A3FED    mov         byte ptr [ecx+222],1
 004A3FF4    mov         byte ptr [ecx+0D4],1
 004A3FFB    mov         byte ptr [ecx+134],1
 004A4002    mov         byte ptr [ecx+194],1
 004A4009    mov         byte ptr [ecx+1C4],1
 004A4010    mov         byte ptr [ecx+76],1
 004A4014    mov         byte ptr [ecx+0A6],1
 004A401B    mov         byte ptr [ecx+0D6],1
 004A4022    mov         byte ptr [ecx+136],1
 004A4029    mov         byte ptr [ecx+1C6],1
 004A4030    mov         byte ptr [ecx+1F6],1
 004A4037    mov         byte ptr [ecx+0A8],1
 004A403E    mov         byte ptr [ecx+138],1
 004A4045    mov         byte ptr [ecx+1F8],1
 004A404C    mov         byte ptr [ecx+13A],1
 004A4053    cmp         al,6
>004A4055    jne         004A40E3
 004A405B    mov         byte ptr [ecx+180],1
 004A4062    mov         byte ptr [ecx+152],1
 004A4069    mov         byte ptr [ecx+1B2],1
 004A4070    mov         byte ptr [ecx+6E],1
 004A4074    mov         byte ptr [ecx+40],1
 004A4078    mov         byte ptr [ecx+48],1
 004A407C    mov         byte ptr [ecx+7A],1
 004A4080    mov         byte ptr [ecx+4C],1
 004A4084    mov         byte ptr [ecx+0DA],1
 004A408B    mov         byte ptr [ecx+7A],1
 004A408F    mov         byte ptr [ecx+84],1
 004A4096    mov         byte ptr [ecx+86],1
 004A409D    mov         byte ptr [ecx+88],1
 004A40A4    mov         byte ptr [ecx+2C6],1
 004A40AB    mov         byte ptr [ecx+2C2],1
 004A40B2    mov         byte ptr [ecx+256],1
 004A40B9    mov         byte ptr [ecx+252],1
 004A40C0    mov         byte ptr [ecx+21C],1
 004A40C7    mov         byte ptr [ecx+24A],1
 004A40CE    mov         byte ptr [ecx+218],1
 004A40D5    mov         byte ptr [ecx+2AA],1
 004A40DC    mov         byte ptr [ecx+30A],1
 004A40E3    cmp         al,0A
>004A40E5    jne         004A429D
 004A40EB    mov         byte ptr [ecx+0F8],1
 004A40F2    mov         byte ptr [ecx+128],1
 004A40F9    mov         byte ptr [ecx+0FA],1
 004A4100    mov         byte ptr [ecx+0FC],1
 004A4107    mov         byte ptr [ecx+0FE],1
 004A410E    mov         byte ptr [ecx+100],1
 004A4115    mov         byte ptr [ecx+102],1
 004A411C    mov         byte ptr [ecx+104],1
 004A4123    mov         byte ptr [ecx+106],1
 004A412A    mov         byte ptr [ecx+136],1
 004A4131    mov         byte ptr [ecx+166],1
 004A4138    mov         byte ptr [ecx+196],1
 004A413F    mov         byte ptr [ecx+1C6],1
 004A4146    mov         byte ptr [ecx+1F6],1
 004A414D    mov         byte ptr [ecx+1F8],1
 004A4154    mov         byte ptr [ecx+1FA],1
 004A415B    mov         byte ptr [ecx+1FC],1
 004A4162    mov         byte ptr [ecx+1FE],1
 004A4169    mov         byte ptr [ecx+22E],1
 004A4170    mov         byte ptr [ecx+25E],1
 004A4177    mov         byte ptr [ecx+28E],1
 004A417E    mov         byte ptr [ecx+2BE],1
 004A4185    mov         byte ptr [ecx+2EE],1
 004A418C    mov         byte ptr [ecx+31E],1
 004A4193    mov         byte ptr [ecx+200],1
 004A419A    mov         byte ptr [ecx+168],1
 004A41A1    mov         byte ptr [ecx+202],1
 004A41A8    mov         byte ptr [ecx+31E],1
 004A41AF    mov         byte ptr [ecx+1A4],1
 004A41B6    mov         byte ptr [ecx+1D4],1
 004A41BD    mov         byte ptr [ecx+204],1
 004A41C4    mov         byte ptr [ecx+31C],1
 004A41CB    mov         byte ptr [ecx+31A],1
 004A41D2    mov         byte ptr [ecx+318],1
 004A41D9    mov         byte ptr [ecx+348],1
 004A41E0    mov         byte ptr [ecx+316],1
 004A41E7    mov         byte ptr [ecx+378],1
 004A41EE    mov         byte ptr [ecx+3A8],1
 004A41F5    mov         byte ptr [ecx+3A6],1
 004A41FC    mov         byte ptr [ecx+3A4],1
 004A4203    mov         byte ptr [ecx+3A2],1
 004A420A    mov         byte ptr [ecx+372],1
 004A4211    mov         byte ptr [ecx+174],1
 004A4218    mov         byte ptr [ecx+1A6],1
 004A421F    mov         byte ptr [ecx+158],1
 004A4226    mov         byte ptr [ecx+15A],1
 004A422D    mov         byte ptr [ecx+15C],1
 004A4234    mov         byte ptr [ecx+124],1
 004A423B    mov         byte ptr [ecx+126],1
 004A4242    mov         byte ptr [ecx+370],1
 004A4249    mov         byte ptr [ecx+36E],1
 004A4250    mov         byte ptr [ecx+36C],1
 004A4257    mov         byte ptr [ecx+36A],1
 004A425E    mov         byte ptr [ecx+368],1
 004A4265    mov         byte ptr [ecx+366],1
 004A426C    mov         byte ptr [ecx+33E],1
 004A4273    mov         byte ptr [ecx+30E],1
 004A427A    mov         byte ptr [ecx+2DE],1
 004A4281    mov         byte ptr [ecx+33A],1
 004A4288    mov         byte ptr [ecx+30A],1
 004A428F    mov         byte ptr [ecx+2DA],1
 004A4296    mov         byte ptr [ecx+364],1
 004A429D    cmp         al,8
>004A429F    jne         004A4346
 004A42A5    mov         byte ptr [ecx+136],1
 004A42AC    mov         byte ptr [ecx+0C6],1
 004A42B3    mov         byte ptr [ecx+1B8],1
 004A42BA    mov         byte ptr [ecx+1BA],1
 004A42C1    mov         byte ptr [ecx+18A],1
 004A42C8    mov         byte ptr [ecx+15A],1
 004A42CF    mov         byte ptr [ecx+15C],1
 004A42D6    mov         byte ptr [ecx+18C],1
 004A42DD    mov         byte ptr [ecx+12C],1
 004A42E4    mov         byte ptr [ecx+0FC],1
 004A42EB    mov         byte ptr [ecx+0CC],1
 004A42F2    mov         byte ptr [ecx+9C],1
 004A42F9    mov         byte ptr [ecx+0CA],1
 004A4300    mov         byte ptr [ecx+0C8],1
 004A4307    mov         byte ptr [ecx+0FA],1
 004A430E    mov         byte ptr [ecx+0FE],1
 004A4315    mov         byte ptr [ecx+100],1
 004A431C    mov         byte ptr [ecx+102],1
 004A4323    mov         byte ptr [ecx+132],1
 004A432A    mov         byte ptr [ecx+162],1
 004A4331    mov         byte ptr [ecx+134],1
 004A4338    mov         byte ptr [ecx+160],1
 004A433F    mov         byte ptr [ecx+15E],1
 004A4346    cmp         al,0B
>004A4348    jne         004A43BA
 004A434A    mov         byte ptr [ecx+22A],1
 004A4351    mov         byte ptr [ecx+1CC],1
 004A4358    mov         byte ptr [ecx+22C],1
 004A435F    mov         byte ptr [ecx+19E],1
 004A4366    mov         byte ptr [ecx+1CE],1
 004A436D    mov         byte ptr [ecx+1FE],1
 004A4374    mov         byte ptr [ecx+22E],1
 004A437B    mov         byte ptr [ecx+25E],1
 004A4382    mov         byte ptr [ecx+1D0],1
 004A4389    mov         byte ptr [ecx+230],1
 004A4390    mov         byte ptr [ecx+1D2],1
 004A4397    mov         byte ptr [ecx+28E],1
 004A439E    mov         byte ptr [ecx+2BE],1
 004A43A5    mov         byte ptr [ecx+16E],1
 004A43AC    mov         byte ptr [ecx+228],1
 004A43B3    mov         byte ptr [ecx+13E],1
 004A43BA    cmp         al,0C
>004A43BC    jne         004A44B2
 004A43C2    mov         byte ptr [ecx+16C],1
 004A43C9    mov         byte ptr [ecx+19C],1
 004A43D0    mov         byte ptr [ecx+1CC],1
 004A43D7    mov         byte ptr [ecx+134],1
 004A43DE    mov         byte ptr [ecx+46],1
 004A43E2    mov         byte ptr [ecx+76],1
 004A43E6    mov         byte ptr [ecx+0A6],1
 004A43ED    mov         byte ptr [ecx+0D6],1
 004A43F4    mov         byte ptr [ecx+106],1
 004A43FB    mov         byte ptr [ecx+136],1
 004A4402    mov         byte ptr [ecx+0D8],1
 004A4409    mov         byte ptr [ecx+0AA],1
 004A4410    mov         byte ptr [ecx+7A],1
 004A4414    mov         byte ptr [ecx+7C],1
 004A4418    mov         byte ptr [ecx+0DA],1
 004A441F    mov         byte ptr [ecx+0DC],1
 004A4426    mov         byte ptr [ecx+138],1
 004A442D    mov         byte ptr [ecx+13A],1
 004A4434    mov         byte ptr [ecx+13C],1
 004A443B    mov         byte ptr [ecx+164],1
 004A4442    mov         byte ptr [ecx+194],1
 004A4449    mov         byte ptr [ecx+1F4],1
 004A4450    mov         byte ptr [ecx+13E],1
 004A4457    mov         byte ptr [ecx+1F6],1
 004A445E    mov         byte ptr [ecx+1F8],1
 004A4465    mov         byte ptr [ecx+1FA],1
 004A446C    mov         byte ptr [ecx+1FC],1
 004A4473    mov         byte ptr [ecx+1FE],1
 004A447A    mov         byte ptr [ecx+228],1
 004A4481    mov         byte ptr [ecx+258],1
 004A4488    mov         byte ptr [ecx+1CA],1
 004A448F    mov         byte ptr [ecx+22C],1
 004A4496    mov         byte ptr [ecx+1CE],1
 004A449D    mov         byte ptr [ecx+19E],1
 004A44A4    mov         byte ptr [ecx+1F2],1
 004A44AB    mov         byte ptr [ecx+1F0],1
 004A44B2    cmp         al,0E
>004A44B4    jne         004A452D
 004A44B6    mov         byte ptr [ecx+190],1
 004A44BD    mov         byte ptr [ecx+1C0],1
 004A44C4    mov         byte ptr [ecx+1C2],1
 004A44CB    mov         byte ptr [ecx+1BE],1
 004A44D2    mov         byte ptr [ecx+1EE],1
 004A44D9    mov         byte ptr [ecx+21E],1
 004A44E0    mov         byte ptr [ecx+220],1
 004A44E7    mov         byte ptr [ecx+222],1
 004A44EE    mov         byte ptr [ecx+1F2],1
 004A44F5    mov         byte ptr [ecx+250],1
 004A44FC    mov         byte ptr [ecx+1EC],1
 004A4503    mov         byte ptr [ecx+1F4],1
 004A450A    mov         byte ptr [ecx+160],1
 004A4511    mov         byte ptr [ecx+130],1
 004A4518    mov         byte ptr [ecx+100],1
 004A451F    mov         byte ptr [ecx+1F6],1
 004A4526    mov         byte ptr [ecx+1F8],1
 004A452D    cmp         al,0D
>004A452F    jne         004A467E
 004A4535    mov         byte ptr [ecx+31A],1
 004A453C    mov         byte ptr [ecx+2EA],1
 004A4543    mov         byte ptr [ecx+1BA],1
 004A454A    mov         byte ptr [ecx+1F4],1
 004A4551    mov         byte ptr [ecx+1F6],1
 004A4558    mov         byte ptr [ecx+1F8],1
 004A455F    mov         byte ptr [ecx+1FA],1
 004A4566    mov         byte ptr [ecx+1FC],1
 004A456D    mov         byte ptr [ecx+258],1
 004A4574    mov         byte ptr [ecx+228],1
 004A457B    mov         byte ptr [ecx+1C8],1
 004A4582    mov         byte ptr [ecx+198],1
 004A4589    mov         byte ptr [ecx+254],1
 004A4590    mov         byte ptr [ecx+224],1
 004A4597    mov         byte ptr [ecx+1C4],1
 004A459E    mov         byte ptr [ecx+194],1
 004A45A5    mov         byte ptr [ecx+22C],1
 004A45AC    mov         byte ptr [ecx+28C],1
 004A45B3    mov         byte ptr [ecx+0D0],1
 004A45BA    mov         byte ptr [ecx+2BC],1
 004A45C1    mov         byte ptr [ecx+2BE],1
 004A45C8    mov         byte ptr [ecx+2C0],1
 004A45CF    mov         byte ptr [ecx+2C2],1
 004A45D6    mov         byte ptr [ecx+2C4],1
 004A45DD    mov         byte ptr [ecx+2B8],1
 004A45E4    mov         byte ptr [ecx+2BA],1
 004A45EB    mov         byte ptr [ecx+2C6],1
 004A45F2    mov         byte ptr [ecx+2C8],1
 004A45F9    mov         byte ptr [ecx+192],1
 004A4600    mov         byte ptr [ecx+1CC],1
 004A4607    mov         byte ptr [ecx+16C],1
 004A460E    mov         byte ptr [ecx+19C],1
 004A4615    mov         byte ptr [ecx+16E],1
 004A461C    mov         byte ptr [ecx+170],1
 004A4623    mov         byte ptr [ecx+140],1
 004A462A    mov         byte ptr [ecx+172],1
 004A4631    mov         byte ptr [ecx+190],1
 004A4638    mov         byte ptr [ecx+1C0],1
 004A463F    mov         byte ptr [ecx+100],1
 004A4646    mov         byte ptr [ecx+160],1
 004A464D    mov         byte ptr [ecx+130],1
 004A4654    mov         byte ptr [ecx+15E],1
 004A465B    mov         byte ptr [ecx+162],1
 004A4662    mov         byte ptr [ecx+1BE],1
 004A4669    mov         byte ptr [ecx+1BC],1
 004A4670    mov         byte ptr [ecx+222],1
 004A4677    mov         byte ptr [ecx+220],1
 004A467E    pop         edx
 004A467F    pop         esi
 004A4680    pop         ebx
 004A4681    ret
end;*}

//004A4684
{*procedure sub_004A4684(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004A4684    push        ebp
 004A4685    mov         ebp,esp
 004A4687    push        ebx
 004A4688    push        esi
 004A4689    mov         ebx,dword ptr [ebp+0C]
 004A468C    movzx       ebx,word ptr [ebx-2]
 004A4690    lea         esi,[ebx+ebx*4]
 004A4693    mov         ebx,dword ptr ds:[5AE578];^gvar_005FE498:Pointer
 004A4699    mov         byte ptr [ebx+esi],dl
 004A469C    mov         edx,dword ptr [ebp+0C]
 004A469F    mov         edx,dword ptr ds:[5AE578];^gvar_005FE498:Pointer
 004A46A5    mov         byte ptr [edx+esi+1],cl
 004A46A9    mov         edx,dword ptr [ebp+0C]
 004A46AC    mov         edx,dword ptr ds:[5AE578];^gvar_005FE498:Pointer
 004A46B2    mov         cl,byte ptr [ebp+8]
 004A46B5    mov         byte ptr [edx+esi+3],cl
 004A46B9    mov         edx,dword ptr [ebp+0C]
 004A46BC    mov         edx,dword ptr ds:[5AE578];^gvar_005FE498:Pointer
 004A46C2    mov         byte ptr [edx+esi+2],0
 004A46C7    mov         edx,dword ptr [ebp+0C]
 004A46CA    mov         edx,dword ptr ds:[5AE578];^gvar_005FE498:Pointer
 004A46D0    mov         byte ptr [edx+esi+4],al
 004A46D4    mov         eax,dword ptr [ebp+0C]
 004A46D7    inc         word ptr [eax-2]
 004A46DB    pop         esi
 004A46DC    pop         ebx
 004A46DD    pop         ebp
 004A46DE    ret         4
end;*}

//004A46E4
procedure sub_004A46E4;
begin
{*
 004A46E4    push        ebp
 004A46E5    mov         ebp,esp
 004A46E7    push        ecx
 004A46E8    mov         word ptr [ebp-2],0
 004A46EE    mov         eax,[005AE578];^gvar_005FE498:Pointer
 004A46F3    mov         byte ptr [eax],0
 004A46F6    mov         byte ptr [eax+1],0
 004A46FA    mov         byte ptr [eax+2],1
 004A46FE    mov         byte ptr [eax+3],0
 004A4702    mov         byte ptr [eax+4],0FF
 004A4706    inc         word ptr [ebp-2]
 004A470A    add         eax,5
 004A470D    cmp         word ptr [ebp-2],29
>004A4712    jne         004A46F3
 004A4714    mov         word ptr [ebp-2],0
 004A471A    push        ebp
 004A471B    push        1
 004A471D    mov         cl,3
 004A471F    mov         dl,3
 004A4721    mov         al,3
 004A4723    call        004A4684
 004A4728    pop         ecx
 004A4729    push        ebp
 004A472A    push        1
 004A472C    mov         cl,4
 004A472E    mov         dl,6
 004A4730    mov         al,3
 004A4732    call        004A4684
 004A4737    pop         ecx
 004A4738    push        ebp
 004A4739    push        1
 004A473B    xor         ecx,ecx
 004A473D    mov         dl,6
 004A473F    mov         al,3
 004A4741    call        004A4684
 004A4746    pop         ecx
 004A4747    push        ebp
 004A4748    push        3
 004A474A    mov         cl,7
 004A474C    mov         dl,4
 004A474E    mov         al,3
 004A4750    call        004A4684
 004A4755    pop         ecx
 004A4756    push        ebp
 004A4757    push        2
 004A4759    mov         cl,5
 004A475B    mov         dl,5
 004A475D    mov         al,3
 004A475F    call        004A4684
 004A4764    pop         ecx
 004A4765    push        ebp
 004A4766    push        3
 004A4768    mov         cl,0B
 004A476A    mov         dl,0A
 004A476C    mov         al,4
 004A476E    call        004A4684
 004A4773    pop         ecx
 004A4774    push        ebp
 004A4775    push        3
 004A4777    mov         cl,0E
 004A4779    mov         dl,0C
 004A477B    mov         al,4
 004A477D    call        004A4684
 004A4782    pop         ecx
 004A4783    push        ebp
 004A4784    push        2
 004A4786    mov         cl,0B
 004A4788    mov         dl,4
 004A478A    mov         al,4
 004A478C    call        004A4684
 004A4791    pop         ecx
 004A4792    push        ebp
 004A4793    push        2
 004A4795    mov         cl,8
 004A4797    mov         dl,0C
 004A4799    mov         al,4
 004A479B    call        004A4684
 004A47A0    pop         ecx
 004A47A1    push        ebp
 004A47A2    push        1
 004A47A4    mov         cl,0D
 004A47A6    mov         dl,9
 004A47A8    mov         al,4
 004A47AA    call        004A4684
 004A47AF    pop         ecx
 004A47B0    push        ebp
 004A47B1    push        0
 004A47B3    mov         cl,0A
 004A47B5    mov         dl,9
 004A47B7    mov         al,4
 004A47B9    call        004A4684
 004A47BE    pop         ecx
 004A47BF    push        ebp
 004A47C0    push        3
 004A47C2    mov         cl,0C
 004A47C4    mov         dl,7
 004A47C6    mov         al,4
 004A47C8    call        004A4684
 004A47CD    pop         ecx
 004A47CE    push        ebp
 004A47CF    push        0
 004A47D1    mov         cl,0B
 004A47D3    mov         dl,0E
 004A47D5    mov         al,4
 004A47D7    call        004A4684
 004A47DC    pop         ecx
 004A47DD    push        ebp
 004A47DE    push        3
 004A47E0    mov         cl,12
 004A47E2    mov         dl,9
 004A47E4    mov         al,0A
 004A47E6    call        004A4684
 004A47EB    pop         ecx
 004A47EC    push        ebp
 004A47ED    push        0
 004A47EF    mov         cl,6
 004A47F1    mov         dl,12
 004A47F3    mov         al,0A
 004A47F5    call        004A4684
 004A47FA    pop         ecx
 004A47FB    push        ebp
 004A47FC    push        3
 004A47FE    mov         cl,7
 004A4800    mov         dl,10
 004A4802    mov         al,0A
 004A4804    call        004A4684
 004A4809    pop         ecx
 004A480A    push        ebp
 004A480B    push        2
 004A480D    mov         cl,5
 004A480F    mov         dl,7
 004A4811    mov         al,0A
 004A4813    call        004A4684
 004A4818    pop         ecx
 004A4819    push        ebp
 004A481A    push        1
 004A481C    mov         cl,0F
 004A481E    mov         dl,0A
 004A4820    mov         al,0B
 004A4822    call        004A4684
 004A4827    pop         ecx
 004A4828    push        ebp
 004A4829    push        3
 004A482B    mov         cl,0E
 004A482D    mov         dl,8
 004A482F    mov         al,0C
 004A4831    call        004A4684
 004A4836    pop         ecx
 004A4837    push        ebp
 004A4838    push        1
 004A483A    mov         cl,0E
 004A483C    mov         dl,9
 004A483E    mov         al,0C
 004A4840    call        004A4684
 004A4845    pop         ecx
 004A4846    push        ebp
 004A4847    push        1
 004A4849    mov         cl,0F
 004A484B    mov         dl,9
 004A484D    mov         al,0C
 004A484F    call        004A4684
 004A4854    pop         ecx
 004A4855    push        ebp
 004A4856    push        3
 004A4858    mov         cl,0C
 004A485A    mov         dl,0B
 004A485C    mov         al,0C
 004A485E    call        004A4684
 004A4863    pop         ecx
 004A4864    push        ebp
 004A4865    push        2
 004A4867    mov         cl,0A
 004A4869    mov         dl,0A
 004A486B    mov         al,0C
 004A486D    call        004A4684
 004A4872    pop         ecx
 004A4873    push        ebp
 004A4874    push        0
 004A4876    mov         cl,0E
 004A4878    mov         dl,0E
 004A487A    mov         al,0D
 004A487C    call        004A4684
 004A4881    pop         ecx
 004A4882    push        ebp
 004A4883    push        0
 004A4885    mov         cl,0D
 004A4887    mov         dl,0E
 004A4889    mov         al,0D
 004A488B    call        004A4684
 004A4890    pop         ecx
 004A4891    push        ebp
 004A4892    push        1
 004A4894    mov         cl,8
 004A4896    mov         dl,8
 004A4898    mov         al,0D
 004A489A    call        004A4684
 004A489F    pop         ecx
 004A48A0    push        ebp
 004A48A1    push        1
 004A48A3    mov         cl,8
 004A48A5    mov         dl,5
 004A48A7    mov         al,0D
 004A48A9    call        004A4684
 004A48AE    pop         ecx
 004A48AF    push        ebp
 004A48B0    push        1
 004A48B2    mov         cl,0A
 004A48B4    mov         dl,0A
 004A48B6    mov         al,0D
 004A48B8    call        004A4684
 004A48BD    pop         ecx
 004A48BE    push        ebp
 004A48BF    push        3
 004A48C1    mov         cl,0C
 004A48C3    mov         dl,9
 004A48C5    mov         al,0D
 004A48C7    call        004A4684
 004A48CC    pop         ecx
 004A48CD    push        ebp
 004A48CE    push        1
 004A48D0    mov         cl,0E
 004A48D2    mov         dl,8
 004A48D4    mov         al,0D
 004A48D6    call        004A4684
 004A48DB    pop         ecx
 004A48DC    push        ebp
 004A48DD    push        0
 004A48DF    mov         cl,0B
 004A48E1    mov         dl,0A
 004A48E3    mov         al,0D
 004A48E5    call        004A4684
 004A48EA    pop         ecx
 004A48EB    push        ebp
 004A48EC    push        2
 004A48EE    mov         cl,8
 004A48F0    mov         dl,7
 004A48F2    mov         al,0D
 004A48F4    call        004A4684
 004A48F9    pop         ecx
 004A48FA    push        ebp
 004A48FB    push        0
 004A48FD    mov         cl,7
 004A48FF    mov         dl,9
 004A4901    mov         al,0D
 004A4903    call        004A4684
 004A4908    pop         ecx
 004A4909    push        ebp
 004A490A    push        1
 004A490C    mov         cl,8
 004A490E    mov         dl,6
 004A4910    mov         al,0E
 004A4912    call        004A4684
 004A4917    pop         ecx
 004A4918    pop         ecx
 004A4919    pop         ebp
 004A491A    ret
*}
end;

end.