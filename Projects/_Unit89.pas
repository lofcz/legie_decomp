//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit89;

interface

uses
  SysUtils, Classes;

type
  .2 = array of ?;
//elSize = 4
//varType equivalent: varSingle;
    procedure sub_0048C064(?:TAffineVectorList; ?:TAffineVectorList);//0048C064
    //procedure sub_0048C0D0(?:?; ?:?; ?:?);//0048C0D0

implementation

//0048C064
procedure sub_0048C064(?:TAffineVectorList; ?:TAffineVectorList);
begin
{*
 0048C064    push        ebx
 0048C065    push        esi
 0048C066    push        edi
 0048C067    push        ebp
 0048C068    mov         ebp,edx
 0048C06A    mov         ebx,eax
 0048C06C    mov         edx,dword ptr [ebp+8]
 0048C06F    mov         eax,dword ptr [ebx+8]
 0048C072    sub         eax,2
 0048C075    lea         eax,[eax+eax*2]
 0048C078    add         edx,eax
 0048C07A    mov         eax,ebp
 0048C07C    call        0046824C
 0048C081    mov         esi,dword ptr [ebx+24]
 0048C084    mov         edi,dword ptr [ebx+8]
 0048C087    sub         edi,3
 0048C08A    test        edi,edi
>0048C08C    jl          0048C0C8
 0048C08E    inc         edi
 0048C08F    xor         ebx,ebx
 0048C091    test        bl,1
>0048C094    jne         0048C0AE
 0048C096    lea         eax,[ebx+ebx*2]
 0048C099    lea         edx,[esi+eax*4+18]
 0048C09D    push        edx
 0048C09E    lea         ecx,[esi+eax*4+0C]
 0048C0A2    lea         edx,[esi+eax*4]
 0048C0A5    mov         eax,ebp
 0048C0A7    call        00468AD0
>0048C0AC    jmp         0048C0C4
 0048C0AE    lea         eax,[ebx+ebx*2]
 0048C0B1    lea         edx,[esi+eax*4]
 0048C0B4    push        edx
 0048C0B5    lea         ecx,[esi+eax*4+0C]
 0048C0B9    lea         edx,[esi+eax*4+18]
 0048C0BD    mov         eax,ebp
 0048C0BF    call        00468AD0
 0048C0C4    inc         ebx
 0048C0C5    dec         edi
>0048C0C6    jne         0048C091
 0048C0C8    pop         ebp
 0048C0C9    pop         edi
 0048C0CA    pop         esi
 0048C0CB    pop         ebx
 0048C0CC    ret
*}
end;

//0048C0D0
{*procedure sub_0048C0D0(?:?; ?:?; ?:?);
begin
 0048C0D0    push        ebx
 0048C0D1    push        esi
 0048C0D2    push        edi
 0048C0D3    push        ebp
 0048C0D4    push        ecx
 0048C0D5    mov         dword ptr [esp],ecx
 0048C0D8    mov         esi,edx
 0048C0DA    mov         ebx,eax
 0048C0DC    mov         eax,dword ptr [esp]
 0048C0DF    mov         edx,dword ptr [eax+8]
 0048C0E2    mov         eax,dword ptr [esi+8]
 0048C0E5    sub         eax,2
 0048C0E8    lea         eax,[eax+eax*2]
 0048C0EB    add         edx,eax
 0048C0ED    mov         eax,dword ptr [esp]
 0048C0F0    call        0046824C
 0048C0F5    mov         edi,dword ptr [ebx+24]
 0048C0F8    mov         ebp,dword ptr [esi+8]
 0048C0FB    sub         ebp,3
 0048C0FE    test        ebp,ebp
>0048C100    jl          0048C18E
 0048C106    inc         ebp
 0048C107    xor         ebx,ebx
 0048C109    test        bl,1
>0048C10C    jne         0048C14B
 0048C10E    lea         edx,[ebx+2]
 0048C111    mov         eax,esi
 0048C113    call        00469260
 0048C118    lea         eax,[eax+eax*2]
 0048C11B    lea         eax,[edi+eax*4]
 0048C11E    push        eax
 0048C11F    lea         edx,[ebx+1]
 0048C122    mov         eax,esi
 0048C124    call        00469260
 0048C129    lea         eax,[eax+eax*2]
 0048C12C    lea         eax,[edi+eax*4]
 0048C12F    push        eax
 0048C130    lea         edx,[ebx]
 0048C132    mov         eax,esi
 0048C134    call        00469260
 0048C139    lea         eax,[eax+eax*2]
 0048C13C    lea         edx,[edi+eax*4]
 0048C13F    mov         eax,dword ptr [esp+8]
 0048C143    pop         ecx
 0048C144    call        00468AD0
>0048C149    jmp         0048C186
 0048C14B    lea         edx,[ebx]
 0048C14D    mov         eax,esi
 0048C14F    call        00469260
 0048C154    lea         eax,[eax+eax*2]
 0048C157    lea         eax,[edi+eax*4]
 0048C15A    push        eax
 0048C15B    lea         edx,[ebx+1]
 0048C15E    mov         eax,esi
 0048C160    call        00469260
 0048C165    lea         eax,[eax+eax*2]
 0048C168    lea         eax,[edi+eax*4]
 0048C16B    push        eax
 0048C16C    lea         edx,[ebx+2]
 0048C16F    mov         eax,esi
 0048C171    call        00469260
 0048C176    lea         eax,[eax+eax*2]
 0048C179    lea         edx,[edi+eax*4]
 0048C17C    mov         eax,dword ptr [esp+8]
 0048C180    pop         ecx
 0048C181    call        00468AD0
 0048C186    inc         ebx
 0048C187    dec         ebp
>0048C188    jne         0048C109
 0048C18E    pop         edx
 0048C18F    pop         ebp
 0048C190    pop         edi
 0048C191    pop         esi
 0048C192    pop         ebx
 0048C193    ret
end;*}

Initialization
Finalization
//0048C194
{*
 0048C194    push        ebp
 0048C195    mov         ebp,esp
 0048C197    xor         eax,eax
 0048C199    push        ebp
 0048C19A    push        48C1CB
 0048C19F    push        dword ptr fs:[eax]
 0048C1A2    mov         dword ptr fs:[eax],esp
 0048C1A5    inc         dword ptr ds:[5E155C]
>0048C1AB    jne         0048C1BD
 0048C1AD    mov         eax,5E1560;gvar_005E1560:?
 0048C1B2    mov         edx,dword ptr ds:[48C040];.2
 0048C1B8    call        @DynArrayClear
 0048C1BD    xor         eax,eax
 0048C1BF    pop         edx
 0048C1C0    pop         ecx
 0048C1C1    pop         ecx
 0048C1C2    mov         dword ptr fs:[eax],edx
 0048C1C5    push        48C1D2
 0048C1CA    ret
>0048C1CB    jmp         @HandleFinally
>0048C1D0    jmp         0048C1CA
 0048C1D2    pop         ebp
 0048C1D3    ret
*}
end.