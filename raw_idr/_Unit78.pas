//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit78;

interface

uses
  SysUtils, Classes;

    //function sub_0046F290(?:?):?;//0046F290
    procedure sub_0046F364(?:TStringList);//0046F364

implementation

//0046F290
{*function sub_0046F290(?:?):?;
begin
 0046F290    push        ebp
 0046F291    mov         ebp,esp
 0046F293    add         esp,0FFFFFFF4
 0046F296    push        ebx
 0046F297    xor         edx,edx
 0046F299    mov         dword ptr [ebp-0C],edx
 0046F29C    mov         ebx,eax
 0046F29E    xor         eax,eax
 0046F2A0    push        ebp
 0046F2A1    push        46F355
 0046F2A6    push        dword ptr fs:[eax]
 0046F2A9    mov         dword ptr fs:[eax],esp
 0046F2AC    xor         eax,eax
 0046F2AE    mov         dword ptr [ebp-4],eax
 0046F2B1    test        ebx,ebx
>0046F2B3    je          0046F33F
 0046F2B9    cmp         byte ptr [ebx],2E
>0046F2BC    jne         0046F2D5
 0046F2BE    lea         eax,[ebp-0C]
 0046F2C1    push        eax
 0046F2C2    mov         ecx,7FFFFFFF
 0046F2C7    mov         edx,2
 0046F2CC    mov         eax,ebx
 0046F2CE    call        @LStrCopy
>0046F2D3    jmp         0046F2DF
 0046F2D5    lea         eax,[ebp-0C]
 0046F2D8    mov         edx,ebx
 0046F2DA    call        @LStrLAsg
 0046F2DF    mov         dl,1
 0046F2E1    mov         eax,[00418350];TStringList
 0046F2E6    call        TObject.Create;TStringList.Create
 0046F2EB    mov         dword ptr [ebp-8],eax
 0046F2EE    xor         eax,eax
 0046F2F0    push        ebp
 0046F2F1    push        46F338
 0046F2F6    push        dword ptr fs:[eax]
 0046F2F9    mov         dword ptr fs:[eax],esp
 0046F2FC    mov         eax,dword ptr [ebp-8]
 0046F2FF    call        0046F364
 0046F304    mov         edx,dword ptr [ebp-0C]
 0046F307    mov         eax,dword ptr [ebp-8]
 0046F30A    mov         ecx,dword ptr [eax]
 0046F30C    call        dword ptr [ecx+58];TStrings.IndexOfName
 0046F30F    mov         ebx,eax
 0046F311    test        ebx,ebx
>0046F313    jl          0046F322
 0046F315    mov         edx,ebx
 0046F317    mov         eax,dword ptr [ebp-8]
 0046F31A    mov         ecx,dword ptr [eax]
 0046F31C    call        dword ptr [ecx+18];TStringList.GetObject
 0046F31F    mov         dword ptr [ebp-4],eax
 0046F322    xor         eax,eax
 0046F324    pop         edx
 0046F325    pop         ecx
 0046F326    pop         ecx
 0046F327    mov         dword ptr fs:[eax],edx
 0046F32A    push        46F33F
 0046F32F    mov         eax,dword ptr [ebp-8]
 0046F332    call        TObject.Free
 0046F337    ret
>0046F338    jmp         @HandleFinally
>0046F33D    jmp         0046F32F
 0046F33F    xor         eax,eax
 0046F341    pop         edx
 0046F342    pop         ecx
 0046F343    pop         ecx
 0046F344    mov         dword ptr fs:[eax],edx
 0046F347    push        46F35C
 0046F34C    lea         eax,[ebp-0C]
 0046F34F    call        @LStrClr
 0046F354    ret
>0046F355    jmp         @HandleFinally
>0046F35A    jmp         0046F34C
 0046F35C    mov         eax,dword ptr [ebp-4]
 0046F35F    pop         ebx
 0046F360    mov         esp,ebp
 0046F362    pop         ebp
 0046F363    ret
end;*}

//0046F364
procedure sub_0046F364(?:TStringList);
begin
{*
 0046F364    push        ebp
 0046F365    mov         ebp,esp
 0046F367    add         esp,0FFFFFFF0
 0046F36A    push        ebx
 0046F36B    push        esi
 0046F36C    xor         edx,edx
 0046F36E    mov         dword ptr [ebp-10],edx
 0046F371    mov         dword ptr [ebp-4],eax
 0046F374    xor         eax,eax
 0046F376    push        ebp
 0046F377    push        46F40D
 0046F37C    push        dword ptr fs:[eax]
 0046F37F    mov         dword ptr fs:[eax],esp
 0046F382    mov         eax,428FA0;TPicture.RegisterFileFormat
 0046F387    cmp         byte ptr [eax],0FF
>0046F38A    jne         0046F393
 0046F38C    add         eax,2
 0046F38F    mov         eax,dword ptr [eax]
 0046F391    mov         eax,dword ptr [eax]
 0046F393    add         eax,10
 0046F396    mov         edx,dword ptr [eax]
 0046F398    lea         eax,[eax+edx+4]
 0046F39C    add         eax,2
 0046F39F    mov         eax,dword ptr [eax]
 0046F3A1    mov         eax,dword ptr [eax]
 0046F3A3    mov         dword ptr [ebp-0C],eax
 0046F3A6    cmp         dword ptr [ebp-0C],0
>0046F3AA    je          0046F3F7
 0046F3AC    mov         eax,dword ptr [ebp-0C]
 0046F3AF    mov         esi,dword ptr [eax+8]
 0046F3B2    dec         esi
 0046F3B3    test        esi,esi
>0046F3B5    jl          0046F3F7
 0046F3B7    inc         esi
 0046F3B8    mov         dword ptr [ebp-8],0
 0046F3BF    mov         edx,dword ptr [ebp-8]
 0046F3C2    mov         eax,dword ptr [ebp-0C]
 0046F3C5    call        TList.Get
 0046F3CA    mov         ebx,eax
 0046F3CC    push        dword ptr [ebx+4]
 0046F3CF    push        46F424;'='
 0046F3D4    push        dword ptr [ebx+8]
 0046F3D7    lea         eax,[ebp-10]
 0046F3DA    mov         edx,3
 0046F3DF    call        @LStrCatN
 0046F3E4    mov         edx,dword ptr [ebp-10]
 0046F3E7    mov         ecx,dword ptr [ebx]
 0046F3E9    mov         eax,dword ptr [ebp-4]
 0046F3EC    mov         ebx,dword ptr [eax]
 0046F3EE    call        dword ptr [ebx+3C];TStringList.AddObject
 0046F3F1    inc         dword ptr [ebp-8]
 0046F3F4    dec         esi
>0046F3F5    jne         0046F3BF
 0046F3F7    xor         eax,eax
 0046F3F9    pop         edx
 0046F3FA    pop         ecx
 0046F3FB    pop         ecx
 0046F3FC    mov         dword ptr fs:[eax],edx
 0046F3FF    push        46F414
 0046F404    lea         eax,[ebp-10]
 0046F407    call        @LStrClr
 0046F40C    ret
>0046F40D    jmp         @HandleFinally
>0046F412    jmp         0046F404
 0046F414    pop         esi
 0046F415    pop         ebx
 0046F416    mov         esp,ebp
 0046F418    pop         ebp
 0046F419    ret
*}
end;

end.