//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit61;

interface

uses
  SysUtils, Classes;

    //procedure sub_00550A18(?:?; ?:AnsiString);//00550A18

implementation

//00550A18
{*procedure sub_00550A18(?:?; ?:AnsiString);
begin
 00550A18    push        ebx
 00550A19    mov         ebx,edx
 00550A1B    mov         edx,dword ptr ds:[5AE6BC];^gvar_005AE0C4
 00550A21    cmp         byte ptr [edx],0
>00550A24    jne         00554540
 00550A2A    movzx       eax,ax
 00550A2D    cmp         eax,2D7
>00550A32    ja          00554540
 00550A38    jmp         dword ptr [eax*4+550A3F]
 00550A38    dd          0055159F
 00550A38    dd          005515B0
 00550A38    dd          005515C1
 00550A38    dd          005515D2
 00550A38    dd          005515E3
 00550A38    dd          005515F4
 00550A38    dd          00551605
 00550A38    dd          00551616
 00550A38    dd          00551627
 00550A38    dd          00551638
 00550A38    dd          00551649
 00550A38    dd          0055165A
 00550A38    dd          0055166B
 00550A38    dd          0055167C
 00550A38    dd          0055168D
 00550A38    dd          0055169E
 00550A38    dd          005516AF
 00550A38    dd          005516C0
 00550A38    dd          005516D1
 00550A38    dd          005516E2
 00550A38    dd          005516F3
 00550A38    dd          00551704
 00550A38    dd          00551715
 00550A38    dd          00551726
 00550A38    dd          00551737
 00550A38    dd          00551748
 00550A38    dd          00551759
 00550A38    dd          0055176A
 00550A38    dd          0055177B
 00550A38    dd          0055178C
 00550A38    dd          0055179D
 00550A38    dd          005517AE
 00550A38    dd          005517BF
 00550A38    dd          005517D0
 00550A38    dd          005517E1
 00550A38    dd          005517F2
 00550A38    dd          00551803
 00550A38    dd          00551814
 00550A38    dd          00551825
 00550A38    dd          00551836
 00550A38    dd          00551847
 00550A38    dd          00551D97
 00550A38    dd          00551DA8
 00550A38    dd          005525BD
 00550A38    dd          005525CE
 00550A38    dd          005531D3
 00550A38    dd          005531E4
 00550A38    dd          00551D42
 00550A38    dd          00551D53
 00550A38    dd          00551D64
 00550A38    dd          00551D75
 00550A38    dd          00551D86
 00550A38    dd          005523A2
 00550A38    dd          005523B3
 00550A38    dd          005523C4
 00550A38    dd          005523D5
 00550A38    dd          00552419
 00550A38    dd          0055242A
 00550A38    dd          0055243B
 00550A38    dd          0055244C
 00550A38    dd          00551C87
 00550A38    dd          00551C98
 00550A38    dd          00551CA9
 00550A38    dd          00554416
 00550A38    dd          00551CBA
 00550A38    dd          00551858
 00550A38    dd          00551869
 00550A38    dd          0055187A
 00550A38    dd          0055188B
 00550A38    dd          0055189C
 00550A38    dd          005518AD
 00550A38    dd          005518BE
 00550A38    dd          005518CF
 00550A38    dd          005518E0
 00550A38    dd          005518F1
 00550A38    dd          00551902
 00550A38    dd          00551913
 00550A38    dd          00551924
 00550A38    dd          00551935
 00550A38    dd          00551946
 00550A38    dd          00551957
 00550A38    dd          00551968
 00550A38    dd          00551979
 00550A38    dd          0055198A
 00550A38    dd          0055199B
 00550A38    dd          005519AC
 00550A38    dd          005519BD
 00550A38    dd          005519CE
 00550A38    dd          005519DF
 00550A38    dd          005519F0
 00550A38    dd          00551A01
 00550A38    dd          00551A12
 00550A38    dd          00551A23
 00550A38    dd          00551A34
 00550A38    dd          00551A45
 00550A38    dd          00551A56
 00550A38    dd          00551A67
 00550A38    dd          00551A78
 00550A38    dd          00551A89
 00550A38    dd          00551A9A
 00550A38    dd          00551AAB
 00550A38    dd          00551ABC
 00550A38    dd          00551ACD
 00550A38    dd          00551ADE
 00550A38    dd          00551AEF
 00550A38    dd          00551B00
 00550A38    dd          00551B11
 00550A38    dd          00551B22
 00550A38    dd          00551B33
 00550A38    dd          00551B44
 00550A38    dd          00551B55
 00550A38    dd          00551B66
 00550A38    dd          00551B77
 00550A38    dd          00551B88
 00550A38    dd          00551B99
 00550A38    dd          00551BAA
 00550A38    dd          00551BBB
 00550A38    dd          00551BCC
 00550A38    dd          00551BDD
 00550A38    dd          00551BEE
 00550A38    dd          00551BFF
 00550A38    dd          00551C10
 00550A38    dd          00551C21
 00550A38    dd          00551C32
 00550A38    dd          00551C43
 00550A38    dd          00551C54
 00550A38    dd          00551C65
 00550A38    dd          0055327D
 00550A38    dd          0055328E
 00550A38    dd          0055329F
 00550A38    dd          00551C76
 00550A38    dd          005524E5
 00550A38    dd          005524F6
 00550A38    dd          00552507
 00550A38    dd          00552518
 00550A38    dd          00552529
 00550A38    dd          0055253A
 00550A38    dd          0055254B
 00550A38    dd          0055255C
 00550A38    dd          0055256D
 00550A38    dd          0055257E
 00550A38    dd          0055258F
 00550A38    dd          00552B1E
 00550A38    dd          00552B2F
 00550A38    dd          00552B40
 00550A38    dd          00552B51
 00550A38    dd          00552B62
 00550A38    dd          00552B73
 00550A38    dd          00552B84
 00550A38    dd          00552832
 00550A38    dd          00552843
 00550A38    dd          00552854
 00550A38    dd          00552865
 00550A38    dd          00552876
 00550A38    dd          0055414C
 00550A38    dd          0055415D
 00550A38    dd          0055416E
 00550A38    dd          0055417F
 00550A38    dd          00554190
 00550A38    dd          0055404D
 00550A38    dd          0055405E
 00550A38    dd          005539CB
 00550A38    dd          005539DC
 00550A38    dd          005539ED
 00550A38    dd          005539FE
 00550A38    dd          0055337C
 00550A38    dd          0055338D
 00550A38    dd          005533AF
 00550A38    dd          005533C0
 00550A38    dd          005533D1
 00550A38    dd          005533F3
 00550A38    dd          00553404
 00550A38    dd          00553415
 00550A38    dd          00553426
 00550A38    dd          00553437
 00550A38    dd          00552C94
 00550A38    dd          00552CA5
 00550A38    dd          00552CB6
 00550A38    dd          00552CC7
 00550A38    dd          00552CD8
 00550A38    dd          00552CE9
 00550A38    dd          005542E4
 00550A38    dd          00554306
 00550A38    dd          00554328
 00550A38    dd          0055434A
 00550A38    dd          0055436C
 00550A38    dd          005542C2
 00550A38    dd          0055438E
 00550A38    dd          0055439F
 00550A38    dd          005543B0
 00550A38    dd          005543C1
 00550A38    dd          005543D2
 00550A38    dd          005543E3
 00550A38    dd          005543F4
 00550A38    dd          00553E0B
 00550A38    dd          00553E1C
 00550A38    dd          00553E2D
 00550A38    dd          00553E3E
 00550A38    dd          00553E60
 00550A38    dd          00553E71
 00550A38    dd          00553E82
 00550A38    dd          00552678
 00550A38    dd          00552689
 00550A38    dd          0055269A
 00550A38    dd          005526BC
 00550A38    dd          005526CD
 00550A38    dd          005526EF
 00550A38    dd          00552700
 00550A38    dd          00552711
 00550A38    dd          00552AA7
 00550A38    dd          00552AB8
 00550A38    dd          00553789
 00550A38    dd          0055379A
 00550A38    dd          005537AB
 00550A38    dd          005522D6
 00550A38    dd          005522F8
 00550A38    dd          00552309
 00550A38    dd          0055231A
 00550A38    dd          0055232B
 00550A38    dd          0055233C
 00550A38    dd          0055234D
 00550A38    dd          0055235E
 00550A38    dd          00554540
 00550A38    dd          00552AC9
 00550A38    dd          00552ADA
 00550A38    dd          00552AEB
 00550A38    dd          00552D93
 00550A38    dd          00552DA4
 00550A38    dd          00552DB5
 00550A38    dd          00552F4D
 00550A38    dd          00552F5E
 00550A38    dd          00552F6F
 00550A38    dd          00552F80
 00550A38    dd          00553745
 00550A38    dd          00553767
 00550A38    dd          005538CC
 00550A38    dd          005538DD
 00550A38    dd          005538EE
 00550A38    dd          005538FF
 00550A38    dd          005538AA
 00550A38    dd          005538BB
 00550A38    dd          00553D0C
 00550A38    dd          00553DA5
 00550A38    dd          00553DB6
 00550A38    dd          00554108
 00550A38    dd          00554119
 00550A38    dd          0055413B
 00550A38    dd          00553E93
 00550A38    dd          005527BB
 00550A38    dd          005527CC
 00550A38    dd          005527EE
 00550A38    dd          005527FF
 00550A38    dd          00552810
 00550A38    dd          00552821
 00550A38    dd          005541B2
 00550A38    dd          005541C3
 00550A38    dd          005541D4
 00550A38    dd          005541E5
 00550A38    dd          00554207
 00550A38    dd          00554218
 00550A38    dd          00554229
 00550A38    dd          0055423A
 00550A38    dd          00553EE8
 00550A38    dd          00553EF9
 00550A38    dd          00553F0A
 00550A38    dd          00553F1B
 00550A38    dd          00553F2C
 00550A38    dd          00553F3D
 00550A38    dd          00553F5F
 00550A38    dd          00553F70
 00550A38    dd          00553F81
 00550A38    dd          00553F92
 00550A38    dd          00553FA3
 00550A38    dd          00553FB4
 00550A38    dd          00553FD6
 00550A38    dd          00553FE7
 00550A38    dd          00553FF8
 00550A38    dd          00554009
 00550A38    dd          0055401A
 00550A38    dd          0055402B
 00550A38    dd          0055247F
 00550A38    dd          00553B1F
 00550A38    dd          00553B30
 00550A38    dd          00553B52
 00550A38    dd          00553B63
 00550A38    dd          00553B74
 00550A38    dd          00553B85
 00550A38    dd          00553BA7
 00550A38    dd          00553BB8
 00550A38    dd          00553BDA
 00550A38    dd          00553BEB
 00550A38    dd          00553BFC
 00550A38    dd          00553C0D
 00550A38    dd          00553C1E
 00550A38    dd          00553C40
 00550A38    dd          00553C62
 00550A38    dd          00553C84
 00550A38    dd          00553C95
 00550A38    dd          00553CA6
 00550A38    dd          00553327
 00550A38    dd          00553338
 00550A38    dd          005536CE
 00550A38    dd          005536BD
 00550A38    dd          00553613
 00550A38    dd          005526DE
 00550A38    dd          00552667
 00550A38    dd          005526AB
 00550A38    dd          00552612
 00550A38    dd          00552623
 00550A38    dd          00552634
 00550A38    dd          00552F09
 00550A38    dd          00552F1A
 00550A38    dd          00552F2B
 00550A38    dd          00552F3C
 00550A38    dd          00552A96
 00550A38    dd          00552B0D
 00550A38    dd          005527AA
 00550A38    dd          005527DD
 00550A38    dd          00552799
 00550A38    dd          00552645
 00550A38    dd          00552656
 00550A38    dd          005522C5
 00550A38    dd          005522E7
 00550A38    dd          0055236F
 00550A38    dd          00553DE9
 00550A38    dd          00553DFA
 00550A38    dd          00552D71
 00550A38    dd          00552D82
 00550A38    dd          00553734
 00550A38    dd          00553756
 00550A38    dd          00553778
 00550A38    dd          005537DE
 00550A38    dd          005537EF
 00550A38    dd          00553D2E
 00550A38    dd          00553D94
 00550A38    dd          00553D3F
 00550A38    dd          00553D50
 00550A38    dd          00553D61
 00550A38    dd          00553D72
 00550A38    dd          00553D83
 00550A38    dd          00553D1D
 00550A38    dd          005541A1
 00550A38    dd          005541F6
 00550A38    dd          0055437D
 00550A38    dd          005540E6
 00550A38    dd          005540F7
 00550A38    dd          0055412A
 00550A38    dd          00553DC7
 00550A38    dd          00553DD8
 00550A38    dd          005542D3
 00550A38    dd          005542F5
 00550A38    dd          00554317
 00550A38    dd          0055424B
 00550A38    dd          0055425C
 00550A38    dd          00554339
 00550A38    dd          0055435B
 00550A38    dd          00553ED7
 00550A38    dd          00553F4E
 00550A38    dd          00553FC5
 00550A38    dd          0055403C
 00550A38    dd          0055245D
 00550A38    dd          0055246E
 00550A38    dd          005539BA
 00550A38    dd          00553B0E
 00550A38    dd          005539A9
 00550A38    dd          00553BC9
 00550A38    dd          00553B96
 00550A38    dd          00553B41
 00550A38    dd          00553A0F
 00550A38    dd          00553A20
 00550A38    dd          00553A31
 00550A38    dd          00553A42
 00550A38    dd          00553A53
 00550A38    dd          00553A64
 00550A38    dd          00553A75
 00550A38    dd          00553A86
 00550A38    dd          00553A97
 00550A38    dd          00553AB9
 00550A38    dd          00553ACA
 00550A38    dd          00553AA8
 00550A38    dd          00553ADB
 00550A38    dd          00553AEC
 00550A38    dd          00553C2F
 00550A38    dd          00553C51
 00550A38    dd          00553AFD
 00550A38    dd          00553C73
 00550A38    dd          00553305
 00550A38    dd          00553316
 00550A38    dd          00553679
 00550A38    dd          0055368A
 00550A38    dd          0055369B
 00550A38    dd          005536AC
 00550A38    dd          00553624
 00550A38    dd          00553602
 00550A38    dd          005525DF
 00550A38    dd          005525F0
 00550A38    dd          00552601
 00550A38    dd          00551CCB
 00550A38    dd          00551CDC
 00550A38    dd          00551CED
 00550A38    dd          00552B95
 00550A38    dd          00552BA6
 00550A38    dd          00552292
 00550A38    dd          005522A3
 00550A38    dd          005522B4
 00550A38    dd          00552DD7
 00550A38    dd          00552DE8
 00550A38    dd          00552DF9
 00550A38    dd          00552E0A
 00550A38    dd          00552E1B
 00550A38    dd          00552E2C
 00550A38    dd          00552E3D
 00550A38    dd          00552E4E
 00550A38    dd          00552E5F
 00550A38    dd          00552E70
 00550A38    dd          00552E81
 00550A38    dd          00552E92
 00550A38    dd          00552EA3
 00550A38    dd          00552EB4
 00550A38    dd          00552EC5
 00550A38    dd          00552ED6
 00550A38    dd          00552EE7
 00550A38    dd          00552EF8
 00550A38    dd          00552171
 00550A38    dd          00552182
 00550A38    dd          00552193
 00550A38    dd          005537BC
 00550A38    dd          005537CD
 00550A38    dd          005521A4
 00550A38    dd          005521B5
 00550A38    dd          0055406F
 00550A38    dd          00554080
 00550A38    dd          00554091
 00550A38    dd          005521C6
 00550A38    dd          005521D7
 00550A38    dd          005521E8
 00550A38    dd          005521F9
 00550A38    dd          0055220A
 00550A38    dd          0055221B
 00550A38    dd          00552380
 00550A38    dd          00552391
 00550A38    dd          005534D0
 00550A38    dd          005534E1
 00550A38    dd          005534F2
 00550A38    dd          00553503
 00550A38    dd          00553514
 00550A38    dd          00553525
 00550A38    dd          00553536
 00550A38    dd          00553547
 00550A38    dd          00553866
 00550A38    dd          00553877
 00550A38    dd          00553888
 00550A38    dd          00553899
 00550A38    dd          00552A1F
 00550A38    dd          00552A30
 00550A38    dd          00552A41
 00550A38    dd          00552A52
 00550A38    dd          00552A63
 00550A38    dd          0055426D
 00550A38    dd          0055427E
 00550A38    dd          0055428F
 00550A38    dd          005542A0
 00550A38    dd          005542B1
 00550A38    dd          00553090
 00550A38    dd          005530A1
 00550A38    dd          005530B2
 00550A38    dd          005530C3
 00550A38    dd          005530D4
 00550A38    dd          005530E5
 00550A38    dd          005530F6
 00550A38    dd          00553107
 00550A38    dd          00553118
 00550A38    dd          00553129
 00550A38    dd          0055313A
 00550A38    dd          0055314B
 00550A38    dd          00553217
 00550A38    dd          00553228
 00550A38    dd          00553239
 00550A38    dd          0055324A
 00550A38    dd          0055325B
 00550A38    dd          00551DB9
 00550A38    dd          00551DCA
 00550A38    dd          00551DDB
 00550A38    dd          00553635
 00550A38    dd          00553646
 00550A38    dd          00553657
 00550A38    dd          00551DEC
 00550A38    dd          00551DFD
 00550A38    dd          00551E0E
 00550A38    dd          005525AC
 00550A38    dd          00552722
 00550A38    dd          00552733
 00550A38    dd          00552744
 00550A38    dd          00552755
 00550A38    dd          00552766
 00550A38    dd          00552777
 00550A38    dd          00552788
 00550A38    dd          005528ED
 00550A38    dd          005528FE
 00550A38    dd          0055290F
 00550A38    dd          00552920
 00550A38    dd          00552931
 00550A38    dd          00552942
 00550A38    dd          00552953
 00550A38    dd          00552964
 00550A38    dd          00552975
 00550A38    dd          00552986
 00550A38    dd          00552997
 00550A38    dd          005529A8
 00550A38    dd          005529B9
 00550A38    dd          005529CA
 00550A38    dd          005529DB
 00550A38    dd          005529EC
 00550A38    dd          005529FD
 00550A38    dd          00552A0E
 00550A38    dd          00552A74
 00550A38    dd          00552AFC
 00550A38    dd          00552A85
 00550A38    dd          00552BB7
 00550A38    dd          00552BC8
 00550A38    dd          00552BD9
 00550A38    dd          00552BEA
 00550A38    dd          00552BFB
 00550A38    dd          00552C0C
 00550A38    dd          00552C1D
 00550A38    dd          00552C2E
 00550A38    dd          00552C3F
 00550A38    dd          00552C50
 00550A38    dd          00552C61
 00550A38    dd          00552C72
 00550A38    dd          00552C83
 00550A38    dd          00552CFA
 00550A38    dd          00552D0B
 00550A38    dd          00552D1C
 00550A38    dd          00552D2D
 00550A38    dd          00552D3E
 00550A38    dd          00552D4F
 00550A38    dd          00552D60
 00550A38    dd          00552DC6
 00550A38    dd          00552F91
 00550A38    dd          00552FA2
 00550A38    dd          00552FB3
 00550A38    dd          00552FC4
 00550A38    dd          00552FD5
 00550A38    dd          0055223D
 00550A38    dd          0055224E
 00550A38    dd          0055225F
 00550A38    dd          00552270
 00550A38    dd          00552281
 00550A38    dd          00551CFE
 00550A38    dd          00553668
 00550A38    dd          00551D0F
 00550A38    dd          00551D20
 00550A38    dd          00552FE6
 00550A38    dd          00552FF7
 00550A38    dd          00553008
 00550A38    dd          00553019
 00550A38    dd          0055302A
 00550A38    dd          0055303B
 00550A38    dd          0055304C
 00550A38    dd          0055305D
 00550A38    dd          0055306E
 00550A38    dd          0055307F
 00550A38    dd          0055315C
 00550A38    dd          0055316D
 00550A38    dd          0055317E
 00550A38    dd          0055318F
 00550A38    dd          005531A0
 00550A38    dd          005531B1
 00550A38    dd          005531C2
 00550A38    dd          0055326C
 00550A38    dd          005532B0
 00550A38    dd          005532C1
 00550A38    dd          005532D2
 00550A38    dd          005532E3
 00550A38    dd          005532F4
 00550A38    dd          00553349
 00550A38    dd          0055335A
 00550A38    dd          0055336B
 00550A38    dd          00553448
 00550A38    dd          00553459
 00550A38    dd          0055346A
 00550A38    dd          0055347B
 00550A38    dd          0055348C
 00550A38    dd          0055349D
 00550A38    dd          005534AE
 00550A38    dd          005534BF
 00550A38    dd          00553558
 00550A38    dd          00553569
 00550A38    dd          0055357A
 00550A38    dd          0055358B
 00550A38    dd          0055359C
 00550A38    dd          005535AD
 00550A38    dd          005535BE
 00550A38    dd          005535CF
 00550A38    dd          005535E0
 00550A38    dd          005535F1
 00550A38    dd          005536DF
 00550A38    dd          005536F0
 00550A38    dd          00553800
 00550A38    dd          00553811
 00550A38    dd          00553822
 00550A38    dd          00553833
 00550A38    dd          00553844
 00550A38    dd          00553855
 00550A38    dd          00553701
 00550A38    dd          00553712
 00550A38    dd          00553723
 00550A38    dd          00551D31
 00550A38    dd          00553943
 00550A38    dd          00553910
 00550A38    dd          00553921
 00550A38    dd          00553932
 00550A38    dd          00553954
 00550A38    dd          00553965
 00550A38    dd          00553976
 00550A38    dd          00553987
 00550A38    dd          00553998
 00550A38    dd          00553CB7
 00550A38    dd          00553CC8
 00550A38    dd          00553CD9
 00550A38    dd          00553CEA
 00550A38    dd          00553CFB
 00550A38    dd          00553E4F
 00550A38    dd          00553EA4
 00550A38    dd          00553EB5
 00550A38    dd          00553EC6
 00550A38    dd          005523E6
 00550A38    dd          005523F7
 00550A38    dd          00552408
 00550A38    dd          00552490
 00550A38    dd          005540D5
 00550A38    dd          005540A2
 00550A38    dd          005540B3
 00550A38    dd          005540C4
 00550A38    dd          00551E1F
 00550A38    dd          00551E30
 00550A38    dd          00551E41
 00550A38    dd          00551E52
 00550A38    dd          00551E63
 00550A38    dd          00551E74
 00550A38    dd          00551E85
 00550A38    dd          00551E96
 00550A38    dd          00551EA7
 00550A38    dd          00551EB8
 00550A38    dd          00551EC9
 00550A38    dd          00551EDA
 00550A38    dd          00551EEB
 00550A38    dd          00552898
 00550A38    dd          00551EFC
 00550A38    dd          00551F0D
 00550A38    dd          00551F1E
 00550A38    dd          00551F2F
 00550A38    dd          00551F40
 00550A38    dd          00551F51
 00550A38    dd          00551F62
 00550A38    dd          00551F73
 00550A38    dd          00551F84
 00550A38    dd          00551F95
 00550A38    dd          00551FA6
 00550A38    dd          00551FB7
 00550A38    dd          00551FC8
 00550A38    dd          00551FD9
 00550A38    dd          00551FEA
 00550A38    dd          00551FFB
 00550A38    dd          0055200C
 00550A38    dd          0055201D
 00550A38    dd          0055202E
 00550A38    dd          0055203F
 00550A38    dd          00552050
 00550A38    dd          00552061
 00550A38    dd          00552072
 00550A38    dd          00552083
 00550A38    dd          00552887
 00550A38    dd          005528A9
 00550A38    dd          005528BA
 00550A38    dd          005528CB
 00550A38    dd          005528DC
 00550A38    dd          00552094
 00550A38    dd          005520A5
 00550A38    dd          005520B6
 00550A38    dd          00554405
 00550A38    dd          005520C7
 00550A38    dd          005524A1
 00550A38    dd          005524B2
 00550A38    dd          005524C3
 00550A38    dd          005524D4
 00550A38    dd          00554427
 00550A38    dd          00554438
 00550A38    dd          00554449
 00550A38    dd          0055445A
 00550A38    dd          0055446B
 00550A38    dd          0055447C
 00550A38    dd          0055448D
 00550A38    dd          0055449E
 00550A38    dd          005520D8
 00550A38    dd          005520E9
 00550A38    dd          005520FA
 00550A38    dd          0055210B
 00550A38    dd          0055211C
 00550A38    dd          0055212D
 00550A38    dd          0055213E
 00550A38    dd          0055214F
 00550A38    dd          00552160
 00550A38    dd          005531F5
 00550A38    dd          00553206
 00550A38    dd          0055339E
 00550A38    dd          005533E2
 00550A38    dd          005525A0
 00550A38    dd          0055222C
 00550A38    dd          005544AF
 00550A38    dd          0055452B
 00550A38    dd          00554539
 00550A38    dd          00554540
 00550A38    dd          00554540
 00550A38    dd          00554540
 00550A38    dd          00554540
 00550A38    dd          00554540
 00550A38    dd          00554540
 00550A38    dd          00554540
 00550A38    dd          005544BB
 00550A38    dd          005544C9
 00550A38    dd          005544D7
 00550A38    dd          005544E5
 00550A38    dd          005544F3
 00550A38    dd          00554501
 00550A38    dd          0055450F
 00550A38    dd          0055451D
 0055159F    mov         eax,ebx
 005515A1    mov         edx,55454C;'topeništì'
 005515A6    call        @LStrAsg
>005515AB    jmp         00554540
 005515B0    mov         eax,ebx
 005515B2    mov         edx,554560;'polévka'
 005515B7    call        @LStrAsg
>005515BC    jmp         00554540
 005515C1    mov         eax,ebx
 005515C3    mov         edx,554570;'døevìný štít'
 005515C8    call        @LStrAsg
>005515CD    jmp         00554540
 005515D2    mov         eax,ebx
 005515D4    mov         edx,554588;'pochodeò'
 005515D9    call        @LStrAsg
>005515DE    jmp         00554540
 005515E3    mov         eax,ebx
 005515E5    mov         edx,55459C;'hoøící pochodeò'
 005515EA    call        @LStrAsg
>005515EF    jmp         00554540
 005515F4    mov         eax,ebx
 005515F6    mov         edx,5545B4;'køesadlo'
 005515FB    call        @LStrAsg
>00551600    jmp         00554540
 00551605    mov         eax,ebx
 00551607    mov         edx,5545C8;'flakón s lékem'
 0055160C    call        @LStrAsg
>00551611    jmp         00554540
 00551616    mov         eax,ebx
 00551618    mov         edx,5545E0;'prázdný korbel'
 0055161D    call        @LStrAsg
>00551622    jmp         00554540
 00551627    mov         eax,ebx
 00551629    mov         edx,5545F8;'korbel s pivem'
 0055162E    call        @LStrAsg
>00551633    jmp         00554540
 00551638    mov         eax,ebx
 0055163A    mov         edx,554610;'hadr od oleje'
 0055163F    call        @LStrAsg
>00551644    jmp         00554540
 00551649    mov         eax,ebx
 0055164B    mov         edx,554628;'hadr'
 00551650    call        @LStrAsg
>00551655    jmp         00554540
 0055165A    mov         eax,ebx
 0055165C    mov         edx,554638;'nahlodané stehno'
 00551661    call        @LStrAsg
>00551666    jmp         00554540
 0055166B    mov         eax,ebx
 0055166D    mov         edx,554654;'kovák'
 00551672    call        @LStrAsg
>00551677    jmp         00554540
 0055167C    mov         eax,ebx
 0055167E    mov         edx,554664;'kýbl'
 00551683    call        @LStrAsg
>00551688    jmp         00554540
 0055168D    mov         eax,ebx
 0055168F    mov         edx,554674;'kýbl s uhlím'
 00551694    call        @LStrAsg
>00551699    jmp         00554540
 0055169E    mov         eax,ebx
 005516A0    mov         edx,55468C;'krumpáè'
 005516A5    call        @LStrAsg
>005516AA    jmp         00554540
 005516AF    mov         eax,ebx
 005516B1    mov         edx,55469C;'dmýchací mìch'
 005516B6    call        @LStrAsg
>005516BB    jmp         00554540
 005516C0    mov         eax,ebx
 005516C2    mov         edx,5546B4;'pýchavka dùlní'
 005516C7    call        @LStrAsg
>005516CC    jmp         00554540
 005516D1    mov         eax,ebx
 005516D3    mov         edx,5546CC;'ozubené kolo'
 005516D8    call        @LStrAsg
>005516DD    jmp         00554540
 005516E2    mov         eax,ebx
 005516E4    mov         edx,5546E4;'malé ozubené kolo'
 005516E9    call        @LStrAsg
>005516EE    jmp         00554540
 005516F3    mov         eax,ebx
 005516F5    mov         edx,554700;'klíè'
 005516FA    call        @LStrAsg
>005516FF    jmp         00554540
 00551704    mov         eax,ebx
 00551706    mov         edx,554710;'zlaté úlomky'
 0055170B    call        @LStrAsg
>00551710    jmp         00554540
 00551715    mov         eax,ebx
 00551717    mov         edx,554728;'zlaák'
 0055171C    call        @LStrAsg
>00551721    jmp         00554540
 00551726    mov         eax,ebx
 00551728    mov         edx,554738;'èíše'
 0055172D    call        @LStrAsg
>00551732    jmp         00554540
 00551737    mov         eax,ebx
 00551739    mov         edx,554748;'karafa s vínem'
 0055173E    call        @LStrAsg
>00551743    jmp         00554540
 00551748    mov         eax,ebx
 0055174A    mov         edx,554760;'ohnutá tyè'
 0055174F    call        @LStrAsg
>00551754    jmp         00554540
 00551759    mov         eax,ebx
 0055175B    mov         edx,554774;'hlava zelí'
 00551760    call        @LStrAsg
>00551765    jmp         00554540
 0055176A    mov         eax,ebx
 0055176C    mov         edx,554788;'kus chleba'
 00551771    call        @LStrAsg
>00551776    jmp         00554540
 0055177B    mov         eax,ebx
 0055177D    mov         edx,55479C;'kyj'
 00551782    call        @LStrAsg
>00551787    jmp         00554540
 0055178C    mov         eax,ebx
 0055178E    mov         edx,5547A8;'tupá sekera'
 00551793    call        @LStrAsg
>00551798    jmp         00554540
 0055179D    mov         eax,ebx
 0055179F    mov         edx,5547BC;'sekera'
 005517A4    call        @LStrAsg
>005517A9    jmp         00554540
 005517AE    mov         eax,ebx
 005517B0    mov         edx,5547CC;'palcát'
 005517B5    call        @LStrAsg
>005517BA    jmp         00554540
 005517BF    mov         eax,ebx
 005517C1    mov         edx,5547DC;'bojová palice'
 005517C6    call        @LStrAsg
>005517CB    jmp         00554540
 005517D0    mov         eax,ebx
 005517D2    mov         edx,5547F4;'kroužková vesta'
 005517D7    call        @LStrAsg
>005517DC    jmp         00554540
 005517E1    mov         eax,ebx
 005517E3    mov         edx,55480C;'pøilbice'
 005517E8    call        @LStrAsg
>005517ED    jmp         00554540
 005517F2    mov         eax,ebx
 005517F4    mov         edx,554820;'lano'
 005517F9    call        @LStrAsg
>005517FE    jmp         00554540
 00551803    mov         eax,ebx
 00551805    mov         edx,554830;'váèek s tabákem'
 0055180A    call        @LStrAsg
>0055180F    jmp         00554540
 00551814    mov         eax,ebx
 00551816    mov         edx,554848;'hrstka síry'
 0055181B    call        @LStrAsg
>00551820    jmp         00554540
 00551825    mov         eax,ebx
 00551827    mov         edx,55485C;'grimoár'
 0055182C    call        @LStrAsg
>00551831    jmp         00554540
 00551836    mov         eax,ebx
 00551838    mov         edx,55486C;'kýbl s vodou'
 0055183D    call        @LStrAsg
>00551842    jmp         00554540
 00551847    mov         eax,ebx
 00551849    mov         edx,554884;'èíše s vodou'
 0055184E    call        @LStrAsg
>00551853    jmp         00554540
 00551858    mov         eax,ebx
 0055185A    mov         edx,55489C;'kohout'
 0055185F    call        @LStrAsg
>00551864    jmp         00554540
 00551869    mov         eax,ebx
 0055186B    mov         edx,5548AC;'dveøe'
 00551870    call        @LStrAsg
>00551875    jmp         00554540
 0055187A    mov         eax,ebx
 0055187C    mov         edx,5548BC;'pramen'
 00551881    call        @LStrAsg
>00551886    jmp         00554540
 0055188B    mov         eax,ebx
 0055188D    mov         edx,5548CC;'výkal'
 00551892    call        @LStrAsg
>00551897    jmp         00554540
 0055189C    mov         eax,ebx
 0055189E    mov         edx,5548DC;'nemocný dìd'
 005518A3    call        @LStrAsg
>005518A8    jmp         00554540
 005518AD    mov         eax,ebx
 005518AF    mov         edx,5548F0;'postava'
 005518B4    call        @LStrAsg
>005518B9    jmp         00554540
 005518BE    mov         eax,ebx
 005518C0    mov         edx,554848;'hrstka síry'
 005518C5    call        @LStrAsg
>005518CA    jmp         00554540
 005518CF    mov         eax,ebx
 005518D1    mov         edx,554900;'kováky'
 005518D6    call        @LStrAsg
>005518DB    jmp         00554540
 005518E0    mov         eax,ebx
 005518E2    mov         edx,554654;'kovák'
 005518E7    call        @LStrAsg
>005518EC    jmp         00554540
 005518F1    mov         eax,ebx
 005518F3    mov         edx,554910;'zeï'
 005518F8    call        @LStrAsg
>005518FD    jmp         00554540
 00551902    mov         eax,ebx
 00551904    mov         edx,55491C;'železná truhla'
 00551909    call        @LStrAsg
>0055190E    jmp         00554540
 00551913    mov         eax,ebx
 00551915    mov         edx,554934;'kronika'
 0055191A    call        @LStrAsg
>0055191F    jmp         00554540
 00551924    mov         eax,ebx
 00551926    mov         edx,554944;'sud'
 0055192B    call        @LStrAsg
>00551930    jmp         00554540
 00551935    mov         eax,ebx
 00551937    mov         edx,554950;'schránka'
 0055193C    call        @LStrAsg
>00551941    jmp         00554540
 00551946    mov         eax,ebx
 00551948    mov         edx,554964;'šejdíø'
 0055194D    call        @LStrAsg
>00551952    jmp         00554540
 00551957    mov         eax,ebx
 00551959    mov         edx,554974;'Kováøský mistr'
 0055195E    call        @LStrAsg
>00551963    jmp         00554540
 00551968    mov         eax,ebx
 0055196A    mov         edx,55498C;'žebraèka'
 0055196F    call        @LStrAsg
>00551974    jmp         00554540
 00551979    mov         eax,ebx
 0055197B    mov         edx,5549A0;'klika'
 00551980    call        @LStrAsg
>00551985    jmp         00554540
 0055198A    mov         eax,ebx
 0055198C    mov         edx,5549B0;'rumpál'
 00551991    call        @LStrAsg
>00551996    jmp         00554540
 0055199B    mov         eax,ebx
 0055199D    mov         edx,5549C0;'sud se zelím'
 005519A2    call        @LStrAsg
>005519A7    jmp         00554540
 005519AC    mov         eax,ebx
 005519AE    mov         edx,5549D8;'smradlavý sud'
 005519B3    call        @LStrAsg
>005519B8    jmp         00554540
 005519BD    mov         eax,ebx
 005519BF    mov         edx,5549F0;'stráž'
 005519C4    call        @LStrAsg
>005519C9    jmp         00554540
 005519CE    mov         eax,ebx
 005519D0    mov         edx,554A00;'Døevorubec'
 005519D5    call        @LStrAsg
>005519DA    jmp         00554540
 005519DF    mov         eax,ebx
 005519E1    mov         edx,554A14;'vozka'
 005519E6    call        @LStrAsg
>005519EB    jmp         00554540
 005519F0    mov         eax,ebx
 005519F2    mov         edx,554A24;'mrtvý kùò'
 005519F7    call        @LStrAsg
>005519FC    jmp         00554540
 00551A01    mov         eax,ebx
 00551A03    mov         edx,554A38;'babice'
 00551A08    call        @LStrAsg
>00551A0D    jmp         00554540
 00551A12    mov         eax,ebx
 00551A14    mov         edx,554A48;'výèep'
 00551A19    call        @LStrAsg
>00551A1E    jmp         00554540
 00551A23    mov         eax,ebx
 00551A25    mov         edx,554A58;'skrýš'
 00551A2A    call        @LStrAsg
>00551A2F    jmp         00554540
 00551A34    mov         eax,ebx
 00551A36    mov         edx,554A68;'police'
 00551A3B    call        @LStrAsg
>00551A40    jmp         00554540
 00551A45    mov         eax,ebx
 00551A47    mov         edx,554A78;'pavuèina'
 00551A4C    call        @LStrAsg
>00551A51    jmp         00554540
 00551A56    mov         eax,ebx
 00551A58    mov         edx,554A8C;'nablito'
 00551A5D    call        @LStrAsg
>00551A62    jmp         00554540
 00551A67    mov         eax,ebx
 00551A69    mov         edx,554A9C;'pøevrácená židle'
 00551A6E    call        @LStrAsg
>00551A73    jmp         00554540
 00551A78    mov         eax,ebx
 00551A7A    mov         edx,554AB8;'erb'
 00551A7F    call        @LStrAsg
>00551A84    jmp         00554540
 00551A89    mov         eax,ebx
 00551A8B    mov         edx,554AC4;'hrnec'
 00551A90    call        @LStrAsg
>00551A95    jmp         00554540
 00551A9A    mov         eax,ebx
 00551A9C    mov         edx,554AD4;'skoøápkáø'
 00551AA1    call        @LStrAsg
>00551AA6    jmp         00554540
 00551AAB    mov         eax,ebx
 00551AAD    mov         edx,554AE8;'žebravý dudák'
 00551AB2    call        @LStrAsg
>00551AB7    jmp         00554540
 00551ABC    mov         eax,ebx
 00551ABE    mov         edx,554B00;'hospodský'
 00551AC3    call        @LStrAsg
>00551AC8    jmp         00554540
 00551ACD    mov         eax,ebx
 00551ACF    mov         edx,554B14;'opilec'
 00551AD4    call        @LStrAsg
>00551AD9    jmp         00554540
 00551ADE    mov         eax,ebx
 00551AE0    mov         edx,554B24;'horník'
 00551AE5    call        @LStrAsg
>00551AEA    jmp         00554540
 00551AEF    mov         eax,ebx
 00551AF1    mov         edx,554B34;'starý horník'
 00551AF6    call        @LStrAsg
>00551AFB    jmp         00554540
 00551B00    mov         eax,ebx
 00551B02    mov         edx,554B4C;'otvor'
 00551B07    call        @LStrAsg
>00551B0C    jmp         00554540
 00551B11    mov         eax,ebx
 00551B13    mov         edx,554B5C;'trubièka'
 00551B18    call        @LStrAsg
>00551B1D    jmp         00554540
 00551B22    mov         eax,ebx
 00551B24    mov         edx,554B70;'trichtýø'
 00551B29    call        @LStrAsg
>00551B2E    jmp         00554540
 00551B33    mov         eax,ebx
 00551B35    mov         edx,554B84;'dvíøka'
 00551B3A    call        @LStrAsg
>00551B3F    jmp         00554540
 00551B44    mov         eax,ebx
 00551B46    mov         edx,554B94;'zlaáky'
 00551B4B    call        @LStrAsg
>00551B50    jmp         00554540
 00551B55    mov         eax,ebx
 00551B57    mov         edx,554BA4;'høídel'
 00551B5C    call        @LStrAsg
>00551B61    jmp         00554540
 00551B66    mov         eax,ebx
 00551B68    mov         edx,554BB4;'zlatá žíla'
 00551B6D    call        @LStrAsg
>00551B72    jmp         00554540
 00551B77    mov         eax,ebx
 00551B79    mov         edx,554BC8;'houba'
 00551B7E    call        @LStrAsg
>00551B83    jmp         00554540
 00551B88    mov         eax,ebx
 00551B8A    mov         edx,554BD8;'svitky'
 00551B8F    call        @LStrAsg
>00551B94    jmp         00554540
 00551B99    mov         eax,ebx
 00551B9B    mov         edx,554BE8;'lucerna'
 00551BA0    call        @LStrAsg
>00551BA5    jmp         00554540
 00551BAA    mov         eax,ebx
 00551BAC    mov         edx,554BF8;'šuplík'
 00551BB1    call        @LStrAsg
>00551BB6    jmp         00554540
 00551BBB    mov         eax,ebx
 00551BBD    mov         edx,554C08;'páka'
 00551BC2    call        @LStrAsg
>00551BC7    jmp         00554540
 00551BCC    mov         eax,ebx
 00551BCE    mov         edx,554C18;'uhlí'
 00551BD3    call        @LStrAsg
>00551BD8    jmp         00554540
 00551BDD    mov         eax,ebx
 00551BDF    mov         edx,554C28;'Nemám štít!'
 00551BE4    call        @LStrAsg
>00551BE9    jmp         00554540
 00551BEE    mov         eax,ebx
 00551BF0    mov         edx,554C3C;'Levá!'
 00551BF5    call        @LStrAsg
>00551BFA    jmp         00554540
 00551BFF    mov         eax,ebx
 00551C01    mov         edx,554C4C;'Prostøední!'
 00551C06    call        @LStrAsg
>00551C0B    jmp         00554540
 00551C10    mov         eax,ebx
 00551C12    mov         edx,554C60;'Pravá!'
 00551C17    call        @LStrAsg
>00551C1C    jmp         00554540
 00551C21    mov         eax,ebx
 00551C23    mov         edx,554C70;'Mìl jsem si pospíšit. Chudák kùò...'
 00551C28    call        @LStrAsg
>00551C2D    jmp         00554540
 00551C32    mov         eax,ebx
 00551C34    mov         edx,554C9C;'U všech ïáblù, zešílel jsi?#Okamžitì to zavøi!'
 00551C39    call        @LStrAsg
>00551C3E    jmp         00554540
 00551C43    mov         eax,ebx
 00551C45    mov         edx,554CD4;'Mohutný dùlní zával, dál ani krok...'
 00551C4A    call        @LStrAsg
>00551C4F    jmp         00554540
 00551C54    mov         eax,ebx
 00551C56    mov         edx,554D04;'Zborcená chodba dál...'
 00551C5B    call        @LStrAsg
>00551C60    jmp         00554540
 00551C65    mov         eax,ebx
 00551C67    mov         edx,554D24;'Strop se bortí!'
 00551C6C    call        @LStrAsg
>00551C71    jmp         00554540
 00551C76    mov         eax,ebx
 00551C78    mov         edx,554D3C;'zrušit'
 00551C7D    call        @LStrAsg
>00551C82    jmp         00554540
 00551C87    mov         eax,ebx
 00551C89    mov         edx,554D4C;'Hle, malý klíè jakýsi...'
 00551C8E    call        @LStrAsg
>00551C93    jmp         00554540
 00551C98    mov         eax,ebx
 00551C9A    mov         edx,554D70;'Krom štìnic tam jiného již nic není...'
 00551C9F    call        @LStrAsg
>00551CA4    jmp         00554540
 00551CA9    mov         eax,ebx
 00551CAB    mov         edx,554DA0;'Vida, pár pochodní do zásoby pøijde vhod...'
 00551CB0    call        @LStrAsg
>00551CB5    jmp         00554540
 00551CBA    mov         eax,ebx
 00551CBC    mov         edx,554DD4;'Bez pochodnì tu zabloudím nebo nìkam zahuèím!'
 00551CC1    call        @LStrAsg
>00551CC6    jmp         00554540
 00551CCB    mov         eax,ebx
 00551CCD    mov         edx,554E0C;'Jen èmoud dusivý, málo vzduchu!'
 00551CD2    call        @LStrAsg
>00551CD7    jmp         00554540
 00551CDC    mov         eax,ebx
 00551CDE    mov         edx,554E34;'Teï to rozdmýchalo poøádný žár!'
 00551CE3    call        @LStrAsg
>00551CE8    jmp         00554540
 00551CED    mov         eax,ebx
 00551CEF    mov         edx,554E5C;'Vida, klíè pasuje!'
 00551CF4    call        @LStrAsg
>00551CF9    jmp         00554540
 00551CFE    mov         eax,ebx
 00551D00    mov         edx,554E78;'Kopnul jsem to pod postel, nejlepší to úklid!'
 00551D05    call        @LStrAsg
>00551D0A    jmp         00554540
 00551D0F    mov         eax,ebx
 00551D11    mov         edx,554EB0;'Velký orezlý hrnec se zaschlými kusy zpeèeného žrádla po stìnách,#kdepak lop...
 00551D16    call        @LStrAsg
>00551D1B    jmp         00554540
 00551D20    mov         eax,ebx
 00551D22    mov         edx,554F4C;'V hrnci to vøe, èas naházet všechny pøísady...'
 00551D27    call        @LStrAsg
>00551D2C    jmp         00554540
 00551D31    mov         eax,ebx
 00551D33    mov         edx,554F84;'Nejstrašnìjší tvor svìta, i koštìtem se tìžko pøiblížit!'
 00551D38    call        @LStrAsg
>00551D3D    jmp         00554540
 00551D42    mov         eax,ebx
 00551D44    mov         edx,554FC8;'Sud je prázdný!'
 00551D49    call        @LStrAsg
>00551D4E    jmp         00554540
 00551D53    mov         eax,ebx
 00551D55    mov         edx,554FE0;'U všech hospodských, hrstka síry na èištìní vychlastaných sudù...#Tu si ovše...
 00551D5A    call        @LStrAsg
>00551D5F    jmp         00554540
 00551D64    mov         eax,ebx
 00551D66    mov         edx,555040;'Vida ho, hamouna, mìl tam zašitou zlatku ještì!'
 00551D6B    call        @LStrAsg
>00551D70    jmp         00554540
 00551D75    mov         eax,ebx
 00551D77    mov         edx,555078;'Nic více potøebného...'
 00551D7C    call        @LStrAsg
>00551D81    jmp         00554540
 00551D86    mov         eax,ebx
 00551D88    mov         edx,555098;'Pekelný stroj nepracuje, nìkde je zádrhel!'
 00551D8D    call        @LStrAsg
>00551D92    jmp         00554540
 00551D97    mov         eax,ebx
 00551D99    mov         edx,5550CC;'Pochodeò dohoøela.'
 00551D9E    call        @LStrAsg
>00551DA3    jmp         00554540
 00551DA8    mov         eax,ebx
 00551DAA    mov         edx,5550E8;'U všech kozlù, poslední pivo a sud mìl do veèera vydržet!'
 00551DAF    call        @LStrAsg
>00551DB4    jmp         00554540
 00551DB9    mov         eax,ebx
 00551DBB    mov         edx,55512C;'Botama rozdupu hlavu zelí s pøedstavou tváøe hospodského,#ó jak dùmyslnì jse...
 00551DC0    call        @LStrAsg
>00551DC5    jmp         00554540
 00551DCA    mov         eax,ebx
 00551DCC    mov         edx,555194;'Kusance toho oblemtaného olezlého masa házím k varu.'
 00551DD1    call        @LStrAsg
>00551DD6    jmp         00554540
 00551DDB    mov         eax,ebx
 00551DDD    mov         edx,5551D4;'Tabák i s váèkem, a se pochutina zažlutí,#a jen samotný pohled strávníka n...
 00551DE2    call        @LStrAsg
>00551DE7    jmp         00554540
 00551DEC    mov         eax,ebx
 00551DEE    mov         edx,555230;'Nemám zbraò!'
 00551DF3    call        @LStrAsg
>00551DF8    jmp         00554540
 00551DFD    mov         eax,ebx
 00551DFF    mov         edx,555248;'Hle, cosi starým písmem vyrytého:'
 00551E04    call        @LStrAsg
>00551E09    jmp         00554540
 00551E0E    mov         eax,ebx
 00551E10    mov         edx,555274;'Víno si pošetøím na horší èasy!'
 00551E15    call        @LStrAsg
>00551E1A    jmp         00554540
 00551E1F    mov         eax,ebx
 00551E21    mov         edx,55529C;'Hory, krumpáèe a pivo - to vskutku charakter mìsta.'
 00551E26    call        @LStrAsg
>00551E2B    jmp         00554540
 00551E30    mov         eax,ebx
 00551E32    mov         edx,5552DC;'Velmi chatrné zdìní,#které jistì není prací zdatného zedníka...'
 00551E37    call        @LStrAsg
>00551E3C    jmp         00554540
 00551E41    mov         eax,ebx
 00551E43    mov         edx,555324;'Pak tu nemá øádit mor, když kdejaký otrapa nasere na zem...'
 00551E48    call        @LStrAsg
>00551E4D    jmp         00554540
 00551E52    mov         eax,ebx
 00551E54    mov         edx,555368;'Hle, døevìný štít z tvrdého døeva nalezl nového pána.'
 00551E59    call        @LStrAsg
>00551E5E    jmp         00554540
 00551E63    mov         eax,ebx
 00551E65    mov         edx,5553A8;'Ostnatý kyj!#Ten se mùže hodit i v hospodì pøi rozhánìní hornických bitek......
 00551E6A    call        @LStrAsg
>00551E6F    jmp         00554540
 00551E74    mov         eax,ebx
 00551E76    mov         edx,555400;'Hle, dvanáct kovových do mìšce!'
 00551E7B    call        @LStrAsg
>00551E80    jmp         00554540
 00551E85    mov         eax,ebx
 00551E87    mov         edx,555428;'Hle, zakutálený poklad!'
 00551E8C    call        @LStrAsg
>00551E91    jmp         00554540
 00551E96    mov         eax,ebx
 00551E98    mov         edx,555448;'Plesnivý hadr na utírání blitek.'
 00551E9D    call        @LStrAsg
>00551EA2    jmp         00554540
 00551EA7    mov         eax,ebx
 00551EA9    mov         edx,555474;'Zamèené bytelné dveøe.'
 00551EAE    call        @LStrAsg
>00551EB3    jmp         00554540
 00551EB8    mov         eax,ebx
 00551EBA    mov         edx,555494;'U všech ïasù, jak se mohly zaseknout?'
 00551EBF    call        @LStrAsg
>00551EC4    jmp         00554540
 00551EC9    mov         eax,ebx
 00551ECB    mov         edx,5554C4;'Zatracená páka zaseknutá, døe o letitou rez.'
 00551ED0    call        @LStrAsg
>00551ED5    jmp         00554540
 00551EDA    mov         eax,ebx
 00551EDC    mov         edx,5554FC;'Ze skály prýští voda prùzraèná...'
 00551EE1    call        @LStrAsg
>00551EE6    jmp         00554540
 00551EEB    mov         eax,ebx
 00551EED    mov         edx,555528;'Vida, v lampì zùstalo ještì dosti oleje...'
 00551EF2    call        @LStrAsg
>00551EF7    jmp         00554540
 00551EFC    mov         eax,ebx
 00551EFE    mov         edx,55555C;'Vyvrhnuté nestrávené pivo s koøalkou a hleny...'
 00551F03    call        @LStrAsg
>00551F08    jmp         00554540
 00551F0D    mov         eax,ebx
 00551F0F    mov         edx,555594;'Zde odpoèívají otluèené korbely.'
 00551F14    call        @LStrAsg
>00551F19    jmp         00554540
 00551F1E    mov         eax,ebx
 00551F20    mov         edx,5555C0;'Na rumpálu lano odøíznuté,#aby nikdo nenabíral vodu morem nakaženou...'
 00551F25    call        @LStrAsg
>00551F2A    jmp         00554540
 00551F2F    mov         eax,ebx
 00551F31    mov         edx,555610;'Radìji na nì nebudu sahat.'
 00551F36    call        @LStrAsg
>00551F3B    jmp         00554540
 00551F40    mov         eax,ebx
 00551F42    mov         edx,555634;'Hromada døevìného uhlí.'
 00551F47    call        @LStrAsg
>00551F4C    jmp         00554540
 00551F51    mov         eax,ebx
 00551F53    mov         edx,555654;'Zápisy neèitelné jsou...'
 00551F58    call        @LStrAsg
>00551F5D    jmp         00554540
 00551F62    mov         eax,ebx
 00551F64    mov         edx,555678;'Starý rezavý kbelík hornický...'
 00551F69    call        @LStrAsg
>00551F6E    jmp         00554540
 00551F73    mov         eax,ebx
 00551F75    mov         edx,5556A0;'Sud plný shnilých hornických hadrù po èpavku èpí!'
 00551F7A    call        @LStrAsg
>00551F7F    jmp         00554540
 00551F84    mov         eax,ebx
 00551F86    mov         edx,5556DC;'Halda jakýchsi svitkù hornických, mapy, nákresy, poznámky...#Mìl bych se v t...
 00551F8B    call        @LStrAsg
>00551F90    jmp         00554540
 00551F95    mov         eax,ebx
 00551F97    mov         edx,555740;'Vskutku zajímavé - Skálotrhající smìs:#„smíchat v sudu èpavek, pìt hrstí sír...
 00551F9C    call        @LStrAsg
>00551FA1    jmp         00554540
 00551FA6    mov         eax,ebx
 00551FA8    mov         edx,5557D4;'Zamèená a nedobytná!'
 00551FAD    call        @LStrAsg
>00551FB2    jmp         00554540
 00551FB7    mov         eax,ebx
 00551FB9    mov         edx,5557F4;'Hle, 30 kovových do kapsy!'
 00551FBE    call        @LStrAsg
>00551FC3    jmp         00554540
 00551FC8    mov         eax,ebx
 00551FCA    mov         edx,555818;'Brr, z ostatních hlávek zelných jen kaše zbyla...'
 00551FCF    call        @LStrAsg
>00551FD4    jmp         00554540
 00551FD9    mov         eax,ebx
 00551FDB    mov         edx,555854;'Puch tak pøíšerný a teplý se line z toho sudu,#že krájet by se dal!'
 00551FE0    call        @LStrAsg
>00551FE5    jmp         00554540
 00551FEA    mov         eax,ebx
 00551FEC    mov         edx,5558A0;'Hle, tajná škvíra dle rady nebohého starce!'
 00551FF1    call        @LStrAsg
>00551FF6    jmp         00554540
 00551FFB    mov         eax,ebx
 00551FFD    mov         edx,5558D4;'Høídel.'
 00552002    call        @LStrAsg
>00552007    jmp         00554540
 0055200C    mov         eax,ebx
 0055200E    mov         edx,5558E4;'Trubice pro vhánìní vzduchu, nejspíše...'
 00552013    call        @LStrAsg
>00552018    jmp         00554540
 0055201D    mov         eax,ebx
 0055201F    mov         edx,555918;'Hmm, sem staèí sypat hroudy surového zlata...'
 00552024    call        @LStrAsg
>00552029    jmp         00554540
 0055202E    mov         eax,ebx
 00552030    mov         edx,555950;'U všech žebrákù, našel jsem žílu zlata!'
 00552035    call        @LStrAsg
>0055203A    jmp         00554540
 0055203F    mov         eax,ebx
 00552041    mov         edx,555980;'Jen prach a starý popel v topeništi...'
 00552046    call        @LStrAsg
>0055204B    jmp         00554540
 00552050    mov         eax,ebx
 00552052    mov         edx,5559B0;'Topeništì napìchováno uhlím!'
 00552057    call        @LStrAsg
>0055205C    jmp         00554540
 00552061    mov         eax,ebx
 00552063    mov         edx,554E0C;'Jen èmoud dusivý, málo vzduchu!'
 00552068    call        @LStrAsg
>0055206D    jmp         00554540
 00552072    mov         eax,ebx
 00552074    mov         edx,5559D8;'Výheò rovna jámì pekelné!'
 00552079    call        @LStrAsg
>0055207E    jmp         00554540
 00552083    mov         eax,ebx
 00552085    mov         edx,554D04;'Zborcená chodba dál...'
 0055208A    call        @LStrAsg
>0055208F    jmp         00554540
 00552094    mov         eax,ebx
 00552096    mov         edx,5559FC;'Voda pohøbila na dlouhé vìky spodní patra...'
 0055209B    call        @LStrAsg
>005520A0    jmp         00554540
 005520A5    mov         eax,ebx
 005520A7    mov         edx,555A34;'V hospodì žádné lano nemáme, tím jsem si jist...'
 005520AC    call        @LStrAsg
>005520B1    jmp         00554540
 005520B6    mov         eax,ebx
 005520B8    mov         edx,555A70;'Kvùli morovému šílenství jsou vnitøní brány mìsta zavøené...'
 005520BD    call        @LStrAsg
>005520C2    jmp         00554540
 005520C7    mov         eax,ebx
 005520C9    mov         edx,555AB8;'Vnìjší brány otevírá jen stráž jilemnická...'
 005520CE    call        @LStrAsg
>005520D3    jmp         00554540
 005520D8    mov         eax,ebx
 005520DA    mov         edx,555AF0;'Divné houby lepkavé, jejich výtrusy kùži k svìdìní dráždí!'
 005520DF    call        @LStrAsg
>005520E4    jmp         00554540
 005520E9    mov         eax,ebx
 005520EB    mov         edx,555B34;'U všech ïasù, tolik sudù.#Kdyby v nich bylo pivo, mám po starostech...'
 005520F0    call        @LStrAsg
>005520F5    jmp         00554540
 005520FA    mov         eax,ebx
 005520FC    mov         edx,555B84;'Vezdejší zatuchlost není vùbec nepøíjemná,#èpí tajemnem a smíølivým dojmem z...
 00552101    call        @LStrAsg
>00552106    jmp         00554540
 0055210B    mov         eax,ebx
 0055210D    mov         edx,555BE4;'Všude kolem podupané zrní,#hluboká zde zásobnice na obilí nejspíše.'
 00552112    call        @LStrAsg
>00552117    jmp         00554540
 0055211C    mov         eax,ebx
 0055211E    mov         edx,555C30;'Džbány z pálené hlíny páchnou po nìjakém kvasu vyèpìlém!'
 00552123    call        @LStrAsg
>00552128    jmp         00554540
 0055212D    mov         eax,ebx
 0055212F    mov         edx,555C74;'Zde trámy neunesly více tíhu hory...'
 00552134    call        @LStrAsg
>00552139    jmp         00554540
 0055213E    mov         eax,ebx
 00552140    mov         edx,555CA4;'Poustevnické pelešištì. Nepoøádek a hniloba.#Starý pelech èervy prolezlý, lé...
 00552145    call        @LStrAsg
>0055214A    jmp         00554540
 0055214F    mov         eax,ebx
 00552151    mov         edx,555D10;'Místo posledního spoèinutí nejspíše,#rakve tìžko zakopávat do kamene.'
 00552156    call        @LStrAsg
>0055215B    jmp         00554540
 00552160    mov         eax,ebx
 00552162    mov         edx,555D60;'Ubohý to høbitov.#Do otevøených rakví slézají se dùlní brebery hodovat.'
 00552167    call        @LStrAsg
>0055216C    jmp         00554540
 00552171    mov         eax,ebx
 00552173    mov         edx,555DB0;'Dobytci odporní, nièím více nejsou a nebudou!'
 00552178    call        @LStrAsg
>0055217D    jmp         00554540
 00552182    mov         eax,ebx
 00552184    mov         edx,555DE8;'Hnus, rukavice prosakují!'
 00552189    call        @LStrAsg
>0055218E    jmp         00554540
 00552193    mov         eax,ebx
 00552195    mov         edx,555E0C;'Stádo prasat, nikoliv hosté!'
 0055219A    call        @LStrAsg
>0055219F    jmp         00554540
 005521A4    mov         eax,ebx
 005521A6    mov         edx,555E34;'U všech ïasù, hromada hnilobného zelí!'
 005521AB    call        @LStrAsg
>005521B0    jmp         00554540
 005521B5    mov         eax,ebx
 005521B7    mov         edx,555E64;'Vida, tady to pøivážu...#a hrome, shodil jsem lano dolù, to jsem tomu dal......
 005521BC    call        @LStrAsg
>005521C1    jmp         00554540
 005521C6    mov         eax,ebx
 005521C8    mov         edx,555EBC;'Zámek cvakl, odemèeno...'
 005521CD    call        @LStrAsg
>005521D2    jmp         00554540
 005521D7    mov         eax,ebx
 005521D9    mov         edx,555EE0;'U všech ïasù, tajné dno dvojité!'
 005521DE    call        @LStrAsg
>005521E3    jmp         00554540
 005521E8    mov         eax,ebx
 005521EA    mov         edx,555F0C;'Jen tu síru pìknì napìchovat...'
 005521EF    call        @LStrAsg
>005521F4    jmp         00554540
 005521F9    mov         eax,ebx
 005521FB    mov         edx,555F34;'Pekelná smìs ještì není úplná!'
 00552200    call        @LStrAsg
>00552205    jmp         00554540
 0055220A    mov         eax,ebx
 0055220C    mov         edx,555F5C;'Hadr je dostateènì nasáklý olejem...'
 00552211    call        @LStrAsg
>00552216    jmp         00554540
 0055221B    mov         eax,ebx
 0055221D    mov         edx,555F8C;'Páka je teï tak namatlaná olejem, že ani nezaskøípe...'
 00552222    call        @LStrAsg
>00552227    jmp         00554540
 0055222C    mov         eax,ebx
 0055222E    mov         edx,555FCC;'„'
 00552233    call        @LStrAsg
>00552238    jmp         00554540
 0055223D    mov         eax,ebx
 0055223F    mov         edx,555FD8;'Ten prohnaný mladík urèitì zase vymýšlí nové hbité lsti, kterak#zmást opilé ...
 00552244    call        @LStrAsg
>00552249    jmp         00554540
 0055224E    mov         eax,ebx
 00552250    mov         edx,556068;'Štìstìna - bájná víla, na kterou se všichni vymlouváte.#Proè si nepøiznáte, ...
 00552255    call        @LStrAsg
>0055225A    jmp         00554540
 0055225F    mov         eax,ebx
 00552261    mov         edx,5560CC;'Budeš chtít hrát?#Dnes jako obvykle, jeden kovák, jedna hra...'
 00552266    call        @LStrAsg
>0055226B    jmp         00554540
 00552270    mov         eax,ebx
 00552272    mov         edx,556114;'Rozhodnut?'
 00552277    call        @LStrAsg
>0055227C    jmp         00554540
 00552281    mov         eax,ebx
 00552283    mov         edx,556128;'Další hru?'
 00552288    call        @LStrAsg
>0055228D    jmp         00554540
 00552292    mov         eax,ebx
 00552294    mov         edx,55613C;'Vsázím kovák na hru.'
 00552299    call        @LStrAsg
>0055229E    jmp         00554540
 005522A3    mov         eax,ebx
 005522A5    mov         edx,55615C;'Výbornì, dávej tedy pozor!'
 005522AA    call        @LStrAsg
>005522AF    jmp         00554540
 005522B4    mov         eax,ebx
 005522B6    mov         edx,556180;'Dnes již hrát nechci, dnes se mi proklatì nedaøí.'
 005522BB    call        @LStrAsg
>005522C0    jmp         00554540
 005522C5    mov         eax,ebx
 005522C7    mov         edx,5561BC;'A pivo nebude?'
 005522CC    call        @LStrAsg
>005522D1    jmp         00554540
 005522D6    mov         eax,ebx
 005522D8    mov         edx,5561D4;'Nalévat se nehodlám.#Po pivu kornatí hlava a motají se údy, chci si ještì za...
 005522DD    call        @LStrAsg
>005522E2    jmp         00554540
 005522E7    mov         eax,ebx
 005522E9    mov         edx,556230;'Pro jistotu mi zopakuj pravidla!'
 005522EE    call        @LStrAsg
>005522F3    jmp         00554540
 005522F8    mov         eax,ebx
 005522FA    mov         edx,55625C;'Hrajeme nejjednodušší základní hru.#Veškeré mé snahy hru obohatit o zajímavì...
 005522FF    call        @LStrAsg
>00552304    jmp         00554540
 00552309    mov         eax,ebx
 0055230B    mov         edx,5562F0;'Jaké balvany? ... Kde?'
 00552310    call        @LStrAsg
>00552315    jmp         00554540
 0055231A    mov         eax,ebx
 0055231C    mov         edx,556310;'Jak øíkám, tak slyšíš...#Tedy! Vkladem mi dáš kovák a zahrajeme si jedno míc...
 00552321    call        @LStrAsg
>00552326    jmp         00554540
 0055232B    mov         eax,ebx
 0055232D    mov         edx,5563C4;'Ponechám ti chvilku, abys øádnì zaostøil oko, pak zaènu míchat.#Musíš stále ...
 00552332    call        @LStrAsg
>00552337    jmp         00554540
 0055233C    mov         eax,ebx
 0055233E    mov         edx,55645C;'Až tì dostateènì zmatu, vyrovnám opìt skoøápky do øady,#dám ruce pryè a ty u...
 00552343    call        @LStrAsg
>00552348    jmp         00554540
 0055234D    mov         eax,ebx
 0055234F    mov         edx,5564DC;'Pokud tam bude, vrátím ti vloženou minci a pøidám druhou navrch!#Pokud odklo...
 00552354    call        @LStrAsg
>00552359    jmp         00554540
 0055235E    mov         eax,ebx
 00552360    mov         edx,556568;'Troufneš si tedy?'
 00552365    call        @LStrAsg
>0055236A    jmp         00554540
 0055236F    mov         eax,ebx
 00552371    mov         edx,556584;'Pøepoèítám si mìšec, mám-li nìco nazmar...'
 00552376    call        @LStrAsg
>0055237B    jmp         00554540
 00552380    mov         eax,ebx
 00552382    mov         edx,5565B8;'Což takhle pokusit zlatou štìstìnu?'
 00552387    call        @LStrAsg
>0055238C    jmp         00554540
 00552391    mov         eax,ebx
 00552393    mov         edx,5565E4;'Zlato pøináší smùlu høe, vsaï radìji rezavý kovák.'
 00552398    call        @LStrAsg
>0055239D    jmp         00554540
 005523A2    mov         eax,ebx
 005523A4    mov         edx,556620;'Kovák v kapse, zato neštìstí v lásce do budoucna!'
 005523A9    call        @LStrAsg
>005523AE    jmp         00554540
 005523B3    mov         eax,ebx
 005523B5    mov         edx,55665C;'U všech ïasù, jak je to možné? Tak ber, ty „štìstìno“...'
 005523BA    call        @LStrAsg
>005523BF    jmp         00554540
 005523C4    mov         eax,ebx
 005523C6    mov         edx,5566A0;'Prach zatracenì, vždy tam byla!'
 005523CB    call        @LStrAsg
>005523D0    jmp         00554540
 005523D5    mov         eax,ebx
 005523D7    mov         edx,5566CC;'Další slepec, další slepec! Cha chá!'
 005523DC    call        @LStrAsg
>005523E1    jmp         00554540
 005523E6    mov         eax,ebx
 005523E8    mov         edx,5566FC;'Otevøi bránu!'
 005523ED    call        @LStrAsg
>005523F2    jmp         00554540
 005523F7    mov         eax,ebx
 005523F9    mov         edx,556714;'Chrr... Chrr...'
 005523FE    call        @LStrAsg
>00552403    jmp         00554540
 00552408    mov         eax,ebx
 0055240A    mov         edx,55672C;'Bdìlá stráž jilemnická bránu neotevøe...'
 0055240F    call        @LStrAsg
>00552414    jmp         00554540
 00552419    mov         eax,ebx
 0055241B    mov         edx,556760;'Fuj, to je smrad! Co si to dovoluješ, mizero!#Mám po tobì na oplátku hodit s...
 00552420    call        @LStrAsg
>00552425    jmp         00554540
 0055242A    mov         eax,ebx
 0055242C    mov         edx,5567C0;'Nespi a otevøi bránu radìji, musím do lesa!'
 00552431    call        @LStrAsg
>00552436    jmp         00554540
 0055243B    mov         eax,ebx
 0055243D    mov         edx,5567F4;'Co tam budeš pohledávat? Jdeš se snad rochnit blátì?#Cesty jsou rozmoklé, ví...
 00552442    call        @LStrAsg
>00552447    jmp         00554540
 0055244C    mov         eax,ebx
 0055244E    mov         edx,556880;'Radím ti dobøe,#sám bys v tìchto èasech nevlídných nemìl chodit nikam...'
 00552453    call        @LStrAsg
>00552458    jmp         00554540
 0055245D    mov         eax,ebx
 0055245F    mov         edx,5568D4;'Jdu se poohlédnout po vozkovi s pivem, má zpoždìní!'
 00552464    call        @LStrAsg
>00552469    jmp         00554540
 0055246E    mov         eax,ebx
 00552470    mov         edx,556910;'Jdu koneènì na èerstvý vzduch z té zatuchlé putyky!'
 00552475    call        @LStrAsg
>0055247A    jmp         00554540
 0055247F    mov         eax,ebx
 00552481    mov         edx,55694C;'Jak chceš, ale varoval jsem tì!'
 00552486    call        @LStrAsg
>0055248B    jmp         00554540
 00552490    mov         eax,ebx
 00552492    mov         edx,556974;'Jsem celý promoklý, to je zase služba...'
 00552497    call        @LStrAsg
>0055249C    jmp         00554540
 005524A1    mov         eax,ebx
 005524A3    mov         edx,5569A8;'Hej, už nemám zelí, slyšíš mì tam nahoøe?'
 005524A8    call        @LStrAsg
>005524AD    jmp         00554540
 005524B2    mov         eax,ebx
 005524B4    mov         edx,5569DC;'Co tady øveš jako pominutý!'
 005524B9    call        @LStrAsg
>005524BE    jmp         00554540
 005524C3    mov         eax,ebx
 005524C5    mov         edx,556A00;'Jsem posedlý ïáblem, zmítám se v šílenství a køièím do celého svìta,#že tøím...
 005524CA    call        @LStrAsg
>005524CF    jmp         00554540
 005524D4    mov         eax,ebx
 005524D6    mov         edx,556A7C;'U všech ïasù, zazvoním na poplach!'
 005524DB    call        @LStrAsg
>005524E0    jmp         00554540
 005524E5    mov         eax,ebx
 005524E7    mov         edx,556AA8;'Zlé èasy panují v kraji jilemnickém, od kterého slunce odvrátilo'
 005524EC    call        @LStrAsg
>005524F1    jmp         00554540
 005524F6    mov         eax,ebx
 005524F8    mov         edx,556AF4;'tváø. Vytrvalý déš podzimní vylévá z koryt strouhy horské'
 005524FD    call        @LStrAsg
>00552502    jmp         00554540
 00552507    mov         eax,ebx
 00552509    mov         edx,556B38;'a cesty mìní v brody bahnité. Z mìstských pøíbytkù se vyplavuje'
 0055250E    call        @LStrAsg
>00552513    jmp         00554540
 00552518    mov         eax,ebx
 0055251A    mov         edx,556B80;'špína staletá, z které bují nemoci jen. Vlhký dech nezdaru,'
 0055251F    call        @LStrAsg
>00552524    jmp         00554540
 00552529    mov         eax,ebx
 0055252B    mov         edx,556BC4;'chladný a žalný, s hustou mlhou sedá na nemocné lesy okolní.'
 00552530    call        @LStrAsg
>00552535    jmp         00554540
 0055253A    mov         eax,ebx
 0055253C    mov         edx,556C0C;'Mnozí lidé upadají v beznadìj neèinnou.'
 00552541    call        @LStrAsg
>00552546    jmp         00554540
 0055254B    mov         eax,ebx
 0055254D    mov         edx,556C3C;'Jak smyslù zbaven se i já ploužím hospodou. Coby pacholek v uèení'
 00552552    call        @LStrAsg
>00552557    jmp         00554540
 0055255C    mov         eax,ebx
 0055255E    mov         edx,556C88;'hostinském jedinou jsem nadìjí pøísedících. Kdyby se nemuseli'
 00552563    call        @LStrAsg
>00552568    jmp         00554540
 0055256D    mov         eax,ebx
 0055256F    mov         edx,556CD0;'zaklánìt pod korbely, zøejmì by v té pohøební náladì zkamenìli'
 00552574    call        @LStrAsg
>00552579    jmp         00554540
 0055257E    mov         eax,ebx
 00552580    mov         edx,556D18;'úplnì. Ostatnì já také, vlastnì jsem vdìèen za èinnost, která'
 00552585    call        @LStrAsg
>0055258A    jmp         00554540
 0055258F    mov         eax,ebx
 00552591    mov         edx,556D60;'alespoò náznakem odvádí pozornost od zostøené trudomyslnosti...'
 00552596    call        @LStrAsg
>0055259B    jmp         00554540
 005525A0    mov         eax,ebx
 005525A2    call        @LStrClr
>005525A7    jmp         00554540
 005525AC    mov         eax,ebx
 005525AE    mov         edx,556DA8;'Mùj pán, vìènì nevrlý chlebo a pivo dárce.#Zamraèený opìt, vzteklý od pohled...
 005525B3    call        @LStrAsg
>005525B8    jmp         00554540
 005525BD    mov         eax,ebx
 005525BF    mov         edx,556E38;'Pøestaò okounìt a pøines mi také radìji pivo, bolí mì kosti...'
 005525C4    call        @LStrAsg
>005525C9    jmp         00554540
 005525CE    mov         eax,ebx
 005525D0    mov         edx,556E80;'Hned, hned...'
 005525D5    call        @LStrAsg
>005525DA    jmp         00554540
 005525DF    mov         eax,ebx
 005525E1    mov         edx,556E98;'Tak prosím...'
 005525E6    call        @LStrAsg
>005525EB    jmp         00554540
 005525F0    mov         eax,ebx
 005525F2    mov         edx,556EB0;'To je doba... Mezitím, co se tu jako mátoha ploužíš,#neøád a bordel se ti tu...
 005525F7    call        @LStrAsg
>005525FC    jmp         00554540
 00552601    mov         eax,ebx
 00552603    mov         edx,556F58;'Takového pacholka ïas mi byl dlužen!'
 00552608    call        @LStrAsg
>0055260D    jmp         00554540
 00552612    mov         eax,ebx
 00552614    mov         edx,556F88;'Ty darebáku, snad nechceš šidit mé hosty!#Toè to poøádnì plné!'
 00552619    call        @LStrAsg
>0055261E    jmp         00554540
 00552623    mov         eax,ebx
 00552625    mov         edx,556FD0;'Tyhle dvì kapky chceš odnést komu?'
 0055262A    call        @LStrAsg
>0055262F    jmp         00554540
 00552634    mov         eax,ebx
 00552636    mov         edx,556FFC;'Ty nemehlo, to neumíš pivo natoèit,#aniž by vytekla pùlka sudu na zem?'
 0055263B    call        @LStrAsg
>00552640    jmp         00554540
 00552645    mov         eax,ebx
 00552647    mov         edx,55704C;'Zapomnìl jsem, protože tu není chvíle klidu...'
 0055264C    call        @LStrAsg
>00552651    jmp         00554540
 00552656    mov         eax,ebx
 00552658    mov         edx,557084;'Za chvíli vyrazím, jen roznesu ještì pár korbelù...'
 0055265D    call        @LStrAsg
>00552662    jmp         00554540
 00552667    mov         eax,ebx
 00552669    mov         edx,5570C0;'Nevím kam døív skoèit, pivo nebo poøádek?'
 0055266E    call        @LStrAsg
>00552673    jmp         00554540
 00552678    mov         eax,ebx
 0055267A    mov         edx,5570F4;'Na takovou otázku hloupou i první den v službì bylo pozdì!'
 0055267F    call        @LStrAsg
>00552684    jmp         00554540
 00552689    mov         eax,ebx
 0055268B    mov         edx,557138;'Nemìj v hlavì pivní pìnu a zamysli se,#jestli je pro hosta dùležitìjší natoè...
 00552690    call        @LStrAsg
>00552695    jmp         00554540
 0055269A    mov         eax,ebx
 0055269C    mov         edx,5571A8;'Dej se do práce a nemarni èas dotazy tupými,#od toho tu nejsi...'
 005526A1    call        @LStrAsg
>005526A6    jmp         00554540
 005526AB    mov         eax,ebx
 005526AD    mov         edx,5571F4;'Omlouvám se, Pane, zasnil jsem se...'
 005526B2    call        @LStrAsg
>005526B7    jmp         00554540
 005526BC    mov         eax,ebx
 005526BE    mov         edx,557224;'Jaká úlisnost hanebná! Pokud bych nedošlápl na tvou lenivost,#sedìl bys tu d...
 005526C3    call        @LStrAsg
>005526C8    jmp         00554540
 005526CD    mov         eax,ebx
 005526CF    mov         edx,5572A0;'A tì ani na jediný okamžik nevidím se zastavit!#Práce je tu dost, žádné vým...
 005526D4    call        @LStrAsg
>005526D9    jmp         00554540
 005526DE    mov         eax,ebx
 005526E0    mov         edx,557308;'Snad to nebude tak zlé, ještì nedorazili ostatní horníci...'
 005526E5    call        @LStrAsg
>005526EA    jmp         00554540
 005526EF    mov         eax,ebx
 005526F1    mov         edx,55734C;'Hanobíš èest mé hospody,#i jediný žíznivec je v pivu roven stovkám.'
 005526F6    call        @LStrAsg
>005526FB    jmp         00554540
 00552700    mov         eax,ebx
 00552702    mov         edx,557398;'I kdyby vzplanul svìt a zøítily se hvìzdy, v téhle hospodì#pivo nikdy v korb...
 00552707    call        @LStrAsg
>0055270C    jmp         00554540
 00552711    mov         eax,ebx
 00552713    mov         edx,557444;'A tì sám odnesu komínem,#pokud ihned nenapojíš mé hosty!'
 00552718    call        @LStrAsg
>0055271D    jmp         00554540
 00552722    mov         eax,ebx
 00552724    mov         edx,557488;'Další práci dostaneš, až udìláš tu první!#Èiò se koneènì!'
 00552729    call        @LStrAsg
>0055272E    jmp         00554540
 00552733    mov         eax,ebx
 00552735    mov         edx,5574CC;'Jaktože je už zase prázdný sud, zatracenì, proklatì,#u všech ïáblù a kozlù a...
 0055273A    call        @LStrAsg
>0055273F    jmp         00554540
 00552744    mov         eax,ebx
 00552746    mov         edx,557540;'Vytoèil jsi celý sud na zem! Brodíme se tu v pivì!#Tentokrát mi došla trpìli...
 0055274B    call        @LStrAsg
>00552750    jmp         00554540
 00552755    mov         eax,ebx
 00552757    mov         edx,5575D8;'Jestli mi tu uchlastáváš mé drahé pivo, nièemo,#vypráskám tì tam, odkud jsi ...
 0055275C    call        @LStrAsg
>00552761    jmp         00554540
 00552766    mov         eax,ebx
 00552768    mov         edx,557634;'Nepøej si být chycen s pìnou na nose! Vìru podezøele ubývají zásoby.#Též pøe...
 0055276D    call        @LStrAsg
>00552772    jmp         00554540
 00552777    mov         eax,ebx
 00552779    mov         edx,5576E8;'Buï tu nasáváš, anebo ti hosté neplatí a pøedevším vidím,#jak neumíš èepovat...
 0055277E    call        @LStrAsg
>00552783    jmp         00554540
 00552788    mov         eax,ebx
 0055278A    mov         edx,557758;'Poèítej s tím, pacholku, že ti vše strhnu z výsluhy!'
 0055278F    call        @LStrAsg
>00552794    jmp         00554540
 00552799    mov         eax,ebx
 0055279B    mov         edx,557798;'Strhnìte to, jen když nebude køik...'
 005527A0    call        @LStrAsg
>005527A5    jmp         00554540
 005527AA    mov         eax,ebx
 005527AC    mov         edx,5577C8;'Myslím, že Vaše korbely se nezapoèítávají...'
 005527B1    call        @LStrAsg
>005527B6    jmp         00554540
 005527BB    mov         eax,ebx
 005527BD    mov         edx,557800;'Je to má hospoda a moje pivo a mé poèty!#Ještì když jsi øval u vyschlého prs...
 005527C2    call        @LStrAsg
>005527C7    jmp         00554540
 005527CC    mov         eax,ebx
 005527CE    mov         edx,5578A0;'Jsi v mém uèení, tedy se uè odpovìdnost za rozlité pivo nést#a neprskej vinu...
 005527D3    call        @LStrAsg
>005527D8    jmp         00554540
 005527DD    mov         eax,ebx
 005527DF    mov         edx,557900;'Pár horníku tu má pøímo døevorubeckou sekeru!'
 005527E4    call        @LStrAsg
>005527E9    jmp         00554540
 005527EE    mov         eax,ebx
 005527F0    mov         edx,557938;'Pak jsi špatný uèedník, dáš-li na škemrání kdejakého otrapy.#Dopustíš-li dlu...
 005527F5    call        @LStrAsg
>005527FA    jmp         00554540
 005527FF    mov         eax,ebx
 00552801    mov         edx,5579E4;'Všímej si lépe hostù, žíznivému poctivému horníkovi dej,#chudého èi nového p...
 00552806    call        @LStrAsg
>0055280B    jmp         00554540
 00552810    mov         eax,ebx
 00552812    mov         edx,557A58;'Samosebou, nedáváš-li na mé rady pouèné,#poneseš pro nedbalost trest.'
 00552817    call        @LStrAsg
>0055281C    jmp         00554540
 00552821    mov         eax,ebx
 00552823    mov         edx,557AA8;'Však si budeš lépe vážit piva, když ti bude vlastní mìšec protékat.#Já tì je...
 00552828    call        @LStrAsg
>0055282D    jmp         00554540
 00552832    mov         eax,ebx
 00552834    mov         edx,557B14;'Hmm, hmm...'
 00552839    call        @LStrAsg
>0055283E    jmp         00554540
 00552843    mov         eax,ebx
 00552845    mov         edx,557B28;'Nyní se sebereš a pùjdeš se ihned podívat po pivovarském vozkovi#a jeho dodá...
 0055284A    call        @LStrAsg
>0055284F    jmp         00554540
 00552854    mov         eax,ebx
 00552856    mov         edx,557BB0;'Vždy se v lese na odpoèinek zastavuje a nestalo se jednou,#že ochutnal ze su...
 0055285B    call        @LStrAsg
>00552860    jmp         00554540
 00552865    mov         eax,ebx
 00552867    mov         edx,557C34;'Popožeò ho, dokud opratì udrží#a promoèený kùò neplete kopyty z té zimy!#Mus...
 0055286C    call        @LStrAsg
>00552871    jmp         00554540
 00552876    mov         eax,ebx
 00552878    mov         edx,557CB8;'Vìru pøíznaèný èas pro lesní procházku.#Ještìže kapuci mám...'
 0055287D    call        @LStrAsg
>00552882    jmp         00554540
 00552887    mov         eax,ebx
 00552889    mov         edx,557D00;'Øekl jsem dones mi pivo!'
 0055288E    call        @LStrAsg
>00552893    jmp         00554540
 00552898    mov         eax,ebx
 0055289A    mov         edx,557D24;'Pracky pryè!'
 0055289F    call        @LStrAsg
>005528A4    jmp         00554540
 005528A9    mov         eax,ebx
 005528AB    mov         edx,557D3C;'Chlapèe, nezapomnìl jsi s pivem na nìkoho?'
 005528B0    call        @LStrAsg
>005528B5    jmp         00554540
 005528BA    mov         eax,ebx
 005528BC    mov         edx,557D70;'Kam se øítíš, nièemo, nejprve ukliï neøád vezdejší.#Sesbírané korbely na pol...
 005528C1    call        @LStrAsg
>005528C6    jmp         00554540
 005528CB    mov         eax,ebx
 005528CD    mov         edx,557DE8;'Kam se ženeš? Máš snad práci hotovou?#Potøebuji s tebou ještì mluvit, pachol...
 005528D2    call        @LStrAsg
>005528D7    jmp         00554540
 005528DC    mov         eax,ebx
 005528DE    mov         edx,557E40;'S tìmi korbely jdeš kam? Chytat dešovou vodu?#Vra je na polici!'
 005528E3    call        @LStrAsg
>005528E8    jmp         00554540
 005528ED    mov         eax,ebx
 005528EF    mov         edx,557E8C;'U všech ïasù, pospìš! Nemáme co toèit!'
 005528F4    call        @LStrAsg
>005528F9    jmp         00554540
 005528FE    mov         eax,ebx
 00552900    mov         edx,557EBC;'Vracíš se s prázdnou?#Okamžitì se otoè a mazej hledat jinam!'
 00552905    call        @LStrAsg
>0055290A    jmp         00554540
 0055290F    mov         eax,ebx
 00552911    mov         edx,557F04;'Našel jsem toho nešastníka pivovarského!#Bezvládnì plave pupkem nahoru v ba...
 00552916    call        @LStrAsg
>0055291B    jmp         00554540
 00552920    mov         eax,ebx
 00552922    mov         edx,557F88;'Sudy jsou ztraceny a zdechlý kùò uvìznìn pod tìžkým žebøiòákem tlí.#S tím v ...
 00552927    call        @LStrAsg
>0055292C    jmp         00554540
 00552931    mov         eax,ebx
 00552933    mov         edx,558030;'Ten nièema!#Má co si zasloužil, urèitì jel zase nadraný jako dìravý žok chme...
 00552938    call        @LStrAsg
>0055293D    jmp         00554540
 00552942    mov         eax,ebx
 00552944    mov         edx,55808C;'U všech ïasù, škoda, že nezøítil se radìji do pukliny zemské,#kde by se navì...
 00552949    call        @LStrAsg
>0055294E    jmp         00554540
 00552953    mov         eax,ebx
 00552955    mov         edx,558128;'Èest jeho památce pivní...'
 0055295A    call        @LStrAsg
>0055295F    jmp         00554540
 00552964    mov         eax,ebx
 00552966    mov         edx,55814C;'Myslím, že z kratochvíle do té bøeèky nevjel.#Za hradbou èistá spouš, ani c...
 0055296B    call        @LStrAsg
>00552970    jmp         00554540
 00552975    mov         eax,ebx
 00552977    mov         edx,55821C;'A pro pár pivních pupkù duši vypustit,#to je spíše hrdinství!'
 0055297C    call        @LStrAsg
>00552981    jmp         00554540
 00552986    mov         eax,ebx
 00552988    mov         edx,558264;'Ještì ho budeš bránit? Mou trpìlivost zase dráždit chceš?'
 0055298D    call        @LStrAsg
>00552992    jmp         00554540
 00552997    mov         eax,ebx
 00552999    mov         edx,5582A8;'Bez piva tì tu nepotøebuji, holomku hubatá, to na vìdomí ber.#Jestli nesežen...
 0055299E    call        @LStrAsg
>005529A3    jmp         00554540
 005529A8    mov         eax,ebx
 005529AA    mov         edx,558340;'Je mi jedno, kde škemrat budeš, bìž se tøeba ïáblu upsat!#Jestli neseženeš z...
 005529AF    call        @LStrAsg
>005529B4    jmp         00554540
 005529B9    mov         eax,ebx
 005529BB    mov         edx,5583D0;'Tak to se radìji pùjdu skuteènì upsat pivním èertùm,#než poslouchat to nenak...
 005529C0    call        @LStrAsg
>005529C5    jmp         00554540
 005529CA    mov         eax,ebx
 005529CC    mov         edx,558438;'Dveøe jsou támhle!'
 005529D1    call        @LStrAsg
>005529D6    jmp         00554540
 005529DB    mov         eax,ebx
 005529DD    mov         edx,558454;'Nevalíš sudy piva?#Pak tu nemáš co pohledávat!'
 005529E2    call        @LStrAsg
>005529E7    jmp         00554540
 005529EC    mov         eax,ebx
 005529EE    mov         edx,55848C;'Pivo!#Musím se napít piva nebo mi srdce pukne v tom tøesu tìla!'
 005529F3    call        @LStrAsg
>005529F8    jmp         00554540
 005529FD    mov         eax,ebx
 005529FF    mov         edx,5584D4;'Kde jsou nové sudy ty nièemo?#Kde se poflakuješ celou dobu?'
 00552A04    call        @LStrAsg
>00552A09    jmp         00554540
 00552A0E    mov         eax,ebx
 00552A10    mov         edx,558518;'Sežeò mi hned pár kapek piva, i kdybys mìl rozštípat stoly#nebo zaschlou piv...
 00552A15    call        @LStrAsg
>00552A1A    jmp         00554540
 00552A1F    mov         eax,ebx
 00552A21    mov         edx,55858C;'Tento vlhký hadr pár kapek piva nejednou olízl...'
 00552A26    call        @LStrAsg
>00552A2B    jmp         00554540
 00552A30    mov         eax,ebx
 00552A32    mov         edx,5585C8;'Vyždímej ho do korbelu!'
 00552A37    call        @LStrAsg
>00552A3C    jmp         00554540
 00552A41    mov         eax,ebx
 00552A43    mov         edx,5585E8;'To je hnus, chutná to jako olej z bøicha vyblitý!#Hrdlo se mi svírá, chtìl j...
 00552A48    call        @LStrAsg
>00552A4D    jmp         00554540
 00552A52    mov         eax,ebx
 00552A54    mov         edx,55864C;'Ááá, to jsou køeèe, musím to zajíst špekem.#Tohle ti nedaruji, až se vrátím!...
 00552A59    call        @LStrAsg
>00552A5E    jmp         00554540
 00552A63    mov         eax,ebx
 00552A65    mov         edx,5586A4;'To jsem tomu dal...'
 00552A6A    call        @LStrAsg
>00552A6F    jmp         00554540
 00552A74    mov         eax,ebx
 00552A76    mov         edx,5586C0;'Zastøený pohled v brunátné pøiopilé tváøi vrásèité#znaèí velkou mrzutost...'
 00552A7B    call        @LStrAsg
>00552A80    jmp         00554540
 00552A85    mov         eax,ebx
 00552A87    mov         edx,558714;'Tak kde máš ten pìnivý bolulék?'
 00552A8C    call        @LStrAsg
>00552A91    jmp         00554540
 00552A96    mov         eax,ebx
 00552A98    mov         edx,55873C;'Strpení, mám jen dvì unavené ruce...'
 00552A9D    call        @LStrAsg
>00552AA2    jmp         00554540
 00552AA7    mov         eax,ebx
 00552AA9    mov         edx,55876C;'Unavené? Snad nechceš øíci, že odnést pár#mizerných korbelù unaví dnešního m...
 00552AAE    call        @LStrAsg
>00552AB3    jmp         00554540
 00552AB8    mov         eax,ebx
 00552ABA    mov         edx,558810;'Sto korbelù jako sto ran krumpáèem...'
 00552ABF    call        @LStrAsg
>00552AC4    jmp         00554540
 00552AC9    mov         eax,ebx
 00552ACB    mov         edx,558840;'Venku nevlídno, mìsto choré, není do èeho krumpáèem praštit.#Doly zaplavila ...
 00552AD0    call        @LStrAsg
>00552AD5    jmp         00554540
 00552ADA    mov         eax,ebx
 00552ADC    mov         edx,558918;'Nejsi místní a tak neznáš slavnìjší doby tohoto mìsta skromného,#nejsi místn...
 00552AE1    call        @LStrAsg
>00552AE6    jmp         00554540
 00552AEB    mov         eax,ebx
 00552AED    mov         edx,5589D8;'Hned jsem tu s korbelem.'
 00552AF2    call        @LStrAsg
>00552AF7    jmp         00554540
 00552AFC    mov         eax,ebx
 00552AFE    mov         edx,5589FC;'Jen mi ještì dones, chlapèe,#nebo leknu žízní a pak tu døepìt budu na vìky.....
 00552B03    call        @LStrAsg
>00552B08    jmp         00554540
 00552B0D    mov         eax,ebx
 00552B0F    mov         edx,558A54;'Myslím, že nenastane zrovna výrazná zmìna...'
 00552B14    call        @LStrAsg
>00552B19    jmp         00554540
 00552B1E    mov         eax,ebx
 00552B20    mov         edx,558A8C;'Velmi zábavné. Vy mladí dnes nemáte žádnou úctu k starším.#Nìkdy si øíkám, k...
 00552B25    call        @LStrAsg
>00552B2A    jmp         00554540
 00552B2F    mov         eax,ebx
 00552B31    mov         edx,558B00;'Asi zùstaly uvìznìné v dolech,#stejnì jako radost z práce a štìstí obyèejné....
 00552B36    call        @LStrAsg
>00552B3B    jmp         00554540
 00552B40    mov         eax,ebx
 00552B42    mov         edx,558B58;'Na pivo máme, tak jaképak neštìstí?'
 00552B47    call        @LStrAsg
>00552B4C    jmp         00554540
 00552B51    mov         eax,ebx
 00552B53    mov         edx,558B84;'I mlè pustý lenochu, pozbyl jsi snad též hornickou èest?#Dostáváme hanebné o...
 00552B58    call        @LStrAsg
>00552B5D    jmp         00554540
 00552B62    mov         eax,ebx
 00552B64    mov         edx,558BF8;'Tam dole je ještì spousta práce a zlata,#uzdravilo by celé mìsto, ba celý kr...
 00552B69    call        @LStrAsg
>00552B6E    jmp         00554540
 00552B73    mov         eax,ebx
 00552B75    mov         edx,558C5C;'Žádná blyštivá hrouda nespasí èlovìka,#jak øíkával jeden kazatel...'
 00552B7A    call        @LStrAsg
>00552B7F    jmp         00554540
 00552B84    mov         eax,ebx
 00552B86    mov         edx,558CA8;'Ty radìji hraj a neskákej nám do øeèi!'
 00552B8B    call        @LStrAsg
>00552B90    jmp         00554540
 00552B95    mov         eax,ebx
 00552B97    mov         edx,558CD8;'Jedno chladné ze sudu...'
 00552B9C    call        @LStrAsg
>00552BA1    jmp         00554540
 00552BA6    mov         eax,ebx
 00552BA8    mov         edx,558CFC;'Dìkuji ti, chlapèe, zlámanou minci ber...'
 00552BAD    call        @LStrAsg
>00552BB2    jmp         00554540
 00552BB7    mov         eax,ebx
 00552BB9    mov         edx,558D30;'Krušné èasy chlapèe, krušné.#Srdce mìsta se k nám otoèilo zády, brány uzavøe...
 00552BBE    call        @LStrAsg
>00552BC3    jmp         00554540
 00552BC8    mov         eax,ebx
 00552BCA    mov         edx,558DCC;'Byli jsme to my horníci, kdož mìsto v minulosti zlatem rozzáøil.#Nyní záøe z...
 00552BCF    call        @LStrAsg
>00552BD4    jmp         00554540
 00552BD9    mov         eax,ebx
 00552BDB    mov         edx,558E9C;'Kde se potloukáš stále, na kost promoèený?#Nechávat hosty vìrné bez zájmu je...
 00552BE0    call        @LStrAsg
>00552BE5    jmp         00554540
 00552BEA    mov         eax,ebx
 00552BEC    mov         edx,558F10;'Stejnì došlo pivo, mohu roznášet leda vodu dešovou...'
 00552BF1    call        @LStrAsg
>00552BF6    jmp         00554540
 00552BFB    mov         eax,ebx
 00552BFD    mov         edx,558F50;'U všech dùlních bìsù, podle sluhy poznáš pána!#Pacholek pobíhá v dešti a hos...
 00552C02    call        @LStrAsg
>00552C07    jmp         00554540
 00552C0C    mov         eax,ebx
 00552C0E    mov         edx,558FEC;'Pøes to všechno zlé mìl bych se vší pokorou malou prosbu...'
 00552C13    call        @LStrAsg
>00552C18    jmp         00554540
 00552C1D    mov         eax,ebx
 00552C1F    mov         edx,559030;'To je tedy divný kraj!#Když shoøela mìstská sýpka, nikdo nezaplakal.#Když do...
 00552C24    call        @LStrAsg
>00552C29    jmp         00554540
 00552C2E    mov         eax,ebx
 00552C30    mov         edx,558CA8;'Ty radìji hraj a neskákej nám do øeèi!'
 00552C35    call        @LStrAsg
>00552C3A    jmp         00554540
 00552C3F    mov         eax,ebx
 00552C41    mov         edx,5590AC;'Ještì k té prosbì, bylo by možné...'
 00552C46    call        @LStrAsg
>00552C4B    jmp         00554540
 00552C50    mov         eax,ebx
 00552C52    mov         edx,5590D8;'Když nemáte pivo, ta si bìžte koupit víno kupcovo!#Alespoò poznáte skuteèné ...
 00552C57    call        @LStrAsg
>00552C5C    jmp         00554540
 00552C61    mov         eax,ebx
 00552C63    mov         edx,559144;'Ten vydøiduch nedostane jediný kovák hornický!#Jestli nebude pivo, tak si pù...
 00552C68    call        @LStrAsg
>00552C6D    jmp         00554540
 00552C72    mov         eax,ebx
 00552C74    mov         edx,5591F0;'Už vaøíš?#Maso je na chu, se zelím také nepøehánìj, ale tabákem nešetøi!'
 00552C79    call        @LStrAsg
>00552C7E    jmp         00554540
 00552C83    mov         eax,ebx
 00552C85    mov         edx,559244;'Už se to chystá, strpení.'
 00552C8A    call        @LStrAsg
>00552C8F    jmp         00554540
 00552C94    mov         eax,ebx
 00552C96    mov         edx,559268;'Když není pivo, co bych mìl dále poslouchat?'
 00552C9B    call        @LStrAsg
>00552CA0    jmp         00554540
 00552CA5    mov         eax,ebx
 00552CA7    mov         edx,5592A0;'Krumpáè tu leží ladem, co kdybych si jej vypùjèil?'
 00552CAC    call        @LStrAsg
>00552CB1    jmp         00554540
 00552CB6    mov         eax,ebx
 00552CB8    mov         edx,5592DC;'Pokud chceš kutat kámen, budu chtít výmìnou protislužbu!'
 00552CBD    call        @LStrAsg
>00552CC2    jmp         00554540
 00552CC7    mov         eax,ebx
 00552CC9    mov         edx,559320;'Zajisté, co by to mìlo být?'
 00552CCE    call        @LStrAsg
>00552CD3    jmp         00554540
 00552CD8    mov         eax,ebx
 00552CDA    mov         edx,559344;'Když není pivo, pøišel èas na poctivý hornický lomcovák.#Je to polévka pro ž...
 00552CDF    call        @LStrAsg
>00552CE4    jmp         00554540
 00552CE9    mov         eax,ebx
 00552CEB    mov         edx,5593E4;'Øádnì též vyvaø v hrnci poøádné maso s kostí,#a nasytí mastnými oky.#Nakone...
 00552CF0    call        @LStrAsg
>00552CF5    jmp         00554540
 00552CFA    mov         eax,ebx
 00552CFC    mov         edx,559498;'Už to vøe, nejlepší pøísady, jaké šlo sehnat!#Budete øvát chutí! Cítíte tu v...
 00552D01    call        @LStrAsg
>00552D06    jmp         00554540
 00552D0B    mov         eax,ebx
 00552D0D    mov         edx,5594F4;'Vskutku zvedenì to èpí.#Možná bys mìl namísto posluhy kuchtu dìlat!'
 00552D12    call        @LStrAsg
>00552D17    jmp         00554540
 00552D1C    mov         eax,ebx
 00552D1E    mov         edx,559540;'Chcete hned nalít?'
 00552D23    call        @LStrAsg
>00552D28    jmp         00554540
 00552D2D    mov         eax,ebx
 00552D2F    mov         edx,55955C;'Kdepak, nyní musí polévka zvolna vychladnout#a tabákové vlasce nabobtnat jak...
 00552D34    call        @LStrAsg
>00552D39    jmp         00554540
 00552D3E    mov         eax,ebx
 00552D40    mov         edx,5595F4;'Hlavnì si krumpáèem bradu nerozbij, musíš sekat zešikma!'
 00552D45    call        @LStrAsg
>00552D4A    jmp         00554540
 00552D4F    mov         eax,ebx
 00552D51    mov         edx,559638;'Dnes ten otrapa pùsobí vcelku spokojenì.#Jen pivo mu ke štìstí staèí...'
 00552D56    call        @LStrAsg
>00552D5B    jmp         00554540
 00552D60    mov         eax,ebx
 00552D62    mov         edx,559688;'Tak donášej, mladíku, donášej! Je tøeba zapít dlouhou chvíli!'
 00552D67    call        @LStrAsg
>00552D6C    jmp         00554540
 00552D71    mov         eax,ebx
 00552D73    mov         edx,5596D0;'Vìru dlouhá, od rána do veèera, den co den...'
 00552D78    call        @LStrAsg
>00552D7D    jmp         00554540
 00552D82    mov         eax,ebx
 00552D84    mov         edx,559708;'Nemám dovalit na stùl rovnou celý sud?'
 00552D89    call        @LStrAsg
>00552D8E    jmp         00554540
 00552D93    mov         eax,ebx
 00552D95    mov         edx,559738;'Sud nebo korbel, žádný rozdíl, vypijeme všechno kvasné,#co naše bøichy pojmo...
 00552D9A    call        @LStrAsg
>00552D9F    jmp         00554540
 00552DA4    mov         eax,ebx
 00552DA6    mov         edx,559790;'Na nièem již nezáleží, když ani mìstu nezáleží na nás...#Však ti ještì povím...
 00552DAB    call        @LStrAsg
>00552DB0    jmp         00554540
 00552DB5    mov         eax,ebx
 00552DB7    mov         edx,5589D8;'Hned jsem tu s korbelem.'
 00552DBC    call        @LStrAsg
>00552DC1    jmp         00554540
 00552DC6    mov         eax,ebx
 00552DC8    mov         edx,559804;'Už to neseš?'
 00552DCD    call        @LStrAsg
>00552DD2    jmp         00554540
 00552DD7    mov         eax,ebx
 00552DD9    mov         edx,55981C;'Pijte a pokraèujte!'
 00552DDE    call        @LStrAsg
>00552DE3    jmp         00554540
 00552DE8    mov         eax,ebx
 00552DEA    mov         edx,559838;'V létì se vší slávou vyrazila zbrojená výprava s károu#nejèistšího zlata do ...
 00552DEF    call        @LStrAsg
>00552DF4    jmp         00554540
 00552DF9    mov         eax,ebx
 00552DFB    mov         edx,55990C;'Proráželi jsme s chutí štoly hloubìji do nitra hory,#našly se nové žíly zlat...
 00552E00    call        @LStrAsg
>00552E05    jmp         00554540
 00552E0A    mov         eax,ebx
 00552E0C    mov         edx,5599F0;'Bìhem pár dnù se zaplavily štoly nejhlubší, pozdìji celá patra#a od doby, co...
 00552E11    call        @LStrAsg
>00552E16    jmp         00554540
 00552E1B    mov         eax,ebx
 00552E1D    mov         edx,559AAC;'Doneseš další pivo?'
 00552E22    call        @LStrAsg
>00552E27    jmp         00554540
 00552E2C    mov         eax,ebx
 00552E2E    mov         edx,5589D8;'Hned jsem tu s korbelem.'
 00552E33    call        @LStrAsg
>00552E38    jmp         00554540
 00552E3D    mov         eax,ebx
 00552E3F    mov         edx,559AC8;'Stejnì tak celé okolí s pøíchodem podzimu zmírá.#Ještì v létì z pøilehlých l...
 00552E44    call        @LStrAsg
>00552E49    jmp         00554540
 00552E4E    mov         eax,ebx
 00552E50    mov         edx,559B64;'Ale s pøívalem dešù pøišel nezdar.#Blesk zasáhl mìstskou sýpku, co neshoøel...
 00552E55    call        @LStrAsg
>00552E5A    jmp         00554540
 00552E5F    mov         eax,ebx
 00552E61    mov         edx,559BCC;'Do mìsta se stáhly krysy v nebývalém poètu, lezou všude po domech,#nahlodáva...
 00552E66    call        @LStrAsg
>00552E6B    jmp         00554540
 00552E70    mov         eax,ebx
 00552E72    mov         edx,559C88;'Nemocím se nevyhnuli ani lidé. Vnitøní èást mìsta se v hrùze#uzavøela zbytku...
 00552E77    call        @LStrAsg
>00552E7C    jmp         00554540
 00552E81    mov         eax,ebx
 00552E83    mov         edx,559D3C;'Co ti mám ještì povídat?#Léta tu hostinský kraloval sám, plný síly a veselos...
 00552E88    call        @LStrAsg
>00552E8D    jmp         00554540
 00552E92    mov         eax,ebx
 00552E94    mov         edx,559DFC;'Museli jsme vylomit dveøe a trochu ho pøivést k rozumu.'
 00552E99    call        @LStrAsg
>00552E9E    jmp         00554540
 00552EA3    mov         eax,ebx
 00552EA5    mov         edx,559E3C;'Naštìstí jsi nedlouho na to pøišel ty jako neèekaný hospodský pomocník,#takž...
 00552EAA    call        @LStrAsg
>00552EAF    jmp         00554540
 00552EB4    mov         eax,ebx
 00552EB6    mov         edx,559EF4;'Od rána klopí jeden korbel za druhým, jakýpak klid na pøemýšlení?#Pakliže na...
 00552EBB    call        @LStrAsg
>00552EC0    jmp         00554540
 00552EC5    mov         eax,ebx
 00552EC7    mov         edx,558CA8;'Ty radìji hraj a neskákej nám do øeèi!'
 00552ECC    call        @LStrAsg
>00552ED1    jmp         00554540
 00552ED6    mov         eax,ebx
 00552ED8    mov         edx,559FBC;'...Už se mi nìjak palice motá... bléé'
 00552EDD    call        @LStrAsg
>00552EE2    jmp         00554540
 00552EE7    mov         eax,ebx
 00552EE9    mov         edx,559FEC;'Èas zaplatit a na stole spát?'
 00552EEE    call        @LStrAsg
>00552EF3    jmp         00554540
 00552EF8    mov         eax,ebx
 00552EFA    mov         edx,55A014;'ééé, kolik toho bylo?'
 00552EFF    call        @LStrAsg
>00552F04    jmp         00554540
 00552F09    mov         eax,ebx
 00552F0B    mov         edx,55A034;'Asi 2 korbely, takže 2 kováky.'
 00552F10    call        @LStrAsg
>00552F15    jmp         00554540
 00552F1A    mov         eax,ebx
 00552F1C    mov         edx,55A05C;'Tuším, že 3 korbely nesplacené.'
 00552F21    call        @LStrAsg
>00552F26    jmp         00554540
 00552F2B    mov         eax,ebx
 00552F2D    mov         edx,55A084;'Dejte 4 kováky a je to!'
 00552F32    call        @LStrAsg
>00552F37    jmp         00554540
 00552F3C    mov         eax,ebx
 00552F3E    mov         edx,55A0A4;'Berte pivo odmìnou za vyprávìní...'
 00552F43    call        @LStrAsg
>00552F48    jmp         00554540
 00552F4D    mov         eax,ebx
 00552F4F    mov         edx,55A0D0;'Tady máš za ty ruce, ééé chci øíci korbely...'
 00552F54    call        @LStrAsg
>00552F59    jmp         00554540
 00552F5E    mov         eax,ebx
 00552F60    mov         edx,55A108;'Tu máš tøi kovové...'
 00552F65    call        @LStrAsg
>00552F6A    jmp         00554540
 00552F6F    mov         eax,ebx
 00552F71    mov         edx,55A128;'Jako žok ještì nejsem, abych si nepamatoval tøi korbely!#Nedám ti nic, lotøe...
 00552F76    call        @LStrAsg
>00552F7B    jmp         00554540
 00552F80    mov         eax,ebx
 00552F82    mov         edx,55A1A4;'Vøelé díky, hochu, to si nechám líbit...'
 00552F87    call        @LStrAsg
>00552F8C    jmp         00554540
 00552F91    mov         eax,ebx
 00552F93    mov         edx,55A1D8;'Už se mi nìjak palice motá...'
 00552F98    call        @LStrAsg
>00552F9D    jmp         00554540
 00552FA2    mov         eax,ebx
 00552FA4    mov         edx,556714;'Chrr... Chrr...'
 00552FA9    call        @LStrAsg
>00552FAE    jmp         00554540
 00552FB3    mov         eax,ebx
 00552FB5    mov         edx,55A200;'Vstávej opilèe, táhni spát domù!'
 00552FBA    call        @LStrAsg
>00552FBF    jmp         00554540
 00552FC4    mov         eax,ebx
 00552FC6    mov         edx,55A22C;'Hé... blblr.... vrrr, uee...'
 00552FCB    call        @LStrAsg
>00552FD0    jmp         00554540
 00552FD5    mov         eax,ebx
 00552FD7    mov         edx,55A254;'Je to marné, s tímhle hovadem se sám tahat nebudu...'
 00552FDC    call        @LStrAsg
>00552FE1    jmp         00554540
 00552FE6    mov         eax,ebx
 00552FE8    mov         edx,55A294;'Co je to za kroky? Kdo je to tady?'
 00552FED    call        @LStrAsg
>00552FF2    jmp         00554540
 00552FF7    mov         eax,ebx
 00552FF9    mov         edx,55A2C0;'Žádný strach, nejsem mordýø...'
 00552FFE    call        @LStrAsg
>00553003    jmp         00554540
 00553008    mov         eax,ebx
 0055300A    mov         edx,55A2E8;'Zrak mám zkalený stáøím, tìlo zlomené bolestí,#ale sluch mi slouží dobøe.#Má...
 0055300F    call        @LStrAsg
>00553014    jmp         00554540
 00553019    mov         eax,ebx
 0055301B    mov         edx,55A34C;'Proèpak strašíš v tìchto komnatách zapomnìní, mladíèe?'
 00553020    call        @LStrAsg
>00553025    jmp         00554540
 0055302A    mov         eax,ebx
 0055302C    mov         edx,55A38C;'Nìco tu hledám, vpravdì marnì...'
 00553031    call        @LStrAsg
>00553036    jmp         00554540
 0055303B    mov         eax,ebx
 0055303D    mov         edx,55A3B8;'Také hledám nìco... Hledám klid ducha,#aby mohl pokojnì vyhasnout v temnotì ...
 00553042    call        @LStrAsg
>00553047    jmp         00554540
 0055304C    mov         eax,ebx
 0055304E    mov         edx,55A438;'Pøebývá v tìchto podivných chodbách ještì nìkdo?'
 00553053    call        @LStrAsg
>00553058    jmp         00554540
 0055305D    mov         eax,ebx
 0055305F    mov         edx,55A474;'Krom havìti podzemní o nikom nevím.#Svou skromnou komnatu mám hnedka zkraje ...
 00553064    call        @LStrAsg
>00553069    jmp         00554540
 0055306E    mov         eax,ebx
 00553070    mov         edx,55A4F8;'A kdo zdejší chodby hloubil a proè?'
 00553075    call        @LStrAsg
>0055307A    jmp         00554540
 0055307F    mov         eax,ebx
 00553081    mov         edx,55A524;'Mé vyprahlé hrdlo svírá bolest po takové mluvì...#Dones mi chlapèe trochu vo...
 00553086    call        @LStrAsg
>0055308B    jmp         00554540
 00553090    mov         eax,ebx
 00553092    mov         edx,55A5B8;'Jedna pramenitá ze skály...#Co tedy místo zdejší?'
 00553097    call        @LStrAsg
>0055309C    jmp         00554540
 005530A1    mov         eax,ebx
 005530A3    mov         edx,55A5F4;'Díky ti...#Zdejší jeskynì od nepamìti sloužily coby poustevna.#I já zde naše...
 005530A8    call        @LStrAsg
>005530AD    jmp         00554540
 005530B2    mov         eax,ebx
 005530B4    mov         edx,55A658;'Èasu dávného zde zejména dlouhá léta sídlil øád podivínských mnichù,#kteøí r...
 005530B9    call        @LStrAsg
>005530BE    jmp         00554540
 005530C3    mov         eax,ebx
 005530C5    mov         edx,55A6E0;'Sám nevím, kam celé bludištì vede a zvìdavostí nehoøím,#ale nìkteøí dobrodru...
 005530CA    call        @LStrAsg
>005530CF    jmp         00554540
 005530D4    mov         eax,ebx
 005530D6    mov         edx,55A784;'Nìkteré dìsil øev strašidel, nìkdo vidìl pøízraky,#nìkdo si vymýšlel, nìkdo ...
 005530DB    call        @LStrAsg
>005530E0    jmp         00554540
 005530E5    mov         eax,ebx
 005530E7    mov         edx,55A7E4;'Všechny ty chudáky hnala zvìdavost,#stovky legend kolují o øádu tìch mnichù ...
 005530EC    call        @LStrAsg
>005530F1    jmp         00554540
 005530F6    mov         eax,ebx
 005530F8    mov         edx,55A844;'Prý nashromáždili obrovský poklad, jiní tvrdí,#že hledali cestu k nesmrtelno...
 005530FD    call        @LStrAsg
>00553102    jmp         00554540
 00553107    mov         eax,ebx
 00553109    mov         edx,55A8DC;'Je ovšem pravdou, že všichni zmizeli tam kdesi dole...'
 0055310E    call        @LStrAsg
>00553113    jmp         00554540
 00553118    mov         eax,ebx
 0055311A    mov         edx,55A91C;'Co bych mìl ještì vìdìt, než se tam vydám?'
 0055311F    call        @LStrAsg
>00553124    jmp         00554540
 00553129    mov         eax,ebx
 0055312B    mov         edx,55A950;'Otoè své mladé kroky zpìt, dokud je èas.#Bylo by škoda pøipravit se o možnos...
 00553130    call        @LStrAsg
>00553135    jmp         00554540
 0055313A    mov         eax,ebx
 0055313C    mov         edx,55A9EC;'Povím ti ještì jedno tajemství,#snad tì odvede z tìchto míst prokletých.'
 00553141    call        @LStrAsg
>00553146    jmp         00554540
 0055314B    mov         eax,ebx
 0055314D    mov         edx,55AA40;'Jen poslední prosbu umírajícího mám,#otøi mi tváø a pokliï kolem postele...'
 00553152    call        @LStrAsg
>00553157    jmp         00554540
 0055315C    mov         eax,ebx
 0055315E    mov         edx,55AA94;'Povím ti hornické tajemství, které jsem vyslechl od jednoho havíøe,#který se...
 00553163    call        @LStrAsg
>00553168    jmp         00554540
 0055316D    mov         eax,ebx
 0055316F    mov         edx,55AB38;'Tehdy mluvil o zlaté žíle v dolech,#kterou nestaèili vytìžit, když se voda z...
 00553174    call        @LStrAsg
>00553179    jmp         00554540
 0055317E    mov         eax,ebx
 00553180    mov         edx,55ABF8;'Zahradili onu chodbu falešnou zdí, malá skulina má nápovìdou být.#Kdesi ve d...
 00553185    call        @LStrAsg
>0055318A    jmp         00554540
 0055318F    mov         eax,ebx
 00553191    mov         edx,55AC80;'Tam peèlivì prohlédni stìny a najdi tu díru.#Sežeò si krumpáè, nakopej bohat...
 00553196    call        @LStrAsg
>0055319B    jmp         00554540
 005531A0    mov         eax,ebx
 005531A2    mov         edx,55AD34;'Podívám se tam...#Cítím se zavázán za takovou cennou zvìst!#Ještì vám nìjak ...
 005531A7    call        @LStrAsg
>005531AC    jmp         00554540
 005531B1    mov         eax,ebx
 005531B3    mov         edx,55ADA4;'Nemarni èas s umírajícím více, ponechej mne bolestem svìta,#temnotì zapomnìn...
 005531B8    call        @LStrAsg
>005531BD    jmp         00554540
 005531C2    mov         eax,ebx
 005531C4    mov         edx,55AE20;'Prosím, otøi mi tváø a pokliï kolem postele...'
 005531C9    call        @LStrAsg
>005531CE    jmp         00554540
 005531D3    mov         eax,ebx
 005531D5    mov         edx,55AE58;'Kdo je to!'
 005531DA    call        @LStrAsg
>005531DF    jmp         00554540
 005531E4    mov         eax,ebx
 005531E6    mov         edx,55AE6C;'Ten dobrotivý mladík, poznáváte hlas?'
 005531EB    call        @LStrAsg
>005531F0    jmp         00554540
 005531F5    mov         eax,ebx
 005531F7    mov         edx,55AE9C;'Což takhle kus poctivého chleba?'
 005531FC    call        @LStrAsg
>00553201    jmp         00554540
 00553206    mov         eax,ebx
 00553208    mov         edx,55AEC8;'Takové milosrdenství ti oplatím neèím, co již nebudu potøebovat...'
 0055320D    call        @LStrAsg
>00553212    jmp         00554540
 00553217    mov         eax,ebx
 00553219    mov         edx,55AF14;'Z vdìku vám pøináším lék proti bolesti,#snad vám alespoò trochu ulehèí trápe...
 0055321E    call        @LStrAsg
>00553223    jmp         00554540
 00553228    mov         eax,ebx
 0055322A    mov         edx,55AF6C;'Vezmìte ho jako rozlouèení,#ctím vaše pøání klidu a nebudu více rušit rozjím...
 0055322F    call        @LStrAsg
>00553234    jmp         00554540
 00553239    mov         eax,ebx
 0055323B    mov         edx,55AFC8;'Opravdu šlechetný jsi, pøijímám, podej mi ho k ústùm...'
 00553240    call        @LStrAsg
>00553245    jmp         00554540
 0055324A    mov         eax,ebx
 0055324C    mov         edx,55B008;'Pøízrak! Za tebou, utíkej odsud...!'
 00553251    call        @LStrAsg
>00553256    jmp         00554540
 0055325B    mov         eax,ebx
 0055325D    mov         edx,55B034;'...co, kde?'
 00553262    call        @LStrAsg
>00553267    jmp         00554540
 0055326C    mov         eax,ebx
 0055326E    mov         edx,55B048;'U všech ïasù, co to s ním udìlalo?#Vìru všemocný lék, ta lstivá baba mìla pr...
 00553273    call        @LStrAsg
>00553278    jmp         00554540
 0055327D    mov         eax,ebx
 0055327F    mov         edx,55B0A4;'Táhni k èertu, kdokoliv tam stojíš!'
 00553284    call        @LStrAsg
>00553289    jmp         00554540
 0055328E    mov         eax,ebx
 00553290    mov         edx,55B0D0;'Kdybych cestu znal, tak jsem tam dávno...'
 00553295    call        @LStrAsg
>0055329A    jmp         00554540
 0055329F    mov         eax,ebx
 005532A1    mov         edx,55B104;'Vskutku? Pojï mi tedy bradu ukázat!'
 005532A6    call        @LStrAsg
>005532AB    jmp         00554540
 005532B0    mov         eax,ebx
 005532B2    mov         edx,55B130;'Šeredná staøena vaøí cosi nevábného...'
 005532B7    call        @LStrAsg
>005532BC    jmp         00554540
 005532C1    mov         eax,ebx
 005532C3    mov         edx,55B160;'Mládí rouhavé, naè øeèi takové?'
 005532C8    call        @LStrAsg
>005532CD    jmp         00554540
 005532D2    mov         eax,ebx
 005532D4    mov         edx,55B188;'Nelidský úkol na bedrech mám#a to sehnat v tìchto blatech vezdejších nìjakéh...
 005532D9    call        @LStrAsg
>005532DE    jmp         00554540
 005532E3    mov         eax,ebx
 005532E5    mov         edx,55B1EC;'Mùj vzteky šílený pán mne posílá i k ïáblu hledat#a pravdu asi má, nikdo jin...
 005532EA    call        @LStrAsg
>005532EF    jmp         00554540
 005532F4    mov         eax,ebx
 005532F6    mov         edx,55B26C;'Proto chodím rouhavì krajem a volám ho,#i tøebaže tomu nevìøím pøíliš...'
 005532FB    call        @LStrAsg
>00553300    jmp         00554540
 00553305    mov         eax,ebx
 00553307    mov         edx,55B2C0;'Postaèí pár sudù piva, nebo ty jsou cenou rovné mému pøežití!'
 0055330C    call        @LStrAsg
>00553311    jmp         00554540
 00553316    mov         eax,ebx
 00553318    mov         edx,55B308;'Sním o velkém bohatství a vlastní hospodì!'
 0055331D    call        @LStrAsg
>00553322    jmp         00554540
 00553327    mov         eax,ebx
 00553329    mov         edx,55B33C;'Sud i bezedný získat mùžeš,#když propùjèíš mi svou sílu tìla!'
 0055332E    call        @LStrAsg
>00553333    jmp         00554540
 00553338    mov         eax,ebx
 0055333A    mov         edx,55B384;'Dovedu tì k bohatství králù,#když propùjèíš mi svou sílu tìla!'
 0055333F    call        @LStrAsg
>00553344    jmp         00554540
 00553349    mov         eax,ebx
 0055334B    mov         edx,55B3CC;'Netøeba vìøit ani pochybovat, netøeba nikam chodit,#staèí se zastavit a posl...
 00553350    call        @LStrAsg
>00553355    jmp         00554540
 0055335A    mov         eax,ebx
 0055335C    mov         edx,55B44C;'Je tu snad nìjaký rohatec, který by navaøil pivo?#Dám mu cokoliv!'
 00553361    call        @LStrAsg
>00553366    jmp         00554540
 0055336B    mov         eax,ebx
 0055336D    mov         edx,55B498;'Šlapeš mu po stínu unáhlený zbloudilèe, je sláb, ale pøítomen všude.#Je pøik...
 00553372    call        @LStrAsg
>00553377    jmp         00554540
 0055337C    mov         eax,ebx
 0055337E    mov         edx,55B53C;'Podepíšu krví, nejsou-li to žvásty!'
 00553383    call        @LStrAsg
>00553388    jmp         00554540
 0055338D    mov         eax,ebx
 0055338F    mov         edx,55B568;'Vytáhneš klín z kamene a uvolníš sílu, která rozlomí hory v pùl.'
 00553394    call        @LStrAsg
>00553399    jmp         00554540
 0055339E    mov         eax,ebx
 005533A0    mov         edx,55B5B4;'Prosekáš si cestu mezi strážci a vrátíš, co bylo ztracené.#V zbroji staré pø...
 005533A5    call        @LStrAsg
>005533AA    jmp         00554540
 005533AF    mov         eax,ebx
 005533B1    mov         edx,55B634;'U všech ïasù, vùbec nevím co tedy udìlat...?'
 005533B6    call        @LStrAsg
>005533BB    jmp         00554540
 005533C0    mov         eax,ebx
 005533C2    mov         edx,55B66C;'Ve zdejším kraji nìkde skryt je a støežen starý grimoár,#který hledám po cel...
 005533C7    call        @LStrAsg
>005533CC    jmp         00554540
 005533D1    mov         eax,ebx
 005533D3    mov         edx,55B6D0;'Mìní místo v prackách bratrství, kteøí hledají klíè k nesmrtelnému žití.'
 005533D8    call        @LStrAsg
>005533DD    jmp         00554540
 005533E2    mov         eax,ebx
 005533E4    mov         edx,55B724;'Jeho sílu neskryjí ani v nitru zemì, proto cestují svìtem,#zemì se chvìje ko...
 005533E9    call        @LStrAsg
>005533EE    jmp         00554540
 005533F3    mov         eax,ebx
 005533F5    mov         edx,55B7A4;'Bylo mnoho zájemcù o jeho sílu,#ale málo vytrvalo z nich a ne kdekdo se jej ...
 005533FA    call        @LStrAsg
>005533FF    jmp         00554540
 00553404    mov         eax,ebx
 00553406    mov         edx,55B808;'Z tebe sálá odhodlání pøinést obì,#staò se mou dlouhou rukou teï!'
 0055340B    call        @LStrAsg
>00553410    jmp         00554540
 00553415    mov         eax,ebx
 00553417    mov         edx,55B854;'Pùjdu tedy hledat, ale jakým smìrem?'
 0055341C    call        @LStrAsg
>00553421    jmp         00554540
 00553426    mov         eax,ebx
 00553428    mov         edx,55B884;'Takovým, kterým by nešel obyèejný èlovìk!'
 0055342D    call        @LStrAsg
>00553432    jmp         00554540
 00553437    mov         eax,ebx
 00553439    mov         edx,55B8B8;'Hledej tam, kde se otøásá zem!'
 0055343E    call        @LStrAsg
>00553443    jmp         00554540
 00553448    mov         eax,ebx
 0055344A    mov         edx,55B8E0;'Na cestách jsem setkal chorého, kterému tøeba pomoci!#Jakýsi dìd poustevní. ...
 0055344F    call        @LStrAsg
>00553454    jmp         00554540
 00553459    mov         eax,ebx
 0055345B    mov         edx,55B964;'Pak takovému dopøejeme toho nejlepšího léku!'
 00553460    call        @LStrAsg
>00553465    jmp         00554540
 0055346A    mov         eax,ebx
 0055346C    mov         edx,55B99C;'Pøipravím vaøení ze zásob sušených,#ale hlavní pøísadou budou navíc èerstvé ...
 00553471    call        @LStrAsg
>00553476    jmp         00554540
 0055347B    mov         eax,ebx
 0055347D    mov         edx,55BA3C;'Pøineseš tøi poøádné a vyléèíme i obra!'
 00553482    call        @LStrAsg
>00553487    jmp         00554540
 0055348C    mov         eax,ebx
 0055348E    mov         edx,55B8B8;'Hledej tam, kde se otøásá zem!'
 00553493    call        @LStrAsg
>00553498    jmp         00554540
 0055349D    mov         eax,ebx
 0055349F    mov         edx,55BA6C;'Pospìš s tím!'
 005534A4    call        @LStrAsg
>005534A9    jmp         00554540
 005534AE    mov         eax,ebx
 005534B0    mov         edx,55BA84;'Neseš houby?'
 005534B5    call        @LStrAsg
>005534BA    jmp         00554540
 005534BF    mov         eax,ebx
 005534C1    mov         edx,55BA9C;'Já mám dosti èasu, mùžeš to ale o sobì øíci?'
 005534C6    call        @LStrAsg
>005534CB    jmp         00554540
 005534D0    mov         eax,ebx
 005534D2    mov         edx,55BAD4;'Nesu jednu houbu smradlavou...'
 005534D7    call        @LStrAsg
>005534DC    jmp         00554540
 005534E1    mov         eax,ebx
 005534E3    mov         edx,55BAFC;'Potøebuji tøi a masité, hledej pozornìji!'
 005534E8    call        @LStrAsg
>005534ED    jmp         00554540
 005534F2    mov         eax,ebx
 005534F4    mov         edx,55BB30;'Našel jsem jen dvì, nestaèí to?'
 005534F9    call        @LStrAsg
>005534FE    jmp         00554540
 00553503    mov         eax,ebx
 00553505    mov         edx,55BB58;'Nestaèí! Najdi poslední,#i kdybys jako pes mìl po ètyøech èmuchat!'
 0055350A    call        @LStrAsg
>0055350F    jmp         00554540
 00553514    mov         eax,ebx
 00553516    mov         edx,55BBA4;'Nesu všechny tøi lepkavé zatuchlé houby dùlní!#Vyhovují?'
 0055351B    call        @LStrAsg
>00553520    jmp         00554540
 00553525    mov         eax,ebx
 00553527    mov         edx,55BBE8;'Takové obøí masáky jsem jakživa nevidìla!#Bývaly by staèily jen dva...#Ale c...
 0055352C    call        @LStrAsg
>00553531    jmp         00554540
 00553536    mov         eax,ebx
 00553538    mov         edx,55BC6C;'Jen zamíchám, povaøím a pøeliji ti do flakónu ten lék všech lékù!'
 0055353D    call        @LStrAsg
>00553542    jmp         00554540
 00553547    mov         eax,ebx
 00553549    mov         edx,55BCB8;'Dìkuji, letím léèit a pátrat dál...'
 0055354E    call        @LStrAsg
>00553553    jmp         00554540
 00553558    mov         eax,ebx
 0055355A    mov         edx,55BCE4;'Našel jsem ten zatuchlý svazek plný èmáranic a písmen podivných!#Co bude dál...
 0055355F    call        @LStrAsg
>00553564    jmp         00554540
 00553569    mov         eax,ebx
 0055356B    mov         edx,55BD3C;'Dokázal jsi to, vskutku!#Teï je tvá volnost na dosah ruky, mùj Pane!'
 00553570    call        @LStrAsg
>00553575    jmp         00554540
 0055357A    mov         eax,ebx
 0055357C    mov         edx,55BD8C;'Jaké to øeèi stáøím pomatené?#Jsem stále jen pivní posluha,#který holý život...
 00553581    call        @LStrAsg
>00553586    jmp         00554540
 0055358B    mov         eax,ebx
 0055358D    mov         edx,55BE48;'Vìci nejsou takové, jak se zdají.#Lidé nejsou tací, jak se znají.#Život tøím...
 00553592    call        @LStrAsg
>00553597    jmp         00554540
 0055359C    mov         eax,ebx
 0055359E    mov         edx,55BEDC;'Nerozumím nièemu, což takhle Mne trknout?#Rozumu jsem v pivu mnoho utopil......
 005535A3    call        @LStrAsg
>005535A8    jmp         00554540
 005535AD    mov         eax,ebx
 005535AF    mov         edx,55BF34;'Kdepak pivní posluha, mùj Pane.#Tvùj pøíchod pøedpovìzen byl a tys pùvod svù...
 005535B4    call        @LStrAsg
>005535B9    jmp         00554540
 005535BE    mov         eax,ebx
 005535C0    mov         edx,55BFE0;'Rozhlédni se kolem, kolik vody s tebou do kraje pøišlo,#kolik neštìstí a lid...
 005535C5    call        @LStrAsg
>005535CA    jmp         00554540
 005535CF    mov         eax,ebx
 005535D1    mov         edx,55C0C0;'Roznesl jsem tolik zkázy, aniž bych vìdìl o tom?#Jsem snad høíèkou nìèeho mn...
 005535D6    call        @LStrAsg
>005535DB    jmp         00554540
 005535E0    mov         eax,ebx
 005535E2    mov         edx,55C170;'Zatracení lidé, co je mi po nich! I když...#Pøece nejsem takovým sobcem, aby...
 005535E7    call        @LStrAsg
>005535EC    jmp         00554540
 005535F1    mov         eax,ebx
 005535F3    mov         edx,55C214;'Podej mi ten svazek, horlivèe, dostaneš celý svìt!#Všechny hvìzdy jsoucna hl...
 005535F8    call        @LStrAsg
>005535FD    jmp         00554540
 00553602    mov         eax,ebx
 00553604    mov         edx,55C284;'Ne! A mì plameny na hranici pohltí, je-li to vše pravda!'
 00553609    call        @LStrAsg
>0055360E    jmp         00554540
 00553613    mov         eax,ebx
 00553615    mov         edx,55C2C8;'U zøícení nebes, nezahrávej si s lidmi více a poslechni!'
 0055361A    call        @LStrAsg
>0055361F    jmp         00554540
 00553624    mov         eax,ebx
 00553626    mov         edx,55C30C;'Ano, jsem-li vyvolen, budu následovat údìl!'
 0055362B    call        @LStrAsg
>00553630    jmp         00554540
 00553635    mov         eax,ebx
 00553637    mov         edx,55C340;'A stane se co musí, teï!'
 0055363C    call        @LStrAsg
>00553641    jmp         00554540
 00553646    mov         eax,ebx
 00553648    mov         edx,55C364;'Co se stalo?#Cítím se náramnì!#Pln síly a moudrosti a chutì konat velkolepé ...
 0055364D    call        @LStrAsg
>00553652    jmp         00554540
 00553657    mov         eax,ebx
 00553659    mov         edx,55C3C0;'Tedy bìž, mùj Pane!'
 0055365E    call        @LStrAsg
>00553663    jmp         00554540
 00553668    mov         eax,ebx
 0055366A    mov         edx,55C3DC;'Kdo jsi?'
 0055366F    call        @LStrAsg
>00553674    jmp         00554540
 00553679    mov         eax,ebx
 0055367B    mov         edx,55C3F0;'Èlovìk z masa a kostí, kterého nic nezastaví!'
 00553680    call        @LStrAsg
>00553685    jmp         00554540
 0055368A    mov         eax,ebx
 0055368C    mov         edx,55C428;'Vìtšinou na mì lidé volají: pivo sem! Jsem tedy asi pivo...'
 00553691    call        @LStrAsg
>00553696    jmp         00554540
 0055369B    mov         eax,ebx
 0055369D    mov         edx,55C46C;'Jsem novic øádu, pøicházím s tajným posláním!'
 005536A2    call        @LStrAsg
>005536A7    jmp         00554540
 005536AC    mov         eax,ebx
 005536AE    mov         edx,55C4A4;'Tváø tisícù oèí, paže o tisíci meèích...'
 005536B3    call        @LStrAsg
>005536B8    jmp         00554540
 005536BD    mov         eax,ebx
 005536BF    mov         edx,55C4D8;'...a moudrost tisícù knih jest Legie na stráži vìèné!'
 005536C4    call        @LStrAsg
>005536C9    jmp         00554540
 005536CE    mov         eax,ebx
 005536D0    mov         edx,55C518;'Odstup, nezasvìcený!'
 005536D5    call        @LStrAsg
>005536DA    jmp         00554540
 005536DF    mov         eax,ebx
 005536E1    mov         edx,55C538;'Kouká velmi tristnì. Kdyby radìji ty dudy zahodil#a namísto potulné žebroty ...
 005536E6    call        @LStrAsg
>005536EB    jmp         00554540
 005536F0    mov         eax,ebx
 005536F2    mov         edx,55C5A8;'Jen a hraje a nechytraèí!'
 005536F7    call        @LStrAsg
>005536FC    jmp         00554540
 00553701    mov         eax,ebx
 00553703    mov         edx,55C5CC;'Poslechni: Mrtvé listoví padá se stromù v tíseò promoklé dlažby mìst#a smutn...
 00553708    call        @LStrAsg
>0055370D    jmp         00554540
 00553712    mov         eax,ebx
 00553714    mov         edx,55C6A8;'...smutný den jako tento zasluhuje nìjakou smutnou píseò,#co øíkáš na tuhle?...
 00553719    call        @LStrAsg
>0055371E    jmp         00554540
 00553723    mov         eax,ebx
 00553725    mov         edx,55C760;'Až mi nìkdo koneènì hodí kovák k nohám,#ihned nìco zahraji nebo zarecituji.....
 0055372A    call        @LStrAsg
>0055372F    jmp         00554540
 00553734    mov         eax,ebx
 00553736    mov         edx,55C7B8;'Dobré. Nebýt tu Pán, pøinesu ti zase kus tvrdého chleba...'
 0055373B    call        @LStrAsg
>00553740    jmp         00554540
 00553745    mov         eax,ebx
 00553747    mov         edx,55C7FC;'Jsi hodný, je to opravdu ras.#Sleduji, jak na tebe celý den køièí.#Také to n...
 0055374C    call        @LStrAsg
>00553751    jmp         00554540
 00553756    mov         eax,ebx
 00553758    mov         edx,55C860;'Dej tam: mrtvé listy padly, bude to znít smutnìji...'
 0055375D    call        @LStrAsg
>00553762    jmp         00554540
 00553767    mov         eax,ebx
 00553769    mov         edx,55C8A0;'Myslíš? Zkusím si to ještì párkrát pøehrát v hlavì a dám pak vìdìt.'
 0055376E    call        @LStrAsg
>00553773    jmp         00554540
 00553778    mov         eax,ebx
 0055377A    mov         edx,55C8EC;'Což takhle promarnit mince za pivo?'
 0055377F    call        @LStrAsg
>00553784    jmp         00554540
 00553789    mov         eax,ebx
 0055378B    mov         edx,55C918;'Pøece víš, že tomuto moku pøíliš neholduji.#Lidé po nìm kynou jako vepøi, ne...
 00553790    call        @LStrAsg
>00553795    jmp         00554540
 0055379A    mov         eax,ebx
 0055379C    mov         edx,55C990;'Takové víno z jižních krajù, to je jiná píseò.#Lehké, vznešené a jemné, je p...
 005537A1    call        @LStrAsg
>005537A6    jmp         00554540
 005537AB    mov         eax,ebx
 005537AD    mov         edx,55CA28;'Zkus to vysvìtlit místním opilcùm...'
 005537B2    call        @LStrAsg
>005537B7    jmp         00554540
 005537BC    mov         eax,ebx
 005537BE    mov         edx,55CA58;'Tu máš kovák...'
 005537C3    call        @LStrAsg
>005537C8    jmp         00554540
 005537CD    mov         eax,ebx
 005537CF    mov         edx,55CA70;'Dìkuji. Poslechneš píseò nebo vyslechneš báseò?'
 005537D4    call        @LStrAsg
>005537D9    jmp         00554540
 005537DE    mov         eax,ebx
 005537E0    mov         edx,55CAA8;'Zahraj tedy!'
 005537E5    call        @LStrAsg
>005537EA    jmp         00554540
 005537EF    mov         eax,ebx
 005537F1    mov         edx,55CAC0;'Zarecituj nìco!'
 005537F6    call        @LStrAsg
>005537FB    jmp         00554540
 00553800    mov         eax,ebx
 00553802    mov         edx,55CAD8;'Laskavý básníèe, co kdybys mi pùjèil ten tvùj mìch#na rozfoukání jedné výhnì...
 00553807    call        @LStrAsg
>0055380C    jmp         00554540
 00553811    mov         eax,ebx
 00553813    mov         edx,55CB5C;'Inu proè ne, tedy slyš:#Byl jsi ke mnì vždy laskavý, nech kožený mìch ti za...
 00553818    call        @LStrAsg
>0055381D    jmp         00554540
 00553822    mov         eax,ebx
 00553824    mov         edx,55CC00;'Vzpomínku dìsivou si nesu:#Dudama jsem z nouze kamenné výhni pìl,#když sluch...
 00553829    call        @LStrAsg
>0055382E    jmp         00554540
 00553833    mov         eax,ebx
 00553835    mov         edx,55CC74;'...Tohle budu øíkat pocestným.'
 0055383A    call        @LStrAsg
>0055383F    jmp         00554540
 00553844    mov         eax,ebx
 00553846    mov         edx,55CC9C;'Dobré, dobré... Pùjèíš tedy mìch pro píseò výhni?'
 0055384B    call        @LStrAsg
>00553850    jmp         00554540
 00553855    mov         eax,ebx
 00553857    mov         edx,55CCD8;'Zajisté, jen mi na nìj pozor dej, mé živobytí na pamìti mìj!'
 0055385C    call        @LStrAsg
>00553861    jmp         00554540
 00553866    mov         eax,ebx
 00553868    mov         edx,55CD20;'S díkem vracím ten pekelný mìch!'
 0055386D    call        @LStrAsg
>00553872    jmp         00554540
 00553877    mov         eax,ebx
 00553879    mov         edx,55CD4C;'Již plane žárem ta píseò ohnivá?'
 0055387E    call        @LStrAsg
>00553883    jmp         00554540
 00553888    mov         eax,ebx
 0055388A    mov         edx,55CD78;'Spíše mi puèí v botách plíseò svìdivá.#Ještì jsem nedmýchal...'
 0055388F    call        @LStrAsg
>00553894    jmp         00554540
 00553899    mov         eax,ebx
 0055389B    mov         edx,55CDC0;'Netøeba díkù, posloužil-li vìci dobré...'
 005538A0    call        @LStrAsg
>005538A5    jmp         00554540
 005538AA    mov         eax,ebx
 005538AC    mov         edx,55CDF4;'Bez dmýcháku nezadudám nic...'
 005538B1    call        @LStrAsg
>005538B6    jmp         00554540
 005538BB    mov         eax,ebx
 005538BD    mov         edx,55CE1C;'Jen poøádnì nafouknu mìch...'
 005538C2    call        @LStrAsg
>005538C7    jmp         00554540
 005538CC    mov         eax,ebx
 005538CE    mov         edx,55CE44;'Nìjaká èarodìjnice ta,#boky libé, prsy velké,#sbírá košem svinstva,#vzrostlé...
 005538D3    call        @LStrAsg
>005538D8    jmp         00554540
 005538DD    mov         eax,ebx
 005538DF    mov         edx,55CEA8;'V sadu lip a køivých bøíz,#pod mraky èernomodravými,#pod stíny vypálených hn...
 005538E4    call        @LStrAsg
>005538E9    jmp         00554540
 005538EE    mov         eax,ebx
 005538F0    mov         edx,55CF24;'Až øeky všechny otrávím,#nebude moci píti zvìø,#jezera, tùnì lesní otrávím,#...
 005538F5    call        @LStrAsg
>005538FA    jmp         00554540
 005538FF    mov         eax,ebx
 00553901    mov         edx,55CF94;'Zatracená hospodská lùza,#prasata chlastají blití#vlastní, i pije ta špína#j...
 00553906    call        @LStrAsg
>0055390B    jmp         00554540
 00553910    mov         eax,ebx
 00553912    mov         edx,55D004;'U všech mocností svìta, zachraòte mne nìkdo!#Slíbím duši ïáblu nebo bohabojn...
 00553917    call        @LStrAsg
>0055391C    jmp         00554540
 00553921    mov         eax,ebx
 00553923    mov         edx,55D070;'Seženu lano, šetøete vzduch v hrdle!'
 00553928    call        @LStrAsg
>0055392D    jmp         00554540
 00553932    mov         eax,ebx
 00553934    mov         edx,55D0A0;'Až opadne voda, snad ho nìkdo odnese...'
 00553939    call        @LStrAsg
>0055393E    jmp         00554540
 00553943    mov         eax,ebx
 00553945    mov         edx,55D0D0;'Nebohé zvíøe doplatilo na lehkovážnost èlovìka...'
 0055394A    call        @LStrAsg
>0055394F    jmp         00554540
 00553954    mov         eax,ebx
 00553956    mov         edx,55D10C;'Nemocné stromy poráží, vpravdì práce nad hlavu má...'
 0055395B    call        @LStrAsg
>00553960    jmp         00554540
 00553965    mov         eax,ebx
 00553967    mov         edx,55D14C;'To je rámusu po lese! Naè taková horlivost v práci?'
 0055396C    call        @LStrAsg
>00553971    jmp         00554540
 00553976    mov         eax,ebx
 00553978    mov         edx,55D188;'Musím zachránit co nejvíce døeva, jinak v zimì zmrzneme.#Vidíš tu nemocnou k...
 0055397D    call        @LStrAsg
>00553982    jmp         00554540
 00553987    mov         eax,ebx
 00553989    mov         edx,55D238;'V nekonèícím dešti se tak i staré mohutné kmeny bortí#jako hrouda shnilého n...
 0055398E    call        @LStrAsg
>00553993    jmp         00554540
 00553998    mov         eax,ebx
 0055399A    mov         edx,55D2C4;'Mám práci, nevidíš?'
 0055399F    call        @LStrAsg
>005539A4    jmp         00554540
 005539A9    mov         eax,ebx
 005539AB    mov         edx,55D2E0;'Marná práce, ale snad se nìco zachrání...'
 005539B0    call        @LStrAsg
>005539B5    jmp         00554540
 005539BA    mov         eax,ebx
 005539BC    mov         edx,55D314;'Vìru podivný neøád, opravdu prsty lepí...'
 005539C1    call        @LStrAsg
>005539C6    jmp         00554540
 005539CB    mov         eax,ebx
 005539CD    mov         edx,55D348;'Nic takového jsem nevidìl ani v Krkonoších.#Tam obèas zaøádil døevožrout, nì...
 005539D2    call        @LStrAsg
>005539D7    jmp         00554540
 005539DC    mov         eax,ebx
 005539DE    mov         edx,55D3D8;'Když se množil døevokazný brouk, slétly se hladové zobáky z širého kraje.#Kd...
 005539E3    call        @LStrAsg
>005539E8    jmp         00554540
 005539ED    mov         eax,ebx
 005539EF    mov         edx,55D474;'Nemám chu tì dál poslouchat.#Chceš snad øíci, že se tu lopotím zbyteènì?#Vš...
 005539F4    call        @LStrAsg
>005539F9    jmp         00554540
 005539FE    mov         eax,ebx
 00553A00    mov         edx,55D500;'Takhle promarnit èas zbyteèným rozhovorem,#tebe mi snesl sám ïas. Dej mi už ...
 00553A05    call        @LStrAsg
>00553A0A    jmp         00554540
 00553A0F    mov         eax,ebx
 00553A11    mov         edx,55D568;'Co se poohlédnout po nìjakých venkovanech?'
 00553A16    call        @LStrAsg
>00553A1B    jmp         00554540
 00553A20    mov         eax,ebx
 00553A22    mov         edx,55D59C;'Les ochoøel stejnì jako sídlo lidí, zvláštní...'
 00553A27    call        @LStrAsg
>00553A2C    jmp         00554540
 00553A31    mov         eax,ebx
 00553A33    mov         edx,55D5D4;'Když vidím ty stromy, vyjde to nastejno...'
 00553A38    call        @LStrAsg
>00553A3D    jmp         00554540
 00553A42    mov         eax,ebx
 00553A44    mov         edx,55D608;'Pak je tedy marné vše...'
 00553A49    call        @LStrAsg
>00553A4E    jmp         00554540
 00553A53    mov         eax,ebx
 00553A55    mov         edx,55D62C;'Mohl bych vám nìjak já pomoci?'
 00553A5A    call        @LStrAsg
>00553A5F    jmp         00554540
 00553A64    mov         eax,ebx
 00553A66    mov         edx,55D654;'Pak tedy popøeji mnoho sil na rubání a odejdu s vírou...'
 00553A6B    call        @LStrAsg
>00553A70    jmp         00554540
 00553A75    mov         eax,ebx
 00553A77    mov         edx,55D698;'Možná máte pravdu, ani zlé èasy nejsou vìèné...'
 00553A7C    call        @LStrAsg
>00553A81    jmp         00554540
 00553A86    mov         eax,ebx
 00553A88    mov         edx,55D6D0;'Kde berete tu jistotu?'
 00553A8D    call        @LStrAsg
>00553A92    jmp         00554540
 00553A97    mov         eax,ebx
 00553A99    mov         edx,55D6F0;'Pak tedy popøeji mnoho sil a pùjdu...'
 00553A9E    call        @LStrAsg
>00553AA3    jmp         00554540
 00553AA8    mov         eax,ebx
 00553AAA    mov         edx,55D720;'Nechcete ještì s nìèím pomoci?'
 00553AAF    call        @LStrAsg
>00553AB4    jmp         00554540
 00553AB9    mov         eax,ebx
 00553ABB    mov         edx,55D748;'Já se zase obávám, že vám i naštípané døevo shnije...'
 00553AC0    call        @LStrAsg
>00553AC5    jmp         00554540
 00553ACA    mov         eax,ebx
 00553ACC    mov         edx,55D788;'Pøeji mnoho zdaru a louèím se!'
 00553AD1    call        @LStrAsg
>00553AD6    jmp         00554540
 00553ADB    mov         eax,ebx
 00553ADD    mov         edx,55D7B0;'Jen jsem vás chtìl ušetøit marné práce, v dobrém...'
 00553AE2    call        @LStrAsg
>00553AE7    jmp         00554540
 00553AEC    mov         eax,ebx
 00553AEE    mov         edx,55D7EC;'Nechme sporù, nechtìl jsem vás rozzuøit...'
 00553AF3    call        @LStrAsg
>00553AF8    jmp         00554540
 00553AFD    mov         eax,ebx
 00553AFF    mov         edx,55D820;'Zastavte se v hospodì a zeptejte se horníkù, uvidíte...'
 00553B04    call        @LStrAsg
>00553B09    jmp         00554540
 00553B0E    mov         eax,ebx
 00553B10    mov         edx,55D860;'Což sehnat pomocníka, stromù je mnoho...'
 00553B15    call        @LStrAsg
>00553B1A    jmp         00554540
 00553B1F    mov         eax,ebx
 00553B21    mov         edx,55D894;'Není tu jediného pacholka ku pomoci!#Jilemnici samotnou sužuje mor, jakoby j...
 00553B26    call        @LStrAsg
>00553B2B    jmp         00554540
 00553B30    mov         eax,ebx
 00553B32    mov         edx,55D900;'Všichni zdraví vzali nohy na ramena,#ostatní mají práce dost nebo jsou zavøe...
 00553B37    call        @LStrAsg
>00553B3C    jmp         00554540
 00553B41    mov         eax,ebx
 00553B43    mov         edx,55D990;'Co jít okouknout døeviny za kopec?'
 00553B48    call        @LStrAsg
>00553B4D    jmp         00554540
 00553B52    mov         eax,ebx
 00553B54    mov         edx,55D9BC;'Nemá smysl nikam chodit.#Øeky se vylévají z koryt do kraje, všude bláta po k...
 00553B59    call        @LStrAsg
>00553B5E    jmp         00554540
 00553B63    mov         eax,ebx
 00553B65    mov         edx,55DA40;'Nad hlavou ti bouøí a když ne blesk,#skolí tì dýkou nìjaký hladový loupežník...
 00553B6A    call        @LStrAsg
>00553B6F    jmp         00554540
 00553B74    mov         eax,ebx
 00553B76    mov         edx,55DACC;'Ten pohled vnáší zkázu do mého døevorubeckého srdce, pravdu díš.#Les je mi d...
 00553B7B    call        @LStrAsg
>00553B80    jmp         00554540
 00553B85    mov         eax,ebx
 00553B87    mov         edx,55DB88;'Jenže støechu opravíš,#tyhle staré nahnilé stromy sotva nasekám a prodám jak...
 00553B8C    call        @LStrAsg
>00553B91    jmp         00554540
 00553B96    mov         eax,ebx
 00553B98    mov         edx,55DBF0;'Zdejší les si neporadí? Tøeba jej èas ozdraví...'
 00553B9D    call        @LStrAsg
>00553BA2    jmp         00554540
 00553BA7    mov         eax,ebx
 00553BA9    mov         edx,55DC2C;'Les je podobný lidem, chlapèe. Když ochoøí, popadá pár stromù,#z jejichž tro...
 00553BAE    call        @LStrAsg
>00553BB3    jmp         00554540
 00553BB8    mov         eax,ebx
 00553BBA    mov         edx,55DCA0;'Když ale zemøe srdce lesa, shluk prapùvodních nejstarších stromù,#zbortí se ...
 00553BBF    call        @LStrAsg
>00553BC4    jmp         00554540
 00553BC9    mov         eax,ebx
 00553BCB    mov         edx,55DD74;'Když se rozhlédnu, není tu už jediný zdravý strom...'
 00553BD0    call        @LStrAsg
>00553BD5    jmp         00554540
 00553BDA    mov         eax,ebx
 00553BDC    mov         edx,55DDB4;'Ty tedy nepøidáš jednomu na radosti.#Všechno sice nasvìdèuje nedobrým zítøkù...
 00553BE1    call        @LStrAsg
>00553BE6    jmp         00554540
 00553BEB    mov         eax,ebx
 00553BED    mov         edx,55DE44;'Smrky rychle rostou, vysadíme nový les hned na jaøe#a za osm let se vrátí zv...
 00553BF2    call        @LStrAsg
>00553BF7    jmp         00554540
 00553BFC    mov         eax,ebx
 00553BFE    mov         edx,55DEC0;'Šlechetná nabídka, chlapèe, jen se obávám,#že dohromady máme jen jednu seker...
 00553C03    call        @LStrAsg
>00553C08    jmp         00554540
 00553C0D    mov         eax,ebx
 00553C0F    mov         edx,55DF1C;'Tak se mi líbíš! Hlavu vzhùru a neklesat na mysli!'
 00553C14    call        @LStrAsg
>00553C19    jmp         00554540
 00553C1E    mov         eax,ebx
 00553C20    mov         edx,55DF58;'Proè mne trýzníš takovými slovy?#Proè bych tì mìl dále poslouchat?#Akoráte m...
 00553C25    call        @LStrAsg
>00553C2A    jmp         00554540
 00553C2F    mov         eax,ebx
 00553C31    mov         edx,55DFDC;'Omlouvám se, máte u mì pivo, staèí zajít do hospody...'
 00553C36    call        @LStrAsg
>00553C3B    jmp         00554540
 00553C40    mov         eax,ebx
 00553C42    mov         edx,55E01C;'Tak marnit èas naléváním se?#Teï už nechci ani marnit èas s tebou, jdi mi z ...
 00553C47    call        @LStrAsg
>00553C4C    jmp         00554540
 00553C51    mov         eax,ebx
 00553C53    mov         edx,55E078;'Ano, všechno vám shnije a sekera se zlomí...'
 00553C58    call        @LStrAsg
>00553C5D    jmp         00554540
 00553C62    mov         eax,ebx
 00553C64    mov         edx,55E0B0;'Cha, chá, to se ještì uvidí!#A teï už táhni, mám práci a nehodlám tì více po...
 00553C69    call        @LStrAsg
>00553C6E    jmp         00554540
 00553C73    mov         eax,ebx
 00553C75    mov         edx,55E110;'Brány mìsta se asi nadobro zavøou, nikdo zvenèí se tam nedostane...'
 00553C7A    call        @LStrAsg
>00553C7F    jmp         00554540
 00553C84    mov         eax,ebx
 00553C86    mov         edx,55E15C;'U všech prokletých, to mi øíkáš jen tak? Nikdo mne nezpravil!#Jaká hanebnost...
 00553C8B    call        @LStrAsg
>00553C90    jmp         00554540
 00553C95    mov         eax,ebx
 00553C97    mov         edx,55E210;'Jdu se povìsit na nejbližší zdravý strom!'
 00553C9C    call        @LStrAsg
>00553CA1    jmp         00554540
 00553CA6    mov         eax,ebx
 00553CA8    mov         edx,55E244;'Vtipkujete?'
 00553CAD    call        @LStrAsg
>00553CB2    jmp         00554540
 00553CB7    mov         eax,ebx
 00553CB9    mov         edx,55E258;'Jak jen správnì pojmenovat#ten penìzlaèný bezcitný cizácký pohled?'
 00553CBE    call        @LStrAsg
>00553CC3    jmp         00554540
 00553CC8    mov         eax,ebx
 00553CCA    mov         edx,55E2A4;'Nové zboží plný káry.#Peníze žádné neopovažuj chmatat!'
 00553CCF    call        @LStrAsg
>00553CD4    jmp         00554540
 00553CD9    mov         eax,ebx
 00553CDB    mov         edx,55E2E4;'Což takhle pøiuèit se radìji mluvì èeské,#než-li hrozit, mizero?'
 00553CE0    call        @LStrAsg
>00553CE5    jmp         00554540
 00553CEA    mov         eax,ebx
 00553CEC    mov         edx,55E330;'Peníze dost jen øeè!'
 00553CF1    call        @LStrAsg
>00553CF6    jmp         00554540
 00553CFB    mov         eax,ebx
 00553CFD    mov         edx,55E350;'Rozbiji ti korbelem hlavu!'
 00553D02    call        @LStrAsg
>00553D07    jmp         00554540
 00553D0C    mov         eax,ebx
 00553D0E    mov         edx,55E374;'Co chtít?'
 00553D13    call        @LStrAsg
>00553D18    jmp         00554540
 00553D1D    mov         eax,ebx
 00553D1F    mov         edx,55E388;'Nevím, rozmyslím radìji ještì...'
 00553D24    call        @LStrAsg
>00553D29    jmp         00554540
 00553D2E    mov         eax,ebx
 00553D30    mov         edx,55E3B4;'Chci nìco koupit!'
 00553D35    call        @LStrAsg
>00553D3A    jmp         00554540
 00553D3F    mov         eax,ebx
 00553D41    mov         edx,55E3D0;'Nechci nic, ty pouštní hade!'
 00553D46    call        @LStrAsg
>00553D4B    jmp         00554540
 00553D50    mov         eax,ebx
 00553D52    mov         edx,55E3F8;'Karafu vína na kuráž!'
 00553D57    call        @LStrAsg
>00553D5C    jmp         00554540
 00553D61    mov         eax,ebx
 00553D63    mov         edx,55E418;'Potøebuji pochodeò.'
 00553D68    call        @LStrAsg
>00553D6D    jmp         00554540
 00553D72    mov         eax,ebx
 00553D74    mov         edx,55E434;'Potøebuji lano!'
 00553D79    call        @LStrAsg
>00553D7E    jmp         00554540
 00553D83    mov         eax,ebx
 00553D85    mov         edx,55E44C;'Zkusím tabák.'
 00553D8A    call        @LStrAsg
>00553D8F    jmp         00554540
 00553D94    mov         eax,ebx
 00553D96    mov         edx,55E464;'Potøebuji rozmìnit zlatku na menší!'
 00553D9B    call        @LStrAsg
>00553DA0    jmp         00554540
 00553DA5    mov         eax,ebx
 00553DA7    mov         edx,55E490;'Ty nemít zlato!'
 00553DAC    call        @LStrAsg
>00553DB1    jmp         00554540
 00553DB6    mov         eax,ebx
 00553DB8    mov         edx,55E4A8;'Jeden zlato za 10 kovák.'
 00553DBD    call        @LStrAsg
>00553DC2    jmp         00554540
 00553DC7    mov         eax,ebx
 00553DC9    mov         edx,55E4CC;'Odeèti 2 kováky a dej to sem, hanebný šejdíøi!'
 00553DCE    call        @LStrAsg
>00553DD3    jmp         00554540
 00553DD8    mov         eax,ebx
 00553DDA    mov         edx,55E504;'Ale 1 kovák strhni za to, že ti nezapálím krám!'
 00553DDF    call        @LStrAsg
>00553DE4    jmp         00554540
 00553DE9    mov         eax,ebx
 00553DEB    mov         edx,55E53C;'Dej to sem, nemám èas se tu handlovat!'
 00553DF0    call        @LStrAsg
>00553DF5    jmp         00554540
 00553DFA    mov         eax,ebx
 00553DFC    mov         edx,55E388;'Nevím, rozmyslím radìji ještì...'
 00553E01    call        @LStrAsg
>00553E06    jmp         00554540
 00553E0B    mov         eax,ebx
 00553E0D    mov         edx,55E56C;'Víno trpký jako písek v hubì, z daleko jižních kraj slunce!#Dát 5 kovák!'
 00553E12    call        @LStrAsg
>00553E17    jmp         00554540
 00553E1C    mov         eax,ebx
 00553E1E    mov         edx,55E5C0;'Pochodnì smolný hoøet dlouho, nepraštit se do hlava!#Dát 1 kovák!'
 00553E23    call        @LStrAsg
>00553E28    jmp         00554540
 00553E2D    mov         eax,ebx
 00553E2F    mov         edx,55E60C;'Lano pevný jako drát, konopí Indie, obìsit lehko nebo pøivázat vùl!#Poslední...
 00553E34    call        @LStrAsg
>00553E39    jmp         00554540
 00553E3E    mov         eax,ebx
 00553E40    mov         edx,55E678;'Tabák silný pálit fròák, i velký vezír kulit oèi!#Poslední zásoby. Dát 4 kov...
 00553E45    call        @LStrAsg
>00553E4A    jmp         00554540
 00553E4F    mov         eax,ebx
 00553E51    mov         edx,55E6D0;'Ještì chtít co?'
 00553E56    call        @LStrAsg
>00553E5B    jmp         00554540
 00553E60    mov         eax,ebx
 00553E62    mov         edx,55E6E8;'Nemít dost, táhnout odsud!'
 00553E67    call        @LStrAsg
>00553E6C    jmp         00554540
 00553E71    mov         eax,ebx
 00553E73    mov         edx,55E70C;'Dobrá, jen se nezlobit!'
 00553E78    call        @LStrAsg
>00553E7D    jmp         00554540
 00553E82    mov         eax,ebx
 00553E84    mov         edx,55E72C;'Nedám, køik se neleknout!'
 00553E89    call        @LStrAsg
>00553E8E    jmp         00554540
 00553E93    mov         eax,ebx
 00553E95    mov         edx,55E750;'Obchod výhodná oba!'
 00553E9A    call        @LStrAsg
>00553E9F    jmp         00554540
 00553EA4    mov         eax,ebx
 00553EA6    mov         edx,55E76C;'Pohublá ženština tøesoucí hladovým uzlem èlovìèiny...'
 00553EAB    call        @LStrAsg
>00553EB0    jmp         00554540
 00553EB5    mov         eax,ebx
 00553EB7    mov         edx,55E7AC;'To je køiku!'
 00553EBC    call        @LStrAsg
>00553EC1    jmp         00554540
 00553EC6    mov         eax,ebx
 00553EC8    mov         edx,55E7C4;'...je hladový, mùj malý synáèek.#Nemáme nic, mléko jsem ztratila hrùzou.#Umí...
 00553ECD    call        @LStrAsg
>00553ED2    jmp         00554540
 00553ED7    mov         eax,ebx
 00553ED9    mov         edx,55E848;'Co strašného se pøihodilo, že i mléko ztvrdlo dìsem?'
 00553EDE    call        @LStrAsg
>00553EE3    jmp         00554540
 00553EE8    mov         eax,ebx
 00553EEA    mov         edx,55E888;'...té noci bouølivé, kdy vichøice trhala støechy a lámala okenice,#se blesky...
 00553EEF    call        @LStrAsg
>00553EF4    jmp         00554540
 00553EF9    mov         eax,ebx
 00553EFB    mov         edx,55E950;'Zemì se tøásla, mraky praskaly,#držela jsem pevnì plaèícího synáèka...'
 00553F00    call        @LStrAsg
>00553F05    jmp         00554540
 00553F0A    mov         eax,ebx
 00553F0C    mov         edx,55E9A0;'Najednou zdí prolétla ohnivá koule,#ozvala se ohlušující rána a vše zbìlalo....
 00553F11    call        @LStrAsg
>00553F16    jmp         00554540
 00553F1B    mov         eax,ebx
 00553F1D    mov         edx,55E9F8;'Slepota z oslnìní a huèení v hlavì,#vidìla jsem smrt a cítila jen dusivý kou...
 00553F22    call        @LStrAsg
>00553F27    jmp         00554540
 00553F2C    mov         eax,ebx
 00553F2E    mov         edx,55EA54;'Až potom jsem se probudila na chladné dlažbì,#chlapi se snažili hasit vedlej...
 00553F33    call        @LStrAsg
>00553F38    jmp         00554540
 00553F3D    mov         eax,ebx
 00553F3F    mov         edx,55EAD4;'Blesk stoèený do ohnivé koule?#Nevídané vìci obvykle zvìstují cosi zlého...'
 00553F44    call        @LStrAsg
>00553F49    jmp         00554540
 00553F4E    mov         eax,ebx
 00553F50    mov         edx,55EB28;'Což se zvednout a jít se nìkam ohøát?'
 00553F55    call        @LStrAsg
>00553F5A    jmp         00554540
 00553F5F    mov         eax,ebx
 00553F61    mov         edx,55EB58;'Odevšad nás vyhánìjí, mùj synáèek stále hlady pláèe,#nemohu ho nijak utišit....
 00553F66    call        @LStrAsg
>00553F6B    jmp         00554540
 00553F70    mov         eax,ebx
 00553F72    mov         edx,55EBB0;'Je moc malý, aby jedl chléb,#já nemám mléko, nikdo tu nemá ani mléko kozí.'
 00553F77    call        @LStrAsg
>00553F7C    jmp         00554540
 00553F81    mov         eax,ebx
 00553F83    mov         edx,55EC04;'Lidé nevydrží dlouho poslouchat ten srdceryvný náøek,#zaènou brzy zuøit a hn...
 00553F88    call        @LStrAsg
>00553F8D    jmp         00554540
 00553F92    mov         eax,ebx
 00553F94    mov         edx,55EC68;'Synáèek pláèe ve dne i v noci,#nìkolik dní nespal a já s ním.'
 00553F99    call        @LStrAsg
>00553F9E    jmp         00554540
 00553FA3    mov         eax,ebx
 00553FA5    mov         edx,55ECB0;'Neudržím ho již, blouzním tu únavou#a pøesto nesmím usnout, krysy musím odhá...
 00553FAA    call        @LStrAsg
>00553FAF    jmp         00554540
 00553FB4    mov         eax,ebx
 00553FB6    mov         edx,55ED0C;'V hospodì zase není pivo, jestli to nebude znamení zlé!'
 00553FBB    call        @LStrAsg
>00553FC0    jmp         00554540
 00553FC5    mov         eax,ebx
 00553FC7    mov         edx,55ED4C;'Kde si otec toho zplozeného válí bøich?'
 00553FCC    call        @LStrAsg
>00553FD1    jmp         00554540
 00553FD6    mov         eax,ebx
 00553FD8    mov         edx,55ED7C;'Mùj synáèek nepochází z požehnaného svazku,#proto námi všichni pohrdají...'
 00553FDD    call        @LStrAsg
>00553FE2    jmp         00554540
 00553FE7    mov         eax,ebx
 00553FE9    mov         edx,55EDD0;'Jako služebná u jièínského pána#nucena jsem byla být mu po vùli milostné.#Zl...
 00553FEE    call        @LStrAsg
>00553FF3    jmp         00554540
 00553FF8    mov         eax,ebx
 00553FFA    mov         edx,55EE5C;'Pokornì jsem sloužila a snášela hrubost nejednu,#ale když se mi nakonec bøic...
 00553FFF    call        @LStrAsg
>00554004    jmp         00554540
 00554009    mov         eax,ebx
 0055400B    mov         edx,55EEF0;'Dostala jsem rozbitý domek zde v Jilemnici a dýku na krk,#promluvím-li kdy.'
 00554010    call        @LStrAsg
>00554015    jmp         00554540
 0055401A    mov         eax,ebx
 0055401C    mov         edx,55EF44;'Jenže domek vyhoøel, nyní nemáme nic, jako žebraèka tu pojdu hlady,#nikdo se...
 00554021    call        @LStrAsg
>00554026    jmp         00554540
 0055402B    mov         eax,ebx
 0055402D    mov         edx,55EFC0;'Nièema panský a navíc z Jièína,#to mìsto je od nepamìti kolébkou zla!'
 00554032    call        @LStrAsg
>00554037    jmp         00554540
 0055403C    mov         eax,ebx
 0055403E    mov         edx,55F010;'Pùjdu radìji, ještì dostanu hlad z takových øeèí!'
 00554043    call        @LStrAsg
>00554048    jmp         00554540
 0055404D    mov         eax,ebx
 0055404F    mov         edx,55F04C;'Pokud máš mìšec pøíliš tìžký,#má prosebná dlaò je otevøená...'
 00554054    call        @LStrAsg
>00554059    jmp         00554540
 0055405E    mov         eax,ebx
 00554060    mov         edx,55F094;'Potìžkám ho a uvidíme...'
 00554065    call        @LStrAsg
>0055406A    jmp         00554540
 0055406F    mov         eax,ebx
 00554071    mov         edx,55F0B8;'Tuto minci mohu postrádat.'
 00554076    call        @LStrAsg
>0055407B    jmp         00554540
 00554080    mov         eax,ebx
 00554082    mov         edx,55F0DC;'A se ti dobrotivý pán bùh v nebi odvdìèí!'
 00554087    call        @LStrAsg
>0055408C    jmp         00554540
 00554091    mov         eax,ebx
 00554093    mov         edx,55F110;'Do nebe nemám zrovna namíøeno...'
 00554098    call        @LStrAsg
>0055409D    jmp         00554540
 005540A2    mov         eax,ebx
 005540A4    mov         edx,55F13C;'Neúnavný to èlovìk, jak vidno...'
 005540A9    call        @LStrAsg
>005540AE    jmp         00554540
 005540B3    mov         eax,ebx
 005540B5    mov         edx,55F168;'Potøebuješ nìco chlapèe? Jsem velmi zamìstnaný èlovìk,#kromì téhle kovadliny...
 005540BA    call        @LStrAsg
>005540BF    jmp         00554540
 005540C4    mov         eax,ebx
 005540C6    mov         edx,55F200;'Co potøebuješ, chlapèe?'
 005540CB    call        @LStrAsg
>005540D0    jmp         00554540
 005540D5    mov         eax,ebx
 005540D7    mov         edx,55F220;'Nesahej na to tìma hospodskýma prackama!'
 005540DC    call        @LStrAsg
>005540E1    jmp         00554540
 005540E6    mov         eax,ebx
 005540E8    mov         edx,55F254;'Prozatím to bude vše.'
 005540ED    call        @LStrAsg
>005540F2    jmp         00554540
 005540F7    mov         eax,ebx
 005540F9    mov         edx,55F274;'Pøišel jsem jen pozdravit.'
 005540FE    call        @LStrAsg
>00554103    jmp         00554540
 00554108    mov         eax,ebx
 0055410A    mov         edx,55F298;'To je od tebe milé, nìco takového neslýchám èasto.#Když se tak zamyslím, cho...
 0055410F    call        @LStrAsg
>00554114    jmp         00554540
 00554119    mov         eax,ebx
 0055411B    mov         edx,55F354;'Pár otrapù sem chodí s bolavými zuby.#Kdo to jakživ slyšel, že kováø je mudr...
 00554120    call        @LStrAsg
>00554125    jmp         00554540
 0055412A    mov         eax,ebx
 0055412C    mov         edx,55F3F0;'Co to bude, až to skuté?'
 00554131    call        @LStrAsg
>00554136    jmp         00554540
 0055413B    mov         eax,ebx
 0055413D    mov         edx,55F414;'Co to kujete?'
 00554142    call        @LStrAsg
>00554147    jmp         00554540
 0055414C    mov         eax,ebx
 0055414E    mov         edx,55F42C;'Strážní si poruèili nové zbranì, loupežníci zase øádí.#Jsou vyhladovìlí, pro...
 00554153    call        @LStrAsg
>00554158    jmp         00554540
 0055415D    mov         eax,ebx
 0055415F    mov         edx,55F4A8;'Jakoby nestaèilo všechno neštìstí vezdejší, ještì ti lotrové k tomu...#Ještì...
 00554164    call        @LStrAsg
>00554169    jmp         00554540
 0055416E    mov         eax,ebx
 00554170    mov         edx,55F528;'To ti povídám, chlapèe, bez poøádné palice ani krok ven!'
 00554175    call        @LStrAsg
>0055417A    jmp         00554540
 0055417F    mov         eax,ebx
 00554181    mov         edx,55F56C;'Beru na vìdomí...#Když už jsem tu, rád bych se tedy na nìco podíval.'
 00554186    call        @LStrAsg
>0055418B    jmp         00554540
 00554190    mov         eax,ebx
 00554192    mov         edx,55F5BC;'Co by to mìlo být?'
 00554197    call        @LStrAsg
>0055419C    jmp         00554540
 005541A1    mov         eax,ebx
 005541A3    mov         edx,55F5D8;'Zajímám se o zbranì, velké a zmrzaèující!'
 005541A8    call        @LStrAsg
>005541AD    jmp         00554540
 005541B2    mov         eax,ebx
 005541B4    mov         edx,55F60C;'Mám tu jeden starý palcát.#Už sice olízl pár tváøí a pár helmic prorazil,#al...
 005541B9    call        @LStrAsg
>005541BE    jmp         00554540
 005541C3    mov         eax,ebx
 005541C5    mov         edx,55F698;'Pak by tu byla velká váleèná palice.#Pokud ti síla na poøádný nápøah staèí,#...
 005541CA    call        @LStrAsg
>005541CF    jmp         00554540
 005541D4    mov         eax,ebx
 005541D6    mov         edx,55F714;'Pak tu mám kapitánskou halapartnu, prvotøídní kousek na zakázku kovaný.#Než ...
 005541DB    call        @LStrAsg
>005541E0    jmp         00554540
 005541E5    mov         eax,ebx
 005541E7    mov         edx,55F818;'Tak mi tu halapartna trèí, není totiž levná...'
 005541EC    call        @LStrAsg
>005541F1    jmp         00554540
 005541F6    mov         eax,ebx
 005541F8    mov         edx,55F850;'Nebyla by nìjaká zbroj?'
 005541FD    call        @LStrAsg
>00554202    jmp         00554540
 00554207    mov         eax,ebx
 00554209    mov         edx,55F870;'Zbroje nevyrábím, od toho tu je platnéø.#Jenže ten má kovadlinu za hradbou n...
 0055420E    call        @LStrAsg
>00554213    jmp         00554540
 00554218    mov         eax,ebx
 0055421A    mov         edx,55F904;'Mám tu ale vlastnì nìkde otluèenou pøilbici,#kterou jsem chtìl roztavit. Moh...
 0055421F    call        @LStrAsg
>00554224    jmp         00554540
 00554229    mov         eax,ebx
 0055422B    mov         edx,55F96C;'A pak mám ještì nedopletenou kroužkovou zbroj v zástavì,#pro kterou si ale d...
 00554230    call        @LStrAsg
>00554235    jmp         00554540
 0055423A    mov         eax,ebx
 0055423C    mov         edx,55FA14;'Rád se toho zbavím...'
 00554241    call        @LStrAsg
>00554246    jmp         00554540
 0055424B    mov         eax,ebx
 0055424D    mov         edx,55FA34;'Ještì to zvážím a mince pøepoèítám.'
 00554252    call        @LStrAsg
>00554257    jmp         00554540
 0055425C    mov         eax,ebx
 0055425E    mov         edx,55FA60;'Dohodnuto!'
 00554263    call        @LStrAsg
>00554268    jmp         00554540
 0055426D    mov         eax,ebx
 0055426F    mov         edx,55FA74;'Co já s tímhle neøádem ozubeným?'
 00554274    call        @LStrAsg
>00554279    jmp         00554540
 0055427E    mov         eax,ebx
 00554280    mov         edx,55FAA0;'Kdybych ho zde nechal pøedlohou,#zvládl byste slít dle pøesné míry 6ti palcù...
 00554285    call        @LStrAsg
>0055428A    jmp         00554540
 0055428F    mov         eax,ebx
 00554291    mov         edx,55FB20;'Už se stalo, objednal si ho osobnì starý mistr z cechu hornického.#Nejspíše ...
 00554296    call        @LStrAsg
>0055429B    jmp         00554540
 005542A0    mov         eax,ebx
 005542A2    mov         edx,55FBF0;'Banda lotrovská, hornická, ani zálohu jsem nedostal!'
 005542A7    call        @LStrAsg
>005542AC    jmp         00554540
 005542B1    mov         eax,ebx
 005542B3    mov         edx,55FC30;'Na kolik ho ceníte? Zaplatím to za nì.'
 005542B8    call        @LStrAsg
>005542BD    jmp         00554540
 005542C2    mov         eax,ebx
 005542C4    mov         edx,55FC60;'Jeden okousaný pravý zlaák!'
 005542C9    call        @LStrAsg
>005542CE    jmp         00554540
 005542D3    mov         eax,ebx
 005542D5    mov         edx,55FC88;'Vezmu starý palcát, aby ochutnal èerstvou krev!'
 005542DA    call        @LStrAsg
>005542DF    jmp         00554540
 005542E4    mov         eax,ebx
 005542E6    mov         edx,55FCC0;'Jak jsem øekl, pøátelská cena 5 zlatých za kvalitní zbraò!'
 005542EB    call        @LStrAsg
>005542F0    jmp         00554540
 005542F5    mov         eax,ebx
 005542F7    mov         edx,55FD04;'Beru palici, vyzkouším to zatloukání lidí do zemì!'
 005542FC    call        @LStrAsg
>00554301    jmp         00554540
 00554306    mov         eax,ebx
 00554308    mov         edx,55FD40;'Za palici mi dej 7 zlatých#a pozor na vlastní kolena, až tím budeš mávat!'
 0055430D    call        @LStrAsg
>00554312    jmp         00554540
 00554317    mov         eax,ebx
 00554319    mov         edx,55FD94;'Chtìl bych tu halapartnu, škoda ji nechat zahálet!'
 0055431E    call        @LStrAsg
>00554323    jmp         00554540
 00554328    mov         eax,ebx
 0055432A    mov         edx,55FDD0;'Tahle prvotøídní zbraò tì bude stát 16 zlatých.'
 0055432F    call        @LStrAsg
>00554334    jmp         00554540
 00554339    mov         eax,ebx
 0055433B    mov         edx,55FE08;'Chtìl bych tu pøilbici!'
 00554340    call        @LStrAsg
>00554345    jmp         00554540
 0055434A    mov         eax,ebx
 0055434C    mov         edx,55FE28;'Za tenhle plechový neøád mi dej jen 2 zlaté.'
 00554351    call        @LStrAsg
>00554356    jmp         00554540
 0055435B    mov         eax,ebx
 0055435D    mov         edx,55FE60;'Vezmu si tu nešastnou zbroj.'
 00554362    call        @LStrAsg
>00554367    jmp         00554540
 0055436C    mov         eax,ebx
 0055436E    mov         edx,55FE88;'Když mi slíbíš, že si budeš dobøe chránit ruce,#dám ti vestu za pouhé 3 zlat...
 00554373    call        @LStrAsg
>00554378    jmp         00554540
 0055437D    mov         eax,ebx
 0055437F    mov         edx,55FEE0;'Potøeboval bych nabrousit sekeru.'
 00554384    call        @LStrAsg
>00554389    jmp         00554540
 0055438E    mov         eax,ebx
 00554390    mov         edx,55FF0C;'Ta už nìco pamatuje, zuby jako pes...#Budu je muset zahladit a vybrousit cel...
 00554395    call        @LStrAsg
>0055439A    jmp         00554540
 0055439F    mov         eax,ebx
 005543A1    mov         edx,55FFA0;'Teï s ní mùžeš kosit i obilí..'
 005543A6    call        @LStrAsg
>005543AB    jmp         00554540
 005543B0    mov         eax,ebx
 005543B2    mov         edx,55FFC8;'Tak si ten nástroj zkázy vezmi!'
 005543B7    call        @LStrAsg
>005543BC    jmp         00554540
 005543C1    mov         eax,ebx
 005543C3    mov         edx,55FFF0;'Mohu si tu zatím schovat svùj starý nástroj zkázy?#Nepobral bych to všechno....
 005543C8    call        @LStrAsg
>005543CD    jmp         00554540
 005543D2    mov         eax,ebx
 005543D4    mov         edx,560048;'Mùžeš, ale mám u tebe pivo, jestli o to zakopnu!'
 005543D9    call        @LStrAsg
>005543DE    jmp         00554540
 005543E3    mov         eax,ebx
 005543E5    mov         edx,560084;'Žádné rezavé kováky nechci, svou práci si cením zlatými!'
 005543EA    call        @LStrAsg
>005543EF    jmp         00554540
 005543F4    mov         eax,ebx
 005543F6    mov         edx,5600C8;'Mìšec ti nestaèí a já na dluh již nic nedávám, je mi líto.'
 005543FB    call        @LStrAsg
>00554400    jmp         00554540
 00554405    mov         eax,ebx
 00554407    mov         edx,56010C;'U všech zmrzaèených rohatcù!#Kdy už ten hanebný zplozenec pekla zmlkne!#Já s...
 0055440C    call        @LStrAsg
>00554411    jmp         00554540
 00554416    mov         eax,ebx
 00554418    mov         edx,560188;'Uduste se tím oba!'
 0055441D    call        @LStrAsg
>00554422    jmp         00554540
 00554427    mov         eax,ebx
 00554429    mov         edx,5601A4;'A tak ryzí chrabrost spolu s èistotou srdce,'
 0055442E    call        @LStrAsg
>00554433    jmp         00554540
 00554438    mov         eax,ebx
 0055443A    mov         edx,5601DC;'tøebaže jen na oko obyèejného'
 0055443F    call        @LStrAsg
>00554444    jmp         00554540
 00554449    mov         eax,ebx
 0055444B    mov         edx,560204;'a všemi vysmívaného pacholka hospodského,'
 00554450    call        @LStrAsg
>00554455    jmp         00554540
 0055445A    mov         eax,ebx
 0055445C    mov         edx,560238;'pøemohla skrze obì nejvyšší samotného ïasa...'
 00554461    call        @LStrAsg
>00554466    jmp         00554540
 0055446B    mov         eax,ebx
 0055446D    mov         edx,560270;'A tak zkázu kraje dokonal ïas ve své plné síle.'
 00554472    call        @LStrAsg
>00554477    jmp         00554540
 0055447C    mov         eax,ebx
 0055447E    mov         edx,5602A8;'Zubožený lid jilemnický v hrozném øevu vzplál'
 00554483    call        @LStrAsg
>00554488    jmp         00554540
 0055448D    mov         eax,ebx
 0055448F    mov         edx,5602E0;'a mìsto se zbortilo v prach.'
 00554494    call        @LStrAsg
>00554499    jmp         00554540
 0055449E    mov         eax,ebx
 005544A0    mov         edx,560308;'A to byl jen zaèátek velké promìny svìta...'
 005544A5    call        @LStrAsg
>005544AA    jmp         00554540
 005544AF    mov         eax,ebx
 005544B1    call        @LStrClr
>005544B6    jmp         00554540
 005544BB    mov         eax,ebx
 005544BD    mov         edx,56033C;'(F7,F8) citlivost myši'
 005544C2    call        @LStrAsg
>005544C7    jmp         00554540
 005544C9    mov         eax,ebx
 005544CB    mov         edx,56035C;'nejrychlejší'
 005544D0    call        @LStrAsg
>005544D5    jmp         00554540
 005544D7    mov         eax,ebx
 005544D9    mov         edx,560374;'rychlejší'
 005544DE    call        @LStrAsg
>005544E3    jmp         00554540
 005544E5    mov         eax,ebx
 005544E7    mov         edx,560388;'rychlá'
 005544EC    call        @LStrAsg
>005544F1    jmp         00554540
 005544F3    mov         eax,ebx
 005544F5    mov         edx,560398;'normální'
 005544FA    call        @LStrAsg
>005544FF    jmp         00554540
 00554501    mov         eax,ebx
 00554503    mov         edx,5603AC;'pomalá'
 00554508    call        @LStrAsg
>0055450D    jmp         00554540
 0055450F    mov         eax,ebx
 00554511    mov         edx,5603BC;'pomalejší'
 00554516    call        @LStrAsg
>0055451B    jmp         00554540
 0055451D    mov         eax,ebx
 0055451F    mov         edx,5603D0;'nejpomalejší'
 00554524    call        @LStrAsg
>00554529    jmp         00554540
 0055452B    mov         eax,ebx
 0055452D    mov         edx,5603E8;'Dìkujeme za hraní Legie'
 00554532    call        @LStrAsg
>00554537    jmp         00554540
 00554539    mov         eax,ebx
 0055453B    call        @LStrClr
 00554540    pop         ebx
 00554541    ret
end;*}

end.