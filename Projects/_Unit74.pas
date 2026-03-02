//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit74;

interface

uses
  SysUtils, Classes;

type
  TGLMinFilter = (miNearest, miLinear, miNearestMipmapNearest, miLinearMipmapNearest, miNearestMipmapLinear, miLinearMipmapLinear);
  TGLMagFilter = (maNearest, maLinear);
    //function sub_0046BCE8(?:Integer):?;//0046BCE8
    //procedure sub_0046BCFC(?:?; ?:AnsiString);//0046BCFC
    //procedure sub_0046BD60(?:?; ?:?);//0046BD60
    //procedure sub_0046BDE4(?:?);//0046BDE4
    //function sub_0046BE58:?;//0046BE58

implementation

//0046BCE8
{*function sub_0046BCE8(?:Integer):?;
begin
 0046BCE8    mov         edx,1
 0046BCED    cmp         eax,edx
>0046BCEF    jle         0046BCF7
 0046BCF1    add         edx,edx
 0046BCF3    cmp         eax,edx
>0046BCF5    jg          0046BCF1
 0046BCF7    mov         eax,edx
 0046BCF9    ret
end;*}

//0046BCFC
{*procedure sub_0046BCFC(?:?; ?:AnsiString);
begin
 0046BCFC    push        ebp
 0046BCFD    mov         ebp,esp
 0046BCFF    push        ecx
 0046BD00    push        ebx
 0046BD01    push        esi
 0046BD02    mov         esi,edx
 0046BD04    mov         dx,0FFFF
 0046BD08    call        00465A70
 0046BD0D    mov         dword ptr [ebp-4],eax
 0046BD10    xor         eax,eax
 0046BD12    push        ebp
 0046BD13    push        46BD54
 0046BD18    push        dword ptr fs:[eax]
 0046BD1B    mov         dword ptr fs:[eax],esp
 0046BD1E    mov         eax,esi
 0046BD20    call        @LStrLen
 0046BD25    mov         ebx,eax
 0046BD27    test        ebx,ebx
>0046BD29    jbe         0046BD3E
 0046BD2B    mov         eax,esi
 0046BD2D    call        @LStrToPChar
 0046BD32    mov         edx,eax
 0046BD34    mov         ecx,ebx
 0046BD36    mov         eax,dword ptr [ebp-4]
 0046BD39    mov         ebx,dword ptr [eax]
 0046BD3B    call        dword ptr [ebx+10]
 0046BD3E    xor         eax,eax
 0046BD40    pop         edx
 0046BD41    pop         ecx
 0046BD42    pop         ecx
 0046BD43    mov         dword ptr fs:[eax],edx
 0046BD46    push        46BD5B
 0046BD4B    mov         eax,dword ptr [ebp-4]
 0046BD4E    call        TObject.Free
 0046BD53    ret
>0046BD54    jmp         @HandleFinally
>0046BD59    jmp         0046BD4B
 0046BD5B    pop         esi
 0046BD5C    pop         ebx
 0046BD5D    pop         ecx
 0046BD5E    pop         ebp
 0046BD5F    ret
end;*}

//0046BD60
{*procedure sub_0046BD60(?:?; ?:?);
begin
 0046BD60    push        ebp
 0046BD61    mov         ebp,esp
 0046BD63    push        ecx
 0046BD64    push        ebx
 0046BD65    push        esi
 0046BD66    mov         esi,edx
 0046BD68    mov         ebx,eax
 0046BD6A    mov         eax,ebx
 0046BD6C    call        FileExists
 0046BD71    test        al,al
>0046BD73    je          0046BDD7
 0046BD75    mov         dx,40
 0046BD79    mov         eax,ebx
 0046BD7B    call        00465A70
 0046BD80    mov         dword ptr [ebp-4],eax
 0046BD83    xor         eax,eax
 0046BD85    push        ebp
 0046BD86    push        46BDD0
 0046BD8B    push        dword ptr fs:[eax]
 0046BD8E    mov         dword ptr fs:[eax],esp
 0046BD91    mov         eax,dword ptr [ebp-4]
 0046BD94    mov         edx,dword ptr [eax]
 0046BD96    call        dword ptr [edx]
 0046BD98    mov         ebx,eax
 0046BD9A    mov         eax,esi
 0046BD9C    mov         edx,ebx
 0046BD9E    call        @LStrSetLength
 0046BDA3    test        ebx,ebx
>0046BDA5    jbe         0046BDBA
 0046BDA7    mov         eax,esi
 0046BDA9    call        @UniqueStringA
 0046BDAE    mov         edx,eax
 0046BDB0    mov         ecx,ebx
 0046BDB2    mov         eax,dword ptr [ebp-4]
 0046BDB5    mov         ebx,dword ptr [eax]
 0046BDB7    call        dword ptr [ebx+0C]
 0046BDBA    xor         eax,eax
 0046BDBC    pop         edx
 0046BDBD    pop         ecx
 0046BDBE    pop         ecx
 0046BDBF    mov         dword ptr fs:[eax],edx
 0046BDC2    push        46BDDE
 0046BDC7    mov         eax,dword ptr [ebp-4]
 0046BDCA    call        TObject.Free
 0046BDCF    ret
>0046BDD0    jmp         @HandleFinally
>0046BDD5    jmp         0046BDC7
 0046BDD7    mov         eax,esi
 0046BDD9    call        @LStrClr
 0046BDDE    pop         esi
 0046BDDF    pop         ebx
 0046BDE0    pop         ecx
 0046BDE1    pop         ebp
 0046BDE2    ret
end;*}

//0046BDE4
{*procedure sub_0046BDE4(?:?);
begin
 0046BDE4    push        ebp
 0046BDE5    mov         ebp,esp
 0046BDE7    add         esp,0FFFFFFF4
 0046BDEA    push        ebx
 0046BDEB    mov         ebx,eax
 0046BDED    mov         eax,ebx
 0046BDEF    call        FileExists
 0046BDF4    test        al,al
>0046BDF6    je          0046BE3E
 0046BDF8    mov         dx,40
 0046BDFC    mov         eax,ebx
 0046BDFE    call        00465A70
 0046BE03    mov         dword ptr [ebp-0C],eax
 0046BE06    xor         eax,eax
 0046BE08    push        ebp
 0046BE09    push        46BE37
 0046BE0E    push        dword ptr fs:[eax]
 0046BE11    mov         dword ptr fs:[eax],esp
 0046BE14    mov         eax,dword ptr [ebp-0C]
 0046BE17    mov         edx,dword ptr [eax]
 0046BE19    call        dword ptr [edx]
 0046BE1B    mov         dword ptr [ebp-8],eax
 0046BE1E    mov         dword ptr [ebp-4],edx
 0046BE21    xor         eax,eax
 0046BE23    pop         edx
 0046BE24    pop         ecx
 0046BE25    pop         ecx
 0046BE26    mov         dword ptr fs:[eax],edx
 0046BE29    push        46BE4C
 0046BE2E    mov         eax,dword ptr [ebp-0C]
 0046BE31    call        TObject.Free
 0046BE36    ret
>0046BE37    jmp         @HandleFinally
>0046BE3C    jmp         0046BE2E
 0046BE3E    mov         dword ptr [ebp-8],0
 0046BE45    mov         dword ptr [ebp-4],0
 0046BE4C    mov         eax,dword ptr [ebp-8]
 0046BE4F    mov         edx,dword ptr [ebp-4]
 0046BE52    pop         ebx
 0046BE53    mov         esp,ebp
 0046BE55    pop         ebp
 0046BE56    ret
end;*}

//0046BE58
{*function sub_0046BE58:?;
begin
 0046BE58    push        ebx
 0046BE59    push        esi
 0046BE5A    push        ecx
 0046BE5B    cmp         byte ptr ds:[5E14A3],0FF;gvar_005E14A3
>0046BE62    je          0046BE99
 0046BE64    xor         esi,esi
 0046BE66    mov         ebx,5E13A4;gvar_005E13A4
 0046BE6B    mov         dword ptr [esp],esi
 0046BE6E    fild        dword ptr [esp]
 0046BE71    fld         tbyte ptr ds:[46BEA4];0.00392156862745098:Extended
 0046BE77    fmulp       st(1),st
 0046BE79    fsqrt
 0046BE7B    fmul        dword ptr ds:[46BEB0];255:Single
 0046BE81    add         esp,0FFFFFFFC
 0046BE84    fstp        dword ptr [esp]
 0046BE87    wait
 0046BE88    call        0045F688
 0046BE8D    mov         byte ptr [ebx],al
 0046BE8F    inc         esi
 0046BE90    inc         ebx
 0046BE91    cmp         esi,100
>0046BE97    jne         0046BE6B
 0046BE99    mov         eax,5E13A4;gvar_005E13A4
 0046BE9E    pop         edx
 0046BE9F    pop         esi
 0046BEA0    pop         ebx
 0046BEA1    ret
end;*}

end.