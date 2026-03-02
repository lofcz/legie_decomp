//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit jpeg;

interface

uses
  SysUtils, Classes, jpeg, Graphics;

type
  TJPEGData = class(TSharedImage)
  public
    FData:TCustomMemoryStream;//f8
    FHeight:Integer;//fC
    FWidth:Integer;//f10
    FGrayscale:Boolean;//f14
    destructor Destroy; virtual;//004A4C80
    procedure FreeHandle; virtual;//v0//004A4CB0
  end;
  TJPEGImage = class(TGraphic)
  public
    FImage:TJPEGData;//f28
    FBitmap:TBitmap;//f2C
    FScaledWidth:Integer;//f30
    FScaledHeight:Integer;//f34
    FTempPal:HPALETTE;//f38
    FSmoothing:Boolean;//f3C
    FGrayScale:Boolean;//f3D
    FPixelFormat:TJPEGPixelFormat;//f3E
    FQuality:TJPEGQualityRange;//f3F
    FProgressiveDisplay:Boolean;//f40
    FProgressiveEncoding:Boolean;//f41
    FPerformance:TJPEGPerformance;//f42
    FScale:TJPEGScale;//f43
    FNeedRecalc:Boolean;//f44
    destructor Destroy; virtual;//004A4D28
    procedure AssignTo(Dest:TPersistent); virtual;//v0//004A4DEC
    procedure Assign(Source:TPersistent); virtual;//v8//004A4D6C
    procedure Changed(Sender:TObject); virtual;//v10//004A51D4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//004A5558
    function Equals(Graphic:TGraphic):Boolean; virtual;//v18//004A5578
    function GetEmpty:Boolean; virtual;//v1C//004A5B10
    function GetHeight:Integer; virtual;//v20//004A5BA4
    function GetPalette:HPALETTE; virtual;//v24//004A5B3C
    function GetWidth:Integer; virtual;//v2C//004A5BD0
    procedure ReadData(Stream:TStream); virtual;//v30//004A5C98
    procedure SetHeight; virtual;//v34//004A5E58
    procedure SetPalette(Value:HPALETTE); virtual;//v38//004A5EA0
    procedure SetWidth; virtual;//v40//004A5EF8
    procedure WriteData(Stream:TStream); virtual;//v44//004A5F40
    constructor Create; virtual;//v48//004A4CB4
    procedure LoadFromStream(Stream:TStream); virtual;//v54//004A5C2C
    procedure SaveToStream(Stream:TStream); virtual;//v58//004A5E30
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v5C//004A5C0C
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE); virtual;//v60//004A5E04
    procedure CalcOutputDimensions;//004A5148
    procedure Compress;//004A51DC
    procedure FreeBitmap;//004A55C0
    function GetBitmap:TBitmap;//004A5704
    procedure JPEGNeeded;//004A5BFC
    procedure NewBitmap;//004A5C50
    procedure NewImage;//004A5C6C
    procedure ReadStream(Size:Longint; Stream:TStream);//004A5CC0
  end;
  EJPEG = class(EInvalidGraphic)
  end;
    function _malloc(size:Integer):Pointer; cdecl;//004A4AE0
    procedure _free(P:Pointer); cdecl;//004A4AF0
    procedure _memset(P:Pointer; B:Byte; count:Integer); cdecl;//004A4B00
    procedure _memcpy(dest:Pointer; source:Pointer; count:Integer); cdecl;//004A4B18
    function _fread(var buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;//004A4B2C
    function _fwrite(const buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;//004A4B48
    function _fflush(S:TStream):Integer; cdecl;//004A4B64
    function __ftol:Integer;//004A4B6C
    procedure InvalidOperation(const Msg:AnsiString);//004A4BD8
    procedure ResetErrorMgr(cinfo:j_common_ptr);//004A4C70
    destructor Destroy;//004A4C80
    procedure FreeHandle;//004A4CB0
    constructor Create;//004A4CB4
    destructor Destroy;//004A4D28
    procedure Assign(Source:TPersistent);//004A4D6C
    procedure AssignTo(Dest:TPersistent);//004A4DEC
    procedure ProgressCallback(const cinfo:jpeg_common_struct);//004A4E24
    procedure ReleaseContext(var jc:TJPEGContext);//004A4F18
    procedure InitDecompressor(Obj:TJPEGImage; var jc:TJPEGContext);//004A4F3C
    procedure Changed(Sender:TObject);//004A51D4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//004A5558
    function Equals(Graphic:TGraphic):Boolean;//004A5578
    function BuildPalette(const cinfo:jpeg_decompress_struct):HPALETTE;//004A55D4
    procedure BuildColorMap(var cinfo:jpeg_decompress_struct; P:HPALETTE);//004A567C
    function GetEmpty:Boolean;//004A5B10
    function GetPalette:HPALETTE;//004A5B3C
    function GetHeight:Integer;//004A5BA4
    function GetWidth:Integer;//004A5BD0
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//004A5C0C
    procedure LoadFromStream(Stream:TStream);//004A5C2C
    procedure ReadData(Stream:TStream);//004A5C98
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);//004A5E04
    procedure SaveToStream(Stream:TStream);//004A5E30
    procedure SetHeight;//004A5E58
    procedure SetPalette(Value:HPALETTE);//004A5EA0
    procedure SetWidth;//004A5EF8
    procedure WriteData(Stream:TStream);//004A5F40
    procedure InitDefaults;//004A5F8C
    procedure jpeg_CreateDecompress(var cinfo:jpeg_decompress_struct; version:Integer; structsize:Integer);//004A5FCC
    procedure jpeg_destroy_decompress(var cinfo:jpeg_decompress_struct);//004A609C
    //procedure sub_004A60AC(?:?);//004A60AC
    procedure jpeg_read_header(var cinfo:jpeg_decompress_struct; RequireImage:LongBool);//004A6294
    function jpeg_consume_input(var cinfo:jpeg_decompress_struct):Integer;//004A6300
    function jpeg_has_multiple_scans(var cinfo:jpeg_decompress_struct):LongBool;//004A63E0
    function jpeg_finish_decompress(var cinfo:jpeg_decompress_struct):LongBool;//004A6414
    procedure ;//004A64C4
    procedure @jinit_memory_mgr;//004A6FF0
    procedure @jpeg_get_small;//004A70E4
    procedure @jpeg_free_small;//004A70EC
    procedure @jpeg_get_large;//004A70F4
    procedure @jpeg_free_large;//004A70FC
    procedure @jpeg_mem_available;//004A7104
    procedure @jpeg_open_backing_store;//004A7110
    procedure @jpeg_mem_init;//004A7120
    procedure @jpeg_mem_term;//004A7124
    procedure ;//004A7128
    procedure @jinit_input_controller;//004A7644
    procedure ;//004A768C
    procedure jpeg_stdio_src(var cinfo:jpeg_decompress_struct; input_file:TStream);//004A7738
    function jpeg_start_decompress(var cinfo:jpeg_decompress_struct):LongBool;//004A77A4
    //function sub_004A786C(?:?):?;//004A786C
    function jpeg_read_scanlines(var cinfo:jpeg_decompress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;//004A792C
    function jpeg_start_output(var cinfo:jpeg_decompress_struct; scan_number:Integer):LongBool;//004A7A68
    function jpeg_finish_output(var cinfo:jpeg_decompress_struct):LongBool;//004A7AC8
    procedure ;//004A7B50
    procedure jpeg_calc_output_dimensions(var cinfo:jpeg_decompress_struct);//004A7BE0
    //procedure sub_004A7DCC(?:?);//004A7DCC
    //procedure sub_004A7E68(?:?);//004A7E68
    procedure @jinit_master_decompress;//004A8258
    procedure ;//004A8290
    procedure @jinit_phuff_decoder;//004A8F44
    procedure ;//004A8FB8
    procedure @jpeg_make_d_derived_tbl;//004A90F0
    procedure @jpeg_fill_bit_buffer;//004A93EC
    procedure @jpeg_huff_decode;//004A9538
    procedure @jinit_huff_decoder;//004A9B04
    procedure ;//004A9B44
    procedure @jinit_merged_upsampler;//004AA0B0
    procedure ;//004AA130
    procedure @jinit_color_deconverter;//004AA50C
    procedure ;//004AA6D8
    //function sub_004AA7D0(?:?; ?:?; ?:?; ?:?):?;//004AA7D0
    //procedure sub_004AA7F4(?:?; ?:?; ?:?; ?:?);//004AA7F4
    //procedure sub_004AA818(?:?);//004AA818
    //procedure sub_004AA9CC(?:?);//004AA9CC
    //procedure sub_004AB160(?:?);//004AB160
    procedure @jinit_1pass_quantizer;//004AB28C
    procedure ;//004AB320
    //procedure sub_004AC328(?:?);//004AC328
    procedure @jinit_2pass_quantizer;//004AC500
    procedure ;//004AC620
    procedure @jinit_d_main_controller;//004ACC18
    procedure ;//004ACCF8
    procedure @jinit_d_coef_controller;//004ADC74
    procedure ;//004ADD88
    procedure @jinit_d_post_controller;//004ADFE8
    procedure ;//004AE07C
    procedure @jinit_inverse_dct;//004AE2D0
    procedure ;//004AE34C
    procedure @jinit_upsampler;//004AE830
    procedure @jpeg_idct_float;//004AEA48
    procedure @jpeg_idct_ifast;//004AEE8C
    procedure @jpeg_idct_4x4;//004AF2C0
    procedure @jpeg_idct_2x2;//004AF674
    procedure @jpeg_idct_1x1;//004AF864
    procedure ;//004AF8A0
    //function sub_004B0F18(?:?):?;//004B0F18
    procedure @jpeg_resync_to_restart;//004B1468
    //procedure sub_004B1564(?:?);//004B1564
    procedure @jinit_marker_reader;//004B159C
    procedure jpeg_save_markers(var cinfo:jpeg_decompress_struct; marker_code:Integer; length_limit:Cardinal);//004B1610
    procedure @jdiv_round_up;//004B16F8
    procedure @jround_up;//004B1708
    procedure @jcopy_sample_rows;//004B1720
    procedure @jcopy_block_row;//004B176C
    procedure @jzero_far;//004B177C
    procedure @jpeg_abort;//004B178C
    procedure jpeg_destroy(var cinfo:jpeg_common_struct);//004B17CC
    procedure @jpeg_alloc_quant_table;//004B17EC
    procedure @jpeg_alloc_huff_table;//004B1804
    procedure ;//004B181C
    procedure jpeg_stdio_dest(var cinfo:jpeg_compress_struct; output_file:TStream);//004B18EC
    procedure ;//004B192C
    //procedure sub_004B19E4(?:?; ?:?; ?:?);//004B19E4
    //function sub_004B1A14(?:?):?;//004B1A14
    procedure jpeg_set_quality(var cinfo:jpeg_compress_struct; Quality:Integer; Baseline:LongBool);//004B1A48
    //procedure sub_004B1A64(?:?; ?:?; ?:?; ?:?);//004B1A64
    //procedure sub_004B1AEC(?:?);//004B1AEC
    procedure jpeg_set_defaults(var cinfo:jpeg_compress_struct);//004B1B44
    //procedure sub_004B1C44(?:?);//004B1C44
    procedure jpeg_set_colorspace(var cinfo:jpeg_compress_struct; colorspace:J_COLOR_SPACE);//004B1CB8
    //function sub_004B2070(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//004B2070
    //function sub_004B2098(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//004B2098
    //function sub_004B20D4(?:?; ?:?; ?:?; ?:?):?;//004B20D4
    procedure jpeg_simple_progression(var cinfo:jpeg_compress_struct);//004B2120
    procedure jpeg_start_compress(var cinfo:jpeg_compress_struct; WriteAllTables:LongBool);//004B2338
    function jpeg_write_scanlines(var cinfo:jpeg_compress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;//004B23AC
    procedure jpeg_CreateCompress(var cinfo:jpeg_compress_struct; version:Integer; structsize:Integer);//004B2518
    procedure @jpeg_suppress_tables;//004B25F0
    procedure jpeg_finish_compress(var cinfo:jpeg_compress_struct);//004B2638
    procedure @jinit_compress_master;//004B282C
    procedure ;//004B28D8
    procedure @jinit_marker_writer;//004B30AC
    procedure ;//004B3100
    //procedure sub_004B32C4(?:?);//004B32C4
    procedure @jinit_c_master_control;//004B3B68
    procedure ;//004B3C30
    procedure @jinit_c_main_controller;//004B3D08
    procedure ;//004B3D8C
    //function sub_004B4108(?:?):?;//004B4108
    procedure @jinit_c_prep_controller;//004B4220
    procedure ;//004B42C8
    procedure @jinit_c_coef_controller;//004B4A04
    procedure ;//004B4ACC
    procedure @jinit_color_converter;//004B4F08
    procedure ;//004B5154
    procedure @jinit_downsampler;//004B58F4
    procedure ;//004B5A7C
    procedure @jinit_forward_dct;//004B5F18
    procedure ;//004B5F94
    procedure @jinit_phuff_encoder;//004B6A24
    procedure @jpeg_fdct_ifast;//004B6A68
    procedure @jpeg_fdct_float;//004B6CD4
    procedure ;//004B7000
    procedure @jpeg_make_c_derived_tbl;//004B7190
    procedure @jpeg_gen_optimal_table;//004B79A0
    procedure @jinit_huff_encoder;//004B7C5C

implementation

//004A4AE0
function _malloc(size:Integer):Pointer; cdecl;
begin
{*
 004A4AE0    push        ebp
 004A4AE1    mov         ebp,esp
 004A4AE3    mov         eax,dword ptr [ebp+8]
 004A4AE6    call        @GetMem
 004A4AEB    pop         ebp
 004A4AEC    ret
*}
end;

//004A4AF0
procedure _free(P:Pointer); cdecl;
begin
{*
 004A4AF0    push        ebp
 004A4AF1    mov         ebp,esp
 004A4AF3    mov         eax,dword ptr [ebp+8]
 004A4AF6    call        @FreeMem
 004A4AFB    pop         ebp
 004A4AFC    ret
*}
end;

//004A4B00
procedure _memset(P:Pointer; B:Byte; count:Integer); cdecl;
begin
{*
 004A4B00    push        ebp
 004A4B01    mov         ebp,esp
 004A4B03    xor         ecx,ecx
 004A4B05    mov         cl,byte ptr [ebp+0C]
 004A4B08    mov         eax,dword ptr [ebp+8]
 004A4B0B    mov         edx,dword ptr [ebp+10]
 004A4B0E    call        @FillChar
 004A4B13    pop         ebp
 004A4B14    ret
*}
end;

//004A4B18
procedure _memcpy(dest:Pointer; source:Pointer; count:Integer); cdecl;
begin
{*
 004A4B18    push        ebp
 004A4B19    mov         ebp,esp
 004A4B1B    mov         edx,dword ptr [ebp+8]
 004A4B1E    mov         eax,dword ptr [ebp+0C]
 004A4B21    mov         ecx,dword ptr [ebp+10]
 004A4B24    call        Move
 004A4B29    pop         ebp
 004A4B2A    ret
*}
end;

//004A4B2C
function _fread(var buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;
begin
{*
 004A4B2C    push        ebp
 004A4B2D    mov         ebp,esp
 004A4B2F    push        ebx
 004A4B30    mov         ecx,dword ptr [ebp+0C]
 004A4B33    imul        ecx,dword ptr [ebp+10]
 004A4B37    mov         edx,dword ptr [ebp+8]
 004A4B3A    mov         eax,dword ptr [ebp+14]
 004A4B3D    mov         ebx,dword ptr [eax]
 004A4B3F    call        dword ptr [ebx+0C]
 004A4B42    pop         ebx
 004A4B43    pop         ebp
 004A4B44    ret
*}
end;

//004A4B48
function _fwrite(const buf:void ; recsize:Integer; reccount:Integer; S:TStream):Integer; cdecl;
begin
{*
 004A4B48    push        ebp
 004A4B49    mov         ebp,esp
 004A4B4B    push        ebx
 004A4B4C    mov         ecx,dword ptr [ebp+0C]
 004A4B4F    imul        ecx,dword ptr [ebp+10]
 004A4B53    mov         edx,dword ptr [ebp+8]
 004A4B56    mov         eax,dword ptr [ebp+14]
 004A4B59    mov         ebx,dword ptr [eax]
 004A4B5B    call        dword ptr [ebx+10]
 004A4B5E    pop         ebx
 004A4B5F    pop         ebp
 004A4B60    ret
*}
end;

//004A4B64
function _fflush(S:TStream):Integer; cdecl;
begin
{*
 004A4B64    push        ebp
 004A4B65    mov         ebp,esp
 004A4B67    xor         eax,eax
 004A4B69    pop         ebp
 004A4B6A    ret
*}
end;

//004A4B6C
function __ftol:Integer;
begin
{*
 004A4B6C    push        ebp
 004A4B6D    mov         ebp,esp
 004A4B6F    add         esp,0FFFFFFF8
 004A4B72    lea         eax,[ebp-8]
 004A4B75    fstp        qword ptr [eax]
 004A4B77    fld         qword ptr [ebp-8]
 004A4B7A    call        @TRUNC
 004A4B7F    pop         ecx
 004A4B80    pop         ecx
 004A4B81    pop         ebp
 004A4B82    ret
*}
end;

//004A4BD8
procedure InvalidOperation(const Msg:AnsiString);
begin
{*
 004A4BD8    push        ebx
 004A4BD9    mov         ebx,eax
 004A4BDB    mov         ecx,ebx
 004A4BDD    mov         dl,1
 004A4BDF    mov         eax,[00424168];EInvalidGraphicOperation
 004A4BE4    call        Exception.Create
 004A4BE9    call        @RaiseExcept
 004A4BEE    pop         ebx
 004A4BEF    ret
*}
end;

//004A4C70
procedure ResetErrorMgr(cinfo:j_common_ptr);
begin
{*
 004A4C70    mov         edx,dword ptr [eax]
 004A4C72    xor         ecx,ecx
 004A4C74    mov         dword ptr [edx+6C],ecx
 004A4C77    xor         eax,eax
 004A4C79    mov         dword ptr [edx+14],eax
 004A4C7C    ret
*}
end;

//004A4C80
destructor TJPEGData.Destroy;
begin
{*
 004A4C80    push        ebx
 004A4C81    push        esi
 004A4C82    call        @BeforeDestruction
 004A4C87    mov         ebx,edx
 004A4C89    mov         esi,eax
 004A4C8B    mov         eax,dword ptr [esi+8]
 004A4C8E    call        TObject.Free
 004A4C93    mov         edx,ebx
 004A4C95    and         dl,0FC
 004A4C98    mov         eax,esi
 004A4C9A    call        TObject.Destroy
 004A4C9F    test        bl,bl
>004A4CA1    jle         004A4CAA
 004A4CA3    mov         eax,esi
 004A4CA5    call        @ClassDestroy
 004A4CAA    pop         esi
 004A4CAB    pop         ebx
 004A4CAC    ret
*}
end;

//004A4CB0
procedure TJPEGData.FreeHandle;
begin
{*
 004A4CB0    ret
*}
end;

//004A4CB4
constructor TJPEGImage.Create;
begin
{*
 004A4CB4    push        ebx
 004A4CB5    push        esi
 004A4CB6    push        edi
 004A4CB7    test        dl,dl
>004A4CB9    je          004A4CC3
 004A4CBB    add         esp,0FFFFFFF0
 004A4CBE    call        @ClassCreate
 004A4CC3    mov         ebx,edx
 004A4CC5    mov         edi,eax
 004A4CC7    mov         esi,5AD7BC
 004A4CCC    xor         edx,edx
 004A4CCE    mov         eax,edi
 004A4CD0    call        TGraphic.Create
 004A4CD5    mov         eax,edi
 004A4CD7    call        TJPEGImage.NewImage
 004A4CDC    mov         al,byte ptr [esi]
 004A4CDE    mov         byte ptr [edi+3F],al
 004A4CE1    mov         al,byte ptr [esi+1]
 004A4CE4    mov         byte ptr [edi+3D],al
 004A4CE7    mov         al,byte ptr [esi+2]
 004A4CEA    mov         byte ptr [edi+42],al
 004A4CED    mov         al,byte ptr [esi+3]
 004A4CF0    mov         byte ptr [edi+3E],al
 004A4CF3    mov         al,byte ptr [esi+4]
 004A4CF6    mov         byte ptr [edi+40],al
 004A4CF9    mov         al,byte ptr [esi+5]
 004A4CFC    mov         byte ptr [edi+41],al
 004A4CFF    mov         al,byte ptr [esi+6]
 004A4D02    mov         byte ptr [edi+43],al
 004A4D05    mov         al,byte ptr [esi+7]
 004A4D08    mov         byte ptr [edi+3C],al
 004A4D0B    mov         eax,edi
 004A4D0D    test        bl,bl
>004A4D0F    je          004A4D20
 004A4D11    call        @AfterConstruction
 004A4D16    pop         dword ptr fs:[0]
 004A4D1D    add         esp,0C
 004A4D20    mov         eax,edi
 004A4D22    pop         edi
 004A4D23    pop         esi
 004A4D24    pop         ebx
 004A4D25    ret
*}
end;

//004A4D28
destructor TJPEGImage.Destroy;
begin
{*
 004A4D28    push        ebx
 004A4D29    push        esi
 004A4D2A    call        @BeforeDestruction
 004A4D2F    mov         ebx,edx
 004A4D31    mov         esi,eax
 004A4D33    mov         eax,dword ptr [esi+38];TJPEGImage.FTempPal:HPALETTE
 004A4D36    test        eax,eax
>004A4D38    je          004A4D40
 004A4D3A    push        eax
 004A4D3B    call        gdi32.DeleteObject
 004A4D40    mov         eax,dword ptr [esi+2C];TJPEGImage.FBitmap:TBitmap
 004A4D43    call        TObject.Free
 004A4D48    mov         eax,dword ptr [esi+28];TJPEGImage.FImage:TJPEGData
 004A4D4B    call        TSharedImage.Release
 004A4D50    mov         edx,ebx
 004A4D52    and         dl,0FC
 004A4D55    mov         eax,esi
 004A4D57    call        TMemoryStream.Destroy
 004A4D5C    test        bl,bl
>004A4D5E    jle         004A4D67
 004A4D60    mov         eax,esi
 004A4D62    call        @ClassDestroy
 004A4D67    pop         esi
 004A4D68    pop         ebx
 004A4D69    ret
*}
end;

//004A4D6C
procedure TJPEGImage.Assign(Source:TPersistent);
begin
{*
 004A4D6C    push        ebx
 004A4D6D    push        esi
 004A4D6E    push        edi
 004A4D6F    mov         esi,edx
 004A4D71    mov         ebx,eax
 004A4D73    mov         eax,esi
 004A4D75    mov         edx,dword ptr ds:[4A4A00];TJPEGImage
 004A4D7B    call        @IsClass
 004A4D80    test        al,al
>004A4D82    je          004A4DB3
 004A4D84    mov         eax,dword ptr [ebx+28]
 004A4D87    call        TSharedImage.Release
 004A4D8C    mov         edi,esi
 004A4D8E    mov         eax,dword ptr [edi+28]
 004A4D91    mov         dword ptr [ebx+28],eax
 004A4D94    call        TSharedImage.Reference
 004A4D99    cmp         dword ptr [edi+2C],0
>004A4D9D    je          004A4DE7
 004A4D9F    mov         eax,ebx
 004A4DA1    call        TJPEGImage.NewBitmap
 004A4DA6    mov         edx,dword ptr [edi+2C]
 004A4DA9    mov         eax,dword ptr [ebx+2C]
 004A4DAC    mov         ecx,dword ptr [eax]
 004A4DAE    call        dword ptr [ecx+8]
>004A4DB1    jmp         004A4DE7
 004A4DB3    mov         eax,esi
 004A4DB5    mov         edx,dword ptr ds:[424EB8];TBitmap
 004A4DBB    call        @IsClass
 004A4DC0    test        al,al
>004A4DC2    je          004A4DDE
 004A4DC4    mov         eax,ebx
 004A4DC6    call        TJPEGImage.NewImage
 004A4DCB    mov         eax,ebx
 004A4DCD    call        TJPEGImage.NewBitmap
 004A4DD2    mov         edx,esi
 004A4DD4    mov         eax,dword ptr [ebx+2C]
 004A4DD7    mov         ecx,dword ptr [eax]
 004A4DD9    call        dword ptr [ecx+8]
>004A4DDC    jmp         004A4DE7
 004A4DDE    mov         edx,esi
 004A4DE0    mov         eax,ebx
 004A4DE2    call        TPersistent.Assign
 004A4DE7    pop         edi
 004A4DE8    pop         esi
 004A4DE9    pop         ebx
 004A4DEA    ret
*}
end;

//004A4DEC
procedure TJPEGImage.AssignTo(Dest:TPersistent);
begin
{*
 004A4DEC    push        ebx
 004A4DED    push        esi
 004A4DEE    mov         esi,edx
 004A4DF0    mov         ebx,eax
 004A4DF2    mov         eax,esi
 004A4DF4    mov         edx,dword ptr ds:[424EB8];TBitmap
 004A4DFA    call        @IsClass
 004A4DFF    test        al,al
>004A4E01    je          004A4E16
 004A4E03    mov         eax,ebx
 004A4E05    call        TJPEGImage.GetBitmap
 004A4E0A    mov         edx,eax
 004A4E0C    mov         eax,esi
 004A4E0E    mov         ecx,dword ptr [eax]
 004A4E10    call        dword ptr [ecx+8]
 004A4E13    pop         esi
 004A4E14    pop         ebx
 004A4E15    ret
 004A4E16    mov         edx,esi
 004A4E18    mov         eax,ebx
 004A4E1A    call        TPersistent.AssignTo
 004A4E1F    pop         esi
 004A4E20    pop         ebx
 004A4E21    ret
*}
end;

//004A4E24
procedure ProgressCallback(const cinfo:jpeg_common_struct);
begin
{*
 004A4E24    push        ebx
 004A4E25    push        esi
 004A4E26    push        edi
 004A4E27    add         esp,0FFFFFFF0
 004A4E2A    mov         esi,eax
 004A4E2C    mov         eax,dword ptr [esi+8]
 004A4E2F    test        eax,eax
>004A4E31    je          004A4F0A
 004A4E37    cmp         dword ptr [eax+14],0
>004A4E3B    je          004A4F0A
 004A4E41    mov         ebx,eax
 004A4E43    call        KERNEL32.GetTickCount
 004A4E48    mov         edx,eax
 004A4E4A    mov         ecx,edx
 004A4E4C    mov         eax,dword ptr [ebx+20]
 004A4E4F    sub         ecx,eax
 004A4E51    cmp         ecx,1F4
>004A4E57    jl          004A4F0A
 004A4E5D    mov         dword ptr [ebx+20],edx
 004A4E60    test        eax,eax
>004A4E62    je          004A4F0A
 004A4E68    cmp         dword ptr [esi+10],0
>004A4E6C    je          004A4E9B
 004A4E6E    mov         edi,esi
 004A4E70    mov         eax,dword ptr [edi+8C]
 004A4E76    push        eax
 004A4E77    lea         eax,[esp+4]
 004A4E7B    push        eax
 004A4E7C    mov         ecx,dword ptr [edi+70]
 004A4E7F    mov         edx,dword ptr [ebx+24]
 004A4E82    xor         eax,eax
 004A4E84    call        Bounds
 004A4E89    mov         eax,dword ptr [esp+0C]
 004A4E8D    cmp         eax,dword ptr [ebx+24]
>004A4E90    jge         004A4EAD
 004A4E92    mov         eax,dword ptr [edi+74]
 004A4E95    mov         dword ptr [esp+0C],eax
>004A4E99    jmp         004A4EAD
 004A4E9B    push        0
 004A4E9D    lea         eax,[esp+4]
 004A4EA1    push        eax
 004A4EA2    xor         ecx,ecx
 004A4EA4    xor         edx,edx
 004A4EA6    xor         eax,eax
 004A4EA8    call        Bounds
 004A4EAD    fild        dword ptr [ebx+4]
 004A4EB0    fild        dword ptr [ebx+8]
 004A4EB3    fdivp       st(1),st
 004A4EB5    fild        dword ptr [ebx+0C]
 004A4EB8    faddp       st(1),st
 004A4EBA    fmul        dword ptr ds:[4A4F14]
 004A4EC0    fild        dword ptr [ebx+10]
 004A4EC3    fdivp       st(1),st
 004A4EC5    call        @TRUNC
 004A4ECA    cmp         eax,dword ptr [ebx+1C]
>004A4ECD    je          004A4F0A
 004A4ECF    mov         dword ptr [ebx+1C],eax
 004A4ED2    cmp         dword ptr [esi+10],0
>004A4ED6    je          004A4EE1
 004A4ED8    mov         edx,dword ptr [esi+8C]
 004A4EDE    mov         dword ptr [ebx+24],edx
 004A4EE1    push        eax
 004A4EE2    mov         eax,dword ptr [esp+10]
 004A4EE6    sub         eax,dword ptr [esp+8]
 004A4EEA    cmp         eax,4
 004A4EED    setge       al
 004A4EF0    push        eax
 004A4EF1    lea         eax,[esp+8]
 004A4EF5    push        eax
 004A4EF6    push        0
 004A4EF8    mov         cl,1
 004A4EFA    mov         esi,dword ptr [ebx+14]
 004A4EFD    mov         edx,esi
 004A4EFF    mov         eax,esi
 004A4F01    mov         si,0FFFD
 004A4F05    call        @CallDynaInst
 004A4F0A    add         esp,10
 004A4F0D    pop         edi
 004A4F0E    pop         esi
 004A4F0F    pop         ebx
 004A4F10    ret
*}
end;

//004A4F18
procedure ReleaseContext(var jc:TJPEGContext);
begin
{*
 004A4F18    push        ebx
 004A4F19    mov         ebx,eax
 004A4F1B    cmp         dword ptr [ebx+0B8],0
>004A4F22    je          004A4F37
 004A4F24    lea         eax,[ebx+0B8]
 004A4F2A    call        jpeg_destroy
 004A4F2F    xor         eax,eax
 004A4F31    mov         dword ptr [ebx+0B8],eax
 004A4F37    pop         ebx
 004A4F38    ret
*}
end;

//004A4F3C
procedure InitDecompressor(Obj:TJPEGImage; var jc:TJPEGContext);
begin
{*
 004A4F3C    push        ebp
 004A4F3D    mov         ebp,esp
 004A4F3F    push        ecx
 004A4F40    push        ebx
 004A4F41    push        esi
 004A4F42    push        edi
 004A4F43    mov         dword ptr [ebp-4],edx
 004A4F46    mov         ebx,eax
 004A4F48    mov         eax,dword ptr [ebp-4]
 004A4F4B    xor         ecx,ecx
 004A4F4D    mov         edx,288
 004A4F52    call        @FillChar
 004A4F57    mov         eax,dword ptr [ebp-4]
 004A4F5A    mov         edi,eax
 004A4F5C    mov         esi,5AD7C4
 004A4F61    mov         ecx,21
 004A4F66    rep movs    dword ptr [edi],dword ptr [esi]
 004A4F68    mov         eax,dword ptr [ebp-4]
 004A4F6B    mov         edx,dword ptr [ebp-4]
 004A4F6E    mov         dword ptr [edx+0B8],eax
 004A4F74    mov         eax,dword ptr [ebp-4]
 004A4F77    add         eax,0B8
 004A4F7C    mov         ecx,1D0
 004A4F81    mov         edx,3E
 004A4F86    call        jpeg_CreateDecompress
 004A4F8B    xor         eax,eax
 004A4F8D    push        ebp
 004A4F8E    push        4A512B
 004A4F93    push        dword ptr fs:[eax]
 004A4F96    mov         dword ptr fs:[eax],esp
 004A4F99    mov         eax,dword ptr [ebp-4]
 004A4F9C    mov         dword ptr [eax+84],4A4E24;ProgressCallback
 004A4FA6    mov         eax,dword ptr [ebp-4]
 004A4FA9    mov         dword ptr [eax+98],ebx
 004A4FAF    mov         eax,dword ptr [ebp-4]
 004A4FB2    add         eax,84
 004A4FB7    mov         edx,dword ptr [ebp-4]
 004A4FBA    mov         dword ptr [edx+0C0],eax
 004A4FC0    push        0
 004A4FC2    push        0
 004A4FC4    mov         eax,dword ptr [ebx+28]
 004A4FC7    mov         eax,dword ptr [eax+8]
 004A4FCA    call        TStream.SetPosition
 004A4FCF    mov         eax,dword ptr [ebx+28]
 004A4FD2    mov         edx,dword ptr [eax+8]
 004A4FD5    mov         eax,dword ptr [ebp-4]
 004A4FD8    add         eax,0B8
 004A4FDD    call        jpeg_stdio_src
 004A4FE2    mov         eax,dword ptr [ebp-4]
 004A4FE5    add         eax,0B8
 004A4FEA    or          edx,0FFFFFFFF
 004A4FED    call        jpeg_read_header
 004A4FF2    mov         eax,dword ptr [ebp-4]
 004A4FF5    mov         dword ptr [eax+0E8],1
 004A4FFF    mov         cl,byte ptr [ebx+43]
 004A5002    mov         eax,1
 004A5007    shl         eax,cl
 004A5009    mov         edx,dword ptr [ebp-4]
 004A500C    mov         dword ptr [edx+0EC],eax
 004A5012    cmp         byte ptr [ebx+3C],1
 004A5016    cmc
 004A5017    sbb         eax,eax
 004A5019    mov         edx,dword ptr [ebp-4]
 004A501C    mov         dword ptr [edx+108],eax
 004A5022    cmp         byte ptr [ebx+3D],0
>004A5026    je          004A5035
 004A5028    mov         eax,dword ptr [ebp-4]
 004A502B    mov         dword ptr [eax+0E4],1
 004A5035    cmp         byte ptr [ebx+3E],1
>004A5039    je          004A5047
 004A503B    mov         eax,dword ptr [ebp-4]
 004A503E    cmp         dword ptr [eax+0E4],1
>004A5045    jne         004A5061
 004A5047    mov         eax,dword ptr [ebp-4]
 004A504A    mov         dword ptr [eax+10C],0FFFFFFFF
 004A5054    mov         eax,dword ptr [ebp-4]
 004A5057    mov         dword ptr [eax+118],0EC
 004A5061    cmp         byte ptr [ebx+42],1
>004A5065    jne         004A508C
 004A5067    mov         eax,dword ptr [ebp-4]
 004A506A    mov         dword ptr [eax+100],1
 004A5074    mov         eax,dword ptr [ebp-4]
 004A5077    xor         edx,edx
 004A5079    mov         dword ptr [eax+114],edx
 004A507F    mov         eax,dword ptr [ebp-4]
 004A5082    mov         dword ptr [eax+110],1
 004A508C    mov         eax,dword ptr [ebp-4]
 004A508F    mov         eax,dword ptr [eax+100]
 004A5095    mov         edx,dword ptr [ebp-4]
 004A5098    mov         dword ptr [edx+0AC],eax
 004A509E    mov         eax,dword ptr [ebp-4]
 004A50A1    cmp         dword ptr [eax+114],1
 004A50A8    sbb         eax,eax
 004A50AA    inc         eax
 004A50AB    mov         edx,dword ptr [ebp-4]
 004A50AE    mov         byte ptr [edx+0B0],al
 004A50B4    mov         eax,dword ptr [ebp-4]
 004A50B7    mov         eax,dword ptr [eax+110]
 004A50BD    mov         edx,dword ptr [ebp-4]
 004A50C0    mov         dword ptr [edx+0B4],eax
 004A50C6    cmp         byte ptr [ebx+40],0
>004A50CA    je          004A5121
 004A50CC    mov         eax,dword ptr [ebp-4]
 004A50CF    add         eax,0B8
 004A50D4    call        jpeg_has_multiple_scans
 004A50D9    test        eax,eax
>004A50DB    je          004A5121
 004A50DD    mov         eax,dword ptr [ebp-4]
 004A50E0    mov         eax,dword ptr [eax+114]
 004A50E6    mov         edx,dword ptr [ebp-4]
 004A50E9    mov         dword ptr [edx+124],eax
 004A50EF    mov         eax,dword ptr [ebp-4]
 004A50F2    mov         dword ptr [eax+100],1
 004A50FC    mov         eax,dword ptr [ebp-4]
 004A50FF    xor         edx,edx
 004A5101    mov         dword ptr [eax+114],edx
 004A5107    mov         eax,dword ptr [ebp-4]
 004A510A    mov         dword ptr [eax+110],1
 004A5114    mov         eax,dword ptr [ebp-4]
 004A5117    mov         dword ptr [eax+0F8],0FFFFFFFF
 004A5121    xor         eax,eax
 004A5123    pop         edx
 004A5124    pop         ecx
 004A5125    pop         ecx
 004A5126    mov         dword ptr fs:[eax],edx
>004A5129    jmp         004A5142
>004A512B    jmp         @HandleAnyException
 004A5130    mov         eax,dword ptr [ebp-4]
 004A5133    call        ReleaseContext
 004A5138    call        @RaiseAgain
 004A513D    call        @DoneExcept
 004A5142    pop         edi
 004A5143    pop         esi
 004A5144    pop         ebx
 004A5145    pop         ecx
 004A5146    pop         ebp
 004A5147    ret
*}
end;

//004A5148
procedure TJPEGImage.CalcOutputDimensions;
begin
{*
 004A5148    push        ebp
 004A5149    mov         ebp,esp
 004A514B    add         esp,0FFFFFD78
 004A5151    push        ebx
 004A5152    mov         ebx,eax
 004A5154    cmp         byte ptr [ebx+44],0
>004A5158    je          004A51CE
 004A515A    lea         edx,[ebp-288]
 004A5160    mov         eax,ebx
 004A5162    call        InitDecompressor
 004A5167    xor         eax,eax
 004A5169    push        ebp
 004A516A    push        4A51C7
 004A516F    push        dword ptr fs:[eax]
 004A5172    mov         dword ptr fs:[eax],esp
 004A5175    xor         eax,eax
 004A5177    mov         dword ptr [ebp-1C8],eax
 004A517D    lea         eax,[ebp-1D0]
 004A5183    call        jpeg_calc_output_dimensions
 004A5188    mov         eax,dword ptr [ebp-160]
 004A518E    mov         dword ptr [ebx+30],eax
 004A5191    mov         eax,dword ptr [ebp-15C]
 004A5197    mov         dword ptr [ebx+34],eax
 004A519A    lea         eax,[ebp-1D0]
 004A51A0    call        jpeg_has_multiple_scans
 004A51A5    cmp         eax,1
 004A51A8    sbb         eax,eax
 004A51AA    inc         eax
 004A51AB    mov         byte ptr [ebx+41],al
 004A51AE    xor         eax,eax
 004A51B0    pop         edx
 004A51B1    pop         ecx
 004A51B2    pop         ecx
 004A51B3    mov         dword ptr fs:[eax],edx
 004A51B6    push        4A51CE
 004A51BB    lea         eax,[ebp-288]
 004A51C1    call        ReleaseContext
 004A51C6    ret
>004A51C7    jmp         @HandleFinally
>004A51CC    jmp         004A51BB
 004A51CE    pop         ebx
 004A51CF    mov         esp,ebp
 004A51D1    pop         ebp
 004A51D2    ret
*}
end;

//004A51D4
procedure TJPEGImage.Changed(Sender:TObject);
begin
{*
 004A51D4    call        TGraphic.Changed
 004A51D9    ret
*}
end;

//004A51DC
procedure TJPEGImage.Compress;
begin
{*
 004A51DC    push        ebp
 004A51DD    mov         ebp,esp
 004A51DF    add         esp,0FFFFFD58
 004A51E5    push        ebx
 004A51E6    push        esi
 004A51E7    push        edi
 004A51E8    mov         dword ptr [ebp-4],eax
 004A51EB    lea         eax,[ebp-298]
 004A51F1    xor         ecx,ecx
 004A51F3    mov         edx,288
 004A51F8    call        @FillChar
 004A51FD    mov         esi,5AD7C4
 004A5202    lea         edi,[ebp-298]
 004A5208    mov         ecx,21
 004A520D    rep movs    dword ptr [edi],dword ptr [esi]
 004A520F    lea         eax,[ebp-298]
 004A5215    mov         dword ptr [ebp-1E0],eax
 004A521B    lea         eax,[ebp-1E0]
 004A5221    mov         ecx,174
 004A5226    mov         edx,3E
 004A522B    call        jpeg_CreateCompress
 004A5230    xor         edx,edx
 004A5232    push        ebp
 004A5233    push        4A5548
 004A5238    push        dword ptr fs:[edx]
 004A523B    mov         dword ptr fs:[edx],esp
 004A523E    xor         edx,edx
 004A5240    push        ebp
 004A5241    push        4A5511
 004A5246    push        dword ptr fs:[edx]
 004A5249    mov         dword ptr fs:[edx],esp
 004A524C    mov         dword ptr [ebp-214],4A4E24;ProgressCallback
 004A5256    mov         eax,dword ptr [ebp-4]
 004A5259    mov         dword ptr [ebp-200],eax
 004A525F    lea         eax,[ebp-214]
 004A5265    mov         dword ptr [ebp-1D8],eax
 004A526B    mov         eax,dword ptr [ebp-4]
 004A526E    mov         eax,dword ptr [eax+28]
 004A5271    cmp         dword ptr [eax+8],0
>004A5275    je          004A527F
 004A5277    mov         eax,dword ptr [ebp-4]
 004A527A    call        TJPEGImage.NewImage
 004A527F    mov         dl,1
 004A5281    mov         eax,[00418640];TMemoryStream
 004A5286    call        TObject.Create
 004A528B    mov         ebx,eax
 004A528D    mov         eax,dword ptr [ebp-4]
 004A5290    mov         eax,dword ptr [eax+28]
 004A5293    mov         dword ptr [eax+8],ebx
 004A5296    push        0
 004A5298    push        0
 004A529A    mov         eax,ebx
 004A529C    call        TStream.SetPosition
 004A52A1    mov         eax,dword ptr [ebp-4]
 004A52A4    mov         eax,dword ptr [eax+28]
 004A52A7    mov         edx,dword ptr [eax+8]
 004A52AA    lea         eax,[ebp-1E0]
 004A52B0    call        jpeg_stdio_dest
 004A52B5    mov         eax,dword ptr [ebp-4]
 004A52B8    mov         ebx,dword ptr [eax+2C]
 004A52BB    test        ebx,ebx
>004A52BD    je          004A52D9
 004A52BF    mov         eax,ebx
 004A52C1    mov         edx,dword ptr [eax]
 004A52C3    call        dword ptr [edx+2C]
 004A52C6    test        eax,eax
>004A52C8    je          004A52D9
 004A52CA    mov         eax,dword ptr [ebp-4]
 004A52CD    mov         eax,dword ptr [eax+2C]
 004A52D0    mov         edx,dword ptr [eax]
 004A52D2    call        dword ptr [edx+20]
 004A52D5    test        eax,eax
>004A52D7    jne         004A52EB
 004A52D9    xor         eax,eax
 004A52DB    pop         edx
 004A52DC    pop         ecx
 004A52DD    pop         ecx
 004A52DE    mov         dword ptr fs:[eax],edx
 004A52E1    call        @TryFinallyExit
>004A52E6    jmp         004A554F
 004A52EB    mov         eax,dword ptr [ebp-4]
 004A52EE    mov         eax,dword ptr [eax+2C]
 004A52F1    mov         edx,dword ptr [eax]
 004A52F3    call        dword ptr [edx+2C]
 004A52F6    mov         dword ptr [ebp-1C4],eax
 004A52FC    mov         eax,dword ptr [ebp-4]
 004A52FF    mov         eax,dword ptr [eax+2C]
 004A5302    mov         edx,dword ptr [eax]
 004A5304    call        dword ptr [edx+2C]
 004A5307    mov         edx,dword ptr [ebp-4]
 004A530A    mov         edx,dword ptr [edx+28]
 004A530D    mov         dword ptr [edx+10],eax
 004A5310    mov         eax,dword ptr [ebp-4]
 004A5313    mov         eax,dword ptr [eax+2C]
 004A5316    mov         edx,dword ptr [eax]
 004A5318    call        dword ptr [edx+20]
 004A531B    mov         dword ptr [ebp-1C0],eax
 004A5321    mov         eax,dword ptr [ebp-4]
 004A5324    mov         eax,dword ptr [eax+2C]
 004A5327    mov         edx,dword ptr [eax]
 004A5329    call        dword ptr [edx+20]
 004A532C    mov         edx,dword ptr [ebp-4]
 004A532F    mov         edx,dword ptr [edx+28]
 004A5332    mov         dword ptr [edx+0C],eax
 004A5335    mov         dword ptr [ebp-1BC],3
 004A533F    mov         dword ptr [ebp-1B8],2
 004A5349    mov         dl,1
 004A534B    mov         eax,[00424EB8];TBitmap
 004A5350    call        TBitmap.Create
 004A5355    mov         dword ptr [ebp-10],eax
 004A5358    xor         edx,edx
 004A535A    push        ebp
 004A535B    push        4A5500
 004A5360    push        dword ptr fs:[edx]
 004A5363    mov         dword ptr fs:[edx],esp
 004A5366    mov         eax,dword ptr [ebp-4]
 004A5369    mov         edx,dword ptr [eax+2C]
 004A536C    mov         eax,dword ptr [ebp-10]
 004A536F    mov         ecx,dword ptr [eax]
 004A5371    call        dword ptr [ecx+8]
 004A5374    mov         dl,6
 004A5376    mov         eax,dword ptr [ebp-10]
 004A5379    call        TBitmap.SetPixelFormat
 004A537E    lea         eax,[ebp-1E0]
 004A5384    call        jpeg_set_defaults
 004A5389    mov         eax,dword ptr [ebp-4]
 004A538C    xor         edx,edx
 004A538E    mov         dl,byte ptr [eax+3F]
 004A5391    lea         eax,[ebp-1E0]
 004A5397    or          ecx,0FFFFFFFF
 004A539A    call        jpeg_set_quality
 004A539F    mov         eax,dword ptr [ebp-4]
 004A53A2    cmp         byte ptr [eax+3D],0
>004A53A6    je          004A53C2
 004A53A8    mov         eax,dword ptr [ebp-4]
 004A53AB    mov         eax,dword ptr [eax+28]
 004A53AE    mov         byte ptr [eax+14],1
 004A53B2    lea         eax,[ebp-1E0]
 004A53B8    mov         edx,1
 004A53BD    call        jpeg_set_colorspace
 004A53C2    mov         eax,dword ptr [ebp-4]
 004A53C5    cmp         byte ptr [eax+41],0
>004A53C9    je          004A53D6
 004A53CB    lea         eax,[ebp-1E0]
 004A53D1    call        jpeg_simple_progression
 004A53D6    xor         edx,edx
 004A53D8    mov         eax,dword ptr [ebp-10]
 004A53DB    call        TBitmap.GetScanline
 004A53E0    mov         dword ptr [ebp-0C],eax
 004A53E3    mov         edx,1
 004A53E8    mov         eax,dword ptr [ebp-10]
 004A53EB    call        TBitmap.GetScanline
 004A53F0    mov         ebx,eax
 004A53F2    sub         ebx,dword ptr [ebp-0C]
 004A53F5    test        ebx,ebx
>004A53F7    jle         004A5409
 004A53F9    test        bl,3
>004A53FC    jne         004A5409
 004A53FE    mov         eax,dword ptr [ebp-1C0]
 004A5404    mov         dword ptr [ebp-8],eax
>004A5407    jmp         004A5410
 004A5409    mov         dword ptr [ebp-8],1
 004A5410    push        0
 004A5412    push        0
 004A5414    push        0
 004A5416    lea         eax,[ebp-2A8]
 004A541C    push        eax
 004A541D    xor         ecx,ecx
 004A541F    xor         edx,edx
 004A5421    xor         eax,eax
 004A5423    call        Bounds
 004A5428    lea         eax,[ebp-2A8]
 004A542E    push        eax
 004A542F    push        0
 004A5431    xor         ecx,ecx
 004A5433    mov         edx,dword ptr [ebp-4]
 004A5436    mov         eax,dword ptr [ebp-4]
 004A5439    mov         si,0FFFD
 004A543D    call        @CallDynaInst
 004A5442    xor         edx,edx
 004A5444    push        ebp
 004A5445    push        4A54E3
 004A544A    push        dword ptr fs:[edx]
 004A544D    mov         dword ptr fs:[edx],esp
 004A5450    lea         eax,[ebp-1E0]
 004A5456    or          edx,0FFFFFFFF
 004A5459    call        jpeg_start_compress
>004A545E    jmp         004A5479
 004A5460    lea         edx,[ebp-0C]
 004A5463    lea         eax,[ebp-1E0]
 004A5469    mov         ecx,dword ptr [ebp-8]
 004A546C    call        jpeg_write_scanlines
 004A5471    mov         edx,ebx
 004A5473    imul        edx,eax
 004A5476    add         dword ptr [ebp-0C],edx
 004A5479    mov         eax,dword ptr [ebp-104]
 004A547F    cmp         eax,dword ptr [ebp-1C0]
>004A5485    jb          004A5460
 004A5487    lea         eax,[ebp-1E0]
 004A548D    call        jpeg_finish_compress
 004A5492    xor         eax,eax
 004A5494    pop         edx
 004A5495    pop         ecx
 004A5496    pop         ecx
 004A5497    mov         dword ptr fs:[eax],edx
 004A549A    push        4A54EA
 004A549F    call        ExceptObject
 004A54A4    test        eax,eax
>004A54A6    jne         004A54AF
 004A54A8    mov         ebx,64
>004A54AD    jmp         004A54B1
 004A54AF    xor         ebx,ebx
 004A54B1    push        ebx
 004A54B2    push        0
 004A54B4    push        0
 004A54B6    lea         eax,[ebp-2A8]
 004A54BC    push        eax
 004A54BD    xor         ecx,ecx
 004A54BF    xor         edx,edx
 004A54C1    xor         eax,eax
 004A54C3    call        Bounds
 004A54C8    lea         eax,[ebp-2A8]
 004A54CE    push        eax
 004A54CF    push        0
 004A54D1    mov         cl,2
 004A54D3    mov         edx,dword ptr [ebp-4]
 004A54D6    mov         eax,dword ptr [ebp-4]
 004A54D9    mov         si,0FFFD
 004A54DD    call        @CallDynaInst
 004A54E2    ret
>004A54E3    jmp         @HandleFinally
>004A54E8    jmp         004A549F
 004A54EA    xor         eax,eax
 004A54EC    pop         edx
 004A54ED    pop         ecx
 004A54EE    pop         ecx
 004A54EF    mov         dword ptr fs:[eax],edx
 004A54F2    push        4A5507
 004A54F7    mov         eax,dword ptr [ebp-10]
 004A54FA    call        TObject.Free
 004A54FF    ret
>004A5500    jmp         @HandleFinally
>004A5505    jmp         004A54F7
 004A5507    xor         eax,eax
 004A5509    pop         edx
 004A550A    pop         ecx
 004A550B    pop         ecx
 004A550C    mov         dword ptr fs:[eax],edx
>004A550F    jmp         004A552F
>004A5511    jmp         @HandleOnException
 004A5516    dd          1
 004A551A    dd          00408B98;EAbort
 004A551E    dd          004A5522
 004A5522    mov         eax,dword ptr [ebp-4]
 004A5525    call        TJPEGImage.NewImage
 004A552A    call        @DoneExcept
 004A552F    xor         eax,eax
 004A5531    pop         edx
 004A5532    pop         ecx
 004A5533    pop         ecx
 004A5534    mov         dword ptr fs:[eax],edx
 004A5537    push        4A554F
 004A553C    lea         eax,[ebp-298]
 004A5542    call        ReleaseContext
 004A5547    ret
>004A5548    jmp         @HandleFinally
>004A554D    jmp         004A553C
 004A554F    pop         edi
 004A5550    pop         esi
 004A5551    pop         ebx
 004A5552    mov         esp,ebp
 004A5554    pop         ebp
 004A5555    ret
*}
end;

//004A5558
procedure TJPEGImage.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 004A5558    push        ebx
 004A5559    push        esi
 004A555A    push        edi
 004A555B    mov         edi,ecx
 004A555D    mov         esi,edx
 004A555F    mov         ebx,eax
 004A5561    mov         eax,ebx
 004A5563    call        TJPEGImage.GetBitmap
 004A5568    mov         ecx,eax
 004A556A    mov         edx,edi
 004A556C    mov         eax,esi
 004A556E    call        TCanvas.StretchDraw
 004A5573    pop         edi
 004A5574    pop         esi
 004A5575    pop         ebx
 004A5576    ret
*}
end;

//004A5578
function TJPEGImage.Equals(Graphic:TGraphic):Boolean;
begin
{*
 004A5578    push        ebx
 004A5579    push        esi
 004A557A    push        edi
 004A557B    mov         esi,edx
 004A557D    mov         edi,eax
 004A557F    xor         ebx,ebx
 004A5581    mov         eax,esi
 004A5583    mov         edx,dword ptr ds:[4A4A00];TJPEGImage
 004A5589    call        @IsClass
 004A558E    test        al,al
>004A5590    je          004A55B7
 004A5592    mov         eax,dword ptr [edi+28]
 004A5595    cmp         dword ptr [eax+8],0
>004A5599    je          004A55B1
 004A559B    mov         edx,dword ptr [esi+28]
 004A559E    cmp         dword ptr [edx+8],0
>004A55A2    je          004A55B1
 004A55A4    mov         edx,esi
 004A55A6    mov         eax,edi
 004A55A8    call        TGraphic.Equals
 004A55AD    mov         ebx,eax
>004A55AF    jmp         004A55B7
 004A55B1    cmp         eax,dword ptr [esi+28]
 004A55B4    sete        bl
 004A55B7    mov         eax,ebx
 004A55B9    pop         edi
 004A55BA    pop         esi
 004A55BB    pop         ebx
 004A55BC    ret
*}
end;

//004A55C0
procedure TJPEGImage.FreeBitmap;
begin
{*
 004A55C0    push        ebx
 004A55C1    mov         ebx,eax
 004A55C3    mov         eax,dword ptr [ebx+2C]
 004A55C6    call        TObject.Free
 004A55CB    xor         eax,eax
 004A55CD    mov         dword ptr [ebx+2C],eax
 004A55D0    pop         ebx
 004A55D1    ret
*}
end;

//004A55D4
function BuildPalette(const cinfo:jpeg_decompress_struct):HPALETTE;
begin
{*
 004A55D4    push        esi
 004A55D5    push        edi
 004A55D6    add         esp,0FFFFFBFC
 004A55DC    mov         edi,eax
 004A55DE    mov         word ptr [esp],300
 004A55E4    mov         dx,word ptr [edi+84]
 004A55EB    mov         word ptr [esp+2],dx
 004A55F0    cmp         dword ptr [edi+2C],1
>004A55F4    jne         004A5625
 004A55F6    movzx       esi,dx
 004A55F9    dec         esi
 004A55FA    test        esi,esi
>004A55FC    jl          004A566A
 004A55FE    inc         esi
 004A55FF    xor         ecx,ecx
 004A5601    lea         edx,[esp+4]
 004A5605    mov         eax,dword ptr [edi+88]
 004A560B    mov         eax,dword ptr [eax]
 004A560D    mov         al,byte ptr [eax+ecx]
 004A5610    mov         byte ptr [edx],al
 004A5612    mov         byte ptr [edx+1],al
 004A5615    mov         byte ptr [edx+2],al
 004A5618    mov         byte ptr [edx+3],0
 004A561C    inc         ecx
 004A561D    add         edx,4
 004A5620    dec         esi
>004A5621    jne         004A5605
>004A5623    jmp         004A566A
 004A5625    movzx       esi,dx
 004A5628    dec         esi
 004A5629    test        esi,esi
>004A562B    jl          004A566A
 004A562D    inc         esi
 004A562E    xor         ecx,ecx
 004A5630    lea         edx,[esp+4]
 004A5634    mov         eax,dword ptr [edi+88]
 004A563A    mov         eax,dword ptr [eax+8]
 004A563D    mov         al,byte ptr [eax+ecx]
 004A5640    mov         byte ptr [edx],al
 004A5642    mov         eax,dword ptr [edi+88]
 004A5648    mov         eax,dword ptr [eax+4]
 004A564B    mov         al,byte ptr [eax+ecx]
 004A564E    mov         byte ptr [edx+1],al
 004A5651    mov         eax,dword ptr [edi+88]
 004A5657    mov         eax,dword ptr [eax]
 004A5659    mov         al,byte ptr [eax+ecx]
 004A565C    mov         byte ptr [edx+2],al
 004A565F    mov         byte ptr [edx+3],0
 004A5663    inc         ecx
 004A5664    add         edx,4
 004A5667    dec         esi
>004A5668    jne         004A5634
 004A566A    mov         eax,esp
 004A566C    push        eax
 004A566D    call        gdi32.CreatePalette
 004A5672    add         esp,404
 004A5678    pop         edi
 004A5679    pop         esi
 004A567A    ret
*}
end;

//004A567C
procedure BuildColorMap(var cinfo:jpeg_decompress_struct; P:HPALETTE);
begin
{*
 004A567C    push        ebx
 004A567D    push        esi
 004A567E    push        edi
 004A567F    push        ebp
 004A5680    add         esp,0FFFFFBFC
 004A5686    mov         ebx,eax
 004A5688    lea         eax,[esp+4]
 004A568C    push        eax
 004A568D    push        100
 004A5692    push        0
 004A5694    push        edx
 004A5695    call        gdi32.GetPaletteEntries
 004A569A    mov         esi,eax
 004A569C    test        esi,esi
>004A569E    je          004A56F9
 004A56A0    push        3
 004A56A2    mov         edi,dword ptr [ebx+4]
 004A56A5    mov         eax,ebx
 004A56A7    mov         ecx,esi
 004A56A9    mov         edx,1
 004A56AE    call        dword ptr [edi+8]
 004A56B1    mov         dword ptr [ebx+88],eax
 004A56B7    mov         dword ptr [ebx+84],esi
 004A56BD    mov         edi,esi
 004A56BF    dec         edi
 004A56C0    test        edi,edi
>004A56C2    jl          004A56F9
 004A56C4    inc         edi
 004A56C5    xor         edx,edx
 004A56C7    lea         eax,[esp+4]
 004A56CB    mov         esi,dword ptr [ebx+88]
 004A56D1    mov         ecx,dword ptr [esi+8]
 004A56D4    lea         ebp,[ecx+edx]
 004A56D7    mov         cl,byte ptr [eax]
 004A56D9    mov         byte ptr [ebp],cl
 004A56DC    mov         ecx,dword ptr [esi+4]
 004A56DF    lea         ebp,[ecx+edx]
 004A56E2    mov         cl,byte ptr [eax+1]
 004A56E5    mov         byte ptr [ebp],cl
 004A56E8    mov         ecx,dword ptr [esi]
 004A56EA    lea         esi,[ecx+edx]
 004A56ED    mov         cl,byte ptr [eax+2]
 004A56F0    mov         byte ptr [esi],cl
 004A56F2    inc         edx
 004A56F3    add         eax,4
 004A56F6    dec         edi
>004A56F7    jne         004A56CB
 004A56F9    add         esp,404
 004A56FF    pop         ebp
 004A5700    pop         edi
 004A5701    pop         esi
 004A5702    pop         ebx
 004A5703    ret
*}
end;

//004A5704
function TJPEGImage.GetBitmap:TBitmap;
begin
{*
 004A5704    push        ebp
 004A5705    mov         ebp,esp
 004A5707    add         esp,0FFFFFD58
 004A570D    push        ebx
 004A570E    push        esi
 004A570F    push        edi
 004A5710    mov         dword ptr [ebp-4],eax
 004A5713    mov         eax,dword ptr [ebp-4]
 004A5716    mov         eax,dword ptr [eax+2C]
 004A5719    mov         dword ptr [ebp-8],eax
 004A571C    cmp         dword ptr [ebp-8],0
>004A5720    jne         004A5B05
 004A5726    test        eax,eax
>004A5728    jne         004A573C
 004A572A    mov         dl,1
 004A572C    mov         eax,[00424EB8];TBitmap
 004A5731    call        TBitmap.Create
 004A5736    mov         edx,dword ptr [ebp-4]
 004A5739    mov         dword ptr [edx+2C],eax
 004A573C    mov         eax,dword ptr [ebp-4]
 004A573F    mov         eax,dword ptr [eax+2C]
 004A5742    mov         dword ptr [ebp-8],eax
 004A5745    mov         byte ptr [ebp-0D],1
 004A5749    lea         edx,[ebp-298]
 004A574F    mov         eax,dword ptr [ebp-4]
 004A5752    call        InitDecompressor
 004A5757    xor         edx,edx
 004A5759    push        ebp
 004A575A    push        4A5AFE
 004A575F    push        dword ptr fs:[edx]
 004A5762    mov         dword ptr fs:[edx],esp
 004A5765    xor         edx,edx
 004A5767    push        ebp
 004A5768    push        4A5ACF
 004A576D    push        dword ptr fs:[edx]
 004A5770    mov         dword ptr fs:[edx],esp
 004A5773    mov         eax,dword ptr [ebp-4]
 004A5776    mov         eax,dword ptr [eax+2C]
 004A5779    xor         edx,edx
 004A577B    call        TBitmap.SetHandle
 004A5780    mov         eax,dword ptr [ebp-4]
 004A5783    cmp         byte ptr [eax+3E],1
>004A5787    je          004A5792
 004A5789    cmp         dword ptr [ebp-1B4],1
>004A5790    jne         004A57A1
 004A5792    mov         eax,dword ptr [ebp-4]
 004A5795    mov         eax,dword ptr [eax+2C]
 004A5798    mov         dl,3
 004A579A    call        TBitmap.SetPixelFormat
>004A579F    jmp         004A57AE
 004A57A1    mov         eax,dword ptr [ebp-4]
 004A57A4    mov         eax,dword ptr [eax+2C]
 004A57A7    mov         dl,6
 004A57A9    call        TBitmap.SetPixelFormat
 004A57AE    push        0
 004A57B0    push        0
 004A57B2    push        0
 004A57B4    lea         eax,[ebp-2A8]
 004A57BA    push        eax
 004A57BB    xor         ecx,ecx
 004A57BD    xor         edx,edx
 004A57BF    xor         eax,eax
 004A57C1    call        Bounds
 004A57C6    lea         eax,[ebp-2A8]
 004A57CC    push        eax
 004A57CD    push        0
 004A57CF    xor         ecx,ecx
 004A57D1    mov         edx,dword ptr [ebp-4]
 004A57D4    mov         eax,dword ptr [ebp-4]
 004A57D7    mov         si,0FFFD
 004A57DB    call        @CallDynaInst
 004A57E0    xor         edx,edx
 004A57E2    push        ebp
 004A57E3    push        4A5ABE
 004A57E8    push        dword ptr fs:[edx]
 004A57EB    mov         dword ptr fs:[edx],esp
 004A57EE    mov         eax,dword ptr [ebp-4]
 004A57F1    mov         eax,dword ptr [eax+38]
 004A57F4    test        eax,eax
>004A57F6    je          004A583A
 004A57F8    mov         edx,dword ptr [ebp-4]
 004A57FB    cmp         byte ptr [edx+3E],1
>004A57FF    jne         004A582C
 004A5801    mov         edx,eax
 004A5803    lea         eax,[ebp-1E0]
 004A5809    call        BuildColorMap
 004A580E    mov         eax,dword ptr [ebp-4]
 004A5811    mov         eax,dword ptr [eax+38]
 004A5814    call        CopyPalette
 004A5819    mov         edx,eax
 004A581B    mov         eax,dword ptr [ebp-4]
 004A581E    mov         eax,dword ptr [eax+2C]
 004A5821    mov         ecx,dword ptr [eax]
 004A5823    call        dword ptr [ecx+38]
 004A5826    mov         byte ptr [ebp-0D],0
>004A582A    jmp         004A583A
 004A582C    push        eax
 004A582D    call        gdi32.DeleteObject
 004A5832    mov         eax,dword ptr [ebp-4]
 004A5835    xor         edx,edx
 004A5837    mov         dword ptr [eax+38],edx
 004A583A    lea         eax,[ebp-1E0]
 004A5840    call        jpeg_start_decompress
 004A5845    mov         eax,dword ptr [ebp-4]
 004A5848    mov         ebx,dword ptr [eax+2C]
 004A584B    xor         edx,edx
 004A584D    mov         eax,ebx
 004A584F    call        TBitmap.SetHandle
 004A5854    mov         edx,dword ptr [ebp-170]
 004A585A    mov         eax,ebx
 004A585C    mov         ecx,dword ptr [eax]
 004A585E    call        dword ptr [ecx+40]
 004A5861    mov         edx,dword ptr [ebp-16C]
 004A5867    mov         eax,ebx
 004A5869    mov         ecx,dword ptr [eax]
 004A586B    call        dword ptr [ecx+34]
 004A586E    xor         edx,edx
 004A5870    mov         eax,ebx
 004A5872    call        TBitmap.GetScanline
 004A5877    mov         dword ptr [ebp-0C],eax
 004A587A    mov         edx,1
 004A587F    mov         eax,ebx
 004A5881    call        TBitmap.GetScanline
 004A5886    mov         esi,eax
 004A5888    sub         esi,dword ptr [ebp-0C]
 004A588B    test        esi,esi
>004A588D    jle         004A589F
 004A588F    test        esi,3
>004A5895    jne         004A589F
 004A5897    mov         ebx,dword ptr [ebp-160]
>004A589D    jmp         004A58A4
 004A589F    mov         ebx,1
 004A58A4    cmp         dword ptr [ebp-1A0],0
>004A58AB    je          004A59BB
>004A58B1    jmp         004A5953
 004A58B6    lea         eax,[ebp-1E0]
 004A58BC    mov         edx,dword ptr [ebp-150]
 004A58C2    call        jpeg_start_output
 004A58C7    mov         eax,dword ptr [ebp-1D8]
 004A58CD    cmp         dword ptr [eax+0C],0
>004A58D1    jne         004A5910
 004A58D3    cmp         dword ptr [ebp-158],0
>004A58DA    je          004A5910
 004A58DC    mov         eax,dword ptr [ebp-4]
 004A58DF    mov         eax,dword ptr [eax+2C]
 004A58E2    call        TBitmap.GetPixelFormat
 004A58E7    cmp         al,3
>004A58E9    jne         004A5910
 004A58EB    cmp         byte ptr [ebp-0D],0
>004A58EF    je          004A5910
 004A58F1    lea         eax,[ebp-1E0]
 004A58F7    call        BuildPalette
 004A58FC    mov         edx,eax
 004A58FE    mov         eax,dword ptr [ebp-4]
 004A5901    mov         eax,dword ptr [eax+2C]
 004A5904    mov         ecx,dword ptr [eax]
 004A5906    call        dword ptr [ecx+38]
 004A5909    mov         eax,dword ptr [ebp-4]
 004A590C    mov         byte ptr [eax+22],1
 004A5910    mov         eax,dword ptr [ebp-4]
 004A5913    mov         eax,dword ptr [eax+2C]
 004A5916    xor         edx,edx
 004A5918    call        TBitmap.GetScanline
 004A591D    mov         dword ptr [ebp-0C],eax
>004A5920    jmp         004A593A
 004A5922    lea         edx,[ebp-0C]
 004A5925    lea         eax,[ebp-1E0]
 004A592B    mov         ecx,ebx
 004A592D    call        jpeg_read_scanlines
 004A5932    mov         edx,esi
 004A5934    imul        edx,eax
 004A5937    add         dword ptr [ebp-0C],edx
 004A593A    mov         eax,dword ptr [ebp-154]
 004A5940    cmp         eax,dword ptr [ebp-16C]
>004A5946    jb          004A5922
 004A5948    lea         eax,[ebp-1E0]
 004A594E    call        jpeg_finish_output
 004A5953    lea         eax,[ebp-1E0]
 004A5959    call        jpeg_consume_input
 004A595E    cmp         eax,2
>004A5961    jne         004A58B6
 004A5967    mov         eax,dword ptr [ebp-1EC]
 004A596D    mov         dword ptr [ebp-198],eax
 004A5973    mov         eax,dword ptr [ebp-1E4]
 004A5979    mov         dword ptr [ebp-188],eax
 004A597F    cmp         byte ptr [ebp-1E8],0
>004A5986    je          004A599A
 004A5988    mov         dword ptr [ebp-184],0FFFFFFFF
 004A5992    xor         eax,eax
 004A5994    mov         dword ptr [ebp-158],eax
 004A599A    lea         eax,[ebp-1E0]
 004A59A0    mov         edx,dword ptr [ebp-150]
 004A59A6    call        jpeg_start_output
 004A59AB    mov         eax,dword ptr [ebp-4]
 004A59AE    mov         eax,dword ptr [eax+2C]
 004A59B1    xor         edx,edx
 004A59B3    call        TBitmap.GetScanline
 004A59B8    mov         dword ptr [ebp-0C],eax
 004A59BB    cmp         dword ptr [ebp-1A0],0
>004A59C2    je          004A59CD
 004A59C4    cmp         byte ptr [ebp-1E8],0
>004A59CB    je          004A5A25
 004A59CD    cmp         dword ptr [ebp-158],0
>004A59D4    je          004A5A25
 004A59D6    cmp         byte ptr [ebp-0D],0
>004A59DA    je          004A5A25
 004A59DC    lea         eax,[ebp-1E0]
 004A59E2    call        BuildPalette
 004A59E7    mov         edx,eax
 004A59E9    mov         eax,dword ptr [ebp-4]
 004A59EC    mov         eax,dword ptr [eax+2C]
 004A59EF    mov         ecx,dword ptr [eax]
 004A59F1    call        dword ptr [ecx+38]
 004A59F4    mov         eax,dword ptr [ebp-4]
 004A59F7    mov         byte ptr [eax+22],1
 004A59FB    mov         eax,dword ptr [ebp-4]
 004A59FE    mov         eax,dword ptr [eax+2C]
 004A5A01    xor         edx,edx
 004A5A03    call        TBitmap.GetScanline
 004A5A08    mov         dword ptr [ebp-0C],eax
>004A5A0B    jmp         004A5A25
 004A5A0D    lea         edx,[ebp-0C]
 004A5A10    lea         eax,[ebp-1E0]
 004A5A16    mov         ecx,ebx
 004A5A18    call        jpeg_read_scanlines
 004A5A1D    mov         edx,esi
 004A5A1F    imul        edx,eax
 004A5A22    add         dword ptr [ebp-0C],edx
 004A5A25    mov         eax,dword ptr [ebp-154]
 004A5A2B    cmp         eax,dword ptr [ebp-16C]
>004A5A31    jb          004A5A0D
 004A5A33    cmp         dword ptr [ebp-1A0],0
>004A5A3A    je          004A5A47
 004A5A3C    lea         eax,[ebp-1E0]
 004A5A42    call        jpeg_finish_output
 004A5A47    lea         eax,[ebp-1E0]
 004A5A4D    call        jpeg_finish_decompress
 004A5A52    xor         eax,eax
 004A5A54    pop         edx
 004A5A55    pop         ecx
 004A5A56    pop         ecx
 004A5A57    mov         dword ptr fs:[eax],edx
 004A5A5A    push        4A5AC5
 004A5A5F    call        ExceptObject
 004A5A64    test        eax,eax
>004A5A66    jne         004A5A6F
 004A5A68    mov         esi,64
>004A5A6D    jmp         004A5A71
 004A5A6F    xor         esi,esi
 004A5A71    mov         eax,esi
 004A5A73    push        eax
 004A5A74    mov         eax,dword ptr [ebp-4]
 004A5A77    mov         al,byte ptr [eax+22]
 004A5A7A    push        eax
 004A5A7B    push        0
 004A5A7D    lea         eax,[ebp-2A8]
 004A5A83    push        eax
 004A5A84    xor         ecx,ecx
 004A5A86    xor         edx,edx
 004A5A88    xor         eax,eax
 004A5A8A    call        Bounds
 004A5A8F    lea         eax,[ebp-2A8]
 004A5A95    push        eax
 004A5A96    push        0
 004A5A98    mov         cl,2
 004A5A9A    mov         edx,dword ptr [ebp-4]
 004A5A9D    mov         eax,dword ptr [ebp-4]
 004A5AA0    mov         si,0FFFD
 004A5AA4    call        @CallDynaInst
 004A5AA9    mov         eax,dword ptr [ebp-4]
 004A5AAC    cmp         byte ptr [eax+22],0
>004A5AB0    je          004A5ABD
 004A5AB2    mov         edx,dword ptr [ebp-4]
 004A5AB5    mov         eax,dword ptr [ebp-4]
 004A5AB8    mov         ecx,dword ptr [eax]
 004A5ABA    call        dword ptr [ecx+10]
 004A5ABD    ret
>004A5ABE    jmp         @HandleFinally
>004A5AC3    jmp         004A5A5F
 004A5AC5    xor         eax,eax
 004A5AC7    pop         edx
 004A5AC8    pop         ecx
 004A5AC9    pop         ecx
 004A5ACA    mov         dword ptr fs:[eax],edx
>004A5ACD    jmp         004A5AE5
>004A5ACF    jmp         @HandleOnException
 004A5AD4    dd          1
 004A5AD8    dd          00408B98;EAbort
 004A5ADC    dd          004A5AE0
 004A5AE0    call        @DoneExcept
 004A5AE5    xor         eax,eax
 004A5AE7    pop         edx
 004A5AE8    pop         ecx
 004A5AE9    pop         ecx
 004A5AEA    mov         dword ptr fs:[eax],edx
 004A5AED    push        4A5B05
 004A5AF2    lea         eax,[ebp-298]
 004A5AF8    call        ReleaseContext
 004A5AFD    ret
>004A5AFE    jmp         @HandleFinally
>004A5B03    jmp         004A5AF2
 004A5B05    mov         eax,dword ptr [ebp-8]
 004A5B08    pop         edi
 004A5B09    pop         esi
 004A5B0A    pop         ebx
 004A5B0B    mov         esp,ebp
 004A5B0D    pop         ebp
 004A5B0E    ret
*}
end;

//004A5B10
function TJPEGImage.GetEmpty:Boolean;
begin
{*
 004A5B10    push        ebx
 004A5B11    push        esi
 004A5B12    mov         ebx,eax
 004A5B14    mov         eax,dword ptr [ebx+28]
 004A5B17    cmp         dword ptr [eax+8],0
>004A5B1B    jne         004A5B2F
 004A5B1D    mov         esi,dword ptr [ebx+2C]
 004A5B20    test        esi,esi
>004A5B22    je          004A5B34
 004A5B24    mov         eax,esi
 004A5B26    mov         edx,dword ptr [eax]
 004A5B28    call        dword ptr [edx+1C]
 004A5B2B    test        al,al
>004A5B2D    jne         004A5B34
 004A5B2F    xor         eax,eax
 004A5B31    pop         esi
 004A5B32    pop         ebx
 004A5B33    ret
 004A5B34    mov         al,1
 004A5B36    pop         esi
 004A5B37    pop         ebx
 004A5B38    ret
*}
end;

//004A5B3C
function TJPEGImage.GetPalette:HPALETTE;
begin
{*
 004A5B3C    push        ebx
 004A5B3D    push        esi
 004A5B3E    push        edi
 004A5B3F    push        ebp
 004A5B40    mov         ebx,eax
 004A5B42    xor         esi,esi
 004A5B44    mov         eax,dword ptr [ebx+2C]
 004A5B47    test        eax,eax
>004A5B49    je          004A5B54
 004A5B4B    mov         edx,dword ptr [eax]
 004A5B4D    call        dword ptr [edx+24]
 004A5B50    mov         esi,eax
>004A5B52    jmp         004A5B9B
 004A5B54    mov         eax,dword ptr [ebx+38]
 004A5B57    test        eax,eax
>004A5B59    je          004A5B5F
 004A5B5B    mov         esi,eax
>004A5B5D    jmp         004A5B9B
 004A5B5F    cmp         byte ptr [ebx+3E],0
>004A5B63    jne         004A5B9B
 004A5B65    push        0
 004A5B67    call        user32.GetDC
 004A5B6C    mov         edi,eax
 004A5B6E    push        0C
 004A5B70    push        edi
 004A5B71    call        gdi32.GetDeviceCaps
 004A5B76    mov         ebp,eax
 004A5B78    push        0E
 004A5B7A    push        edi
 004A5B7B    call        gdi32.GetDeviceCaps
 004A5B80    imul        ebp,eax
 004A5B83    cmp         ebp,8
>004A5B86    jg          004A5B93
 004A5B88    push        edi
 004A5B89    call        gdi32.CreateHalftonePalette
 004A5B8E    mov         esi,eax
 004A5B90    mov         dword ptr [ebx+38],esi
 004A5B93    push        edi
 004A5B94    push        0
 004A5B96    call        user32.ReleaseDC
 004A5B9B    mov         eax,esi
 004A5B9D    pop         ebp
 004A5B9E    pop         edi
 004A5B9F    pop         esi
 004A5BA0    pop         ebx
 004A5BA1    ret
*}
end;

//004A5BA4
function TJPEGImage.GetHeight:Integer;
begin
{*
 004A5BA4    push        ebx
 004A5BA5    mov         ebx,eax
 004A5BA7    mov         eax,dword ptr [ebx+2C]
 004A5BAA    test        eax,eax
>004A5BAC    je          004A5BB5
 004A5BAE    mov         edx,dword ptr [eax]
 004A5BB0    call        dword ptr [edx+20]
 004A5BB3    pop         ebx
 004A5BB4    ret
 004A5BB5    cmp         byte ptr [ebx+43],0
>004A5BB9    jne         004A5BC3
 004A5BBB    mov         eax,dword ptr [ebx+28]
 004A5BBE    mov         eax,dword ptr [eax+0C]
>004A5BC1    jmp         004A5BCD
 004A5BC3    mov         eax,ebx
 004A5BC5    call        TJPEGImage.CalcOutputDimensions
 004A5BCA    mov         eax,dword ptr [ebx+34]
 004A5BCD    pop         ebx
 004A5BCE    ret
*}
end;

//004A5BD0
function TJPEGImage.GetWidth:Integer;
begin
{*
 004A5BD0    push        ebx
 004A5BD1    mov         ebx,eax
 004A5BD3    mov         eax,dword ptr [ebx+2C]
 004A5BD6    test        eax,eax
>004A5BD8    je          004A5BE1
 004A5BDA    mov         edx,dword ptr [eax]
 004A5BDC    call        dword ptr [edx+2C]
 004A5BDF    pop         ebx
 004A5BE0    ret
 004A5BE1    cmp         byte ptr [ebx+43],0
>004A5BE5    jne         004A5BEF
 004A5BE7    mov         eax,dword ptr [ebx+28]
 004A5BEA    mov         eax,dword ptr [eax+10]
>004A5BED    jmp         004A5BF9
 004A5BEF    mov         eax,ebx
 004A5BF1    call        TJPEGImage.CalcOutputDimensions
 004A5BF6    mov         eax,dword ptr [ebx+30]
 004A5BF9    pop         ebx
 004A5BFA    ret
*}
end;

//004A5BFC
procedure TJPEGImage.JPEGNeeded;
begin
{*
 004A5BFC    mov         edx,dword ptr [eax+28]
 004A5BFF    cmp         dword ptr [edx+8],0
>004A5C03    jne         004A5C0A
 004A5C05    call        TJPEGImage.Compress
 004A5C0A    ret
*}
end;

//004A5C0C
procedure TJPEGImage.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 004A5C0C    push        ebp
 004A5C0D    mov         ebp,esp
 004A5C0F    push        ebx
 004A5C10    push        esi
 004A5C11    push        edi
 004A5C12    mov         edi,edx
 004A5C14    mov         esi,eax
 004A5C16    mov         eax,dword ptr [ebp+8]
 004A5C19    push        eax
 004A5C1A    mov         edx,edi
 004A5C1C    mov         eax,dword ptr [esi+2C]
 004A5C1F    mov         ebx,dword ptr [eax]
 004A5C21    call        dword ptr [ebx+5C]
 004A5C24    pop         edi
 004A5C25    pop         esi
 004A5C26    pop         ebx
 004A5C27    pop         ebp
 004A5C28    ret         4
*}
end;

//004A5C2C
procedure TJPEGImage.LoadFromStream(Stream:TStream);
begin
{*
 004A5C2C    push        ebx
 004A5C2D    push        esi
 004A5C2E    mov         ebx,edx
 004A5C30    mov         esi,eax
 004A5C32    mov         eax,ebx
 004A5C34    mov         edx,dword ptr [eax]
 004A5C36    call        dword ptr [edx]
 004A5C38    push        eax
 004A5C39    mov         eax,ebx
 004A5C3B    call        TStream.GetPosition
 004A5C40    pop         edx
 004A5C41    sub         edx,eax
 004A5C43    mov         ecx,ebx
 004A5C45    mov         eax,esi
 004A5C47    call        TJPEGImage.ReadStream
 004A5C4C    pop         esi
 004A5C4D    pop         ebx
 004A5C4E    ret
*}
end;

//004A5C50
procedure TJPEGImage.NewBitmap;
begin
{*
 004A5C50    push        ebx
 004A5C51    mov         ebx,eax
 004A5C53    mov         eax,dword ptr [ebx+2C]
 004A5C56    call        TObject.Free
 004A5C5B    mov         dl,1
 004A5C5D    mov         eax,[00424EB8];TBitmap
 004A5C62    call        TBitmap.Create
 004A5C67    mov         dword ptr [ebx+2C],eax
 004A5C6A    pop         ebx
 004A5C6B    ret
*}
end;

//004A5C6C
procedure TJPEGImage.NewImage;
begin
{*
 004A5C6C    push        ebx
 004A5C6D    push        esi
 004A5C6E    mov         ebx,eax
 004A5C70    mov         eax,dword ptr [ebx+28]
 004A5C73    test        eax,eax
>004A5C75    je          004A5C7C
 004A5C77    call        TSharedImage.Release
 004A5C7C    mov         dl,1
 004A5C7E    mov         eax,[004A49A4];TJPEGData
 004A5C83    call        TObject.Create
 004A5C88    mov         esi,eax
 004A5C8A    mov         dword ptr [ebx+28],esi
 004A5C8D    mov         eax,esi
 004A5C8F    call        TSharedImage.Reference
 004A5C94    pop         esi
 004A5C95    pop         ebx
 004A5C96    ret
*}
end;

//004A5C98
procedure TJPEGImage.ReadData(Stream:TStream);
begin
{*
 004A5C98    push        ebx
 004A5C99    push        esi
 004A5C9A    push        edi
 004A5C9B    push        ecx
 004A5C9C    mov         esi,edx
 004A5C9E    mov         ebx,eax
 004A5CA0    mov         edx,esp
 004A5CA2    mov         ecx,4
 004A5CA7    mov         eax,esi
 004A5CA9    mov         edi,dword ptr [eax]
 004A5CAB    call        dword ptr [edi+0C]
 004A5CAE    mov         ecx,esi
 004A5CB0    mov         edx,dword ptr [esp]
 004A5CB3    mov         eax,ebx
 004A5CB5    call        TJPEGImage.ReadStream
 004A5CBA    pop         edx
 004A5CBB    pop         edi
 004A5CBC    pop         esi
 004A5CBD    pop         ebx
 004A5CBE    ret
*}
end;

//004A5CC0
procedure TJPEGImage.ReadStream(Size:Longint; Stream:TStream);
begin
{*
 004A5CC0    push        ebp
 004A5CC1    mov         ebp,esp
 004A5CC3    add         esp,0FFFFFDA4
 004A5CC9    push        ebx
 004A5CCA    push        esi
 004A5CCB    push        edi
 004A5CCC    mov         dword ptr [ebp-8],ecx
 004A5CCF    mov         esi,edx
 004A5CD1    mov         dword ptr [ebp-4],eax
 004A5CD4    mov         eax,dword ptr [ebp-4]
 004A5CD7    call        TJPEGImage.NewImage
 004A5CDC    mov         eax,dword ptr [ebp-4]
 004A5CDF    mov         eax,dword ptr [eax+2C]
 004A5CE2    call        TObject.Free
 004A5CE7    mov         eax,dword ptr [ebp-4]
 004A5CEA    xor         edx,edx
 004A5CEC    mov         dword ptr [eax+2C],edx
 004A5CEF    mov         eax,dword ptr [ebp-4]
 004A5CF2    mov         ebx,dword ptr [eax+28]
 004A5CF5    mov         dl,1
 004A5CF7    mov         eax,[00418640];TMemoryStream
 004A5CFC    call        TObject.Create
 004A5D01    mov         edi,eax
 004A5D03    mov         dword ptr [ebx+8],edi
 004A5D06    mov         eax,esi
 004A5D08    cdq
 004A5D09    push        edx
 004A5D0A    push        eax
 004A5D0B    mov         eax,edi
 004A5D0D    call        TStream.SetSize64
 004A5D12    mov         eax,dword ptr [ebx+8]
 004A5D15    mov         edx,dword ptr [eax+4]
 004A5D18    mov         ecx,esi
 004A5D1A    mov         eax,dword ptr [ebp-8]
 004A5D1D    call        TStream.ReadBuffer
 004A5D22    test        esi,esi
>004A5D24    jle         004A5DE9
 004A5D2A    mov         esi,5AD7C4
 004A5D2F    lea         edi,[ebp-8C]
 004A5D35    mov         ecx,21
 004A5D3A    rep movs    dword ptr [edi],dword ptr [esi]
 004A5D3C    lea         eax,[ebp-8C]
 004A5D42    mov         dword ptr [ebp-25C],eax
 004A5D48    lea         eax,[ebp-25C]
 004A5D4E    mov         ecx,1D0
 004A5D53    mov         edx,3E
 004A5D58    call        jpeg_CreateDecompress
 004A5D5D    xor         eax,eax
 004A5D5F    push        ebp
 004A5D60    push        4A5DE2
 004A5D65    push        dword ptr fs:[eax]
 004A5D68    mov         dword ptr fs:[eax],esp
 004A5D6B    push        0
 004A5D6D    push        0
 004A5D6F    mov         eax,dword ptr [ebx+8]
 004A5D72    call        TStream.SetPosition
 004A5D77    mov         edx,dword ptr [ebx+8]
 004A5D7A    lea         eax,[ebp-25C]
 004A5D80    call        jpeg_stdio_src
 004A5D85    lea         eax,[ebp-25C]
 004A5D8B    or          edx,0FFFFFFFF
 004A5D8E    call        jpeg_read_header
 004A5D93    mov         eax,dword ptr [ebp-240]
 004A5D99    mov         dword ptr [ebx+10],eax
 004A5D9C    mov         eax,dword ptr [ebp-23C]
 004A5DA2    mov         dword ptr [ebx+0C],eax
 004A5DA5    cmp         dword ptr [ebp-234],1
 004A5DAC    sete        al
 004A5DAF    mov         byte ptr [ebx+14],al
 004A5DB2    lea         eax,[ebp-25C]
 004A5DB8    call        jpeg_has_multiple_scans
 004A5DBD    cmp         eax,1
 004A5DC0    sbb         eax,eax
 004A5DC2    inc         eax
 004A5DC3    mov         edx,dword ptr [ebp-4]
 004A5DC6    mov         byte ptr [edx+41],al
 004A5DC9    xor         eax,eax
 004A5DCB    pop         edx
 004A5DCC    pop         ecx
 004A5DCD    pop         ecx
 004A5DCE    mov         dword ptr fs:[eax],edx
 004A5DD1    push        4A5DE9
 004A5DD6    lea         eax,[ebp-25C]
 004A5DDC    call        jpeg_destroy_decompress
 004A5DE1    ret
>004A5DE2    jmp         @HandleFinally
>004A5DE7    jmp         004A5DD6
 004A5DE9    mov         eax,dword ptr [ebp-4]
 004A5DEC    mov         byte ptr [eax+22],1
 004A5DF0    mov         edx,dword ptr [ebp-4]
 004A5DF3    mov         eax,dword ptr [ebp-4]
 004A5DF6    mov         ecx,dword ptr [eax]
 004A5DF8    call        dword ptr [ecx+10]
 004A5DFB    pop         edi
 004A5DFC    pop         esi
 004A5DFD    pop         ebx
 004A5DFE    mov         esp,ebp
 004A5E00    pop         ebp
 004A5E01    ret
*}
end;

//004A5E04
procedure TJPEGImage.SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);
begin
{*
 004A5E04    push        ebp
 004A5E05    mov         ebp,esp
 004A5E07    push        ecx
 004A5E08    push        ebx
 004A5E09    push        esi
 004A5E0A    push        edi
 004A5E0B    mov         dword ptr [ebp-4],ecx
 004A5E0E    mov         edi,edx
 004A5E10    mov         esi,eax
 004A5E12    mov         eax,dword ptr [ebp+8]
 004A5E15    push        eax
 004A5E16    mov         eax,esi
 004A5E18    call        TJPEGImage.GetBitmap
 004A5E1D    mov         ecx,dword ptr [ebp-4]
 004A5E20    mov         edx,edi
 004A5E22    mov         ebx,dword ptr [eax]
 004A5E24    call        dword ptr [ebx+60]
 004A5E27    pop         edi
 004A5E28    pop         esi
 004A5E29    pop         ebx
 004A5E2A    pop         ecx
 004A5E2B    pop         ebp
 004A5E2C    ret         4
*}
end;

//004A5E30
procedure TJPEGImage.SaveToStream(Stream:TStream);
begin
{*
 004A5E30    push        ebx
 004A5E31    push        esi
 004A5E32    mov         esi,edx
 004A5E34    mov         ebx,eax
 004A5E36    mov         eax,ebx
 004A5E38    call        TJPEGImage.JPEGNeeded
 004A5E3D    mov         eax,dword ptr [ebx+28]
 004A5E40    mov         ebx,dword ptr [eax+8]
 004A5E43    mov         eax,ebx
 004A5E45    mov         edx,dword ptr [eax]
 004A5E47    call        dword ptr [edx]
 004A5E49    mov         ecx,eax
 004A5E4B    mov         edx,dword ptr [ebx+4]
 004A5E4E    mov         eax,esi
 004A5E50    mov         ebx,dword ptr [eax]
 004A5E52    call        dword ptr [ebx+10]
 004A5E55    pop         esi
 004A5E56    pop         ebx
 004A5E57    ret
*}
end;

//004A5E58
procedure TJPEGImage.SetHeight;
begin
{*
 004A5E58    push        ebp
 004A5E59    mov         ebp,esp
 004A5E5B    push        0
 004A5E5D    xor         eax,eax
 004A5E5F    push        ebp
 004A5E60    push        4A5E96
 004A5E65    push        dword ptr fs:[eax]
 004A5E68    mov         dword ptr fs:[eax],esp
 004A5E6B    lea         edx,[ebp-4]
 004A5E6E    mov         eax,[005AE134];^sChangeJPGSize:TResStringRec
 004A5E73    call        LoadStr
 004A5E78    mov         eax,dword ptr [ebp-4]
 004A5E7B    call        InvalidOperation
 004A5E80    xor         eax,eax
 004A5E82    pop         edx
 004A5E83    pop         ecx
 004A5E84    pop         ecx
 004A5E85    mov         dword ptr fs:[eax],edx
 004A5E88    push        4A5E9D
 004A5E8D    lea         eax,[ebp-4]
 004A5E90    call        @LStrClr
 004A5E95    ret
>004A5E96    jmp         @HandleFinally
>004A5E9B    jmp         004A5E8D
 004A5E9D    pop         ecx
 004A5E9E    pop         ebp
 004A5E9F    ret
*}
end;

//004A5EA0
procedure TJPEGImage.SetPalette(Value:HPALETTE);
begin
{*
 004A5EA0    push        ebx
 004A5EA1    push        esi
 004A5EA2    push        edi
 004A5EA3    mov         esi,edx
 004A5EA5    mov         edi,eax
 004A5EA7    cmp         esi,dword ptr [edi+38]
>004A5EAA    je          004A5EF2
 004A5EAC    mov         ebx,dword ptr [edi+2C]
 004A5EAF    test        ebx,ebx
>004A5EB1    je          004A5EBE
 004A5EB3    mov         eax,ebx
 004A5EB5    mov         edx,dword ptr [eax]
 004A5EB7    call        dword ptr [edx+24]
 004A5EBA    cmp         esi,eax
>004A5EBC    jne         004A5EC2
 004A5EBE    xor         eax,eax
>004A5EC0    jmp         004A5EC4
 004A5EC2    mov         al,1
 004A5EC4    mov         ebx,eax
 004A5EC6    test        bl,bl
>004A5EC8    je          004A5ED1
 004A5ECA    mov         eax,edi
 004A5ECC    call        TJPEGImage.FreeBitmap
 004A5ED1    mov         eax,dword ptr [edi+38]
 004A5ED4    test        eax,eax
>004A5ED6    je          004A5EDE
 004A5ED8    push        eax
 004A5ED9    call        gdi32.DeleteObject
 004A5EDE    mov         dword ptr [edi+38],esi
 004A5EE1    test        bl,bl
>004A5EE3    je          004A5EF2
 004A5EE5    mov         byte ptr [edi+22],1
 004A5EE9    mov         edx,edi
 004A5EEB    mov         eax,edi
 004A5EED    mov         ecx,dword ptr [eax]
 004A5EEF    call        dword ptr [ecx+10]
 004A5EF2    pop         edi
 004A5EF3    pop         esi
 004A5EF4    pop         ebx
 004A5EF5    ret
*}
end;

//004A5EF8
procedure TJPEGImage.SetWidth;
begin
{*
 004A5EF8    push        ebp
 004A5EF9    mov         ebp,esp
 004A5EFB    push        0
 004A5EFD    xor         eax,eax
 004A5EFF    push        ebp
 004A5F00    push        4A5F36
 004A5F05    push        dword ptr fs:[eax]
 004A5F08    mov         dword ptr fs:[eax],esp
 004A5F0B    lea         edx,[ebp-4]
 004A5F0E    mov         eax,[005AE134];^sChangeJPGSize:TResStringRec
 004A5F13    call        LoadStr
 004A5F18    mov         eax,dword ptr [ebp-4]
 004A5F1B    call        InvalidOperation
 004A5F20    xor         eax,eax
 004A5F22    pop         edx
 004A5F23    pop         ecx
 004A5F24    pop         ecx
 004A5F25    mov         dword ptr fs:[eax],edx
 004A5F28    push        4A5F3D
 004A5F2D    lea         eax,[ebp-4]
 004A5F30    call        @LStrClr
 004A5F35    ret
>004A5F36    jmp         @HandleFinally
>004A5F3B    jmp         004A5F2D
 004A5F3D    pop         ecx
 004A5F3E    pop         ebp
 004A5F3F    ret
*}
end;

//004A5F40
procedure TJPEGImage.WriteData(Stream:TStream);
begin
{*
 004A5F40    push        ebx
 004A5F41    push        esi
 004A5F42    push        edi
 004A5F43    push        ecx
 004A5F44    mov         esi,edx
 004A5F46    mov         ebx,eax
 004A5F48    xor         eax,eax
 004A5F4A    mov         dword ptr [esp],eax
 004A5F4D    mov         eax,dword ptr [ebx+28]
 004A5F50    mov         edi,dword ptr [eax+8]
 004A5F53    test        edi,edi
>004A5F55    je          004A5F60
 004A5F57    mov         eax,edi
 004A5F59    mov         edx,dword ptr [eax]
 004A5F5B    call        dword ptr [edx]
 004A5F5D    mov         dword ptr [esp],eax
 004A5F60    mov         edx,esp
 004A5F62    mov         ecx,4
 004A5F67    mov         eax,esi
 004A5F69    mov         edi,dword ptr [eax]
 004A5F6B    call        dword ptr [edi+10]
 004A5F6E    cmp         dword ptr [esp],0
>004A5F72    jle         004A5F87
 004A5F74    mov         eax,dword ptr [ebx+28]
 004A5F77    mov         eax,dword ptr [eax+8]
 004A5F7A    mov         edx,dword ptr [eax+4]
 004A5F7D    mov         ecx,dword ptr [esp]
 004A5F80    mov         eax,esi
 004A5F82    mov         ebx,dword ptr [eax]
 004A5F84    call        dword ptr [ebx+10]
 004A5F87    pop         edx
 004A5F88    pop         edi
 004A5F89    pop         esi
 004A5F8A    pop         ebx
 004A5F8B    ret
*}
end;

//004A5F8C
procedure InitDefaults;
begin
{*
 004A5F8C    push        ebx
 004A5F8D    push        esi
 004A5F8E    push        0
 004A5F90    call        user32.GetDC
 004A5F95    mov         ebx,eax
 004A5F97    push        0C
 004A5F99    push        ebx
 004A5F9A    call        gdi32.GetDeviceCaps
 004A5F9F    mov         esi,eax
 004A5FA1    push        0E
 004A5FA3    push        ebx
 004A5FA4    call        gdi32.GetDeviceCaps
 004A5FA9    imul        esi,eax
 004A5FAC    cmp         esi,8
>004A5FAF    jg          004A5FBA
 004A5FB1    mov         byte ptr ds:[5AD7BF],1
>004A5FB8    jmp         004A5FC1
 004A5FBA    mov         byte ptr ds:[5AD7BF],0
 004A5FC1    push        ebx
 004A5FC2    push        0
 004A5FC4    call        user32.ReleaseDC
 004A5FC9    pop         esi
 004A5FCA    pop         ebx
 004A5FCB    ret
*}
end;

//004A5FCC
procedure jpeg_CreateDecompress(var cinfo:jpeg_decompress_struct; version:Integer; structsize:Integer);
begin
{*
 004A5FCC    push        ebx
 004A5FCD    mov         ebx,eax
 004A5FCF    push        esi
 004A5FD0    xor         eax,eax
 004A5FD2    push        edi
 004A5FD3    mov         dword ptr [ebx+4],eax
 004A5FD6    cmp         edx,3E
 004A5FD9    mov         esi,ecx
>004A5FDB    je          004A5FF6
 004A5FDD    mov         eax,dword ptr [ebx]
 004A5FDF    mov         dword ptr [eax+14],0C
 004A5FE6    mov         dword ptr [eax+18],3E
 004A5FED    mov         dword ptr [eax+1C],edx
 004A5FF0    mov         eax,ebx
 004A5FF2    mov         edx,dword ptr [eax]
 004A5FF4    call        dword ptr [edx]
 004A5FF6    cmp         esi,1D0
>004A5FFC    je          004A6017
 004A5FFE    mov         eax,dword ptr [ebx]
 004A6000    mov         dword ptr [eax+14],15
 004A6007    mov         dword ptr [eax+18],1D0
 004A600E    mov         dword ptr [eax+1C],esi
 004A6011    mov         eax,ebx
 004A6013    mov         edx,dword ptr [eax]
 004A6015    call        dword ptr [edx]
 004A6017    mov         esi,dword ptr [ebx]
 004A6019    mov         edi,dword ptr [ebx+0C]
 004A601C    push        1D0
 004A6021    push        0
 004A6023    push        ebx
 004A6024    call        _memset
 004A6029    add         esp,0C
 004A602C    mov         dword ptr [ebx],esi
 004A602E    mov         dword ptr [ebx+0C],edi
 004A6031    mov         dword ptr [ebx+10],1
 004A6038    mov         eax,ebx
 004A603A    call        @jinit_memory_mgr
 004A603F    xor         edx,edx
 004A6041    xor         ecx,ecx
 004A6043    mov         dword ptr [ebx+8],edx
 004A6046    lea         edx,[ebx+0A4]
 004A604C    mov         dword ptr [ebx+18],ecx
 004A604F    xor         eax,eax
 004A6051    xor         ecx,ecx
 004A6053    inc         eax
 004A6054    mov         dword ptr [edx],ecx
 004A6056    add         edx,4
 004A6059    cmp         eax,4
>004A605C    jl          004A6051
 004A605E    xor         eax,eax
 004A6060    lea         edx,[ebx+0B4]
 004A6066    xor         ecx,ecx
 004A6068    inc         eax
 004A6069    mov         dword ptr [edx],ecx
 004A606B    xor         ecx,ecx
 004A606D    mov         dword ptr [edx+10],ecx
 004A6070    add         edx,4
 004A6073    cmp         eax,4
>004A6076    jl          004A6066
 004A6078    xor         eax,eax
 004A607A    mov         dword ptr [ebx+130],eax
 004A6080    mov         eax,ebx
 004A6082    call        @jinit_marker_reader
 004A6087    mov         eax,ebx
 004A6089    call        @jinit_input_controller
 004A608E    mov         dword ptr [ebx+14],0C8
 004A6095    pop         edi
 004A6096    pop         esi
 004A6097    pop         ebx
 004A6098    ret
*}
end;

//004A609C
procedure jpeg_destroy_decompress(var cinfo:jpeg_decompress_struct);
begin
{*
 004A609C    call        jpeg_destroy
 004A60A1    ret
*}
end;

//004A60AC
{*procedure sub_004A60AC(?:?);
begin
 004A60AC    push        ebx
 004A60AD    mov         ebx,eax
 004A60AF    push        esi
 004A60B0    mov         eax,dword ptr [ebx+24]
 004A60B3    dec         eax
>004A60B4    je          004A60C7
 004A60B6    sub         eax,2
>004A60B9    je          004A60DA
 004A60BB    dec         eax
>004A60BC    je          004A61B9
>004A60C2    jmp         004A621C
 004A60C7    mov         dword ptr [ebx+28],1
 004A60CE    mov         dword ptr [ebx+2C],1
>004A60D5    jmp         004A6226
 004A60DA    cmp         dword ptr [ebx+118],0
>004A60E1    je          004A60EF
 004A60E3    mov         dword ptr [ebx+28],3
>004A60EA    jmp         004A61B0
 004A60EF    cmp         dword ptr [ebx+124],0
>004A60F6    je          004A6146
 004A60F8    mov         dl,byte ptr [ebx+128]
 004A60FE    sub         dl,1
>004A6101    jb          004A6107
>004A6103    je          004A6113
>004A6105    jmp         004A611F
 004A6107    mov         dword ptr [ebx+28],2
>004A610E    jmp         004A61B0
 004A6113    mov         dword ptr [ebx+28],3
>004A611A    jmp         004A61B0
 004A611F    mov         eax,dword ptr [ebx]
 004A6121    xor         edx,edx
 004A6123    mov         dword ptr [eax+14],72
 004A612A    mov         dl,byte ptr [ebx+128]
 004A6130    mov         dword ptr [eax+18],edx
 004A6133    mov         eax,ebx
 004A6135    or          edx,0FFFFFFFF
 004A6138    mov         ecx,dword ptr [eax]
 004A613A    call        dword ptr [ecx+4]
 004A613D    mov         dword ptr [ebx+28],3
>004A6144    jmp         004A61B0
 004A6146    mov         ecx,dword ptr [ebx+0D8]
 004A614C    mov         eax,dword ptr [ecx]
 004A614E    mov         edx,dword ptr [ecx+54]
 004A6151    mov         ecx,dword ptr [ecx+0A8]
 004A6157    cmp         eax,1
>004A615A    jne         004A616F
 004A615C    cmp         edx,2
>004A615F    jne         004A616F
 004A6161    cmp         ecx,3
>004A6164    jne         004A616F
 004A6166    mov         dword ptr [ebx+28],3
>004A616D    jmp         004A61B0
 004A616F    cmp         eax,52
>004A6172    jne         004A6187
 004A6174    cmp         edx,47
>004A6177    jne         004A6187
 004A6179    cmp         ecx,42
>004A617C    jne         004A6187
 004A617E    mov         dword ptr [ebx+28],2
>004A6185    jmp         004A61B0
 004A6187    mov         esi,dword ptr [ebx]
 004A6189    add         esi,18
 004A618C    mov         dword ptr [esi],eax
 004A618E    mov         dword ptr [esi+4],edx
 004A6191    mov         dword ptr [esi+8],ecx
 004A6194    mov         eax,dword ptr [ebx]
 004A6196    mov         dword ptr [eax+14],6F
 004A619D    mov         edx,1
 004A61A2    mov         eax,ebx
 004A61A4    mov         ecx,dword ptr [eax]
 004A61A6    call        dword ptr [ecx+4]
 004A61A9    mov         dword ptr [ebx+28],3
 004A61B0    mov         dword ptr [ebx+2C],2
>004A61B7    jmp         004A6226
 004A61B9    cmp         dword ptr [ebx+124],0
>004A61C0    je          004A620C
 004A61C2    mov         dl,byte ptr [ebx+128]
 004A61C8    sub         dl,1
>004A61CB    jb          004A61D3
 004A61CD    dec         dl
>004A61CF    je          004A61DC
>004A61D1    jmp         004A61E5
 004A61D3    mov         dword ptr [ebx+28],4
>004A61DA    jmp         004A6213
 004A61DC    mov         dword ptr [ebx+28],5
>004A61E3    jmp         004A6213
 004A61E5    mov         eax,dword ptr [ebx]
 004A61E7    xor         edx,edx
 004A61E9    mov         dword ptr [eax+14],72
 004A61F0    mov         dl,byte ptr [ebx+128]
 004A61F6    mov         dword ptr [eax+18],edx
 004A61F9    mov         eax,ebx
 004A61FB    or          edx,0FFFFFFFF
 004A61FE    mov         ecx,dword ptr [eax]
 004A6200    call        dword ptr [ecx+4]
 004A6203    mov         dword ptr [ebx+28],5
>004A620A    jmp         004A6213
 004A620C    mov         dword ptr [ebx+28],4
 004A6213    mov         dword ptr [ebx+2C],4
>004A621A    jmp         004A6226
 004A621C    xor         eax,eax
 004A621E    xor         edx,edx
 004A6220    mov         dword ptr [ebx+28],eax
 004A6223    mov         dword ptr [ebx+2C],edx
 004A6226    mov         dword ptr [ebx+30],1
 004A622D    mov         dword ptr [ebx+34],1
 004A6234    xor         ecx,ecx
 004A6236    xor         eax,eax
 004A6238    mov         dword ptr [ebx+38],ecx
 004A623B    xor         edx,edx
 004A623D    mov         dword ptr [ebx+3C],3FF00000
 004A6244    mov         dword ptr [ebx+40],eax
 004A6247    mov         dword ptr [ebx+44],edx
 004A624A    mov         dword ptr [ebx+48],2
 004A6251    mov         dword ptr [ebx+4C],1
 004A6258    mov         dword ptr [ebx+50],1
 004A625F    xor         ecx,ecx
 004A6261    xor         eax,eax
 004A6263    mov         dword ptr [ebx+54],ecx
 004A6266    xor         edx,edx
 004A6268    mov         dword ptr [ebx+58],2
 004A626F    mov         dword ptr [ebx+5C],1
 004A6276    mov         dword ptr [ebx+60],100
 004A627D    mov         dword ptr [ebx+88],eax
 004A6283    xor         ecx,ecx
 004A6285    mov         dword ptr [ebx+64],edx
 004A6288    mov         dword ptr [ebx+68],ecx
 004A628B    xor         eax,eax
 004A628D    mov         dword ptr [ebx+6C],eax
 004A6290    pop         esi
 004A6291    pop         ebx
 004A6292    ret
end;*}

//004A6294
procedure jpeg_read_header(var cinfo:jpeg_decompress_struct; RequireImage:LongBool);
begin
{*
 004A6294    push        ebx
 004A6295    mov         ebx,eax
 004A6297    push        esi
 004A6298    mov         esi,edx
 004A629A    mov         eax,dword ptr [ebx+14]
 004A629D    cmp         eax,0C8
>004A62A2    je          004A62C0
 004A62A4    cmp         eax,0C9
>004A62A9    je          004A62C0
 004A62AB    mov         eax,dword ptr [ebx]
 004A62AD    mov         dword ptr [eax+14],14
 004A62B4    mov         edx,dword ptr [ebx+14]
 004A62B7    mov         dword ptr [eax+18],edx
 004A62BA    mov         eax,ebx
 004A62BC    mov         edx,dword ptr [eax]
 004A62BE    call        dword ptr [edx]
 004A62C0    mov         eax,ebx
 004A62C2    call        jpeg_consume_input
 004A62C7    mov         edx,eax
 004A62C9    sub         edx,1
>004A62CC    jb          004A62FB
>004A62CE    je          004A62D5
 004A62D0    dec         edx
>004A62D1    je          004A62DC
>004A62D3    jmp         004A62FB
 004A62D5    mov         eax,1
>004A62DA    jmp         004A62FB
 004A62DC    test        esi,esi
>004A62DE    je          004A62EF
 004A62E0    mov         edx,dword ptr [ebx]
 004A62E2    mov         eax,ebx
 004A62E4    mov         dword ptr [edx+14],33
 004A62EB    mov         edx,dword ptr [eax]
 004A62ED    call        dword ptr [edx]
 004A62EF    mov         eax,ebx
 004A62F1    call        @jpeg_abort
 004A62F6    mov         eax,2
 004A62FB    pop         esi
 004A62FC    pop         ebx
 004A62FD    ret
*}
end;

//004A6300
function jpeg_consume_input(var cinfo:jpeg_decompress_struct):Integer;
begin
{*
 004A6300    push        ebx
 004A6301    mov         ebx,eax
 004A6303    push        esi
 004A6304    xor         esi,esi
 004A6306    mov         eax,dword ptr [ebx+14]
 004A6309    add         eax,0FFFFFF38
 004A630E    cmp         eax,0A
>004A6311    ja          004A638F
 004A6313    mov         al,byte ptr [eax+4A6320]
 004A6319    jmp         dword ptr [eax*4+4A632B]
 004A6319    db          4
 004A6319    db          3
 004A6319    db          2
 004A6319    db          1
 004A6319    db          1
 004A6319    db          1
 004A6319    db          1
 004A6319    db          1
 004A6319    db          1
 004A6319    db          0
 004A6319    db          1
 004A6319    dd          004A638F
 004A6319    dd          004A6381
 004A6319    dd          004A637A
 004A6319    dd          004A6359
 004A6319    dd          004A633F
 004A633F    mov         eax,ebx
 004A6341    mov         edx,dword ptr [eax+1B4]
 004A6347    call        dword ptr [edx+4]
 004A634A    mov         eax,ebx
 004A634C    mov         edx,dword ptr [eax+18]
 004A634F    call        dword ptr [edx+8]
 004A6352    mov         dword ptr [ebx+14],0C9
 004A6359    mov         eax,ebx
 004A635B    mov         edx,dword ptr [eax+1B4]
 004A6361    call        dword ptr [edx]
 004A6363    mov         esi,eax
 004A6365    cmp         esi,1
>004A6368    jne         004A63A4
 004A636A    mov         eax,ebx
 004A636C    call        004A60AC
 004A6371    mov         dword ptr [ebx+14],0CA
>004A6378    jmp         004A63A4
 004A637A    mov         esi,1
>004A637F    jmp         004A63A4
 004A6381    mov         eax,ebx
 004A6383    mov         edx,dword ptr [eax+1B4]
 004A6389    call        dword ptr [edx]
 004A638B    mov         esi,eax
>004A638D    jmp         004A63A4
 004A638F    mov         eax,dword ptr [ebx]
 004A6391    mov         dword ptr [eax+14],14
 004A6398    mov         edx,dword ptr [ebx+14]
 004A639B    mov         dword ptr [eax+18],edx
 004A639E    mov         eax,ebx
 004A63A0    mov         edx,dword ptr [eax]
 004A63A2    call        dword ptr [edx]
 004A63A4    mov         eax,esi
 004A63A6    pop         esi
 004A63A7    pop         ebx
 004A63A8    ret
*}
end;

//004A63E0
function jpeg_has_multiple_scans(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 004A63E0    push        ebx
 004A63E1    mov         ebx,eax
 004A63E3    mov         eax,dword ptr [ebx+14]
 004A63E6    cmp         eax,0CA
>004A63EB    jl          004A63F4
 004A63ED    cmp         eax,0D2
>004A63F2    jle         004A6409
 004A63F4    mov         eax,dword ptr [ebx]
 004A63F6    mov         dword ptr [eax+14],14
 004A63FD    mov         edx,dword ptr [ebx+14]
 004A6400    mov         dword ptr [eax+18],edx
 004A6403    mov         eax,ebx
 004A6405    mov         edx,dword ptr [eax]
 004A6407    call        dword ptr [edx]
 004A6409    mov         ecx,dword ptr [ebx+1B4]
 004A640F    mov         eax,dword ptr [ecx+10]
 004A6412    pop         ebx
 004A6413    ret
*}
end;

//004A6414
function jpeg_finish_decompress(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 004A6414    push        ebx
 004A6415    mov         ebx,eax
 004A6417    mov         eax,dword ptr [ebx+14]
 004A641A    cmp         eax,0CD
>004A641F    je          004A6428
 004A6421    cmp         eax,0CE
>004A6426    jne         004A645C
 004A6428    cmp         dword ptr [ebx+40],0
>004A642C    jne         004A645C
 004A642E    mov         edx,dword ptr [ebx+8C]
 004A6434    cmp         edx,dword ptr [ebx+74]
>004A6437    jae         004A6448
 004A6439    mov         ecx,dword ptr [ebx]
 004A643B    mov         eax,ebx
 004A643D    mov         dword ptr [ecx+14],43
 004A6444    mov         edx,dword ptr [eax]
 004A6446    call        dword ptr [edx]
 004A6448    mov         eax,ebx
 004A644A    mov         edx,dword ptr [eax+1A4]
 004A6450    call        dword ptr [edx+4]
 004A6453    mov         dword ptr [ebx+14],0D2
>004A645A    jmp         004A64A0
 004A645C    cmp         dword ptr [ebx+14],0CF
>004A6463    jne         004A646E
 004A6465    mov         dword ptr [ebx+14],0D2
>004A646C    jmp         004A64A0
 004A646E    cmp         dword ptr [ebx+14],0D2
>004A6475    je          004A64A0
 004A6477    mov         eax,dword ptr [ebx]
 004A6479    mov         dword ptr [eax+14],14
 004A6480    mov         edx,dword ptr [ebx+14]
 004A6483    mov         dword ptr [eax+18],edx
 004A6486    mov         eax,ebx
 004A6488    mov         edx,dword ptr [eax]
 004A648A    call        dword ptr [edx]
>004A648C    jmp         004A64A0
 004A648E    mov         eax,ebx
 004A6490    mov         edx,dword ptr [eax+1B4]
 004A6496    call        dword ptr [edx]
 004A6498    test        eax,eax
>004A649A    jne         004A64A0
 004A649C    xor         eax,eax
 004A649E    pop         ebx
 004A649F    ret
 004A64A0    mov         edx,dword ptr [ebx+1B4]
 004A64A6    cmp         dword ptr [edx+14],0
>004A64AA    je          004A648E
 004A64AC    mov         eax,ebx
 004A64AE    mov         edx,dword ptr [eax+18]
 004A64B1    call        dword ptr [edx+18]
 004A64B4    mov         eax,ebx
 004A64B6    call        @jpeg_abort
 004A64BB    mov         eax,1
 004A64C0    pop         ebx
 004A64C1    ret
*}
end;

//004A64C4
procedure _DF_.;
begin
{*
 004A64C4    mov         ecx,dword ptr [eax]
 004A64C6    mov         dword ptr [ecx+14],36
 004A64CD    mov         dword ptr [ecx+18],edx
 004A64D0    mov         edx,dword ptr [eax]
 004A64D2    call        dword ptr [edx]
 004A64D4    ret
*}
end;

//004A6FF0
procedure @jinit_memory_mgr;
begin
{*
 004A6FF0    push        ebx
 004A6FF1    push        esi
 004A6FF2    push        edi
 004A6FF3    mov         esi,eax
 004A6FF5    xor         eax,eax
 004A6FF7    mov         dword ptr [esi+4],eax
>004A6FFA    jmp         004A700B
 004A6FFC    mov         edx,dword ptr [esi]
 004A6FFE    mov         eax,esi
 004A7000    mov         dword ptr [edx+14],2
 004A7007    mov         edx,dword ptr [eax]
 004A7009    call        dword ptr [edx]
 004A700B    mov         eax,3B9ACA00
 004A7010    cmp         eax,3B9ACA00
>004A7015    je          004A7026
 004A7017    mov         edx,dword ptr [esi]
 004A7019    mov         eax,esi
 004A701B    mov         dword ptr [edx+14],3
 004A7022    mov         edx,dword ptr [eax]
 004A7024    call        dword ptr [edx]
 004A7026    mov         eax,esi
 004A7028    call        @jpeg_mem_init
 004A702D    mov         edi,eax
 004A702F    mov         edx,54
 004A7034    mov         eax,esi
 004A7036    call        @jpeg_get_small
 004A703B    mov         ebx,eax
 004A703D    test        ebx,ebx
>004A703F    jne         004A705C
 004A7041    mov         eax,esi
 004A7043    call        @jpeg_mem_term
 004A7048    mov         eax,dword ptr [esi]
 004A704A    xor         edx,edx
 004A704C    mov         dword ptr [eax+14],36
 004A7053    mov         dword ptr [eax+18],edx
 004A7056    mov         eax,esi
 004A7058    mov         edx,dword ptr [eax]
 004A705A    call        dword ptr [edx]
 004A705C    mov         dword ptr [ebx],4A64D8
 004A7062    mov         edx,1
 004A7067    mov         dword ptr [ebx+4],4A6608
 004A706E    mov         dword ptr [ebx+8],4A66A8
 004A7075    mov         dword ptr [ebx+0C],4A677C
 004A707C    mov         dword ptr [ebx+10],4A6860
 004A7083    mov         dword ptr [ebx+14],4A68C8
 004A708A    mov         dword ptr [ebx+18],4A6930
 004A7091    mov         dword ptr [ebx+1C],4A6C20
 004A7098    mov         dword ptr [ebx+20],4A6D64
 004A709F    mov         dword ptr [ebx+24],4A6EAC
 004A70A6    mov         dword ptr [ebx+28],4A6FB8
 004A70AD    mov         dword ptr [ebx+30],3B9ACA00
 004A70B4    mov         dword ptr [ebx+2C],edi
 004A70B7    lea         eax,[ebx+38]
 004A70BA    xor         ecx,ecx
 004A70BC    dec         edx
 004A70BD    mov         dword ptr [eax],ecx
 004A70BF    xor         ecx,ecx
 004A70C1    mov         dword ptr [eax+8],ecx
 004A70C4    add         eax,0FFFFFFFC
 004A70C7    test        edx,edx
>004A70C9    jge         004A70BA
 004A70CB    xor         eax,eax
 004A70CD    xor         edx,edx
 004A70CF    mov         dword ptr [ebx+44],eax
 004A70D2    mov         dword ptr [ebx+48],edx
 004A70D5    mov         dword ptr [ebx+4C],54
 004A70DC    mov         dword ptr [esi+4],ebx
 004A70DF    pop         edi
 004A70E0    pop         esi
 004A70E1    pop         ebx
 004A70E2    ret
*}
end;

//004A70E4
procedure @jpeg_get_small;
begin
{*
 004A70E4    push        edx
 004A70E5    call        _malloc
 004A70EA    pop         ecx
 004A70EB    ret
*}
end;

//004A70EC
procedure @jpeg_free_small;
begin
{*
 004A70EC    push        edx
 004A70ED    call        _free
 004A70F2    pop         ecx
 004A70F3    ret
*}
end;

//004A70F4
procedure @jpeg_get_large;
begin
{*
 004A70F4    push        edx
 004A70F5    call        _malloc
 004A70FA    pop         ecx
 004A70FB    ret
*}
end;

//004A70FC
procedure @jpeg_free_large;
begin
{*
 004A70FC    push        edx
 004A70FD    call        _free
 004A7102    pop         ecx
 004A7103    ret
*}
end;

//004A7104
procedure @jpeg_mem_available;
begin
{*
 004A7104    push        ebp
 004A7105    mov         ebp,esp
 004A7107    mov         eax,ecx
 004A7109    pop         ebp
 004A710A    ret         4
*}
end;

//004A7110
procedure @jpeg_open_backing_store;
begin
{*
 004A7110    mov         edx,dword ptr [eax]
 004A7112    mov         dword ptr [edx+14],31
 004A7119    mov         ecx,dword ptr [eax]
 004A711B    call        dword ptr [ecx]
 004A711D    ret
*}
end;

//004A7120
procedure @jpeg_mem_init;
begin
{*
 004A7120    xor         eax,eax
 004A7122    ret
*}
end;

//004A7124
procedure @jpeg_mem_term;
begin
{*
 004A7124    ret
*}
end;

//004A7128
procedure _DF_.;
begin
{*
 004A7128    push        ebx
 004A7129    mov         ebx,eax
 004A712B    push        esi
 004A712C    push        edi
 004A712D    cmp         dword ptr [ebx+20],0FFDC
>004A7134    jg          004A713F
 004A7136    cmp         dword ptr [ebx+1C],0FFDC
>004A713D    jle         004A7155
 004A713F    mov         eax,dword ptr [ebx]
 004A7141    mov         dword ptr [eax+14],29
 004A7148    mov         dword ptr [eax+18],0FFDC
 004A714F    mov         eax,ebx
 004A7151    mov         edx,dword ptr [eax]
 004A7153    call        dword ptr [edx]
 004A7155    cmp         dword ptr [ebx+0D4],8
>004A715C    je          004A7176
 004A715E    mov         eax,dword ptr [ebx]
 004A7160    mov         dword ptr [eax+14],0F
 004A7167    mov         edx,dword ptr [ebx+0D4]
 004A716D    mov         dword ptr [eax+18],edx
 004A7170    mov         eax,ebx
 004A7172    mov         edx,dword ptr [eax]
 004A7174    call        dword ptr [edx]
 004A7176    cmp         dword ptr [ebx+24],0A
>004A717A    jle         004A7198
 004A717C    mov         eax,dword ptr [ebx]
 004A717E    mov         dword ptr [eax+14],1A
 004A7185    mov         edx,dword ptr [ebx+24]
 004A7188    mov         dword ptr [eax+18],edx
 004A718B    mov         dword ptr [eax+1C],0A
 004A7192    mov         eax,ebx
 004A7194    mov         edx,dword ptr [eax]
 004A7196    call        dword ptr [edx]
 004A7198    mov         dword ptr [ebx+134],1
 004A71A2    mov         dword ptr [ebx+138],1
 004A71AC    xor         edi,edi
 004A71AE    mov         esi,dword ptr [ebx+0D8]
>004A71B4    jmp         004A7219
 004A71B6    mov         eax,dword ptr [esi+8]
 004A71B9    test        eax,eax
>004A71BB    jle         004A71CE
 004A71BD    cmp         eax,4
>004A71C0    jg          004A71CE
 004A71C2    cmp         dword ptr [esi+0C],0
>004A71C6    jle         004A71CE
 004A71C8    cmp         dword ptr [esi+0C],4
>004A71CC    jle         004A71DD
 004A71CE    mov         edx,dword ptr [ebx]
 004A71D0    mov         eax,ebx
 004A71D2    mov         dword ptr [edx+14],12
 004A71D9    mov         edx,dword ptr [eax]
 004A71DB    call        dword ptr [edx]
 004A71DD    mov         ecx,dword ptr [ebx+134]
 004A71E3    cmp         ecx,dword ptr [esi+8]
>004A71E6    jle         004A71F0
 004A71E8    mov         eax,dword ptr [ebx+134]
>004A71EE    jmp         004A71F3
 004A71F0    mov         eax,dword ptr [esi+8]
 004A71F3    mov         dword ptr [ebx+134],eax
 004A71F9    mov         edx,dword ptr [ebx+138]
 004A71FF    cmp         edx,dword ptr [esi+0C]
>004A7202    jle         004A720C
 004A7204    mov         ecx,dword ptr [ebx+138]
>004A720A    jmp         004A720F
 004A720C    mov         ecx,dword ptr [esi+0C]
 004A720F    mov         dword ptr [ebx+138],ecx
 004A7215    inc         edi
 004A7216    add         esi,54
 004A7219    cmp         edi,dword ptr [ebx+24]
>004A721C    jl          004A71B6
 004A721E    mov         dword ptr [ebx+13C],8
 004A7228    xor         edi,edi
 004A722A    mov         esi,dword ptr [ebx+0D8]
>004A7230    jmp         004A72A1
 004A7232    mov         dword ptr [esi+24],8
 004A7239    mov         edx,dword ptr [ebx+134]
 004A723F    shl         edx,3
 004A7242    mov         eax,dword ptr [ebx+1C]
 004A7245    imul        eax,dword ptr [esi+8]
 004A7249    call        @jdiv_round_up
 004A724E    mov         dword ptr [esi+1C],eax
 004A7251    mov         edx,dword ptr [ebx+138]
 004A7257    shl         edx,3
 004A725A    mov         eax,dword ptr [ebx+20]
 004A725D    imul        eax,dword ptr [esi+0C]
 004A7261    call        @jdiv_round_up
 004A7266    mov         dword ptr [esi+20],eax
 004A7269    mov         eax,dword ptr [ebx+1C]
 004A726C    imul        dword ptr [esi+8]
 004A726F    mov         edx,dword ptr [ebx+134]
 004A7275    call        @jdiv_round_up
 004A727A    mov         dword ptr [esi+28],eax
 004A727D    mov         eax,dword ptr [ebx+20]
 004A7280    imul        dword ptr [esi+0C]
 004A7283    mov         edx,dword ptr [ebx+138]
 004A7289    call        @jdiv_round_up
 004A728E    mov         dword ptr [esi+2C],eax
 004A7291    xor         ecx,ecx
 004A7293    mov         dword ptr [esi+30],1
 004A729A    mov         dword ptr [esi+4C],ecx
 004A729D    inc         edi
 004A729E    add         esi,54
 004A72A1    cmp         edi,dword ptr [ebx+24]
>004A72A4    jl          004A7232
 004A72A6    mov         edx,dword ptr [ebx+138]
 004A72AC    mov         eax,dword ptr [ebx+20]
 004A72AF    shl         edx,3
 004A72B2    call        @jdiv_round_up
 004A72B7    mov         dword ptr [ebx+140],eax
 004A72BD    mov         ecx,dword ptr [ebx+148]
 004A72C3    cmp         ecx,dword ptr [ebx+24]
>004A72C6    jl          004A72D1
 004A72C8    cmp         dword ptr [ebx+0DC],0
>004A72CF    je          004A72E0
 004A72D1    mov         eax,dword ptr [ebx+1B4]
 004A72D7    mov         dword ptr [eax+10],1
>004A72DE    jmp         004A72EB
 004A72E0    mov         edx,dword ptr [ebx+1B4]
 004A72E6    xor         ecx,ecx
 004A72E8    mov         dword ptr [edx+10],ecx
 004A72EB    pop         edi
 004A72EC    pop         esi
 004A72ED    pop         ebx
 004A72EE    ret
*}
end;

//004A7644
procedure @jinit_input_controller;
begin
{*
 004A7644    push        ebx
 004A7645    mov         ebx,eax
 004A7647    mov         eax,ebx
 004A7649    push        esi
 004A764A    mov         ecx,1C
 004A764F    xor         edx,edx
 004A7651    mov         esi,dword ptr [eax+4]
 004A7654    call        dword ptr [esi]
 004A7656    mov         dword ptr [ebx+1B4],eax
 004A765C    mov         dword ptr [eax],4A755C
 004A7662    mov         dword ptr [eax+4],4A7608
 004A7669    mov         dword ptr [eax+8],4A7514
 004A7670    mov         dword ptr [eax+0C],4A754C
 004A7677    xor         edx,edx
 004A7679    xor         ecx,ecx
 004A767B    mov         dword ptr [eax+10],edx
 004A767E    mov         dword ptr [eax+14],ecx
 004A7681    mov         dword ptr [eax+18],1
 004A7688    pop         esi
 004A7689    pop         ebx
 004A768A    ret
*}
end;

//004A768C
procedure _DF_.;
begin
{*
 004A768C    mov         eax,dword ptr [eax+18]
 004A768F    mov         dword ptr [eax+24],1
 004A7696    ret
*}
end;

//004A7738
procedure jpeg_stdio_src(var cinfo:jpeg_decompress_struct; input_file:TStream);
begin
{*
 004A7738    push        ebx
 004A7739    push        esi
 004A773A    mov         esi,eax
 004A773C    push        edi
 004A773D    push        ebp
 004A773E    mov         edi,edx
 004A7740    cmp         dword ptr [esi+18],0
>004A7744    jne         004A776B
 004A7746    mov         eax,esi
 004A7748    mov         ecx,28
 004A774D    xor         edx,edx
 004A774F    mov         ebx,dword ptr [eax+4]
 004A7752    call        dword ptr [ebx]
 004A7754    mov         ebx,eax
 004A7756    mov         eax,esi
 004A7758    mov         dword ptr [esi+18],ebx
 004A775B    mov         ecx,1000
 004A7760    mov         ebp,dword ptr [eax+4]
 004A7763    xor         edx,edx
 004A7765    call        dword ptr [ebp]
 004A7768    mov         dword ptr [ebx+20],eax
 004A776B    mov         ebx,dword ptr [esi+18]
 004A776E    xor         eax,eax
 004A7770    xor         edx,edx
 004A7772    mov         dword ptr [ebx+8],4A768C;_DF_.
 004A7779    mov         dword ptr [ebx+0C],4A7698
 004A7780    mov         dword ptr [ebx+10],4A7708
 004A7787    mov         dword ptr [ebx+14],4B1468;@jpeg_resync_to_restart
 004A778E    mov         dword ptr [ebx+18],4A7734
 004A7795    mov         dword ptr [ebx+1C],edi
 004A7798    mov         dword ptr [ebx+4],eax
 004A779B    mov         dword ptr [ebx],edx
 004A779D    pop         ebp
 004A779E    pop         edi
 004A779F    pop         esi
 004A77A0    pop         ebx
 004A77A1    ret
*}
end;

//004A77A4
function jpeg_start_decompress(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 004A77A4    push        ebx
 004A77A5    mov         ebx,eax
 004A77A7    cmp         dword ptr [ebx+14],0CA
>004A77AE    jne         004A77D2
 004A77B0    mov         eax,ebx
 004A77B2    call        @jinit_master_decompress
 004A77B7    cmp         dword ptr [ebx+40],0
>004A77BB    je          004A77CB
 004A77BD    mov         dword ptr [ebx+14],0CF
 004A77C4    mov         eax,1
 004A77C9    pop         ebx
 004A77CA    ret
 004A77CB    mov         dword ptr [ebx+14],0CB
 004A77D2    cmp         dword ptr [ebx+14],0CB
>004A77D9    jne         004A7843
 004A77DB    mov         edx,dword ptr [ebx+1B4]
 004A77E1    cmp         dword ptr [edx+10],0
>004A77E5    je          004A7835
 004A77E7    cmp         dword ptr [ebx+8],0
>004A77EB    je          004A77F4
 004A77ED    mov         eax,ebx
 004A77EF    mov         edx,dword ptr [eax+8]
 004A77F2    call        dword ptr [edx]
 004A77F4    mov         eax,ebx
 004A77F6    mov         edx,dword ptr [eax+1B4]
 004A77FC    call        dword ptr [edx]
 004A77FE    test        eax,eax
>004A7800    jne         004A7806
 004A7802    xor         eax,eax
 004A7804    pop         ebx
 004A7805    ret
 004A7806    cmp         eax,2
>004A7809    je          004A7835
 004A780B    cmp         dword ptr [ebx+8],0
>004A780F    je          004A77E7
 004A7811    cmp         eax,3
>004A7814    je          004A7819
 004A7816    dec         eax
>004A7817    jne         004A77E7
 004A7819    mov         edx,dword ptr [ebx+8]
 004A781C    inc         dword ptr [edx+4]
 004A781F    mov         ecx,dword ptr [edx+4]
 004A7822    mov         eax,dword ptr [ebx+8]
 004A7825    cmp         ecx,dword ptr [eax+8]
>004A7828    jl          004A77E7
 004A782A    mov         edx,dword ptr [ebx+140]
 004A7830    add         dword ptr [eax+8],edx
>004A7833    jmp         004A77E7
 004A7835    mov         ecx,dword ptr [ebx+90]
 004A783B    mov         dword ptr [ebx+98],ecx
>004A7841    jmp         004A7861
 004A7843    cmp         dword ptr [ebx+14],0CC
>004A784A    je          004A7861
 004A784C    mov         eax,dword ptr [ebx]
 004A784E    mov         dword ptr [eax+14],14
 004A7855    mov         edx,dword ptr [ebx+14]
 004A7858    mov         dword ptr [eax+18],edx
 004A785B    mov         eax,ebx
 004A785D    mov         edx,dword ptr [eax]
 004A785F    call        dword ptr [edx]
 004A7861    mov         eax,ebx
 004A7863    call        004A786C
 004A7868    pop         ebx
 004A7869    ret
*}
end;

//004A786C
{*function sub_004A786C(?:?):?;
begin
 004A786C    push        ebx
 004A786D    mov         ebx,eax
 004A786F    push        esi
 004A7870    push        edi
 004A7871    cmp         dword ptr [ebx+14],0CC
>004A7878    je          004A7901
 004A787E    mov         eax,ebx
 004A7880    mov         edx,dword ptr [eax+1A4]
 004A7886    call        dword ptr [edx]
 004A7888    xor         ecx,ecx
 004A788A    mov         dword ptr [ebx+8C],ecx
 004A7890    mov         dword ptr [ebx+14],0CC
>004A7897    jmp         004A7901
>004A7899    jmp         004A78D9
 004A789B    mov         eax,dword ptr [ebx+8]
 004A789E    test        eax,eax
>004A78A0    je          004A78B2
 004A78A2    mov         dword ptr [eax+4],edx
 004A78A5    mov         edx,dword ptr [ebx+74]
 004A78A8    mov         dword ptr [eax+8],edx
 004A78AB    mov         eax,ebx
 004A78AD    mov         edx,dword ptr [eax+8]
 004A78B0    call        dword ptr [edx]
 004A78B2    mov         eax,ebx
 004A78B4    mov         esi,dword ptr [ebx+8C]
 004A78BA    push        0
 004A78BC    lea         ecx,[ebx+8C]
 004A78C2    mov         edi,dword ptr [eax+1A8]
 004A78C8    xor         edx,edx
 004A78CA    call        dword ptr [edi+4]
 004A78CD    cmp         esi,dword ptr [ebx+8C]
>004A78D3    jne         004A78D9
 004A78D5    xor         eax,eax
>004A78D7    jmp         004A7927
 004A78D9    mov         edx,dword ptr [ebx+8C]
 004A78DF    cmp         edx,dword ptr [ebx+74]
>004A78E2    jb          004A789B
 004A78E4    mov         eax,ebx
 004A78E6    mov         edx,dword ptr [eax+1A4]
 004A78EC    call        dword ptr [edx+4]
 004A78EF    mov         eax,ebx
 004A78F1    mov         edx,dword ptr [eax+1A4]
 004A78F7    call        dword ptr [edx]
 004A78F9    xor         ecx,ecx
 004A78FB    mov         dword ptr [ebx+8C],ecx
 004A7901    mov         eax,dword ptr [ebx+1A4]
 004A7907    cmp         dword ptr [eax+8],0
>004A790B    jne         004A78D9
 004A790D    cmp         dword ptr [ebx+44],0
>004A7911    je          004A791A
 004A7913    mov         edx,0CE
>004A7918    jmp         004A791F
 004A791A    mov         edx,0CD
 004A791F    mov         dword ptr [ebx+14],edx
 004A7922    mov         eax,1
 004A7927    pop         edi
 004A7928    pop         esi
 004A7929    pop         ebx
 004A792A    ret
end;*}

//004A792C
function jpeg_read_scanlines(var cinfo:jpeg_decompress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;
begin
{*
 004A792C    push        ebx
 004A792D    mov         ebx,eax
 004A792F    push        esi
 004A7930    push        edi
 004A7931    push        ecx
 004A7932    mov         edi,ecx
 004A7934    cmp         dword ptr [ebx+14],0CD
 004A793B    mov         esi,edx
>004A793D    je          004A7954
 004A793F    mov         eax,dword ptr [ebx]
 004A7941    mov         dword ptr [eax+14],14
 004A7948    mov         edx,dword ptr [ebx+14]
 004A794B    mov         dword ptr [eax+18],edx
 004A794E    mov         eax,ebx
 004A7950    mov         edx,dword ptr [eax]
 004A7952    call        dword ptr [edx]
 004A7954    mov         ecx,dword ptr [ebx+8C]
 004A795A    cmp         ecx,dword ptr [ebx+74]
>004A795D    jb          004A7976
 004A795F    mov         eax,dword ptr [ebx]
 004A7961    mov         dword ptr [eax+14],7B
 004A7968    or          edx,0FFFFFFFF
 004A796B    mov         eax,ebx
 004A796D    mov         ecx,dword ptr [eax]
 004A796F    call        dword ptr [ecx+4]
 004A7972    xor         eax,eax
>004A7974    jmp         004A79B6
 004A7976    mov         eax,dword ptr [ebx+8]
 004A7979    test        eax,eax
>004A797B    je          004A7993
 004A797D    mov         edx,dword ptr [ebx+8C]
 004A7983    mov         dword ptr [eax+4],edx
 004A7986    mov         ecx,dword ptr [ebx+74]
 004A7989    mov         dword ptr [eax+8],ecx
 004A798C    mov         eax,ebx
 004A798E    mov         edx,dword ptr [eax+8]
 004A7991    call        dword ptr [edx]
 004A7993    xor         ecx,ecx
 004A7995    mov         eax,ebx
 004A7997    mov         dword ptr [esp],ecx
 004A799A    push        edi
 004A799B    mov         edx,esi
 004A799D    mov         esi,dword ptr [eax+1A8]
 004A79A3    lea         ecx,[esp+4]
 004A79A7    call        dword ptr [esi+4]
 004A79AA    mov         eax,dword ptr [esp]
 004A79AD    add         dword ptr [ebx+8C],eax
 004A79B3    mov         eax,dword ptr [esp]
 004A79B6    pop         edx
 004A79B7    pop         edi
 004A79B8    pop         esi
 004A79B9    pop         ebx
 004A79BA    ret
*}
end;

//004A7A68
function jpeg_start_output(var cinfo:jpeg_decompress_struct; scan_number:Integer):LongBool;
begin
{*
 004A7A68    push        ebx
 004A7A69    mov         ebx,eax
 004A7A6B    push        esi
 004A7A6C    mov         esi,edx
 004A7A6E    mov         eax,dword ptr [ebx+14]
 004A7A71    cmp         eax,0CF
>004A7A76    je          004A7A94
 004A7A78    cmp         eax,0CC
>004A7A7D    je          004A7A94
 004A7A7F    mov         eax,dword ptr [ebx]
 004A7A81    mov         dword ptr [eax+14],14
 004A7A88    mov         edx,dword ptr [ebx+14]
 004A7A8B    mov         dword ptr [eax+18],edx
 004A7A8E    mov         eax,ebx
 004A7A90    mov         edx,dword ptr [eax]
 004A7A92    call        dword ptr [edx]
 004A7A94    test        esi,esi
>004A7A96    jg          004A7A9D
 004A7A98    mov         esi,1
 004A7A9D    mov         eax,dword ptr [ebx+1B4]
 004A7AA3    cmp         dword ptr [eax+14],0
>004A7AA7    je          004A7AB7
 004A7AA9    cmp         esi,dword ptr [ebx+90]
>004A7AAF    jle         004A7AB7
 004A7AB1    mov         esi,dword ptr [ebx+90]
 004A7AB7    mov         dword ptr [ebx+98],esi
 004A7ABD    mov         eax,ebx
 004A7ABF    call        004A786C
 004A7AC4    pop         esi
 004A7AC5    pop         ebx
 004A7AC6    ret
*}
end;

//004A7AC8
function jpeg_finish_output(var cinfo:jpeg_decompress_struct):LongBool;
begin
{*
 004A7AC8    push        ebx
 004A7AC9    mov         ebx,eax
 004A7ACB    mov         eax,dword ptr [ebx+14]
 004A7ACE    cmp         eax,0CD
>004A7AD3    je          004A7ADC
 004A7AD5    cmp         eax,0CE
>004A7ADA    jne         004A7AF6
 004A7ADC    cmp         dword ptr [ebx+40],0
>004A7AE0    je          004A7AF6
 004A7AE2    mov         eax,ebx
 004A7AE4    mov         edx,dword ptr [eax+1A4]
 004A7AEA    call        dword ptr [edx+4]
 004A7AED    mov         dword ptr [ebx+14],0D0
>004A7AF4    jmp         004A7B28
 004A7AF6    cmp         dword ptr [ebx+14],0D0
>004A7AFD    je          004A7B28
 004A7AFF    mov         eax,dword ptr [ebx]
 004A7B01    mov         dword ptr [eax+14],14
 004A7B08    mov         edx,dword ptr [ebx+14]
 004A7B0B    mov         dword ptr [eax+18],edx
 004A7B0E    mov         eax,ebx
 004A7B10    mov         edx,dword ptr [eax]
 004A7B12    call        dword ptr [edx]
>004A7B14    jmp         004A7B28
 004A7B16    mov         eax,ebx
 004A7B18    mov         edx,dword ptr [eax+1B4]
 004A7B1E    call        dword ptr [edx]
 004A7B20    test        eax,eax
>004A7B22    jne         004A7B28
 004A7B24    xor         eax,eax
 004A7B26    pop         ebx
 004A7B27    ret
 004A7B28    mov         edx,dword ptr [ebx+90]
 004A7B2E    cmp         edx,dword ptr [ebx+98]
>004A7B34    jg          004A7B42
 004A7B36    mov         ecx,dword ptr [ebx+1B4]
 004A7B3C    cmp         dword ptr [ecx+14],0
>004A7B40    je          004A7B16
 004A7B42    mov         dword ptr [ebx+14],0CF
 004A7B49    mov         eax,1
 004A7B4E    pop         ebx
 004A7B4F    ret
*}
end;

//004A7B50
procedure _DF_.;
begin
{*
 004A7B50    push        ebx
 004A7B51    cmp         dword ptr [eax+4C],0
>004A7B55    jne         004A7B60
 004A7B57    cmp         dword ptr [eax+12C],0
>004A7B5E    je          004A7B64
 004A7B60    xor         eax,eax
 004A7B62    pop         ebx
 004A7B63    ret
 004A7B64    cmp         dword ptr [eax+28],3
>004A7B68    jne         004A7B7C
 004A7B6A    cmp         dword ptr [eax+24],3
>004A7B6E    jne         004A7B7C
 004A7B70    cmp         dword ptr [eax+2C],2
>004A7B74    jne         004A7B7C
 004A7B76    cmp         dword ptr [eax+78],3
>004A7B7A    je          004A7B80
 004A7B7C    xor         eax,eax
 004A7B7E    pop         ebx
 004A7B7F    ret
 004A7B80    mov         edx,dword ptr [eax+0D8]
 004A7B86    cmp         dword ptr [edx+8],2
>004A7B8A    jne         004A7BB0
 004A7B8C    cmp         dword ptr [edx+5C],1
>004A7B90    jne         004A7BB0
 004A7B92    cmp         dword ptr [edx+0B0],1
>004A7B99    jne         004A7BB0
 004A7B9B    cmp         dword ptr [edx+0C],2
>004A7B9F    jg          004A7BB0
 004A7BA1    cmp         dword ptr [edx+60],1
>004A7BA5    jne         004A7BB0
 004A7BA7    cmp         dword ptr [edx+0B4],1
>004A7BAE    je          004A7BB4
 004A7BB0    xor         eax,eax
 004A7BB2    pop         ebx
 004A7BB3    ret
 004A7BB4    mov         edx,dword ptr [eax+0D8]
 004A7BBA    mov         ebx,dword ptr [edx+24]
 004A7BBD    mov         ecx,dword ptr [eax+13C]
 004A7BC3    cmp         ebx,ecx
>004A7BC5    jne         004A7BD4
 004A7BC7    cmp         ecx,dword ptr [edx+78]
>004A7BCA    jne         004A7BD4
 004A7BCC    cmp         ecx,dword ptr [edx+0CC]
>004A7BD2    je          004A7BD8
 004A7BD4    xor         eax,eax
 004A7BD6    pop         ebx
 004A7BD7    ret
 004A7BD8    mov         eax,1
 004A7BDD    pop         ebx
 004A7BDE    ret
*}
end;

//004A7BE0
procedure jpeg_calc_output_dimensions(var cinfo:jpeg_decompress_struct);
begin
{*
 004A7BE0    push        ebx
 004A7BE1    mov         ebx,eax
 004A7BE3    push        esi
 004A7BE4    push        edi
 004A7BE5    cmp         dword ptr [ebx+14],0CA
>004A7BEC    je          004A7C03
 004A7BEE    mov         eax,dword ptr [ebx]
 004A7BF0    mov         dword ptr [eax+14],14
 004A7BF7    mov         edx,dword ptr [ebx+14]
 004A7BFA    mov         dword ptr [eax+18],edx
 004A7BFD    mov         eax,ebx
 004A7BFF    mov         edx,dword ptr [eax]
 004A7C01    call        dword ptr [edx]
 004A7C03    mov         ecx,dword ptr [ebx+30]
 004A7C06    shl         ecx,3
 004A7C09    cmp         ecx,dword ptr [ebx+34]
>004A7C0C    ja          004A7C3D
 004A7C0E    mov         edx,8
 004A7C13    mov         eax,dword ptr [ebx+1C]
 004A7C16    call        @jdiv_round_up
 004A7C1B    mov         dword ptr [ebx+70],eax
 004A7C1E    mov         edx,8
 004A7C23    mov         eax,dword ptr [ebx+20]
 004A7C26    call        @jdiv_round_up
 004A7C2B    mov         dword ptr [ebx+74],eax
 004A7C2E    mov         dword ptr [ebx+13C],1
>004A7C38    jmp         004A7CC0
 004A7C3D    mov         ecx,dword ptr [ebx+30]
 004A7C40    shl         ecx,2
 004A7C43    cmp         ecx,dword ptr [ebx+34]
>004A7C46    ja          004A7C74
 004A7C48    mov         edx,4
 004A7C4D    mov         eax,dword ptr [ebx+1C]
 004A7C50    call        @jdiv_round_up
 004A7C55    mov         dword ptr [ebx+70],eax
 004A7C58    mov         edx,4
 004A7C5D    mov         eax,dword ptr [ebx+20]
 004A7C60    call        @jdiv_round_up
 004A7C65    mov         dword ptr [ebx+74],eax
 004A7C68    mov         dword ptr [ebx+13C],2
>004A7C72    jmp         004A7CC0
 004A7C74    mov         ecx,dword ptr [ebx+30]
 004A7C77    add         ecx,ecx
 004A7C79    cmp         ecx,dword ptr [ebx+34]
>004A7C7C    ja          004A7CAA
 004A7C7E    mov         edx,2
 004A7C83    mov         eax,dword ptr [ebx+1C]
 004A7C86    call        @jdiv_round_up
 004A7C8B    mov         dword ptr [ebx+70],eax
 004A7C8E    mov         edx,2
 004A7C93    mov         eax,dword ptr [ebx+20]
 004A7C96    call        @jdiv_round_up
 004A7C9B    mov         dword ptr [ebx+74],eax
 004A7C9E    mov         dword ptr [ebx+13C],4
>004A7CA8    jmp         004A7CC0
 004A7CAA    mov         ecx,dword ptr [ebx+1C]
 004A7CAD    mov         dword ptr [ebx+70],ecx
 004A7CB0    mov         eax,dword ptr [ebx+20]
 004A7CB3    mov         dword ptr [ebx+74],eax
 004A7CB6    mov         dword ptr [ebx+13C],8
 004A7CC0    xor         edi,edi
 004A7CC2    mov         esi,dword ptr [ebx+0D8]
>004A7CC8    jmp         004A7D12
 004A7CCA    mov         eax,dword ptr [ebx+13C]
>004A7CD0    jmp         004A7CD4
 004A7CD2    add         eax,eax
 004A7CD4    cmp         eax,8
>004A7CD7    jge         004A7D0B
 004A7CD9    mov         edx,dword ptr [esi+8]
 004A7CDC    imul        edx,eax
 004A7CDF    add         edx,edx
 004A7CE1    mov         ecx,dword ptr [ebx+134]
 004A7CE7    imul        ecx,dword ptr [ebx+13C]
 004A7CEE    cmp         edx,ecx
>004A7CF0    jg          004A7D0B
 004A7CF2    mov         edx,dword ptr [esi+0C]
 004A7CF5    imul        edx,eax
 004A7CF8    add         edx,edx
 004A7CFA    mov         ecx,dword ptr [ebx+138]
 004A7D00    imul        ecx,dword ptr [ebx+13C]
 004A7D07    cmp         edx,ecx
>004A7D09    jle         004A7CD2
 004A7D0B    mov         dword ptr [esi+24],eax
 004A7D0E    inc         edi
 004A7D0F    add         esi,54
 004A7D12    cmp         edi,dword ptr [ebx+24]
>004A7D15    jl          004A7CCA
 004A7D17    xor         edi,edi
 004A7D19    mov         esi,dword ptr [ebx+0D8]
>004A7D1F    jmp         004A7D59
 004A7D21    mov         eax,dword ptr [esi+8]
 004A7D24    imul        dword ptr [esi+24]
 004A7D27    imul        dword ptr [ebx+1C]
 004A7D2A    mov         edx,dword ptr [ebx+134]
 004A7D30    shl         edx,3
 004A7D33    call        @jdiv_round_up
 004A7D38    mov         dword ptr [esi+28],eax
 004A7D3B    mov         eax,dword ptr [esi+0C]
 004A7D3E    imul        dword ptr [esi+24]
 004A7D41    imul        dword ptr [ebx+20]
 004A7D44    mov         edx,dword ptr [ebx+138]
 004A7D4A    shl         edx,3
 004A7D4D    call        @jdiv_round_up
 004A7D52    mov         dword ptr [esi+2C],eax
 004A7D55    inc         edi
 004A7D56    add         esi,54
 004A7D59    cmp         edi,dword ptr [ebx+24]
>004A7D5C    jl          004A7D21
 004A7D5E    mov         ecx,dword ptr [ebx+2C]
 004A7D61    dec         ecx
>004A7D62    je          004A7D71
 004A7D64    dec         ecx
 004A7D65    sub         ecx,2
>004A7D68    jb          004A7D7A
 004A7D6A    sub         ecx,2
>004A7D6D    jb          004A7D83
>004A7D6F    jmp         004A7D8C
 004A7D71    mov         dword ptr [ebx+78],1
>004A7D78    jmp         004A7D92
 004A7D7A    mov         dword ptr [ebx+78],3
>004A7D81    jmp         004A7D92
 004A7D83    mov         dword ptr [ebx+78],4
>004A7D8A    jmp         004A7D92
 004A7D8C    mov         eax,dword ptr [ebx+24]
 004A7D8F    mov         dword ptr [ebx+78],eax
 004A7D92    cmp         dword ptr [ebx+54],0
>004A7D96    je          004A7D9F
 004A7D98    mov         edx,1
>004A7D9D    jmp         004A7DA2
 004A7D9F    mov         edx,dword ptr [ebx+78]
 004A7DA2    mov         dword ptr [ebx+7C],edx
 004A7DA5    mov         eax,ebx
 004A7DA7    call        _DF_.
 004A7DAC    test        eax,eax
>004A7DAE    je          004A7DBE
 004A7DB0    mov         ecx,dword ptr [ebx+138]
 004A7DB6    mov         dword ptr [ebx+80],ecx
>004A7DBC    jmp         004A7DC8
 004A7DBE    mov         dword ptr [ebx+80],1
 004A7DC8    pop         edi
 004A7DC9    pop         esi
 004A7DCA    pop         ebx
 004A7DCB    ret
*}
end;

//004A7DCC
{*procedure sub_004A7DCC(?:?);
begin
 004A7DCC    push        ebx
 004A7DCD    mov         ebx,eax
 004A7DCF    mov         eax,ebx
 004A7DD1    push        esi
 004A7DD2    mov         ecx,580
 004A7DD7    mov         edx,1
 004A7DDC    mov         esi,dword ptr [eax+4]
 004A7DDF    call        dword ptr [esi]
 004A7DE1    mov         esi,eax
 004A7DE3    add         esi,100
 004A7DE9    mov         dword ptr [ebx+144],esi
 004A7DEF    push        100
 004A7DF4    push        0
 004A7DF6    lea         eax,[esi-100]
 004A7DFC    push        eax
 004A7DFD    call        _memset
 004A7E02    add         esp,0C
 004A7E05    xor         eax,eax
 004A7E07    mov         edx,esi
 004A7E09    mov         byte ptr [edx],al
 004A7E0B    inc         eax
 004A7E0C    inc         edx
 004A7E0D    cmp         eax,0FF
>004A7E12    jle         004A7E09
 004A7E14    add         esi,80
 004A7E1A    mov         eax,80
 004A7E1F    lea         edx,[esi+80]
 004A7E25    mov         byte ptr [edx],0FF
 004A7E28    inc         eax
 004A7E29    inc         edx
 004A7E2A    cmp         eax,200
>004A7E2F    jl          004A7E25
 004A7E31    push        180
 004A7E36    push        0
 004A7E38    lea         ecx,[esi+200]
 004A7E3E    push        ecx
 004A7E3F    call        _memset
 004A7E44    add         esp,0C
 004A7E47    push        80
 004A7E4C    mov         eax,dword ptr [ebx+144]
 004A7E52    push        eax
 004A7E53    add         esi,380
 004A7E59    push        esi
 004A7E5A    call        _memcpy
 004A7E5F    add         esp,0C
 004A7E62    pop         esi
 004A7E63    pop         ebx
 004A7E64    ret
end;*}

//004A7E68
{*procedure sub_004A7E68(?:?);
begin
 004A7E68    push        ebx
 004A7E69    mov         ebx,eax
 004A7E6B    push        esi
 004A7E6C    mov         eax,ebx
 004A7E6E    mov         esi,dword ptr [ebx+1A4]
 004A7E74    call        jpeg_calc_output_dimensions
 004A7E79    mov         eax,ebx
 004A7E7B    call        004A7DCC
 004A7E80    mov         eax,dword ptr [ebx+70]
 004A7E83    imul        dword ptr [ebx+78]
 004A7E86    mov         edx,eax
 004A7E88    cmp         eax,edx
>004A7E8A    je          004A7E9B
 004A7E8C    mov         ecx,dword ptr [ebx]
 004A7E8E    mov         eax,ebx
 004A7E90    mov         dword ptr [ecx+14],46
 004A7E97    mov         edx,dword ptr [eax]
 004A7E99    call        dword ptr [edx]
 004A7E9B    xor         ecx,ecx
 004A7E9D    mov         eax,ebx
 004A7E9F    mov         dword ptr [esi+0C],ecx
 004A7EA2    call        _DF_.
 004A7EA7    mov         dword ptr [esi+10],eax
 004A7EAA    xor         edx,edx
 004A7EAC    mov         dword ptr [esi+14],edx
 004A7EAF    xor         ecx,ecx
 004A7EB1    mov         dword ptr [esi+18],ecx
 004A7EB4    cmp         dword ptr [ebx+54],0
>004A7EB8    je          004A7EC0
 004A7EBA    cmp         dword ptr [ebx+40],0
>004A7EBE    jne         004A7ECF
 004A7EC0    xor         eax,eax
 004A7EC2    mov         dword ptr [ebx+64],eax
 004A7EC5    xor         edx,edx
 004A7EC7    mov         dword ptr [ebx+68],edx
 004A7ECA    xor         ecx,ecx
 004A7ECC    mov         dword ptr [ebx+6C],ecx
 004A7ECF    cmp         dword ptr [ebx+54],0
>004A7ED3    je          004A7F69
 004A7ED9    cmp         dword ptr [ebx+44],0
>004A7EDD    je          004A7EEE
 004A7EDF    mov         eax,dword ptr [ebx]
 004A7EE1    mov         dword ptr [eax+14],2F
 004A7EE8    mov         eax,ebx
 004A7EEA    mov         edx,dword ptr [eax]
 004A7EEC    call        dword ptr [edx]
 004A7EEE    cmp         dword ptr [ebx+78],3
>004A7EF2    je          004A7F0F
 004A7EF4    mov         dword ptr [ebx+64],1
 004A7EFB    xor         ecx,ecx
 004A7EFD    mov         dword ptr [ebx+68],ecx
 004A7F00    xor         eax,eax
 004A7F02    mov         dword ptr [ebx+6C],eax
 004A7F05    xor         edx,edx
 004A7F07    mov         dword ptr [ebx+88],edx
>004A7F0D    jmp         004A7F37
 004A7F0F    cmp         dword ptr [ebx+88],0
>004A7F16    je          004A7F21
 004A7F18    mov         dword ptr [ebx+68],1
>004A7F1F    jmp         004A7F37
 004A7F21    cmp         dword ptr [ebx+5C],0
>004A7F25    je          004A7F30
 004A7F27    mov         dword ptr [ebx+6C],1
>004A7F2E    jmp         004A7F37
 004A7F30    mov         dword ptr [ebx+64],1
 004A7F37    cmp         dword ptr [ebx+64],0
>004A7F3B    je          004A7F4D
 004A7F3D    mov         eax,ebx
 004A7F3F    call        @jinit_1pass_quantizer
 004A7F44    mov         edx,dword ptr [ebx+1CC]
 004A7F4A    mov         dword ptr [esi+14],edx
 004A7F4D    cmp         dword ptr [ebx+6C],0
>004A7F51    jne         004A7F59
 004A7F53    cmp         dword ptr [ebx+68],0
>004A7F57    je          004A7F69
 004A7F59    mov         eax,ebx
 004A7F5B    call        @jinit_2pass_quantizer
 004A7F60    mov         edx,dword ptr [ebx+1CC]
 004A7F66    mov         dword ptr [esi+18],edx
 004A7F69    cmp         dword ptr [ebx+44],0
>004A7F6D    jne         004A7F96
 004A7F6F    cmp         dword ptr [esi+10],0
>004A7F73    je          004A7F7E
 004A7F75    mov         eax,ebx
 004A7F77    call        @jinit_merged_upsampler
>004A7F7C    jmp         004A7F8C
 004A7F7E    mov         eax,ebx
 004A7F80    call        @jinit_color_deconverter
 004A7F85    mov         eax,ebx
 004A7F87    call        @jinit_upsampler
 004A7F8C    mov         edx,dword ptr [ebx+6C]
 004A7F8F    mov         eax,ebx
 004A7F91    call        @jinit_d_post_controller
 004A7F96    mov         eax,ebx
 004A7F98    call        @jinit_inverse_dct
 004A7F9D    cmp         dword ptr [ebx+0E0],0
>004A7FA4    je          004A7FB7
 004A7FA6    mov         edx,dword ptr [ebx]
 004A7FA8    mov         eax,ebx
 004A7FAA    mov         dword ptr [edx+14],1
 004A7FB1    mov         edx,dword ptr [eax]
 004A7FB3    call        dword ptr [edx]
>004A7FB5    jmp         004A7FD0
 004A7FB7    cmp         dword ptr [ebx+0DC],0
>004A7FBE    je          004A7FC9
 004A7FC0    mov         eax,ebx
 004A7FC2    call        @jinit_phuff_decoder
>004A7FC7    jmp         004A7FD0
 004A7FC9    mov         eax,ebx
 004A7FCB    call        @jinit_huff_decoder
 004A7FD0    mov         edx,dword ptr [ebx+1B4]
 004A7FD6    cmp         dword ptr [edx+10],0
>004A7FDA    jne         004A7FE6
 004A7FDC    cmp         dword ptr [ebx+40],0
>004A7FE0    jne         004A7FE6
 004A7FE2    xor         eax,eax
>004A7FE4    jmp         004A7FEB
 004A7FE6    mov         eax,1
 004A7FEB    mov         edx,eax
 004A7FED    mov         eax,ebx
 004A7FEF    call        @jinit_d_coef_controller
 004A7FF4    cmp         dword ptr [ebx+44],0
>004A7FF8    jne         004A8003
 004A7FFA    xor         edx,edx
 004A7FFC    mov         eax,ebx
 004A7FFE    call        @jinit_d_main_controller
 004A8003    mov         eax,ebx
 004A8005    mov         edx,dword ptr [eax+4]
 004A8008    call        dword ptr [edx+18]
 004A800B    mov         eax,ebx
 004A800D    mov         edx,dword ptr [eax+1B4]
 004A8013    call        dword ptr [edx+8]
 004A8016    cmp         dword ptr [ebx+8],0
>004A801A    je          004A8079
 004A801C    cmp         dword ptr [ebx+40],0
>004A8020    jne         004A8079
 004A8022    mov         ecx,dword ptr [ebx+1B4]
 004A8028    cmp         dword ptr [ecx+10],0
>004A802C    je          004A8079
 004A802E    cmp         dword ptr [ebx+0DC],0
>004A8035    je          004A8042
 004A8037    mov         edx,dword ptr [ebx+24]
 004A803A    lea         edx,[edx+edx*2]
 004A803D    add         edx,2
>004A8040    jmp         004A8045
 004A8042    mov         edx,dword ptr [ebx+24]
 004A8045    mov         eax,dword ptr [ebx+8]
 004A8048    xor         ecx,ecx
 004A804A    mov         dword ptr [eax+4],ecx
 004A804D    mov         ecx,dword ptr [ebx+140]
 004A8053    imul        ecx,edx
 004A8056    mov         dword ptr [eax+8],ecx
 004A8059    xor         edx,edx
 004A805B    mov         dword ptr [eax+0C],edx
 004A805E    cmp         dword ptr [ebx+6C],0
>004A8062    je          004A806B
 004A8064    mov         eax,3
>004A8069    jmp         004A8070
 004A806B    mov         eax,2
 004A8070    mov         edx,dword ptr [ebx+8]
 004A8073    mov         dword ptr [edx+10],eax
 004A8076    inc         dword ptr [esi+0C]
 004A8079    pop         esi
 004A807A    pop         ebx
 004A807B    ret
end;*}

//004A8258
procedure @jinit_master_decompress;
begin
{*
 004A8258    push        ebx
 004A8259    mov         ebx,eax
 004A825B    mov         eax,ebx
 004A825D    push        esi
 004A825E    mov         ecx,1C
 004A8263    mov         edx,1
 004A8268    mov         esi,dword ptr [eax+4]
 004A826B    call        dword ptr [esi]
 004A826D    mov         dword ptr [ebx+1A4],eax
 004A8273    mov         dword ptr [eax],4A807C
 004A8279    mov         dword ptr [eax+4],4A81D0
 004A8280    xor         edx,edx
 004A8282    mov         dword ptr [eax+8],edx
 004A8285    mov         eax,ebx
 004A8287    call        004A7E68
 004A828C    pop         esi
 004A828D    pop         ebx
 004A828E    ret
*}
end;

//004A8290
procedure _DF_.;
begin
{*
 004A8290    push        ebx
 004A8291    push        esi
 004A8292    mov         ebx,eax
 004A8294    push        edi
 004A8295    push        ebp
 004A8296    add         esp,0FFFFFFEC
 004A8299    cmp         dword ptr [ebx+190],0
 004A82A0    sete        al
 004A82A3    and         eax,1
 004A82A6    mov         ebp,dword ptr [ebx+1BC]
 004A82AC    mov         dword ptr [esp],eax
 004A82AF    xor         eax,eax
 004A82B1    cmp         dword ptr [esp],0
>004A82B5    je          004A82C7
 004A82B7    cmp         dword ptr [ebx+194],0
>004A82BE    je          004A82ED
 004A82C0    mov         eax,1
>004A82C5    jmp         004A82ED
 004A82C7    mov         edx,dword ptr [ebx+194]
 004A82CD    cmp         edx,dword ptr [ebx+190]
>004A82D3    jl          004A82DA
 004A82D5    cmp         edx,40
>004A82D8    jl          004A82DF
 004A82DA    mov         eax,1
 004A82DF    cmp         dword ptr [ebx+148],1
>004A82E6    je          004A82ED
 004A82E8    mov         eax,1
 004A82ED    mov         edx,dword ptr [ebx+198]
 004A82F3    test        edx,edx
>004A82F5    je          004A8305
 004A82F7    dec         edx
 004A82F8    cmp         edx,dword ptr [ebx+19C]
>004A82FE    je          004A8305
 004A8300    mov         eax,1
 004A8305    cmp         dword ptr [ebx+19C],0D
>004A830C    jle         004A8313
 004A830E    mov         eax,1
 004A8313    test        eax,eax
>004A8315    je          004A834A
 004A8317    mov         eax,dword ptr [ebx]
 004A8319    mov         dword ptr [eax+14],10
 004A8320    mov         edx,dword ptr [ebx+190]
 004A8326    mov         dword ptr [eax+18],edx
 004A8329    mov         ecx,dword ptr [ebx+194]
 004A832F    mov         dword ptr [eax+1C],ecx
 004A8332    mov         edx,dword ptr [ebx+198]
 004A8338    mov         dword ptr [eax+20],edx
 004A833B    mov         ecx,dword ptr [ebx+19C]
 004A8341    mov         dword ptr [eax+24],ecx
 004A8344    mov         eax,ebx
 004A8346    mov         edx,dword ptr [eax]
 004A8348    call        dword ptr [edx]
 004A834A    xor         eax,eax
 004A834C    mov         dword ptr [esp+4],eax
 004A8350    lea         ecx,[ebx+14C]
 004A8356    mov         dword ptr [esp+0C],ecx
>004A835A    jmp         004A83FD
 004A835F    mov         eax,dword ptr [esp+0C]
 004A8363    mov         edx,dword ptr [eax]
 004A8365    mov         ecx,dword ptr [edx+4]
 004A8368    mov         dword ptr [esp+8],ecx
 004A836C    mov         esi,dword ptr [esp+8]
 004A8370    shl         esi,8
 004A8373    add         esi,dword ptr [ebx+0A0]
 004A8379    cmp         dword ptr [esp],0
>004A837D    jne         004A83A3
 004A837F    cmp         dword ptr [esi],0
>004A8382    jge         004A83A3
 004A8384    mov         eax,dword ptr [ebx]
 004A8386    xor         ecx,ecx
 004A8388    mov         dword ptr [eax+14],73
 004A838F    mov         edx,dword ptr [esp+8]
 004A8393    mov         dword ptr [eax+18],edx
 004A8396    mov         dword ptr [eax+1C],ecx
 004A8399    mov         eax,ebx
 004A839B    or          edx,0FFFFFFFF
 004A839E    mov         ecx,dword ptr [eax]
 004A83A0    call        dword ptr [ecx+4]
 004A83A3    mov         edi,dword ptr [ebx+190]
 004A83A9    lea         eax,[esi+edi*4]
 004A83AC    mov         esi,eax
>004A83AE    jmp         004A83EC
 004A83B0    cmp         dword ptr [esi],0
>004A83B3    jge         004A83B9
 004A83B5    xor         eax,eax
>004A83B7    jmp         004A83BB
 004A83B9    mov         eax,dword ptr [esi]
 004A83BB    cmp         eax,dword ptr [ebx+198]
>004A83C1    je          004A83E0
 004A83C3    mov         eax,dword ptr [ebx]
 004A83C5    mov         dword ptr [eax+14],73
 004A83CC    mov         edx,dword ptr [esp+8]
 004A83D0    mov         dword ptr [eax+18],edx
 004A83D3    mov         dword ptr [eax+1C],edi
 004A83D6    or          edx,0FFFFFFFF
 004A83D9    mov         eax,ebx
 004A83DB    mov         ecx,dword ptr [eax]
 004A83DD    call        dword ptr [ecx+4]
 004A83E0    mov         eax,dword ptr [ebx+19C]
 004A83E6    mov         dword ptr [esi],eax
 004A83E8    inc         edi
 004A83E9    add         esi,4
 004A83EC    cmp         edi,dword ptr [ebx+194]
>004A83F2    jle         004A83B0
 004A83F4    inc         dword ptr [esp+4]
 004A83F8    add         dword ptr [esp+0C],4
 004A83FD    mov         edx,dword ptr [esp+4]
 004A8401    cmp         edx,dword ptr [ebx+148]
>004A8407    jl          004A835F
 004A840D    cmp         dword ptr [ebx+198],0
>004A8414    jne         004A842E
 004A8416    cmp         dword ptr [esp],0
>004A841A    je          004A8425
 004A841C    mov         dword ptr [ebp+4],4A8558
>004A8423    jmp         004A8444
 004A8425    mov         dword ptr [ebp+4],4A8794
>004A842C    jmp         004A8444
 004A842E    cmp         dword ptr [esp],0
>004A8432    je          004A843D
 004A8434    mov         dword ptr [ebp+4],4A8A20
>004A843B    jmp         004A8444
 004A843D    mov         dword ptr [ebp+4],4A8B18
 004A8444    xor         ecx,ecx
 004A8446    lea         eax,[ebp+18]
 004A8449    mov         dword ptr [esp+4],ecx
 004A844D    mov         dword ptr [esp+10],eax
 004A8451    lea         edi,[ebx+14C]
>004A8457    jmp         004A84B0
 004A8459    mov         eax,dword ptr [edi]
 004A845B    cmp         dword ptr [esp],0
>004A845F    je          004A8482
 004A8461    cmp         dword ptr [ebx+198],0
>004A8468    jne         004A849C
 004A846A    mov         esi,dword ptr [eax+14]
 004A846D    mov         edx,1
 004A8472    mov         ecx,esi
 004A8474    lea         eax,[ebp+esi*4+2C]
 004A8478    push        eax
 004A8479    mov         eax,ebx
 004A847B    call        @jpeg_make_d_derived_tbl
>004A8480    jmp         004A849C
 004A8482    mov         esi,dword ptr [eax+18]
 004A8485    xor         edx,edx
 004A8487    mov         ecx,esi
 004A8489    lea         eax,[ebp+esi*4+2C]
 004A848D    push        eax
 004A848E    mov         eax,ebx
 004A8490    call        @jpeg_make_d_derived_tbl
 004A8495    mov         edx,dword ptr [ebp+esi*4+2C]
 004A8499    mov         dword ptr [ebp+3C],edx
 004A849C    mov         ecx,dword ptr [esp+10]
 004A84A0    xor         eax,eax
 004A84A2    mov         dword ptr [ecx],eax
 004A84A4    inc         dword ptr [esp+4]
 004A84A8    add         dword ptr [esp+10],4
 004A84AD    add         edi,4
 004A84B0    mov         edx,dword ptr [esp+4]
 004A84B4    cmp         edx,dword ptr [ebx+148]
>004A84BA    jl          004A8459
 004A84BC    xor         ecx,ecx
 004A84BE    xor         eax,eax
 004A84C0    mov         dword ptr [ebp+10],ecx
 004A84C3    mov         dword ptr [ebp+0C],eax
 004A84C6    xor         edx,edx
 004A84C8    xor         ecx,ecx
 004A84CA    mov         dword ptr [ebp+8],edx
 004A84CD    mov         dword ptr [ebp+14],ecx
 004A84D0    mov         eax,dword ptr [ebx+114]
 004A84D6    mov         dword ptr [ebp+28],eax
 004A84D9    add         esp,14
 004A84DC    pop         ebp
 004A84DD    pop         edi
 004A84DE    pop         esi
 004A84DF    pop         ebx
 004A84E0    ret
*}
end;

//004A8F44
procedure @jinit_phuff_decoder;
begin
{*
 004A8F44    push        ebx
 004A8F45    mov         ebx,eax
 004A8F47    mov         eax,ebx
 004A8F49    push        esi
 004A8F4A    mov         ecx,40
 004A8F4F    mov         edx,1
 004A8F54    mov         esi,dword ptr [eax+4]
 004A8F57    call        dword ptr [esi]
 004A8F59    mov         edx,eax
 004A8F5B    mov         dword ptr [ebx+1BC],edx
 004A8F61    mov         dword ptr [edx],4A8290;_DF_.
 004A8F67    xor         eax,eax
 004A8F69    lea         ecx,[edx+2C]
 004A8F6C    mov         edx,ecx
 004A8F6E    xor         ecx,ecx
 004A8F70    inc         eax
 004A8F71    mov         dword ptr [edx],ecx
 004A8F73    add         edx,4
 004A8F76    cmp         eax,4
>004A8F79    jl          004A8F6E
 004A8F7B    mov         eax,ebx
 004A8F7D    mov         ecx,dword ptr [ebx+24]
 004A8F80    shl         ecx,6
 004A8F83    mov         edx,1
 004A8F88    mov         esi,dword ptr [eax+4]
 004A8F8B    shl         ecx,2
 004A8F8E    call        dword ptr [esi]
 004A8F90    mov         esi,eax
 004A8F92    mov         dword ptr [ebx+0A0],esi
 004A8F98    mov         edx,esi
 004A8F9A    xor         ecx,ecx
>004A8F9C    jmp         004A8FB0
 004A8F9E    xor         eax,eax
 004A8FA0    mov         dword ptr [edx],0FFFFFFFF
 004A8FA6    add         edx,4
 004A8FA9    inc         eax
 004A8FAA    cmp         eax,40
>004A8FAD    jl          004A8FA0
 004A8FAF    inc         ecx
 004A8FB0    cmp         ecx,dword ptr [ebx+24]
>004A8FB3    jl          004A8F9E
 004A8FB5    pop         esi
 004A8FB6    pop         ebx
 004A8FB7    ret
*}
end;

//004A8FB8
procedure _DF_.;
begin
{*
 004A8FB8    push        ebx
 004A8FB9    mov         ebx,eax
 004A8FBB    push        esi
 004A8FBC    push        edi
 004A8FBD    add         esp,0FFFFFFF0
 004A8FC0    mov         esi,dword ptr [ebx+1BC]
 004A8FC6    cmp         dword ptr [ebx+190],0
>004A8FCD    jne         004A8FEA
 004A8FCF    cmp         dword ptr [ebx+194],3F
>004A8FD6    jne         004A8FEA
 004A8FD8    cmp         dword ptr [ebx+198],0
>004A8FDF    jne         004A8FEA
 004A8FE1    cmp         dword ptr [ebx+19C],0
>004A8FE8    je          004A8FFD
 004A8FEA    mov         eax,dword ptr [ebx]
 004A8FEC    mov         dword ptr [eax+14],7A
 004A8FF3    or          edx,0FFFFFFFF
 004A8FF6    mov         eax,ebx
 004A8FF8    mov         ecx,dword ptr [eax]
 004A8FFA    call        dword ptr [ecx+4]
 004A8FFD    xor         edx,edx
 004A8FFF    mov         dword ptr [esp],edx
 004A9002    lea         eax,[esi+14]
 004A9005    mov         dword ptr [esp+0C],eax
 004A9009    lea         edx,[ebx+14C]
 004A900F    mov         dword ptr [esp+8],edx
>004A9013    jmp         004A9059
 004A9015    mov         ecx,dword ptr [esp+8]
 004A9019    mov         edx,dword ptr [ecx]
 004A901B    mov         eax,dword ptr [edx+14]
 004A901E    mov         edi,dword ptr [edx+18]
 004A9021    mov         ecx,eax
 004A9023    lea         edx,[esi+eax*4+28]
 004A9027    push        edx
 004A9028    mov         edx,1
 004A902D    mov         eax,ebx
 004A902F    call        @jpeg_make_d_derived_tbl
 004A9034    lea         ecx,[esi+edi*4+38]
 004A9038    xor         edx,edx
 004A903A    push        ecx
 004A903B    mov         ecx,edi
 004A903D    mov         eax,ebx
 004A903F    call        @jpeg_make_d_derived_tbl
 004A9044    mov         eax,dword ptr [esp+0C]
 004A9048    xor         edx,edx
 004A904A    mov         dword ptr [eax],edx
 004A904C    inc         dword ptr [esp]
 004A904F    add         dword ptr [esp+0C],4
 004A9054    add         dword ptr [esp+8],4
 004A9059    mov         ecx,dword ptr [ebx+148]
 004A905F    cmp         ecx,dword ptr [esp]
>004A9062    jg          004A9015
 004A9064    xor         eax,eax
 004A9066    mov         dword ptr [esp+4],eax
 004A906A    lea         eax,[esi+48]
 004A906D    lea         ecx,[ebx+168]
>004A9073    jmp         004A90C5
 004A9075    mov         edx,dword ptr [ecx]
 004A9077    mov         dword ptr [esp],edx
 004A907A    mov         edx,dword ptr [esp]
 004A907D    mov         edx,dword ptr [ebx+edx*4+14C]
 004A9084    mov         edi,dword ptr [edx+14]
 004A9087    mov         edi,dword ptr [esi+edi*4+28]
 004A908B    mov         dword ptr [eax],edi
 004A908D    mov         edi,dword ptr [edx+18]
 004A9090    mov         edi,dword ptr [esi+edi*4+38]
 004A9094    mov         dword ptr [eax+28],edi
 004A9097    cmp         dword ptr [edx+30],0
>004A909B    je          004A90B3
 004A909D    mov         dword ptr [eax+50],1
 004A90A4    cmp         dword ptr [edx+24],1
 004A90A8    setg        dl
 004A90AB    and         edx,1
 004A90AE    mov         dword ptr [eax+78],edx
>004A90B1    jmp         004A90BB
 004A90B3    xor         edx,edx
 004A90B5    mov         dword ptr [eax+78],edx
 004A90B8    mov         dword ptr [eax+50],edx
 004A90BB    inc         dword ptr [esp+4]
 004A90BF    add         eax,4
 004A90C2    add         ecx,4
 004A90C5    mov         edx,dword ptr [ebx+164]
 004A90CB    cmp         edx,dword ptr [esp+4]
>004A90CF    jg          004A9075
 004A90D1    xor         eax,eax
 004A90D3    xor         ecx,ecx
 004A90D5    mov         dword ptr [esi+10],eax
 004A90D8    xor         eax,eax
 004A90DA    mov         dword ptr [esi+0C],ecx
 004A90DD    mov         dword ptr [esi+8],eax
 004A90E0    mov         edx,dword ptr [ebx+114]
 004A90E6    mov         dword ptr [esi+24],edx
 004A90E9    add         esp,10
 004A90EC    pop         edi
 004A90ED    pop         esi
 004A90EE    pop         ebx
 004A90EF    ret
*}
end;

//004A90F0
procedure @jpeg_make_d_derived_tbl;
begin
{*
 004A90F0    push        ebp
 004A90F1    mov         ebp,esp
 004A90F3    add         esp,0FFFFFAC8
 004A90F9    push        ebx
 004A90FA    push        esi
 004A90FB    mov         dword ptr [ebp-8],edx
 004A90FE    mov         dword ptr [ebp-4],eax
 004A9101    mov         esi,ecx
 004A9103    mov         ebx,dword ptr [ebp+8]
 004A9106    test        esi,esi
>004A9108    jl          004A910F
 004A910A    cmp         esi,4
>004A910D    jl          004A9125
 004A910F    mov         eax,dword ptr [ebp-4]
 004A9112    mov         eax,dword ptr [eax]
 004A9114    mov         dword ptr [eax+14],32
 004A911B    mov         dword ptr [eax+18],esi
 004A911E    mov         eax,dword ptr [ebp-4]
 004A9121    mov         edx,dword ptr [eax]
 004A9123    call        dword ptr [edx]
 004A9125    cmp         dword ptr [ebp-8],0
>004A9129    je          004A9137
 004A912B    mov         ecx,dword ptr [ebp-4]
 004A912E    mov         eax,dword ptr [ecx+esi*4+0B4]
>004A9135    jmp         004A9141
 004A9137    mov         edx,dword ptr [ebp-4]
 004A913A    mov         eax,dword ptr [edx+esi*4+0C4]
 004A9141    mov         dword ptr [ebp-0C],eax
 004A9144    cmp         dword ptr [ebp-0C],0
>004A9148    jne         004A9160
 004A914A    mov         edx,dword ptr [ebp-4]
 004A914D    mov         eax,dword ptr [edx]
 004A914F    mov         dword ptr [eax+14],32
 004A9156    mov         dword ptr [eax+18],esi
 004A9159    mov         eax,dword ptr [ebp-4]
 004A915C    mov         edx,dword ptr [eax]
 004A915E    call        dword ptr [edx]
 004A9160    cmp         dword ptr [ebx],0
>004A9163    jne         004A9179
 004A9165    mov         eax,dword ptr [ebp-4]
 004A9168    mov         ecx,590
 004A916D    mov         edx,1
 004A9172    mov         esi,dword ptr [eax+4]
 004A9175    call        dword ptr [esi]
 004A9177    mov         dword ptr [ebx],eax
 004A9179    mov         eax,dword ptr [ebx]
 004A917B    mov         esi,1
 004A9180    mov         dword ptr [ebp-10],eax
 004A9183    xor         eax,eax
 004A9185    mov         edx,dword ptr [ebp-10]
 004A9188    mov         ecx,dword ptr [ebp-0C]
 004A918B    mov         dword ptr [edx+8C],ecx
 004A9191    mov         dword ptr [ebp-14],eax
 004A9194    mov         eax,dword ptr [ebp-0C]
 004A9197    lea         ebx,[eax+1]
 004A919A    xor         eax,eax
 004A919C    mov         al,byte ptr [ebx]
 004A919E    mov         dword ptr [ebp-18],eax
 004A91A1    cmp         dword ptr [ebp-18],0
>004A91A5    jl          004A91B5
 004A91A7    mov         edx,dword ptr [ebp-14]
 004A91AA    add         edx,dword ptr [ebp-18]
 004A91AD    cmp         edx,100
>004A91B3    jle         004A91C8
 004A91B5    mov         ecx,dword ptr [ebp-4]
 004A91B8    mov         eax,dword ptr [ecx]
 004A91BA    mov         dword ptr [eax+14],8
 004A91C1    mov         eax,dword ptr [ebp-4]
 004A91C4    mov         edx,dword ptr [eax]
 004A91C6    call        dword ptr [edx]
 004A91C8    mov         ecx,dword ptr [ebp-14]
 004A91CB    lea         eax,[ebp+ecx-134]
>004A91D2    jmp         004A91DC
 004A91D4    mov         edx,esi
 004A91D6    mov         byte ptr [eax],dl
 004A91D8    inc         dword ptr [ebp-14]
 004A91DB    inc         eax
 004A91DC    mov         ecx,dword ptr [ebp-18]
 004A91DF    add         dword ptr [ebp-18],0FFFFFFFF
 004A91E3    test        ecx,ecx
>004A91E5    jne         004A91D4
 004A91E7    inc         esi
 004A91E8    inc         ebx
 004A91E9    cmp         esi,10
>004A91EC    jle         004A919A
 004A91EE    mov         eax,dword ptr [ebp-14]
 004A91F1    xor         ebx,ebx
 004A91F3    mov         byte ptr [ebp+eax-134],0
 004A91FB    mov         edx,dword ptr [ebp-14]
 004A91FE    xor         eax,eax
 004A9200    mov         dword ptr [ebp-1C],edx
 004A9203    movsx       esi,byte ptr [ebp-134]
 004A920A    mov         dword ptr [ebp-14],eax
>004A920D    jmp         004A9259
 004A920F    mov         edx,dword ptr [ebp-14]
 004A9212    mov         eax,dword ptr [ebp-14]
 004A9215    lea         eax,[ebp+eax-134]
 004A921C    lea         edx,[ebp+edx*4-538]
>004A9223    jmp         004A922F
 004A9225    mov         dword ptr [edx],ebx
 004A9227    add         edx,4
 004A922A    inc         dword ptr [ebp-14]
 004A922D    inc         eax
 004A922E    inc         ebx
 004A922F    movsx       ecx,byte ptr [eax]
 004A9232    cmp         esi,ecx
>004A9234    je          004A9225
 004A9236    mov         ecx,esi
 004A9238    mov         eax,1
 004A923D    shl         eax,cl
 004A923F    cmp         eax,ebx
>004A9241    jg          004A9256
 004A9243    mov         edx,dword ptr [ebp-4]
 004A9246    mov         eax,dword ptr [edx]
 004A9248    mov         dword ptr [eax+14],8
 004A924F    mov         eax,dword ptr [ebp-4]
 004A9252    mov         edx,dword ptr [eax]
 004A9254    call        dword ptr [edx]
 004A9256    add         ebx,ebx
 004A9258    inc         esi
 004A9259    mov         ecx,dword ptr [ebp-14]
 004A925C    cmp         byte ptr [ebp+ecx-134],0
>004A9264    jne         004A920F
 004A9266    xor         eax,eax
 004A9268    mov         dword ptr [ebp-14],eax
 004A926B    mov         esi,1
 004A9270    mov         eax,dword ptr [ebp-10]
 004A9273    lea         edx,[eax+4C]
 004A9276    mov         dword ptr [ebp-20],edx
 004A9279    mov         ecx,dword ptr [ebp-0C]
 004A927C    lea         eax,[ecx+1]
 004A927F    cmp         byte ptr [eax],0
>004A9282    je          004A92AF
 004A9284    mov         edx,dword ptr [ebp-14]
 004A9287    mov         ecx,dword ptr [ebp-14]
 004A928A    sub         ecx,dword ptr [ebp+edx*4-538]
 004A9291    mov         edx,dword ptr [ebp-20]
 004A9294    mov         dword ptr [edx],ecx
 004A9296    xor         ecx,ecx
 004A9298    mov         cl,byte ptr [eax]
 004A929A    add         dword ptr [ebp-14],ecx
 004A929D    mov         edx,dword ptr [ebp-14]
 004A92A0    mov         ecx,dword ptr [ebp+edx*4-53C]
 004A92A7    mov         edx,dword ptr [ebp-20]
 004A92AA    mov         dword ptr [edx-48],ecx
>004A92AD    jmp         004A92B9
 004A92AF    mov         ecx,dword ptr [ebp-20]
 004A92B2    mov         dword ptr [ecx-48],0FFFFFFFF
 004A92B9    add         dword ptr [ebp-20],4
 004A92BD    inc         esi
 004A92BE    inc         eax
 004A92BF    cmp         esi,10
>004A92C2    jle         004A927F
 004A92C4    mov         eax,dword ptr [ebp-10]
 004A92C7    mov         dword ptr [eax+44],0FFFFF
 004A92CE    push        400
 004A92D3    push        0
 004A92D5    mov         eax,dword ptr [ebp-10]
 004A92D8    add         eax,90
 004A92DD    push        eax
 004A92DE    call        _memset
 004A92E3    add         esp,0C
 004A92E6    xor         edx,edx
 004A92E8    mov         dword ptr [ebp-14],edx
 004A92EB    mov         esi,1
 004A92F0    mov         eax,dword ptr [ebp-0C]
 004A92F3    lea         edx,[eax+1]
 004A92F6    mov         dword ptr [ebp-20],edx
 004A92F9    mov         dword ptr [ebp-18],1
 004A9300    mov         ecx,dword ptr [ebp-0C]
 004A9303    mov         eax,dword ptr [ebp-14]
 004A9306    lea         edx,[ecx+eax+11]
 004A930A    mov         dword ptr [ebp-30],edx
 004A930D    mov         ecx,dword ptr [ebp-14]
 004A9310    lea         eax,[ebp+ecx*4-538]
 004A9317    mov         dword ptr [ebp-28],eax
 004A931A    mov         edx,dword ptr [ebp-20]
 004A931D    mov         ecx,edx
 004A931F    mov         dword ptr [ebp-24],ecx
>004A9322    jmp         004A937C
 004A9324    mov         eax,dword ptr [ebp-28]
 004A9327    mov         edx,8
 004A932C    sub         edx,esi
 004A932E    mov         ebx,dword ptr [ebp-30]
 004A9331    mov         eax,dword ptr [eax]
 004A9333    mov         ecx,edx
 004A9335    shl         eax,cl
 004A9337    mov         ecx,edx
 004A9339    mov         edx,1
 004A933E    shl         edx,cl
 004A9340    mov         ecx,edx
 004A9342    mov         edx,dword ptr [ebp-10]
 004A9345    mov         dword ptr [ebp-2C],ebx
 004A9348    test        ecx,ecx
 004A934A    mov         ebx,dword ptr [ebp-10]
 004A934D    lea         edx,[edx+eax+490]
 004A9354    lea         eax,[ebx+eax*4+90]
>004A935B    jle         004A936F
 004A935D    mov         dword ptr [eax],esi
 004A935F    add         eax,4
 004A9362    mov         ebx,dword ptr [ebp-2C]
 004A9365    dec         ecx
 004A9366    mov         bl,byte ptr [ebx]
 004A9368    mov         byte ptr [edx],bl
 004A936A    inc         edx
 004A936B    test        ecx,ecx
>004A936D    jg          004A935D
 004A936F    inc         dword ptr [ebp-18]
 004A9372    add         dword ptr [ebp-28],4
 004A9376    inc         dword ptr [ebp-30]
 004A9379    inc         dword ptr [ebp-14]
 004A937C    mov         eax,dword ptr [ebp-24]
 004A937F    xor         edx,edx
 004A9381    mov         dl,byte ptr [eax]
 004A9383    cmp         edx,dword ptr [ebp-18]
>004A9386    jge         004A9324
 004A9388    inc         esi
 004A9389    inc         dword ptr [ebp-20]
 004A938C    cmp         esi,8
>004A938F    jle         004A92F9
 004A9395    cmp         dword ptr [ebp-8],0
>004A9399    je          004A93E1
 004A939B    xor         ecx,ecx
 004A939D    mov         dword ptr [ebp-18],ecx
 004A93A0    mov         eax,dword ptr [ebp-0C]
 004A93A3    lea         edx,[eax+11]
 004A93A6    mov         dword ptr [ebp-20],edx
 004A93A9    mov         ecx,dword ptr [ebp-18]
 004A93AC    cmp         ecx,dword ptr [ebp-1C]
>004A93AF    jge         004A93E1
 004A93B1    mov         eax,dword ptr [ebp-20]
 004A93B4    movzx       eax,byte ptr [eax]
 004A93B7    test        eax,eax
>004A93B9    jl          004A93C0
 004A93BB    cmp         eax,0F
>004A93BE    jle         004A93D3
 004A93C0    mov         edx,dword ptr [ebp-4]
 004A93C3    mov         ecx,dword ptr [edx]
 004A93C5    mov         dword ptr [ecx+14],8
 004A93CC    mov         eax,dword ptr [ebp-4]
 004A93CF    mov         edx,dword ptr [eax]
 004A93D1    call        dword ptr [edx]
 004A93D3    inc         dword ptr [ebp-18]
 004A93D6    inc         dword ptr [ebp-20]
 004A93D9    mov         ecx,dword ptr [ebp-18]
 004A93DC    cmp         ecx,dword ptr [ebp-1C]
>004A93DF    jl          004A93B1
 004A93E1    pop         esi
 004A93E2    pop         ebx
 004A93E3    mov         esp,ebp
 004A93E5    pop         ebp
 004A93E6    ret         4
*}
end;

//004A93EC
procedure @jpeg_fill_bit_buffer;
begin
{*
 004A93EC    push        ebp
 004A93ED    mov         ebp,esp
 004A93EF    add         esp,0FFFFFFF0
 004A93F2    push        ebx
 004A93F3    push        esi
 004A93F4    mov         dword ptr [ebp-0C],ecx
 004A93F7    mov         dword ptr [ebp-8],edx
 004A93FA    mov         dword ptr [ebp-4],eax
 004A93FD    mov         eax,dword ptr [ebp-4]
 004A9400    mov         ebx,dword ptr [eax]
 004A9402    mov         eax,dword ptr [ebp-4]
 004A9405    mov         esi,dword ptr [eax+4]
 004A9408    mov         eax,dword ptr [ebp-4]
 004A940B    mov         edx,dword ptr [eax+10]
 004A940E    mov         dword ptr [ebp-10],edx
 004A9411    mov         ecx,dword ptr [ebp-10]
 004A9414    cmp         dword ptr [ecx+1A0],0
>004A941B    jne         004A94BC
 004A9421    cmp         dword ptr [ebp-0C],19
>004A9425    jge         004A950C
 004A942B    test        esi,esi
>004A942D    jne         004A944E
 004A942F    mov         eax,dword ptr [ebp-10]
 004A9432    mov         edx,dword ptr [eax+18]
 004A9435    call        dword ptr [edx+0C]
 004A9438    test        eax,eax
>004A943A    jne         004A9443
 004A943C    xor         eax,eax
>004A943E    jmp         004A952E
 004A9443    mov         edx,dword ptr [ebp-10]
 004A9446    mov         eax,dword ptr [edx+18]
 004A9449    mov         ebx,dword ptr [eax]
 004A944B    mov         esi,dword ptr [eax+4]
 004A944E    dec         esi
 004A944F    xor         eax,eax
 004A9451    mov         al,byte ptr [ebx]
 004A9453    inc         ebx
 004A9454    cmp         eax,0FF
>004A9459    jne         004A94A1
 004A945B    test        esi,esi
>004A945D    jne         004A947E
 004A945F    mov         eax,dword ptr [ebp-10]
 004A9462    mov         edx,dword ptr [eax+18]
 004A9465    call        dword ptr [edx+0C]
 004A9468    test        eax,eax
>004A946A    jne         004A9473
 004A946C    xor         eax,eax
>004A946E    jmp         004A952E
 004A9473    mov         edx,dword ptr [ebp-10]
 004A9476    mov         eax,dword ptr [edx+18]
 004A9479    mov         ebx,dword ptr [eax]
 004A947B    mov         esi,dword ptr [eax+4]
 004A947E    dec         esi
 004A947F    xor         eax,eax
 004A9481    mov         al,byte ptr [ebx]
 004A9483    inc         ebx
 004A9484    cmp         eax,0FF
>004A9489    je          004A945B
 004A948B    test        eax,eax
>004A948D    jne         004A9496
 004A948F    mov         eax,0FF
>004A9494    jmp         004A94A1
 004A9496    mov         edx,dword ptr [ebp-10]
 004A9499    mov         dword ptr [edx+1A0],eax
>004A949F    jmp         004A94BC
 004A94A1    mov         ecx,dword ptr [ebp-8]
 004A94A4    shl         ecx,8
 004A94A7    or          eax,ecx
 004A94A9    mov         dword ptr [ebp-8],eax
 004A94AC    add         dword ptr [ebp-0C],8
 004A94B0    cmp         dword ptr [ebp-0C],19
>004A94B4    jl          004A942B
>004A94BA    jmp         004A950C
 004A94BC    mov         eax,dword ptr [ebp+8]
 004A94BF    cmp         eax,dword ptr [ebp-0C]
>004A94C2    jle         004A950C
 004A94C4    mov         edx,dword ptr [ebp-10]
 004A94C7    mov         ecx,dword ptr [edx+1BC]
 004A94CD    cmp         dword ptr [ecx+8],0
>004A94D1    jne         004A94FA
 004A94D3    mov         eax,dword ptr [ebp-10]
 004A94D6    mov         edx,dword ptr [eax]
 004A94D8    mov         dword ptr [edx+14],75
 004A94DF    or          edx,0FFFFFFFF
 004A94E2    mov         eax,dword ptr [ebp-10]
 004A94E5    mov         ecx,dword ptr [eax]
 004A94E7    call        dword ptr [ecx+4]
 004A94EA    mov         eax,dword ptr [ebp-10]
 004A94ED    mov         edx,dword ptr [eax+1BC]
 004A94F3    mov         dword ptr [edx+8],1
 004A94FA    mov         ecx,19
 004A94FF    sub         ecx,dword ptr [ebp-0C]
 004A9502    shl         dword ptr [ebp-8],cl
 004A9505    mov         dword ptr [ebp-0C],19
 004A950C    mov         eax,dword ptr [ebp-4]
 004A950F    mov         dword ptr [eax],ebx
 004A9511    mov         edx,dword ptr [ebp-4]
 004A9514    mov         dword ptr [edx+4],esi
 004A9517    mov         ecx,dword ptr [ebp-4]
 004A951A    mov         eax,dword ptr [ebp-8]
 004A951D    mov         dword ptr [ecx+8],eax
 004A9520    mov         eax,1
 004A9525    mov         edx,dword ptr [ebp-4]
 004A9528    mov         ecx,dword ptr [ebp-0C]
 004A952B    mov         dword ptr [edx+0C],ecx
 004A952E    pop         esi
 004A952F    pop         ebx
 004A9530    mov         esp,ebp
 004A9532    pop         ebp
 004A9533    ret         4
*}
end;

//004A9538
procedure @jpeg_huff_decode;
begin
{*
 004A9538    push        ebp
 004A9539    mov         ebp,esp
 004A953B    add         esp,0FFFFFFF4
 004A953E    push        ebx
 004A953F    push        esi
 004A9540    push        edi
 004A9541    mov         ebx,ecx
 004A9543    mov         dword ptr [ebp-8],edx
 004A9546    mov         dword ptr [ebp-4],eax
 004A9549    mov         edi,dword ptr [ebp+8]
 004A954C    cmp         edi,ebx
>004A954E    jle         004A9579
 004A9550    push        edi
 004A9551    mov         ecx,ebx
 004A9553    mov         edx,dword ptr [ebp-8]
 004A9556    mov         eax,dword ptr [ebp-4]
 004A9559    call        @jpeg_fill_bit_buffer
 004A955E    test        eax,eax
>004A9560    jne         004A956A
 004A9562    or          eax,0FFFFFFFF
>004A9565    jmp         004A9627
 004A956A    mov         edx,dword ptr [ebp-4]
 004A956D    mov         ecx,dword ptr [edx+8]
 004A9570    mov         dword ptr [ebp-8],ecx
 004A9573    mov         eax,dword ptr [ebp-4]
 004A9576    mov         ebx,dword ptr [eax+0C]
 004A9579    sub         ebx,edi
 004A957B    mov         esi,dword ptr [ebp-8]
 004A957E    mov         ecx,ebx
 004A9580    mov         eax,1
 004A9585    sar         esi,cl
 004A9587    mov         ecx,edi
 004A9589    mov         edx,dword ptr [ebp+0C]
 004A958C    shl         eax,cl
 004A958E    dec         eax
 004A958F    and         esi,eax
 004A9591    lea         eax,[edx+edi*4]
 004A9594    mov         dword ptr [ebp-0C],eax
>004A9597    jmp         004A95D9
 004A9599    add         esi,esi
 004A959B    cmp         ebx,1
>004A959E    jge         004A95C7
 004A95A0    push        1
 004A95A2    mov         ecx,ebx
 004A95A4    mov         edx,dword ptr [ebp-8]
 004A95A7    mov         eax,dword ptr [ebp-4]
 004A95AA    call        @jpeg_fill_bit_buffer
 004A95AF    test        eax,eax
>004A95B1    jne         004A95B8
 004A95B3    or          eax,0FFFFFFFF
>004A95B6    jmp         004A9627
 004A95B8    mov         edx,dword ptr [ebp-4]
 004A95BB    mov         ecx,dword ptr [edx+8]
 004A95BE    mov         dword ptr [ebp-8],ecx
 004A95C1    mov         eax,dword ptr [ebp-4]
 004A95C4    mov         ebx,dword ptr [eax+0C]
 004A95C7    dec         ebx
 004A95C8    mov         ecx,ebx
 004A95CA    mov         eax,dword ptr [ebp-8]
 004A95CD    sar         eax,cl
 004A95CF    and         eax,1
 004A95D2    or          esi,eax
 004A95D4    inc         edi
 004A95D5    add         dword ptr [ebp-0C],4
 004A95D9    mov         edx,dword ptr [ebp-0C]
 004A95DC    cmp         esi,dword ptr [edx]
>004A95DE    jg          004A9599
 004A95E0    mov         eax,dword ptr [ebp-4]
 004A95E3    mov         edx,dword ptr [ebp-8]
 004A95E6    cmp         edi,10
 004A95E9    mov         dword ptr [eax+8],edx
 004A95EC    mov         ecx,dword ptr [ebp-4]
 004A95EF    mov         dword ptr [ecx+0C],ebx
>004A95F2    jle         004A960F
 004A95F4    mov         eax,dword ptr [ebp-4]
 004A95F7    mov         eax,dword ptr [eax+10]
 004A95FA    mov         edx,dword ptr [eax]
 004A95FC    mov         dword ptr [edx+14],76
 004A9603    or          edx,0FFFFFFFF
 004A9606    mov         ecx,dword ptr [eax]
 004A9608    call        dword ptr [ecx+4]
 004A960B    xor         eax,eax
>004A960D    jmp         004A9627
 004A960F    mov         edx,dword ptr [ebp+0C]
 004A9612    mov         eax,dword ptr [ebp+0C]
 004A9615    mov         ecx,dword ptr [edx+edi*4+48]
 004A9619    mov         edx,dword ptr [eax+8C]
 004A961F    lea         eax,[edx+esi]
 004A9622    movzx       eax,byte ptr [eax+ecx+11]
 004A9627    pop         edi
 004A9628    pop         esi
 004A9629    pop         ebx
 004A962A    mov         esp,ebp
 004A962C    pop         ebp
 004A962D    ret         8
*}
end;

//004A9B04
procedure @jinit_huff_decoder;
begin
{*
 004A9B04    push        ebx
 004A9B05    mov         ebx,eax
 004A9B07    mov         eax,ebx
 004A9B09    push        esi
 004A9B0A    mov         ecx,0E8
 004A9B0F    mov         edx,1
 004A9B14    mov         esi,dword ptr [eax+4]
 004A9B17    call        dword ptr [esi]
 004A9B19    mov         dword ptr [ebx+1BC],eax
 004A9B1F    mov         dword ptr [eax],4A8FB8;_DF_.
 004A9B25    mov         dword ptr [eax+4],4A96A0
 004A9B2C    xor         edx,edx
 004A9B2E    add         eax,38
 004A9B31    xor         ecx,ecx
 004A9B33    mov         dword ptr [eax],ecx
 004A9B35    mov         dword ptr [eax-10],ecx
 004A9B38    inc         edx
 004A9B39    add         eax,4
 004A9B3C    cmp         edx,4
>004A9B3F    jl          004A9B31
 004A9B41    pop         esi
 004A9B42    pop         ebx
 004A9B43    ret
*}
end;

//004A9B44
procedure _DF_.;
begin
{*
 004A9B44    push        ebx
 004A9B45    push        esi
 004A9B46    mov         esi,eax
 004A9B48    push        edi
 004A9B49    mov         eax,esi
 004A9B4B    mov         ecx,400
 004A9B50    mov         ebx,dword ptr [esi+1C4]
 004A9B56    mov         edx,1
 004A9B5B    mov         edi,dword ptr [eax+4]
 004A9B5E    call        dword ptr [edi]
 004A9B60    mov         dword ptr [ebx+10],eax
 004A9B63    mov         eax,esi
 004A9B65    mov         ecx,400
 004A9B6A    mov         edx,1
 004A9B6F    mov         edi,dword ptr [eax+4]
 004A9B72    call        dword ptr [edi]
 004A9B74    mov         dword ptr [ebx+14],eax
 004A9B77    mov         eax,esi
 004A9B79    mov         ecx,400
 004A9B7E    mov         edx,1
 004A9B83    mov         edi,dword ptr [eax+4]
 004A9B86    call        dword ptr [edi]
 004A9B88    mov         dword ptr [ebx+18],eax
 004A9B8B    mov         eax,esi
 004A9B8D    mov         ecx,400
 004A9B92    mov         edx,1
 004A9B97    mov         esi,dword ptr [eax+4]
 004A9B9A    call        dword ptr [esi]
 004A9B9C    mov         dword ptr [ebx+1C],eax
 004A9B9F    xor         eax,eax
 004A9BA1    mov         edx,0FFFFFF80
 004A9BA6    imul        ecx,edx,166E9
 004A9BAC    add         ecx,8000
 004A9BB2    mov         esi,dword ptr [ebx+10]
 004A9BB5    sar         ecx,10
 004A9BB8    mov         dword ptr [esi+eax*4],ecx
 004A9BBB    imul        ecx,edx,1C5A2
 004A9BC1    add         ecx,8000
 004A9BC7    mov         esi,dword ptr [ebx+14]
 004A9BCA    sar         ecx,10
 004A9BCD    mov         dword ptr [esi+eax*4],ecx
 004A9BD0    imul        ecx,edx,0FFFF492E
 004A9BD6    mov         esi,dword ptr [ebx+18]
 004A9BD9    mov         dword ptr [esi+eax*4],ecx
 004A9BDC    imul        ecx,edx,0FFFFA7E6
 004A9BE2    mov         esi,dword ptr [ebx+1C]
 004A9BE5    add         ecx,8000
 004A9BEB    inc         edx
 004A9BEC    mov         dword ptr [esi+eax*4],ecx
 004A9BEF    inc         eax
 004A9BF0    cmp         eax,0FF
>004A9BF5    jle         004A9BA6
 004A9BF7    pop         edi
 004A9BF8    pop         esi
 004A9BF9    pop         ebx
 004A9BFA    ret
*}
end;

//004AA0B0
procedure @jinit_merged_upsampler;
begin
{*
 004AA0B0    push        ebx
 004AA0B1    push        esi
 004AA0B2    mov         esi,eax
 004AA0B4    push        edi
 004AA0B5    mov         eax,esi
 004AA0B7    mov         ecx,30
 004AA0BC    mov         edx,1
 004AA0C1    mov         ebx,dword ptr [eax+4]
 004AA0C4    call        dword ptr [ebx]
 004AA0C6    mov         ebx,eax
 004AA0C8    xor         eax,eax
 004AA0CA    mov         dword ptr [esi+1C4],ebx
 004AA0D0    mov         dword ptr [ebx],4A9BFC
 004AA0D6    mov         dword ptr [ebx+8],eax
 004AA0D9    mov         edx,dword ptr [esi+70]
 004AA0DC    imul        edx,dword ptr [esi+78]
 004AA0E0    mov         dword ptr [ebx+28],edx
 004AA0E3    cmp         dword ptr [esi+138],2
>004AA0EA    jne         004AA10F
 004AA0EC    mov         dword ptr [ebx+4],4A9C10
 004AA0F3    mov         eax,esi
 004AA0F5    mov         edx,1
 004AA0FA    mov         dword ptr [ebx+0C],4A9E78
 004AA101    mov         edi,dword ptr [eax+4]
 004AA104    mov         ecx,dword ptr [ebx+28]
 004AA107    call        dword ptr [edi+4]
 004AA10A    mov         dword ptr [ebx+20],eax
>004AA10D    jmp         004AA122
 004AA10F    mov         dword ptr [ebx+4],4A9CC8
 004AA116    mov         dword ptr [ebx+0C],4A9D00
 004AA11D    xor         eax,eax
 004AA11F    mov         dword ptr [ebx+20],eax
 004AA122    mov         eax,esi
 004AA124    call        _DF_.
 004AA129    pop         edi
 004AA12A    pop         esi
 004AA12B    pop         ebx
 004AA12C    ret
*}
end;

//004AA130
procedure _DF_.;
begin
{*
 004AA130    push        ebx
 004AA131    push        esi
 004AA132    mov         esi,eax
 004AA134    push        edi
 004AA135    mov         eax,esi
 004AA137    mov         ecx,400
 004AA13C    mov         ebx,dword ptr [esi+1C8]
 004AA142    mov         edx,1
 004AA147    mov         edi,dword ptr [eax+4]
 004AA14A    call        dword ptr [edi]
 004AA14C    mov         dword ptr [ebx+8],eax
 004AA14F    mov         eax,esi
 004AA151    mov         ecx,400
 004AA156    mov         edx,1
 004AA15B    mov         edi,dword ptr [eax+4]
 004AA15E    call        dword ptr [edi]
 004AA160    mov         dword ptr [ebx+0C],eax
 004AA163    mov         eax,esi
 004AA165    mov         ecx,400
 004AA16A    mov         edx,1
 004AA16F    mov         edi,dword ptr [eax+4]
 004AA172    call        dword ptr [edi]
 004AA174    mov         dword ptr [ebx+10],eax
 004AA177    mov         eax,esi
 004AA179    mov         ecx,400
 004AA17E    mov         edx,1
 004AA183    mov         esi,dword ptr [eax+4]
 004AA186    call        dword ptr [esi]
 004AA188    mov         dword ptr [ebx+14],eax
 004AA18B    xor         eax,eax
 004AA18D    mov         edx,0FFFFFF80
 004AA192    imul        ecx,edx,166E9
 004AA198    add         ecx,8000
 004AA19E    mov         esi,dword ptr [ebx+8]
 004AA1A1    sar         ecx,10
 004AA1A4    mov         dword ptr [esi+eax*4],ecx
 004AA1A7    imul        ecx,edx,1C5A2
 004AA1AD    add         ecx,8000
 004AA1B3    mov         esi,dword ptr [ebx+0C]
 004AA1B6    sar         ecx,10
 004AA1B9    mov         dword ptr [esi+eax*4],ecx
 004AA1BC    imul        ecx,edx,0FFFF492E
 004AA1C2    mov         esi,dword ptr [ebx+10]
 004AA1C5    mov         dword ptr [esi+eax*4],ecx
 004AA1C8    imul        ecx,edx,0FFFFA7E6
 004AA1CE    mov         esi,dword ptr [ebx+14]
 004AA1D1    add         ecx,8000
 004AA1D7    inc         edx
 004AA1D8    mov         dword ptr [esi+eax*4],ecx
 004AA1DB    inc         eax
 004AA1DC    cmp         eax,0FF
>004AA1E1    jle         004AA192
 004AA1E3    pop         edi
 004AA1E4    pop         esi
 004AA1E5    pop         ebx
 004AA1E6    ret
*}
end;

//004AA50C
procedure @jinit_color_deconverter;
begin
{*
 004AA50C    push        ebx
 004AA50D    mov         ebx,eax
 004AA50F    mov         eax,ebx
 004AA511    push        esi
 004AA512    mov         ecx,18
 004AA517    mov         edx,1
 004AA51C    mov         esi,dword ptr [eax+4]
 004AA51F    call        dword ptr [esi]
 004AA521    mov         esi,eax
 004AA523    mov         dword ptr [ebx+1C8],esi
 004AA529    mov         dword ptr [esi],4AA508
 004AA52F    mov         eax,dword ptr [ebx+28]
 004AA532    dec         eax
>004AA533    je          004AA542
 004AA535    dec         eax
 004AA536    sub         eax,2
>004AA539    jb          004AA559
 004AA53B    sub         eax,2
>004AA53E    jb          004AA570
>004AA540    jmp         004AA587
 004AA542    cmp         dword ptr [ebx+24],1
>004AA546    je          004AA59C
 004AA548    mov         edx,dword ptr [ebx]
 004AA54A    mov         eax,ebx
 004AA54C    mov         dword ptr [edx+14],0A
 004AA553    mov         edx,dword ptr [eax]
 004AA555    call        dword ptr [edx]
>004AA557    jmp         004AA59C
 004AA559    cmp         dword ptr [ebx+24],3
>004AA55D    je          004AA59C
 004AA55F    mov         ecx,dword ptr [ebx]
 004AA561    mov         eax,ebx
 004AA563    mov         dword ptr [ecx+14],0A
 004AA56A    mov         edx,dword ptr [eax]
 004AA56C    call        dword ptr [edx]
>004AA56E    jmp         004AA59C
 004AA570    cmp         dword ptr [ebx+24],4
>004AA574    je          004AA59C
 004AA576    mov         ecx,dword ptr [ebx]
 004AA578    mov         eax,ebx
 004AA57A    mov         dword ptr [ecx+14],0A
 004AA581    mov         edx,dword ptr [eax]
 004AA583    call        dword ptr [edx]
>004AA585    jmp         004AA59C
 004AA587    cmp         dword ptr [ebx+24],1
>004AA58B    jge         004AA59C
 004AA58D    mov         ecx,dword ptr [ebx]
 004AA58F    mov         eax,ebx
 004AA591    mov         dword ptr [ecx+14],0A
 004AA598    mov         edx,dword ptr [eax]
 004AA59A    call        dword ptr [edx]
 004AA59C    mov         ecx,dword ptr [ebx+2C]
 004AA59F    dec         ecx
>004AA5A0    je          004AA5B3
 004AA5A2    dec         ecx
>004AA5A3    je          004AA60A
 004AA5A5    sub         ecx,2
>004AA5A8    je          004AA65C
>004AA5AE    jmp         004AA699
 004AA5B3    mov         dword ptr [ebx+78],1
 004AA5BA    mov         eax,dword ptr [ebx+28]
 004AA5BD    cmp         eax,1
>004AA5C0    je          004AA5C7
 004AA5C2    cmp         eax,3
>004AA5C5    jne         004AA5F6
 004AA5C7    mov         dword ptr [esi+4],4AA360
 004AA5CE    mov         eax,1
>004AA5D3    jmp         004AA5EC
 004AA5D5    mov         edx,eax
 004AA5D7    mov         ecx,dword ptr [ebx+0D8]
 004AA5DD    shl         edx,3
 004AA5E0    xor         esi,esi
 004AA5E2    sub         edx,eax
 004AA5E4    inc         eax
 004AA5E5    lea         edx,[edx+edx*2]
 004AA5E8    mov         dword ptr [ecx+edx*4+30],esi
 004AA5EC    cmp         eax,dword ptr [ebx+24]
>004AA5EF    jl          004AA5D5
>004AA5F1    jmp         004AA6BF
 004AA5F6    mov         eax,dword ptr [ebx]
 004AA5F8    mov         dword ptr [eax+14],1B
 004AA5FF    mov         eax,ebx
 004AA601    mov         edx,dword ptr [eax]
 004AA603    call        dword ptr [edx]
>004AA605    jmp         004AA6BF
 004AA60A    mov         dword ptr [ebx+78],3
 004AA611    cmp         dword ptr [ebx+28],3
>004AA615    jne         004AA62A
 004AA617    mov         dword ptr [esi+4],4AA1E8
 004AA61E    mov         eax,ebx
 004AA620    call        _DF_.
>004AA625    jmp         004AA6BF
 004AA62A    cmp         dword ptr [ebx+28],1
>004AA62E    jne         004AA63C
 004AA630    mov         dword ptr [esi+4],4AA380
>004AA637    jmp         004AA6BF
 004AA63C    cmp         dword ptr [ebx+28],2
>004AA640    jne         004AA64B
 004AA642    mov         dword ptr [esi+4],4AA2F0
>004AA649    jmp         004AA6BF
 004AA64B    mov         edx,dword ptr [ebx]
 004AA64D    mov         eax,ebx
 004AA64F    mov         dword ptr [edx+14],1B
 004AA656    mov         edx,dword ptr [eax]
 004AA658    call        dword ptr [edx]
>004AA65A    jmp         004AA6BF
 004AA65C    mov         dword ptr [ebx+78],4
 004AA663    cmp         dword ptr [ebx+28],5
>004AA667    jne         004AA679
 004AA669    mov         dword ptr [esi+4],4AA3C8
 004AA670    mov         eax,ebx
 004AA672    call        _DF_.
>004AA677    jmp         004AA6BF
 004AA679    cmp         dword ptr [ebx+28],4
>004AA67D    jne         004AA688
 004AA67F    mov         dword ptr [esi+4],4AA2F0
>004AA686    jmp         004AA6BF
 004AA688    mov         edx,dword ptr [ebx]
 004AA68A    mov         eax,ebx
 004AA68C    mov         dword ptr [edx+14],1B
 004AA693    mov         edx,dword ptr [eax]
 004AA695    call        dword ptr [edx]
>004AA697    jmp         004AA6BF
 004AA699    mov         ecx,dword ptr [ebx+2C]
 004AA69C    cmp         ecx,dword ptr [ebx+28]
>004AA69F    jne         004AA6B0
 004AA6A1    mov         eax,dword ptr [ebx+24]
 004AA6A4    mov         dword ptr [ebx+78],eax
 004AA6A7    mov         dword ptr [esi+4],4AA2F0
>004AA6AE    jmp         004AA6BF
 004AA6B0    mov         edx,dword ptr [ebx]
 004AA6B2    mov         eax,ebx
 004AA6B4    mov         dword ptr [edx+14],1B
 004AA6BB    mov         edx,dword ptr [eax]
 004AA6BD    call        dword ptr [edx]
 004AA6BF    cmp         dword ptr [ebx+54],0
>004AA6C3    je          004AA6CF
 004AA6C5    mov         dword ptr [ebx+7C],1
 004AA6CC    pop         esi
 004AA6CD    pop         ebx
 004AA6CE    ret
 004AA6CF    mov         ecx,dword ptr [ebx+78]
 004AA6D2    mov         dword ptr [ebx+7C],ecx
 004AA6D5    pop         esi
 004AA6D6    pop         ebx
 004AA6D7    ret
*}
end;

//004AA6D8
procedure _DF_.;
begin
{*
 004AA6D8    push        ebx
 004AA6D9    push        esi
 004AA6DA    push        edi
 004AA6DB    add         esp,0FFFFFFE8
 004AA6DE    mov         dword ptr [esp+4],edx
 004AA6E2    mov         dword ptr [esp],eax
 004AA6E5    mov         eax,dword ptr [esp]
 004AA6E8    mov         edx,dword ptr [eax+78]
 004AA6EB    mov         dword ptr [esp+8],edx
 004AA6EF    mov         ecx,dword ptr [esp]
 004AA6F2    mov         eax,dword ptr [ecx+60]
 004AA6F5    mov         dword ptr [esp+0C],eax
 004AA6F9    mov         ebx,1
 004AA6FE    inc         ebx
 004AA6FF    mov         eax,ebx
 004AA701    mov         ecx,1
 004AA706    cmp         ecx,dword ptr [esp+8]
>004AA70A    jge         004AA716
 004AA70C    imul        eax,ebx
 004AA70F    inc         ecx
 004AA710    cmp         ecx,dword ptr [esp+8]
>004AA714    jl          004AA70C
 004AA716    cmp         eax,dword ptr [esp+0C]
>004AA71A    jle         004AA6FE
 004AA71C    dec         ebx
 004AA71D    cmp         ebx,2
>004AA720    jge         004AA738
 004AA722    mov         edx,dword ptr [esp]
 004AA725    mov         edx,dword ptr [edx]
 004AA727    mov         dword ptr [edx+14],38
 004AA72E    mov         dword ptr [edx+18],eax
 004AA731    mov         eax,dword ptr [esp]
 004AA734    mov         ecx,dword ptr [eax]
 004AA736    call        dword ptr [ecx]
 004AA738    mov         esi,1
 004AA73D    xor         ecx,ecx
 004AA73F    mov         eax,dword ptr [esp+4]
 004AA743    cmp         ecx,dword ptr [esp+8]
>004AA747    jge         004AA758
 004AA749    mov         dword ptr [eax],ebx
 004AA74B    imul        esi,ebx
 004AA74E    inc         ecx
 004AA74F    add         eax,4
 004AA752    cmp         ecx,dword ptr [esp+8]
>004AA756    jl          004AA749
 004AA758    xor         edx,edx
 004AA75A    mov         dword ptr [esp+10],edx
 004AA75E    xor         ecx,ecx
 004AA760    mov         dword ptr [esp+14],5ADA58
 004AA768    cmp         ecx,dword ptr [esp+8]
>004AA76C    jge         004AA7BE
 004AA76E    mov         eax,dword ptr [esp]
 004AA771    cmp         dword ptr [eax+2C],2
>004AA775    jne         004AA77F
 004AA777    mov         edx,dword ptr [esp+14]
 004AA77B    mov         ebx,dword ptr [edx]
>004AA77D    jmp         004AA781
 004AA77F    mov         ebx,ecx
 004AA781    mov         eax,dword ptr [esp+4]
 004AA785    push        dword ptr [eax+ebx*4]
 004AA788    mov         eax,esi
 004AA78A    pop         edx
 004AA78B    mov         edi,edx
 004AA78D    cdq
 004AA78E    idiv        eax,edi
 004AA790    mov         edx,dword ptr [esp+4]
 004AA794    mov         edx,dword ptr [edx+ebx*4]
 004AA797    inc         edx
 004AA798    imul        eax,edx
 004AA79B    cmp         eax,dword ptr [esp+0C]
>004AA79F    jg          004AA7BE
 004AA7A1    mov         edx,dword ptr [esp+4]
 004AA7A5    inc         ecx
 004AA7A6    mov         esi,eax
 004AA7A8    inc         dword ptr [edx+ebx*4]
 004AA7AB    mov         dword ptr [esp+10],1
 004AA7B3    add         dword ptr [esp+14],4
 004AA7B8    cmp         ecx,dword ptr [esp+8]
>004AA7BC    jl          004AA76E
 004AA7BE    cmp         dword ptr [esp+10],0
>004AA7C3    jne         004AA758
 004AA7C5    mov         eax,esi
 004AA7C7    add         esp,18
 004AA7CA    pop         edi
 004AA7CB    pop         esi
 004AA7CC    pop         ebx
 004AA7CD    ret
*}
end;

//004AA7D0
{*function sub_004AA7D0(?:?; ?:?; ?:?; ?:?):?;
begin
 004AA7D0    push        ebp
 004AA7D1    mov         ebp,esp
 004AA7D3    mov         eax,ecx
 004AA7D5    push        ebx
 004AA7D6    shl         eax,8
 004AA7D9    mov         ebx,dword ptr [ebp+8]
 004AA7DC    mov         edx,ebx
 004AA7DE    sub         eax,ecx
 004AA7E0    sar         edx,1
>004AA7E2    jns         004AA7E7
 004AA7E4    adc         edx,0
 004AA7E7    add         eax,edx
 004AA7E9    cdq
 004AA7EA    idiv        eax,ebx
 004AA7EC    pop         ebx
 004AA7ED    pop         ebp
 004AA7EE    ret         4
end;*}

//004AA7F4
{*procedure sub_004AA7F4(?:?; ?:?; ?:?; ?:?);
begin
 004AA7F4    add         ecx,ecx
 004AA7F6    push        ebp
 004AA7F7    mov         ebp,esp
 004AA7F9    mov         eax,ecx
 004AA7FB    shl         eax,8
 004AA7FE    push        ebx
 004AA7FF    mov         ebx,dword ptr [ebp+8]
 004AA802    sub         eax,ecx
 004AA804    add         eax,ebx
 004AA806    add         ebx,ebx
 004AA808    add         eax,0FF
 004AA80D    cdq
 004AA80E    idiv        eax,ebx
 004AA810    pop         ebx
 004AA811    pop         ebp
 004AA812    ret         4
end;*}

//004AA818
{*procedure sub_004AA818(?:?);
begin
 004AA818    push        ebx
 004AA819    push        esi
 004AA81A    push        edi
 004AA81B    push        ebp
 004AA81C    add         esp,0FFFFFFD0
 004AA81F    mov         dword ptr [esp],eax
 004AA822    mov         eax,dword ptr [esp]
 004AA825    mov         edx,dword ptr [eax+1CC]
 004AA82B    mov         dword ptr [esp+4],edx
 004AA82F    mov         edx,dword ptr [esp+4]
 004AA833    mov         eax,dword ptr [esp]
 004AA836    add         edx,20
 004AA839    call        _DF_.
 004AA83E    mov         dword ptr [esp+0C],eax
 004AA842    mov         ecx,dword ptr [esp]
 004AA845    cmp         dword ptr [ecx+78],3
>004AA849    jne         004AA892
 004AA84B    mov         eax,dword ptr [esp]
 004AA84E    mov         eax,dword ptr [eax]
 004AA850    add         eax,18
 004AA853    mov         edx,dword ptr [esp+0C]
 004AA857    mov         dword ptr [eax],edx
 004AA859    mov         ecx,dword ptr [esp+4]
 004AA85D    mov         edx,dword ptr [ecx+20]
 004AA860    mov         dword ptr [eax+4],edx
 004AA863    mov         ecx,dword ptr [esp+4]
 004AA867    mov         edx,dword ptr [ecx+24]
 004AA86A    mov         dword ptr [eax+8],edx
 004AA86D    mov         ecx,dword ptr [esp+4]
 004AA871    mov         edx,dword ptr [ecx+28]
 004AA874    mov         dword ptr [eax+0C],edx
 004AA877    mov         eax,dword ptr [esp]
 004AA87A    mov         ecx,dword ptr [eax]
 004AA87C    mov         dword ptr [ecx+14],5E
 004AA883    mov         edx,1
 004AA888    mov         eax,dword ptr [esp]
 004AA88B    mov         ecx,dword ptr [eax]
 004AA88D    call        dword ptr [ecx+4]
>004AA890    jmp         004AA8B2
 004AA892    mov         eax,dword ptr [esp]
 004AA895    mov         eax,dword ptr [eax]
 004AA897    mov         dword ptr [eax+14],5F
 004AA89E    mov         edx,dword ptr [esp+0C]
 004AA8A2    mov         dword ptr [eax+18],edx
 004AA8A5    mov         edx,1
 004AA8AA    mov         eax,dword ptr [esp]
 004AA8AD    mov         ecx,dword ptr [eax]
 004AA8AF    call        dword ptr [ecx+4]
 004AA8B2    mov         eax,dword ptr [esp]
 004AA8B5    mov         edx,dword ptr [eax+78]
 004AA8B8    push        edx
 004AA8B9    mov         edx,1
 004AA8BE    mov         eax,dword ptr [esp+4]
 004AA8C2    mov         ecx,dword ptr [esp+10]
 004AA8C6    mov         ebx,dword ptr [eax+4]
 004AA8C9    call        dword ptr [ebx+8]
 004AA8CC    mov         dword ptr [esp+8],eax
 004AA8D0    xor         edx,edx
 004AA8D2    mov         eax,dword ptr [esp+0C]
 004AA8D6    mov         dword ptr [esp+1C],eax
 004AA8DA    mov         dword ptr [esp+10],edx
 004AA8DE    mov         ecx,dword ptr [esp+8]
 004AA8E2    mov         eax,ecx
 004AA8E4    mov         dword ptr [esp+2C],eax
 004AA8E8    mov         edx,dword ptr [esp+4]
 004AA8EC    lea         ecx,[edx+20]
 004AA8EF    mov         dword ptr [esp+20],ecx
>004AA8F3    jmp         004AA99D
 004AA8F8    mov         eax,dword ptr [esp+20]
 004AA8FC    mov         edx,dword ptr [eax]
 004AA8FE    mov         dword ptr [esp+18],edx
 004AA902    mov         eax,dword ptr [esp+1C]
 004AA906    cdq
 004AA907    idiv        eax,dword ptr [esp+18]
 004AA90B    mov         esi,eax
 004AA90D    xor         eax,eax
 004AA90F    mov         dword ptr [esp+14],eax
 004AA913    mov         edx,dword ptr [esp+2C]
 004AA917    mov         ecx,edx
 004AA919    mov         dword ptr [esp+28],ecx
 004AA91D    mov         eax,dword ptr [esp+14]
 004AA921    cmp         eax,dword ptr [esp+18]
>004AA925    jge         004AA98B
 004AA927    mov         edx,dword ptr [esp+18]
 004AA92B    dec         edx
 004AA92C    push        edx
 004AA92D    mov         ecx,dword ptr [esp+18]
 004AA931    mov         edx,dword ptr [esp+14]
 004AA935    mov         eax,dword ptr [esp+4]
 004AA939    call        004AA7D0
 004AA93E    mov         edi,eax
 004AA940    mov         ecx,dword ptr [esp+14]
 004AA944    imul        ecx,esi
 004AA947    mov         eax,dword ptr [esp+28]
 004AA94B    mov         edx,eax
 004AA94D    mov         dword ptr [esp+24],edx
 004AA951    cmp         ecx,dword ptr [esp+0C]
>004AA955    jge         004AA97D
 004AA957    xor         eax,eax
 004AA959    mov         edx,dword ptr [esp+24]
 004AA95D    cmp         esi,eax
>004AA95F    jle         004AA973
 004AA961    mov         ebx,dword ptr [edx]
 004AA963    add         ebx,ecx
 004AA965    add         ebx,eax
 004AA967    inc         eax
 004AA968    push        ebx
 004AA969    mov         ebx,edi
 004AA96B    pop         ebp
 004AA96C    cmp         esi,eax
 004AA96E    mov         byte ptr [ebp],bl
>004AA971    jg          004AA961
 004AA973    add         ecx,dword ptr [esp+1C]
 004AA977    cmp         ecx,dword ptr [esp+0C]
>004AA97B    jl          004AA957
 004AA97D    inc         dword ptr [esp+14]
 004AA981    mov         eax,dword ptr [esp+14]
 004AA985    cmp         eax,dword ptr [esp+18]
>004AA989    jl          004AA927
 004AA98B    mov         dword ptr [esp+1C],esi
 004AA98F    inc         dword ptr [esp+10]
 004AA993    add         dword ptr [esp+2C],4
 004AA998    add         dword ptr [esp+20],4
 004AA99D    mov         edx,dword ptr [esp]
 004AA9A0    mov         ecx,dword ptr [edx+78]
 004AA9A3    cmp         ecx,dword ptr [esp+10]
>004AA9A7    jg          004AA8F8
 004AA9AD    mov         eax,dword ptr [esp+4]
 004AA9B1    mov         edx,dword ptr [esp+8]
 004AA9B5    mov         dword ptr [eax+10],edx
 004AA9B8    mov         ecx,dword ptr [esp+4]
 004AA9BC    mov         eax,dword ptr [esp+0C]
 004AA9C0    mov         dword ptr [ecx+14],eax
 004AA9C3    add         esp,30
 004AA9C6    pop         ebp
 004AA9C7    pop         edi
 004AA9C8    pop         esi
 004AA9C9    pop         ebx
 004AA9CA    ret
end;*}

//004AA9CC
{*procedure sub_004AA9CC(?:?);
begin
 004AA9CC    push        ebx
 004AA9CD    push        esi
 004AA9CE    push        edi
 004AA9CF    add         esp,0FFFFFFE0
 004AA9D2    mov         dword ptr [esp],eax
 004AA9D5    mov         eax,dword ptr [esp]
 004AA9D8    mov         edx,dword ptr [eax+1CC]
 004AA9DE    mov         dword ptr [esp+4],edx
 004AA9E2    mov         ecx,dword ptr [esp]
 004AA9E5    cmp         dword ptr [ecx+58],1
>004AA9E9    jne         004AAA00
 004AA9EB    mov         dword ptr [esp+14],1FE
 004AA9F3    mov         eax,dword ptr [esp+4]
 004AA9F7    mov         dword ptr [eax+1C],1
>004AA9FE    jmp         004AAA0F
 004AAA00    xor         edx,edx
 004AAA02    mov         dword ptr [esp+14],edx
 004AAA06    mov         ecx,dword ptr [esp+4]
 004AAA0A    xor         eax,eax
 004AAA0C    mov         dword ptr [ecx+1C],eax
 004AAA0F    mov         edx,dword ptr [esp]
 004AAA12    mov         ecx,dword ptr [edx+78]
 004AAA15    mov         edx,1
 004AAA1A    push        ecx
 004AAA1B    mov         eax,dword ptr [esp+4]
 004AAA1F    mov         ecx,dword ptr [esp+18]
 004AAA23    add         ecx,100
 004AAA29    mov         ebx,dword ptr [eax+4]
 004AAA2C    call        dword ptr [ebx+8]
 004AAA2F    mov         edx,dword ptr [esp+4]
 004AAA33    mov         dword ptr [edx+18],eax
 004AAA36    mov         eax,dword ptr [esp+4]
 004AAA3A    mov         ecx,dword ptr [eax+14]
 004AAA3D    mov         dword ptr [esp+10],ecx
 004AAA41    xor         edi,edi
 004AAA43    mov         eax,dword ptr [esp+4]
 004AAA47    lea         edx,[eax+20]
 004AAA4A    mov         dword ptr [esp+18],edx
>004AAA4E    jmp         004AAB27
 004AAA53    mov         ecx,dword ptr [esp+18]
 004AAA57    mov         eax,dword ptr [ecx]
 004AAA59    mov         dword ptr [esp+0C],eax
 004AAA5D    mov         eax,dword ptr [esp+10]
 004AAA61    cdq
 004AAA62    idiv        eax,dword ptr [esp+0C]
 004AAA66    mov         dword ptr [esp+10],eax
 004AAA6A    cmp         dword ptr [esp+14],0
>004AAA6F    je          004AAA7F
 004AAA71    mov         ecx,dword ptr [esp+4]
 004AAA75    mov         eax,dword ptr [ecx+18]
 004AAA78    add         dword ptr [eax+edi*4],0FF
 004AAA7F    mov         edx,dword ptr [esp+4]
 004AAA83    xor         esi,esi
 004AAA85    mov         ecx,dword ptr [edx+18]
 004AAA88    mov         edx,edi
 004AAA8A    mov         eax,dword ptr [ecx+edi*4]
 004AAA8D    mov         dword ptr [esp+8],eax
 004AAA91    mov         eax,dword ptr [esp+0C]
 004AAA95    dec         eax
 004AAA96    xor         ecx,ecx
 004AAA98    push        eax
 004AAA99    mov         eax,dword ptr [esp+4]
 004AAA9D    call        004AA7F4
 004AAAA2    xor         ebx,ebx
 004AAAA4    mov         edx,dword ptr [esp+8]
 004AAAA8    mov         ecx,edx
 004AAAAA    mov         dword ptr [esp+1C],ecx
 004AAAAE    cmp         eax,ebx
>004AAAB0    jge         004AAACA
 004AAAB2    mov         eax,dword ptr [esp+0C]
 004AAAB6    mov         edx,edi
 004AAAB8    dec         eax
 004AAAB9    inc         esi
 004AAABA    push        eax
 004AAABB    mov         ecx,esi
 004AAABD    mov         eax,dword ptr [esp+4]
 004AAAC1    call        004AA7F4
 004AAAC6    cmp         eax,ebx
>004AAAC8    jl          004AAAB2
 004AAACA    mov         edx,esi
 004AAACC    mov         ecx,dword ptr [esp+1C]
 004AAAD0    imul        edx,dword ptr [esp+10]
 004AAAD5    mov         byte ptr [ecx],dl
 004AAAD7    inc         ebx
 004AAAD8    inc         dword ptr [esp+1C]
 004AAADC    cmp         ebx,0FF
>004AAAE2    jle         004AAAAE
 004AAAE4    cmp         dword ptr [esp+14],0
>004AAAE9    je          004AAB21
 004AAAEB    mov         ebx,1
 004AAAF0    mov         eax,dword ptr [esp+8]
 004AAAF4    add         eax,100
 004AAAF9    mov         edx,ebx
 004AAAFB    mov         ecx,dword ptr [esp+8]
 004AAAFF    neg         edx
 004AAB01    add         ecx,edx
 004AAB03    mov         edx,dword ptr [esp+8]
 004AAB07    inc         ebx
 004AAB08    mov         dl,byte ptr [edx]
 004AAB0A    mov         byte ptr [ecx],dl
 004AAB0C    mov         ecx,dword ptr [esp+8]
 004AAB10    mov         dl,byte ptr [ecx+0FF]
 004AAB16    mov         byte ptr [eax],dl
 004AAB18    inc         eax
 004AAB19    cmp         ebx,0FF
>004AAB1F    jle         004AAAF9
 004AAB21    inc         edi
 004AAB22    add         dword ptr [esp+18],4
 004AAB27    mov         eax,dword ptr [esp]
 004AAB2A    cmp         edi,dword ptr [eax+78]
>004AAB2D    jl          004AAA53
 004AAB33    add         esp,20
 004AAB36    pop         edi
 004AAB37    pop         esi
 004AAB38    pop         ebx
 004AAB39    ret
end;*}

//004AB160
{*procedure sub_004AB160(?:?);
begin
 004AB160    push        ebx
 004AB161    push        esi
 004AB162    mov         ebx,eax
 004AB164    push        edi
 004AB165    push        ebp
 004AB166    push        ecx
 004AB167    mov         eax,dword ptr [ebx+1CC]
 004AB16D    mov         edx,dword ptr [ebx+70]
 004AB170    add         edx,edx
 004AB172    add         edx,4
 004AB175    xor         edi,edi
 004AB177    mov         dword ptr [esp],edx
 004AB17A    lea         esi,[eax+44]
>004AB17D    jmp         004AB195
 004AB17F    mov         eax,ebx
 004AB181    mov         ecx,dword ptr [esp]
 004AB184    mov         edx,1
 004AB189    mov         ebp,dword ptr [eax+4]
 004AB18C    call        dword ptr [ebp+4]
 004AB18F    mov         dword ptr [esi],eax
 004AB191    inc         edi
 004AB192    add         esi,4
 004AB195    cmp         edi,dword ptr [ebx+78]
>004AB198    jl          004AB17F
 004AB19A    pop         edx
 004AB19B    pop         ebp
 004AB19C    pop         edi
 004AB19D    pop         esi
 004AB19E    pop         ebx
 004AB19F    ret
end;*}

//004AB28C
procedure @jinit_1pass_quantizer;
begin
{*
 004AB28C    push        ebx
 004AB28D    mov         ebx,eax
 004AB28F    mov         eax,ebx
 004AB291    push        esi
 004AB292    mov         ecx,58
 004AB297    mov         edx,1
 004AB29C    mov         esi,dword ptr [eax+4]
 004AB29F    call        dword ptr [esi]
 004AB2A1    mov         dword ptr [ebx+1CC],eax
 004AB2A7    mov         dword ptr [eax],4AB1A0
 004AB2AD    mov         dword ptr [eax+8],4AB278
 004AB2B4    mov         dword ptr [eax+0C],4AB27C
 004AB2BB    xor         edx,edx
 004AB2BD    xor         ecx,ecx
 004AB2BF    mov         dword ptr [eax+44],edx
 004AB2C2    mov         dword ptr [eax+34],ecx
 004AB2C5    cmp         dword ptr [ebx+78],4
>004AB2C9    jle         004AB2E1
 004AB2CB    mov         eax,dword ptr [ebx]
 004AB2CD    mov         dword ptr [eax+14],37
 004AB2D4    mov         dword ptr [eax+18],4
 004AB2DB    mov         eax,ebx
 004AB2DD    mov         edx,dword ptr [eax]
 004AB2DF    call        dword ptr [edx]
 004AB2E1    cmp         dword ptr [ebx+60],100
>004AB2E8    jle         004AB300
 004AB2EA    mov         eax,dword ptr [ebx]
 004AB2EC    mov         dword ptr [eax+14],39
 004AB2F3    mov         dword ptr [eax+18],100
 004AB2FA    mov         eax,ebx
 004AB2FC    mov         edx,dword ptr [eax]
 004AB2FE    call        dword ptr [edx]
 004AB300    mov         eax,ebx
 004AB302    call        004AA818
 004AB307    mov         eax,ebx
 004AB309    call        004AA9CC
 004AB30E    cmp         dword ptr [ebx+58],2
>004AB312    jne         004AB31B
 004AB314    mov         eax,ebx
 004AB316    call        004AB160
 004AB31B    pop         esi
 004AB31C    pop         ebx
 004AB31D    ret
*}
end;

//004AB320
procedure _DF_.;
begin
{*
 004AB320    push        ebp
 004AB321    mov         ebp,esp
 004AB323    add         esp,0FFFFFFF4
 004AB326    push        ebx
 004AB327    push        esi
 004AB328    mov         ecx,dword ptr [eax+1CC]
 004AB32E    mov         ebx,dword ptr [ecx+18]
 004AB331    mov         eax,dword ptr [eax+70]
 004AB334    mov         dword ptr [ebp-8],eax
 004AB337    xor         ecx,ecx
 004AB339    mov         dword ptr [ebp-4],ecx
 004AB33C    mov         dword ptr [ebp-0C],edx
 004AB33F    mov         eax,dword ptr [ebp-4]
 004AB342    cmp         eax,dword ptr [ebp+8]
>004AB345    jge         004AB399
 004AB347    mov         edx,dword ptr [ebp-0C]
 004AB34A    mov         eax,dword ptr [edx]
 004AB34C    mov         ecx,dword ptr [ebp-8]
 004AB34F    test        ecx,ecx
>004AB351    jbe         004AB38A
 004AB353    movzx       esi,byte ptr [eax+1]
 004AB357    xor         edx,edx
 004AB359    mov         dl,byte ptr [eax]
 004AB35B    sar         edx,3
 004AB35E    sar         esi,2
 004AB361    shl         esi,6
 004AB364    mov         edx,dword ptr [ebx+edx*4]
 004AB367    add         edx,esi
 004AB369    movzx       esi,byte ptr [eax+2]
 004AB36D    sar         esi,3
 004AB370    add         esi,esi
 004AB372    add         edx,esi
 004AB374    inc         word ptr [edx]
 004AB377    mov         si,word ptr [edx]
 004AB37A    test        si,si
>004AB37D    ja          004AB382
 004AB37F    dec         word ptr [edx]
 004AB382    add         eax,3
 004AB385    dec         ecx
 004AB386    test        ecx,ecx
>004AB388    ja          004AB353
 004AB38A    inc         dword ptr [ebp-4]
 004AB38D    add         dword ptr [ebp-0C],4
 004AB391    mov         eax,dword ptr [ebp-4]
 004AB394    cmp         eax,dword ptr [ebp+8]
>004AB397    jl          004AB347
 004AB399    pop         esi
 004AB39A    pop         ebx
 004AB39B    mov         esp,ebp
 004AB39D    pop         ebp
 004AB39E    ret         4
*}
end;

//004AC328
{*procedure sub_004AC328(?:?);
begin
 004AC328    push        ebx
 004AC329    push        esi
 004AC32A    push        edi
 004AC32B    mov         ecx,7FC
 004AC330    mov         esi,dword ptr [eax+4]
 004AC333    mov         ebx,dword ptr [eax+1CC]
 004AC339    mov         edx,1
 004AC33E    call        dword ptr [esi]
 004AC340    mov         ecx,eax
 004AC342    xor         edx,edx
 004AC344    add         ecx,3FC
 004AC34A    xor         eax,eax
 004AC34C    mov         dword ptr [ebx+28],ecx
 004AC34F    mov         ebx,ecx
 004AC351    mov         dword ptr [ebx],edx
 004AC353    mov         esi,eax
 004AC355    neg         esi
 004AC357    mov         edi,edx
 004AC359    neg         edi
 004AC35B    mov         dword ptr [ecx+esi*4],edi
 004AC35E    add         ebx,4
 004AC361    inc         eax
 004AC362    inc         edx
 004AC363    cmp         eax,10
>004AC366    jl          004AC351
 004AC368    lea         ebx,[ecx+eax*4]
 004AC36B    cmp         eax,30
>004AC36E    jge         004AC395
 004AC370    mov         esi,eax
 004AC372    mov         edi,edx
 004AC374    neg         esi
 004AC376    neg         edi
 004AC378    mov         dword ptr [ebx],edx
 004AC37A    add         ebx,4
 004AC37D    inc         eax
 004AC37E    mov         dword ptr [ecx+esi*4],edi
 004AC381    test        al,1
>004AC383    je          004AC389
 004AC385    xor         esi,esi
>004AC387    jmp         004AC38E
 004AC389    mov         esi,1
 004AC38E    add         edx,esi
 004AC390    cmp         eax,30
>004AC393    jl          004AC370
 004AC395    lea         ebx,[ecx+eax*4]
 004AC398    cmp         eax,0FF
>004AC39D    jg          004AC3B7
 004AC39F    mov         esi,eax
 004AC3A1    mov         edi,edx
 004AC3A3    neg         esi
 004AC3A5    neg         edi
 004AC3A7    mov         dword ptr [ebx],edx
 004AC3A9    add         ebx,4
 004AC3AC    inc         eax
 004AC3AD    mov         dword ptr [ecx+esi*4],edi
 004AC3B0    cmp         eax,0FF
>004AC3B5    jle         004AC39F
 004AC3B7    pop         edi
 004AC3B8    pop         esi
 004AC3B9    pop         ebx
 004AC3BA    ret
end;*}

//004AC500
procedure @jinit_2pass_quantizer;
begin
{*
 004AC500    push        ebx
 004AC501    mov         ebx,eax
 004AC503    mov         eax,ebx
 004AC505    push        esi
 004AC506    push        edi
 004AC507    push        ebp
 004AC508    mov         esi,dword ptr [eax+4]
 004AC50B    mov         ecx,2C
 004AC510    mov         edx,1
 004AC515    call        dword ptr [esi]
 004AC517    mov         esi,eax
 004AC519    xor         eax,eax
 004AC51B    mov         dword ptr [ebx+1CC],esi
 004AC521    xor         edx,edx
 004AC523    mov         dword ptr [esi],4AC3E4
 004AC529    mov         dword ptr [esi+0C],4AC4F0
 004AC530    mov         dword ptr [esi+20],eax
 004AC533    mov         dword ptr [esi+28],edx
 004AC536    cmp         dword ptr [ebx+78],3
>004AC53A    je          004AC54B
 004AC53C    mov         ecx,dword ptr [ebx]
 004AC53E    mov         eax,ebx
 004AC540    mov         dword ptr [ecx+14],2F
 004AC547    mov         edx,dword ptr [eax]
 004AC549    call        dword ptr [edx]
 004AC54B    mov         eax,ebx
 004AC54D    mov         ecx,80
 004AC552    mov         edx,1
 004AC557    mov         edi,dword ptr [eax+4]
 004AC55A    call        dword ptr [edi]
 004AC55C    mov         dword ptr [esi+18],eax
 004AC55F    xor         edi,edi
 004AC561    mov         eax,ebx
 004AC563    mov         ecx,1000
 004AC568    mov         edx,1
 004AC56D    mov         ebp,dword ptr [eax+4]
 004AC570    call        dword ptr [ebp+4]
 004AC573    mov         edx,dword ptr [esi+18]
 004AC576    mov         dword ptr [edx+edi*4],eax
 004AC579    inc         edi
 004AC57A    cmp         edi,20
>004AC57D    jl          004AC561
 004AC57F    mov         dword ptr [esi+1C],1
 004AC586    cmp         dword ptr [ebx+6C],0
>004AC58A    je          004AC5E1
 004AC58C    mov         edi,dword ptr [ebx+60]
 004AC58F    cmp         edi,8
>004AC592    jge         004AC5AA
 004AC594    mov         eax,dword ptr [ebx]
 004AC596    mov         dword ptr [eax+14],38
 004AC59D    mov         dword ptr [eax+18],8
 004AC5A4    mov         eax,ebx
 004AC5A6    mov         edx,dword ptr [eax]
 004AC5A8    call        dword ptr [edx]
 004AC5AA    cmp         edi,100
>004AC5B0    jle         004AC5C8
 004AC5B2    mov         eax,dword ptr [ebx]
 004AC5B4    mov         dword ptr [eax+14],39
 004AC5BB    mov         dword ptr [eax+18],100
 004AC5C2    mov         eax,ebx
 004AC5C4    mov         edx,dword ptr [eax]
 004AC5C6    call        dword ptr [edx]
 004AC5C8    mov         eax,ebx
 004AC5CA    push        3
 004AC5CC    mov         ecx,edi
 004AC5CE    mov         edx,1
 004AC5D3    mov         ebp,dword ptr [eax+4]
 004AC5D6    call        dword ptr [ebp+8]
 004AC5D9    mov         dword ptr [esi+10],eax
 004AC5DC    mov         dword ptr [esi+14],edi
>004AC5DF    jmp         004AC5E6
 004AC5E1    xor         eax,eax
 004AC5E3    mov         dword ptr [esi+10],eax
 004AC5E6    cmp         dword ptr [ebx+58],0
>004AC5EA    je          004AC5F3
 004AC5EC    mov         dword ptr [ebx+58],2
 004AC5F3    cmp         dword ptr [ebx+58],2
>004AC5F7    jne         004AC61B
 004AC5F9    mov         ecx,dword ptr [ebx+70]
 004AC5FC    mov         eax,ebx
 004AC5FE    add         ecx,ecx
 004AC600    mov         edx,1
 004AC605    mov         edi,dword ptr [eax+4]
 004AC608    lea         ecx,[ecx+ecx*2]
 004AC60B    add         ecx,0C
 004AC60E    call        dword ptr [edi+4]
 004AC611    mov         dword ptr [esi+20],eax
 004AC614    mov         eax,ebx
 004AC616    call        004AC328
 004AC61B    pop         ebp
 004AC61C    pop         edi
 004AC61D    pop         esi
 004AC61E    pop         ebx
 004AC61F    ret
*}
end;

//004AC620
procedure _DF_.;
begin
{*
 004AC620    push        ebx
 004AC621    push        esi
 004AC622    mov         ebx,eax
 004AC624    push        edi
 004AC625    add         esp,0FFFFFFF0
 004AC628    mov         eax,dword ptr [ebx+1A8]
 004AC62E    mov         dword ptr [esp],eax
 004AC631    mov         eax,ebx
 004AC633    mov         edx,dword ptr [ebx+13C]
 004AC639    mov         dword ptr [esp+8],edx
 004AC63D    mov         edx,1
 004AC642    mov         ecx,dword ptr [ebx+24]
 004AC645    mov         esi,dword ptr [eax+4]
 004AC648    add         ecx,ecx
 004AC64A    shl         ecx,2
 004AC64D    call        dword ptr [esi]
 004AC64F    mov         esi,eax
 004AC651    mov         eax,dword ptr [esp]
 004AC654    mov         dword ptr [eax+38],esi
 004AC657    mov         edx,dword ptr [ebx+24]
 004AC65A    mov         ecx,dword ptr [esp]
 004AC65D    shl         edx,2
 004AC660    add         esi,edx
 004AC662    mov         dword ptr [ecx+3C],esi
 004AC665    xor         esi,esi
 004AC667    mov         eax,dword ptr [ebx+0D8]
 004AC66D    mov         dword ptr [esp+0C],eax
>004AC671    jmp         004AC6DB
 004AC673    mov         edx,dword ptr [esp+0C]
 004AC677    mov         eax,dword ptr [edx+0C]
 004AC67A    mov         edx,dword ptr [esp+0C]
 004AC67E    imul        dword ptr [edx+24]
 004AC681    cdq
 004AC682    idiv        eax,dword ptr [ebx+13C]
 004AC688    mov         dword ptr [esp+4],eax
 004AC68C    mov         eax,ebx
 004AC68E    mov         ecx,dword ptr [esp+8]
 004AC692    mov         edx,1
 004AC697    add         ecx,4
 004AC69A    mov         edi,dword ptr [eax+4]
 004AC69D    imul        ecx,dword ptr [esp+4]
 004AC6A2    add         ecx,ecx
 004AC6A4    shl         ecx,2
 004AC6A7    call        dword ptr [edi]
 004AC6A9    mov         edx,dword ptr [esp+4]
 004AC6AD    mov         ecx,dword ptr [esp]
 004AC6B0    shl         edx,2
 004AC6B3    add         eax,edx
 004AC6B5    mov         edx,dword ptr [ecx+38]
 004AC6B8    mov         dword ptr [edx+esi*4],eax
 004AC6BB    mov         ecx,dword ptr [esp+8]
 004AC6BF    mov         edx,dword ptr [esp]
 004AC6C2    add         ecx,4
 004AC6C5    imul        ecx,dword ptr [esp+4]
 004AC6CA    shl         ecx,2
 004AC6CD    add         eax,ecx
 004AC6CF    mov         ecx,dword ptr [edx+3C]
 004AC6D2    mov         dword ptr [ecx+esi*4],eax
 004AC6D5    inc         esi
 004AC6D6    add         dword ptr [esp+0C],54
 004AC6DB    cmp         esi,dword ptr [ebx+24]
>004AC6DE    jl          004AC673
 004AC6E0    add         esp,10
 004AC6E3    pop         edi
 004AC6E4    pop         esi
 004AC6E5    pop         ebx
 004AC6E6    ret
*}
end;

//004ACC18
procedure @jinit_d_main_controller;
begin
{*
 004ACC18    push        ebx
 004ACC19    push        esi
 004ACC1A    mov         esi,eax
 004ACC1C    push        edi
 004ACC1D    mov         eax,esi
 004ACC1F    push        ebp
 004ACC20    mov         ebx,edx
 004ACC22    mov         edx,1
 004ACC27    mov         edi,dword ptr [eax+4]
 004ACC2A    add         esp,0FFFFFFF4
 004ACC2D    mov         ecx,50
 004ACC32    call        dword ptr [edi]
 004ACC34    mov         edi,eax
 004ACC36    mov         dword ptr [esi+1A8],edi
 004ACC3C    mov         dword ptr [edi],4AC9F0
 004ACC42    test        ebx,ebx
>004ACC44    je          004ACC55
 004ACC46    mov         eax,dword ptr [esi]
 004ACC48    mov         dword ptr [eax+14],4
 004ACC4F    mov         eax,esi
 004ACC51    mov         edx,dword ptr [eax]
 004ACC53    call        dword ptr [edx]
 004ACC55    mov         ecx,dword ptr [esi+1C4]
 004ACC5B    cmp         dword ptr [ecx+8],0
>004ACC5F    je          004ACC8F
 004ACC61    cmp         dword ptr [esi+13C],2
>004ACC68    jge         004ACC79
 004ACC6A    mov         eax,dword ptr [esi]
 004ACC6C    mov         dword ptr [eax+14],2F
 004ACC73    mov         eax,esi
 004ACC75    mov         edx,dword ptr [eax]
 004ACC77    call        dword ptr [edx]
 004ACC79    mov         eax,esi
 004ACC7B    call        _DF_.
 004ACC80    mov         edx,dword ptr [esi+13C]
 004ACC86    add         edx,2
 004ACC89    mov         dword ptr [esp+8],edx
>004ACC8D    jmp         004ACC99
 004ACC8F    mov         ecx,dword ptr [esi+13C]
 004ACC95    mov         dword ptr [esp+8],ecx
 004ACC99    xor         eax,eax
 004ACC9B    mov         dword ptr [esp],eax
 004ACC9E    mov         ebx,dword ptr [esi+0D8]
 004ACCA4    lea         eax,[edi+8]
 004ACCA7    mov         edi,eax
>004ACCA9    jmp         004ACCE5
 004ACCAB    mov         eax,dword ptr [ebx+0C]
 004ACCAE    imul        dword ptr [ebx+24]
 004ACCB1    cdq
 004ACCB2    idiv        eax,dword ptr [esi+13C]
 004ACCB8    mov         dword ptr [esp+4],eax
 004ACCBC    mov         eax,esi
 004ACCBE    mov         ecx,dword ptr [esp+4]
 004ACCC2    mov         edx,1
 004ACCC7    imul        ecx,dword ptr [esp+8]
 004ACCCC    push        ecx
 004ACCCD    mov         ecx,dword ptr [ebx+1C]
 004ACCD0    mov         ebp,dword ptr [eax+4]
 004ACCD3    imul        ecx,dword ptr [ebx+24]
 004ACCD7    call        dword ptr [ebp+8]
 004ACCDA    mov         dword ptr [edi],eax
 004ACCDC    add         edi,4
 004ACCDF    inc         dword ptr [esp]
 004ACCE2    add         ebx,54
 004ACCE5    mov         eax,dword ptr [esp]
 004ACCE8    cmp         eax,dword ptr [esi+24]
>004ACCEB    jl          004ACCAB
 004ACCED    add         esp,0C
 004ACCF0    pop         ebp
 004ACCF1    pop         edi
 004ACCF2    pop         esi
 004ACCF3    pop         ebx
 004ACCF4    ret
*}
end;

//004ACCF8
procedure _DF_.;
begin
{*
 004ACCF8    cmp         dword ptr [eax+148],1
 004ACCFF    mov         edx,dword ptr [eax+1AC]
>004ACD05    jle         004ACD10
 004ACD07    mov         dword ptr [edx+1C],1
>004ACD0E    jmp         004ACD39
 004ACD10    mov         ecx,dword ptr [eax+140]
 004ACD16    dec         ecx
 004ACD17    cmp         ecx,dword ptr [eax+94]
>004ACD1D    jbe         004ACD2D
 004ACD1F    mov         eax,dword ptr [eax+14C]
 004ACD25    mov         eax,dword ptr [eax+0C]
 004ACD28    mov         dword ptr [edx+1C],eax
>004ACD2B    jmp         004ACD39
 004ACD2D    mov         ecx,dword ptr [eax+14C]
 004ACD33    mov         eax,dword ptr [ecx+48]
 004ACD36    mov         dword ptr [edx+1C],eax
 004ACD39    xor         ecx,ecx
 004ACD3B    xor         eax,eax
 004ACD3D    mov         dword ptr [edx+14],ecx
 004ACD40    mov         dword ptr [edx+18],eax
 004ACD43    ret
*}
end;

//004ADC74
procedure @jinit_d_coef_controller;
begin
{*
 004ADC74    push        ebx
 004ADC75    push        esi
 004ADC76    push        edi
 004ADC77    mov         edi,eax
 004ADC79    mov         eax,edi
 004ADC7B    push        ebp
 004ADC7C    mov         ebx,edx
 004ADC7E    mov         edx,1
 004ADC83    mov         esi,dword ptr [eax+4]
 004ADC86    add         esp,0FFFFFFF4
 004ADC89    mov         ecx,74
 004ADC8E    call        dword ptr [esi]
 004ADC90    mov         esi,eax
 004ADC92    xor         eax,eax
 004ADC94    mov         dword ptr [edi+1AC],esi
 004ADC9A    test        ebx,ebx
 004ADC9C    mov         dword ptr [esi],4ACD44
 004ADCA2    mov         dword ptr [esi+8],4ACD54
 004ADCA9    mov         dword ptr [esi+70],eax
>004ADCAC    je          004ADD3F
 004ADCB2    xor         edx,edx
 004ADCB4    mov         dword ptr [esp],edx
 004ADCB7    mov         ebx,dword ptr [edi+0D8]
 004ADCBD    lea         eax,[esi+48]
 004ADCC0    mov         dword ptr [esp+8],eax
>004ADCC4    jmp         004ADD21
 004ADCC6    mov         edx,dword ptr [ebx+0C]
 004ADCC9    mov         dword ptr [esp+4],edx
 004ADCCD    cmp         dword ptr [edi+0DC],0
>004ADCD4    je          004ADCE1
 004ADCD6    mov         ecx,dword ptr [esp+4]
 004ADCDA    lea         ecx,[ecx+ecx*2]
 004ADCDD    mov         dword ptr [esp+4],ecx
 004ADCE1    mov         edx,dword ptr [ebx+8]
 004ADCE4    mov         eax,dword ptr [ebx+1C]
 004ADCE7    call        @jround_up
 004ADCEC    push        eax
 004ADCED    mov         edx,dword ptr [ebx+0C]
 004ADCF0    mov         eax,dword ptr [ebx+20]
 004ADCF3    call        @jround_up
 004ADCF8    push        eax
 004ADCF9    mov         eax,edi
 004ADCFB    mov         ecx,dword ptr [esp+0C]
 004ADCFF    mov         edx,1
 004ADD04    push        ecx
 004ADD05    mov         ecx,1
 004ADD0A    mov         ebp,dword ptr [eax+4]
 004ADD0D    call        dword ptr [ebp+14]
 004ADD10    mov         edx,dword ptr [esp+8]
 004ADD14    mov         dword ptr [edx],eax
 004ADD16    add         dword ptr [esp+8],4
 004ADD1B    inc         dword ptr [esp]
 004ADD1E    add         ebx,54
 004ADD21    mov         eax,dword ptr [edi+24]
 004ADD24    cmp         eax,dword ptr [esp]
>004ADD27    jg          004ADCC6
 004ADD29    mov         dword ptr [esi+4],4ACFD4
 004ADD30    mov         dword ptr [esi+0C],4AD1C4
 004ADD37    lea         ecx,[esi+48]
 004ADD3A    mov         dword ptr [esi+10],ecx
>004ADD3D    jmp         004ADD7D
 004ADD3F    mov         eax,edi
 004ADD41    mov         ecx,500
 004ADD46    mov         edx,1
 004ADD4B    mov         ebx,dword ptr [eax+4]
 004ADD4E    call        dword ptr [ebx+4]
 004ADD51    mov         ecx,eax
 004ADD53    xor         eax,eax
 004ADD55    lea         edx,[esi+20]
 004ADD58    mov         ebx,eax
 004ADD5A    inc         eax
 004ADD5B    shl         ebx,7
 004ADD5E    add         ebx,ecx
 004ADD60    mov         dword ptr [edx],ebx
 004ADD62    add         edx,4
 004ADD65    cmp         eax,0A
>004ADD68    jl          004ADD58
 004ADD6A    mov         dword ptr [esi+4],4ACFD0
 004ADD71    mov         dword ptr [esi+0C],4ACD90
 004ADD78    xor         eax,eax
 004ADD7A    mov         dword ptr [esi+10],eax
 004ADD7D    add         esp,0C
 004ADD80    pop         ebp
 004ADD81    pop         edi
 004ADD82    pop         esi
 004ADD83    pop         ebx
 004ADD84    ret
*}
end;

//004ADD88
procedure _DF_.;
begin
{*
 004ADD88    push        ebx
 004ADD89    push        esi
 004ADD8A    mov         esi,eax
 004ADD8C    sub         edx,1
 004ADD8F    mov         ebx,dword ptr [esi+1B0]
>004ADD95    jb          004ADD9F
 004ADD97    dec         edx
>004ADD98    je          004ADDF6
 004ADD9A    dec         edx
>004ADD9B    je          004ADDD8
>004ADD9D    jmp         004ADE14
 004ADD9F    cmp         dword ptr [esi+54],0
>004ADDA3    je          004ADDCA
 004ADDA5    mov         dword ptr [ebx+4],4ADE30
 004ADDAC    cmp         dword ptr [ebx+0C],0
>004ADDB0    jne         004ADE23
 004ADDB2    mov         eax,dword ptr [ebx+10]
 004ADDB5    xor         ecx,ecx
 004ADDB7    push        eax
 004ADDB8    mov         eax,esi
 004ADDBA    push        1
 004ADDBC    mov         esi,dword ptr [eax+4]
 004ADDBF    mov         edx,dword ptr [ebx+8]
 004ADDC2    call        dword ptr [esi+1C]
 004ADDC5    mov         dword ptr [ebx+0C],eax
>004ADDC8    jmp         004ADE23
 004ADDCA    mov         eax,dword ptr [esi+1C4]
 004ADDD0    mov         edx,dword ptr [eax+4]
 004ADDD3    mov         dword ptr [ebx+4],edx
>004ADDD6    jmp         004ADE23
 004ADDD8    cmp         dword ptr [ebx+8],0
>004ADDDC    jne         004ADDED
 004ADDDE    mov         ecx,dword ptr [esi]
 004ADDE0    mov         eax,esi
 004ADDE2    mov         dword ptr [ecx+14],4
 004ADDE9    mov         edx,dword ptr [eax]
 004ADDEB    call        dword ptr [edx]
 004ADDED    mov         dword ptr [ebx+4],4ADEAC
>004ADDF4    jmp         004ADE23
 004ADDF6    cmp         dword ptr [ebx+8],0
>004ADDFA    jne         004ADE0B
 004ADDFC    mov         ecx,dword ptr [esi]
 004ADDFE    mov         eax,esi
 004ADE00    mov         dword ptr [ecx+14],4
 004ADE07    mov         edx,dword ptr [eax]
 004ADE09    call        dword ptr [edx]
 004ADE0B    mov         dword ptr [ebx+4],4ADF50
>004ADE12    jmp         004ADE23
 004ADE14    mov         ecx,dword ptr [esi]
 004ADE16    mov         eax,esi
 004ADE18    mov         dword ptr [ecx+14],4
 004ADE1F    mov         edx,dword ptr [eax]
 004ADE21    call        dword ptr [edx]
 004ADE23    xor         ecx,ecx
 004ADE25    mov         dword ptr [ebx+18],ecx
 004ADE28    mov         dword ptr [ebx+14],ecx
 004ADE2B    pop         esi
 004ADE2C    pop         ebx
 004ADE2D    ret
*}
end;

//004ADFE8
procedure @jinit_d_post_controller;
begin
{*
 004ADFE8    push        ebx
 004ADFE9    push        esi
 004ADFEA    mov         esi,eax
 004ADFEC    push        edi
 004ADFED    mov         eax,esi
 004ADFEF    push        ecx
 004ADFF0    mov         dword ptr [esp],edx
 004ADFF3    mov         edx,1
 004ADFF8    mov         ebx,dword ptr [eax+4]
 004ADFFB    mov         ecx,1C
 004AE000    call        dword ptr [ebx]
 004AE002    mov         ebx,eax
 004AE004    xor         eax,eax
 004AE006    mov         dword ptr [esi+1B0],ebx
 004AE00C    xor         edx,edx
 004AE00E    mov         dword ptr [ebx],4ADD88;_DF_.
 004AE014    mov         dword ptr [ebx+8],eax
 004AE017    mov         dword ptr [ebx+0C],edx
 004AE01A    cmp         dword ptr [esi+54],0
>004AE01E    je          004AE074
 004AE020    mov         edi,dword ptr [esi+138]
 004AE026    mov         dword ptr [ebx+10],edi
 004AE029    cmp         dword ptr [esp],0
>004AE02D    je          004AE059
 004AE02F    mov         eax,dword ptr [esi+70]
 004AE032    imul        dword ptr [esi+78]
 004AE035    push        eax
 004AE036    mov         edx,edi
 004AE038    mov         eax,dword ptr [esi+74]
 004AE03B    call        @jround_up
 004AE040    push        eax
 004AE041    mov         eax,esi
 004AE043    mov         edx,dword ptr [ebx+10]
 004AE046    xor         ecx,ecx
 004AE048    push        edx
 004AE049    mov         edx,1
 004AE04E    mov         esi,dword ptr [eax+4]
 004AE051    call        dword ptr [esi+10]
 004AE054    mov         dword ptr [ebx+8],eax
>004AE057    jmp         004AE074
 004AE059    mov         eax,dword ptr [ebx+10]
 004AE05C    mov         edx,1
 004AE061    push        eax
 004AE062    mov         eax,esi
 004AE064    mov         ecx,dword ptr [esi+70]
 004AE067    imul        ecx,dword ptr [esi+78]
 004AE06B    mov         esi,dword ptr [eax+4]
 004AE06E    call        dword ptr [esi+8]
 004AE071    mov         dword ptr [ebx+0C],eax
 004AE074    pop         edx
 004AE075    pop         edi
 004AE076    pop         esi
 004AE077    pop         ebx
 004AE078    ret
*}
end;

//004AE07C
procedure _DF_.;
begin
{*
 004AE07C    push        ebx
 004AE07D    push        esi
 004AE07E    push        edi
 004AE07F    push        ebp
 004AE080    add         esp,0FFFFFFD0
 004AE083    xor         edx,edx
 004AE085    xor         ecx,ecx
 004AE087    mov         dword ptr [esp],eax
 004AE08A    mov         eax,dword ptr [esp]
 004AE08D    mov         eax,dword ptr [eax+1C0]
 004AE093    mov         dword ptr [esp+0C],edx
 004AE097    mov         dword ptr [esp+10],ecx
 004AE09B    xor         edx,edx
 004AE09D    mov         dword ptr [esp+4],edx
 004AE0A1    add         eax,4
 004AE0A4    mov         ecx,dword ptr [esp]
 004AE0A7    mov         edx,dword ptr [ecx+0D8]
 004AE0AD    mov         dword ptr [esp+8],edx
 004AE0B1    mov         dword ptr [esp+20],eax
>004AE0B5    jmp         004AE2B7
 004AE0BA    mov         ecx,dword ptr [esp+8]
 004AE0BE    mov         eax,dword ptr [ecx+24]
 004AE0C1    dec         eax
>004AE0C2    je          004AE0D3
 004AE0C4    dec         eax
>004AE0C5    je          004AE0E6
 004AE0C7    sub         eax,2
>004AE0CA    je          004AE0F6
 004AE0CC    sub         eax,4
>004AE0CF    je          004AE106
>004AE0D1    jmp         004AE14D
 004AE0D3    mov         dword ptr [esp+10],4AF864;@jpeg_idct_1x1
 004AE0DB    xor         edx,edx
 004AE0DD    mov         dword ptr [esp+0C],edx
>004AE0E1    jmp         004AE16A
 004AE0E6    mov         dword ptr [esp+10],4AF674;@jpeg_idct_2x2
 004AE0EE    xor         ecx,ecx
 004AE0F0    mov         dword ptr [esp+0C],ecx
>004AE0F4    jmp         004AE16A
 004AE0F6    mov         dword ptr [esp+10],4AF2C0;@jpeg_idct_4x4
 004AE0FE    xor         eax,eax
 004AE100    mov         dword ptr [esp+0C],eax
>004AE104    jmp         004AE16A
 004AE106    mov         edx,dword ptr [esp]
 004AE109    mov         ecx,dword ptr [edx+48]
 004AE10C    dec         ecx
>004AE10D    je          004AE114
 004AE10F    dec         ecx
>004AE110    je          004AE126
>004AE112    jmp         004AE138
 004AE114    mov         dword ptr [esp+10],4AEE8C;@jpeg_idct_ifast
 004AE11C    mov         dword ptr [esp+0C],1
>004AE124    jmp         004AE16A
 004AE126    mov         dword ptr [esp+10],4AEA48;@jpeg_idct_float
 004AE12E    mov         dword ptr [esp+0C],2
>004AE136    jmp         004AE16A
 004AE138    mov         eax,dword ptr [esp]
 004AE13B    mov         edx,dword ptr [eax]
 004AE13D    mov         dword ptr [edx+14],30
 004AE144    mov         eax,dword ptr [esp]
 004AE147    mov         edx,dword ptr [eax]
 004AE149    call        dword ptr [edx]
>004AE14B    jmp         004AE16A
 004AE14D    mov         ecx,dword ptr [esp]
 004AE150    mov         eax,dword ptr [ecx]
 004AE152    mov         dword ptr [eax+14],7
 004AE159    mov         edx,dword ptr [esp+8]
 004AE15D    mov         ecx,dword ptr [edx+24]
 004AE160    mov         dword ptr [eax+18],ecx
 004AE163    mov         eax,dword ptr [esp]
 004AE166    mov         edx,dword ptr [eax]
 004AE168    call        dword ptr [edx]
 004AE16A    mov         ecx,dword ptr [esp+20]
 004AE16E    mov         eax,dword ptr [esp+10]
 004AE172    mov         dword ptr [ecx],eax
 004AE174    mov         edx,dword ptr [esp+8]
 004AE178    cmp         dword ptr [edx+30],0
>004AE17C    je          004AE2A9
 004AE182    mov         ecx,dword ptr [esp+20]
 004AE186    mov         eax,dword ptr [ecx+28]
 004AE189    cmp         eax,dword ptr [esp+0C]
>004AE18D    je          004AE2A9
 004AE193    mov         edx,dword ptr [esp+8]
 004AE197    mov         ecx,dword ptr [edx+4C]
 004AE19A    mov         dword ptr [esp+14],ecx
 004AE19E    cmp         dword ptr [esp+14],0
>004AE1A3    je          004AE2A9
 004AE1A9    mov         eax,dword ptr [esp+20]
 004AE1AD    mov         edx,dword ptr [esp+0C]
 004AE1B1    mov         dword ptr [eax+28],edx
 004AE1B4    mov         ecx,dword ptr [esp+0C]
 004AE1B8    sub         ecx,1
>004AE1BB    jb          004AE1C7
>004AE1BD    je          004AE1EC
 004AE1BF    dec         ecx
>004AE1C0    je          004AE22D
>004AE1C2    jmp         004AE296
 004AE1C7    mov         eax,dword ptr [esp+8]
 004AE1CB    mov         edx,dword ptr [eax+50]
 004AE1CE    xor         eax,eax
 004AE1D0    mov         ecx,edx
 004AE1D2    mov         edx,dword ptr [esp+14]
 004AE1D6    movzx       ebx,word ptr [edx]
 004AE1D9    mov         dword ptr [ecx],ebx
 004AE1DB    inc         eax
 004AE1DC    add         ecx,4
 004AE1DF    add         edx,2
 004AE1E2    cmp         eax,40
>004AE1E5    jl          004AE1D6
>004AE1E7    jmp         004AE2A9
 004AE1EC    mov         eax,dword ptr [esp+8]
 004AE1F0    mov         edx,dword ptr [eax+50]
 004AE1F3    xor         eax,eax
 004AE1F5    mov         dword ptr [esp+24],edx
 004AE1F9    mov         ecx,5ADA64
 004AE1FE    mov         edx,dword ptr [esp+14]
 004AE202    movzx       ebx,word ptr [edx]
 004AE205    movsx       esi,word ptr [ecx]
 004AE208    imul        ebx,esi
 004AE20B    add         ebx,800
 004AE211    mov         esi,dword ptr [esp+24]
 004AE215    sar         ebx,0C
 004AE218    add         ecx,2
 004AE21B    mov         dword ptr [esi],ebx
 004AE21D    add         edx,2
 004AE220    add         dword ptr [esp+24],4
 004AE225    inc         eax
 004AE226    cmp         eax,40
>004AE229    jl          004AE202
>004AE22B    jmp         004AE2A9
 004AE22D    mov         eax,dword ptr [esp+8]
 004AE231    mov         edx,dword ptr [eax+50]
 004AE234    xor         eax,eax
 004AE236    mov         dword ptr [esp+18],edx
 004AE23A    xor         edx,edx
 004AE23C    mov         dword ptr [esp+1C],edx
 004AE240    mov         dword ptr [esp+28],5ADAE4
 004AE248    xor         edi,edi
 004AE24A    mov         edx,dword ptr [esp+18]
 004AE24E    lea         ebx,[edx+eax*4]
 004AE251    mov         ecx,5ADAE4
 004AE256    mov         edx,dword ptr [esp+28]
 004AE25A    mov         esi,edx
 004AE25C    mov         edx,dword ptr [esp+14]
 004AE260    lea         edx,[edx+eax*2]
 004AE263    movzx       ebp,word ptr [edx]
 004AE266    mov         dword ptr [esp+2C],ebp
 004AE26A    add         edx,2
 004AE26D    fild        dword ptr [esp+2C]
 004AE271    inc         eax
 004AE272    inc         edi
 004AE273    fmul        qword ptr [esi]
 004AE275    fmul        qword ptr [ecx]
 004AE277    add         ecx,8
 004AE27A    fstp        dword ptr [ebx]
 004AE27C    add         ebx,4
 004AE27F    cmp         edi,8
>004AE282    jl          004AE263
 004AE284    inc         dword ptr [esp+1C]
 004AE288    add         dword ptr [esp+28],8
 004AE28D    cmp         dword ptr [esp+1C],8
>004AE292    jl          004AE248
>004AE294    jmp         004AE2A9
 004AE296    mov         eax,dword ptr [esp]
 004AE299    mov         edx,dword ptr [eax]
 004AE29B    mov         dword ptr [edx+14],30
 004AE2A2    mov         eax,dword ptr [esp]
 004AE2A5    mov         edx,dword ptr [eax]
 004AE2A7    call        dword ptr [edx]
 004AE2A9    add         dword ptr [esp+20],4
 004AE2AE    inc         dword ptr [esp+4]
 004AE2B2    add         dword ptr [esp+8],54
 004AE2B7    mov         ecx,dword ptr [esp]
 004AE2BA    mov         eax,dword ptr [ecx+24]
 004AE2BD    cmp         eax,dword ptr [esp+4]
>004AE2C1    jg          004AE0BA
 004AE2C7    add         esp,30
 004AE2CA    pop         ebp
 004AE2CB    pop         edi
 004AE2CC    pop         esi
 004AE2CD    pop         ebx
 004AE2CE    ret
*}
end;

//004AE2D0
procedure @jinit_inverse_dct;
begin
{*
 004AE2D0    push        ebx
 004AE2D1    push        esi
 004AE2D2    mov         esi,eax
 004AE2D4    push        edi
 004AE2D5    mov         eax,esi
 004AE2D7    push        ebp
 004AE2D8    push        ecx
 004AE2D9    mov         ecx,54
 004AE2DE    mov         ebx,dword ptr [eax+4]
 004AE2E1    mov         edx,1
 004AE2E6    call        dword ptr [ebx]
 004AE2E8    mov         dword ptr [esi+1C0],eax
 004AE2EE    mov         dword ptr [eax],4AE07C;_DF_.
 004AE2F4    xor         edx,edx
 004AE2F6    lea         edi,[eax+2C]
 004AE2F9    mov         dword ptr [esp],edx
 004AE2FC    mov         ebx,dword ptr [esi+0D8]
>004AE302    jmp         004AE33B
 004AE304    mov         eax,esi
 004AE306    mov         ecx,100
 004AE30B    mov         edx,1
 004AE310    mov         ebp,dword ptr [eax+4]
 004AE313    call        dword ptr [ebp]
 004AE316    mov         dword ptr [ebx+50],eax
 004AE319    push        100
 004AE31E    push        0
 004AE320    mov         eax,dword ptr [ebx+50]
 004AE323    push        eax
 004AE324    call        _memset
 004AE329    add         esp,0C
 004AE32C    mov         dword ptr [edi],0FFFFFFFF
 004AE332    add         edi,4
 004AE335    inc         dword ptr [esp]
 004AE338    add         ebx,54
 004AE33B    mov         edx,dword ptr [esp]
 004AE33E    cmp         edx,dword ptr [esi+24]
>004AE341    jl          004AE304
 004AE343    pop         edx
 004AE344    pop         ebp
 004AE345    pop         edi
 004AE346    pop         esi
 004AE347    pop         ebx
 004AE348    ret
*}
end;

//004AE34C
procedure _DF_.;
begin
{*
 004AE34C    mov         edx,dword ptr [eax+1C4]
 004AE352    mov         ecx,dword ptr [eax+138]
 004AE358    mov         dword ptr [edx+5C],ecx
 004AE35B    mov         eax,dword ptr [eax+74]
 004AE35E    mov         dword ptr [edx+60],eax
 004AE361    ret
*}
end;

//004AE830
procedure @jinit_upsampler;
begin
{*
 004AE830    push        ebx
 004AE831    mov         ebx,eax
 004AE833    mov         eax,ebx
 004AE835    push        esi
 004AE836    push        edi
 004AE837    push        ebp
 004AE838    mov         esi,dword ptr [eax+4]
 004AE83B    add         esp,0FFFFFFE4
 004AE83E    mov         ecx,0A0
 004AE843    mov         edx,1
 004AE848    call        dword ptr [esi]
 004AE84A    mov         dword ptr [esp],eax
 004AE84D    mov         eax,dword ptr [esp]
 004AE850    mov         dword ptr [ebx+1C4],eax
 004AE856    mov         edx,dword ptr [esp]
 004AE859    mov         dword ptr [edx],4AE34C;_DF_.
 004AE85F    mov         ecx,dword ptr [esp]
 004AE862    mov         dword ptr [ecx+4],4AE364
 004AE869    mov         eax,dword ptr [esp]
 004AE86C    xor         edx,edx
 004AE86E    mov         dword ptr [eax+8],edx
 004AE871    cmp         dword ptr [ebx+12C],0
>004AE878    je          004AE889
 004AE87A    mov         ecx,dword ptr [ebx]
 004AE87C    mov         eax,ebx
 004AE87E    mov         dword ptr [ecx+14],19
 004AE885    mov         edx,dword ptr [eax]
 004AE887    call        dword ptr [edx]
 004AE889    cmp         dword ptr [ebx+4C],0
>004AE88D    je          004AE898
 004AE88F    cmp         dword ptr [ebx+13C],1
>004AE896    jg          004AE89C
 004AE898    xor         ecx,ecx
>004AE89A    jmp         004AE8A1
 004AE89C    mov         ecx,1
 004AE8A1    mov         dword ptr [esp+0C],ecx
 004AE8A5    xor         eax,eax
 004AE8A7    mov         dword ptr [esp+4],eax
 004AE8AB    mov         edi,dword ptr [ebx+0D8]
 004AE8B1    mov         eax,dword ptr [esp]
 004AE8B4    lea         edx,[eax+8C]
 004AE8BA    mov         dword ptr [esp+18],edx
 004AE8BE    mov         ecx,dword ptr [esp]
 004AE8C1    lea         esi,[ecx+64]
>004AE8C4    jmp         004AEA33
 004AE8C9    mov         eax,dword ptr [edi+8]
 004AE8CC    mov         ecx,dword ptr [edi+24]
 004AE8CF    imul        ecx
 004AE8D1    cdq
 004AE8D2    idiv        eax,dword ptr [ebx+13C]
 004AE8D8    mov         ebp,eax
 004AE8DA    mov         eax,dword ptr [edi+0C]
 004AE8DD    imul        ecx
 004AE8DF    cdq
 004AE8E0    idiv        eax,dword ptr [ebx+13C]
 004AE8E6    mov         ecx,eax
 004AE8E8    mov         eax,dword ptr [ebx+134]
 004AE8EE    mov         dword ptr [esp+10],eax
 004AE8F2    mov         edx,dword ptr [ebx+138]
 004AE8F8    mov         dword ptr [esp+14],edx
 004AE8FC    mov         dword ptr [esi],ecx
 004AE8FE    mov         dword ptr [esp+8],1
 004AE906    cmp         dword ptr [edi+30],0
>004AE90A    jne         004AE91E
 004AE90C    mov         dword ptr [esi-30],4AE470
 004AE913    xor         ecx,ecx
 004AE915    mov         dword ptr [esp+8],ecx
>004AE919    jmp         004AE9F7
 004AE91E    cmp         ebp,dword ptr [esp+10]
>004AE922    jne         004AE93C
 004AE924    cmp         ecx,dword ptr [esp+14]
>004AE928    jne         004AE93C
 004AE92A    mov         dword ptr [esi-30],4AE464
 004AE931    xor         eax,eax
 004AE933    mov         dword ptr [esp+8],eax
>004AE937    jmp         004AE9F7
 004AE93C    mov         edx,ebp
 004AE93E    add         edx,edx
 004AE940    cmp         edx,dword ptr [esp+10]
>004AE944    jne         004AE971
 004AE946    cmp         ecx,dword ptr [esp+14]
>004AE94A    jne         004AE971
 004AE94C    cmp         dword ptr [esp+0C],0
>004AE951    je          004AE965
 004AE953    cmp         dword ptr [edi+28],2
>004AE957    jbe         004AE965
 004AE959    mov         dword ptr [esi-30],4AE628
>004AE960    jmp         004AE9F7
 004AE965    mov         dword ptr [esi-30],4AE53C
>004AE96C    jmp         004AE9F7
 004AE971    mov         eax,ebp
 004AE973    add         eax,eax
 004AE975    cmp         eax,dword ptr [esp+10]
>004AE979    jne         004AE9AE
 004AE97B    mov         edx,ecx
 004AE97D    add         edx,edx
 004AE97F    cmp         edx,dword ptr [esp+14]
>004AE983    jne         004AE9AE
 004AE985    cmp         dword ptr [esp+0C],0
>004AE98A    je          004AE9A5
 004AE98C    cmp         dword ptr [edi+28],2
>004AE990    jbe         004AE9A5
 004AE992    mov         dword ptr [esi-30],4AE6DC
 004AE999    mov         ecx,dword ptr [esp]
 004AE99C    mov         dword ptr [ecx+8],1
>004AE9A3    jmp         004AE9F7
 004AE9A5    mov         dword ptr [esi-30],4AE598
>004AE9AC    jmp         004AE9F7
 004AE9AE    mov         eax,dword ptr [esp+10]
 004AE9B2    cdq
 004AE9B3    idiv        eax,ebp
 004AE9B5    test        edx,edx
>004AE9B7    jne         004AE9E8
 004AE9B9    mov         eax,dword ptr [esp+14]
 004AE9BD    cdq
 004AE9BE    idiv        eax,ecx
 004AE9C0    test        edx,edx
>004AE9C2    jne         004AE9E8
 004AE9C4    mov         dword ptr [esi-30],4AE480
 004AE9CB    mov         eax,dword ptr [esp+10]
 004AE9CF    cdq
 004AE9D0    idiv        eax,ebp
 004AE9D2    mov         edx,dword ptr [esp+18]
 004AE9D6    mov         byte ptr [edx],al
 004AE9D8    mov         eax,dword ptr [esp+14]
 004AE9DC    cdq
 004AE9DD    idiv        eax,ecx
 004AE9DF    mov         ecx,dword ptr [esp+18]
 004AE9E3    mov         byte ptr [ecx+0A],al
>004AE9E6    jmp         004AE9F7
 004AE9E8    mov         eax,dword ptr [ebx]
 004AE9EA    mov         dword ptr [eax+14],26
 004AE9F1    mov         eax,ebx
 004AE9F3    mov         edx,dword ptr [eax]
 004AE9F5    call        dword ptr [edx]
 004AE9F7    cmp         dword ptr [esp+8],0
>004AE9FC    je          004AEA25
 004AE9FE    mov         ecx,dword ptr [ebx+138]
 004AEA04    push        ecx
 004AEA05    mov         edx,dword ptr [ebx+134]
 004AEA0B    mov         eax,dword ptr [ebx+70]
 004AEA0E    call        @jround_up
 004AEA13    mov         ecx,eax
 004AEA15    mov         eax,ebx
 004AEA17    mov         edx,1
 004AEA1C    mov         ebp,dword ptr [eax+4]
 004AEA1F    call        dword ptr [ebp+8]
 004AEA22    mov         dword ptr [esi-58],eax
 004AEA25    add         esi,4
 004AEA28    inc         dword ptr [esp+18]
 004AEA2C    inc         dword ptr [esp+4]
 004AEA30    add         edi,54
 004AEA33    mov         eax,dword ptr [esp+4]
 004AEA37    cmp         eax,dword ptr [ebx+24]
>004AEA3A    jl          004AE8C9
 004AEA40    add         esp,1C
 004AEA43    pop         ebp
 004AEA44    pop         edi
 004AEA45    pop         esi
 004AEA46    pop         ebx
 004AEA47    ret
*}
end;

//004AEA48
procedure @jpeg_idct_float;
begin
{*
 004AEA48    push        ebp
 004AEA49    mov         ebp,esp
 004AEA4B    add         esp,0FFFFFEB0
 004AEA51    push        ebx
 004AEA52    push        esi
 004AEA53    push        edi
 004AEA54    mov         edi,8
 004AEA59    mov         eax,dword ptr [eax+144]
 004AEA5F    lea         ebx,[ebp-150]
 004AEA65    add         eax,80
 004AEA6A    mov         dword ptr [ebp-48],eax
 004AEA6D    mov         eax,ecx
 004AEA6F    mov         edx,dword ptr [edx+50]
 004AEA72    cmp         word ptr [eax+10],0
>004AEA77    jne         004AEAF3
 004AEA79    cmp         word ptr [eax+20],0
>004AEA7E    jne         004AEAF3
 004AEA80    cmp         word ptr [eax+30],0
>004AEA85    jne         004AEAF3
 004AEA87    cmp         word ptr [eax+40],0
>004AEA8C    jne         004AEAF3
 004AEA8E    cmp         word ptr [eax+50],0
>004AEA93    jne         004AEAF3
 004AEA95    cmp         word ptr [eax+60],0
>004AEA9A    jne         004AEAF3
 004AEA9C    cmp         word ptr [eax+70],0
>004AEAA1    jne         004AEAF3
 004AEAA3    fild        word ptr [eax]
 004AEAA5    add         eax,2
 004AEAA8    fmul        dword ptr [edx]
 004AEAAA    add         edx,4
 004AEAAD    fstp        dword ptr [ebp-4C]
 004AEAB0    mov         ecx,dword ptr [ebp-4C]
 004AEAB3    mov         dword ptr [ebx],ecx
 004AEAB5    mov         ecx,dword ptr [ebp-4C]
 004AEAB8    mov         dword ptr [ebx+20],ecx
 004AEABB    mov         ecx,dword ptr [ebp-4C]
 004AEABE    mov         dword ptr [ebx+40],ecx
 004AEAC1    mov         ecx,dword ptr [ebp-4C]
 004AEAC4    mov         dword ptr [ebx+60],ecx
 004AEAC7    mov         ecx,dword ptr [ebp-4C]
 004AEACA    mov         dword ptr [ebx+80],ecx
 004AEAD0    mov         ecx,dword ptr [ebp-4C]
 004AEAD3    mov         dword ptr [ebx+0A0],ecx
 004AEAD9    mov         ecx,dword ptr [ebp-4C]
 004AEADC    mov         dword ptr [ebx+0C0],ecx
 004AEAE2    mov         ecx,dword ptr [ebp-4C]
 004AEAE5    mov         dword ptr [ebx+0E0],ecx
 004AEAEB    add         ebx,4
>004AEAEE    jmp         004AEC76
 004AEAF3    fild        word ptr [eax]
 004AEAF5    fmul        dword ptr [edx]
 004AEAF7    fstp        dword ptr [ebp-4]
 004AEAFA    fild        word ptr [eax+20]
 004AEAFD    fmul        dword ptr [edx+40]
 004AEB00    fstp        dword ptr [ebp-8]
 004AEB03    fild        word ptr [eax+40]
 004AEB06    fmul        dword ptr [edx+80]
 004AEB0C    fstp        dword ptr [ebp-0C]
 004AEB0F    fild        word ptr [eax+60]
 004AEB12    fmul        dword ptr [edx+0C0]
 004AEB18    fstp        dword ptr [ebp-10]
 004AEB1B    fld         dword ptr [ebp-4]
 004AEB1E    fadd        dword ptr [ebp-0C]
 004AEB21    fstp        dword ptr [ebp-24]
 004AEB24    fld         dword ptr [ebp-4]
 004AEB27    fsub        dword ptr [ebp-0C]
 004AEB2A    fstp        dword ptr [ebp-28]
 004AEB2D    fld         dword ptr [ebp-8]
 004AEB30    fadd        dword ptr [ebp-10]
 004AEB33    fstp        dword ptr [ebp-30]
 004AEB36    fld         dword ptr [ebp-8]
 004AEB39    fsub        dword ptr [ebp-10]
 004AEB3C    fmul        dword ptr ds:[4AEE7C]
 004AEB42    fsub        dword ptr [ebp-30]
 004AEB45    fstp        dword ptr [ebp-2C]
 004AEB48    fld         dword ptr [ebp-24]
 004AEB4B    fadd        dword ptr [ebp-30]
 004AEB4E    fstp        dword ptr [ebp-4]
 004AEB51    fld         dword ptr [ebp-24]
 004AEB54    fsub        dword ptr [ebp-30]
 004AEB57    fstp        dword ptr [ebp-10]
 004AEB5A    fld         dword ptr [ebp-28]
 004AEB5D    fadd        dword ptr [ebp-2C]
 004AEB60    fstp        dword ptr [ebp-8]
 004AEB63    fld         dword ptr [ebp-28]
 004AEB66    fsub        dword ptr [ebp-2C]
 004AEB69    fstp        dword ptr [ebp-0C]
 004AEB6C    fild        word ptr [eax+10]
 004AEB6F    fmul        dword ptr [edx+20]
 004AEB72    fstp        dword ptr [ebp-14]
 004AEB75    fild        word ptr [eax+30]
 004AEB78    fmul        dword ptr [edx+60]
 004AEB7B    fstp        dword ptr [ebp-18]
 004AEB7E    fild        word ptr [eax+50]
 004AEB81    fmul        dword ptr [edx+0A0]
 004AEB87    fstp        dword ptr [ebp-1C]
 004AEB8A    fild        word ptr [eax+70]
 004AEB8D    fmul        dword ptr [edx+0E0]
 004AEB93    fstp        dword ptr [ebp-20]
 004AEB96    fld         dword ptr [ebp-1C]
 004AEB99    fadd        dword ptr [ebp-18]
 004AEB9C    fstp        dword ptr [ebp-44]
 004AEB9F    fld         dword ptr [ebp-1C]
 004AEBA2    fsub        dword ptr [ebp-18]
 004AEBA5    fstp        dword ptr [ebp-38]
 004AEBA8    fld         dword ptr [ebp-14]
 004AEBAB    fadd        dword ptr [ebp-20]
 004AEBAE    fstp        dword ptr [ebp-3C]
 004AEBB1    fld         dword ptr [ebp-14]
 004AEBB4    fsub        dword ptr [ebp-20]
 004AEBB7    fstp        dword ptr [ebp-40]
 004AEBBA    fld         dword ptr [ebp-3C]
 004AEBBD    fadd        dword ptr [ebp-44]
 004AEBC0    fstp        dword ptr [ebp-20]
 004AEBC3    fld         dword ptr [ebp-3C]
 004AEBC6    fsub        dword ptr [ebp-44]
 004AEBC9    fmul        dword ptr ds:[4AEE7C]
 004AEBCF    fstp        dword ptr [ebp-28]
 004AEBD2    fld         dword ptr [ebp-38]
 004AEBD5    fadd        dword ptr [ebp-40]
 004AEBD8    fmul        dword ptr ds:[4AEE80]
 004AEBDE    fstp        dword ptr [ebp-34]
 004AEBE1    fld         dword ptr ds:[4AEE84]
 004AEBE7    fmul        dword ptr [ebp-40]
 004AEBEA    fsub        dword ptr [ebp-34]
 004AEBED    fstp        dword ptr [ebp-24]
 004AEBF0    fld         dword ptr ds:[4AEE88]
 004AEBF6    fmul        dword ptr [ebp-38]
 004AEBF9    add         eax,2
 004AEBFC    add         edx,4
 004AEBFF    fadd        dword ptr [ebp-34]
 004AEC02    fstp        dword ptr [ebp-2C]
 004AEC05    fld         dword ptr [ebp-2C]
 004AEC08    fsub        dword ptr [ebp-20]
 004AEC0B    fstp        dword ptr [ebp-1C]
 004AEC0E    fld         dword ptr [ebp-28]
 004AEC11    fsub        dword ptr [ebp-1C]
 004AEC14    fstp        dword ptr [ebp-18]
 004AEC17    fld         dword ptr [ebp-24]
 004AEC1A    fadd        dword ptr [ebp-18]
 004AEC1D    fstp        dword ptr [ebp-14]
 004AEC20    fld         dword ptr [ebp-4]
 004AEC23    fadd        dword ptr [ebp-20]
 004AEC26    fstp        dword ptr [ebx]
 004AEC28    fld         dword ptr [ebp-4]
 004AEC2B    fsub        dword ptr [ebp-20]
 004AEC2E    fstp        dword ptr [ebx+0E0]
 004AEC34    fld         dword ptr [ebp-8]
 004AEC37    fadd        dword ptr [ebp-1C]
 004AEC3A    fstp        dword ptr [ebx+20]
 004AEC3D    fld         dword ptr [ebp-8]
 004AEC40    fsub        dword ptr [ebp-1C]
 004AEC43    fstp        dword ptr [ebx+0C0]
 004AEC49    fld         dword ptr [ebp-0C]
 004AEC4C    fadd        dword ptr [ebp-18]
 004AEC4F    fstp        dword ptr [ebx+40]
 004AEC52    fld         dword ptr [ebp-0C]
 004AEC55    fsub        dword ptr [ebp-18]
 004AEC58    fstp        dword ptr [ebx+0A0]
 004AEC5E    fld         dword ptr [ebp-10]
 004AEC61    fadd        dword ptr [ebp-14]
 004AEC64    fstp        dword ptr [ebx+80]
 004AEC6A    fld         dword ptr [ebp-10]
 004AEC6D    fsub        dword ptr [ebp-14]
 004AEC70    fstp        dword ptr [ebx+60]
 004AEC73    add         ebx,4
 004AEC76    dec         edi
 004AEC77    test        edi,edi
>004AEC79    jg          004AEA72
 004AEC7F    mov         eax,dword ptr [ebp+0C]
 004AEC82    lea         ebx,[ebp-150]
 004AEC88    mov         edx,eax
 004AEC8A    xor         edi,edi
 004AEC8C    mov         dword ptr [ebp-50],edx
 004AEC8F    mov         ecx,dword ptr [ebp-50]
 004AEC92    fld         dword ptr [ebx]
 004AEC94    fadd        dword ptr [ebx+10]
 004AEC97    mov         esi,dword ptr [ecx]
 004AEC99    add         esi,dword ptr [ebp+8]
 004AEC9C    fstp        dword ptr [ebp-24]
 004AEC9F    fld         dword ptr [ebx]
 004AECA1    fsub        dword ptr [ebx+10]
 004AECA4    fstp        dword ptr [ebp-28]
 004AECA7    fld         dword ptr [ebx+8]
 004AECAA    fadd        dword ptr [ebx+18]
 004AECAD    fstp        dword ptr [ebp-30]
 004AECB0    fld         dword ptr [ebx+8]
 004AECB3    fsub        dword ptr [ebx+18]
 004AECB6    fmul        dword ptr ds:[4AEE7C]
 004AECBC    fsub        dword ptr [ebp-30]
 004AECBF    fstp        dword ptr [ebp-2C]
 004AECC2    fld         dword ptr [ebp-24]
 004AECC5    fadd        dword ptr [ebp-30]
 004AECC8    fstp        dword ptr [ebp-4]
 004AECCB    fld         dword ptr [ebp-24]
 004AECCE    fsub        dword ptr [ebp-30]
 004AECD1    fstp        dword ptr [ebp-10]
 004AECD4    fld         dword ptr [ebp-28]
 004AECD7    fadd        dword ptr [ebp-2C]
 004AECDA    fstp        dword ptr [ebp-8]
 004AECDD    fld         dword ptr [ebp-28]
 004AECE0    fsub        dword ptr [ebp-2C]
 004AECE3    fstp        dword ptr [ebp-0C]
 004AECE6    fld         dword ptr [ebx+14]
 004AECE9    fadd        dword ptr [ebx+0C]
 004AECEC    fstp        dword ptr [ebp-44]
 004AECEF    fld         dword ptr [ebx+14]
 004AECF2    fsub        dword ptr [ebx+0C]
 004AECF5    fstp        dword ptr [ebp-38]
 004AECF8    fld         dword ptr [ebx+4]
 004AECFB    fadd        dword ptr [ebx+1C]
 004AECFE    fstp        dword ptr [ebp-3C]
 004AED01    fld         dword ptr [ebx+4]
 004AED04    fsub        dword ptr [ebx+1C]
 004AED07    fstp        dword ptr [ebp-40]
 004AED0A    fld         dword ptr [ebp-3C]
 004AED0D    fadd        dword ptr [ebp-44]
 004AED10    fstp        dword ptr [ebp-20]
 004AED13    fld         dword ptr [ebp-3C]
 004AED16    fsub        dword ptr [ebp-44]
 004AED19    fmul        dword ptr ds:[4AEE7C]
 004AED1F    fstp        dword ptr [ebp-28]
 004AED22    fld         dword ptr [ebp-38]
 004AED25    fadd        dword ptr [ebp-40]
 004AED28    fmul        dword ptr ds:[4AEE80]
 004AED2E    fstp        dword ptr [ebp-34]
 004AED31    fld         dword ptr ds:[4AEE84]
 004AED37    fmul        dword ptr [ebp-40]
 004AED3A    fsub        dword ptr [ebp-34]
 004AED3D    fstp        dword ptr [ebp-24]
 004AED40    fld         dword ptr ds:[4AEE88]
 004AED46    fmul        dword ptr [ebp-38]
 004AED49    fadd        dword ptr [ebp-34]
 004AED4C    fstp        dword ptr [ebp-2C]
 004AED4F    fld         dword ptr [ebp-2C]
 004AED52    fsub        dword ptr [ebp-20]
 004AED55    fstp        dword ptr [ebp-1C]
 004AED58    fld         dword ptr [ebp-28]
 004AED5B    fsub        dword ptr [ebp-1C]
 004AED5E    fstp        dword ptr [ebp-18]
 004AED61    fld         dword ptr [ebp-24]
 004AED64    fadd        dword ptr [ebp-18]
 004AED67    fstp        dword ptr [ebp-14]
 004AED6A    fld         dword ptr [ebp-4]
 004AED6D    fadd        dword ptr [ebp-20]
 004AED70    call        __ftol
 004AED75    add         eax,4
 004AED78    sar         eax,3
 004AED7B    and         eax,3FF
 004AED80    mov         edx,dword ptr [ebp-48]
 004AED83    mov         cl,byte ptr [edx+eax]
 004AED86    mov         byte ptr [esi],cl
 004AED88    fld         dword ptr [ebp-4]
 004AED8B    fsub        dword ptr [ebp-20]
 004AED8E    call        __ftol
 004AED93    add         eax,4
 004AED96    sar         eax,3
 004AED99    and         eax,3FF
 004AED9E    mov         edx,dword ptr [ebp-48]
 004AEDA1    mov         cl,byte ptr [edx+eax]
 004AEDA4    mov         byte ptr [esi+7],cl
 004AEDA7    fld         dword ptr [ebp-8]
 004AEDAA    fadd        dword ptr [ebp-1C]
 004AEDAD    call        __ftol
 004AEDB2    add         eax,4
 004AEDB5    sar         eax,3
 004AEDB8    and         eax,3FF
 004AEDBD    mov         edx,dword ptr [ebp-48]
 004AEDC0    mov         cl,byte ptr [edx+eax]
 004AEDC3    mov         byte ptr [esi+1],cl
 004AEDC6    fld         dword ptr [ebp-8]
 004AEDC9    fsub        dword ptr [ebp-1C]
 004AEDCC    call        __ftol
 004AEDD1    add         eax,4
 004AEDD4    sar         eax,3
 004AEDD7    and         eax,3FF
 004AEDDC    mov         edx,dword ptr [ebp-48]
 004AEDDF    mov         cl,byte ptr [edx+eax]
 004AEDE2    mov         byte ptr [esi+6],cl
 004AEDE5    fld         dword ptr [ebp-0C]
 004AEDE8    fadd        dword ptr [ebp-18]
 004AEDEB    call        __ftol
 004AEDF0    add         eax,4
 004AEDF3    sar         eax,3
 004AEDF6    and         eax,3FF
 004AEDFB    mov         edx,dword ptr [ebp-48]
 004AEDFE    mov         cl,byte ptr [edx+eax]
 004AEE01    mov         byte ptr [esi+2],cl
 004AEE04    fld         dword ptr [ebp-0C]
 004AEE07    fsub        dword ptr [ebp-18]
 004AEE0A    call        __ftol
 004AEE0F    add         eax,4
 004AEE12    sar         eax,3
 004AEE15    and         eax,3FF
 004AEE1A    mov         edx,dword ptr [ebp-48]
 004AEE1D    mov         cl,byte ptr [edx+eax]
 004AEE20    mov         byte ptr [esi+5],cl
 004AEE23    fld         dword ptr [ebp-10]
 004AEE26    fadd        dword ptr [ebp-14]
 004AEE29    call        __ftol
 004AEE2E    add         eax,4
 004AEE31    sar         eax,3
 004AEE34    and         eax,3FF
 004AEE39    mov         edx,dword ptr [ebp-48]
 004AEE3C    mov         cl,byte ptr [edx+eax]
 004AEE3F    mov         byte ptr [esi+4],cl
 004AEE42    fld         dword ptr [ebp-10]
 004AEE45    fsub        dword ptr [ebp-14]
 004AEE48    call        __ftol
 004AEE4D    add         eax,4
 004AEE50    mov         edx,dword ptr [ebp-48]
 004AEE53    sar         eax,3
 004AEE56    add         ebx,20
 004AEE59    and         eax,3FF
 004AEE5E    inc         edi
 004AEE5F    mov         cl,byte ptr [edx+eax]
 004AEE62    mov         byte ptr [esi+3],cl
 004AEE65    add         dword ptr [ebp-50],4
 004AEE69    cmp         edi,8
>004AEE6C    jl          004AEC8F
 004AEE72    pop         edi
 004AEE73    pop         esi
 004AEE74    pop         ebx
 004AEE75    mov         esp,ebp
 004AEE77    pop         ebp
 004AEE78    ret         8
*}
end;

//004AEE8C
procedure @jpeg_idct_ifast;
begin
{*
 004AEE8C    push        ebp
 004AEE8D    mov         ebp,esp
 004AEE8F    add         esp,0FFFFFEC0
 004AEE95    push        ebx
 004AEE96    push        esi
 004AEE97    push        edi
 004AEE98    mov         dword ptr [ebp-0C],ecx
 004AEE9B    mov         dword ptr [ebp-8],edx
 004AEE9E    mov         dword ptr [ebp-4],eax
 004AEEA1    mov         eax,dword ptr [ebp-4]
 004AEEA4    mov         edx,dword ptr [eax+144]
 004AEEAA    add         edx,80
 004AEEB0    mov         dword ptr [ebp-38],edx
 004AEEB3    mov         edx,dword ptr [ebp-0C]
 004AEEB6    mov         eax,dword ptr [ebp-8]
 004AEEB9    mov         ecx,dword ptr [eax+50]
 004AEEBC    mov         dword ptr [ebp-34],ecx
 004AEEBF    lea         eax,[ebp-140]
 004AEEC5    mov         dword ptr [ebp-3C],8
 004AEECC    cmp         word ptr [edx+10],0
>004AEED1    jne         004AEF38
 004AEED3    cmp         word ptr [edx+20],0
>004AEED8    jne         004AEF38
 004AEEDA    cmp         word ptr [edx+30],0
>004AEEDF    jne         004AEF38
 004AEEE1    cmp         word ptr [edx+40],0
>004AEEE6    jne         004AEF38
 004AEEE8    cmp         word ptr [edx+50],0
>004AEEED    jne         004AEF38
 004AEEEF    cmp         word ptr [edx+60],0
>004AEEF4    jne         004AEF38
 004AEEF6    cmp         word ptr [edx+70],0
>004AEEFB    jne         004AEF38
 004AEEFD    movsx       ecx,word ptr [edx]
 004AEF00    mov         ebx,dword ptr [ebp-34]
 004AEF03    add         edx,2
 004AEF06    imul        ecx,dword ptr [ebx]
 004AEF09    mov         dword ptr [eax],ecx
 004AEF0B    mov         dword ptr [eax+20],ecx
 004AEF0E    mov         dword ptr [eax+40],ecx
 004AEF11    mov         dword ptr [eax+60],ecx
 004AEF14    mov         dword ptr [eax+80],ecx
 004AEF1A    mov         dword ptr [eax+0A0],ecx
 004AEF20    mov         dword ptr [eax+0C0],ecx
 004AEF26    mov         dword ptr [eax+0E0],ecx
 004AEF2C    add         dword ptr [ebp-34],4
 004AEF30    add         eax,4
>004AEF33    jmp         004AF0B1
 004AEF38    movsx       ecx,word ptr [edx]
 004AEF3B    mov         ebx,dword ptr [ebp-34]
 004AEF3E    imul        ecx,dword ptr [ebx]
 004AEF41    mov         dword ptr [ebp-10],ecx
 004AEF44    movsx       ecx,word ptr [edx+20]
 004AEF48    mov         ebx,dword ptr [ebp-34]
 004AEF4B    imul        ecx,dword ptr [ebx+40]
 004AEF4F    mov         dword ptr [ebp-14],ecx
 004AEF52    movsx       ecx,word ptr [edx+40]
 004AEF56    mov         ebx,dword ptr [ebp-34]
 004AEF59    imul        ecx,dword ptr [ebx+80]
 004AEF60    mov         dword ptr [ebp-18],ecx
 004AEF63    movsx       ecx,word ptr [edx+60]
 004AEF67    mov         ebx,dword ptr [ebp-34]
 004AEF6A    imul        ecx,dword ptr [ebx+0C0]
 004AEF71    mov         dword ptr [ebp-1C],ecx
 004AEF74    mov         ecx,dword ptr [ebp-10]
 004AEF77    mov         ebx,dword ptr [ebp-10]
 004AEF7A    mov         esi,dword ptr [ebp-14]
 004AEF7D    add         ebx,dword ptr [ebp-18]
 004AEF80    sub         ecx,dword ptr [ebp-18]
 004AEF83    add         esi,dword ptr [ebp-1C]
 004AEF86    mov         dword ptr [ebp-28],esi
 004AEF89    mov         esi,dword ptr [ebp-14]
 004AEF8C    mov         edi,dword ptr [ebp-28]
 004AEF8F    sub         esi,dword ptr [ebp-1C]
 004AEF92    imul        esi,esi,16A
 004AEF98    sar         esi,8
 004AEF9B    add         edi,ebx
 004AEF9D    sub         esi,dword ptr [ebp-28]
 004AEFA0    mov         dword ptr [ebp-10],edi
 004AEFA3    sub         ebx,dword ptr [ebp-28]
 004AEFA6    mov         dword ptr [ebp-1C],ebx
 004AEFA9    lea         ebx,[esi+ecx]
 004AEFAC    sub         ecx,esi
 004AEFAE    mov         dword ptr [ebp-14],ebx
 004AEFB1    mov         dword ptr [ebp-18],ecx
 004AEFB4    movsx       ecx,word ptr [edx+10]
 004AEFB8    mov         ebx,dword ptr [ebp-34]
 004AEFBB    imul        ecx,dword ptr [ebx+20]
 004AEFBF    mov         dword ptr [ebp-20],ecx
 004AEFC2    movsx       ecx,word ptr [edx+30]
 004AEFC6    mov         ebx,dword ptr [ebp-34]
 004AEFC9    mov         edi,dword ptr [ebp-34]
 004AEFCC    movsx       esi,word ptr [edx+50]
 004AEFD0    imul        ecx,dword ptr [ebx+60]
 004AEFD4    mov         ebx,dword ptr [ebp-34]
 004AEFD7    imul        esi,dword ptr [ebx+0A0]
 004AEFDE    movsx       ebx,word ptr [edx+70]
 004AEFE2    imul        ebx,dword ptr [edi+0E0]
 004AEFE9    mov         dword ptr [ebp-24],ebx
 004AEFEC    lea         ebx,[ecx+esi]
 004AEFEF    sub         esi,ecx
 004AEFF1    mov         ecx,dword ptr [ebp-20]
 004AEFF4    add         ecx,dword ptr [ebp-24]
 004AEFF7    mov         edi,dword ptr [ebp-20]
 004AEFFA    sub         edi,dword ptr [ebp-24]
 004AEFFD    add         edx,2
 004AF000    mov         dword ptr [ebp-30],edi
 004AF003    lea         edi,[ebx+ecx]
 004AF006    sub         ecx,ebx
 004AF008    mov         dword ptr [ebp-24],edi
 004AF00B    mov         ebx,dword ptr [ebp-30]
 004AF00E    imul        ecx,ecx,16A
 004AF014    add         ebx,esi
 004AF016    imul        esi,esi,0FFFFFD63
 004AF01C    mov         edi,ebx
 004AF01E    shl         ebx,4
 004AF021    sub         ebx,edi
 004AF023    shl         ebx,2
 004AF026    sub         ebx,edi
 004AF028    sar         esi,8
 004AF02B    sar         ecx,8
 004AF02E    lea         ebx,[edi+ebx*8]
 004AF031    sar         ebx,8
 004AF034    mov         dword ptr [ebp-2C],ebx
 004AF037    add         esi,dword ptr [ebp-2C]
 004AF03A    mov         ebx,dword ptr [ebp-30]
 004AF03D    mov         edi,ebx
 004AF03F    sub         esi,dword ptr [ebp-24]
 004AF042    shl         ebx,4
 004AF045    sub         ecx,esi
 004AF047    add         ebx,edi
 004AF049    lea         ebx,[edi+ebx*4]
 004AF04C    lea         ebx,[edi+ebx*4]
 004AF04F    sar         ebx,8
 004AF052    sub         ebx,dword ptr [ebp-2C]
 004AF055    lea         ebx,[ecx+ebx]
 004AF058    mov         dword ptr [ebp-20],ebx
 004AF05B    mov         ebx,dword ptr [ebp-10]
 004AF05E    add         ebx,dword ptr [ebp-24]
 004AF061    mov         dword ptr [eax],ebx
 004AF063    mov         ebx,dword ptr [ebp-10]
 004AF066    sub         ebx,dword ptr [ebp-24]
 004AF069    mov         dword ptr [eax+0E0],ebx
 004AF06F    mov         ebx,dword ptr [ebp-14]
 004AF072    add         ebx,esi
 004AF074    mov         dword ptr [eax+20],ebx
 004AF077    mov         ebx,dword ptr [ebp-14]
 004AF07A    sub         ebx,esi
 004AF07C    mov         dword ptr [eax+0C0],ebx
 004AF082    mov         ebx,dword ptr [ebp-18]
 004AF085    add         ebx,ecx
 004AF087    mov         dword ptr [eax+40],ebx
 004AF08A    mov         ebx,dword ptr [ebp-18]
 004AF08D    sub         ebx,ecx
 004AF08F    mov         dword ptr [eax+0A0],ebx
 004AF095    mov         ecx,dword ptr [ebp-1C]
 004AF098    add         ecx,dword ptr [ebp-20]
 004AF09B    mov         dword ptr [eax+80],ecx
 004AF0A1    mov         ecx,dword ptr [ebp-1C]
 004AF0A4    sub         ecx,dword ptr [ebp-20]
 004AF0A7    mov         dword ptr [eax+60],ecx
 004AF0AA    add         dword ptr [ebp-34],4
 004AF0AE    add         eax,4
 004AF0B1    dec         dword ptr [ebp-3C]
 004AF0B4    cmp         dword ptr [ebp-3C],0
>004AF0B8    jg          004AEECC
 004AF0BE    lea         eax,[ebp-140]
 004AF0C4    xor         edx,edx
 004AF0C6    mov         dword ptr [ebp-3C],edx
 004AF0C9    mov         edx,dword ptr [ebp+0C]
 004AF0CC    mov         ecx,edx
 004AF0CE    mov         dword ptr [ebp-40],ecx
 004AF0D1    mov         edx,dword ptr [ebp-40]
 004AF0D4    mov         edx,dword ptr [edx]
 004AF0D6    add         edx,dword ptr [ebp+8]
 004AF0D9    cmp         dword ptr [eax+4],0
>004AF0DD    jne         004AF133
 004AF0DF    cmp         dword ptr [eax+8],0
>004AF0E3    jne         004AF133
 004AF0E5    cmp         dword ptr [eax+0C],0
>004AF0E9    jne         004AF133
 004AF0EB    cmp         dword ptr [eax+10],0
>004AF0EF    jne         004AF133
 004AF0F1    cmp         dword ptr [eax+14],0
>004AF0F5    jne         004AF133
 004AF0F7    cmp         dword ptr [eax+18],0
>004AF0FB    jne         004AF133
 004AF0FD    cmp         dword ptr [eax+1C],0
>004AF101    jne         004AF133
 004AF103    mov         ecx,dword ptr [eax]
 004AF105    sar         ecx,5
 004AF108    and         ecx,3FF
 004AF10E    mov         ebx,dword ptr [ebp-38]
 004AF111    mov         cl,byte ptr [ebx+ecx]
 004AF114    mov         byte ptr [edx],cl
 004AF116    mov         byte ptr [edx+1],cl
 004AF119    mov         byte ptr [edx+2],cl
 004AF11C    mov         byte ptr [edx+3],cl
 004AF11F    mov         byte ptr [edx+4],cl
 004AF122    mov         byte ptr [edx+5],cl
 004AF125    mov         byte ptr [edx+6],cl
 004AF128    mov         byte ptr [edx+7],cl
 004AF12B    add         eax,20
>004AF12E    jmp         004AF2A3
 004AF133    mov         ecx,dword ptr [eax]
 004AF135    mov         esi,dword ptr [eax+10]
 004AF138    mov         ebx,ecx
 004AF13A    sub         ecx,esi
 004AF13C    add         ebx,esi
 004AF13E    mov         esi,dword ptr [eax+8]
 004AF141    mov         edi,esi
 004AF143    add         edi,dword ptr [eax+18]
 004AF146    mov         dword ptr [ebp-28],edi
 004AF149    sub         esi,dword ptr [eax+18]
 004AF14C    imul        esi,esi,16A
 004AF152    sar         esi,8
 004AF155    mov         edi,dword ptr [ebp-28]
 004AF158    sub         esi,dword ptr [ebp-28]
 004AF15B    add         edi,ebx
 004AF15D    mov         dword ptr [ebp-10],edi
 004AF160    sub         ebx,dword ptr [ebp-28]
 004AF163    mov         dword ptr [ebp-1C],ebx
 004AF166    lea         ebx,[esi+ecx]
 004AF169    sub         ecx,esi
 004AF16B    mov         dword ptr [ebp-14],ebx
 004AF16E    mov         dword ptr [ebp-18],ecx
 004AF171    mov         ecx,dword ptr [eax+14]
 004AF174    mov         edi,dword ptr [eax+4]
 004AF177    mov         ebx,ecx
 004AF179    mov         esi,ecx
 004AF17B    mov         ecx,dword ptr [eax+4]
 004AF17E    add         ecx,dword ptr [eax+1C]
 004AF181    add         ebx,dword ptr [eax+0C]
 004AF184    sub         esi,dword ptr [eax+0C]
 004AF187    sub         edi,dword ptr [eax+1C]
 004AF18A    mov         dword ptr [ebp-30],edi
 004AF18D    lea         edi,[ebx+ecx]
 004AF190    sub         ecx,ebx
 004AF192    mov         dword ptr [ebp-24],edi
 004AF195    mov         ebx,dword ptr [ebp-30]
 004AF198    imul        ecx,ecx,16A
 004AF19E    add         ebx,esi
 004AF1A0    imul        esi,esi,0FFFFFD63
 004AF1A6    mov         edi,ebx
 004AF1A8    shl         ebx,4
 004AF1AB    sub         ebx,edi
 004AF1AD    shl         ebx,2
 004AF1B0    sub         ebx,edi
 004AF1B2    sar         esi,8
 004AF1B5    sar         ecx,8
 004AF1B8    lea         ebx,[edi+ebx*8]
 004AF1BB    sar         ebx,8
 004AF1BE    mov         dword ptr [ebp-2C],ebx
 004AF1C1    add         esi,dword ptr [ebp-2C]
 004AF1C4    mov         ebx,dword ptr [ebp-30]
 004AF1C7    mov         edi,ebx
 004AF1C9    sub         esi,dword ptr [ebp-24]
 004AF1CC    shl         ebx,4
 004AF1CF    sub         ecx,esi
 004AF1D1    add         ebx,edi
 004AF1D3    lea         ebx,[edi+ebx*4]
 004AF1D6    lea         ebx,[edi+ebx*4]
 004AF1D9    sar         ebx,8
 004AF1DC    sub         ebx,dword ptr [ebp-2C]
 004AF1DF    lea         ebx,[ecx+ebx]
 004AF1E2    mov         dword ptr [ebp-20],ebx
 004AF1E5    mov         ebx,dword ptr [ebp-10]
 004AF1E8    mov         edi,dword ptr [ebp-38]
 004AF1EB    add         ebx,dword ptr [ebp-24]
 004AF1EE    sar         ebx,5
 004AF1F1    and         ebx,3FF
 004AF1F7    mov         bl,byte ptr [edi+ebx]
 004AF1FA    mov         byte ptr [edx],bl
 004AF1FC    mov         ebx,dword ptr [ebp-10]
 004AF1FF    mov         edi,dword ptr [ebp-38]
 004AF202    sub         ebx,dword ptr [ebp-24]
 004AF205    sar         ebx,5
 004AF208    and         ebx,3FF
 004AF20E    mov         bl,byte ptr [edi+ebx]
 004AF211    mov         byte ptr [edx+7],bl
 004AF214    mov         ebx,dword ptr [ebp-14]
 004AF217    mov         edi,dword ptr [ebp-38]
 004AF21A    add         ebx,esi
 004AF21C    sar         ebx,5
 004AF21F    and         ebx,3FF
 004AF225    mov         bl,byte ptr [edi+ebx]
 004AF228    mov         byte ptr [edx+1],bl
 004AF22B    mov         ebx,dword ptr [ebp-14]
 004AF22E    sub         ebx,esi
 004AF230    mov         esi,dword ptr [ebp-38]
 004AF233    sar         ebx,5
 004AF236    and         ebx,3FF
 004AF23C    mov         bl,byte ptr [esi+ebx]
 004AF23F    mov         byte ptr [edx+6],bl
 004AF242    mov         ebx,dword ptr [ebp-18]
 004AF245    mov         esi,dword ptr [ebp-38]
 004AF248    add         ebx,ecx
 004AF24A    sar         ebx,5
 004AF24D    and         ebx,3FF
 004AF253    mov         bl,byte ptr [esi+ebx]
 004AF256    mov         byte ptr [edx+2],bl
 004AF259    mov         ebx,dword ptr [ebp-18]
 004AF25C    sub         ebx,ecx
 004AF25E    mov         ecx,dword ptr [ebp-38]
 004AF261    sar         ebx,5
 004AF264    and         ebx,3FF
 004AF26A    mov         cl,byte ptr [ecx+ebx]
 004AF26D    mov         byte ptr [edx+5],cl
 004AF270    mov         ecx,dword ptr [ebp-1C]
 004AF273    mov         ebx,dword ptr [ebp-38]
 004AF276    add         ecx,dword ptr [ebp-20]
 004AF279    sar         ecx,5
 004AF27C    and         ecx,3FF
 004AF282    mov         cl,byte ptr [ebx+ecx]
 004AF285    mov         byte ptr [edx+4],cl
 004AF288    mov         ecx,dword ptr [ebp-1C]
 004AF28B    mov         ebx,dword ptr [ebp-38]
 004AF28E    sub         ecx,dword ptr [ebp-20]
 004AF291    sar         ecx,5
 004AF294    and         ecx,3FF
 004AF29A    add         eax,20
 004AF29D    mov         cl,byte ptr [ebx+ecx]
 004AF2A0    mov         byte ptr [edx+3],cl
 004AF2A3    inc         dword ptr [ebp-3C]
 004AF2A6    add         dword ptr [ebp-40],4
 004AF2AA    cmp         dword ptr [ebp-3C],8
>004AF2AE    jl          004AF0D1
 004AF2B4    pop         edi
 004AF2B5    pop         esi
 004AF2B6    pop         ebx
 004AF2B7    mov         esp,ebp
 004AF2B9    pop         ebp
 004AF2BA    ret         8
*}
end;

//004AF2C0
procedure @jpeg_idct_4x4;
begin
{*
 004AF2C0    push        ebp
 004AF2C1    mov         ebp,esp
 004AF2C3    add         esp,0FFFFFF58
 004AF2C9    push        ebx
 004AF2CA    push        esi
 004AF2CB    push        edi
 004AF2CC    mov         eax,dword ptr [eax+144]
 004AF2D2    add         eax,80
 004AF2D7    mov         dword ptr [ebp-20],eax
 004AF2DA    mov         ebx,ecx
 004AF2DC    mov         eax,dword ptr [edx+50]
 004AF2DF    mov         dword ptr [ebp-1C],eax
 004AF2E2    lea         eax,[ebp-0A8]
 004AF2E8    mov         dword ptr [ebp-24],8
 004AF2EF    cmp         dword ptr [ebp-24],4
>004AF2F3    je          004AF49A
 004AF2F9    cmp         word ptr [ebx+10],0
>004AF2FE    jne         004AF33F
 004AF300    cmp         word ptr [ebx+20],0
>004AF305    jne         004AF33F
 004AF307    cmp         word ptr [ebx+30],0
>004AF30C    jne         004AF33F
 004AF30E    cmp         word ptr [ebx+50],0
>004AF313    jne         004AF33F
 004AF315    cmp         word ptr [ebx+60],0
>004AF31A    jne         004AF33F
 004AF31C    cmp         word ptr [ebx+70],0
>004AF321    jne         004AF33F
 004AF323    movsx       edx,word ptr [ebx]
 004AF326    mov         ecx,dword ptr [ebp-1C]
 004AF329    imul        edx,dword ptr [ecx]
 004AF32C    shl         edx,2
 004AF32F    mov         dword ptr [eax],edx
 004AF331    mov         dword ptr [eax+20],edx
 004AF334    mov         dword ptr [eax+40],edx
 004AF337    mov         dword ptr [eax+60],edx
>004AF33A    jmp         004AF49A
 004AF33F    movsx       edx,word ptr [ebx]
 004AF342    mov         ecx,dword ptr [ebp-1C]
 004AF345    mov         esi,dword ptr [ebp-1C]
 004AF348    imul        edx,dword ptr [ecx]
 004AF34B    movsx       ecx,word ptr [ebx+20]
 004AF34F    imul        ecx,dword ptr [esi+40]
 004AF353    mov         dword ptr [ebp-10],ecx
 004AF356    movsx       ecx,word ptr [ebx+60]
 004AF35A    mov         esi,dword ptr [ebp-1C]
 004AF35D    imul        ecx,dword ptr [esi+0C0]
 004AF364    mov         dword ptr [ebp-14],ecx
 004AF367    mov         ecx,dword ptr [ebp-10]
 004AF36A    mov         esi,ecx
 004AF36C    shl         ecx,4
 004AF36F    sub         ecx,esi
 004AF371    shl         ecx,2
 004AF374    sub         ecx,esi
 004AF376    shl         edx,0E
 004AF379    lea         ecx,[esi+ecx*8]
 004AF37C    shl         ecx,5
 004AF37F    add         ecx,esi
 004AF381    mov         esi,dword ptr [ebp-14]
 004AF384    mov         edi,esi
 004AF386    neg         esi
 004AF388    lea         esi,[edi+esi*4]
 004AF38B    shl         esi,4
 004AF38E    sub         esi,edi
 004AF390    shl         esi,6
 004AF393    add         esi,edi
 004AF395    add         esi,esi
 004AF397    add         ecx,esi
 004AF399    lea         esi,[ecx+edx]
 004AF39C    sub         edx,ecx
 004AF39E    mov         dword ptr [ebp-4],esi
 004AF3A1    mov         dword ptr [ebp-8],edx
 004AF3A4    movsx       edx,word ptr [ebx+70]
 004AF3A8    mov         ecx,dword ptr [ebp-1C]
 004AF3AB    imul        edx,dword ptr [ecx+0E0]
 004AF3B2    mov         dword ptr [ebp-0C],edx
 004AF3B5    movsx       edx,word ptr [ebx+50]
 004AF3B9    mov         ecx,dword ptr [ebp-1C]
 004AF3BC    imul        edx,dword ptr [ecx+0A0]
 004AF3C3    mov         dword ptr [ebp-10],edx
 004AF3C6    movsx       edx,word ptr [ebx+30]
 004AF3CA    mov         ecx,dword ptr [ebp-1C]
 004AF3CD    imul        edx,dword ptr [ecx+60]
 004AF3D1    mov         dword ptr [ebp-14],edx
 004AF3D4    movsx       edx,word ptr [ebx+10]
 004AF3D8    mov         ecx,dword ptr [ebp-1C]
 004AF3DB    imul        edx,dword ptr [ecx+20]
 004AF3DF    mov         dword ptr [ebp-18],edx
 004AF3E2    mov         edx,dword ptr [ebp-0C]
 004AF3E5    mov         ecx,edx
 004AF3E7    neg         edx
 004AF3E9    lea         edx,[ecx+edx*8]
 004AF3EC    lea         edx,[ecx+edx*4]
 004AF3EF    shl         edx,5
 004AF3F2    sub         edx,ecx
 004AF3F4    imul        ecx,dword ptr [ebp-10],2E75
 004AF3FB    add         edx,edx
 004AF3FD    add         edx,ecx
 004AF3FF    imul        ecx,dword ptr [ebp-14],0FFFFBA79
 004AF406    add         edx,ecx
 004AF408    mov         ecx,dword ptr [ebp-18]
 004AF40B    mov         esi,ecx
 004AF40D    shl         ecx,4
 004AF410    add         ecx,esi
 004AF412    shl         ecx,6
 004AF415    sub         ecx,esi
 004AF417    lea         ecx,[esi+ecx*8]
 004AF41A    add         edx,ecx
 004AF41C    mov         ecx,dword ptr [ebp-0C]
 004AF41F    mov         esi,ecx
 004AF421    neg         ecx
 004AF423    shl         ecx,6
 004AF426    sub         ecx,esi
 004AF428    shl         ecx,2
 004AF42B    sub         ecx,esi
 004AF42D    imul        esi,dword ptr [ebp-10],0FFFFECC2
 004AF434    shl         ecx,4
 004AF437    add         ecx,esi
 004AF439    imul        esi,dword ptr [ebp-14],1CCD
 004AF440    add         ecx,esi
 004AF442    mov         esi,dword ptr [ebp-18]
 004AF445    mov         edi,esi
 004AF447    lea         esi,[edi+esi*4]
 004AF44A    lea         esi,[edi+esi*8]
 004AF44D    shl         esi,8
 004AF450    add         esi,edi
 004AF452    lea         esi,[edi+esi*2]
 004AF455    add         ecx,esi
 004AF457    mov         esi,dword ptr [ebp-4]
 004AF45A    add         esi,ecx
 004AF45C    add         esi,800
 004AF462    sar         esi,0C
 004AF465    mov         dword ptr [eax],esi
 004AF467    mov         esi,dword ptr [ebp-4]
 004AF46A    sub         esi,ecx
 004AF46C    add         esi,800
 004AF472    sar         esi,0C
 004AF475    mov         dword ptr [eax+60],esi
 004AF478    mov         ecx,dword ptr [ebp-8]
 004AF47B    add         ecx,edx
 004AF47D    add         ecx,800
 004AF483    sar         ecx,0C
 004AF486    mov         dword ptr [eax+20],ecx
 004AF489    mov         ecx,dword ptr [ebp-8]
 004AF48C    sub         ecx,edx
 004AF48E    add         ecx,800
 004AF494    sar         ecx,0C
 004AF497    mov         dword ptr [eax+40],ecx
 004AF49A    add         ebx,2
 004AF49D    add         dword ptr [ebp-1C],4
 004AF4A1    add         eax,4
 004AF4A4    dec         dword ptr [ebp-24]
 004AF4A7    cmp         dword ptr [ebp-24],0
>004AF4AB    jg          004AF2EF
 004AF4B1    lea         eax,[ebp-0A8]
 004AF4B7    xor         edx,edx
 004AF4B9    mov         dword ptr [ebp-24],edx
 004AF4BC    mov         edx,dword ptr [ebp+0C]
 004AF4BF    mov         ecx,edx
 004AF4C1    mov         dword ptr [ebp-28],ecx
 004AF4C4    mov         edx,dword ptr [ebp-28]
 004AF4C7    mov         esi,dword ptr [edx]
 004AF4C9    add         esi,dword ptr [ebp+8]
 004AF4CC    cmp         dword ptr [eax+4],0
>004AF4D0    jne         004AF517
 004AF4D2    cmp         dword ptr [eax+8],0
>004AF4D6    jne         004AF517
 004AF4D8    cmp         dword ptr [eax+0C],0
>004AF4DC    jne         004AF517
 004AF4DE    cmp         dword ptr [eax+14],0
>004AF4E2    jne         004AF517
 004AF4E4    cmp         dword ptr [eax+18],0
>004AF4E8    jne         004AF517
 004AF4EA    cmp         dword ptr [eax+1C],0
>004AF4EE    jne         004AF517
 004AF4F0    mov         edx,dword ptr [eax]
 004AF4F2    add         edx,10
 004AF4F5    sar         edx,5
 004AF4F8    and         edx,3FF
 004AF4FE    mov         ecx,dword ptr [ebp-20]
 004AF501    mov         dl,byte ptr [ecx+edx]
 004AF504    mov         byte ptr [esi],dl
 004AF506    mov         byte ptr [esi+1],dl
 004AF509    mov         byte ptr [esi+2],dl
 004AF50C    mov         byte ptr [esi+3],dl
 004AF50F    add         eax,20
>004AF512    jmp         004AF659
 004AF517    mov         ecx,dword ptr [eax+8]
 004AF51A    mov         edx,dword ptr [eax]
 004AF51C    mov         ebx,ecx
 004AF51E    shl         ecx,4
 004AF521    sub         ecx,ebx
 004AF523    shl         ecx,2
 004AF526    sub         ecx,ebx
 004AF528    shl         edx,0E
 004AF52B    lea         ecx,[ebx+ecx*8]
 004AF52E    shl         ecx,5
 004AF531    add         ecx,ebx
 004AF533    mov         ebx,dword ptr [eax+18]
 004AF536    mov         edi,ebx
 004AF538    neg         ebx
 004AF53A    lea         ebx,[edi+ebx*4]
 004AF53D    shl         ebx,4
 004AF540    sub         ebx,edi
 004AF542    shl         ebx,6
 004AF545    add         ebx,edi
 004AF547    add         ebx,ebx
 004AF549    add         ecx,ebx
 004AF54B    lea         ebx,[ecx+edx]
 004AF54E    sub         edx,ecx
 004AF550    mov         dword ptr [ebp-4],ebx
 004AF553    mov         dword ptr [ebp-8],edx
 004AF556    mov         edx,dword ptr [eax+1C]
 004AF559    mov         dword ptr [ebp-0C],edx
 004AF55C    mov         ecx,dword ptr [eax+14]
 004AF55F    mov         dword ptr [ebp-10],ecx
 004AF562    mov         edx,dword ptr [eax+0C]
 004AF565    mov         dword ptr [ebp-14],edx
 004AF568    mov         ecx,dword ptr [eax+4]
 004AF56B    mov         dword ptr [ebp-18],ecx
 004AF56E    mov         edx,dword ptr [ebp-0C]
 004AF571    mov         ecx,edx
 004AF573    neg         edx
 004AF575    lea         edx,[ecx+edx*8]
 004AF578    lea         edx,[ecx+edx*4]
 004AF57B    shl         edx,5
 004AF57E    sub         edx,ecx
 004AF580    imul        ecx,dword ptr [ebp-10],2E75
 004AF587    add         edx,edx
 004AF589    add         edx,ecx
 004AF58B    imul        ecx,dword ptr [ebp-14],0FFFFBA79
 004AF592    add         edx,ecx
 004AF594    mov         ecx,dword ptr [ebp-18]
 004AF597    mov         ebx,ecx
 004AF599    shl         ecx,4
 004AF59C    add         ecx,ebx
 004AF59E    shl         ecx,6
 004AF5A1    sub         ecx,ebx
 004AF5A3    lea         ecx,[ebx+ecx*8]
 004AF5A6    add         edx,ecx
 004AF5A8    mov         ecx,dword ptr [ebp-0C]
 004AF5AB    mov         ebx,ecx
 004AF5AD    neg         ecx
 004AF5AF    shl         ecx,6
 004AF5B2    sub         ecx,ebx
 004AF5B4    shl         ecx,2
 004AF5B7    sub         ecx,ebx
 004AF5B9    imul        ebx,dword ptr [ebp-10],0FFFFECC2
 004AF5C0    shl         ecx,4
 004AF5C3    add         ecx,ebx
 004AF5C5    imul        ebx,dword ptr [ebp-14],1CCD
 004AF5CC    add         ecx,ebx
 004AF5CE    mov         ebx,dword ptr [ebp-18]
 004AF5D1    mov         edi,ebx
 004AF5D3    lea         ebx,[edi+ebx*4]
 004AF5D6    lea         ebx,[edi+ebx*8]
 004AF5D9    shl         ebx,8
 004AF5DC    add         ebx,edi
 004AF5DE    lea         ebx,[edi+ebx*2]
 004AF5E1    mov         edi,dword ptr [ebp-20]
 004AF5E4    add         ecx,ebx
 004AF5E6    mov         ebx,dword ptr [ebp-4]
 004AF5E9    add         ebx,ecx
 004AF5EB    add         ebx,40000
 004AF5F1    sar         ebx,13
 004AF5F4    and         ebx,3FF
 004AF5FA    mov         bl,byte ptr [edi+ebx]
 004AF5FD    mov         byte ptr [esi],bl
 004AF5FF    mov         ebx,dword ptr [ebp-4]
 004AF602    sub         ebx,ecx
 004AF604    mov         ecx,dword ptr [ebp-20]
 004AF607    add         ebx,40000
 004AF60D    sar         ebx,13
 004AF610    and         ebx,3FF
 004AF616    mov         cl,byte ptr [ecx+ebx]
 004AF619    mov         byte ptr [esi+3],cl
 004AF61C    mov         ecx,dword ptr [ebp-8]
 004AF61F    mov         ebx,dword ptr [ebp-20]
 004AF622    add         ecx,edx
 004AF624    add         ecx,40000
 004AF62A    sar         ecx,13
 004AF62D    and         ecx,3FF
 004AF633    mov         cl,byte ptr [ebx+ecx]
 004AF636    mov         byte ptr [esi+1],cl
 004AF639    mov         ecx,dword ptr [ebp-8]
 004AF63C    sub         ecx,edx
 004AF63E    mov         edx,dword ptr [ebp-20]
 004AF641    add         ecx,40000
 004AF647    sar         ecx,13
 004AF64A    and         ecx,3FF
 004AF650    add         eax,20
 004AF653    mov         dl,byte ptr [edx+ecx]
 004AF656    mov         byte ptr [esi+2],dl
 004AF659    inc         dword ptr [ebp-24]
 004AF65C    add         dword ptr [ebp-28],4
 004AF660    cmp         dword ptr [ebp-24],4
>004AF664    jl          004AF4C4
 004AF66A    pop         edi
 004AF66B    pop         esi
 004AF66C    pop         ebx
 004AF66D    mov         esp,ebp
 004AF66F    pop         ebp
 004AF670    ret         8
*}
end;

//004AF674
procedure @jpeg_idct_2x2;
begin
{*
 004AF674    push        ebp
 004AF675    mov         ebp,esp
 004AF677    add         esp,0FFFFFFAC
 004AF67A    push        ebx
 004AF67B    push        esi
 004AF67C    push        edi
 004AF67D    mov         eax,dword ptr [eax+144]
 004AF683    add         eax,80
 004AF688    mov         dword ptr [ebp-0C],eax
 004AF68B    lea         eax,[ebp-54]
 004AF68E    mov         edx,dword ptr [edx+50]
 004AF691    mov         dword ptr [ebp-8],edx
 004AF694    mov         edx,8
 004AF699    cmp         edx,6
>004AF69C    je          004AF772
 004AF6A2    cmp         edx,4
>004AF6A5    je          004AF772
 004AF6AB    cmp         edx,2
>004AF6AE    je          004AF772
 004AF6B4    cmp         word ptr [ecx+10],0
>004AF6B9    jne         004AF6E6
 004AF6BB    cmp         word ptr [ecx+30],0
>004AF6C0    jne         004AF6E6
 004AF6C2    cmp         word ptr [ecx+50],0
>004AF6C7    jne         004AF6E6
 004AF6C9    cmp         word ptr [ecx+70],0
>004AF6CE    jne         004AF6E6
 004AF6D0    movsx       ebx,word ptr [ecx]
 004AF6D3    mov         esi,dword ptr [ebp-8]
 004AF6D6    imul        ebx,dword ptr [esi]
 004AF6D9    shl         ebx,2
 004AF6DC    mov         dword ptr [eax],ebx
 004AF6DE    mov         dword ptr [eax+20],ebx
>004AF6E1    jmp         004AF772
 004AF6E6    movsx       ebx,word ptr [ecx]
 004AF6E9    mov         esi,dword ptr [ebp-8]
 004AF6EC    imul        ebx,dword ptr [esi]
 004AF6EF    shl         ebx,0F
 004AF6F2    mov         dword ptr [ebp-4],ebx
 004AF6F5    movsx       ebx,word ptr [ecx+70]
 004AF6F9    mov         esi,dword ptr [ebp-8]
 004AF6FC    mov         edi,dword ptr [ebp-8]
 004AF6FF    imul        ebx,dword ptr [esi+0E0]
 004AF706    imul        esi,ebx,0FFFFE8EE
 004AF70C    movsx       ebx,word ptr [ecx+50]
 004AF710    imul        ebx,dword ptr [edi+0A0]
 004AF717    imul        ebx,ebx,1B37
 004AF71D    add         esi,ebx
 004AF71F    mov         edi,dword ptr [ebp-8]
 004AF722    movsx       ebx,word ptr [ecx+30]
 004AF726    imul        ebx,dword ptr [edi+60]
 004AF72A    imul        ebx,ebx,0FFFFD746
 004AF730    add         esi,ebx
 004AF732    mov         edi,dword ptr [ebp-8]
 004AF735    movsx       ebx,word ptr [ecx+10]
 004AF739    imul        ebx,dword ptr [edi+20]
 004AF73D    mov         edi,ebx
 004AF73F    shl         ebx,3
 004AF742    sub         ebx,edi
 004AF744    lea         ebx,[edi+ebx*4]
 004AF747    shl         ebx,8
 004AF74A    sub         ebx,edi
 004AF74C    shl         ebx,2
 004AF74F    add         esi,ebx
 004AF751    mov         ebx,dword ptr [ebp-4]
 004AF754    add         ebx,esi
 004AF756    add         ebx,1000
 004AF75C    sar         ebx,0D
 004AF75F    mov         dword ptr [eax],ebx
 004AF761    mov         ebx,dword ptr [ebp-4]
 004AF764    sub         ebx,esi
 004AF766    add         ebx,1000
 004AF76C    sar         ebx,0D
 004AF76F    mov         dword ptr [eax+20],ebx
 004AF772    add         ecx,2
 004AF775    add         dword ptr [ebp-8],4
 004AF779    add         eax,4
 004AF77C    dec         edx
 004AF77D    test        edx,edx
>004AF77F    jg          004AF699
 004AF785    mov         ecx,dword ptr [ebp+0C]
 004AF788    lea         eax,[ebp-54]
 004AF78B    mov         dword ptr [ebp-14],ecx
 004AF78E    xor         edx,edx
 004AF790    mov         ecx,dword ptr [ebp-14]
 004AF793    mov         ecx,dword ptr [ecx]
 004AF795    add         ecx,dword ptr [ebp+8]
 004AF798    cmp         dword ptr [eax+4],0
>004AF79C    jne         004AF7D7
 004AF79E    cmp         dword ptr [eax+0C],0
>004AF7A2    jne         004AF7D7
 004AF7A4    cmp         dword ptr [eax+14],0
>004AF7A8    jne         004AF7D7
 004AF7AA    cmp         dword ptr [eax+1C],0
>004AF7AE    jne         004AF7D7
 004AF7B0    mov         ebx,dword ptr [eax]
 004AF7B2    mov         esi,dword ptr [ebp-0C]
 004AF7B5    add         ebx,10
 004AF7B8    sar         ebx,5
 004AF7BB    and         ebx,3FF
 004AF7C1    add         eax,20
 004AF7C4    mov         bl,byte ptr [esi+ebx]
 004AF7C7    mov         byte ptr [ebp-0D],bl
 004AF7CA    mov         bl,byte ptr [ebp-0D]
 004AF7CD    mov         byte ptr [ecx],bl
 004AF7CF    mov         bl,byte ptr [ebp-0D]
 004AF7D2    mov         byte ptr [ecx+1],bl
>004AF7D5    jmp         004AF84B
 004AF7D7    mov         ebx,dword ptr [eax]
 004AF7D9    shl         ebx,0F
 004AF7DC    mov         dword ptr [ebp-4],ebx
 004AF7DF    imul        ebx,dword ptr [eax+14],1B37
 004AF7E6    imul        esi,dword ptr [eax+1C],0FFFFE8EE
 004AF7ED    add         esi,ebx
 004AF7EF    imul        ebx,dword ptr [eax+0C],0FFFFD746
 004AF7F6    add         esi,ebx
 004AF7F8    mov         ebx,dword ptr [eax+4]
 004AF7FB    mov         edi,ebx
 004AF7FD    shl         ebx,3
 004AF800    sub         ebx,edi
 004AF802    lea         ebx,[edi+ebx*4]
 004AF805    shl         ebx,8
 004AF808    sub         ebx,edi
 004AF80A    mov         edi,dword ptr [ebp-0C]
 004AF80D    shl         ebx,2
 004AF810    add         esi,ebx
 004AF812    mov         ebx,dword ptr [ebp-4]
 004AF815    add         ebx,esi
 004AF817    add         ebx,80000
 004AF81D    sar         ebx,14
 004AF820    and         ebx,3FF
 004AF826    mov         bl,byte ptr [edi+ebx]
 004AF829    mov         byte ptr [ecx],bl
 004AF82B    mov         ebx,dword ptr [ebp-4]
 004AF82E    sub         ebx,esi
 004AF830    mov         esi,dword ptr [ebp-0C]
 004AF833    add         ebx,80000
 004AF839    sar         ebx,14
 004AF83C    and         ebx,3FF
 004AF842    add         eax,20
 004AF845    mov         bl,byte ptr [esi+ebx]
 004AF848    mov         byte ptr [ecx+1],bl
 004AF84B    inc         edx
 004AF84C    add         dword ptr [ebp-14],4
 004AF850    cmp         edx,2
>004AF853    jl          004AF790
 004AF859    pop         edi
 004AF85A    pop         esi
 004AF85B    pop         ebx
 004AF85C    mov         esp,ebp
 004AF85E    pop         ebp
 004AF85F    ret         8
*}
end;

//004AF864
procedure @jpeg_idct_1x1;
begin
{*
 004AF864    push        ebp
 004AF865    mov         ebp,esp
 004AF867    push        esi
 004AF868    mov         esi,dword ptr [eax+144]
 004AF86E    mov         eax,dword ptr [edx+50]
 004AF871    movsx       edx,word ptr [ecx]
 004AF874    imul        edx,dword ptr [eax]
 004AF877    mov         eax,edx
 004AF879    add         esi,80
 004AF87F    add         eax,4
 004AF882    mov         ecx,dword ptr [ebp+0C]
 004AF885    sar         eax,3
 004AF888    and         eax,3FF
 004AF88D    mov         dl,byte ptr [esi+eax]
 004AF890    mov         eax,dword ptr [ecx]
 004AF892    mov         ecx,dword ptr [ebp+8]
 004AF895    mov         byte ptr [eax+ecx],dl
 004AF898    pop         esi
 004AF899    pop         ebp
 004AF89A    ret         8
*}
end;

//004AF8A0
procedure _DF_.;
begin
{*
 004AF8A0    push        ebx
 004AF8A1    mov         ebx,eax
 004AF8A3    mov         eax,dword ptr [ebx]
 004AF8A5    mov         dword ptr [eax+14],66
 004AF8AC    mov         edx,1
 004AF8B1    mov         eax,ebx
 004AF8B3    mov         ecx,dword ptr [eax]
 004AF8B5    call        dword ptr [ecx+4]
 004AF8B8    mov         edx,dword ptr [ebx+1B8]
 004AF8BE    cmp         dword ptr [edx+0C],0
>004AF8C2    je          004AF8D3
 004AF8C4    mov         eax,dword ptr [ebx]
 004AF8C6    mov         dword ptr [eax+14],3D
 004AF8CD    mov         eax,ebx
 004AF8CF    mov         edx,dword ptr [eax]
 004AF8D1    call        dword ptr [edx]
 004AF8D3    xor         edx,edx
 004AF8D5    lea         eax,[ebx+0E4]
 004AF8DB    mov         byte ptr [eax],0
 004AF8DE    mov         byte ptr [eax+10],1
 004AF8E2    mov         byte ptr [eax+20],5
 004AF8E6    inc         edx
 004AF8E7    inc         eax
 004AF8E8    cmp         edx,10
>004AF8EB    jl          004AF8DB
 004AF8ED    xor         ecx,ecx
 004AF8EF    xor         eax,eax
 004AF8F1    mov         dword ptr [ebx+114],ecx
 004AF8F7    mov         dword ptr [ebx+28],eax
 004AF8FA    xor         edx,edx
 004AF8FC    xor         ecx,ecx
 004AF8FE    mov         dword ptr [ebx+12C],edx
 004AF904    mov         dword ptr [ebx+118],ecx
 004AF90A    mov         byte ptr [ebx+11C],1
 004AF911    mov         byte ptr [ebx+11D],1
 004AF918    mov         byte ptr [ebx+11E],0
 004AF91F    mov         word ptr [ebx+120],1
 004AF928    mov         word ptr [ebx+122],1
 004AF931    xor         eax,eax
 004AF933    mov         dword ptr [ebx+124],eax
 004AF939    mov         eax,1
 004AF93E    mov         byte ptr [ebx+128],0
 004AF945    mov         edx,dword ptr [ebx+1B8]
 004AF94B    mov         dword ptr [edx+0C],1
 004AF952    pop         ebx
 004AF953    ret
*}
end;

//004B0F18
{*function sub_004B0F18(?:?):?;
begin
 004B0F18    push        ebx
 004B0F19    push        esi
 004B0F1A    push        edi
 004B0F1B    push        ebp
 004B0F1C    push        ecx
 004B0F1D    mov         dword ptr [esp],eax
 004B0F20    mov         eax,dword ptr [esp]
 004B0F23    mov         edi,dword ptr [eax+18]
 004B0F26    mov         ebx,dword ptr [edi]
 004B0F28    mov         esi,dword ptr [edi+4]
 004B0F2B    test        esi,esi
>004B0F2D    jne         004B0F45
 004B0F2F    mov         eax,dword ptr [esp]
 004B0F32    call        dword ptr [edi+0C]
 004B0F35    test        eax,eax
>004B0F37    jne         004B0F40
 004B0F39    xor         eax,eax
>004B0F3B    jmp         004B1025
 004B0F40    mov         ebx,dword ptr [edi]
 004B0F42    mov         esi,dword ptr [edi+4]
 004B0F45    movzx       ebp,byte ptr [ebx]
 004B0F48    inc         ebx
 004B0F49    dec         esi
 004B0F4A    cmp         ebp,0FF
>004B0F50    je          004B0F8A
 004B0F52    mov         eax,dword ptr [esp]
 004B0F55    mov         edx,dword ptr [eax+1B8]
 004B0F5B    inc         dword ptr [edx+18]
 004B0F5E    mov         dword ptr [edi],ebx
 004B0F60    mov         dword ptr [edi+4],esi
 004B0F63    test        esi,esi
>004B0F65    jne         004B0F7D
 004B0F67    mov         eax,dword ptr [esp]
 004B0F6A    call        dword ptr [edi+0C]
 004B0F6D    test        eax,eax
>004B0F6F    jne         004B0F78
 004B0F71    xor         eax,eax
>004B0F73    jmp         004B1025
 004B0F78    mov         ebx,dword ptr [edi]
 004B0F7A    mov         esi,dword ptr [edi+4]
 004B0F7D    movzx       ebp,byte ptr [ebx]
 004B0F80    inc         ebx
 004B0F81    dec         esi
 004B0F82    cmp         ebp,0FF
>004B0F88    jne         004B0F52
 004B0F8A    test        esi,esi
>004B0F8C    jne         004B0FA4
 004B0F8E    mov         eax,dword ptr [esp]
 004B0F91    call        dword ptr [edi+0C]
 004B0F94    test        eax,eax
>004B0F96    jne         004B0F9F
 004B0F98    xor         eax,eax
>004B0F9A    jmp         004B1025
 004B0F9F    mov         ebx,dword ptr [edi]
 004B0FA1    mov         esi,dword ptr [edi+4]
 004B0FA4    movzx       ebp,byte ptr [ebx]
 004B0FA7    inc         ebx
 004B0FA8    dec         esi
 004B0FA9    cmp         ebp,0FF
>004B0FAF    je          004B0F8A
 004B0FB1    test        ebp,ebp
>004B0FB3    jne         004B0FCC
 004B0FB5    mov         eax,dword ptr [esp]
 004B0FB8    mov         edx,dword ptr [eax+1B8]
 004B0FBE    add         dword ptr [edx+18],2
 004B0FC2    mov         dword ptr [edi],ebx
 004B0FC4    mov         dword ptr [edi+4],esi
>004B0FC7    jmp         004B0F2B
 004B0FCC    mov         ecx,dword ptr [esp]
 004B0FCF    mov         eax,dword ptr [ecx+1B8]
 004B0FD5    cmp         dword ptr [eax+18],0
>004B0FD9    je          004B1012
 004B0FDB    mov         edx,dword ptr [esp]
 004B0FDE    mov         eax,dword ptr [edx]
 004B0FE0    mov         dword ptr [eax+14],74
 004B0FE7    mov         edx,dword ptr [esp]
 004B0FEA    mov         ecx,dword ptr [edx+1B8]
 004B0FF0    mov         edx,dword ptr [ecx+18]
 004B0FF3    mov         dword ptr [eax+18],edx
 004B0FF6    mov         dword ptr [eax+1C],ebp
 004B0FF9    or          edx,0FFFFFFFF
 004B0FFC    mov         eax,dword ptr [esp]
 004B0FFF    mov         ecx,dword ptr [eax]
 004B1001    call        dword ptr [ecx+4]
 004B1004    mov         eax,dword ptr [esp]
 004B1007    mov         edx,dword ptr [eax+1B8]
 004B100D    xor         ecx,ecx
 004B100F    mov         dword ptr [edx+18],ecx
 004B1012    mov         eax,dword ptr [esp]
 004B1015    mov         dword ptr [eax+1A0],ebp
 004B101B    mov         dword ptr [edi],ebx
 004B101D    mov         dword ptr [edi+4],esi
 004B1020    mov         eax,1
 004B1025    pop         edx
 004B1026    pop         ebp
 004B1027    pop         edi
 004B1028    pop         esi
 004B1029    pop         ebx
 004B102A    ret
end;*}

//004B1468
procedure @jpeg_resync_to_restart;
begin
{*
 004B1468    push        ebx
 004B1469    push        esi
 004B146A    mov         esi,eax
 004B146C    push        edi
 004B146D    push        ebp
 004B146E    mov         ebp,edx
 004B1470    mov         eax,dword ptr [esi]
 004B1472    mov         ebx,dword ptr [esi+1A0]
 004B1478    or          edx,0FFFFFFFF
 004B147B    mov         dword ptr [eax+14],79
 004B1482    mov         dword ptr [eax+18],ebx
 004B1485    mov         dword ptr [eax+1C],ebp
 004B1488    mov         eax,esi
 004B148A    mov         ecx,dword ptr [eax]
 004B148C    call        dword ptr [ecx+4]
 004B148F    cmp         ebx,0C0
>004B1495    jge         004B149E
 004B1497    mov         edi,2
>004B149C    jmp         004B1506
 004B149E    cmp         ebx,0D0
>004B14A4    jl          004B14AE
 004B14A6    cmp         ebx,0D7
>004B14AC    jle         004B14B5
 004B14AE    mov         edi,3
>004B14B3    jmp         004B1506
 004B14B5    lea         eax,[ebp+1]
 004B14B8    and         eax,7
 004B14BB    add         eax,0D0
 004B14C0    cmp         ebx,eax
>004B14C2    je          004B14D4
 004B14C4    lea         edx,[ebp+2]
 004B14C7    and         edx,7
 004B14CA    add         edx,0D0
 004B14D0    cmp         ebx,edx
>004B14D2    jne         004B14DB
 004B14D4    mov         edi,3
>004B14D9    jmp         004B1506
 004B14DB    lea         eax,[ebp-1]
 004B14DE    and         eax,7
 004B14E1    add         eax,0D0
 004B14E6    cmp         ebx,eax
>004B14E8    je          004B14FA
 004B14EA    lea         edx,[ebp-2]
 004B14ED    and         edx,7
 004B14F0    add         edx,0D0
 004B14F6    cmp         ebx,edx
>004B14F8    jne         004B1501
 004B14FA    mov         edi,2
>004B14FF    jmp         004B1506
 004B1501    mov         edi,1
 004B1506    mov         eax,dword ptr [esi]
 004B1508    mov         dword ptr [eax+14],61
 004B150F    mov         dword ptr [eax+18],ebx
 004B1512    mov         dword ptr [eax+1C],edi
 004B1515    mov         edx,4
 004B151A    mov         eax,esi
 004B151C    mov         ecx,dword ptr [eax]
 004B151E    call        dword ptr [ecx+4]
 004B1521    dec         edi
>004B1522    je          004B152F
 004B1524    dec         edi
>004B1525    je          004B153E
 004B1527    dec         edi
>004B1528    je          004B1558
>004B152A    jmp         004B148F
 004B152F    xor         edx,edx
 004B1531    mov         eax,1
 004B1536    mov         dword ptr [esi+1A0],edx
>004B153C    jmp         004B155D
 004B153E    mov         eax,esi
 004B1540    call        004B0F18
 004B1545    test        eax,eax
>004B1547    jne         004B154D
 004B1549    xor         eax,eax
>004B154B    jmp         004B155D
 004B154D    mov         ebx,dword ptr [esi+1A0]
>004B1553    jmp         004B148F
 004B1558    mov         eax,1
 004B155D    pop         ebp
 004B155E    pop         edi
 004B155F    pop         esi
 004B1560    pop         ebx
 004B1561    ret
*}
end;

//004B1564
{*procedure sub_004B1564(?:?);
begin
 004B1564    mov         edx,dword ptr [eax+1B8]
 004B156A    xor         ecx,ecx
 004B156C    mov         dword ptr [eax+0D8],ecx
 004B1572    xor         ecx,ecx
 004B1574    mov         dword ptr [eax+90],ecx
 004B157A    xor         ecx,ecx
 004B157C    mov         dword ptr [eax+1A0],ecx
 004B1582    xor         eax,eax
 004B1584    mov         dword ptr [edx+0C],eax
 004B1587    xor         eax,eax
 004B1589    mov         dword ptr [edx+10],eax
 004B158C    xor         ecx,ecx
 004B158E    mov         dword ptr [edx+18],ecx
 004B1591    xor         eax,eax
 004B1593    mov         dword ptr [edx+0A4],eax
 004B1599    ret
end;*}

//004B159C
procedure @jinit_marker_reader;
begin
{*
 004B159C    push        ebx
 004B159D    push        ecx
 004B159E    mov         dword ptr [esp],eax
 004B15A1    mov         ecx,0AC
 004B15A6    xor         edx,edx
 004B15A8    mov         eax,dword ptr [esp]
 004B15AB    mov         ebx,dword ptr [eax+4]
 004B15AE    call        dword ptr [ebx]
 004B15B0    mov         edx,eax
 004B15B2    mov         eax,dword ptr [esp]
 004B15B5    xor         ecx,ecx
 004B15B7    mov         dword ptr [eax+1B8],edx
 004B15BD    mov         dword ptr [edx],4B1564;sub_004B1564
 004B15C3    lea         eax,[edx+20]
 004B15C6    mov         dword ptr [edx+4],4B10C8
 004B15CD    mov         dword ptr [edx+8],4B13D8
 004B15D4    mov         dword ptr [edx+1C],4B0E7C
 004B15DB    mov         dword ptr [edx+60],ecx
 004B15DE    xor         ecx,ecx
 004B15E0    mov         dword ptr [eax],4B0E7C
 004B15E6    xor         ebx,ebx
 004B15E8    mov         dword ptr [eax+44],ebx
 004B15EB    inc         ecx
 004B15EC    add         eax,4
 004B15EF    cmp         ecx,10
>004B15F2    jl          004B15E0
 004B15F4    mov         dword ptr [edx+20],4B0A14
 004B15FB    mov         dword ptr [edx+58],4B0A14
 004B1602    mov         eax,dword ptr [esp]
 004B1605    call        004B1564
 004B160A    pop         edx
 004B160B    pop         ebx
 004B160C    ret
*}
end;

//004B1610
procedure jpeg_save_markers(var cinfo:jpeg_decompress_struct; marker_code:Integer; length_limit:Cardinal);
begin
{*
 004B1610    push        ebx
 004B1611    push        esi
 004B1612    mov         ebx,dword ptr [eax+1B8]
 004B1618    mov         esi,dword ptr [eax+4]
 004B161B    mov         esi,dword ptr [esi+30]
 004B161E    sub         esi,14
 004B1621    cmp         esi,ecx
>004B1623    jge         004B1627
 004B1625    mov         ecx,esi
 004B1627    test        ecx,ecx
>004B1629    je          004B1658
 004B162B    mov         esi,4B0B80
 004B1630    cmp         edx,0E0
>004B1636    jne         004B1644
 004B1638    cmp         ecx,0E
>004B163B    jae         004B1644
 004B163D    mov         ecx,0E
>004B1642    jmp         004B1672
 004B1644    cmp         edx,0EE
>004B164A    jne         004B1672
 004B164C    cmp         ecx,0C
>004B164F    jae         004B1672
 004B1651    mov         ecx,0C
>004B1656    jmp         004B1672
 004B1658    mov         esi,4B0E7C
 004B165D    cmp         edx,0E0
>004B1663    je          004B166D
 004B1665    cmp         edx,0EE
>004B166B    jne         004B1672
 004B166D    mov         esi,4B0A14
 004B1672    cmp         edx,0FE
>004B1678    jne         004B1683
 004B167A    mov         dword ptr [ebx+1C],esi
 004B167D    mov         dword ptr [ebx+60],ecx
 004B1680    pop         esi
 004B1681    pop         ebx
 004B1682    ret
 004B1683    cmp         edx,0E0
>004B1689    jl          004B16A4
 004B168B    cmp         edx,0EF
>004B1691    jg          004B16A4
 004B1693    mov         dword ptr [ebx+edx*4-360],esi
 004B169A    mov         dword ptr [ebx+edx*4-31C],ecx
 004B16A1    pop         esi
 004B16A2    pop         ebx
 004B16A3    ret
 004B16A4    mov         ecx,dword ptr [eax]
 004B16A6    mov         dword ptr [ecx+14],44
 004B16AD    mov         dword ptr [ecx+18],edx
 004B16B0    mov         edx,dword ptr [eax]
 004B16B2    call        dword ptr [edx]
 004B16B4    pop         esi
 004B16B5    pop         ebx
 004B16B6    ret
*}
end;

//004B16F8
procedure @jdiv_round_up;
begin
{*
 004B16F8    push        ebx
 004B16F9    mov         ecx,edx
 004B16FB    mov         ebx,eax
 004B16FD    lea         eax,[ecx+ebx-1]
 004B1701    cdq
 004B1702    idiv        eax,ecx
 004B1704    pop         ebx
 004B1705    ret
*}
end;

//004B1708
procedure @jround_up;
begin
{*
 004B1708    push        ebx
 004B1709    mov         ebx,edx
 004B170B    mov         ecx,eax
 004B170D    lea         eax,[ebx-1]
 004B1710    add         ecx,eax
 004B1712    mov         eax,ecx
 004B1714    cdq
 004B1715    idiv        eax,ebx
 004B1717    mov         eax,ecx
 004B1719    sub         eax,edx
 004B171B    pop         ebx
 004B171C    ret
*}
end;

//004B1720
procedure @jcopy_sample_rows;
begin
{*
 004B1720    push        ebp
 004B1721    mov         ebp,esp
 004B1723    push        ecx
 004B1724    push        ebx
 004B1725    push        esi
 004B1726    push        edi
 004B1727    mov         ebx,eax
 004B1729    mov         eax,dword ptr [ebp+8]
 004B172C    shl         edx,2
 004B172F    mov         dword ptr [ebp-4],eax
 004B1732    add         ebx,edx
 004B1734    mov         edx,dword ptr [ebp+10]
 004B1737    shl         edx,2
 004B173A    mov         esi,ecx
 004B173C    add         esi,edx
 004B173E    mov         edi,dword ptr [ebp+0C]
 004B1741    test        edi,edi
>004B1743    jle         004B1762
 004B1745    mov         eax,dword ptr [ebx]
 004B1747    add         ebx,4
 004B174A    mov         edx,dword ptr [esi]
 004B174C    add         esi,4
 004B174F    mov         ecx,dword ptr [ebp-4]
 004B1752    push        ecx
 004B1753    push        eax
 004B1754    push        edx
 004B1755    call        _memcpy
 004B175A    add         esp,0C
 004B175D    dec         edi
 004B175E    test        edi,edi
>004B1760    jg          004B1745
 004B1762    pop         edi
 004B1763    pop         esi
 004B1764    pop         ebx
 004B1765    pop         ecx
 004B1766    pop         ebp
 004B1767    ret         0C
*}
end;

//004B176C
procedure @jcopy_block_row;
begin
{*
 004B176C    shl         ecx,7
 004B176F    push        ecx
 004B1770    push        eax
 004B1771    push        edx
 004B1772    call        _memcpy
 004B1777    add         esp,0C
 004B177A    ret
*}
end;

//004B177C
procedure @jzero_far;
begin
{*
 004B177C    push        edx
 004B177D    push        0
 004B177F    push        eax
 004B1780    call        _memset
 004B1785    add         esp,0C
 004B1788    ret
*}
end;

//004B178C
procedure @jpeg_abort;
begin
{*
 004B178C    push        ebx
 004B178D    push        esi
 004B178E    mov         esi,eax
 004B1790    cmp         dword ptr [esi+4],0
>004B1794    je          004B17C9
 004B1796    mov         ebx,1
 004B179B    mov         edx,ebx
 004B179D    mov         eax,esi
 004B179F    mov         ecx,dword ptr [eax+4]
 004B17A2    call        dword ptr [ecx+24]
 004B17A5    dec         ebx
 004B17A6    test        ebx,ebx
>004B17A8    jg          004B179B
 004B17AA    cmp         dword ptr [esi+10],0
>004B17AE    je          004B17C2
 004B17B0    mov         dword ptr [esi+14],0C8
 004B17B7    xor         eax,eax
 004B17B9    mov         dword ptr [esi+130],eax
 004B17BF    pop         esi
 004B17C0    pop         ebx
 004B17C1    ret
 004B17C2    mov         dword ptr [esi+14],64
 004B17C9    pop         esi
 004B17CA    pop         ebx
 004B17CB    ret
*}
end;

//004B17CC
procedure jpeg_destroy(var cinfo:jpeg_common_struct);
begin
{*
 004B17CC    push        ebx
 004B17CD    mov         ebx,eax
 004B17CF    cmp         dword ptr [ebx+4],0
>004B17D3    je          004B17DD
 004B17D5    mov         eax,ebx
 004B17D7    mov         edx,dword ptr [eax+4]
 004B17DA    call        dword ptr [edx+28]
 004B17DD    xor         ecx,ecx
 004B17DF    xor         eax,eax
 004B17E1    mov         dword ptr [ebx+4],ecx
 004B17E4    mov         dword ptr [ebx+14],eax
 004B17E7    pop         ebx
 004B17E8    ret
*}
end;

//004B17EC
procedure @jpeg_alloc_quant_table;
begin
{*
 004B17EC    push        ebx
 004B17ED    mov         ecx,84
 004B17F2    xor         edx,edx
 004B17F4    mov         ebx,dword ptr [eax+4]
 004B17F7    call        dword ptr [ebx]
 004B17F9    xor         edx,edx
 004B17FB    mov         dword ptr [eax+80],edx
 004B1801    pop         ebx
 004B1802    ret
*}
end;

//004B1804
procedure @jpeg_alloc_huff_table;
begin
{*
 004B1804    push        ebx
 004B1805    mov         ecx,118
 004B180A    xor         edx,edx
 004B180C    mov         ebx,dword ptr [eax+4]
 004B180F    call        dword ptr [ebx]
 004B1811    xor         edx,edx
 004B1813    mov         dword ptr [eax+114],edx
 004B1819    pop         ebx
 004B181A    ret
*}
end;

//004B181C
procedure _DF_.;
begin
{*
 004B181C    push        ebx
 004B181D    push        esi
 004B181E    mov         esi,eax
 004B1820    push        edi
 004B1821    mov         eax,esi
 004B1823    mov         ecx,1000
 004B1828    mov         ebx,dword ptr [esi+18]
 004B182B    mov         edx,1
 004B1830    mov         esi,dword ptr [eax+4]
 004B1833    call        dword ptr [esi]
 004B1835    mov         edi,eax
 004B1837    mov         dword ptr [ebx+18],edi
 004B183A    mov         dword ptr [ebx],edi
 004B183C    mov         dword ptr [ebx+4],1000
 004B1843    pop         edi
 004B1844    pop         esi
 004B1845    pop         ebx
 004B1846    ret
*}
end;

//004B18EC
procedure jpeg_stdio_dest(var cinfo:jpeg_compress_struct; output_file:TStream);
begin
{*
 004B18EC    push        ebx
 004B18ED    mov         ebx,eax
 004B18EF    push        esi
 004B18F0    push        edi
 004B18F1    cmp         dword ptr [ebx+18],0
 004B18F5    mov         esi,edx
>004B18F7    jne         004B190A
 004B18F9    mov         eax,ebx
 004B18FB    mov         ecx,1C
 004B1900    xor         edx,edx
 004B1902    mov         edi,dword ptr [eax+4]
 004B1905    call        dword ptr [edi]
 004B1907    mov         dword ptr [ebx+18],eax
 004B190A    mov         eax,dword ptr [ebx+18]
 004B190D    mov         dword ptr [eax+8],4B181C;_DF_.
 004B1914    mov         dword ptr [eax+0C],4B1848
 004B191B    mov         dword ptr [eax+10],4B1890
 004B1922    mov         dword ptr [eax+14],esi
 004B1925    pop         edi
 004B1926    pop         esi
 004B1927    pop         ebx
 004B1928    ret
*}
end;

//004B192C
procedure _DF_.;
begin
{*
 004B192C    push        ebp
 004B192D    mov         ebp,esp
 004B192F    push        ecx
 004B1930    push        ebx
 004B1931    mov         ebx,eax
 004B1933    push        esi
 004B1934    push        edi
 004B1935    mov         dword ptr [ebp-4],ecx
 004B1938    cmp         dword ptr [ebx+14],64
 004B193C    mov         esi,edx
>004B193E    je          004B1955
 004B1940    mov         eax,dword ptr [ebx]
 004B1942    mov         dword ptr [eax+14],14
 004B1949    mov         edx,dword ptr [ebx+14]
 004B194C    mov         dword ptr [eax+18],edx
 004B194F    mov         eax,ebx
 004B1951    mov         edx,dword ptr [eax]
 004B1953    call        dword ptr [edx]
 004B1955    test        esi,esi
>004B1957    jl          004B195E
 004B1959    cmp         esi,4
>004B195C    jl          004B1970
 004B195E    mov         eax,dword ptr [ebx]
 004B1960    mov         dword ptr [eax+14],1F
 004B1967    mov         dword ptr [eax+18],esi
 004B196A    mov         eax,ebx
 004B196C    mov         edx,dword ptr [eax]
 004B196E    call        dword ptr [edx]
 004B1970    lea         ecx,[ebx+esi*4+44]
 004B1974    mov         esi,ecx
 004B1976    cmp         dword ptr [esi],0
>004B1979    jne         004B1984
 004B197B    mov         eax,ebx
 004B197D    call        @jpeg_alloc_quant_table
 004B1982    mov         dword ptr [esi],eax
 004B1984    xor         ecx,ecx
 004B1986    mov         edx,dword ptr [ebp-4]
 004B1989    mov         ebx,edx
 004B198B    mov         eax,dword ptr [ebx]
 004B198D    imul        dword ptr [ebp+0C]
 004B1990    add         eax,32
 004B1993    mov         edi,64
 004B1998    cdq
 004B1999    idiv        eax,edi
 004B199B    test        eax,eax
>004B199D    jg          004B19A4
 004B199F    mov         eax,1
 004B19A4    cmp         eax,7FFF
>004B19A9    jle         004B19B0
 004B19AB    mov         eax,7FFF
 004B19B0    cmp         dword ptr [ebp+8],0
>004B19B4    je          004B19C2
 004B19B6    cmp         eax,0FF
>004B19BB    jle         004B19C2
 004B19BD    mov         eax,0FF
 004B19C2    mov         edx,dword ptr [esi]
 004B19C4    add         ebx,4
 004B19C7    mov         word ptr [edx+ecx*2],ax
 004B19CB    inc         ecx
 004B19CC    cmp         ecx,40
>004B19CF    jl          004B198B
 004B19D1    mov         ecx,dword ptr [esi]
 004B19D3    xor         eax,eax
 004B19D5    mov         dword ptr [ecx+80],eax
 004B19DB    pop         edi
 004B19DC    pop         esi
 004B19DD    pop         ebx
 004B19DE    pop         ecx
 004B19DF    pop         ebp
 004B19E0    ret         8
*}
end;

//004B19E4
{*procedure sub_004B19E4(?:?; ?:?; ?:?);
begin
 004B19E4    push        ebx
 004B19E5    push        esi
 004B19E6    push        edi
 004B19E7    mov         edi,ecx
 004B19E9    mov         esi,edx
 004B19EB    mov         ebx,eax
 004B19ED    push        esi
 004B19EE    push        edi
 004B19EF    mov         ecx,5ADC64
 004B19F4    xor         edx,edx
 004B19F6    mov         eax,ebx
 004B19F8    call        _DF_.
 004B19FD    push        esi
 004B19FE    push        edi
 004B19FF    mov         ecx,5ADD64
 004B1A04    mov         edx,1
 004B1A09    mov         eax,ebx
 004B1A0B    call        _DF_.
 004B1A10    pop         edi
 004B1A11    pop         esi
 004B1A12    pop         ebx
 004B1A13    ret
end;*}

//004B1A14
{*function sub_004B1A14(?:?):?;
begin
 004B1A14    mov         ecx,eax
 004B1A16    test        ecx,ecx
>004B1A18    jg          004B1A1F
 004B1A1A    mov         ecx,1
 004B1A1F    cmp         ecx,64
>004B1A22    jle         004B1A29
 004B1A24    mov         ecx,64
 004B1A29    cmp         ecx,32
>004B1A2C    jge         004B1A3A
 004B1A2E    mov         eax,1388
 004B1A33    cdq
 004B1A34    idiv        eax,ecx
 004B1A36    mov         ecx,eax
>004B1A38    jmp         004B1A45
 004B1A3A    add         ecx,ecx
 004B1A3C    mov         eax,0C8
 004B1A41    sub         eax,ecx
 004B1A43    mov         ecx,eax
 004B1A45    mov         eax,ecx
 004B1A47    ret
end;*}

//004B1A48
procedure jpeg_set_quality(var cinfo:jpeg_compress_struct; Quality:Integer; Baseline:LongBool);
begin
{*
 004B1A48    push        ebx
 004B1A49    push        esi
 004B1A4A    mov         esi,ecx
 004B1A4C    mov         ebx,eax
 004B1A4E    mov         eax,edx
 004B1A50    call        004B1A14
 004B1A55    mov         edx,eax
 004B1A57    mov         ecx,esi
 004B1A59    mov         eax,ebx
 004B1A5B    call        004B19E4
 004B1A60    pop         esi
 004B1A61    pop         ebx
 004B1A62    ret
*}
end;

//004B1A64
{*procedure sub_004B1A64(?:?; ?:?; ?:?; ?:?);
begin
 004B1A64    push        ebp
 004B1A65    mov         ebp,esp
 004B1A67    push        ecx
 004B1A68    push        ebx
 004B1A69    push        esi
 004B1A6A    push        edi
 004B1A6B    mov         edi,ecx
 004B1A6D    mov         esi,edx
 004B1A6F    mov         dword ptr [ebp-4],eax
 004B1A72    cmp         dword ptr [esi],0
>004B1A75    jne         004B1A81
 004B1A77    mov         eax,dword ptr [ebp-4]
 004B1A7A    call        @jpeg_alloc_huff_table
 004B1A7F    mov         dword ptr [esi],eax
 004B1A81    push        11
 004B1A83    push        edi
 004B1A84    mov         edx,dword ptr [esi]
 004B1A86    push        edx
 004B1A87    call        _memcpy
 004B1A8C    add         esp,0C
 004B1A8F    xor         ebx,ebx
 004B1A91    mov         edx,1
 004B1A96    lea         eax,[edi+1]
 004B1A99    xor         ecx,ecx
 004B1A9B    inc         edx
 004B1A9C    mov         cl,byte ptr [eax]
 004B1A9E    inc         eax
 004B1A9F    add         ebx,ecx
 004B1AA1    cmp         edx,10
>004B1AA4    jle         004B1A99
 004B1AA6    cmp         ebx,1
>004B1AA9    jl          004B1AB3
 004B1AAB    cmp         ebx,100
>004B1AB1    jle         004B1AC6
 004B1AB3    mov         eax,dword ptr [ebp-4]
 004B1AB6    mov         edx,dword ptr [eax]
 004B1AB8    mov         dword ptr [edx+14],8
 004B1ABF    mov         eax,dword ptr [ebp-4]
 004B1AC2    mov         edx,dword ptr [eax]
 004B1AC4    call        dword ptr [edx]
 004B1AC6    push        ebx
 004B1AC7    mov         ecx,dword ptr [ebp+8]
 004B1ACA    push        ecx
 004B1ACB    mov         eax,dword ptr [esi]
 004B1ACD    add         eax,11
 004B1AD0    push        eax
 004B1AD1    call        _memcpy
 004B1AD6    add         esp,0C
 004B1AD9    mov         edx,dword ptr [esi]
 004B1ADB    xor         ecx,ecx
 004B1ADD    mov         dword ptr [edx+114],ecx
 004B1AE3    pop         edi
 004B1AE4    pop         esi
 004B1AE5    pop         ebx
 004B1AE6    pop         ecx
 004B1AE7    pop         ebp
 004B1AE8    ret         4
end;*}

//004B1AEC
{*procedure sub_004B1AEC(?:?);
begin
 004B1AEC    push        ebx
 004B1AED    mov         ebx,eax
 004B1AEF    push        5ADE75
 004B1AF4    mov         ecx,5ADE64
 004B1AF9    lea         edx,[ebx+54]
 004B1AFC    mov         eax,ebx
 004B1AFE    call        004B1A64
 004B1B03    push        5ADEAF
 004B1B08    mov         ecx,5ADE9E
 004B1B0D    lea         edx,[ebx+64]
 004B1B10    mov         eax,ebx
 004B1B12    call        004B1A64
 004B1B17    push        5ADE92
 004B1B1C    mov         ecx,5ADE81
 004B1B21    lea         edx,[ebx+58]
 004B1B24    mov         eax,ebx
 004B1B26    call        004B1A64
 004B1B2B    push        5ADF62
 004B1B30    mov         ecx,5ADF51
 004B1B35    lea         edx,[ebx+68]
 004B1B38    mov         eax,ebx
 004B1B3A    call        004B1A64
 004B1B3F    pop         ebx
 004B1B40    ret
end;*}

//004B1B44
procedure jpeg_set_defaults(var cinfo:jpeg_compress_struct);
begin
{*
 004B1B44    push        ebx
 004B1B45    mov         ebx,eax
 004B1B47    push        esi
 004B1B48    cmp         dword ptr [ebx+14],64
>004B1B4C    je          004B1B63
 004B1B4E    mov         eax,dword ptr [ebx]
 004B1B50    mov         dword ptr [eax+14],14
 004B1B57    mov         edx,dword ptr [ebx+14]
 004B1B5A    mov         dword ptr [eax+18],edx
 004B1B5D    mov         eax,ebx
 004B1B5F    mov         edx,dword ptr [eax]
 004B1B61    call        dword ptr [edx]
 004B1B63    cmp         dword ptr [ebx+40],0
>004B1B67    jne         004B1B7A
 004B1B69    mov         eax,ebx
 004B1B6B    mov         ecx,348
 004B1B70    xor         edx,edx
 004B1B72    mov         esi,dword ptr [eax+4]
 004B1B75    call        dword ptr [esi]
 004B1B77    mov         dword ptr [ebx+40],eax
 004B1B7A    mov         dword ptr [ebx+34],8
 004B1B81    mov         ecx,1
 004B1B86    mov         edx,4B
 004B1B8B    mov         eax,ebx
 004B1B8D    call        jpeg_set_quality
 004B1B92    mov         eax,ebx
 004B1B94    call        004B1AEC
 004B1B99    xor         edx,edx
 004B1B9B    lea         eax,[ebx+74]
 004B1B9E    mov         byte ptr [eax],0
 004B1BA1    mov         byte ptr [eax+10],1
 004B1BA5    mov         byte ptr [eax+20],5
 004B1BA9    inc         edx
 004B1BAA    inc         eax
 004B1BAB    cmp         edx,10
>004B1BAE    jl          004B1B9E
 004B1BB0    xor         edx,edx
 004B1BB2    xor         ecx,ecx
 004B1BB4    mov         dword ptr [ebx+0A8],edx
 004B1BBA    mov         dword ptr [ebx+0A4],ecx
 004B1BC0    xor         eax,eax
 004B1BC2    xor         edx,edx
 004B1BC4    mov         dword ptr [ebx+0AC],eax
 004B1BCA    xor         ecx,ecx
 004B1BCC    mov         dword ptr [ebx+0B0],edx
 004B1BD2    mov         dword ptr [ebx+0B4],ecx
 004B1BD8    cmp         dword ptr [ebx+34],8
>004B1BDC    jle         004B1BE8
 004B1BDE    mov         dword ptr [ebx+0B4],1
 004B1BE8    xor         eax,eax
 004B1BEA    xor         edx,edx
 004B1BEC    mov         dword ptr [ebx+0B8],eax
 004B1BF2    mov         dword ptr [ebx+0BC],edx
 004B1BF8    mov         dword ptr [ebx+0C0],2
 004B1C02    xor         ecx,ecx
 004B1C04    xor         eax,eax
 004B1C06    mov         dword ptr [ebx+0C4],ecx
 004B1C0C    mov         dword ptr [ebx+0C8],eax
 004B1C12    mov         byte ptr [ebx+0D0],1
 004B1C19    mov         byte ptr [ebx+0D1],1
 004B1C20    mov         byte ptr [ebx+0D2],0
 004B1C27    mov         word ptr [ebx+0D4],1
 004B1C30    mov         word ptr [ebx+0D6],1
 004B1C39    mov         eax,ebx
 004B1C3B    call        004B1C44
 004B1C40    pop         esi
 004B1C41    pop         ebx
 004B1C42    ret
*}
end;

//004B1C44
{*procedure sub_004B1C44(?:?);
begin
 004B1C44    mov         edx,dword ptr [eax+28]
 004B1C47    cmp         edx,5
>004B1C4A    ja          004B1CAA
 004B1C4C    jmp         dword ptr [edx*4+4B1C53]
 004B1C4C    dd          004B1CA2
 004B1C4C    dd          004B1C6B
 004B1C4C    dd          004B1C76
 004B1C4C    dd          004B1C81
 004B1C4C    dd          004B1C8C
 004B1C4C    dd          004B1C97
 004B1C6B    mov         edx,1
 004B1C70    call        jpeg_set_colorspace
 004B1C75    ret
 004B1C76    mov         edx,3
 004B1C7B    call        jpeg_set_colorspace
 004B1C80    ret
 004B1C81    mov         edx,3
 004B1C86    call        jpeg_set_colorspace
 004B1C8B    ret
 004B1C8C    mov         edx,4
 004B1C91    call        jpeg_set_colorspace
 004B1C96    ret
 004B1C97    mov         edx,5
 004B1C9C    call        jpeg_set_colorspace
 004B1CA1    ret
 004B1CA2    xor         edx,edx
 004B1CA4    call        jpeg_set_colorspace
 004B1CA9    ret
 004B1CAA    mov         ecx,dword ptr [eax]
 004B1CAC    mov         dword ptr [ecx+14],9
 004B1CB3    mov         edx,dword ptr [eax]
 004B1CB5    call        dword ptr [edx]
 004B1CB7    ret
end;*}

//004B1CB8
procedure jpeg_set_colorspace(var cinfo:jpeg_compress_struct; colorspace:J_COLOR_SPACE);
begin
{*
 004B1CB8    push        ebx
 004B1CB9    mov         ebx,eax
 004B1CBB    push        esi
 004B1CBC    mov         esi,edx
 004B1CBE    cmp         dword ptr [ebx+14],64
>004B1CC2    je          004B1CD9
 004B1CC4    mov         eax,dword ptr [ebx]
 004B1CC6    mov         dword ptr [eax+14],14
 004B1CCD    mov         edx,dword ptr [ebx+14]
 004B1CD0    mov         dword ptr [eax+18],edx
 004B1CD3    mov         eax,ebx
 004B1CD5    mov         edx,dword ptr [eax]
 004B1CD7    call        dword ptr [edx]
 004B1CD9    mov         dword ptr [ebx+3C],esi
 004B1CDC    xor         ecx,ecx
 004B1CDE    mov         dword ptr [ebx+0CC],ecx
 004B1CE4    xor         eax,eax
 004B1CE6    mov         dword ptr [ebx+0D8],eax
 004B1CEC    cmp         esi,5
>004B1CEF    ja          004B205B
 004B1CF5    jmp         dword ptr [esi*4+4B1CFC]
 004B1CF5    dd          004B1FF4
 004B1CF5    dd          004B1D14
 004B1CF5    dd          004B1D4E
 004B1CF5    dd          004B1DDC
 004B1CF5    dd          004B1E76
 004B1CF5    dd          004B1F2F
 004B1D14    mov         dword ptr [ebx+0CC],1
 004B1D1E    mov         dword ptr [ebx+38],1
 004B1D25    mov         eax,dword ptr [ebx+40]
 004B1D28    xor         edx,edx
 004B1D2A    xor         ecx,ecx
 004B1D2C    mov         dword ptr [eax],1
 004B1D32    mov         dword ptr [eax+8],1
 004B1D39    mov         dword ptr [eax+0C],1
 004B1D40    mov         dword ptr [eax+10],edx
 004B1D43    xor         edx,edx
 004B1D45    mov         dword ptr [eax+14],ecx
 004B1D48    mov         dword ptr [eax+18],edx
 004B1D4B    pop         esi
 004B1D4C    pop         ebx
 004B1D4D    ret
 004B1D4E    mov         dword ptr [ebx+0D8],1
 004B1D58    mov         dword ptr [ebx+38],3
 004B1D5F    mov         eax,dword ptr [ebx+40]
 004B1D62    xor         ecx,ecx
 004B1D64    xor         edx,edx
 004B1D66    mov         dword ptr [eax],52
 004B1D6C    mov         dword ptr [eax+8],1
 004B1D73    mov         dword ptr [eax+0C],1
 004B1D7A    mov         dword ptr [eax+10],ecx
 004B1D7D    xor         ecx,ecx
 004B1D7F    mov         dword ptr [eax+14],edx
 004B1D82    mov         dword ptr [eax+18],ecx
 004B1D85    mov         eax,dword ptr [ebx+40]
 004B1D88    xor         edx,edx
 004B1D8A    add         eax,54
 004B1D8D    xor         ecx,ecx
 004B1D8F    mov         dword ptr [eax],47
 004B1D95    mov         dword ptr [eax+8],1
 004B1D9C    mov         dword ptr [eax+0C],1
 004B1DA3    mov         dword ptr [eax+10],edx
 004B1DA6    xor         edx,edx
 004B1DA8    mov         dword ptr [eax+14],ecx
 004B1DAB    mov         dword ptr [eax+18],edx
 004B1DAE    mov         eax,dword ptr [ebx+40]
 004B1DB1    xor         ecx,ecx
 004B1DB3    add         eax,0A8
 004B1DB8    xor         edx,edx
 004B1DBA    mov         dword ptr [eax],42
 004B1DC0    mov         dword ptr [eax+8],1
 004B1DC7    mov         dword ptr [eax+0C],1
 004B1DCE    mov         dword ptr [eax+10],ecx
 004B1DD1    xor         ecx,ecx
 004B1DD3    mov         dword ptr [eax+14],edx
 004B1DD6    mov         dword ptr [eax+18],ecx
 004B1DD9    pop         esi
 004B1DDA    pop         ebx
 004B1DDB    ret
 004B1DDC    mov         dword ptr [ebx+0CC],1
 004B1DE6    mov         dword ptr [ebx+38],3
 004B1DED    mov         eax,dword ptr [ebx+40]
 004B1DF0    xor         edx,edx
 004B1DF2    xor         ecx,ecx
 004B1DF4    mov         dword ptr [eax],1
 004B1DFA    mov         dword ptr [eax+8],2
 004B1E01    mov         dword ptr [eax+0C],2
 004B1E08    mov         dword ptr [eax+10],edx
 004B1E0B    xor         edx,edx
 004B1E0D    mov         dword ptr [eax+14],ecx
 004B1E10    mov         dword ptr [eax+18],edx
 004B1E13    mov         eax,dword ptr [ebx+40]
 004B1E16    add         eax,54
 004B1E19    mov         dword ptr [eax],2
 004B1E1F    mov         dword ptr [eax+8],1
 004B1E26    mov         dword ptr [eax+0C],1
 004B1E2D    mov         dword ptr [eax+10],1
 004B1E34    mov         dword ptr [eax+14],1
 004B1E3B    mov         dword ptr [eax+18],1
 004B1E42    mov         eax,dword ptr [ebx+40]
 004B1E45    add         eax,0A8
 004B1E4A    mov         dword ptr [eax],3
 004B1E50    mov         dword ptr [eax+8],1
 004B1E57    mov         dword ptr [eax+0C],1
 004B1E5E    mov         dword ptr [eax+10],1
 004B1E65    mov         dword ptr [eax+14],1
 004B1E6C    mov         dword ptr [eax+18],1
 004B1E73    pop         esi
 004B1E74    pop         ebx
 004B1E75    ret
 004B1E76    mov         dword ptr [ebx+0D8],1
 004B1E80    mov         dword ptr [ebx+38],4
 004B1E87    mov         eax,dword ptr [ebx+40]
 004B1E8A    xor         edx,edx
 004B1E8C    xor         ecx,ecx
 004B1E8E    mov         dword ptr [eax],43
 004B1E94    mov         dword ptr [eax+8],1
 004B1E9B    mov         dword ptr [eax+0C],1
 004B1EA2    mov         dword ptr [eax+10],edx
 004B1EA5    xor         edx,edx
 004B1EA7    mov         dword ptr [eax+14],ecx
 004B1EAA    mov         dword ptr [eax+18],edx
 004B1EAD    mov         eax,dword ptr [ebx+40]
 004B1EB0    xor         ecx,ecx
 004B1EB2    add         eax,54
 004B1EB5    xor         edx,edx
 004B1EB7    mov         dword ptr [eax],4D
 004B1EBD    mov         dword ptr [eax+8],1
 004B1EC4    mov         dword ptr [eax+0C],1
 004B1ECB    mov         dword ptr [eax+10],ecx
 004B1ECE    xor         ecx,ecx
 004B1ED0    mov         dword ptr [eax+14],edx
 004B1ED3    mov         dword ptr [eax+18],ecx
 004B1ED6    mov         eax,dword ptr [ebx+40]
 004B1ED9    xor         edx,edx
 004B1EDB    add         eax,0A8
 004B1EE0    xor         ecx,ecx
 004B1EE2    mov         dword ptr [eax],59
 004B1EE8    mov         dword ptr [eax+8],1
 004B1EEF    mov         dword ptr [eax+0C],1
 004B1EF6    mov         dword ptr [eax+10],edx
 004B1EF9    xor         edx,edx
 004B1EFB    mov         dword ptr [eax+14],ecx
 004B1EFE    mov         dword ptr [eax+18],edx
 004B1F01    mov         eax,dword ptr [ebx+40]
 004B1F04    xor         ecx,ecx
 004B1F06    add         eax,0FC
 004B1F0B    xor         edx,edx
 004B1F0D    mov         dword ptr [eax],4B
 004B1F13    mov         dword ptr [eax+8],1
 004B1F1A    mov         dword ptr [eax+0C],1
 004B1F21    mov         dword ptr [eax+10],ecx
 004B1F24    xor         ecx,ecx
 004B1F26    mov         dword ptr [eax+14],edx
 004B1F29    mov         dword ptr [eax+18],ecx
 004B1F2C    pop         esi
 004B1F2D    pop         ebx
 004B1F2E    ret
 004B1F2F    mov         dword ptr [ebx+0D8],1
 004B1F39    mov         dword ptr [ebx+38],4
 004B1F40    mov         eax,dword ptr [ebx+40]
 004B1F43    xor         edx,edx
 004B1F45    xor         ecx,ecx
 004B1F47    mov         dword ptr [eax],1
 004B1F4D    mov         dword ptr [eax+8],2
 004B1F54    mov         dword ptr [eax+0C],2
 004B1F5B    mov         dword ptr [eax+10],edx
 004B1F5E    xor         edx,edx
 004B1F60    mov         dword ptr [eax+14],ecx
 004B1F63    mov         dword ptr [eax+18],edx
 004B1F66    mov         eax,dword ptr [ebx+40]
 004B1F69    xor         edx,edx
 004B1F6B    add         eax,54
 004B1F6E    xor         ecx,ecx
 004B1F70    mov         dword ptr [eax],2
 004B1F76    mov         dword ptr [eax+8],1
 004B1F7D    mov         dword ptr [eax+0C],1
 004B1F84    mov         dword ptr [eax+10],1
 004B1F8B    mov         dword ptr [eax+14],1
 004B1F92    mov         dword ptr [eax+18],1
 004B1F99    mov         eax,dword ptr [ebx+40]
 004B1F9C    add         eax,0A8
 004B1FA1    mov         dword ptr [eax],3
 004B1FA7    mov         dword ptr [eax+8],1
 004B1FAE    mov         dword ptr [eax+0C],1
 004B1FB5    mov         dword ptr [eax+10],1
 004B1FBC    mov         dword ptr [eax+14],1
 004B1FC3    mov         dword ptr [eax+18],1
 004B1FCA    mov         eax,dword ptr [ebx+40]
 004B1FCD    add         eax,0FC
 004B1FD2    mov         dword ptr [eax],4
 004B1FD8    mov         dword ptr [eax+8],2
 004B1FDF    mov         dword ptr [eax+0C],2
 004B1FE6    mov         dword ptr [eax+10],edx
 004B1FE9    xor         edx,edx
 004B1FEB    mov         dword ptr [eax+14],ecx
 004B1FEE    mov         dword ptr [eax+18],edx
 004B1FF1    pop         esi
 004B1FF2    pop         ebx
 004B1FF3    ret
 004B1FF4    mov         eax,dword ptr [ebx+24]
 004B1FF7    mov         dword ptr [ebx+38],eax
 004B1FFA    mov         eax,dword ptr [ebx+38]
 004B1FFD    cmp         eax,1
>004B2000    jl          004B2007
 004B2002    cmp         eax,0A
>004B2005    jle         004B2023
 004B2007    mov         eax,dword ptr [ebx]
 004B2009    mov         dword ptr [eax+14],1A
 004B2010    mov         edx,dword ptr [ebx+38]
 004B2013    mov         dword ptr [eax+18],edx
 004B2016    mov         dword ptr [eax+1C],0A
 004B201D    mov         eax,ebx
 004B201F    mov         edx,dword ptr [eax]
 004B2021    call        dword ptr [edx]
 004B2023    xor         edx,edx
>004B2025    jmp         004B2053
 004B2027    lea         eax,[edx+edx*4]
 004B202A    xor         ecx,ecx
 004B202C    lea         eax,[edx+eax*4]
 004B202F    shl         eax,2
 004B2032    add         eax,dword ptr [ebx+40]
 004B2035    mov         dword ptr [eax],edx
 004B2037    mov         dword ptr [eax+8],1
 004B203E    mov         dword ptr [eax+0C],1
 004B2045    mov         dword ptr [eax+10],ecx
 004B2048    xor         ecx,ecx
 004B204A    mov         dword ptr [eax+14],ecx
 004B204D    xor         ecx,ecx
 004B204F    mov         dword ptr [eax+18],ecx
 004B2052    inc         edx
 004B2053    cmp         edx,dword ptr [ebx+38]
>004B2056    jl          004B2027
 004B2058    pop         esi
 004B2059    pop         ebx
 004B205A    ret
 004B205B    mov         eax,dword ptr [ebx]
 004B205D    mov         dword ptr [eax+14],0A
 004B2064    mov         eax,ebx
 004B2066    mov         edx,dword ptr [eax]
 004B2068    call        dword ptr [edx]
 004B206A    pop         esi
 004B206B    pop         ebx
 004B206C    ret
*}
end;

//004B2070
{*function sub_004B2070(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 004B2070    push        ebp
 004B2071    mov         ebp,esp
 004B2073    mov         dword ptr [eax],1
 004B2079    mov         dword ptr [eax+4],edx
 004B207C    mov         dword ptr [eax+14],ecx
 004B207F    mov         edx,dword ptr [ebp+10]
 004B2082    mov         dword ptr [eax+18],edx
 004B2085    mov         ecx,dword ptr [ebp+0C]
 004B2088    mov         dword ptr [eax+1C],ecx
 004B208B    mov         edx,dword ptr [ebp+8]
 004B208E    mov         dword ptr [eax+20],edx
 004B2091    add         eax,24
 004B2094    pop         ebp
 004B2095    ret         0C
end;*}

//004B2098
{*function sub_004B2098(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 004B2098    push        ebp
 004B2099    mov         ebp,esp
 004B209B    push        ebx
 004B209C    push        esi
 004B209D    push        edi
 004B209E    mov         esi,dword ptr [ebp+10]
 004B20A1    xor         ebx,ebx
 004B20A3    cmp         edx,ebx
>004B20A5    jle         004B20CA
 004B20A7    mov         dword ptr [eax],1
 004B20AD    mov         dword ptr [eax+4],ebx
 004B20B0    mov         dword ptr [eax+14],ecx
 004B20B3    mov         dword ptr [eax+18],esi
 004B20B6    mov         edi,dword ptr [ebp+0C]
 004B20B9    inc         ebx
 004B20BA    mov         dword ptr [eax+1C],edi
 004B20BD    mov         edi,dword ptr [ebp+8]
 004B20C0    mov         dword ptr [eax+20],edi
 004B20C3    add         eax,24
 004B20C6    cmp         edx,ebx
>004B20C8    jg          004B20A7
 004B20CA    pop         edi
 004B20CB    pop         esi
 004B20CC    pop         ebx
 004B20CD    pop         ebp
 004B20CE    ret         0C
end;*}

//004B20D4
{*function sub_004B20D4(?:?; ?:?; ?:?; ?:?):?;
begin
 004B20D4    push        ebp
 004B20D5    mov         ebp,esp
 004B20D7    push        ebx
 004B20D8    push        esi
 004B20D9    cmp         edx,4
>004B20DC    jg          004B2109
 004B20DE    mov         dword ptr [eax],edx
 004B20E0    xor         ebx,ebx
 004B20E2    lea         esi,[eax+4]
 004B20E5    cmp         edx,ebx
>004B20E7    jle         004B20F3
 004B20E9    mov         dword ptr [esi],ebx
 004B20EB    inc         ebx
 004B20EC    add         esi,4
 004B20EF    cmp         edx,ebx
>004B20F1    jg          004B20E9
 004B20F3    xor         edx,edx
 004B20F5    mov         dword ptr [eax+18],edx
 004B20F8    mov         dword ptr [eax+14],edx
 004B20FB    mov         dword ptr [eax+1C],ecx
 004B20FE    mov         ecx,dword ptr [ebp+8]
 004B2101    mov         dword ptr [eax+20],ecx
 004B2104    add         eax,24
>004B2107    jmp         004B2117
 004B2109    push        0
 004B210B    push        ecx
 004B210C    mov         ecx,dword ptr [ebp+8]
 004B210F    push        ecx
 004B2110    xor         ecx,ecx
 004B2112    call        004B2098
 004B2117    pop         esi
 004B2118    pop         ebx
 004B2119    pop         ebp
 004B211A    ret         4
end;*}

//004B2120
procedure jpeg_simple_progression(var cinfo:jpeg_compress_struct);
begin
{*
 004B2120    push        ebx
 004B2121    push        esi
 004B2122    mov         esi,eax
 004B2124    push        edi
 004B2125    push        ecx
 004B2126    cmp         dword ptr [esi+14],64
 004B212A    mov         edi,dword ptr [esi+38]
>004B212D    je          004B2144
 004B212F    mov         eax,dword ptr [esi]
 004B2131    mov         dword ptr [eax+14],14
 004B2138    mov         edx,dword ptr [esi+14]
 004B213B    mov         dword ptr [eax+18],edx
 004B213E    mov         eax,esi
 004B2140    mov         edx,dword ptr [eax]
 004B2142    call        dword ptr [edx]
 004B2144    cmp         edi,3
>004B2147    jne         004B2158
 004B2149    cmp         dword ptr [esi+3C],3
>004B214D    jne         004B2158
 004B214F    mov         dword ptr [esp],0A
>004B2156    jmp         004B2174
 004B2158    cmp         edi,4
>004B215B    jle         004B2169
 004B215D    mov         ecx,edi
 004B215F    add         ecx,ecx
 004B2161    lea         ecx,[ecx+ecx*2]
 004B2164    mov         dword ptr [esp],ecx
>004B2167    jmp         004B2174
 004B2169    mov         eax,edi
 004B216B    shl         eax,2
 004B216E    add         eax,2
 004B2171    mov         dword ptr [esp],eax
 004B2174    cmp         dword ptr [esi+16C],0
>004B217B    je          004B2188
 004B217D    mov         edx,dword ptr [esi+170]
 004B2183    cmp         edx,dword ptr [esp]
>004B2186    jge         004B21B5
 004B2188    cmp         dword ptr [esp],0A
>004B218C    jle         004B2193
 004B218E    mov         ebx,dword ptr [esp]
>004B2191    jmp         004B2198
 004B2193    mov         ebx,0A
 004B2198    mov         ecx,ebx
 004B219A    mov         eax,esi
 004B219C    shl         ecx,2
 004B219F    mov         dword ptr [esi+170],ebx
 004B21A5    mov         ebx,dword ptr [eax+4]
 004B21A8    xor         edx,edx
 004B21AA    lea         ecx,[ecx+ecx*8]
 004B21AD    call        dword ptr [ebx]
 004B21AF    mov         dword ptr [esi+16C],eax
 004B21B5    mov         ebx,dword ptr [esi+16C]
 004B21BB    cmp         edi,3
 004B21BE    mov         dword ptr [esi+0A8],ebx
 004B21C4    mov         eax,dword ptr [esp]
 004B21C7    mov         dword ptr [esi+0A4],eax
>004B21CD    jne         004B22BA
 004B21D3    cmp         dword ptr [esi+3C],3
>004B21D7    jne         004B22BA
 004B21DD    push        1
 004B21DF    xor         ecx,ecx
 004B21E1    mov         edx,edi
 004B21E3    mov         eax,ebx
 004B21E5    call        004B20D4
 004B21EA    mov         ebx,eax
 004B21EC    push        5
 004B21EE    push        0
 004B21F0    push        2
 004B21F2    mov         ecx,1
 004B21F7    xor         edx,edx
 004B21F9    mov         eax,ebx
 004B21FB    call        004B2070
 004B2200    mov         ebx,eax
 004B2202    push        3F
 004B2204    push        0
 004B2206    push        1
 004B2208    mov         ecx,1
 004B220D    mov         edx,2
 004B2212    mov         eax,ebx
 004B2214    call        004B2070
 004B2219    mov         ebx,eax
 004B221B    push        3F
 004B221D    push        0
 004B221F    push        1
 004B2221    mov         ecx,1
 004B2226    mov         edx,1
 004B222B    mov         eax,ebx
 004B222D    call        004B2070
 004B2232    mov         ebx,eax
 004B2234    push        3F
 004B2236    push        0
 004B2238    push        2
 004B223A    mov         ecx,6
 004B223F    xor         edx,edx
 004B2241    mov         eax,ebx
 004B2243    call        004B2070
 004B2248    mov         ebx,eax
 004B224A    push        3F
 004B224C    push        2
 004B224E    push        1
 004B2250    mov         ecx,1
 004B2255    xor         edx,edx
 004B2257    mov         eax,ebx
 004B2259    call        004B2070
 004B225E    mov         ebx,eax
 004B2260    push        0
 004B2262    mov         ecx,1
 004B2267    mov         edx,edi
 004B2269    mov         eax,ebx
 004B226B    call        004B20D4
 004B2270    mov         ebx,eax
 004B2272    push        3F
 004B2274    push        1
 004B2276    push        0
 004B2278    mov         ecx,1
 004B227D    mov         edx,2
 004B2282    mov         eax,ebx
 004B2284    call        004B2070
 004B2289    mov         ebx,eax
 004B228B    push        3F
 004B228D    push        1
 004B228F    push        0
 004B2291    mov         ecx,1
 004B2296    mov         edx,1
 004B229B    mov         eax,ebx
 004B229D    call        004B2070
 004B22A2    mov         ebx,eax
 004B22A4    push        3F
 004B22A6    push        1
 004B22A8    push        0
 004B22AA    mov         ecx,1
 004B22AF    xor         edx,edx
 004B22B1    mov         eax,ebx
 004B22B3    call        004B2070
>004B22B8    jmp         004B2331
 004B22BA    push        1
 004B22BC    xor         ecx,ecx
 004B22BE    mov         edx,edi
 004B22C0    mov         eax,ebx
 004B22C2    call        004B20D4
 004B22C7    mov         ebx,eax
 004B22C9    push        5
 004B22CB    push        0
 004B22CD    push        2
 004B22CF    mov         ecx,1
 004B22D4    mov         edx,edi
 004B22D6    mov         eax,ebx
 004B22D8    call        004B2098
 004B22DD    mov         ebx,eax
 004B22DF    push        3F
 004B22E1    push        0
 004B22E3    push        2
 004B22E5    mov         ecx,6
 004B22EA    mov         edx,edi
 004B22EC    mov         eax,ebx
 004B22EE    call        004B2098
 004B22F3    mov         ebx,eax
 004B22F5    push        3F
 004B22F7    push        2
 004B22F9    push        1
 004B22FB    mov         ecx,1
 004B2300    mov         edx,edi
 004B2302    mov         eax,ebx
 004B2304    call        004B2098
 004B2309    mov         ebx,eax
 004B230B    push        0
 004B230D    mov         ecx,1
 004B2312    mov         edx,edi
 004B2314    mov         eax,ebx
 004B2316    call        004B20D4
 004B231B    mov         ebx,eax
 004B231D    push        3F
 004B231F    push        1
 004B2321    push        0
 004B2323    mov         ecx,1
 004B2328    mov         edx,edi
 004B232A    mov         eax,ebx
 004B232C    call        004B2098
 004B2331    pop         edx
 004B2332    pop         edi
 004B2333    pop         esi
 004B2334    pop         ebx
 004B2335    ret
*}
end;

//004B2338
procedure jpeg_start_compress(var cinfo:jpeg_compress_struct; WriteAllTables:LongBool);
begin
{*
 004B2338    push        ebx
 004B2339    mov         ebx,eax
 004B233B    push        esi
 004B233C    mov         esi,edx
 004B233E    cmp         dword ptr [ebx+14],64
>004B2342    je          004B2359
 004B2344    mov         eax,dword ptr [ebx]
 004B2346    mov         dword ptr [eax+14],14
 004B234D    mov         edx,dword ptr [ebx+14]
 004B2350    mov         dword ptr [eax+18],edx
 004B2353    mov         eax,ebx
 004B2355    mov         edx,dword ptr [eax]
 004B2357    call        dword ptr [edx]
 004B2359    test        esi,esi
>004B235B    je          004B2366
 004B235D    xor         edx,edx
 004B235F    mov         eax,ebx
 004B2361    call        @jpeg_suppress_tables
 004B2366    mov         eax,ebx
 004B2368    mov         edx,dword ptr [eax]
 004B236A    call        dword ptr [edx+10]
 004B236D    mov         eax,ebx
 004B236F    mov         edx,dword ptr [eax+18]
 004B2372    call        dword ptr [edx+8]
 004B2375    mov         eax,ebx
 004B2377    call        @jinit_compress_master
 004B237C    mov         eax,ebx
 004B237E    mov         edx,dword ptr [eax+148]
 004B2384    call        dword ptr [edx]
 004B2386    xor         ecx,ecx
 004B2388    mov         dword ptr [ebx+0DC],ecx
 004B238E    cmp         dword ptr [ebx+0AC],0
>004B2395    je          004B239E
 004B2397    mov         eax,66
>004B239C    jmp         004B23A3
 004B239E    mov         eax,65
 004B23A3    mov         dword ptr [ebx+14],eax
 004B23A6    pop         esi
 004B23A7    pop         ebx
 004B23A8    ret
*}
end;

//004B23AC
function jpeg_write_scanlines(var cinfo:jpeg_compress_struct; scanlines:JSAMPARRAY; max_lines:Cardinal):Cardinal;
begin
{*
 004B23AC    push        ebx
 004B23AD    mov         ebx,eax
 004B23AF    push        esi
 004B23B0    push        edi
 004B23B1    push        ecx
 004B23B2    mov         edi,edx
 004B23B4    cmp         dword ptr [ebx+14],65
 004B23B8    mov         esi,ecx
>004B23BA    je          004B23D1
 004B23BC    mov         eax,dword ptr [ebx]
 004B23BE    mov         dword ptr [eax+14],14
 004B23C5    mov         edx,dword ptr [ebx+14]
 004B23C8    mov         dword ptr [eax+18],edx
 004B23CB    mov         eax,ebx
 004B23CD    mov         edx,dword ptr [eax]
 004B23CF    call        dword ptr [edx]
 004B23D1    mov         ecx,dword ptr [ebx+0DC]
 004B23D7    cmp         ecx,dword ptr [ebx+20]
>004B23DA    jb          004B23EF
 004B23DC    mov         eax,dword ptr [ebx]
 004B23DE    mov         dword ptr [eax+14],7B
 004B23E5    or          edx,0FFFFFFFF
 004B23E8    mov         eax,ebx
 004B23EA    mov         ecx,dword ptr [eax]
 004B23EC    call        dword ptr [ecx+4]
 004B23EF    mov         eax,dword ptr [ebx+8]
 004B23F2    test        eax,eax
>004B23F4    je          004B240C
 004B23F6    mov         edx,dword ptr [ebx+0DC]
 004B23FC    mov         dword ptr [eax+4],edx
 004B23FF    mov         ecx,dword ptr [ebx+20]
 004B2402    mov         dword ptr [eax+8],ecx
 004B2405    mov         eax,ebx
 004B2407    mov         edx,dword ptr [eax+8]
 004B240A    call        dword ptr [edx]
 004B240C    mov         ecx,dword ptr [ebx+148]
 004B2412    cmp         dword ptr [ecx+0C],0
>004B2416    je          004B2423
 004B2418    mov         eax,ebx
 004B241A    mov         edx,dword ptr [eax+148]
 004B2420    call        dword ptr [edx+4]
 004B2423    mov         eax,dword ptr [ebx+20]
 004B2426    sub         eax,dword ptr [ebx+0DC]
 004B242C    cmp         eax,esi
>004B242E    jae         004B2432
 004B2430    mov         esi,eax
 004B2432    xor         eax,eax
 004B2434    mov         edx,edi
 004B2436    mov         dword ptr [esp],eax
 004B2439    mov         eax,ebx
 004B243B    push        esi
 004B243C    lea         ecx,[esp+4]
 004B2440    mov         esi,dword ptr [eax+14C]
 004B2446    call        dword ptr [esi+4]
 004B2449    mov         eax,dword ptr [esp]
 004B244C    add         dword ptr [ebx+0DC],eax
 004B2452    mov         eax,dword ptr [esp]
 004B2455    pop         edx
 004B2456    pop         edi
 004B2457    pop         esi
 004B2458    pop         ebx
 004B2459    ret
*}
end;

//004B2518
procedure jpeg_CreateCompress(var cinfo:jpeg_compress_struct; version:Integer; structsize:Integer);
begin
{*
 004B2518    push        ebx
 004B2519    mov         ebx,eax
 004B251B    push        esi
 004B251C    xor         eax,eax
 004B251E    push        edi
 004B251F    mov         dword ptr [ebx+4],eax
 004B2522    cmp         edx,3E
 004B2525    mov         esi,ecx
>004B2527    je          004B2542
 004B2529    mov         eax,dword ptr [ebx]
 004B252B    mov         dword ptr [eax+14],0C
 004B2532    mov         dword ptr [eax+18],3E
 004B2539    mov         dword ptr [eax+1C],edx
 004B253C    mov         eax,ebx
 004B253E    mov         edx,dword ptr [eax]
 004B2540    call        dword ptr [edx]
 004B2542    cmp         esi,174
>004B2548    je          004B2563
 004B254A    mov         eax,dword ptr [ebx]
 004B254C    mov         dword ptr [eax+14],15
 004B2553    mov         dword ptr [eax+18],174
 004B255A    mov         dword ptr [eax+1C],esi
 004B255D    mov         eax,ebx
 004B255F    mov         edx,dword ptr [eax]
 004B2561    call        dword ptr [edx]
 004B2563    mov         esi,dword ptr [ebx]
 004B2565    mov         edi,dword ptr [ebx+0C]
 004B2568    push        174
 004B256D    push        0
 004B256F    push        ebx
 004B2570    call        _memset
 004B2575    add         esp,0C
 004B2578    mov         dword ptr [ebx],esi
 004B257A    mov         dword ptr [ebx+0C],edi
 004B257D    xor         eax,eax
 004B257F    mov         dword ptr [ebx+10],eax
 004B2582    mov         eax,ebx
 004B2584    call        @jinit_memory_mgr
 004B2589    xor         edx,edx
 004B258B    xor         ecx,ecx
 004B258D    mov         dword ptr [ebx+8],edx
 004B2590    mov         dword ptr [ebx+18],ecx
 004B2593    xor         eax,eax
 004B2595    lea         edx,[ebx+44]
 004B2598    mov         dword ptr [ebx+40],eax
 004B259B    xor         eax,eax
 004B259D    xor         ecx,ecx
 004B259F    inc         eax
 004B25A0    mov         dword ptr [edx],ecx
 004B25A2    add         edx,4
 004B25A5    cmp         eax,4
>004B25A8    jl          004B259D
 004B25AA    xor         eax,eax
 004B25AC    lea         edx,[ebx+54]
 004B25AF    xor         ecx,ecx
 004B25B1    inc         eax
 004B25B2    mov         dword ptr [edx],ecx
 004B25B4    xor         ecx,ecx
 004B25B6    mov         dword ptr [edx+10],ecx
 004B25B9    add         edx,4
 004B25BC    cmp         eax,4
>004B25BF    jl          004B25AF
 004B25C1    xor         eax,eax
 004B25C3    xor         edx,edx
 004B25C5    mov         dword ptr [ebx+16C],eax
 004B25CB    mov         dword ptr [ebx+2C],edx
 004B25CE    mov         dword ptr [ebx+30],3FF00000
 004B25D5    mov         dword ptr [ebx+14],64
 004B25DC    pop         edi
 004B25DD    pop         esi
 004B25DE    pop         ebx
 004B25DF    ret
*}
end;

//004B25F0
procedure @jpeg_suppress_tables;
begin
{*
 004B25F0    push        ebx
 004B25F1    push        esi
 004B25F2    xor         ecx,ecx
 004B25F4    lea         ebx,[eax+44]
 004B25F7    mov         esi,dword ptr [ebx]
 004B25F9    test        esi,esi
>004B25FB    je          004B2603
 004B25FD    mov         dword ptr [esi+80],edx
 004B2603    inc         ecx
 004B2604    add         ebx,4
 004B2607    cmp         ecx,4
>004B260A    jl          004B25F7
 004B260C    xor         ecx,ecx
 004B260E    add         eax,54
 004B2611    mov         ebx,dword ptr [eax]
 004B2613    test        ebx,ebx
>004B2615    je          004B261D
 004B2617    mov         dword ptr [ebx+114],edx
 004B261D    mov         ebx,dword ptr [eax+10]
 004B2620    test        ebx,ebx
>004B2622    je          004B262A
 004B2624    mov         dword ptr [ebx+114],edx
 004B262A    inc         ecx
 004B262B    add         eax,4
 004B262E    cmp         ecx,4
>004B2631    jl          004B2611
 004B2633    pop         esi
 004B2634    pop         ebx
 004B2635    ret
*}
end;

//004B2638
procedure jpeg_finish_compress(var cinfo:jpeg_compress_struct);
begin
{*
 004B2638    push        ebx
 004B2639    mov         ebx,eax
 004B263B    push        esi
 004B263C    mov         eax,dword ptr [ebx+14]
 004B263F    cmp         eax,65
>004B2642    je          004B2649
 004B2644    cmp         eax,66
>004B2647    jne         004B2670
 004B2649    mov         edx,dword ptr [ebx+0DC]
 004B264F    cmp         edx,dword ptr [ebx+20]
>004B2652    jae         004B2663
 004B2654    mov         ecx,dword ptr [ebx]
 004B2656    mov         eax,ebx
 004B2658    mov         dword ptr [ecx+14],43
 004B265F    mov         edx,dword ptr [eax]
 004B2661    call        dword ptr [edx]
 004B2663    mov         eax,ebx
 004B2665    mov         edx,dword ptr [eax+148]
 004B266B    call        dword ptr [edx+8]
>004B266E    jmp         004B26E9
 004B2670    cmp         dword ptr [ebx+14],67
>004B2674    je          004B26E9
 004B2676    mov         eax,dword ptr [ebx]
 004B2678    mov         dword ptr [eax+14],14
 004B267F    mov         edx,dword ptr [ebx+14]
 004B2682    mov         dword ptr [eax+18],edx
 004B2685    mov         eax,ebx
 004B2687    mov         edx,dword ptr [eax]
 004B2689    call        dword ptr [edx]
>004B268B    jmp         004B26E9
 004B268D    mov         eax,ebx
 004B268F    mov         edx,dword ptr [eax+148]
 004B2695    call        dword ptr [edx]
 004B2697    xor         esi,esi
>004B2699    jmp         004B26D6
 004B269B    mov         eax,dword ptr [ebx+8]
 004B269E    test        eax,eax
>004B26A0    je          004B26B5
 004B26A2    mov         dword ptr [eax+4],esi
 004B26A5    mov         edx,dword ptr [ebx+0EC]
 004B26AB    mov         dword ptr [eax+8],edx
 004B26AE    mov         eax,ebx
 004B26B0    mov         edx,dword ptr [eax+8]
 004B26B3    call        dword ptr [edx]
 004B26B5    xor         edx,edx
 004B26B7    mov         eax,ebx
 004B26B9    mov         ecx,dword ptr [eax+154]
 004B26BF    call        dword ptr [ecx+4]
 004B26C2    test        eax,eax
>004B26C4    jne         004B26D5
 004B26C6    mov         eax,dword ptr [ebx]
 004B26C8    mov         dword ptr [eax+14],18
 004B26CF    mov         eax,ebx
 004B26D1    mov         edx,dword ptr [eax]
 004B26D3    call        dword ptr [edx]
 004B26D5    inc         esi
 004B26D6    cmp         esi,dword ptr [ebx+0EC]
>004B26DC    jb          004B269B
 004B26DE    mov         eax,ebx
 004B26E0    mov         edx,dword ptr [eax+148]
 004B26E6    call        dword ptr [edx+8]
 004B26E9    mov         ecx,dword ptr [ebx+148]
 004B26EF    cmp         dword ptr [ecx+10],0
>004B26F3    je          004B268D
 004B26F5    mov         eax,ebx
 004B26F7    mov         edx,dword ptr [eax+158]
 004B26FD    call        dword ptr [edx+0C]
 004B2700    mov         eax,ebx
 004B2702    mov         edx,dword ptr [eax+18]
 004B2705    call        dword ptr [edx+10]
 004B2708    mov         eax,ebx
 004B270A    call        @jpeg_abort
 004B270F    pop         esi
 004B2710    pop         ebx
 004B2711    ret
*}
end;

//004B282C
procedure @jinit_compress_master;
begin
{*
 004B282C    push        ebx
 004B282D    mov         ebx,eax
 004B282F    xor         edx,edx
 004B2831    mov         eax,ebx
 004B2833    call        @jinit_c_master_control
 004B2838    cmp         dword ptr [ebx+0AC],0
>004B283F    jne         004B2858
 004B2841    mov         eax,ebx
 004B2843    call        @jinit_color_converter
 004B2848    mov         eax,ebx
 004B284A    call        @jinit_downsampler
 004B284F    xor         edx,edx
 004B2851    mov         eax,ebx
 004B2853    call        @jinit_c_prep_controller
 004B2858    mov         eax,ebx
 004B285A    call        @jinit_forward_dct
 004B285F    cmp         dword ptr [ebx+0B0],0
>004B2866    je          004B2879
 004B2868    mov         edx,dword ptr [ebx]
 004B286A    mov         eax,ebx
 004B286C    mov         dword ptr [edx+14],1
 004B2873    mov         edx,dword ptr [eax]
 004B2875    call        dword ptr [edx]
>004B2877    jmp         004B2892
 004B2879    cmp         dword ptr [ebx+0E0],0
>004B2880    je          004B288B
 004B2882    mov         eax,ebx
 004B2884    call        @jinit_phuff_encoder
>004B2889    jmp         004B2892
 004B288B    mov         eax,ebx
 004B288D    call        @jinit_huff_encoder
 004B2892    cmp         dword ptr [ebx+0A4],1
>004B2899    jg          004B28A8
 004B289B    cmp         dword ptr [ebx+0B4],0
>004B28A2    jne         004B28A8
 004B28A4    xor         edx,edx
>004B28A6    jmp         004B28AD
 004B28A8    mov         edx,1
 004B28AD    mov         eax,ebx
 004B28AF    call        @jinit_c_coef_controller
 004B28B4    xor         edx,edx
 004B28B6    mov         eax,ebx
 004B28B8    call        @jinit_c_main_controller
 004B28BD    mov         eax,ebx
 004B28BF    call        @jinit_marker_writer
 004B28C4    mov         eax,ebx
 004B28C6    mov         edx,dword ptr [eax+4]
 004B28C9    call        dword ptr [edx+18]
 004B28CC    mov         eax,ebx
 004B28CE    mov         edx,dword ptr [eax+158]
 004B28D4    call        dword ptr [edx]
 004B28D6    pop         ebx
 004B28D7    ret
*}
end;

//004B28D8
procedure _DF_.;
begin
{*
 004B28D8    push        ebx
 004B28D9    mov         ebx,eax
 004B28DB    push        esi
 004B28DC    mov         eax,dword ptr [ebx+18]
 004B28DF    mov         ecx,dword ptr [eax]
 004B28E1    inc         dword ptr [eax]
 004B28E3    mov         byte ptr [ecx],dl
 004B28E5    dec         dword ptr [eax+4]
>004B28E8    jne         004B2904
 004B28EA    mov         esi,eax
 004B28EC    mov         eax,ebx
 004B28EE    call        dword ptr [esi+0C]
 004B28F1    test        eax,eax
>004B28F3    jne         004B2904
 004B28F5    mov         edx,dword ptr [ebx]
 004B28F7    mov         eax,ebx
 004B28F9    mov         dword ptr [edx+14],18
 004B2900    mov         edx,dword ptr [eax]
 004B2902    call        dword ptr [edx]
 004B2904    pop         esi
 004B2905    pop         ebx
 004B2906    ret
*}
end;

//004B30AC
procedure @jinit_marker_writer;
begin
{*
 004B30AC    push        ebx
 004B30AD    mov         ebx,eax
 004B30AF    mov         eax,ebx
 004B30B1    push        esi
 004B30B2    mov         ecx,20
 004B30B7    mov         edx,1
 004B30BC    mov         esi,dword ptr [eax+4]
 004B30BF    call        dword ptr [esi]
 004B30C1    mov         dword ptr [ebx+158],eax
 004B30C7    mov         dword ptr [eax],4B2E50
 004B30CD    mov         dword ptr [eax+4],4B2E90
 004B30D4    mov         dword ptr [eax+8],4B2F68
 004B30DB    mov         dword ptr [eax+0C],4B3028
 004B30E2    mov         dword ptr [eax+10],4B3034
 004B30E9    mov         dword ptr [eax+14],4B2E10
 004B30F0    mov         dword ptr [eax+18],4B2E48
 004B30F7    xor         edx,edx
 004B30F9    mov         dword ptr [eax+1C],edx
 004B30FC    pop         esi
 004B30FD    pop         ebx
 004B30FE    ret
*}
end;

//004B3100
procedure _DF_.;
begin
{*
 004B3100    push        ebx
 004B3101    mov         ebx,eax
 004B3103    push        esi
 004B3104    push        edi
 004B3105    cmp         dword ptr [ebx+20],0
>004B3109    jbe         004B311D
 004B310B    cmp         dword ptr [ebx+1C],0
>004B310F    jbe         004B311D
 004B3111    cmp         dword ptr [ebx+38],0
>004B3115    jle         004B311D
 004B3117    cmp         dword ptr [ebx+24],0
>004B311B    jg          004B312C
 004B311D    mov         eax,dword ptr [ebx]
 004B311F    mov         dword ptr [eax+14],20
 004B3126    mov         eax,ebx
 004B3128    mov         edx,dword ptr [eax]
 004B312A    call        dword ptr [edx]
 004B312C    cmp         dword ptr [ebx+20],0FFDC
>004B3133    jg          004B313E
 004B3135    cmp         dword ptr [ebx+1C],0FFDC
>004B313C    jle         004B3154
 004B313E    mov         eax,dword ptr [ebx]
 004B3140    mov         dword ptr [eax+14],29
 004B3147    mov         dword ptr [eax+18],0FFDC
 004B314E    mov         eax,ebx
 004B3150    mov         edx,dword ptr [eax]
 004B3152    call        dword ptr [edx]
 004B3154    mov         eax,dword ptr [ebx+1C]
 004B3157    imul        dword ptr [ebx+24]
 004B315A    mov         edx,eax
 004B315C    cmp         eax,edx
>004B315E    je          004B316F
 004B3160    mov         ecx,dword ptr [ebx]
 004B3162    mov         eax,ebx
 004B3164    mov         dword ptr [ecx+14],46
 004B316B    mov         edx,dword ptr [eax]
 004B316D    call        dword ptr [edx]
 004B316F    cmp         dword ptr [ebx+34],8
>004B3173    je          004B318A
 004B3175    mov         eax,dword ptr [ebx]
 004B3177    mov         dword ptr [eax+14],0F
 004B317E    mov         edx,dword ptr [ebx+34]
 004B3181    mov         dword ptr [eax+18],edx
 004B3184    mov         eax,ebx
 004B3186    mov         edx,dword ptr [eax]
 004B3188    call        dword ptr [edx]
 004B318A    cmp         dword ptr [ebx+38],0A
>004B318E    jle         004B31AC
 004B3190    mov         eax,dword ptr [ebx]
 004B3192    mov         dword ptr [eax+14],1A
 004B3199    mov         edx,dword ptr [ebx+38]
 004B319C    mov         dword ptr [eax+18],edx
 004B319F    mov         dword ptr [eax+1C],0A
 004B31A6    mov         eax,ebx
 004B31A8    mov         edx,dword ptr [eax]
 004B31AA    call        dword ptr [edx]
 004B31AC    mov         dword ptr [ebx+0E4],1
 004B31B6    mov         dword ptr [ebx+0E8],1
 004B31C0    xor         edi,edi
 004B31C2    mov         esi,dword ptr [ebx+40]
>004B31C5    jmp         004B322A
 004B31C7    mov         eax,dword ptr [esi+8]
 004B31CA    test        eax,eax
>004B31CC    jle         004B31DF
 004B31CE    cmp         eax,4
>004B31D1    jg          004B31DF
 004B31D3    cmp         dword ptr [esi+0C],0
>004B31D7    jle         004B31DF
 004B31D9    cmp         dword ptr [esi+0C],4
>004B31DD    jle         004B31EE
 004B31DF    mov         edx,dword ptr [ebx]
 004B31E1    mov         eax,ebx
 004B31E3    mov         dword ptr [edx+14],12
 004B31EA    mov         edx,dword ptr [eax]
 004B31EC    call        dword ptr [edx]
 004B31EE    mov         ecx,dword ptr [ebx+0E4]
 004B31F4    cmp         ecx,dword ptr [esi+8]
>004B31F7    jle         004B3201
 004B31F9    mov         eax,dword ptr [ebx+0E4]
>004B31FF    jmp         004B3204
 004B3201    mov         eax,dword ptr [esi+8]
 004B3204    mov         dword ptr [ebx+0E4],eax
 004B320A    mov         edx,dword ptr [ebx+0E8]
 004B3210    cmp         edx,dword ptr [esi+0C]
>004B3213    jle         004B321D
 004B3215    mov         ecx,dword ptr [ebx+0E8]
>004B321B    jmp         004B3220
 004B321D    mov         ecx,dword ptr [esi+0C]
 004B3220    mov         dword ptr [ebx+0E8],ecx
 004B3226    inc         edi
 004B3227    add         esi,54
 004B322A    cmp         edi,dword ptr [ebx+38]
>004B322D    jl          004B31C7
 004B322F    xor         edi,edi
 004B3231    mov         esi,dword ptr [ebx+40]
>004B3234    jmp         004B32A3
 004B3236    mov         dword ptr [esi+4],edi
 004B3239    mov         dword ptr [esi+24],8
 004B3240    mov         edx,dword ptr [ebx+0E4]
 004B3246    shl         edx,3
 004B3249    mov         eax,dword ptr [ebx+1C]
 004B324C    imul        eax,dword ptr [esi+8]
 004B3250    call        @jdiv_round_up
 004B3255    mov         dword ptr [esi+1C],eax
 004B3258    mov         edx,dword ptr [ebx+0E8]
 004B325E    shl         edx,3
 004B3261    mov         eax,dword ptr [ebx+20]
 004B3264    imul        eax,dword ptr [esi+0C]
 004B3268    call        @jdiv_round_up
 004B326D    mov         dword ptr [esi+20],eax
 004B3270    mov         eax,dword ptr [ebx+1C]
 004B3273    imul        dword ptr [esi+8]
 004B3276    mov         edx,dword ptr [ebx+0E4]
 004B327C    call        @jdiv_round_up
 004B3281    mov         dword ptr [esi+28],eax
 004B3284    mov         eax,dword ptr [ebx+20]
 004B3287    imul        dword ptr [esi+0C]
 004B328A    mov         edx,dword ptr [ebx+0E8]
 004B3290    call        @jdiv_round_up
 004B3295    mov         dword ptr [esi+2C],eax
 004B3298    inc         edi
 004B3299    mov         dword ptr [esi+30],1
 004B32A0    add         esi,54
 004B32A3    cmp         edi,dword ptr [ebx+38]
>004B32A6    jl          004B3236
 004B32A8    mov         edx,dword ptr [ebx+0E8]
 004B32AE    mov         eax,dword ptr [ebx+20]
 004B32B1    shl         edx,3
 004B32B4    call        @jdiv_round_up
 004B32B9    mov         dword ptr [ebx+0EC],eax
 004B32BF    pop         edi
 004B32C0    pop         esi
 004B32C1    pop         ebx
 004B32C2    ret
*}
end;

//004B32C4
{*procedure sub_004B32C4(?:?);
begin
 004B32C4    push        ebx
 004B32C5    push        esi
 004B32C6    push        edi
 004B32C7    mov         esi,eax
 004B32C9    push        ebp
 004B32CA    add         esp,0FFFFF5B8
 004B32D0    cmp         dword ptr [esi+0A4],0
>004B32D7    jg          004B32EF
 004B32D9    mov         eax,dword ptr [esi]
 004B32DB    xor         ecx,ecx
 004B32DD    mov         dword ptr [eax+14],13
 004B32E4    mov         edx,dword ptr [esi]
 004B32E6    mov         eax,esi
 004B32E8    mov         dword ptr [edx+18],ecx
 004B32EB    mov         edx,dword ptr [eax]
 004B32ED    call        dword ptr [edx]
 004B32EF    mov         ecx,dword ptr [esi+0A8]
 004B32F5    mov         dword ptr [esp],ecx
 004B32F8    mov         eax,dword ptr [esp]
 004B32FB    cmp         dword ptr [eax+14],0
>004B32FF    jne         004B330A
 004B3301    mov         edx,dword ptr [esp]
 004B3304    cmp         dword ptr [edx+18],3F
>004B3308    je          004B3340
 004B330A    mov         dword ptr [esi+0E0],1
 004B3314    lea         ebx,[esp+48]
 004B3318    xor         eax,eax
 004B331A    mov         dword ptr [esp+0C],eax
>004B331E    jmp         004B3335
 004B3320    xor         edi,edi
 004B3322    mov         dword ptr [ebx],0FFFFFFFF
 004B3328    add         ebx,4
 004B332B    inc         edi
 004B332C    cmp         edi,40
>004B332F    jl          004B3322
 004B3331    inc         dword ptr [esp+0C]
 004B3335    mov         eax,dword ptr [esp+0C]
 004B3339    cmp         eax,dword ptr [esi+38]
>004B333C    jl          004B3320
>004B333E    jmp         004B3368
 004B3340    xor         edx,edx
 004B3342    xor         ecx,ecx
 004B3344    mov         dword ptr [esi+0E0],edx
 004B334A    mov         dword ptr [esp+0C],ecx
 004B334E    lea         eax,[esp+20]
>004B3352    jmp         004B335F
 004B3354    xor         edx,edx
 004B3356    mov         dword ptr [eax],edx
 004B3358    inc         dword ptr [esp+0C]
 004B335C    add         eax,4
 004B335F    mov         ecx,dword ptr [esp+0C]
 004B3363    cmp         ecx,dword ptr [esi+38]
>004B3366    jl          004B3354
 004B3368    mov         dword ptr [esp+4],1
>004B3370    jmp         004B3623
 004B3375    mov         eax,dword ptr [esp]
 004B3378    mov         edx,dword ptr [eax]
 004B337A    mov         dword ptr [esp+8],edx
 004B337E    cmp         dword ptr [esp+8],0
>004B3383    jle         004B338C
 004B3385    cmp         dword ptr [esp+8],4
>004B338A    jle         004B33A9
 004B338C    mov         eax,dword ptr [esi]
 004B338E    mov         dword ptr [eax+14],1A
 004B3395    mov         edx,dword ptr [esp+8]
 004B3399    mov         dword ptr [eax+18],edx
 004B339C    mov         dword ptr [eax+1C],4
 004B33A3    mov         eax,esi
 004B33A5    mov         edx,dword ptr [eax]
 004B33A7    call        dword ptr [edx]
 004B33A9    xor         ecx,ecx
 004B33AB    mov         dword ptr [esp+0C],ecx
 004B33AF    mov         eax,dword ptr [esp]
 004B33B2    lea         edi,[eax+4]
 004B33B5    mov         eax,dword ptr [esp+0C]
 004B33B9    cmp         eax,dword ptr [esp+8]
>004B33BD    jge         004B3413
 004B33BF    mov         ebx,dword ptr [edi]
 004B33C1    test        ebx,ebx
>004B33C3    jl          004B33CA
 004B33C5    cmp         ebx,dword ptr [esi+38]
>004B33C8    jl          004B33E0
 004B33CA    mov         eax,dword ptr [esi]
 004B33CC    mov         dword ptr [eax+14],13
 004B33D3    mov         edx,dword ptr [esp+4]
 004B33D7    mov         dword ptr [eax+18],edx
 004B33DA    mov         eax,esi
 004B33DC    mov         edx,dword ptr [eax]
 004B33DE    call        dword ptr [edx]
 004B33E0    cmp         dword ptr [esp+0C],0
>004B33E5    jle         004B3402
 004B33E7    cmp         ebx,dword ptr [edi-4]
>004B33EA    jg          004B3402
 004B33EC    mov         eax,dword ptr [esi]
 004B33EE    mov         dword ptr [eax+14],13
 004B33F5    mov         edx,dword ptr [esp+4]
 004B33F9    mov         dword ptr [eax+18],edx
 004B33FC    mov         eax,esi
 004B33FE    mov         edx,dword ptr [eax]
 004B3400    call        dword ptr [edx]
 004B3402    inc         dword ptr [esp+0C]
 004B3406    add         edi,4
 004B3409    mov         ecx,dword ptr [esp+0C]
 004B340D    cmp         ecx,dword ptr [esp+8]
>004B3411    jl          004B33BF
 004B3413    mov         eax,dword ptr [esp]
 004B3416    mov         edx,dword ptr [eax+14]
 004B3419    mov         dword ptr [esp+10],edx
 004B341D    mov         ecx,dword ptr [esp]
 004B3420    mov         eax,dword ptr [ecx+18]
 004B3423    mov         dword ptr [esp+14],eax
 004B3427    mov         edx,dword ptr [esp]
 004B342A    mov         eax,dword ptr [esp]
 004B342D    mov         ebp,dword ptr [edx+1C]
 004B3430    mov         edx,dword ptr [eax+20]
 004B3433    mov         dword ptr [esp+18],edx
 004B3437    cmp         dword ptr [esi+0E0],0
>004B343E    je          004B359E
 004B3444    cmp         dword ptr [esp+10],0
>004B3449    jl          004B347A
 004B344B    cmp         dword ptr [esp+10],40
>004B3450    jge         004B347A
 004B3452    mov         ecx,dword ptr [esp+14]
 004B3456    cmp         ecx,dword ptr [esp+10]
>004B345A    jl          004B347A
 004B345C    cmp         dword ptr [esp+14],40
>004B3461    jge         004B347A
 004B3463    test        ebp,ebp
>004B3465    jl          004B347A
 004B3467    cmp         ebp,0A
>004B346A    jg          004B347A
 004B346C    cmp         dword ptr [esp+18],0
>004B3471    jl          004B347A
 004B3473    cmp         dword ptr [esp+18],0A
>004B3478    jle         004B3490
 004B347A    mov         eax,dword ptr [esi]
 004B347C    mov         dword ptr [eax+14],11
 004B3483    mov         edx,dword ptr [esp+4]
 004B3487    mov         dword ptr [eax+18],edx
 004B348A    mov         eax,esi
 004B348C    mov         edx,dword ptr [eax]
 004B348E    call        dword ptr [edx]
 004B3490    cmp         dword ptr [esp+10],0
>004B3495    jne         004B34B6
 004B3497    cmp         dword ptr [esp+14],0
>004B349C    je          004B34D3
 004B349E    mov         eax,dword ptr [esi]
 004B34A0    mov         dword ptr [eax+14],11
 004B34A7    mov         edx,dword ptr [esp+4]
 004B34AB    mov         dword ptr [eax+18],edx
 004B34AE    mov         eax,esi
 004B34B0    mov         edx,dword ptr [eax]
 004B34B2    call        dword ptr [edx]
>004B34B4    jmp         004B34D3
 004B34B6    cmp         dword ptr [esp+8],1
>004B34BB    je          004B34D3
 004B34BD    mov         eax,dword ptr [esi]
 004B34BF    mov         dword ptr [eax+14],11
 004B34C6    mov         edx,dword ptr [esp+4]
 004B34CA    mov         dword ptr [eax+18],edx
 004B34CD    mov         eax,esi
 004B34CF    mov         edx,dword ptr [eax]
 004B34D1    call        dword ptr [edx]
 004B34D3    xor         ecx,ecx
 004B34D5    mov         dword ptr [esp+0C],ecx
 004B34D9    mov         eax,dword ptr [esp]
 004B34DC    lea         edx,[eax+4]
 004B34DF    mov         dword ptr [esp+1C],edx
 004B34E3    mov         ecx,dword ptr [esp+0C]
 004B34E7    cmp         ecx,dword ptr [esp+8]
>004B34EB    jge         004B361B
 004B34F1    mov         eax,dword ptr [esp+1C]
 004B34F5    mov         ebx,dword ptr [eax]
 004B34F7    shl         ebx,8
 004B34FA    lea         eax,[esp+48]
 004B34FE    add         ebx,eax
 004B3500    cmp         dword ptr [esp+10],0
>004B3505    je          004B3522
 004B3507    cmp         dword ptr [ebx],0
>004B350A    jge         004B3522
 004B350C    mov         eax,dword ptr [esi]
 004B350E    mov         dword ptr [eax+14],11
 004B3515    mov         edx,dword ptr [esp+4]
 004B3519    mov         dword ptr [eax+18],edx
 004B351C    mov         eax,esi
 004B351E    mov         edx,dword ptr [eax]
 004B3520    call        dword ptr [edx]
 004B3522    mov         edi,dword ptr [esp+10]
 004B3526    cmp         edi,dword ptr [esp+14]
 004B352A    lea         eax,[ebx+edi*4]
 004B352D    mov         ebx,eax
>004B352F    jg          004B3585
 004B3531    cmp         dword ptr [ebx],0
>004B3534    jge         004B3552
 004B3536    test        ebp,ebp
>004B3538    je          004B3575
 004B353A    mov         eax,dword ptr [esi]
 004B353C    mov         dword ptr [eax+14],11
 004B3543    mov         edx,dword ptr [esp+4]
 004B3547    mov         dword ptr [eax+18],edx
 004B354A    mov         eax,esi
 004B354C    mov         edx,dword ptr [eax]
 004B354E    call        dword ptr [edx]
>004B3550    jmp         004B3575
 004B3552    cmp         ebp,dword ptr [ebx]
>004B3554    jne         004B355F
 004B3556    lea         ecx,[ebp-1]
 004B3559    cmp         ecx,dword ptr [esp+18]
>004B355D    je          004B3575
 004B355F    mov         eax,dword ptr [esi]
 004B3561    mov         dword ptr [eax+14],11
 004B3568    mov         edx,dword ptr [esp+4]
 004B356C    mov         dword ptr [eax+18],edx
 004B356F    mov         eax,esi
 004B3571    mov         edx,dword ptr [eax]
 004B3573    call        dword ptr [edx]
 004B3575    mov         ecx,dword ptr [esp+18]
 004B3579    inc         edi
 004B357A    mov         dword ptr [ebx],ecx
 004B357C    add         ebx,4
 004B357F    cmp         edi,dword ptr [esp+14]
>004B3583    jle         004B3531
 004B3585    inc         dword ptr [esp+0C]
 004B3589    add         dword ptr [esp+1C],4
 004B358E    mov         eax,dword ptr [esp+0C]
 004B3592    cmp         eax,dword ptr [esp+8]
>004B3596    jl          004B34F1
>004B359C    jmp         004B361B
 004B359E    cmp         dword ptr [esp+10],0
>004B35A3    jne         004B35B7
 004B35A5    cmp         dword ptr [esp+14],3F
>004B35AA    jne         004B35B7
 004B35AC    test        ebp,ebp
>004B35AE    jne         004B35B7
 004B35B0    cmp         dword ptr [esp+18],0
>004B35B5    je          004B35CD
 004B35B7    mov         eax,dword ptr [esi]
 004B35B9    mov         dword ptr [eax+14],11
 004B35C0    mov         edx,dword ptr [esp+4]
 004B35C4    mov         dword ptr [eax+18],edx
 004B35C7    mov         eax,esi
 004B35C9    mov         edx,dword ptr [eax]
 004B35CB    call        dword ptr [edx]
 004B35CD    xor         ecx,ecx
 004B35CF    mov         dword ptr [esp+0C],ecx
 004B35D3    mov         eax,dword ptr [esp]
 004B35D6    lea         edi,[eax+4]
 004B35D9    mov         eax,dword ptr [esp+0C]
 004B35DD    cmp         eax,dword ptr [esp+8]
>004B35E1    jge         004B361B
 004B35E3    mov         ebx,dword ptr [edi]
 004B35E5    cmp         dword ptr [esp+ebx*4+20],0
>004B35EA    je          004B3602
 004B35EC    mov         eax,dword ptr [esi]
 004B35EE    mov         dword ptr [eax+14],13
 004B35F5    mov         edx,dword ptr [esp+4]
 004B35F9    mov         dword ptr [eax+18],edx
 004B35FC    mov         eax,esi
 004B35FE    mov         edx,dword ptr [eax]
 004B3600    call        dword ptr [edx]
 004B3602    mov         dword ptr [esp+ebx*4+20],1
 004B360A    inc         dword ptr [esp+0C]
 004B360E    add         edi,4
 004B3611    mov         ecx,dword ptr [esp+0C]
 004B3615    cmp         ecx,dword ptr [esp+8]
>004B3619    jl          004B35E3
 004B361B    add         dword ptr [esp],24
 004B361F    inc         dword ptr [esp+4]
 004B3623    mov         eax,dword ptr [esp+4]
 004B3627    cmp         eax,dword ptr [esi+0A4]
>004B362D    jle         004B3375
 004B3633    cmp         dword ptr [esi+0E0],0
>004B363A    je          004B3671
 004B363C    xor         edx,edx
 004B363E    lea         ebx,[esp+48]
 004B3642    mov         dword ptr [esp+0C],edx
>004B3646    jmp         004B3666
 004B3648    cmp         dword ptr [ebx],0
>004B364B    jge         004B365C
 004B364D    mov         eax,dword ptr [esi]
 004B364F    mov         dword ptr [eax+14],2D
 004B3656    mov         eax,esi
 004B3658    mov         edx,dword ptr [eax]
 004B365A    call        dword ptr [edx]
 004B365C    inc         dword ptr [esp+0C]
 004B3660    add         ebx,100
 004B3666    mov         ecx,dword ptr [esp+0C]
 004B366A    cmp         ecx,dword ptr [esi+38]
>004B366D    jl          004B3648
>004B366F    jmp         004B36A1
 004B3671    xor         eax,eax
 004B3673    lea         ebx,[esp+20]
 004B3677    mov         dword ptr [esp+0C],eax
>004B367B    jmp         004B3698
 004B367D    cmp         dword ptr [ebx],0
>004B3680    jne         004B3691
 004B3682    mov         eax,dword ptr [esi]
 004B3684    mov         dword ptr [eax+14],2D
 004B368B    mov         eax,esi
 004B368D    mov         edx,dword ptr [eax]
 004B368F    call        dword ptr [edx]
 004B3691    inc         dword ptr [esp+0C]
 004B3695    add         ebx,4
 004B3698    mov         ecx,dword ptr [esp+0C]
 004B369C    cmp         ecx,dword ptr [esi+38]
>004B369F    jl          004B367D
 004B36A1    add         esp,0A48
 004B36A7    pop         ebp
 004B36A8    pop         edi
 004B36A9    pop         esi
 004B36AA    pop         ebx
 004B36AB    ret
end;*}

//004B3B68
procedure @jinit_c_master_control;
begin
{*
 004B3B68    push        ebx
 004B3B69    push        esi
 004B3B6A    mov         esi,eax
 004B3B6C    push        edi
 004B3B6D    mov         eax,esi
 004B3B6F    mov         edi,edx
 004B3B71    mov         edx,1
 004B3B76    mov         ecx,24
 004B3B7B    mov         ebx,dword ptr [eax+4]
 004B3B7E    call        dword ptr [ebx]
 004B3B80    mov         ebx,eax
 004B3B82    xor         eax,eax
 004B3B84    mov         dword ptr [esi+148],ebx
 004B3B8A    mov         dword ptr [ebx],4B3948
 004B3B90    mov         dword ptr [ebx+4],4B3AE4
 004B3B97    mov         dword ptr [ebx+8],4B3B0C
 004B3B9E    mov         dword ptr [ebx+10],eax
 004B3BA1    mov         eax,esi
 004B3BA3    call        _DF_.
 004B3BA8    cmp         dword ptr [esi+0A8],0
>004B3BAF    je          004B3BBA
 004B3BB1    mov         eax,esi
 004B3BB3    call        004B32C4
>004B3BB8    jmp         004B3BCC
 004B3BBA    xor         edx,edx
 004B3BBC    mov         dword ptr [esi+0E0],edx
 004B3BC2    mov         dword ptr [esi+0A4],1
 004B3BCC    cmp         dword ptr [esi+0E0],0
>004B3BD3    je          004B3BDF
 004B3BD5    mov         dword ptr [esi+0B4],1
 004B3BDF    test        edi,edi
>004B3BE1    je          004B3BFE
 004B3BE3    cmp         dword ptr [esi+0B4],0
>004B3BEA    je          004B3BF5
 004B3BEC    mov         dword ptr [ebx+14],1
>004B3BF3    jmp         004B3C03
 004B3BF5    mov         dword ptr [ebx+14],2
>004B3BFC    jmp         004B3C03
 004B3BFE    xor         ecx,ecx
 004B3C00    mov         dword ptr [ebx+14],ecx
 004B3C03    xor         eax,eax
 004B3C05    xor         edx,edx
 004B3C07    mov         dword ptr [ebx+20],eax
 004B3C0A    mov         dword ptr [ebx+18],edx
 004B3C0D    cmp         dword ptr [esi+0B4],0
>004B3C14    je          004B3C23
 004B3C16    mov         ecx,dword ptr [esi+0A4]
 004B3C1C    add         ecx,ecx
 004B3C1E    mov         dword ptr [ebx+1C],ecx
>004B3C21    jmp         004B3C2C
 004B3C23    mov         eax,dword ptr [esi+0A4]
 004B3C29    mov         dword ptr [ebx+1C],eax
 004B3C2C    pop         edi
 004B3C2D    pop         esi
 004B3C2E    pop         ebx
 004B3C2F    ret
*}
end;

//004B3C30
procedure _DF_.;
begin
{*
 004B3C30    push        ebx
 004B3C31    cmp         dword ptr [eax+0AC],0
 004B3C38    mov         ecx,dword ptr [eax+14C]
>004B3C3E    jne         004B3C6D
 004B3C40    xor         ebx,ebx
 004B3C42    mov         dword ptr [ecx+8],ebx
 004B3C45    xor         ebx,ebx
 004B3C47    mov         dword ptr [ecx+0C],ebx
 004B3C4A    xor         ebx,ebx
 004B3C4C    mov         dword ptr [ecx+10],ebx
 004B3C4F    mov         dword ptr [ecx+14],edx
 004B3C52    sub         edx,1
>004B3C55    jae         004B3C60
 004B3C57    mov         dword ptr [ecx+4],4B3C70
 004B3C5E    pop         ebx
 004B3C5F    ret
 004B3C60    mov         edx,dword ptr [eax]
 004B3C62    mov         dword ptr [edx+14],4
 004B3C69    mov         ecx,dword ptr [eax]
 004B3C6B    call        dword ptr [ecx]
 004B3C6D    pop         ebx
 004B3C6E    ret
*}
end;

//004B3D08
procedure @jinit_c_main_controller;
begin
{*
 004B3D08    push        ebx
 004B3D09    mov         ebx,eax
 004B3D0B    push        esi
 004B3D0C    push        edi
 004B3D0D    mov         eax,ebx
 004B3D0F    push        ebp
 004B3D10    push        ecx
 004B3D11    mov         esi,edx
 004B3D13    mov         edi,dword ptr [eax+4]
 004B3D16    mov         edx,1
 004B3D1B    mov         ecx,40
 004B3D20    call        dword ptr [edi]
 004B3D22    mov         dword ptr [ebx+14C],eax
 004B3D28    mov         dword ptr [eax],4B3C30;_DF_.
 004B3D2E    cmp         dword ptr [ebx+0AC],0
>004B3D35    jne         004B3D86
 004B3D37    test        esi,esi
>004B3D39    je          004B3D4C
 004B3D3B    mov         eax,dword ptr [ebx]
 004B3D3D    mov         dword ptr [eax+14],4
 004B3D44    mov         eax,ebx
 004B3D46    mov         edx,dword ptr [eax]
 004B3D48    call        dword ptr [edx]
>004B3D4A    jmp         004B3D86
 004B3D4C    xor         ecx,ecx
 004B3D4E    lea         edi,[eax+18]
 004B3D51    mov         dword ptr [esp],ecx
 004B3D54    mov         esi,dword ptr [ebx+40]
>004B3D57    jmp         004B3D7E
 004B3D59    mov         eax,dword ptr [esi+0C]
 004B3D5C    mov         edx,1
 004B3D61    shl         eax,3
 004B3D64    push        eax
 004B3D65    mov         eax,ebx
 004B3D67    mov         ecx,dword ptr [esi+1C]
 004B3D6A    shl         ecx,3
 004B3D6D    mov         ebp,dword ptr [eax+4]
 004B3D70    call        dword ptr [ebp+8]
 004B3D73    mov         dword ptr [edi],eax
 004B3D75    add         edi,4
 004B3D78    inc         dword ptr [esp]
 004B3D7B    add         esi,54
 004B3D7E    mov         eax,dword ptr [esp]
 004B3D81    cmp         eax,dword ptr [ebx+38]
>004B3D84    jl          004B3D59
 004B3D86    pop         edx
 004B3D87    pop         ebp
 004B3D88    pop         edi
 004B3D89    pop         esi
 004B3D8A    pop         ebx
 004B3D8B    ret
*}
end;

//004B3D8C
procedure _DF_.;
begin
{*
 004B3D8C    push        ebx
 004B3D8D    push        esi
 004B3D8E    mov         esi,eax
 004B3D90    test        edx,edx
 004B3D92    mov         ebx,dword ptr [esi+150]
>004B3D98    je          004B3DA9
 004B3D9A    mov         eax,dword ptr [esi]
 004B3D9C    mov         dword ptr [eax+14],4
 004B3DA3    mov         eax,esi
 004B3DA5    mov         edx,dword ptr [eax]
 004B3DA7    call        dword ptr [edx]
 004B3DA9    mov         ecx,dword ptr [esi+20]
 004B3DAC    xor         eax,eax
 004B3DAE    mov         dword ptr [ebx+30],ecx
 004B3DB1    xor         edx,edx
 004B3DB3    mov         dword ptr [ebx+34],eax
 004B3DB6    mov         dword ptr [ebx+38],edx
 004B3DB9    mov         ecx,dword ptr [esi+0E8]
 004B3DBF    add         ecx,ecx
 004B3DC1    mov         dword ptr [ebx+3C],ecx
 004B3DC4    pop         esi
 004B3DC5    pop         ebx
 004B3DC6    ret
*}
end;

//004B4108
{*function sub_004B4108(?:?):?;
begin
 004B4108    push        ebx
 004B4109    push        esi
 004B410A    push        edi
 004B410B    push        ebp
 004B410C    add         esp,0FFFFFFEC
 004B410F    mov         dword ptr [esp],eax
 004B4112    mov         eax,dword ptr [esp]
 004B4115    mov         esi,dword ptr [eax+150]
 004B411B    mov         eax,dword ptr [esp]
 004B411E    mov         ebx,dword ptr [eax+0E8]
 004B4124    mov         eax,dword ptr [esp]
 004B4127    mov         edx,dword ptr [eax+38]
 004B412A    mov         eax,dword ptr [esp]
 004B412D    imul        edx,ebx
 004B4130    mov         edi,dword ptr [eax+4]
 004B4133    lea         ecx,[edx+edx*4]
 004B4136    shl         ecx,2
 004B4139    mov         edx,1
 004B413E    call        dword ptr [edi]
 004B4140    mov         dword ptr [esp+0C],eax
 004B4144    xor         eax,eax
 004B4146    mov         dword ptr [esp+4],eax
 004B414A    mov         edx,dword ptr [esp]
 004B414D    mov         ecx,dword ptr [edx+40]
 004B4150    mov         dword ptr [esp+8],ecx
 004B4154    lea         eax,[esi+8]
 004B4157    mov         dword ptr [esp+10],eax
>004B415B    jmp         004B4207
 004B4160    lea         edx,[ebx+ebx*2]
 004B4163    push        edx
 004B4164    mov         ecx,dword ptr [esp+0C]
 004B4168    mov         edx,dword ptr [esp+4]
 004B416C    mov         eax,dword ptr [ecx+1C]
 004B416F    mov         ecx,dword ptr [esp+0C]
 004B4173    shl         eax,3
 004B4176    imul        dword ptr [edx+0E4]
 004B417C    cdq
 004B417D    idiv        eax,dword ptr [ecx+8]
 004B4180    mov         ecx,eax
 004B4182    mov         eax,dword ptr [esp+4]
 004B4186    mov         edx,1
 004B418B    mov         esi,dword ptr [eax+4]
 004B418E    call        dword ptr [esi+8]
 004B4191    mov         esi,eax
 004B4193    lea         eax,[ebx+ebx*2]
 004B4196    shl         eax,2
 004B4199    mov         edx,ebx
 004B419B    push        eax
 004B419C    push        esi
 004B419D    shl         edx,2
 004B41A0    add         edx,dword ptr [esp+14]
 004B41A4    push        edx
 004B41A5    call        _memcpy
 004B41AA    add         esp,0C
 004B41AD    xor         eax,eax
 004B41AF    cmp         ebx,eax
 004B41B1    mov         ecx,esi
 004B41B3    mov         edx,dword ptr [esp+0C]
>004B41B7    jle         004B41DE
 004B41B9    lea         edi,[eax+ebx*2]
 004B41BC    mov         edi,dword ptr [esi+edi*4]
 004B41BF    mov         dword ptr [edx],edi
 004B41C1    lea         edi,[eax+ebx*4]
 004B41C4    mov         ebp,dword ptr [esp+0C]
 004B41C8    inc         eax
 004B41C9    add         edx,4
 004B41CC    lea         edi,[ebp+edi*4]
 004B41D0    push        edi
 004B41D1    pop         ebp
 004B41D2    mov         edi,dword ptr [ecx]
 004B41D4    add         ecx,4
 004B41D7    cmp         ebx,eax
 004B41D9    mov         dword ptr [ebp],edi
>004B41DC    jg          004B41B9
 004B41DE    mov         eax,ebx
 004B41E0    mov         ecx,ebx
 004B41E2    shl         ecx,2
 004B41E5    mov         edx,dword ptr [esp+10]
 004B41E9    shl         eax,2
 004B41EC    add         eax,dword ptr [esp+0C]
 004B41F0    lea         ecx,[ecx+ecx*4]
 004B41F3    mov         dword ptr [edx],eax
 004B41F5    add         dword ptr [esp+0C],ecx
 004B41F9    add         dword ptr [esp+10],4
 004B41FE    inc         dword ptr [esp+4]
 004B4202    add         dword ptr [esp+8],54
 004B4207    mov         eax,dword ptr [esp]
 004B420A    mov         edx,dword ptr [eax+38]
 004B420D    cmp         edx,dword ptr [esp+4]
>004B4211    jg          004B4160
 004B4217    add         esp,14
 004B421A    pop         ebp
 004B421B    pop         edi
 004B421C    pop         esi
 004B421D    pop         ebx
 004B421E    ret
end;*}

//004B4220
procedure @jinit_c_prep_controller;
begin
{*
 004B4220    push        ebx
 004B4221    push        esi
 004B4222    push        edi
 004B4223    push        ebp
 004B4224    push        ecx
 004B4225    mov         ebx,eax
 004B4227    test        edx,edx
>004B4229    je          004B423A
 004B422B    mov         eax,dword ptr [ebx]
 004B422D    mov         dword ptr [eax+14],4
 004B4234    mov         eax,ebx
 004B4236    mov         edx,dword ptr [eax]
 004B4238    call        dword ptr [edx]
 004B423A    mov         eax,ebx
 004B423C    mov         ecx,40
 004B4241    mov         edx,1
 004B4246    mov         esi,dword ptr [eax+4]
 004B4249    call        dword ptr [esi]
 004B424B    mov         dword ptr [ebx+150],eax
 004B4251    mov         dword ptr [eax],4B3D8C;_DF_.
 004B4257    mov         edx,dword ptr [ebx+160]
 004B425D    cmp         dword ptr [edx+8],0
>004B4261    je          004B4273
 004B4263    mov         dword ptr [eax+4],4B3F60
 004B426A    mov         eax,ebx
 004B426C    call        004B4108
>004B4271    jmp         004B42C0
 004B4273    mov         dword ptr [eax+4],4B3E00
 004B427A    xor         ecx,ecx
 004B427C    lea         edi,[eax+8]
 004B427F    mov         dword ptr [esp],ecx
 004B4282    mov         esi,dword ptr [ebx+40]
>004B4285    jmp         004B42B8
 004B4287    mov         eax,dword ptr [ebx+0E8]
 004B428D    push        eax
 004B428E    mov         eax,dword ptr [esi+1C]
 004B4291    shl         eax,3
 004B4294    imul        dword ptr [ebx+0E4]
 004B429A    cdq
 004B429B    idiv        eax,dword ptr [esi+8]
 004B429E    mov         ecx,eax
 004B42A0    mov         eax,ebx
 004B42A2    mov         edx,1
 004B42A7    mov         ebp,dword ptr [eax+4]
 004B42AA    call        dword ptr [ebp+8]
 004B42AD    mov         dword ptr [edi],eax
 004B42AF    add         edi,4
 004B42B2    inc         dword ptr [esp]
 004B42B5    add         esi,54
 004B42B8    mov         eax,dword ptr [esp]
 004B42BB    cmp         eax,dword ptr [ebx+38]
>004B42BE    jl          004B4287
 004B42C0    pop         edx
 004B42C1    pop         ebp
 004B42C2    pop         edi
 004B42C3    pop         esi
 004B42C4    pop         ebx
 004B42C5    ret
*}
end;

//004B42C8
procedure _DF_.;
begin
{*
 004B42C8    cmp         dword ptr [eax+0F0],1
 004B42CF    mov         edx,dword ptr [eax+154]
>004B42D5    jle         004B42E0
 004B42D7    mov         dword ptr [edx+14],1
>004B42DE    jmp         004B4306
 004B42E0    mov         ecx,dword ptr [eax+0EC]
 004B42E6    dec         ecx
 004B42E7    cmp         ecx,dword ptr [edx+8]
>004B42EA    jbe         004B42FA
 004B42EC    mov         eax,dword ptr [eax+0F4]
 004B42F2    mov         eax,dword ptr [eax+0C]
 004B42F5    mov         dword ptr [edx+14],eax
>004B42F8    jmp         004B4306
 004B42FA    mov         ecx,dword ptr [eax+0F4]
 004B4300    mov         eax,dword ptr [ecx+48]
 004B4303    mov         dword ptr [edx+14],eax
 004B4306    xor         ecx,ecx
 004B4308    xor         eax,eax
 004B430A    mov         dword ptr [edx+0C],ecx
 004B430D    mov         dword ptr [edx+10],eax
 004B4310    ret
*}
end;

//004B4A04
procedure @jinit_c_coef_controller;
begin
{*
 004B4A04    push        ebx
 004B4A05    push        esi
 004B4A06    mov         esi,eax
 004B4A08    push        edi
 004B4A09    mov         eax,esi
 004B4A0B    push        ebp
 004B4A0C    mov         ebx,edx
 004B4A0E    mov         edx,1
 004B4A13    mov         edi,dword ptr [eax+4]
 004B4A16    add         esp,0FFFFFFF8
 004B4A19    mov         ecx,68
 004B4A1E    call        dword ptr [edi]
 004B4A20    mov         dword ptr [esp],eax
 004B4A23    test        ebx,ebx
 004B4A25    mov         eax,dword ptr [esp]
 004B4A28    mov         dword ptr [esi+154],eax
 004B4A2E    mov         edx,dword ptr [esp]
 004B4A31    mov         dword ptr [edx],4B4314
>004B4A37    je          004B4A8C
 004B4A39    xor         ecx,ecx
 004B4A3B    mov         dword ptr [esp+4],ecx
 004B4A3F    mov         ebx,dword ptr [esi+40]
 004B4A42    mov         eax,dword ptr [esp]
 004B4A45    lea         edi,[eax+40]
>004B4A48    jmp         004B4A81
 004B4A4A    mov         edx,dword ptr [ebx+8]
 004B4A4D    mov         eax,dword ptr [ebx+1C]
 004B4A50    call        @jround_up
 004B4A55    push        eax
 004B4A56    mov         edx,dword ptr [ebx+0C]
 004B4A59    mov         eax,dword ptr [ebx+20]
 004B4A5C    call        @jround_up
 004B4A61    push        eax
 004B4A62    mov         eax,esi
 004B4A64    mov         ecx,dword ptr [ebx+0C]
 004B4A67    mov         edx,1
 004B4A6C    push        ecx
 004B4A6D    xor         ecx,ecx
 004B4A6F    mov         ebp,dword ptr [eax+4]
 004B4A72    call        dword ptr [ebp+14]
 004B4A75    mov         dword ptr [edi],eax
 004B4A77    add         edi,4
 004B4A7A    inc         dword ptr [esp+4]
 004B4A7E    add         ebx,54
 004B4A81    mov         eax,dword ptr [esi+38]
 004B4A84    cmp         eax,dword ptr [esp+4]
>004B4A88    jg          004B4A4A
>004B4A8A    jmp         004B4AC2
 004B4A8C    mov         eax,esi
 004B4A8E    mov         ecx,500
 004B4A93    mov         edx,1
 004B4A98    mov         ebx,dword ptr [eax+4]
 004B4A9B    call        dword ptr [ebx+4]
 004B4A9E    mov         ecx,eax
 004B4AA0    xor         eax,eax
 004B4AA2    mov         edx,dword ptr [esp]
 004B4AA5    add         edx,18
 004B4AA8    mov         ebx,eax
 004B4AAA    inc         eax
 004B4AAB    shl         ebx,7
 004B4AAE    add         ebx,ecx
 004B4AB0    mov         dword ptr [edx],ebx
 004B4AB2    add         edx,4
 004B4AB5    cmp         eax,0A
>004B4AB8    jl          004B4AA8
 004B4ABA    mov         eax,dword ptr [esp]
 004B4ABD    xor         edx,edx
 004B4ABF    mov         dword ptr [eax+40],edx
 004B4AC2    pop         ecx
 004B4AC3    pop         edx
 004B4AC4    pop         ebp
 004B4AC5    pop         edi
 004B4AC6    pop         esi
 004B4AC7    pop         ebx
 004B4AC8    ret
*}
end;

//004B4ACC
procedure _DF_.;
begin
{*
 004B4ACC    push        ebx
 004B4ACD    mov         ebx,eax
 004B4ACF    mov         eax,ebx
 004B4AD1    push        esi
 004B4AD2    push        ecx
 004B4AD3    mov         ecx,2000
 004B4AD8    mov         esi,dword ptr [ebx+15C]
 004B4ADE    mov         ebx,dword ptr [eax+4]
 004B4AE1    mov         edx,1
 004B4AE6    call        dword ptr [ebx]
 004B4AE8    mov         dword ptr [esp],eax
 004B4AEB    mov         dword ptr [esi+8],eax
 004B4AEE    xor         edx,edx
 004B4AF0    mov         ecx,dword ptr [esp]
 004B4AF3    mov         eax,ecx
 004B4AF5    imul        ecx,edx,4C8B
 004B4AFB    mov         dword ptr [eax],ecx
 004B4AFD    imul        ecx,edx,9646
 004B4B03    mov         dword ptr [eax+400],ecx
 004B4B09    imul        ecx,edx,1D2F
 004B4B0F    add         ecx,8000
 004B4B15    mov         dword ptr [eax+800],ecx
 004B4B1B    imul        ecx,edx,0FFFFD4CD
 004B4B21    mov         dword ptr [eax+0C00],ecx
 004B4B27    imul        ecx,edx,0FFFFAB33
 004B4B2D    mov         dword ptr [eax+1000],ecx
 004B4B33    mov         ecx,edx
 004B4B35    shl         ecx,0F
 004B4B38    add         ecx,807FFF
 004B4B3E    mov         dword ptr [eax+1400],ecx
 004B4B44    imul        ecx,edx,0FFFF94D1
 004B4B4A    mov         dword ptr [eax+1800],ecx
 004B4B50    imul        ecx,edx,0FFFFEB2F
 004B4B56    mov         dword ptr [eax+1C00],ecx
 004B4B5C    inc         edx
 004B4B5D    add         eax,4
 004B4B60    cmp         edx,0FF
>004B4B66    jle         004B4AF5
 004B4B68    pop         edx
 004B4B69    pop         esi
 004B4B6A    pop         ebx
 004B4B6B    ret
*}
end;

//004B4F08
procedure @jinit_color_converter;
begin
{*
 004B4F08    push        ebx
 004B4F09    mov         ebx,eax
 004B4F0B    mov         eax,ebx
 004B4F0D    push        esi
 004B4F0E    mov         ecx,0C
 004B4F13    mov         edx,1
 004B4F18    mov         esi,dword ptr [eax+4]
 004B4F1B    call        dword ptr [esi]
 004B4F1D    mov         esi,eax
 004B4F1F    mov         dword ptr [ebx+15C],esi
 004B4F25    mov         dword ptr [esi],4B4F04
 004B4F2B    mov         eax,dword ptr [ebx+28]
 004B4F2E    dec         eax
>004B4F2F    je          004B4F3E
 004B4F31    dec         eax
 004B4F32    sub         eax,2
>004B4F35    jb          004B4F55
 004B4F37    sub         eax,2
>004B4F3A    jb          004B4F6C
>004B4F3C    jmp         004B4F83
 004B4F3E    cmp         dword ptr [ebx+24],1
>004B4F42    je          004B4F98
 004B4F44    mov         edx,dword ptr [ebx]
 004B4F46    mov         eax,ebx
 004B4F48    mov         dword ptr [edx+14],9
 004B4F4F    mov         edx,dword ptr [eax]
 004B4F51    call        dword ptr [edx]
>004B4F53    jmp         004B4F98
 004B4F55    cmp         dword ptr [ebx+24],3
>004B4F59    je          004B4F98
 004B4F5B    mov         ecx,dword ptr [ebx]
 004B4F5D    mov         eax,ebx
 004B4F5F    mov         dword ptr [ecx+14],9
 004B4F66    mov         edx,dword ptr [eax]
 004B4F68    call        dword ptr [edx]
>004B4F6A    jmp         004B4F98
 004B4F6C    cmp         dword ptr [ebx+24],4
>004B4F70    je          004B4F98
 004B4F72    mov         ecx,dword ptr [ebx]
 004B4F74    mov         eax,ebx
 004B4F76    mov         dword ptr [ecx+14],9
 004B4F7D    mov         edx,dword ptr [eax]
 004B4F7F    call        dword ptr [edx]
>004B4F81    jmp         004B4F98
 004B4F83    cmp         dword ptr [ebx+24],1
>004B4F87    jge         004B4F98
 004B4F89    mov         ecx,dword ptr [ebx]
 004B4F8B    mov         eax,ebx
 004B4F8D    mov         dword ptr [ecx+14],9
 004B4F94    mov         edx,dword ptr [eax]
 004B4F96    call        dword ptr [edx]
 004B4F98    mov         ecx,dword ptr [ebx+3C]
 004B4F9B    cmp         ecx,5
>004B4F9E    ja          004B5128
 004B4FA4    jmp         dword ptr [ecx*4+4B4FAB]
 004B4FA4    dd          004B5128
 004B4FA4    dd          004B4FC3
 004B4FA4    dd          004B5020
 004B4FA4    dd          004B5057
 004B4FA4    dd          004B50A4
 004B4FA4    dd          004B50DB
 004B4FC3    cmp         dword ptr [ebx+38],1
>004B4FC7    je          004B4FD8
 004B4FC9    mov         eax,dword ptr [ebx]
 004B4FCB    mov         dword ptr [eax+14],0A
 004B4FD2    mov         eax,ebx
 004B4FD4    mov         edx,dword ptr [eax]
 004B4FD6    call        dword ptr [edx]
 004B4FD8    cmp         dword ptr [ebx+28],1
>004B4FDC    jne         004B4FE8
 004B4FDE    mov         dword ptr [esi+4],4B4E44
 004B4FE5    pop         esi
 004B4FE6    pop         ebx
 004B4FE7    ret
 004B4FE8    cmp         dword ptr [ebx+28],2
>004B4FEC    jne         004B4FFE
 004B4FEE    mov         dword ptr [esi],4B4ACC;_DF_.
 004B4FF4    mov         dword ptr [esi+4],4B4C74
 004B4FFB    pop         esi
 004B4FFC    pop         ebx
 004B4FFD    ret
 004B4FFE    cmp         dword ptr [ebx+28],3
>004B5002    jne         004B500E
 004B5004    mov         dword ptr [esi+4],4B4E44
 004B500B    pop         esi
 004B500C    pop         ebx
 004B500D    ret
 004B500E    mov         ecx,dword ptr [ebx]
 004B5010    mov         eax,ebx
 004B5012    mov         dword ptr [ecx+14],1B
 004B5019    mov         edx,dword ptr [eax]
 004B501B    call        dword ptr [edx]
 004B501D    pop         esi
 004B501E    pop         ebx
 004B501F    ret
 004B5020    cmp         dword ptr [ebx+38],3
>004B5024    je          004B5035
 004B5026    mov         ecx,dword ptr [ebx]
 004B5028    mov         eax,ebx
 004B502A    mov         dword ptr [ecx+14],0A
 004B5031    mov         edx,dword ptr [eax]
 004B5033    call        dword ptr [edx]
 004B5035    cmp         dword ptr [ebx+28],2
>004B5039    jne         004B5045
 004B503B    mov         dword ptr [esi+4],4B4E90
 004B5042    pop         esi
 004B5043    pop         ebx
 004B5044    ret
 004B5045    mov         ecx,dword ptr [ebx]
 004B5047    mov         eax,ebx
 004B5049    mov         dword ptr [ecx+14],1B
 004B5050    mov         edx,dword ptr [eax]
 004B5052    call        dword ptr [edx]
 004B5054    pop         esi
 004B5055    pop         ebx
 004B5056    ret
 004B5057    cmp         dword ptr [ebx+38],3
>004B505B    je          004B506C
 004B505D    mov         ecx,dword ptr [ebx]
 004B505F    mov         eax,ebx
 004B5061    mov         dword ptr [ecx+14],0A
 004B5068    mov         edx,dword ptr [eax]
 004B506A    call        dword ptr [edx]
 004B506C    cmp         dword ptr [ebx+28],2
>004B5070    jne         004B5082
 004B5072    mov         dword ptr [esi],4B4ACC;_DF_.
 004B5078    mov         dword ptr [esi+4],4B4B6C
 004B507F    pop         esi
 004B5080    pop         ebx
 004B5081    ret
 004B5082    cmp         dword ptr [ebx+28],3
>004B5086    jne         004B5092
 004B5088    mov         dword ptr [esi+4],4B4E90
 004B508F    pop         esi
 004B5090    pop         ebx
 004B5091    ret
 004B5092    mov         ecx,dword ptr [ebx]
 004B5094    mov         eax,ebx
 004B5096    mov         dword ptr [ecx+14],1B
 004B509D    mov         edx,dword ptr [eax]
 004B509F    call        dword ptr [edx]
 004B50A1    pop         esi
 004B50A2    pop         ebx
 004B50A3    ret
 004B50A4    cmp         dword ptr [ebx+38],4
>004B50A8    je          004B50B9
 004B50AA    mov         ecx,dword ptr [ebx]
 004B50AC    mov         eax,ebx
 004B50AE    mov         dword ptr [ecx+14],0A
 004B50B5    mov         edx,dword ptr [eax]
 004B50B7    call        dword ptr [edx]
 004B50B9    cmp         dword ptr [ebx+28],4
>004B50BD    jne         004B50C9
 004B50BF    mov         dword ptr [esi+4],4B4E90
 004B50C6    pop         esi
 004B50C7    pop         ebx
 004B50C8    ret
 004B50C9    mov         ecx,dword ptr [ebx]
 004B50CB    mov         eax,ebx
 004B50CD    mov         dword ptr [ecx+14],1B
 004B50D4    mov         edx,dword ptr [eax]
 004B50D6    call        dword ptr [edx]
 004B50D8    pop         esi
 004B50D9    pop         ebx
 004B50DA    ret
 004B50DB    cmp         dword ptr [ebx+38],4
>004B50DF    je          004B50F0
 004B50E1    mov         ecx,dword ptr [ebx]
 004B50E3    mov         eax,ebx
 004B50E5    mov         dword ptr [ecx+14],0A
 004B50EC    mov         edx,dword ptr [eax]
 004B50EE    call        dword ptr [edx]
 004B50F0    cmp         dword ptr [ebx+28],4
>004B50F4    jne         004B5106
 004B50F6    mov         dword ptr [esi],4B4ACC;_DF_.
 004B50FC    mov         dword ptr [esi+4],4B4D00
 004B5103    pop         esi
 004B5104    pop         ebx
 004B5105    ret
 004B5106    cmp         dword ptr [ebx+28],5
>004B510A    jne         004B5116
 004B510C    mov         dword ptr [esi+4],4B4E90
 004B5113    pop         esi
 004B5114    pop         ebx
 004B5115    ret
 004B5116    mov         ecx,dword ptr [ebx]
 004B5118    mov         eax,ebx
 004B511A    mov         dword ptr [ecx+14],1B
 004B5121    mov         edx,dword ptr [eax]
 004B5123    call        dword ptr [edx]
 004B5125    pop         esi
 004B5126    pop         ebx
 004B5127    ret
 004B5128    mov         ecx,dword ptr [ebx+3C]
 004B512B    cmp         ecx,dword ptr [ebx+28]
>004B512E    jne         004B5138
 004B5130    mov         eax,dword ptr [ebx+38]
 004B5133    cmp         eax,dword ptr [ebx+24]
>004B5136    je          004B5147
 004B5138    mov         edx,dword ptr [ebx]
 004B513A    mov         eax,ebx
 004B513C    mov         dword ptr [edx+14],1B
 004B5143    mov         edx,dword ptr [eax]
 004B5145    call        dword ptr [edx]
 004B5147    mov         dword ptr [esi+4],4B4E90
 004B514E    pop         esi
 004B514F    pop         ebx
 004B5150    ret
*}
end;

//004B5154
procedure _DF_.;
begin
{*
 004B5154    ret
*}
end;

//004B58F4
procedure @jinit_downsampler;
begin
{*
 004B58F4    push        ebx
 004B58F5    push        esi
 004B58F6    push        edi
 004B58F7    push        ebp
 004B58F8    add         esp,0FFFFFFF8
 004B58FB    mov         ebx,eax
 004B58FD    mov         eax,ebx
 004B58FF    mov         ecx,34
 004B5904    mov         dword ptr [esp+4],1
 004B590C    mov         esi,dword ptr [eax+4]
 004B590F    mov         edx,1
 004B5914    call        dword ptr [esi]
 004B5916    mov         dword ptr [esp],eax
 004B5919    mov         eax,dword ptr [esp]
 004B591C    mov         dword ptr [ebx+160],eax
 004B5922    mov         edx,dword ptr [esp]
 004B5925    mov         dword ptr [edx],4B5154;_DF_.
 004B592B    mov         ecx,dword ptr [esp]
 004B592E    mov         dword ptr [ecx+4],4B51A8
 004B5935    mov         eax,dword ptr [esp]
 004B5938    xor         edx,edx
 004B593A    mov         dword ptr [eax+8],edx
 004B593D    cmp         dword ptr [ebx+0B8],0
>004B5944    je          004B5955
 004B5946    mov         ecx,dword ptr [ebx]
 004B5948    mov         eax,ebx
 004B594A    mov         dword ptr [ecx+14],19
 004B5951    mov         edx,dword ptr [eax]
 004B5953    call        dword ptr [edx]
 004B5955    xor         ebp,ebp
 004B5957    mov         esi,dword ptr [ebx+40]
 004B595A    mov         eax,dword ptr [esp]
 004B595D    lea         edi,[eax+0C]
>004B5960    jmp         004B5A47
 004B5965    mov         eax,dword ptr [esi+8]
 004B5968    cmp         eax,dword ptr [ebx+0E4]
>004B596E    jne         004B59A4
 004B5970    mov         edx,dword ptr [esi+0C]
 004B5973    cmp         edx,dword ptr [ebx+0E8]
>004B5979    jne         004B59A4
 004B597B    cmp         dword ptr [ebx+0BC],0
>004B5982    je          004B5999
 004B5984    mov         dword ptr [edi],4B5764
 004B598A    mov         ecx,dword ptr [esp]
 004B598D    mov         dword ptr [ecx+8],1
>004B5994    jmp         004B5A40
 004B5999    mov         dword ptr [edi],4B533C
>004B599F    jmp         004B5A40
 004B59A4    mov         eax,dword ptr [esi+8]
 004B59A7    add         eax,eax
 004B59A9    cmp         eax,dword ptr [ebx+0E4]
>004B59AF    jne         004B59CA
 004B59B1    mov         edx,dword ptr [esi+0C]
 004B59B4    cmp         edx,dword ptr [ebx+0E8]
>004B59BA    jne         004B59CA
 004B59BC    xor         ecx,ecx
 004B59BE    mov         dword ptr [esp+4],ecx
 004B59C2    mov         dword ptr [edi],4B5388
>004B59C8    jmp         004B5A40
 004B59CA    mov         eax,dword ptr [esi+8]
 004B59CD    add         eax,eax
 004B59CF    cmp         eax,dword ptr [ebx+0E4]
>004B59D5    jne         004B5A07
 004B59D7    mov         edx,dword ptr [esi+0C]
 004B59DA    add         edx,edx
 004B59DC    cmp         edx,dword ptr [ebx+0E8]
>004B59E2    jne         004B5A07
 004B59E4    cmp         dword ptr [ebx+0BC],0
>004B59EB    je          004B59FF
 004B59ED    mov         dword ptr [edi],4B54D4
 004B59F3    mov         ecx,dword ptr [esp]
 004B59F6    mov         dword ptr [ecx+8],1
>004B59FD    jmp         004B5A40
 004B59FF    mov         dword ptr [edi],4B541C
>004B5A05    jmp         004B5A40
 004B5A07    mov         eax,dword ptr [ebx+0E4]
 004B5A0D    cdq
 004B5A0E    idiv        eax,dword ptr [esi+8]
 004B5A11    test        edx,edx
>004B5A13    jne         004B5A31
 004B5A15    mov         eax,dword ptr [ebx+0E8]
 004B5A1B    cdq
 004B5A1C    idiv        eax,dword ptr [esi+0C]
 004B5A1F    test        edx,edx
>004B5A21    jne         004B5A31
 004B5A23    xor         ecx,ecx
 004B5A25    mov         dword ptr [esp+4],ecx
 004B5A29    mov         dword ptr [edi],4B522C
>004B5A2F    jmp         004B5A40
 004B5A31    mov         eax,dword ptr [ebx]
 004B5A33    mov         dword ptr [eax+14],26
 004B5A3A    mov         eax,ebx
 004B5A3C    mov         edx,dword ptr [eax]
 004B5A3E    call        dword ptr [edx]
 004B5A40    add         edi,4
 004B5A43    inc         ebp
 004B5A44    add         esi,54
 004B5A47    cmp         ebp,dword ptr [ebx+38]
>004B5A4A    jl          004B5965
 004B5A50    cmp         dword ptr [ebx+0BC],0
>004B5A57    je          004B5A72
 004B5A59    cmp         dword ptr [esp+4],0
>004B5A5E    jne         004B5A72
 004B5A60    mov         ecx,dword ptr [ebx]
 004B5A62    mov         eax,ebx
 004B5A64    xor         edx,edx
 004B5A66    mov         dword ptr [ecx+14],63
 004B5A6D    mov         ecx,dword ptr [eax]
 004B5A6F    call        dword ptr [ecx+4]
 004B5A72    pop         ecx
 004B5A73    pop         edx
 004B5A74    pop         ebp
 004B5A75    pop         edi
 004B5A76    pop         esi
 004B5A77    pop         ebx
 004B5A78    ret
*}
end;

//004B5A7C
procedure _DF_.;
begin
{*
 004B5A7C    push        ebx
 004B5A7D    push        esi
 004B5A7E    push        edi
 004B5A7F    add         esp,0FFFFFFD8
 004B5A82    xor         ecx,ecx
 004B5A84    mov         dword ptr [esp],eax
 004B5A87    mov         eax,dword ptr [esp]
 004B5A8A    mov         edx,dword ptr [eax+164]
 004B5A90    mov         dword ptr [esp+4],edx
 004B5A94    mov         dword ptr [esp+8],ecx
 004B5A98    mov         eax,dword ptr [esp]
 004B5A9B    mov         edx,dword ptr [eax+40]
 004B5A9E    mov         dword ptr [esp+0C],edx
>004B5AA2    jmp         004B5C15
 004B5AA7    mov         ecx,dword ptr [esp+0C]
 004B5AAB    mov         ebx,dword ptr [ecx+10]
 004B5AAE    test        ebx,ebx
>004B5AB0    jl          004B5AC1
 004B5AB2    cmp         ebx,4
>004B5AB5    jge         004B5AC1
 004B5AB7    mov         eax,dword ptr [esp]
 004B5ABA    cmp         dword ptr [eax+ebx*4+44],0
>004B5ABF    jne         004B5AD7
 004B5AC1    mov         edx,dword ptr [esp]
 004B5AC4    mov         eax,dword ptr [edx]
 004B5AC6    mov         dword ptr [eax+14],34
 004B5ACD    mov         dword ptr [eax+18],ebx
 004B5AD0    mov         eax,dword ptr [esp]
 004B5AD3    mov         edx,dword ptr [eax]
 004B5AD5    call        dword ptr [edx]
 004B5AD7    mov         ecx,dword ptr [esp]
 004B5ADA    mov         eax,dword ptr [ecx+ebx*4+44]
 004B5ADE    mov         dword ptr [esp+10],eax
 004B5AE2    mov         edx,dword ptr [esp]
 004B5AE5    mov         ecx,dword ptr [edx+0C0]
 004B5AEB    dec         ecx
>004B5AEC    je          004B5AF6
 004B5AEE    dec         ecx
>004B5AEF    je          004B5B58
>004B5AF1    jmp         004B5BF9
 004B5AF6    mov         eax,dword ptr [esp+4]
 004B5AFA    cmp         dword ptr [eax+ebx*4+0C],0
>004B5AFF    jne         004B5B1B
 004B5B01    mov         eax,dword ptr [esp]
 004B5B04    mov         ecx,100
 004B5B09    mov         edx,1
 004B5B0E    mov         esi,dword ptr [eax+4]
 004B5B11    call        dword ptr [esi]
 004B5B13    mov         edx,dword ptr [esp+4]
 004B5B17    mov         dword ptr [edx+ebx*4+0C],eax
 004B5B1B    mov         eax,dword ptr [esp+4]
 004B5B1F    xor         esi,esi
 004B5B21    mov         edx,5AE004
 004B5B26    mov         eax,dword ptr [eax+ebx*4+0C]
 004B5B2A    mov         ecx,eax
 004B5B2C    mov         eax,dword ptr [esp+10]
 004B5B30    movsx       edi,word ptr [edx]
 004B5B33    movzx       ebx,word ptr [eax]
 004B5B36    imul        ebx,edi
 004B5B39    add         ebx,400
 004B5B3F    add         eax,2
 004B5B42    sar         ebx,0B
 004B5B45    add         edx,2
 004B5B48    mov         dword ptr [ecx],ebx
 004B5B4A    add         ecx,4
 004B5B4D    inc         esi
 004B5B4E    cmp         esi,40
>004B5B51    jl          004B5B30
>004B5B53    jmp         004B5C0C
 004B5B58    mov         eax,dword ptr [esp+4]
 004B5B5C    cmp         dword ptr [eax+ebx*4+20],0
>004B5B61    jne         004B5B7D
 004B5B63    mov         eax,dword ptr [esp]
 004B5B66    mov         ecx,100
 004B5B6B    mov         edx,1
 004B5B70    mov         esi,dword ptr [eax+4]
 004B5B73    call        dword ptr [esi]
 004B5B75    mov         edx,dword ptr [esp+4]
 004B5B79    mov         dword ptr [edx+ebx*4+20],eax
 004B5B7D    mov         eax,dword ptr [esp+4]
 004B5B81    xor         esi,esi
 004B5B83    mov         ecx,dword ptr [eax+ebx*4+20]
 004B5B87    xor         eax,eax
 004B5B89    mov         dword ptr [esp+14],ecx
 004B5B8D    mov         dword ptr [esp+18],eax
 004B5B91    mov         dword ptr [esp+20],5AE084
 004B5B99    xor         ebx,ebx
 004B5B9B    mov         eax,dword ptr [esp+14]
 004B5B9F    lea         ecx,[eax+esi*4]
 004B5BA2    mov         edx,5AE084
 004B5BA7    mov         eax,dword ptr [esp+20]
 004B5BAB    mov         dword ptr [esp+1C],eax
 004B5BAF    mov         eax,dword ptr [esp+10]
 004B5BB3    lea         eax,[eax+esi*2]
 004B5BB6    movzx       edi,word ptr [eax]
 004B5BB9    mov         dword ptr [esp+24],edi
 004B5BBD    fild        dword ptr [esp+24]
 004B5BC1    mov         edi,dword ptr [esp+1C]
 004B5BC5    fmul        qword ptr [edi]
 004B5BC7    fmul        qword ptr [edx]
 004B5BC9    fmul        dword ptr ds:[4B5C2C]
 004B5BCF    fdivr       dword ptr ds:[4B5C30]
 004B5BD5    fstp        dword ptr [ecx]
 004B5BD7    inc         esi
 004B5BD8    add         ecx,4
 004B5BDB    add         eax,2
 004B5BDE    inc         ebx
 004B5BDF    add         edx,8
 004B5BE2    cmp         ebx,8
>004B5BE5    jl          004B5BB6
 004B5BE7    inc         dword ptr [esp+18]
 004B5BEB    add         dword ptr [esp+20],8
 004B5BF0    cmp         dword ptr [esp+18],8
>004B5BF5    jl          004B5B99
>004B5BF7    jmp         004B5C0C
 004B5BF9    mov         eax,dword ptr [esp]
 004B5BFC    mov         edx,dword ptr [eax]
 004B5BFE    mov         dword ptr [edx+14],30
 004B5C05    mov         eax,dword ptr [esp]
 004B5C08    mov         edx,dword ptr [eax]
 004B5C0A    call        dword ptr [edx]
 004B5C0C    inc         dword ptr [esp+8]
 004B5C10    add         dword ptr [esp+0C],54
 004B5C15    mov         ecx,dword ptr [esp]
 004B5C18    mov         eax,dword ptr [ecx+38]
 004B5C1B    cmp         eax,dword ptr [esp+8]
>004B5C1F    jg          004B5AA7
 004B5C25    add         esp,28
 004B5C28    pop         edi
 004B5C29    pop         esi
 004B5C2A    pop         ebx
 004B5C2B    ret
*}
end;

//004B5F18
procedure @jinit_forward_dct;
begin
{*
 004B5F18    push        ebx
 004B5F19    push        esi
 004B5F1A    mov         esi,eax
 004B5F1C    mov         ecx,30
 004B5F21    mov         edx,1
 004B5F26    mov         eax,esi
 004B5F28    mov         ebx,dword ptr [eax+4]
 004B5F2B    call        dword ptr [ebx]
 004B5F2D    mov         ebx,eax
 004B5F2F    mov         dword ptr [esi+164],ebx
 004B5F35    mov         dword ptr [ebx],4B5A7C;_DF_.
 004B5F3B    mov         eax,dword ptr [esi+0C0]
 004B5F41    dec         eax
>004B5F42    je          004B5F49
 004B5F44    dec         eax
>004B5F45    je          004B5F59
>004B5F47    jmp         004B5F69
 004B5F49    mov         dword ptr [ebx+4],4B5C34
 004B5F50    mov         dword ptr [ebx+8],4B6A68;@jpeg_fdct_ifast
>004B5F57    jmp         004B5F78
 004B5F59    mov         dword ptr [ebx+4],4B5D88
 004B5F60    mov         dword ptr [ebx+1C],4B6CD4;@jpeg_fdct_float
>004B5F67    jmp         004B5F78
 004B5F69    mov         edx,dword ptr [esi]
 004B5F6B    mov         eax,esi
 004B5F6D    mov         dword ptr [edx+14],30
 004B5F74    mov         edx,dword ptr [eax]
 004B5F76    call        dword ptr [edx]
 004B5F78    xor         edx,edx
 004B5F7A    lea         eax,[ebx+0C]
 004B5F7D    xor         ecx,ecx
 004B5F7F    inc         edx
 004B5F80    mov         dword ptr [eax],ecx
 004B5F82    xor         ecx,ecx
 004B5F84    mov         dword ptr [eax+14],ecx
 004B5F87    add         eax,4
 004B5F8A    cmp         edx,4
>004B5F8D    jl          004B5F7D
 004B5F8F    pop         esi
 004B5F90    pop         ebx
 004B5F91    ret
*}
end;

//004B5F94
procedure _DF_.;
begin
{*
 004B5F94    push        ebx
 004B5F95    push        esi
 004B5F96    push        edi
 004B5F97    push        ebp
 004B5F98    add         esp,0FFFFFFEC
 004B5F9B    mov         edi,eax
 004B5F9D    mov         dword ptr [esp],edx
 004B5FA0    mov         ebx,dword ptr [edi+168]
 004B5FA6    mov         dword ptr [ebx+20],edi
 004B5FA9    mov         eax,dword ptr [esp]
 004B5FAC    mov         dword ptr [ebx+0C],eax
 004B5FAF    cmp         dword ptr [edi+138],0
 004B5FB6    sete        dl
 004B5FB9    and         edx,1
 004B5FBC    mov         dword ptr [esp+4],edx
 004B5FC0    cmp         dword ptr [edi+140],0
>004B5FC7    jne         004B5FE2
 004B5FC9    cmp         dword ptr [esp+4],0
>004B5FCE    je          004B5FD9
 004B5FD0    mov         dword ptr [ebx+4],4B6344
>004B5FD7    jmp         004B6013
 004B5FD9    mov         dword ptr [ebx+4],4B6478
>004B5FE0    jmp         004B6013
 004B5FE2    cmp         dword ptr [esp+4],0
>004B5FE7    je          004B5FF2
 004B5FE9    mov         dword ptr [ebx+4],4B6624
>004B5FF0    jmp         004B6013
 004B5FF2    mov         dword ptr [ebx+4],4B66CC
 004B5FF9    cmp         dword ptr [ebx+40],0
>004B5FFD    jne         004B6013
 004B5FFF    mov         eax,edi
 004B6001    mov         ecx,3E8
 004B6006    mov         edx,1
 004B600B    mov         esi,dword ptr [eax+4]
 004B600E    call        dword ptr [esi]
 004B6010    mov         dword ptr [ebx+40],eax
 004B6013    cmp         dword ptr [esp],0
>004B6017    je          004B6022
 004B6019    mov         dword ptr [ebx+8],4B6964
>004B6020    jmp         004B6029
 004B6022    mov         dword ptr [ebx+8],4B6928
 004B6029    xor         eax,eax
 004B602B    mov         dword ptr [esp+8],eax
 004B602F    lea         edx,[ebx+24]
 004B6032    mov         dword ptr [esp+10],edx
 004B6036    lea         ecx,[edi+0F4]
 004B603C    mov         dword ptr [esp+0C],ecx
>004B6040    jmp         004B60E2
 004B6045    mov         eax,dword ptr [esp+0C]
 004B6049    mov         edx,dword ptr [esp+10]
 004B604D    xor         ecx,ecx
 004B604F    mov         eax,dword ptr [eax]
 004B6051    mov         dword ptr [edx],ecx
 004B6053    cmp         dword ptr [esp+4],0
>004B6058    je          004B6068
 004B605A    cmp         dword ptr [edi+140],0
>004B6061    jne         004B60D4
 004B6063    mov         esi,dword ptr [eax+14]
>004B6066    jmp         004B606E
 004B6068    mov         esi,dword ptr [eax+18]
 004B606B    mov         dword ptr [ebx+34],esi
 004B606E    cmp         dword ptr [esp],0
>004B6072    je          004B60C2
 004B6074    test        esi,esi
>004B6076    jl          004B607D
 004B6078    cmp         esi,4
>004B607B    jl          004B608F
 004B607D    mov         eax,dword ptr [edi]
 004B607F    mov         dword ptr [eax+14],32
 004B6086    mov         dword ptr [eax+18],esi
 004B6089    mov         eax,edi
 004B608B    mov         edx,dword ptr [eax]
 004B608D    call        dword ptr [edx]
 004B608F    cmp         dword ptr [ebx+esi*4+5C],0
>004B6094    jne         004B60AC
 004B6096    mov         eax,edi
 004B6098    mov         ecx,404
 004B609D    mov         edx,1
 004B60A2    mov         ebp,dword ptr [eax+4]
 004B60A5    call        dword ptr [ebp]
 004B60A8    mov         dword ptr [ebx+esi*4+5C],eax
 004B60AC    push        404
 004B60B1    push        0
 004B60B3    mov         eax,dword ptr [ebx+esi*4+5C]
 004B60B7    push        eax
 004B60B8    call        _memset
 004B60BD    add         esp,0C
>004B60C0    jmp         004B60D4
 004B60C2    lea         edx,[ebx+esi*4+4C]
 004B60C6    mov         ecx,esi
 004B60C8    push        edx
 004B60C9    mov         eax,edi
 004B60CB    mov         edx,dword ptr [esp+8]
 004B60CF    call        @jpeg_make_c_derived_tbl
 004B60D4    inc         dword ptr [esp+8]
 004B60D8    add         dword ptr [esp+10],4
 004B60DD    add         dword ptr [esp+0C],4
 004B60E2    mov         ecx,dword ptr [edi+0F0]
 004B60E8    cmp         ecx,dword ptr [esp+8]
>004B60EC    jg          004B6045
 004B60F2    xor         eax,eax
 004B60F4    xor         edx,edx
 004B60F6    mov         dword ptr [ebx+38],eax
 004B60F9    mov         dword ptr [ebx+3C],edx
 004B60FC    xor         ecx,ecx
 004B60FE    xor         eax,eax
 004B6100    mov         dword ptr [ebx+18],ecx
 004B6103    mov         dword ptr [ebx+1C],eax
 004B6106    mov         edx,dword ptr [edi+0C4]
 004B610C    xor         ecx,ecx
 004B610E    mov         dword ptr [ebx+44],edx
 004B6111    mov         dword ptr [ebx+48],ecx
 004B6114    add         esp,14
 004B6117    pop         ebp
 004B6118    pop         edi
 004B6119    pop         esi
 004B611A    pop         ebx
 004B611B    ret
*}
end;

//004B6A24
procedure @jinit_phuff_encoder;
begin
{*
 004B6A24    push        ebx
 004B6A25    mov         ebx,eax
 004B6A27    mov         eax,ebx
 004B6A29    push        esi
 004B6A2A    mov         ecx,6C
 004B6A2F    mov         edx,1
 004B6A34    mov         esi,dword ptr [eax+4]
 004B6A37    call        dword ptr [esi]
 004B6A39    mov         ecx,eax
 004B6A3B    xor         edx,edx
 004B6A3D    mov         dword ptr [ebx+168],ecx
 004B6A43    mov         dword ptr [ecx],4B5F94;_DF_.
 004B6A49    lea         eax,[ecx+4C]
 004B6A4C    xor         ebx,ebx
 004B6A4E    inc         edx
 004B6A4F    mov         dword ptr [eax],ebx
 004B6A51    xor         ebx,ebx
 004B6A53    mov         dword ptr [eax+10],ebx
 004B6A56    add         eax,4
 004B6A59    cmp         edx,4
>004B6A5C    jl          004B6A4C
 004B6A5E    xor         eax,eax
 004B6A60    mov         dword ptr [ecx+40],eax
 004B6A63    pop         esi
 004B6A64    pop         ebx
 004B6A65    ret
*}
end;

//004B6A68
procedure @jpeg_fdct_ifast;
begin
{*
 004B6A68    push        ebx
 004B6A69    push        esi
 004B6A6A    push        edi
 004B6A6B    push        ebp
 004B6A6C    add         esp,0FFFFFFE8
 004B6A6F    mov         dword ptr [esp],eax
 004B6A72    mov         eax,dword ptr [esp]
 004B6A75    mov         dword ptr [esp+14],7
 004B6A7D    mov         edx,dword ptr [eax]
 004B6A7F    mov         ebx,dword ptr [eax+1C]
 004B6A82    mov         ecx,edx
 004B6A84    mov         esi,edx
 004B6A86    mov         edx,dword ptr [eax+4]
 004B6A89    sub         esi,ebx
 004B6A8B    add         ecx,ebx
 004B6A8D    mov         edi,dword ptr [eax+18]
 004B6A90    mov         ebx,edx
 004B6A92    sub         edx,edi
 004B6A94    mov         dword ptr [esp+10],edx
 004B6A98    add         ebx,edi
 004B6A9A    mov         edx,dword ptr [eax+8]
 004B6A9D    mov         edi,dword ptr [eax+14]
 004B6AA0    mov         ebp,edx
 004B6AA2    sub         edx,edi
 004B6AA4    add         ebp,edi
 004B6AA6    mov         dword ptr [esp+4],ebp
 004B6AAA    mov         dword ptr [esp+0C],edx
 004B6AAE    mov         edx,dword ptr [eax+0C]
 004B6AB1    mov         edi,edx
 004B6AB3    add         edi,dword ptr [eax+10]
 004B6AB6    sub         edx,dword ptr [eax+10]
 004B6AB9    mov         dword ptr [esp+8],edx
 004B6ABD    lea         edx,[edi+ecx]
 004B6AC0    sub         ecx,edi
 004B6AC2    mov         edi,ecx
 004B6AC4    mov         ecx,dword ptr [esp+4]
 004B6AC8    add         ecx,ebx
 004B6ACA    sub         ebx,dword ptr [esp+4]
 004B6ACE    lea         ebp,[ecx+edx]
 004B6AD1    sub         edx,ecx
 004B6AD3    mov         dword ptr [eax],ebp
 004B6AD5    mov         dword ptr [eax+10],edx
 004B6AD8    lea         edx,[edi+ebx]
 004B6ADB    mov         ecx,edx
 004B6ADD    lea         edx,[ecx+edx*4]
 004B6AE0    lea         edx,[ecx+edx*2]
 004B6AE3    lea         edx,[ecx+edx*4]
 004B6AE6    lea         edx,[ecx+edx*4]
 004B6AE9    sar         edx,8
 004B6AEC    lea         ecx,[edx+edi]
 004B6AEF    sub         edi,edx
 004B6AF1    mov         dword ptr [eax+8],ecx
 004B6AF4    mov         dword ptr [eax+18],edi
 004B6AF7    mov         edx,dword ptr [esp+8]
 004B6AFB    mov         ebx,dword ptr [esp+10]
 004B6AFF    add         edx,dword ptr [esp+0C]
 004B6B03    add         ebx,esi
 004B6B05    mov         edi,edx
 004B6B07    mov         ecx,dword ptr [esp+0C]
 004B6B0B    sub         edi,ebx
 004B6B0D    add         ecx,dword ptr [esp+10]
 004B6B11    mov         ebp,edi
 004B6B13    lea         edi,[ebp+edi*2]
 004B6B17    shl         edi,4
 004B6B1A    add         edi,ebp
 004B6B1C    mov         ebp,edx
 004B6B1E    shl         edx,4
 004B6B21    add         edi,edi
 004B6B23    add         edx,ebp
 004B6B25    sar         edi,8
 004B6B28    lea         edx,[ebp+edx*4]
 004B6B2C    lea         edx,[ebp+edx*2]
 004B6B30    mov         ebp,ebx
 004B6B32    sar         edx,8
 004B6B35    add         edx,edi
 004B6B37    lea         ebx,[ebp+ebx*4]
 004B6B3B    lea         ebx,[ebp+ebx*4]
 004B6B3F    shl         ebx,3
 004B6B42    sub         ebx,ebp
 004B6B44    add         ebx,ebx
 004B6B46    sar         ebx,8
 004B6B49    add         edi,ebx
 004B6B4B    mov         ebx,edi
 004B6B4D    mov         edi,ecx
 004B6B4F    lea         ecx,[edi+ecx*4]
 004B6B52    lea         ecx,[edi+ecx*2]
 004B6B55    lea         ecx,[edi+ecx*4]
 004B6B58    lea         ecx,[edi+ecx*4]
 004B6B5B    sar         ecx,8
 004B6B5E    lea         edi,[ecx+esi]
 004B6B61    sub         esi,ecx
 004B6B63    mov         ecx,esi
 004B6B65    lea         esi,[edx+ecx]
 004B6B68    sub         ecx,edx
 004B6B6A    mov         dword ptr [eax+14],esi
 004B6B6D    mov         dword ptr [eax+0C],ecx
 004B6B70    lea         edx,[ebx+edi]
 004B6B73    sub         edi,ebx
 004B6B75    mov         dword ptr [eax+4],edx
 004B6B78    mov         dword ptr [eax+1C],edi
 004B6B7B    dec         dword ptr [esp+14]
 004B6B7F    add         eax,20
 004B6B82    cmp         dword ptr [esp+14],0
>004B6B87    jge         004B6A7D
 004B6B8D    mov         eax,dword ptr [esp]
 004B6B90    mov         dword ptr [esp+14],7
 004B6B98    mov         edx,dword ptr [eax]
 004B6B9A    mov         ebx,dword ptr [eax+0E0]
 004B6BA0    mov         ecx,edx
 004B6BA2    mov         esi,edx
 004B6BA4    sub         esi,ebx
 004B6BA6    add         ecx,ebx
 004B6BA8    mov         ebx,dword ptr [eax+20]
 004B6BAB    mov         edx,dword ptr [eax+20]
 004B6BAE    add         ebx,dword ptr [eax+0C0]
 004B6BB4    sub         edx,dword ptr [eax+0C0]
 004B6BBA    mov         dword ptr [esp+10],edx
 004B6BBE    mov         edx,dword ptr [eax+40]
 004B6BC1    add         edx,dword ptr [eax+0A0]
 004B6BC7    mov         dword ptr [esp+4],edx
 004B6BCB    mov         edx,dword ptr [eax+40]
 004B6BCE    sub         edx,dword ptr [eax+0A0]
 004B6BD4    mov         dword ptr [esp+0C],edx
 004B6BD8    mov         edi,dword ptr [eax+60]
 004B6BDB    mov         edx,dword ptr [eax+60]
 004B6BDE    add         edi,dword ptr [eax+80]
 004B6BE4    sub         edx,dword ptr [eax+80]
 004B6BEA    mov         dword ptr [esp+8],edx
 004B6BEE    lea         edx,[edi+ecx]
 004B6BF1    sub         ecx,edi
 004B6BF3    mov         edi,ecx
 004B6BF5    mov         ecx,dword ptr [esp+4]
 004B6BF9    add         ecx,ebx
 004B6BFB    sub         ebx,dword ptr [esp+4]
 004B6BFF    lea         ebp,[ecx+edx]
 004B6C02    sub         edx,ecx
 004B6C04    mov         dword ptr [eax],ebp
 004B6C06    mov         dword ptr [eax+80],edx
 004B6C0C    lea         edx,[edi+ebx]
 004B6C0F    mov         ecx,edx
 004B6C11    lea         edx,[ecx+edx*4]
 004B6C14    lea         edx,[ecx+edx*2]
 004B6C17    lea         edx,[ecx+edx*4]
 004B6C1A    lea         edx,[ecx+edx*4]
 004B6C1D    sar         edx,8
 004B6C20    lea         ecx,[edx+edi]
 004B6C23    sub         edi,edx
 004B6C25    mov         dword ptr [eax+40],ecx
 004B6C28    mov         dword ptr [eax+0C0],edi
 004B6C2E    mov         edx,dword ptr [esp+8]
 004B6C32    mov         ebx,dword ptr [esp+10]
 004B6C36    add         edx,dword ptr [esp+0C]
 004B6C3A    add         ebx,esi
 004B6C3C    mov         edi,edx
 004B6C3E    mov         ecx,dword ptr [esp+0C]
 004B6C42    sub         edi,ebx
 004B6C44    add         ecx,dword ptr [esp+10]
 004B6C48    mov         ebp,edi
 004B6C4A    lea         edi,[ebp+edi*2]
 004B6C4E    shl         edi,4
 004B6C51    add         edi,ebp
 004B6C53    mov         ebp,edx
 004B6C55    shl         edx,4
 004B6C58    add         edi,edi
 004B6C5A    add         edx,ebp
 004B6C5C    sar         edi,8
 004B6C5F    lea         edx,[ebp+edx*4]
 004B6C63    lea         edx,[ebp+edx*2]
 004B6C67    mov         ebp,ebx
 004B6C69    sar         edx,8
 004B6C6C    add         edx,edi
 004B6C6E    lea         ebx,[ebp+ebx*4]
 004B6C72    lea         ebx,[ebp+ebx*4]
 004B6C76    shl         ebx,3
 004B6C79    sub         ebx,ebp
 004B6C7B    add         ebx,ebx
 004B6C7D    sar         ebx,8
 004B6C80    add         edi,ebx
 004B6C82    mov         ebx,edi
 004B6C84    mov         edi,ecx
 004B6C86    lea         ecx,[edi+ecx*4]
 004B6C89    lea         ecx,[edi+ecx*2]
 004B6C8C    lea         ecx,[edi+ecx*4]
 004B6C8F    lea         ecx,[edi+ecx*4]
 004B6C92    sar         ecx,8
 004B6C95    lea         edi,[ecx+esi]
 004B6C98    sub         esi,ecx
 004B6C9A    mov         ecx,esi
 004B6C9C    lea         esi,[edx+ecx]
 004B6C9F    sub         ecx,edx
 004B6CA1    mov         dword ptr [eax+0A0],esi
 004B6CA7    mov         dword ptr [eax+60],ecx
 004B6CAA    lea         edx,[ebx+edi]
 004B6CAD    sub         edi,ebx
 004B6CAF    mov         dword ptr [eax+20],edx
 004B6CB2    mov         dword ptr [eax+0E0],edi
 004B6CB8    dec         dword ptr [esp+14]
 004B6CBC    add         eax,4
 004B6CBF    cmp         dword ptr [esp+14],0
>004B6CC4    jge         004B6B98
 004B6CCA    add         esp,18
 004B6CCD    pop         ebp
 004B6CCE    pop         edi
 004B6CCF    pop         esi
 004B6CD0    pop         ebx
 004B6CD1    ret
*}
end;

//004B6CD4
procedure @jpeg_fdct_float;
begin
{*
 004B6CD4    add         esp,0FFFFFFB4
 004B6CD7    mov         edx,eax
 004B6CD9    mov         ecx,7
 004B6CDE    fld         dword ptr [edx]
 004B6CE0    fadd        dword ptr [edx+1C]
 004B6CE3    fstp        dword ptr [esp]
 004B6CE6    fld         dword ptr [edx]
 004B6CE8    fsub        dword ptr [edx+1C]
 004B6CEB    fstp        dword ptr [esp+1C]
 004B6CEF    fld         dword ptr [edx+4]
 004B6CF2    fadd        dword ptr [edx+18]
 004B6CF5    fstp        dword ptr [esp+4]
 004B6CF9    fld         dword ptr [edx+4]
 004B6CFC    fsub        dword ptr [edx+18]
 004B6CFF    fstp        dword ptr [esp+18]
 004B6D03    fld         dword ptr [edx+8]
 004B6D06    fadd        dword ptr [edx+14]
 004B6D09    fstp        dword ptr [esp+8]
 004B6D0D    fld         dword ptr [edx+8]
 004B6D10    fsub        dword ptr [edx+14]
 004B6D13    fstp        dword ptr [esp+14]
 004B6D17    fld         dword ptr [edx+0C]
 004B6D1A    fadd        dword ptr [edx+10]
 004B6D1D    fstp        dword ptr [esp+0C]
 004B6D21    fld         dword ptr [edx+0C]
 004B6D24    fsub        dword ptr [edx+10]
 004B6D27    fstp        dword ptr [esp+10]
 004B6D2B    fld         dword ptr [esp]
 004B6D2E    fadd        dword ptr [esp+0C]
 004B6D32    fstp        dword ptr [esp+20]
 004B6D36    fld         dword ptr [esp]
 004B6D39    fsub        dword ptr [esp+0C]
 004B6D3D    fstp        dword ptr [esp+2C]
 004B6D41    fld         dword ptr [esp+4]
 004B6D45    fadd        dword ptr [esp+8]
 004B6D49    fstp        dword ptr [esp+24]
 004B6D4D    fld         dword ptr [esp+4]
 004B6D51    fsub        dword ptr [esp+8]
 004B6D55    fstp        dword ptr [esp+28]
 004B6D59    fld         dword ptr [esp+20]
 004B6D5D    fadd        dword ptr [esp+24]
 004B6D61    fstp        dword ptr [edx]
 004B6D63    fld         dword ptr [esp+20]
 004B6D67    fsub        dword ptr [esp+24]
 004B6D6B    fstp        dword ptr [edx+10]
 004B6D6E    fld         dword ptr [esp+28]
 004B6D72    fadd        dword ptr [esp+2C]
 004B6D76    fmul        dword ptr ds:[4B6FF0]
 004B6D7C    fstp        dword ptr [esp+30]
 004B6D80    fld         dword ptr [esp+2C]
 004B6D84    fadd        dword ptr [esp+30]
 004B6D88    fstp        dword ptr [edx+8]
 004B6D8B    fld         dword ptr [esp+2C]
 004B6D8F    fsub        dword ptr [esp+30]
 004B6D93    fstp        dword ptr [edx+18]
 004B6D96    fld         dword ptr [esp+10]
 004B6D9A    fadd        dword ptr [esp+14]
 004B6D9E    fstp        dword ptr [esp+20]
 004B6DA2    fld         dword ptr [esp+14]
 004B6DA6    fadd        dword ptr [esp+18]
 004B6DAA    fstp        dword ptr [esp+24]
 004B6DAE    fld         dword ptr [esp+18]
 004B6DB2    fadd        dword ptr [esp+1C]
 004B6DB6    fstp        dword ptr [esp+28]
 004B6DBA    fld         dword ptr [esp+20]
 004B6DBE    fsub        dword ptr [esp+28]
 004B6DC2    fmul        dword ptr ds:[4B6FF4]
 004B6DC8    fstp        dword ptr [esp+40]
 004B6DCC    fld         dword ptr ds:[4B6FF8]
 004B6DD2    fmul        dword ptr [esp+20]
 004B6DD6    fadd        dword ptr [esp+40]
 004B6DDA    fstp        dword ptr [esp+34]
 004B6DDE    fld         dword ptr ds:[4B6FFC]
 004B6DE4    fmul        dword ptr [esp+28]
 004B6DE8    fadd        dword ptr [esp+40]
 004B6DEC    fstp        dword ptr [esp+3C]
 004B6DF0    fld         dword ptr [esp+24]
 004B6DF4    fmul        dword ptr ds:[4B6FF0]
 004B6DFA    fstp        dword ptr [esp+38]
 004B6DFE    fld         dword ptr [esp+1C]
 004B6E02    fadd        dword ptr [esp+38]
 004B6E06    fstp        dword ptr [esp+44]
 004B6E0A    fld         dword ptr [esp+1C]
 004B6E0E    fsub        dword ptr [esp+38]
 004B6E12    fstp        dword ptr [esp+48]
 004B6E16    fld         dword ptr [esp+48]
 004B6E1A    fadd        dword ptr [esp+34]
 004B6E1E    fstp        dword ptr [edx+14]
 004B6E21    fld         dword ptr [esp+48]
 004B6E25    fsub        dword ptr [esp+34]
 004B6E29    fstp        dword ptr [edx+0C]
 004B6E2C    fld         dword ptr [esp+44]
 004B6E30    fadd        dword ptr [esp+3C]
 004B6E34    fstp        dword ptr [edx+4]
 004B6E37    fld         dword ptr [esp+44]
 004B6E3B    fsub        dword ptr [esp+3C]
 004B6E3F    fstp        dword ptr [edx+1C]
 004B6E42    add         edx,20
 004B6E45    dec         ecx
 004B6E46    test        ecx,ecx
>004B6E48    jge         004B6CDE
 004B6E4E    mov         edx,eax
 004B6E50    mov         ecx,7
 004B6E55    fld         dword ptr [edx]
 004B6E57    fadd        dword ptr [edx+0E0]
 004B6E5D    fstp        dword ptr [esp]
 004B6E60    fld         dword ptr [edx]
 004B6E62    fsub        dword ptr [edx+0E0]
 004B6E68    fstp        dword ptr [esp+1C]
 004B6E6C    fld         dword ptr [edx+20]
 004B6E6F    fadd        dword ptr [edx+0C0]
 004B6E75    fstp        dword ptr [esp+4]
 004B6E79    fld         dword ptr [edx+20]
 004B6E7C    fsub        dword ptr [edx+0C0]
 004B6E82    fstp        dword ptr [esp+18]
 004B6E86    fld         dword ptr [edx+40]
 004B6E89    fadd        dword ptr [edx+0A0]
 004B6E8F    fstp        dword ptr [esp+8]
 004B6E93    fld         dword ptr [edx+40]
 004B6E96    fsub        dword ptr [edx+0A0]
 004B6E9C    fstp        dword ptr [esp+14]
 004B6EA0    fld         dword ptr [edx+60]
 004B6EA3    fadd        dword ptr [edx+80]
 004B6EA9    fstp        dword ptr [esp+0C]
 004B6EAD    fld         dword ptr [edx+60]
 004B6EB0    fsub        dword ptr [edx+80]
 004B6EB6    fstp        dword ptr [esp+10]
 004B6EBA    fld         dword ptr [esp]
 004B6EBD    fadd        dword ptr [esp+0C]
 004B6EC1    fstp        dword ptr [esp+20]
 004B6EC5    fld         dword ptr [esp]
 004B6EC8    fsub        dword ptr [esp+0C]
 004B6ECC    fstp        dword ptr [esp+2C]
 004B6ED0    fld         dword ptr [esp+4]
 004B6ED4    fadd        dword ptr [esp+8]
 004B6ED8    fstp        dword ptr [esp+24]
 004B6EDC    fld         dword ptr [esp+4]
 004B6EE0    fsub        dword ptr [esp+8]
 004B6EE4    fstp        dword ptr [esp+28]
 004B6EE8    fld         dword ptr [esp+20]
 004B6EEC    fadd        dword ptr [esp+24]
 004B6EF0    fstp        dword ptr [edx]
 004B6EF2    fld         dword ptr [esp+20]
 004B6EF6    fsub        dword ptr [esp+24]
 004B6EFA    fstp        dword ptr [edx+80]
 004B6F00    fld         dword ptr [esp+28]
 004B6F04    fadd        dword ptr [esp+2C]
 004B6F08    fmul        dword ptr ds:[4B6FF0]
 004B6F0E    fstp        dword ptr [esp+30]
 004B6F12    fld         dword ptr [esp+2C]
 004B6F16    fadd        dword ptr [esp+30]
 004B6F1A    fstp        dword ptr [edx+40]
 004B6F1D    fld         dword ptr [esp+2C]
 004B6F21    fsub        dword ptr [esp+30]
 004B6F25    fstp        dword ptr [edx+0C0]
 004B6F2B    fld         dword ptr [esp+10]
 004B6F2F    fadd        dword ptr [esp+14]
 004B6F33    fstp        dword ptr [esp+20]
 004B6F37    fld         dword ptr [esp+14]
 004B6F3B    fadd        dword ptr [esp+18]
 004B6F3F    fstp        dword ptr [esp+24]
 004B6F43    fld         dword ptr [esp+18]
 004B6F47    fadd        dword ptr [esp+1C]
 004B6F4B    fstp        dword ptr [esp+28]
 004B6F4F    fld         dword ptr [esp+20]
 004B6F53    fsub        dword ptr [esp+28]
 004B6F57    fmul        dword ptr ds:[4B6FF4]
 004B6F5D    fstp        dword ptr [esp+40]
 004B6F61    fld         dword ptr ds:[4B6FF8]
 004B6F67    fmul        dword ptr [esp+20]
 004B6F6B    fadd        dword ptr [esp+40]
 004B6F6F    fstp        dword ptr [esp+34]
 004B6F73    fld         dword ptr ds:[4B6FFC]
 004B6F79    fmul        dword ptr [esp+28]
 004B6F7D    fadd        dword ptr [esp+40]
 004B6F81    fstp        dword ptr [esp+3C]
 004B6F85    fld         dword ptr [esp+24]
 004B6F89    fmul        dword ptr ds:[4B6FF0]
 004B6F8F    fstp        dword ptr [esp+38]
 004B6F93    fld         dword ptr [esp+1C]
 004B6F97    fadd        dword ptr [esp+38]
 004B6F9B    fstp        dword ptr [esp+44]
 004B6F9F    fld         dword ptr [esp+1C]
 004B6FA3    fsub        dword ptr [esp+38]
 004B6FA7    fstp        dword ptr [esp+48]
 004B6FAB    fld         dword ptr [esp+48]
 004B6FAF    fadd        dword ptr [esp+34]
 004B6FB3    fstp        dword ptr [edx+0A0]
 004B6FB9    fld         dword ptr [esp+48]
 004B6FBD    fsub        dword ptr [esp+34]
 004B6FC1    fstp        dword ptr [edx+60]
 004B6FC4    fld         dword ptr [esp+44]
 004B6FC8    fadd        dword ptr [esp+3C]
 004B6FCC    fstp        dword ptr [edx+20]
 004B6FCF    fld         dword ptr [esp+44]
 004B6FD3    fsub        dword ptr [esp+3C]
 004B6FD7    fstp        dword ptr [edx+0E0]
 004B6FDD    add         edx,4
 004B6FE0    dec         ecx
 004B6FE1    test        ecx,ecx
>004B6FE3    jge         004B6E55
 004B6FE9    add         esp,4C
 004B6FEC    ret
*}
end;

//004B7000
procedure _DF_.;
begin
{*
 004B7000    push        ebx
 004B7001    push        esi
 004B7002    push        edi
 004B7003    push        ebp
 004B7004    add         esp,0FFFFFFEC
 004B7007    mov         esi,eax
 004B7009    mov         dword ptr [esp],edx
 004B700C    cmp         dword ptr [esp],0
 004B7010    mov         ebx,dword ptr [esi+168]
>004B7016    je          004B7028
 004B7018    mov         dword ptr [ebx+4],4B78EC
 004B701F    mov         dword ptr [ebx+8],4B7B84
>004B7026    jmp         004B7036
 004B7028    mov         dword ptr [ebx+4],4B7690
 004B702F    mov         dword ptr [ebx+8],4B77A0
 004B7036    xor         eax,eax
 004B7038    mov         dword ptr [esp+4],eax
 004B703C    lea         edx,[ebx+14]
 004B703F    mov         dword ptr [esp+10],edx
 004B7043    lea         ecx,[esi+0F4]
 004B7049    mov         dword ptr [esp+0C],ecx
>004B704D    jmp         004B715D
 004B7052    mov         eax,dword ptr [esp+0C]
 004B7056    mov         eax,dword ptr [eax]
 004B7058    mov         edi,dword ptr [eax+14]
 004B705B    mov         eax,dword ptr [eax+18]
 004B705E    mov         dword ptr [esp+8],eax
 004B7062    cmp         dword ptr [esp],0
>004B7066    je          004B711A
 004B706C    test        edi,edi
>004B706E    jl          004B7075
 004B7070    cmp         edi,4
>004B7073    jl          004B7087
 004B7075    mov         eax,dword ptr [esi]
 004B7077    mov         dword ptr [eax+14],32
 004B707E    mov         dword ptr [eax+18],edi
 004B7081    mov         eax,esi
 004B7083    mov         edx,dword ptr [eax]
 004B7085    call        dword ptr [edx]
 004B7087    cmp         dword ptr [esp+8],0
>004B708C    jl          004B7095
 004B708E    cmp         dword ptr [esp+8],4
>004B7093    jl          004B70AB
 004B7095    mov         eax,dword ptr [esi]
 004B7097    mov         dword ptr [eax+14],32
 004B709E    mov         edx,dword ptr [esp+8]
 004B70A2    mov         dword ptr [eax+18],edx
 004B70A5    mov         eax,esi
 004B70A7    mov         edx,dword ptr [eax]
 004B70A9    call        dword ptr [edx]
 004B70AB    cmp         dword ptr [ebx+edi*4+4C],0
>004B70B0    jne         004B70C8
 004B70B2    mov         eax,esi
 004B70B4    mov         ecx,404
 004B70B9    mov         edx,1
 004B70BE    mov         ebp,dword ptr [eax+4]
 004B70C1    call        dword ptr [ebp]
 004B70C4    mov         dword ptr [ebx+edi*4+4C],eax
 004B70C8    push        404
 004B70CD    push        0
 004B70CF    mov         eax,dword ptr [ebx+edi*4+4C]
 004B70D3    push        eax
 004B70D4    call        _memset
 004B70D9    add         esp,0C
 004B70DC    mov         edx,dword ptr [esp+8]
 004B70E0    cmp         dword ptr [ebx+edx*4+5C],0
>004B70E5    jne         004B7100
 004B70E7    mov         eax,esi
 004B70E9    mov         ecx,404
 004B70EE    mov         edx,1
 004B70F3    mov         edi,dword ptr [eax+4]
 004B70F6    call        dword ptr [edi]
 004B70F8    mov         edx,dword ptr [esp+8]
 004B70FC    mov         dword ptr [ebx+edx*4+5C],eax
 004B7100    push        404
 004B7105    push        0
 004B7107    mov         eax,dword ptr [esp+10]
 004B710B    mov         ecx,dword ptr [ebx+eax*4+5C]
 004B710F    push        ecx
 004B7110    call        _memset
 004B7115    add         esp,0C
>004B7118    jmp         004B7147
 004B711A    lea         eax,[ebx+edi*4+2C]
 004B711E    mov         ecx,edi
 004B7120    push        eax
 004B7121    mov         eax,esi
 004B7123    mov         edx,1
 004B7128    call        @jpeg_make_c_derived_tbl
 004B712D    mov         edx,dword ptr [esp+8]
 004B7131    mov         eax,esi
 004B7133    shl         edx,2
 004B7136    add         edx,ebx
 004B7138    add         edx,3C
 004B713B    push        edx
 004B713C    xor         edx,edx
 004B713E    mov         ecx,dword ptr [esp+0C]
 004B7142    call        @jpeg_make_c_derived_tbl
 004B7147    mov         ecx,dword ptr [esp+10]
 004B714B    xor         eax,eax
 004B714D    mov         dword ptr [ecx],eax
 004B714F    inc         dword ptr [esp+4]
 004B7153    add         dword ptr [esp+10],4
 004B7158    add         dword ptr [esp+0C],4
 004B715D    mov         edx,dword ptr [esp+4]
 004B7161    cmp         edx,dword ptr [esi+0F0]
>004B7167    jl          004B7052
 004B716D    xor         ecx,ecx
 004B716F    xor         eax,eax
 004B7171    mov         dword ptr [ebx+0C],ecx
 004B7174    mov         dword ptr [ebx+10],eax
 004B7177    mov         edx,dword ptr [esi+0C4]
 004B717D    xor         ecx,ecx
 004B717F    mov         dword ptr [ebx+24],edx
 004B7182    mov         dword ptr [ebx+28],ecx
 004B7185    add         esp,14
 004B7188    pop         ebp
 004B7189    pop         edi
 004B718A    pop         esi
 004B718B    pop         ebx
 004B718C    ret
*}
end;

//004B7190
procedure @jpeg_make_c_derived_tbl;
begin
{*
 004B7190    push        ebp
 004B7191    mov         ebp,esp
 004B7193    add         esp,0FFFFFAD0
 004B7199    push        ebx
 004B719A    push        esi
 004B719B    push        edi
 004B719C    mov         esi,ecx
 004B719E    mov         dword ptr [ebp-8],edx
 004B71A1    mov         dword ptr [ebp-4],eax
 004B71A4    mov         ebx,dword ptr [ebp+8]
 004B71A7    test        esi,esi
>004B71A9    jl          004B71B0
 004B71AB    cmp         esi,4
>004B71AE    jl          004B71C6
 004B71B0    mov         eax,dword ptr [ebp-4]
 004B71B3    mov         eax,dword ptr [eax]
 004B71B5    mov         dword ptr [eax+14],32
 004B71BC    mov         dword ptr [eax+18],esi
 004B71BF    mov         eax,dword ptr [ebp-4]
 004B71C2    mov         edx,dword ptr [eax]
 004B71C4    call        dword ptr [edx]
 004B71C6    cmp         dword ptr [ebp-8],0
>004B71CA    je          004B71D5
 004B71CC    mov         ecx,dword ptr [ebp-4]
 004B71CF    mov         eax,dword ptr [ecx+esi*4+54]
>004B71D3    jmp         004B71DC
 004B71D5    mov         edx,dword ptr [ebp-4]
 004B71D8    mov         eax,dword ptr [edx+esi*4+64]
 004B71DC    mov         dword ptr [ebp-0C],eax
 004B71DF    cmp         dword ptr [ebp-0C],0
>004B71E3    jne         004B71FB
 004B71E5    mov         edx,dword ptr [ebp-4]
 004B71E8    mov         eax,dword ptr [edx]
 004B71EA    mov         dword ptr [eax+14],32
 004B71F1    mov         dword ptr [eax+18],esi
 004B71F4    mov         eax,dword ptr [ebp-4]
 004B71F7    mov         edx,dword ptr [eax]
 004B71F9    call        dword ptr [edx]
 004B71FB    cmp         dword ptr [ebx],0
>004B71FE    jne         004B7214
 004B7200    mov         eax,dword ptr [ebp-4]
 004B7203    mov         ecx,500
 004B7208    mov         edx,1
 004B720D    mov         esi,dword ptr [eax+4]
 004B7210    call        dword ptr [esi]
 004B7212    mov         dword ptr [ebx],eax
 004B7214    mov         eax,dword ptr [ebx]
 004B7216    mov         dword ptr [ebp-10],eax
 004B7219    xor         ebx,ebx
 004B721B    mov         edi,1
 004B7220    mov         eax,dword ptr [ebp-0C]
 004B7223    lea         edx,[eax+1]
 004B7226    mov         dword ptr [ebp-20],edx
 004B7229    mov         ecx,dword ptr [ebp-20]
 004B722C    movzx       esi,byte ptr [ecx]
 004B722F    test        esi,esi
>004B7231    jl          004B723D
 004B7233    lea         eax,[esi+ebx]
 004B7236    cmp         eax,100
>004B723B    jle         004B7250
 004B723D    mov         edx,dword ptr [ebp-4]
 004B7240    mov         ecx,dword ptr [edx]
 004B7242    mov         dword ptr [ecx+14],8
 004B7249    mov         eax,dword ptr [ebp-4]
 004B724C    mov         edx,dword ptr [eax]
 004B724E    call        dword ptr [edx]
 004B7250    lea         eax,[ebp+ebx-12C]
>004B7257    jmp         004B725F
 004B7259    mov         edx,edi
 004B725B    inc         ebx
 004B725C    mov         byte ptr [eax],dl
 004B725E    inc         eax
 004B725F    mov         ecx,esi
 004B7261    add         esi,0FFFFFFFF
 004B7264    test        ecx,ecx
>004B7266    jne         004B7259
 004B7268    inc         edi
 004B7269    inc         dword ptr [ebp-20]
 004B726C    cmp         edi,10
>004B726F    jle         004B7229
 004B7271    mov         byte ptr [ebp+ebx-12C],0
 004B7279    mov         dword ptr [ebp-14],ebx
 004B727C    xor         esi,esi
 004B727E    movsx       eax,byte ptr [ebp-12C]
 004B7285    mov         dword ptr [ebp-18],eax
 004B7288    xor         ebx,ebx
>004B728A    jmp         004B72D2
 004B728C    lea         edx,[ebp+ebx*4-530]
 004B7293    lea         eax,[ebp+ebx-12C]
>004B729A    jmp         004B72A4
 004B729C    mov         dword ptr [edx],esi
 004B729E    inc         ebx
 004B729F    add         edx,4
 004B72A2    inc         eax
 004B72A3    inc         esi
 004B72A4    movsx       ecx,byte ptr [eax]
 004B72A7    cmp         ecx,dword ptr [ebp-18]
>004B72AA    je          004B729C
 004B72AC    mov         ecx,dword ptr [ebp-18]
 004B72AF    mov         eax,1
 004B72B4    shl         eax,cl
 004B72B6    cmp         eax,esi
>004B72B8    jg          004B72CD
 004B72BA    mov         edx,dword ptr [ebp-4]
 004B72BD    mov         eax,dword ptr [edx]
 004B72BF    mov         dword ptr [eax+14],8
 004B72C6    mov         eax,dword ptr [ebp-4]
 004B72C9    mov         edx,dword ptr [eax]
 004B72CB    call        dword ptr [edx]
 004B72CD    add         esi,esi
 004B72CF    inc         dword ptr [ebp-18]
 004B72D2    cmp         byte ptr [ebp+ebx-12C],0
>004B72DA    jne         004B728C
 004B72DC    push        100
 004B72E1    push        0
 004B72E3    mov         ecx,dword ptr [ebp-10]
 004B72E6    add         ecx,400
 004B72EC    push        ecx
 004B72ED    call        _memset
 004B72F2    add         esp,0C
 004B72F5    cmp         dword ptr [ebp-8],0
>004B72F9    je          004B7302
 004B72FB    mov         eax,0F
>004B7300    jmp         004B7307
 004B7302    mov         eax,0FF
 004B7307    mov         dword ptr [ebp-1C],eax
 004B730A    lea         eax,[ebp-12C]
 004B7310    mov         dword ptr [ebp-28],eax
 004B7313    lea         edx,[ebp-530]
 004B7319    mov         dword ptr [ebp-24],edx
 004B731C    xor         ebx,ebx
 004B731E    mov         ecx,dword ptr [ebp-0C]
 004B7321    cmp         ebx,dword ptr [ebp-14]
 004B7324    lea         edi,[ecx+11]
>004B7327    jge         004B737D
 004B7329    movzx       esi,byte ptr [edi]
 004B732C    test        esi,esi
>004B732E    jl          004B7342
 004B7330    cmp         esi,dword ptr [ebp-1C]
>004B7333    jg          004B7342
 004B7335    mov         eax,dword ptr [ebp-10]
 004B7338    cmp         byte ptr [eax+esi+400],0
>004B7340    je          004B7355
 004B7342    mov         edx,dword ptr [ebp-4]
 004B7345    mov         ecx,dword ptr [edx]
 004B7347    mov         dword ptr [ecx+14],8
 004B734E    mov         eax,dword ptr [ebp-4]
 004B7351    mov         edx,dword ptr [eax]
 004B7353    call        dword ptr [edx]
 004B7355    mov         ecx,dword ptr [ebp-24]
 004B7358    mov         edx,dword ptr [ebp-10]
 004B735B    inc         ebx
 004B735C    inc         edi
 004B735D    mov         eax,dword ptr [ecx]
 004B735F    mov         dword ptr [edx+esi*4],eax
 004B7362    mov         ecx,dword ptr [ebp-28]
 004B7365    mov         edx,dword ptr [ebp-10]
 004B7368    mov         al,byte ptr [ecx]
 004B736A    mov         byte ptr [edx+esi+400],al
 004B7371    inc         dword ptr [ebp-28]
 004B7374    add         dword ptr [ebp-24],4
 004B7378    cmp         ebx,dword ptr [ebp-14]
>004B737B    jl          004B7329
 004B737D    pop         edi
 004B737E    pop         esi
 004B737F    pop         ebx
 004B7380    mov         esp,ebp
 004B7382    pop         ebp
 004B7383    ret         4
*}
end;

//004B79A0
procedure @jpeg_gen_optimal_table;
begin
{*
 004B79A0    push        ebx
 004B79A1    push        esi
 004B79A2    push        edi
 004B79A3    add         esp,0FFFFF7C8
 004B79A9    mov         dword ptr [esp+8],ecx
 004B79AD    mov         dword ptr [esp+4],edx
 004B79B1    mov         dword ptr [esp],eax
 004B79B4    push        21
 004B79B6    push        0
 004B79B8    lea         eax,[esp+14]
 004B79BC    push        eax
 004B79BD    call        _memset
 004B79C2    add         esp,0C
 004B79C5    push        404
 004B79CA    push        0
 004B79CC    lea         edx,[esp+38]
 004B79D0    push        edx
 004B79D1    call        _memset
 004B79D6    add         esp,0C
 004B79D9    xor         ebx,ebx
 004B79DB    lea         eax,[esp+434]
 004B79E2    mov         dword ptr [eax],0FFFFFFFF
 004B79E8    inc         ebx
 004B79E9    add         eax,4
 004B79EC    cmp         ebx,101
>004B79F2    jl          004B79E2
 004B79F4    mov         edx,dword ptr [esp+8]
 004B79F8    mov         dword ptr [edx+400],1
 004B7A02    or          eax,0FFFFFFFF
 004B7A05    mov         edi,3B9ACA00
 004B7A0A    xor         ebx,ebx
 004B7A0C    mov         edx,dword ptr [esp+8]
 004B7A10    mov         ecx,dword ptr [edx]
 004B7A12    test        ecx,ecx
>004B7A14    je          004B7A1E
 004B7A16    cmp         edi,ecx
>004B7A18    jl          004B7A1E
 004B7A1A    mov         edi,ecx
 004B7A1C    mov         eax,ebx
 004B7A1E    inc         ebx
 004B7A1F    add         edx,4
 004B7A22    cmp         ebx,100
>004B7A28    jle         004B7A10
 004B7A2A    or          edx,0FFFFFFFF
 004B7A2D    mov         edi,3B9ACA00
 004B7A32    xor         ebx,ebx
 004B7A34    mov         ecx,dword ptr [esp+8]
 004B7A38    mov         esi,dword ptr [ecx]
 004B7A3A    test        esi,esi
>004B7A3C    je          004B7A4A
 004B7A3E    cmp         edi,esi
>004B7A40    jl          004B7A4A
 004B7A42    cmp         eax,ebx
>004B7A44    je          004B7A4A
 004B7A46    mov         edi,esi
 004B7A48    mov         edx,ebx
 004B7A4A    inc         ebx
 004B7A4B    add         ecx,4
 004B7A4E    cmp         ebx,100
>004B7A54    jle         004B7A38
 004B7A56    test        edx,edx
>004B7A58    jl          004B7AAB
 004B7A5A    mov         ecx,dword ptr [esp+8]
 004B7A5E    mov         ebx,dword ptr [esp+8]
 004B7A62    mov         ecx,dword ptr [ecx+edx*4]
 004B7A65    add         dword ptr [ebx+eax*4],ecx
 004B7A68    xor         ebx,ebx
 004B7A6A    mov         ecx,dword ptr [esp+8]
 004B7A6E    mov         dword ptr [ecx+edx*4],ebx
 004B7A71    inc         dword ptr [esp+eax*4+30]
>004B7A75    jmp         004B7A7D
 004B7A77    mov         eax,ecx
 004B7A79    inc         dword ptr [esp+eax*4+30]
 004B7A7D    mov         ecx,dword ptr [esp+eax*4+434]
 004B7A84    test        ecx,ecx
>004B7A86    jge         004B7A77
 004B7A88    mov         dword ptr [esp+eax*4+434],edx
 004B7A8F    inc         dword ptr [esp+edx*4+30]
>004B7A93    jmp         004B7A9B
 004B7A95    mov         edx,eax
 004B7A97    inc         dword ptr [esp+edx*4+30]
 004B7A9B    mov         eax,dword ptr [esp+edx*4+434]
 004B7AA2    test        eax,eax
>004B7AA4    jge         004B7A95
>004B7AA6    jmp         004B7A02
 004B7AAB    xor         ebx,ebx
 004B7AAD    lea         esi,[esp+30]
 004B7AB1    mov         eax,dword ptr [esi]
 004B7AB3    test        eax,eax
>004B7AB5    je          004B7AD5
 004B7AB7    cmp         eax,20
>004B7ABA    jle         004B7ACF
 004B7ABC    mov         edx,dword ptr [esp]
 004B7ABF    mov         ecx,dword ptr [edx]
 004B7AC1    mov         dword ptr [ecx+14],27
 004B7AC8    mov         eax,dword ptr [esp]
 004B7ACB    mov         edx,dword ptr [eax]
 004B7ACD    call        dword ptr [edx]
 004B7ACF    mov         ecx,dword ptr [esi]
 004B7AD1    inc         byte ptr [esp+ecx+0C]
 004B7AD5    inc         ebx
 004B7AD6    add         esi,4
 004B7AD9    cmp         ebx,100
>004B7ADF    jle         004B7AB1
 004B7AE1    mov         ebx,20
 004B7AE6    lea         esi,[esp+2C]
 004B7AEA    mov         ecx,esi
>004B7AEC    jmp         004B7B0D
 004B7AEE    lea         eax,[ebx-2]
 004B7AF1    lea         edx,[esp+eax+0C]
>004B7AF5    jmp         004B7AF9
 004B7AF7    dec         eax
 004B7AF8    dec         edx
 004B7AF9    cmp         byte ptr [edx],0
>004B7AFC    je          004B7AF7
 004B7AFE    add         byte ptr [ecx],0FE
 004B7B01    inc         byte ptr [ecx-1]
 004B7B04    add         byte ptr [esp+eax+0D],2
 004B7B09    dec         byte ptr [esp+eax+0C]
 004B7B0D    cmp         byte ptr [ecx],0
>004B7B10    ja          004B7AEE
 004B7B12    dec         ebx
 004B7B13    dec         esi
 004B7B14    cmp         ebx,10
>004B7B17    jg          004B7AEA
 004B7B19    lea         eax,[esp+ebx+0C]
>004B7B1D    jmp         004B7B21
 004B7B1F    dec         ebx
 004B7B20    dec         eax
 004B7B21    cmp         byte ptr [eax],0
>004B7B24    je          004B7B1F
 004B7B26    dec         byte ptr [esp+ebx+0C]
 004B7B2A    push        11
 004B7B2C    lea         edx,[esp+10]
 004B7B30    push        edx
 004B7B31    mov         ecx,dword ptr [esp+0C]
 004B7B35    push        ecx
 004B7B36    call        _memcpy
 004B7B3B    add         esp,0C
 004B7B3E    xor         edi,edi
 004B7B40    mov         ebx,1
 004B7B45    xor         eax,eax
 004B7B47    mov         edx,dword ptr [esp+4]
 004B7B4B    lea         esi,[edx+edi+11]
 004B7B4F    lea         edx,[esp+30]
 004B7B53    cmp         ebx,dword ptr [edx]
>004B7B55    jne         004B7B5B
 004B7B57    mov         byte ptr [esi],al
 004B7B59    inc         edi
 004B7B5A    inc         esi
 004B7B5B    inc         eax
 004B7B5C    add         edx,4
 004B7B5F    cmp         eax,0FF
>004B7B64    jle         004B7B53
 004B7B66    inc         ebx
 004B7B67    cmp         ebx,20
>004B7B6A    jle         004B7B45
 004B7B6C    mov         eax,dword ptr [esp+4]
 004B7B70    xor         ecx,ecx
 004B7B72    mov         dword ptr [eax+114],ecx
 004B7B78    add         esp,838
 004B7B7E    pop         edi
 004B7B7F    pop         esi
 004B7B80    pop         ebx
 004B7B81    ret
*}
end;

//004B7C5C
procedure @jinit_huff_encoder;
begin
{*
 004B7C5C    push        ebx
 004B7C5D    mov         ebx,eax
 004B7C5F    mov         eax,ebx
 004B7C61    push        esi
 004B7C62    mov         ecx,6C
 004B7C67    mov         edx,1
 004B7C6C    mov         esi,dword ptr [eax+4]
 004B7C6F    call        dword ptr [esi]
 004B7C71    mov         dword ptr [ebx+168],eax
 004B7C77    mov         dword ptr [eax],4B7000;_DF_.
 004B7C7D    xor         edx,edx
 004B7C7F    add         eax,3C
 004B7C82    xor         ecx,ecx
 004B7C84    mov         dword ptr [eax],ecx
 004B7C86    mov         dword ptr [eax-10],ecx
 004B7C89    xor         ecx,ecx
 004B7C8B    mov         dword ptr [eax+20],ecx
 004B7C8E    mov         dword ptr [eax+10],ecx
 004B7C91    inc         edx
 004B7C92    add         eax,4
 004B7C95    cmp         edx,4
>004B7C98    jl          004B7C82
 004B7C9A    pop         esi
 004B7C9B    pop         ebx
 004B7C9C    ret
*}
end;

Initialization
//004B7CE0
{*
 004B7CE0    push        ebp
 004B7CE1    mov         ebp,esp
 004B7CE3    push        0
 004B7CE5    push        0
 004B7CE7    xor         eax,eax
 004B7CE9    push        ebp
 004B7CEA    push        4B7D68
 004B7CEF    push        dword ptr fs:[eax]
 004B7CF2    mov         dword ptr fs:[eax],esp
 004B7CF5    sub         dword ptr ds:[5E1638],1
>004B7CFC    jae         004B7D4D
 004B7CFE    call        InitDefaults
 004B7D03    mov         eax,[004A4A00];TJPEGImage
 004B7D08    push        eax
 004B7D09    lea         edx,[ebp-4]
 004B7D0C    mov         eax,[005AE144];^sJPEGImageFile:TResStringRec
 004B7D11    call        LoadStr
 004B7D16    mov         ecx,dword ptr [ebp-4]
 004B7D19    mov         edx,4B7D7C;'jpeg'
 004B7D1E    mov         eax,[00424C0C];TPicture
 004B7D23    call        TPicture.RegisterFileFormat
 004B7D28    mov         eax,[004A4A00];TJPEGImage
 004B7D2D    push        eax
 004B7D2E    lea         edx,[ebp-8]
 004B7D31    mov         eax,[005AE144];^sJPEGImageFile:TResStringRec
 004B7D36    call        LoadStr
 004B7D3B    mov         ecx,dword ptr [ebp-8]
 004B7D3E    mov         edx,4B7D8C;'jpg'
 004B7D43    mov         eax,[00424C0C];TPicture
 004B7D48    call        TPicture.RegisterFileFormat
 004B7D4D    xor         eax,eax
 004B7D4F    pop         edx
 004B7D50    pop         ecx
 004B7D51    pop         ecx
 004B7D52    mov         dword ptr fs:[eax],edx
 004B7D55    push        4B7D6F
 004B7D5A    lea         eax,[ebp-8]
 004B7D5D    mov         edx,2
 004B7D62    call        @LStrArrayClr
 004B7D67    ret
>004B7D68    jmp         @HandleFinally
>004B7D6D    jmp         004B7D5A
 004B7D6F    pop         ecx
 004B7D70    pop         ecx
 004B7D71    pop         ebp
 004B7D72    ret
*}
Finalization
//004B7CA0
{*
 004B7CA0    push        ebp
 004B7CA1    mov         ebp,esp
 004B7CA3    xor         eax,eax
 004B7CA5    push        ebp
 004B7CA6    push        4B7CD7
 004B7CAB    push        dword ptr fs:[eax]
 004B7CAE    mov         dword ptr fs:[eax],esp
 004B7CB1    inc         dword ptr ds:[5E1638]
>004B7CB7    jne         004B7CC9
 004B7CB9    mov         edx,dword ptr ds:[4A4A00];TJPEGImage
 004B7CBF    mov         eax,[00424C0C];TPicture
 004B7CC4    call        TPicture.UnregisterGraphicClass
 004B7CC9    xor         eax,eax
 004B7CCB    pop         edx
 004B7CCC    pop         ecx
 004B7CCD    pop         ecx
 004B7CCE    mov         dword ptr fs:[eax],edx
 004B7CD1    push        4B7CDE
 004B7CD6    ret
>004B7CD7    jmp         @HandleFinally
>004B7CDC    jmp         004B7CD6
 004B7CDE    pop         ebp
 004B7CDF    ret
*}
end.