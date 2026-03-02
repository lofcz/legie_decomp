//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit110;

interface

uses
  SysUtils, Classes;

    //procedure sub_00550250(?:?; ?:?; ?:?);//00550250
    //procedure sub_0055038C(?:?; ?:?; ?:?);//0055038C
    //procedure sub_00550468(?:?; ?:?; ?:?);//00550468
    procedure sub_005504E8(?:AnsiString);//005504E8

implementation

//00550250
{*procedure sub_00550250(?:?; ?:?; ?:?);
begin
 00550250    push        ebp
 00550251    mov         ebp,esp
 00550253    add         esp,0FFFFFFF0
 00550256    push        ebx
 00550257    push        esi
 00550258    xor         edx,edx
 0055025A    mov         dword ptr [ebp-10],edx
 0055025D    mov         dword ptr [ebp-0C],edx
 00550260    mov         esi,eax
 00550262    xor         eax,eax
 00550264    push        ebp
 00550265    push        55034A
 0055026A    push        dword ptr fs:[eax]
 0055026D    mov         dword ptr fs:[eax],esp
 00550270    push        dword ptr [ebp+0C]
 00550273    push        dword ptr [ebp+8]
 00550276    lea         eax,[ebp-8]
 00550279    push        eax
 0055027A    lea         ecx,[ebp-6]
 0055027D    lea         edx,[ebp-4]
 00550280    lea         eax,[ebp-2]
 00550283    call        DecodeTime
 00550288    mov         eax,[005AE6BC];^gvar_005AE0C4
 0055028D    cmp         byte ptr [eax],1
>00550290    jne         005502AF
 00550292    mov         bl,1
 00550294    cmp         word ptr [ebp-2],0
>00550299    jne         005502A1
 0055029B    mov         word ptr [ebp-2],0C
 005502A1    cmp         word ptr [ebp-2],0C
>005502A6    jbe         005502AF
 005502A8    sub         word ptr [ebp-2],0C
 005502AD    xor         ebx,ebx
 005502AF    mov         edx,esi
 005502B1    movzx       eax,word ptr [ebp-2]
 005502B5    call        IntToStr
 005502BA    mov         eax,esi
 005502BC    mov         edx,550364;':'
 005502C1    call        @LStrCat
 005502C6    cmp         word ptr [ebp-4],0A
>005502CB    jae         005502F1
 005502CD    push        dword ptr [esi]
 005502CF    push        550370;'0'
 005502D4    lea         edx,[ebp-0C]
 005502D7    movzx       eax,word ptr [ebp-4]
 005502DB    call        IntToStr
 005502E0    push        dword ptr [ebp-0C]
 005502E3    mov         eax,esi
 005502E5    mov         edx,3
 005502EA    call        @LStrCatN
>005502EF    jmp         00550307
 005502F1    lea         edx,[ebp-10]
 005502F4    movzx       eax,word ptr [ebp-4]
 005502F8    call        IntToStr
 005502FD    mov         edx,dword ptr [ebp-10]
 00550300    mov         eax,esi
 00550302    call        @LStrCat
 00550307    mov         eax,[005AE6BC];^gvar_005AE0C4
 0055030C    cmp         byte ptr [eax],1
>0055030F    jne         0055032F
 00550311    test        bl,bl
>00550313    je          00550323
 00550315    mov         eax,esi
 00550317    mov         edx,55037C;' AM'
 0055031C    call        @LStrCat
>00550321    jmp         0055032F
 00550323    mov         eax,esi
 00550325    mov         edx,550388;' PM'
 0055032A    call        @LStrCat
 0055032F    xor         eax,eax
 00550331    pop         edx
 00550332    pop         ecx
 00550333    pop         ecx
 00550334    mov         dword ptr fs:[eax],edx
 00550337    push        550351
 0055033C    lea         eax,[ebp-10]
 0055033F    mov         edx,2
 00550344    call        @LStrArrayClr
 00550349    ret
>0055034A    jmp         @HandleFinally
>0055034F    jmp         0055033C
 00550351    pop         esi
 00550352    pop         ebx
 00550353    mov         esp,ebp
 00550355    pop         ebp
 00550356    ret         8
end;*}

//0055038C
{*procedure sub_0055038C(?:?; ?:?; ?:?);
begin
 0055038C    push        ebp
 0055038D    mov         ebp,esp
 0055038F    add         esp,0FFFFFFF0
 00550392    push        ebx
 00550393    xor         edx,edx
 00550395    mov         dword ptr [ebp-10],edx
 00550398    mov         dword ptr [ebp-0C],edx
 0055039B    mov         ebx,eax
 0055039D    xor         eax,eax
 0055039F    push        ebp
 005503A0    push        55043F
 005503A5    push        dword ptr fs:[eax]
 005503A8    mov         dword ptr fs:[eax],esp
 005503AB    push        dword ptr [ebp+0C]
 005503AE    push        dword ptr [ebp+8]
 005503B1    lea         ecx,[ebp-2]
 005503B4    lea         edx,[ebp-4]
 005503B7    lea         eax,[ebp-6]
 005503BA    call        DecodeDate
 005503BF    mov         eax,ebx
 005503C1    call        @LStrClr
 005503C6    cmp         word ptr [ebp-4],0A
>005503CB    jae         005503D9
 005503CD    mov         eax,ebx
 005503CF    mov         edx,550458;'0'
 005503D4    call        @LStrCat
 005503D9    lea         edx,[ebp-0C]
 005503DC    movzx       eax,word ptr [ebp-4]
 005503E0    call        IntToStr
 005503E5    mov         edx,dword ptr [ebp-0C]
 005503E8    mov         eax,ebx
 005503EA    call        @LStrCat
 005503EF    mov         eax,ebx
 005503F1    mov         edx,550464;'-'
 005503F6    call        @LStrCat
 005503FB    cmp         word ptr [ebp-2],0A
>00550400    jae         0055040E
 00550402    mov         eax,ebx
 00550404    mov         edx,550458;'0'
 00550409    call        @LStrCat
 0055040E    lea         edx,[ebp-10]
 00550411    movzx       eax,word ptr [ebp-2]
 00550415    call        IntToStr
 0055041A    mov         edx,dword ptr [ebp-10]
 0055041D    mov         eax,ebx
 0055041F    call        @LStrCat
 00550424    xor         eax,eax
 00550426    pop         edx
 00550427    pop         ecx
 00550428    pop         ecx
 00550429    mov         dword ptr fs:[eax],edx
 0055042C    push        550446
 00550431    lea         eax,[ebp-10]
 00550434    mov         edx,2
 00550439    call        @LStrArrayClr
 0055043E    ret
>0055043F    jmp         @HandleFinally
>00550444    jmp         00550431
 00550446    pop         ebx
 00550447    mov         esp,ebp
 00550449    pop         ebp
 0055044A    ret         8
end;*}

//00550468
{*procedure sub_00550468(?:?; ?:?; ?:?);
begin
 00550468    push        ebp
 00550469    mov         ebp,esp
 0055046B    push        0
 0055046D    push        0
 0055046F    push        ebx
 00550470    mov         ebx,eax
 00550472    xor         eax,eax
 00550474    push        ebp
 00550475    push        5504CE
 0055047A    push        dword ptr fs:[eax]
 0055047D    mov         dword ptr fs:[eax],esp
 00550480    push        dword ptr [ebp+0C]
 00550483    push        dword ptr [ebp+8]
 00550486    lea         eax,[ebp-4]
 00550489    call        0055038C
 0055048E    push        dword ptr [ebp-4]
 00550491    push        5504E4;' '
 00550496    push        dword ptr [ebp+0C]
 00550499    push        dword ptr [ebp+8]
 0055049C    lea         eax,[ebp-8]
 0055049F    call        00550250
 005504A4    push        dword ptr [ebp-8]
 005504A7    mov         eax,ebx
 005504A9    mov         edx,3
 005504AE    call        @LStrCatN
 005504B3    xor         eax,eax
 005504B5    pop         edx
 005504B6    pop         ecx
 005504B7    pop         ecx
 005504B8    mov         dword ptr fs:[eax],edx
 005504BB    push        5504D5
 005504C0    lea         eax,[ebp-8]
 005504C3    mov         edx,2
 005504C8    call        @LStrArrayClr
 005504CD    ret
>005504CE    jmp         @HandleFinally
>005504D3    jmp         005504C0
 005504D5    pop         ebx
 005504D6    pop         ecx
 005504D7    pop         ecx
 005504D8    pop         ebp
 005504D9    ret         8
end;*}

//005504E8
procedure sub_005504E8(?:AnsiString);
begin
{*
 005504E8    push        ebp
 005504E9    mov         ebp,esp
 005504EB    push        0
 005504ED    push        ebx
 005504EE    mov         ebx,eax
 005504F0    xor         eax,eax
 005504F2    push        ebp
 005504F3    push        55053E
 005504F8    push        dword ptr fs:[eax]
 005504FB    mov         dword ptr fs:[eax],esp
 005504FE    push        5
 00550500    push        0
 00550502    push        0
 00550504    lea         eax,[ebp-4]
 00550507    mov         ecx,ebx
 00550509    mov         edx,550554;'http://'
 0055050E    call        @LStrCat3
 00550513    mov         eax,dword ptr [ebp-4]
 00550516    call        @LStrToPChar
 0055051B    push        eax
 0055051C    push        55055C;'open'
 00550521    push        0
 00550523    call        shell32.ShellExecuteA
 00550528    xor         eax,eax
 0055052A    pop         edx
 0055052B    pop         ecx
 0055052C    pop         ecx
 0055052D    mov         dword ptr fs:[eax],edx
 00550530    push        550545
 00550535    lea         eax,[ebp-4]
 00550538    call        @LStrClr
 0055053D    ret
>0055053E    jmp         @HandleFinally
>00550543    jmp         00550535
 00550545    pop         ebx
 00550546    pop         ecx
 00550547    pop         ebp
 00550548    ret
*}
end;

end.