//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit81;

interface

uses
  SysUtils, Classes;

    //procedure sub_0046E6C8(?:?; ?:?);//0046E6C8
    //procedure sub_0046E730(?:?; ?:?);//0046E730
    //procedure sub_0046E770(?:?; ?:?);//0046E770
    //procedure sub_0046E90C(?:?; ?:?);//0046E90C
    //procedure sub_0046E928(?:?; ?:?);//0046E928

implementation

//0046E6C8
{*procedure sub_0046E6C8(?:?; ?:?);
begin
 0046E6C8    mov         ecx,eax
 0046E6CA    fld         dword ptr [edx]
 0046E6CC    fcomp       dword ptr [ecx]
 0046E6CE    fnstsw      al
 0046E6D0    sahf
>0046E6D1    jae         0046E6D7
 0046E6D3    mov         eax,dword ptr [edx]
 0046E6D5    mov         dword ptr [ecx],eax
 0046E6D7    fld         dword ptr [edx+4]
 0046E6DA    fcomp       dword ptr [ecx+4]
 0046E6DD    fnstsw      al
 0046E6DF    sahf
>0046E6E0    jae         0046E6E8
 0046E6E2    mov         eax,dword ptr [edx+4]
 0046E6E5    mov         dword ptr [ecx+4],eax
 0046E6E8    fld         dword ptr [edx+8]
 0046E6EB    fcomp       dword ptr [ecx+8]
 0046E6EE    fnstsw      al
 0046E6F0    sahf
>0046E6F1    jae         0046E6F9
 0046E6F3    mov         eax,dword ptr [edx+8]
 0046E6F6    mov         dword ptr [ecx+8],eax
 0046E6F9    fld         dword ptr [edx+0C]
 0046E6FC    fcomp       dword ptr [ecx+0C]
 0046E6FF    fnstsw      al
 0046E701    sahf
>0046E702    jbe         0046E70A
 0046E704    mov         eax,dword ptr [edx+0C]
 0046E707    mov         dword ptr [ecx+0C],eax
 0046E70A    fld         dword ptr [edx+10]
 0046E70D    fcomp       dword ptr [ecx+10]
 0046E710    fnstsw      al
 0046E712    sahf
>0046E713    jbe         0046E71B
 0046E715    mov         eax,dword ptr [edx+10]
 0046E718    mov         dword ptr [ecx+10],eax
 0046E71B    fld         dword ptr [edx+14]
 0046E71E    fcomp       dword ptr [ecx+14]
 0046E721    fnstsw      al
 0046E723    sahf
>0046E724    jbe         0046E72C
 0046E726    mov         eax,dword ptr [edx+14]
 0046E729    mov         dword ptr [ecx+14],eax
 0046E72C    ret
end;*}

//0046E730
{*procedure sub_0046E730(?:?; ?:?);
begin
 0046E730    push        ebx
 0046E731    push        esi
 0046E732    mov         esi,edx
 0046E734    mov         ebx,eax
 0046E736    fld         dword ptr [esi]
 0046E738    fabs
 0046E73A    fstp        dword ptr [ebx+0C]
 0046E73D    wait
 0046E73E    fld         dword ptr [esi+4]
 0046E741    fabs
 0046E743    fstp        dword ptr [ebx+10]
 0046E746    wait
 0046E747    fld         dword ptr [esi+8]
 0046E74A    fabs
 0046E74C    fstp        dword ptr [ebx+14]
 0046E74F    wait
 0046E750    fld         dword ptr [ebx+0C]
 0046E753    fchs
 0046E755    fstp        dword ptr [ebx]
 0046E757    wait
 0046E758    fld         dword ptr [ebx+10]
 0046E75B    fchs
 0046E75D    fstp        dword ptr [ebx+4]
 0046E760    wait
 0046E761    fld         dword ptr [ebx+14]
 0046E764    fchs
 0046E766    fstp        dword ptr [ebx+8]
 0046E769    wait
 0046E76A    pop         esi
 0046E76B    pop         ebx
 0046E76C    ret
end;*}

//0046E770
{*procedure sub_0046E770(?:?; ?:?);
begin
 0046E770    push        ebx
 0046E771    push        esi
 0046E772    add         esp,0FFFFFFD0
 0046E775    mov         esi,edx
 0046E777    mov         ebx,eax
 0046E779    mov         eax,dword ptr [ebx]
 0046E77B    mov         dword ptr [esp],eax
 0046E77E    mov         eax,dword ptr [ebx+4]
 0046E781    mov         dword ptr [esp+4],eax
 0046E785    mov         eax,dword ptr [ebx+8]
 0046E788    mov         dword ptr [esp+8],eax
 0046E78C    mov         eax,dword ptr [ebx+0C]
 0046E78F    mov         dword ptr [esp+0C],eax
 0046E793    mov         eax,dword ptr [ebx+10]
 0046E796    mov         dword ptr [esp+10],eax
 0046E79A    mov         eax,dword ptr [ebx+14]
 0046E79D    mov         dword ptr [esp+14],eax
 0046E7A1    lea         ecx,[esp+18]
 0046E7A5    mov         edx,esi
 0046E7A7    mov         eax,esp
 0046E7A9    call        0045E138
 0046E7AE    mov         eax,dword ptr [esp+18]
 0046E7B2    mov         dword ptr [ebx],eax
 0046E7B4    mov         eax,dword ptr [esp+1C]
 0046E7B8    mov         dword ptr [ebx+4],eax
 0046E7BB    mov         eax,dword ptr [esp+20]
 0046E7BF    mov         dword ptr [ebx+8],eax
 0046E7C2    mov         eax,dword ptr [ebx]
 0046E7C4    mov         dword ptr [ebx+0C],eax
 0046E7C7    mov         eax,dword ptr [ebx+4]
 0046E7CA    mov         dword ptr [ebx+10],eax
 0046E7CD    mov         eax,dword ptr [ebx+8]
 0046E7D0    mov         dword ptr [ebx+14],eax
 0046E7D3    push        dword ptr [esp]
 0046E7D6    push        dword ptr [esp+8]
 0046E7DA    push        dword ptr [esp+1C]
 0046E7DE    lea         eax,[esp+30]
 0046E7E2    call        0045C8C4
 0046E7E7    lea         eax,[esp+24]
 0046E7EB    lea         ecx,[esp+18]
 0046E7EF    mov         edx,esi
 0046E7F1    call        0045E138
 0046E7F6    lea         edx,[esp+18]
 0046E7FA    mov         eax,ebx
 0046E7FC    call        0046E928
 0046E801    push        dword ptr [esp]
 0046E804    push        dword ptr [esp+14]
 0046E808    push        dword ptr [esp+10]
 0046E80C    lea         eax,[esp+30]
 0046E810    call        0045C8C4
 0046E815    lea         eax,[esp+24]
 0046E819    lea         ecx,[esp+18]
 0046E81D    mov         edx,esi
 0046E81F    call        0045E138
 0046E824    lea         edx,[esp+18]
 0046E828    mov         eax,ebx
 0046E82A    call        0046E928
 0046E82F    push        dword ptr [esp]
 0046E832    push        dword ptr [esp+14]
 0046E836    push        dword ptr [esp+1C]
 0046E83A    lea         eax,[esp+30]
 0046E83E    call        0045C8C4
 0046E843    lea         eax,[esp+24]
 0046E847    lea         ecx,[esp+18]
 0046E84B    mov         edx,esi
 0046E84D    call        0045E138
 0046E852    lea         edx,[esp+18]
 0046E856    mov         eax,ebx
 0046E858    call        0046E928
 0046E85D    push        dword ptr [esp+0C]
 0046E861    push        dword ptr [esp+8]
 0046E865    push        dword ptr [esp+10]
 0046E869    lea         eax,[esp+30]
 0046E86D    call        0045C8C4
 0046E872    lea         eax,[esp+24]
 0046E876    lea         ecx,[esp+18]
 0046E87A    mov         edx,esi
 0046E87C    call        0045E138
 0046E881    lea         edx,[esp+18]
 0046E885    mov         eax,ebx
 0046E887    call        0046E928
 0046E88C    push        dword ptr [esp+0C]
 0046E890    push        dword ptr [esp+8]
 0046E894    push        dword ptr [esp+1C]
 0046E898    lea         eax,[esp+30]
 0046E89C    call        0045C8C4
 0046E8A1    lea         eax,[esp+24]
 0046E8A5    lea         ecx,[esp+18]
 0046E8A9    mov         edx,esi
 0046E8AB    call        0045E138
 0046E8B0    lea         edx,[esp+18]
 0046E8B4    mov         eax,ebx
 0046E8B6    call        0046E928
 0046E8BB    push        dword ptr [esp+0C]
 0046E8BF    push        dword ptr [esp+14]
 0046E8C3    push        dword ptr [esp+10]
 0046E8C7    lea         eax,[esp+30]
 0046E8CB    call        0045C8C4
 0046E8D0    lea         eax,[esp+24]
 0046E8D4    lea         ecx,[esp+18]
 0046E8D8    mov         edx,esi
 0046E8DA    call        0045E138
 0046E8DF    lea         edx,[esp+18]
 0046E8E3    mov         eax,ebx
 0046E8E5    call        0046E928
 0046E8EA    lea         ecx,[esp+18]
 0046E8EE    mov         edx,esi
 0046E8F0    lea         eax,[esp+0C]
 0046E8F4    call        0045E138
 0046E8F9    lea         edx,[esp+18]
 0046E8FD    mov         eax,ebx
 0046E8FF    call        0046E928
 0046E904    add         esp,30
 0046E907    pop         esi
 0046E908    pop         ebx
 0046E909    ret
end;*}

//0046E90C
{*procedure sub_0046E90C(?:?; ?:?);
begin
 0046E90C    push        ebx
 0046E90D    push        esi
 0046E90E    mov         esi,edx
 0046E910    mov         ebx,eax
 0046E912    mov         edx,esi
 0046E914    mov         eax,ebx
 0046E916    call        0045D7E0
 0046E91B    mov         edx,esi
 0046E91D    lea         eax,[ebx+0C]
 0046E920    call        0045D7E0
 0046E925    pop         esi
 0046E926    pop         ebx
 0046E927    ret
end;*}

//0046E928
{*procedure sub_0046E928(?:?; ?:?);
begin
 0046E928    mov         ecx,eax
 0046E92A    fld         dword ptr [edx]
 0046E92C    fcomp       dword ptr [ecx]
 0046E92E    fnstsw      al
 0046E930    sahf
>0046E931    jae         0046E937
 0046E933    mov         eax,dword ptr [edx]
 0046E935    mov         dword ptr [ecx],eax
 0046E937    fld         dword ptr [edx]
 0046E939    fcomp       dword ptr [ecx+0C]
 0046E93C    fnstsw      al
 0046E93E    sahf
>0046E93F    jbe         0046E946
 0046E941    mov         eax,dword ptr [edx]
 0046E943    mov         dword ptr [ecx+0C],eax
 0046E946    fld         dword ptr [edx+4]
 0046E949    fcomp       dword ptr [ecx+4]
 0046E94C    fnstsw      al
 0046E94E    sahf
>0046E94F    jae         0046E957
 0046E951    mov         eax,dword ptr [edx+4]
 0046E954    mov         dword ptr [ecx+4],eax
 0046E957    fld         dword ptr [edx+4]
 0046E95A    fcomp       dword ptr [ecx+10]
 0046E95D    fnstsw      al
 0046E95F    sahf
>0046E960    jbe         0046E968
 0046E962    mov         eax,dword ptr [edx+4]
 0046E965    mov         dword ptr [ecx+10],eax
 0046E968    fld         dword ptr [edx+8]
 0046E96B    fcomp       dword ptr [ecx+8]
 0046E96E    fnstsw      al
 0046E970    sahf
>0046E971    jae         0046E979
 0046E973    mov         eax,dword ptr [edx+8]
 0046E976    mov         dword ptr [ecx+8],eax
 0046E979    fld         dword ptr [edx+8]
 0046E97C    fcomp       dword ptr [ecx+14]
 0046E97F    fnstsw      al
 0046E981    sahf
>0046E982    jbe         0046E98A
 0046E984    mov         eax,dword ptr [edx+8]
 0046E987    mov         dword ptr [ecx+14],eax
 0046E98A    ret
end;*}

end.