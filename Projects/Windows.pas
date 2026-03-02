//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Windows;

interface

uses
  SysUtils, Classes;

type
  .1 = (odSelected, odGrayed, odDisabled, odChecked, odFocused, odDefault, odHotLight, odInactive, odNoAccel, odNoFocusRect, odReserved1, odReserved2, odComboBoxEdit);
  TOwnerDrawState = set of .1;
    function RegCloseKey:Integer; stdcall;//00406A34
    function RegCreateKeyExA(lpSubKey:PAnsiChar; Reserved:DWORD; lpClass:PAnsiChar; dwOptions:DWORD; samDesired:DWORD; lpSecurityAttributes:PSecurityAttributes; var phkResult:HKEY; lpdwDisposition:PDWORD):Longint; stdcall;//00406A3C
    function RegFlushKey:Longint; stdcall;//00406A44
    function RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:DWORD; samDesired:DWORD; var phkResult:HKEY):Longint; stdcall;//00406A4C
    function RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;//00406A54
    function RegSetValueExA(lpValueName:PAnsiChar; Reserved:DWORD; dwType:DWORD; lpData:Pointer; cbData:DWORD):Longint; stdcall;//00406A5C
    function CloseHandle:Integer; stdcall;//00406A64
    function CompareStringA(dwCmpFlags:DWORD; lpString1:PAnsiChar; cchCount1:Integer; lpString2:PAnsiChar; cchCount2:Integer):Integer; stdcall;//00406A6C
    function CreateDirectoryA(lpSecurityAttributes:PSecurityAttributes):LongBool; stdcall;//00406A74
    function CreateEventA(bManualReset:LongBool; bInitialState:LongBool; lpName:PAnsiChar):THandle; stdcall;//00406A7C
    function CreateFileA(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;//00406A84
    function CreateFileMappingA(lpFileMappingAttributes:PSecurityAttributes; flProtect:DWORD; dwMaximumSizeHigh:DWORD; dwMaximumSizeLow:DWORD; lpName:PAnsiChar):THandle; stdcall;//00406A8C
    function CreateMutexA(bInitialOwner:LongBool; lpName:PAnsiChar):THandle; stdcall;//00406A94
    //procedure sub_00406A9C(?:?; ?:?; ?:?);//00406A9C
    function CreateThread(dwStackSize:DWORD; lpStartAddress:Pointer; lpParameter:Pointer; dwCreationFlags:DWORD; var lpThreadId:DWORD):THandle; stdcall;//00406ABC
    procedure DeleteCriticalSection; stdcall;//00406AC4
    procedure EnterCriticalSection; stdcall;//00406ACC
    function EnumCalendarInfoA(Locale:DWORD; Calendar:DWORD; CalType:DWORD):LongBool; stdcall;//00406AD4
    function FileTimeToDosDateTime(var lpFatDate:Word; var lpFatTime:Word):LongBool; stdcall;//00406ADC
    function FileTimeToLocalFileTime(var lpLocalFileTime:_FILETIME):LongBool; stdcall;//00406AE4
    procedure FindClose;//00406AEC
    function FindFirstFileA(var lpFindFileData:_WIN32_FIND_DATAA):THandle; stdcall;//00406AF4
    function FindResourceA(lpName:PAnsiChar; lpType:PAnsiChar):HRSRC; stdcall;//00406AFC
    function FormatMessageA(lpSource:Pointer; dwMessageId:DWORD; dwLanguageId:DWORD; lpBuffer:PAnsiChar; nSize:DWORD; Arguments:Pointer):DWORD; stdcall;//00406B04
    function FreeLibrary:LongBool; stdcall;//00406B0C
    function InterlockedExchange(B:Integer):Integer;//00406B14
    function FreeResource:LongBool; stdcall;//00406B1C
    function GetACP:LongWord;//00406B24
    function GetCPInfo(var lpCPInfo:_cpinfo):LongBool; stdcall;//00406B2C
    function GetCurrentProcessId:DWORD;//00406B34
    function GetCurrentThreadId:Cardinal;//00406B3C
    function GetDateFormatA(dwFlags:DWORD; lpDate:PSystemTime; lpFormat:PAnsiChar; lpDateStr:PAnsiChar; cchDate:Integer):Integer; stdcall;//00406B44
    function GetDiskFreeSpaceA(var lpSectorsPerCluster:DWORD; var lpBytesPerSector:DWORD; var lpNumberOfFreeClusters:DWORD; var lpTotalNumberOfClusters:DWORD):LongBool; stdcall;//00406B4C
    function GetFileAttributesA:DWORD; stdcall;//00406B54
    function GetFullPathNameA(nBufferLength:DWORD; lpBuffer:PAnsiChar; var lpFilePart:PAnsiChar):DWORD; stdcall;//00406B5C
    function GetLastError:Integer;//00406B64
    function GetLocalTime:TDateTime;//00406B6C
    function GetLocaleInfoA(LCType:DWORD; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;//00406B74
    function GetModuleFileNameA(lpFilename:PAnsiChar; nSize:DWORD):DWORD; stdcall;//00406B7C
    function GetModuleHandleA:HMODULE; stdcall;//00406B84
    function GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;//00406B8C
    function GetStdHandle:Integer; stdcall;//00406B94
    function GetStringTypeExA(dwInfoType:DWORD; lpSrcStr:PAnsiChar; cchSrc:Integer; var lpCharType:void ):LongBool; stdcall;//00406B9C
    procedure GetSystemInfo; stdcall;//00406BA4
    function GetTempFileNameA(lpPrefixString:PAnsiChar; uUnique:LongWord; lpTempFileName:PAnsiChar):LongWord; stdcall;//00406BAC
    function GetTempPathA(lpBuffer:PAnsiChar):DWORD; stdcall;//00406BB4
    function GetThreadLocale:Integer;//00406BBC
    function GetTickCount:Cardinal;//00406BC4
    function GetVersion:DWORD;//00406BCC
    function GetVersionExA:LongBool; stdcall;//00406BD4
    function GlobalAddAtomA:Word; stdcall;//00406BDC
    function GlobalAlloc(dwBytes:DWORD):THandle; stdcall;//00406BE4
    function GlobalDeleteAtom:Word; stdcall;//00406BEC
    function GlobalFindAtomA:Word; stdcall;//00406BF4
    function GlobalFree:THandle; stdcall;//00406BFC
    function GlobalLock:Pointer; stdcall;//00406C04
    function GlobalHandle:THandle; stdcall;//00406C0C
    procedure GlobalMemoryStatus; stdcall;//00406C14
    function GlobalReAlloc(dwBytes:DWORD; uFlags:LongWord):THandle; stdcall;//00406C1C
    function GlobalUnlock:LongBool; stdcall;//00406C24
    procedure InitializeCriticalSection; stdcall;//00406C2C
    procedure LeaveCriticalSection; stdcall;//00406C34
    function LoadLibraryA:HMODULE; stdcall;//00406C3C
    function LoadResource(hResInfo:HRSRC):THandle; stdcall;//00406C44
    function LockResource:Pointer; stdcall;//00406C4C
    function MapViewOfFile(dwDesiredAccess:DWORD; dwFileOffsetHigh:DWORD; dwFileOffsetLow:DWORD; dwNumberOfBytesToMap:DWORD):Pointer; stdcall;//00406C54
    function MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;//00406C5C
    function QueryPerformanceCounter:LongBool; stdcall;//00406C64
    function QueryPerformanceFrequency:LongBool; stdcall;//00406C6C
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:Cardinal; var lpNumberOfBytesRead:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//00406C74
    function ResetEvent:LongBool; stdcall;//00406C7C
    function SetEndOfFile:LongBool; stdcall;//00406C84
    function SetErrorMode:LongWord; stdcall;//00406C8C
    function SetEvent:LongBool; stdcall;//00406C94
    function SetFilePointer(Distance:Integer; DistanceHigh:Pointer; MoveMethod:Integer):Integer; stdcall;//00406C9C
    function SetThreadLocale:LongBool; stdcall;//00406CA4
    function SizeofResource(hResInfo:HRSRC):DWORD; stdcall;//00406CAC
    procedure Sleep; stdcall;//00406CB4
    function UnmapViewOfFile:LongBool; stdcall;//00406CBC
    function VirtualAlloc(dwSize:DWORD; flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;//00406CC4
    function VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;//00406CCC
    function VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;//00406CD4
    function WaitForSingleObject(dwMilliseconds:DWORD):DWORD; stdcall;//00406CDC
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//00406CE4
    function lstrcpyA(lpString2:PAnsiChar):PAnsiChar; stdcall;//00406CEC
    function GetFileVersionInfoA(dwHandle:DWORD; dwLen:DWORD; lpData:Pointer):LongBool; stdcall;//00406CF4
    function GetFileVersionInfoSizeA(var lpdwHandle:DWORD):DWORD; stdcall;//00406CFC
    function VerQueryValueA(lpSubBlock:PAnsiChar; var lplpBuffer:Pointer; var puLen:LongWord):LongBool; stdcall;//00406D04
    function BitBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; Rop:DWORD):LongBool; stdcall;//00406D0C
    function ChoosePixelFormat(p2:PPixelFormatDescriptor):Integer; stdcall;//00406D14
    function CopyEnhMetaFileA(p2:PAnsiChar):HENHMETAFILE; stdcall;//00406D1C
    function CreateBitmap(Height:Integer; Planes:Longint; BitCount:Longint; Bits:Pointer):HBITMAP; stdcall;//00406D24
    function CreateBrushIndirect:HBRUSH; stdcall;//00406D2C
    function CreateCompatibleBitmap(Width:Integer; Height:Integer):HBITMAP; stdcall;//00406D34
    function CreateCompatibleDC:HDC; stdcall;//00406D3C
    function CreateDIBSection(const p2:tagBITMAPINFO; p3:LongWord; var p4:Pointer; p5:THandle; p6:DWORD):HBITMAP; stdcall;//00406D44
    function CreateDIBitmap(var InfoHeader:tagBITMAPINFOHEADER; dwUsage:DWORD; InitBits:PChar; var InitInfo:tagBITMAPINFO; wUsage:LongWord):HBITMAP; stdcall;//00406D4C
    function CreateFontIndirectA:HFONT; stdcall;//00406D54
    function CreateHalftonePalette:HPALETTE; stdcall;//00406D5C
    function CreatePalette:HPALETTE; stdcall;//00406D64
    function CreatePenIndirect:HPEN; stdcall;//00406D6C
    function CreateSolidBrush:HBRUSH; stdcall;//00406D74
    function DeleteDC:LongBool; stdcall;//00406D7C
    function DeleteEnhMetaFile:LongBool; stdcall;//00406D84
    function DeleteObject:LongBool; stdcall;//00406D8C
    function DescribePixelFormat(p2:Integer; p3:LongWord; var p4:tagPIXELFORMATDESCRIPTOR):LongBool; stdcall;//00406D94
    function ExcludeClipRect(LeftRect:Integer; TopRect:Integer; RightRect:Integer; BottomRect:Integer):Integer; stdcall;//00406D9C
    function GdiFlush:LongBool;//00406DA4
    function GetBitmapBits(Count:Longint; Bits:Pointer):Longint; stdcall;//00406DAC
    function GetBrushOrgEx(var lppt:TPoint):LongBool; stdcall;//00406DB4
    function GetClipBox(var Rect:TRect):Integer; stdcall;//00406DBC
    function GetCurrentPositionEx(Point:PPoint):LongBool; stdcall;//00406DC4
    function GetDCOrgEx(var Origin:TPoint):LongBool; stdcall;//00406DCC
    function GetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadStructs:void ):LongWord; stdcall;//00406DD4
    function GetDIBits(Bitmap:HBITMAP; StartScan:LongWord; NumScans:LongWord; Bits:Pointer; var BitInfo:tagBITMAPINFO; Usage:LongWord):Integer; stdcall;//00406DDC
    function GetDeviceCaps(Index:Integer):Integer; stdcall;//00406DE4
    function GetEnhMetaFileBits(p2:LongWord; p3:PByte):LongWord; stdcall;//00406DEC
    function GetEnhMetaFileHeader(p2:LongWord; p3:PEnhMetaHeader):LongWord; stdcall;//00406DF4
    function GetEnhMetaFilePaletteEntries(p2:LongWord; p3:Pointer):LongWord; stdcall;//00406DFC
    function GetObjectA(p2:Integer; p3:Pointer):Integer; stdcall;//00406E04
    function GetObjectType:DWORD; stdcall;//00406E0C
    function GetPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;//00406E14
    function GetPixel(X:Integer; Y:Integer):DWORD; stdcall;//00406E1C
    function GetPixelFormat:Integer; stdcall;//00406E24
    function GetStockObject:HGDIOBJ; stdcall;//00406E2C
    function GetSystemPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;//00406E34
    function GetTextExtentPoint32A(Str:PAnsiChar; Count:Integer; var Size:TSize):LongBool; stdcall;//00406E3C
    function GetTextExtentPointA(Str:PAnsiChar; Count:Integer; var Size:TSize):LongBool; stdcall;//00406E44
    function GetTextMetricsA(var TM:tagTEXTMETRICA):LongBool; stdcall;//00406E4C
    function GetWinMetaFileBits(p2:LongWord; p3:PByte; p4:Integer; p5:HDC):LongWord; stdcall;//00406E54
    function GetWindowOrgEx(var Point:TPoint):LongBool; stdcall;//00406E5C
    function IntersectClipRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):Integer; stdcall;//00406E64
    function LineTo(X:Integer; Y:Integer):LongBool; stdcall;//00406E6C
    function MaskBlt(XDest:Integer; YDest:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XScr:Integer; YScr:Integer; Mask:HBITMAP; xMask:Integer; yMask:Integer; Rop:DWORD):LongBool; stdcall;//00406E74
    function MoveToEx(p2:Integer; p3:Integer; p4:PPoint):LongBool; stdcall;//00406E7C
    function PatBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; Rop:DWORD):LongBool; stdcall;//00406E84
    function PlayEnhMetaFile(p2:HENHMETAFILE; const p3:TRect):LongBool; stdcall;//00406E8C
    function RealizePalette:LongWord; stdcall;//00406E94
    function RectVisible(const Rect:TRect):LongBool; stdcall;//00406E9C
    function Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;//00406EA4
    function RestoreDC(SavedDC:Integer):LongBool; stdcall;//00406EAC
    function SaveDC:Integer; stdcall;//00406EB4
    function SelectObject(p2:HGDIOBJ):HGDIOBJ; stdcall;//00406EBC
    function SelectPalette(Palette:HPALETTE; ForceBackground:LongBool):HPALETTE; stdcall;//00406EC4
    function SetBkColor(Color:DWORD):DWORD; stdcall;//00406ECC
    function SetBkMode(BkMode:Integer):Integer; stdcall;//00406ED4
    function SetBrushOrgEx(X:Integer; Y:Integer; PrevPt:PPoint):LongBool; stdcall;//00406EDC
    function SetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadSTructs:void ):LongWord; stdcall;//00406EE4
    function SetEnhMetaFileBits(p2:PChar):HENHMETAFILE; stdcall;//00406EEC
    function SetPixel(X:Integer; Y:Integer; Color:DWORD):DWORD; stdcall;//00406EF4
    function SetPixelFormat(PixelFormat:Integer; FormatDef:PPixelFormatDescriptor):LongBool; stdcall;//00406EFC
    function SetROP2(p2:Integer):Integer; stdcall;//00406F04
    function SetStretchBltMode(StretchMode:Integer):Integer; stdcall;//00406F0C
    function SetTextColor(Color:DWORD):DWORD; stdcall;//00406F14
    function SetViewportOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;//00406F1C
    function SetWinMetaFileBits(p2:PChar; p3:HDC; const p4:tagMETAFILEPICT):HENHMETAFILE; stdcall;//00406F24
    function SetWindowOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;//00406F2C
    function StretchBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; SrcWidth:Integer; SrcHeight:Integer; Rop:DWORD):LongBool; stdcall;//00406F34
    function SwapBuffers:LongBool; stdcall;//00406F3C
    function UnrealizeObject:LongBool; stdcall;//00406F44
    function ActivateKeyboardLayout(Flags:LongWord):HKL; stdcall;//00406F4C
    function AdjustWindowRectEx(dwStyle:DWORD; bMenu:LongBool; dwExStyle:DWORD):LongBool; stdcall;//00406F54
    function CharLowerA:PAnsiChar; stdcall;//00406F5C
    function BeginPaint(var lpPaint:tagPAINTSTRUCT):HDC; stdcall;//00406F64
    function CallNextHookEx(nCode:Integer; wParam:Longint; lParam:Longint):Longint; stdcall;//00406F6C
    function CallWindowProcA(hWnd:HWND; Msg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;//00406F74
    function CharLowerBuffA(cchLength:DWORD):DWORD; stdcall;//00406F7C
    function CharNextA:PAnsiChar; stdcall;//00406F84
    function CharToOemA(lpszDst:PAnsiChar):LongBool; stdcall;//00406F8C
    function CharUpperBuffA(cchLength:DWORD):DWORD; stdcall;//00406F94
    function CheckMenuItem(uIDCheckItem:LongWord; uCheck:LongWord):DWORD; stdcall;//00406F9C
    function ClientToScreen(var lpPoint:TPoint):LongBool; stdcall;//00406FA4
    function CloseClipboard:LongBool;//00406FAC
    function CreateIcon(nWidth:Integer; nHeight:Integer; cPlanes:Byte; cBitsPixel:Byte; lpbANDbits:Pointer; lpbXORbits:Pointer):HICON; stdcall;//00406FB4
    function CreateMenu(ParentMenu:AnsiString; FunctionName:AnsiString; AHeight:Integer; AWidth:Integer; AOnMouseOutEvent:AnsiString; AOnMouseOverEvent:AnsiString; AOnClickEvent:AnsiString; AHighLightTextColor:TColor; ATextColor:TColor; AHighlightColor:TColor; AColor:TColor; AImage2:AnsiString; AImage1:AnsiString; Target:AnsiString; LinkAddr:AnsiString):AnsiString;//00406FBC
    function CreatePopupMenu:HMENU;//00406FC4
    function DefFrameProcA(hWndMDIClient:HWND; uMsg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;//00406FCC
    function DefMDIChildProcA(uMsg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;//00406FD4
    function DefWindowProcA(Msg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;//00406FDC
    function DeleteMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;//00406FE4
    function DestroyCursor:LongBool; stdcall;//00406FEC
    function DestroyIcon:LongBool; stdcall;//00406FF4
    function DestroyMenu:LongBool; stdcall;//00406FFC
    function DestroyWindow:LongBool; stdcall;//00407004
    function DispatchMessageA:Longint; stdcall;//0040700C
    function DrawEdge(var qrc:TRect; edge:LongWord; grfFlags:LongWord):LongBool; stdcall;//00407014
    function DrawFrameControl(const Rect:TRect; uType:LongWord; uState:LongWord):LongBool; stdcall;//0040701C
    function DrawIcon(X:Integer; Y:Integer; hIcon:HICON):LongBool; stdcall;//00407024
    function DrawIconEx(xLeft:Integer; yTop:Integer; hIcon:HICON; cxWidth:Integer; cyWidth:Integer; istepIfAniCur:LongWord; hbrFlickerFreeDraw:HBRUSH; diFlags:LongWord):LongBool; stdcall;//0040702C
    function DrawMenuBar:LongBool; stdcall;//00407034
    function DrawTextA(lpString:PAnsiChar; nCount:Integer; var lpRect:TRect; uFormat:LongWord):Integer; stdcall;//0040703C
    function EmptyClipboard:LongBool;//00407044
    function EnableMenuItem(uIDEnableItem:LongWord; uEnable:LongWord):LongBool; stdcall;//0040704C
    function EnableScrollBar(wSBflags:LongWord; wArrows:LongWord):LongBool; stdcall;//00407054
    function EnableWindow(bEnable:LongBool):LongBool; stdcall;//0040705C
    function EndPaint(const lpPaint:tagPAINTSTRUCT):LongBool; stdcall;//00407064
    function EnumThreadWindows(lpfn:Pointer; lParam:Longint):LongBool; stdcall;//0040706C
    function EnumWindows(lParam:Longint):LongBool; stdcall;//00407074
    function EqualRect(const lprc2:TRect):LongBool; stdcall;//0040707C
    function FillRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;//00407084
    function FindWindowA(lpWindowName:PAnsiChar):HWND; stdcall;//0040708C
    function FrameRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;//00407094
    function GetActiveWindow:HWND;//0040709C
    function GetCapture:HWND;//004070A4
    function GetClassInfoA(lpClassName:PAnsiChar; var lpWndClass:tagWNDCLASSA):LongBool; stdcall;//004070AC
    function GetClassNameA(lpClassName:PAnsiChar; nMaxCount:Integer):Integer; stdcall;//004070B4
    function GetClientRect(var lpRect:TRect):LongBool; stdcall;//004070BC
    function GetClipboardData:THandle; stdcall;//004070C4
    function GetCursor:HICON;//004070CC
    function GetCursorPos:LongBool; stdcall;//004070D4
    function GetDC:HDC; stdcall;//004070DC
    function GetDCEx(hrgnClip:HRGN; flags:DWORD):HDC; stdcall;//004070E4
    function GetDesktopWindow:HWND;//004070EC
    function GetFocus:HWND;//004070F4
    function GetForegroundWindow:HWND;//004070FC
    function GetIconInfo(var piconinfo:_ICONINFO):LongBool; stdcall;//00407104
    function GetKeyNameTextA(lpString:PAnsiChar; nSize:Integer):Integer; stdcall;//0040710C
    function GetKeyState:Smallint; stdcall;//00407114
    function GetKeyboardLayout:HKL; stdcall;//0040711C
    function GetKeyboardLayoutList(var List:void ):LongWord; stdcall;//00407124
    function GetKeyboardState:LongBool; stdcall;//0040712C
    function GetLastActivePopup:HWND; stdcall;//00407134
    function GetMenu:HMENU; stdcall;//0040713C
    function GetMenuItemCount:Integer; stdcall;//00407144
    function GetMenuItemID(nPos:Integer):LongWord; stdcall;//0040714C
    function GetMenuItemInfoA(p2:LongWord; p3:LongBool; var p4:tagMENUITEMINFOA):LongBool; stdcall;//00407154
    function GetMenuState(uId:LongWord; uFlags:LongWord):LongWord; stdcall;//0040715C
    function GetMenuStringA(uIDItem:LongWord; lpString:PAnsiChar; nMaxCount:Integer; uFlag:LongWord):Integer; stdcall;//00407164
    function GetMessageTime:Longint;//0040716C
    function GetWindow(uCmd:LongWord):HWND; stdcall;//00407174
    function GetParent:HWND; stdcall;//0040717C
    function GetPropA(lpString:PAnsiChar):THandle; stdcall;//00407184
    function GetScrollInfo(BarFlag:Integer; var ScrollInfo:tagSCROLLINFO):LongBool; stdcall;//0040718C
    function GetScrollPos(nBar:Integer):Integer; stdcall;//00407194
    function GetScrollRange(nBar:Integer; var lpMinPos:Integer; var lpMaxPos:Integer):LongBool; stdcall;//0040719C
    function GetSubMenu(nPos:Integer):HMENU; stdcall;//004071A4
    function GetSysColor:DWORD; stdcall;//004071AC
    function GetSysColorBrush:HBRUSH; stdcall;//004071B4
    function GetSystemMenu(bRevert:LongBool):HMENU; stdcall;//004071BC
    function GetSystemMetrics:Integer; stdcall;//004071C4
    function GetTopWindow:HWND; stdcall;//004071CC
    function GetWindow(uCmd:LongWord):HWND; stdcall;//004071D4
    function GetWindowDC:HDC; stdcall;//004071DC
    function GetWindowLongA(nIndex:Integer):Longint; stdcall;//004071E4
    function GetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;//004071EC
    function GetWindowRect(var lpRect:TRect):LongBool; stdcall;//004071F4
    function GetWindowTextA(lpString:PAnsiChar; nMaxCount:Integer):Integer; stdcall;//004071FC
    function GetWindowThreadProcessId(lpdwProcessId:Pointer):DWORD; stdcall;//00407204
    function GetWindowThreadProcessId(lpdwProcessId:Pointer):DWORD; stdcall;//0040720C
    function InflateRect(dx:Integer; dy:Integer):LongBool; stdcall;//00407214
    function InsertMenuA(uPosition:LongWord; uFlags:LongWord; uIDNewItem:LongWord; lpNewItem:PAnsiChar):LongBool; stdcall;//0040721C
    function InsertMenuItemA(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;//00407224
    function IntersectRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;//0040722C
    function InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;//00407234
    function IsChild(hWnd:HWND):LongBool; stdcall;//0040723C
    function IsDialogMessageA(var lpMsg:tagMSG):LongBool; stdcall;//00407244
    function IsIconic:LongBool; stdcall;//0040724C
    function IsRectEmpty:LongBool; stdcall;//00407254
    function IsWindow:LongBool; stdcall;//0040725C
    function IsWindowEnabled:LongBool; stdcall;//00407264
    function IsWindowVisible:LongBool; stdcall;//0040726C
    function IsZoomed:LongBool; stdcall;//00407274
    function KillTimer(uIDEvent:LongWord):LongBool; stdcall;//0040727C
    function LoadBitmapA(lpBitmapName:PAnsiChar):HBITMAP; stdcall;//00407284
    function LoadCursorA(lpCursorName:PAnsiChar):HICON; stdcall;//0040728C
    function LoadIconA(lpIconName:PAnsiChar):HICON; stdcall;//00407294
    function LoadKeyboardLayoutA(Flags:LongWord):HKL; stdcall;//0040729C
    function LoadStringA(uID:LongWord; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;//004072A4
    function MapVirtualKeyA(uMapType:LongWord):LongWord; stdcall;//004072AC
    function MapWindowPoints(hWndTo:HWND; var lpPoints:void ; cPoints:LongWord):Integer; stdcall;//004072B4
    function MessageBeep:LongBool; stdcall;//004072BC
    function MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:LongWord):Integer; stdcall;//004072C4
    function OemToCharA(lpszDst:PAnsiChar):LongBool; stdcall;//004072CC
    function OffsetRect(DX:Integer; DY:Integer):Boolean;//004072D4
    function OpenClipboard:LongBool; stdcall;//004072DC
    function PeekMessageA(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;//004072E4
    function PostMessageA(Msg:LongWord; wParam:Longint; lParam:Longint):LongBool; stdcall;//004072EC
    procedure PostQuitMessage; stdcall;//004072F4
    function PtInRect(const P:TPoint):Boolean;//004072FC
    function RedrawWindow(lprcUpdate:PRect; hrgnUpdate:HRGN; flags:LongWord):LongBool; stdcall;//00407304
    function RegisterClassA:Word; stdcall;//0040730C
    function RegisterClipboardFormatA:LongWord; stdcall;//00407314
    function RegisterWindowMessageA:LongWord; stdcall;//0040731C
    function ReleaseCapture:LongBool;//00407324
    function ReleaseDC(hDC:HDC):Integer; stdcall;//0040732C
    function RemoveMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;//00407334
    function RemovePropA(lpString:PAnsiChar):THandle; stdcall;//0040733C
    function ScreenToClient(var lpPoint:TPoint):LongBool; stdcall;//00407344
    function ScrollWindow(XAmount:Integer; YAmount:Integer; Rect:PRect; ClipRect:PRect):LongBool; stdcall;//0040734C
    function SendMessageA(Msg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;//00407354
    function SetActiveWindow:HWND; stdcall;//0040735C
    function SetCapture:HWND; stdcall;//00407364
    function SetClassLongA(nIndex:Integer; dwNewLong:Longint):DWORD; stdcall;//0040736C
    function SetClipboardData(hMem:THandle):THandle; stdcall;//00407374
    function SetCursor:HICON; stdcall;//0040737C
    function SetCursorPos(Y:Integer):LongBool; stdcall;//00407384
    function SetFocus:HWND; stdcall;//0040738C
    function SetForegroundWindow:LongBool; stdcall;//00407394
    function SetMenu(hMenu:HMENU):LongBool; stdcall;//0040739C
    function SetMenuItemInfoA(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;//004073A4
    function SetParent(hWndNewParent:HWND):HWND; stdcall;//004073AC
    function SetPropA(lpString:PAnsiChar; hData:THandle):LongBool; stdcall;//004073B4
    function SetRect(xLeft:Integer; yTop:Integer; xRight:Integer; yBottom:Integer):LongBool; stdcall;//004073BC
    function SetScrollInfo(BarFlag:Integer; const ScrollInfo:tagSCROLLINFO; Redraw:LongBool):Integer; stdcall;//004073C4
    function SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:LongBool):Integer; stdcall;//004073CC
    function SetScrollRange(nBar:Integer; nMinPos:Integer; nMaxPos:Integer; bRedraw:LongBool):LongBool; stdcall;//004073D4
    function SetTimer(nIDEvent:LongWord; uElapse:LongWord; lpTimerFunc:Pointer):LongWord; stdcall;//004073DC
    function SetWindowLongA(nIndex:Integer; dwNewLong:Longint):Longint; stdcall;//004073E4
    function SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;//004073EC
    function SetWindowPos(hWndInsertAfter:HWND; X:Integer; Y:Integer; cx:Integer; cy:Integer; uFlags:LongWord):LongBool; stdcall;//004073F4
    function SetWindowTextA(lpString:PAnsiChar):LongBool; stdcall;//004073FC
    function SetWindowsHookExA(lpfn:TFNHookProc; hmod:HINST; dwThreadId:DWORD):HHOOK; stdcall;//00407404
    function ShowCursor:Integer; stdcall;//0040740C
    function ShowOwnedPopups(fShow:LongBool):LongBool; stdcall;//00407414
    function ShowScrollBar(wBar:Integer; bShow:LongBool):LongBool; stdcall;//0040741C
    function ShowWindow(nCmdShow:Integer):LongBool; stdcall;//00407424
    function SystemParametersInfoA(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;//0040742C
    function TrackPopupMenu(uFlags:LongWord; x:Integer; y:Integer; nReserved:Integer; hWnd:HWND; prcRect:PRect):LongBool; stdcall;//00407434
    function TranslateMDISysAccel(const lpMsg:tagMSG):LongBool; stdcall;//0040743C
    function TranslateMessage:LongBool; stdcall;//00407444
    function UnhookWindowsHookEx:LongBool; stdcall;//0040744C
    function UnregisterClassA(hInstance:HINST):LongBool; stdcall;//00407454
    function UpdateWindow:LongBool; stdcall;//0040745C
    function WaitMessage:LongBool;//00407464
    function WinHelpA(lpszHelp:PAnsiChar; uCommand:LongWord; dwData:DWORD):LongBool; stdcall;//0040746C
    function WindowFromDC:HWND; stdcall;//00407474
    function WindowFromPoint:HWND; stdcall;//0040747C
    function MakeLong(a:Word; b:Word):Longint;//00407484
    function GetCurrentTime:Longint;//00407490
    function UnlockResource(hResData:THandle):LongBool;//00407498
    function GlobalAllocPtr(Flags:Integer; Bytes:Longint):Pointer;//0040749C
    function GlobalReAllocPtr(P:Pointer; Bytes:Longint; Flags:Integer):Pointer;//004074AC
    function GlobalFreePtr(P:Pointer):THandle;//004074C8
    function MakeROP4(fore:DWORD; back:DWORD):DWORD;//004074DC
    function RGB(r:Byte; g:Byte; b:Byte):DWORD;//004074E8
    //function sub_00407504:?;//00407504
    //function sub_00407508(?:TColor):?;//00407508
    //function sub_0040750C(?:TColor):?;//0040750C
    function SmallPointToPoint(const P:TSmallPoint):TPoint;//00407510
    function PointToSmallPoint(const P:TPoint):TSmallPoint;//00407524
    function MakeWParam(l:Word; h:Word):Longint;//0040753C
    function CreateWindowExA(dwExStyle:DWORD; lpClassName:PAnsiChar; lpParam:Pointer; hInstance:HINST; hMenu:HMENU; hWndParent:HWND; nHeight:Integer; nWidth:Integer; Y:Integer; X:Integer; dwStyle:DWORD):HWND;//00407544
    function CreateWindowEx(dwExStyle:DWORD; lpClassName:PChar; lpWindowName:PChar; dwStyle:DWORD; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;//0040754C
    function CreateWindow(lpClassName:PChar; lpWindowName:PChar; dwStyle:DWORD; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;//004075A4
    function HwndMSWheel(var puiMsh_MsgMouseWheel:LongWord; var puiMsh_Msg3DSupport:LongWord; var puiMsh_MsgScrollLines:LongWord; var pf3DSupport:LongBool; var piScrollLines:Integer):HWND;//004075FC

implementation

//00406A34
function advapi32.RegCloseKey:Integer; stdcall;
begin
{*
 00406A34    jmp         dword ptr ds:[608278]
*}
end;

//00406A3C
function advapi32.RegCreateKeyExA(lpSubKey:PAnsiChar; Reserved:DWORD; lpClass:PAnsiChar; dwOptions:DWORD; samDesired:DWORD; lpSecurityAttributes:PSecurityAttributes; var phkResult:HKEY; lpdwDisposition:PDWORD):Longint; stdcall;
begin
{*
 00406A3C    jmp         dword ptr ds:[608274]
*}
end;

//00406A44
function advapi32.RegFlushKey:Longint; stdcall;
begin
{*
 00406A44    jmp         dword ptr ds:[608270]
*}
end;

//00406A4C
function advapi32.RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:DWORD; samDesired:DWORD; var phkResult:HKEY):Longint; stdcall;
begin
{*
 00406A4C    jmp         dword ptr ds:[60826C]
*}
end;

//00406A54
function advapi32.RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;
begin
{*
 00406A54    jmp         dword ptr ds:[608268]
*}
end;

//00406A5C
function advapi32.RegSetValueExA(lpValueName:PAnsiChar; Reserved:DWORD; dwType:DWORD; lpData:Pointer; cbData:DWORD):Longint; stdcall;
begin
{*
 00406A5C    jmp         dword ptr ds:[608264]
*}
end;

//00406A64
function KERNEL32.CloseHandle:Integer; stdcall;
begin
{*
 00406A64    jmp         dword ptr ds:[6083B4]
*}
end;

//00406A6C
function KERNEL32.CompareStringA(dwCmpFlags:DWORD; lpString1:PAnsiChar; cchCount1:Integer; lpString2:PAnsiChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 00406A6C    jmp         dword ptr ds:[6083B0]
*}
end;

//00406A74
function KERNEL32.CreateDirectoryA(lpSecurityAttributes:PSecurityAttributes):LongBool; stdcall;
begin
{*
 00406A74    jmp         dword ptr ds:[6083AC]
*}
end;

//00406A7C
function KERNEL32.CreateEventA(bManualReset:LongBool; bInitialState:LongBool; lpName:PAnsiChar):THandle; stdcall;
begin
{*
 00406A7C    jmp         dword ptr ds:[6083A8]
*}
end;

//00406A84
function KERNEL32.CreateFileA(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;
begin
{*
 00406A84    jmp         dword ptr ds:[6083A4]
*}
end;

//00406A8C
function KERNEL32.CreateFileMappingA(lpFileMappingAttributes:PSecurityAttributes; flProtect:DWORD; dwMaximumSizeHigh:DWORD; dwMaximumSizeLow:DWORD; lpName:PAnsiChar):THandle; stdcall;
begin
{*
 00406A8C    jmp         dword ptr ds:[6083A0]
*}
end;

//00406A94
function KERNEL32.CreateMutexA(bInitialOwner:LongBool; lpName:PAnsiChar):THandle; stdcall;
begin
{*
 00406A94    jmp         dword ptr ds:[60839C]
*}
end;

//00406A9C
{*procedure sub_00406A9C(?:?; ?:?; ?:?);
begin
 00406A9C    push        ebp
 00406A9D    mov         ebp,esp
 00406A9F    mov         eax,dword ptr [ebp+10]
 00406AA2    push        eax
 00406AA3    cmp         dword ptr [ebp+0C],1
 00406AA7    sbb         eax,eax
 00406AA9    inc         eax
 00406AAA    and         eax,7F
 00406AAD    push        eax
 00406AAE    mov         eax,dword ptr [ebp+8]
 00406AB1    push        eax
 00406AB2    call        KERNEL32.CreateMutexA
 00406AB7    pop         ebp
 00406AB8    ret         0C
end;*}

//00406ABC
function KERNEL32.CreateThread(dwStackSize:DWORD; lpStartAddress:Pointer; lpParameter:Pointer; dwCreationFlags:DWORD; var lpThreadId:DWORD):THandle; stdcall;
begin
{*
 00406ABC    jmp         dword ptr ds:[608398]
*}
end;

//00406AC4
procedure KERNEL32.DeleteCriticalSection; stdcall;
begin
{*
 00406AC4    jmp         dword ptr ds:[608394]
*}
end;

//00406ACC
procedure KERNEL32.EnterCriticalSection; stdcall;
begin
{*
 00406ACC    jmp         dword ptr ds:[608390]
*}
end;

//00406AD4
function KERNEL32.EnumCalendarInfoA(Locale:DWORD; Calendar:DWORD; CalType:DWORD):LongBool; stdcall;
begin
{*
 00406AD4    jmp         dword ptr ds:[60838C]
*}
end;

//00406ADC
function KERNEL32.FileTimeToDosDateTime(var lpFatDate:Word; var lpFatTime:Word):LongBool; stdcall;
begin
{*
 00406ADC    jmp         dword ptr ds:[608388]
*}
end;

//00406AE4
function KERNEL32.FileTimeToLocalFileTime(var lpLocalFileTime:_FILETIME):LongBool; stdcall;
begin
{*
 00406AE4    jmp         dword ptr ds:[608384]
*}
end;

//00406AEC
procedure KERNEL32.FindClose;
begin
{*
 00406AEC    jmp         dword ptr ds:[608380]
*}
end;

//00406AF4
function KERNEL32.FindFirstFileA(var lpFindFileData:_WIN32_FIND_DATAA):THandle; stdcall;
begin
{*
 00406AF4    jmp         dword ptr ds:[60837C]
*}
end;

//00406AFC
function KERNEL32.FindResourceA(lpName:PAnsiChar; lpType:PAnsiChar):HRSRC; stdcall;
begin
{*
 00406AFC    jmp         dword ptr ds:[608378]
*}
end;

//00406B04
function KERNEL32.FormatMessageA(lpSource:Pointer; dwMessageId:DWORD; dwLanguageId:DWORD; lpBuffer:PAnsiChar; nSize:DWORD; Arguments:Pointer):DWORD; stdcall;
begin
{*
 00406B04    jmp         dword ptr ds:[608374]
*}
end;

//00406B0C
function KERNEL32.FreeLibrary:LongBool; stdcall;
begin
{*
 00406B0C    jmp         dword ptr ds:[608370]
*}
end;

//00406B14
function KERNEL32.InterlockedExchange(B:Integer):Integer;
begin
{*
 00406B14    jmp         dword ptr ds:[60836C]
*}
end;

//00406B1C
function KERNEL32.FreeResource:LongBool; stdcall;
begin
{*
 00406B1C    jmp         dword ptr ds:[608368]
*}
end;

//00406B24
function KERNEL32.GetACP:LongWord;
begin
{*
 00406B24    jmp         dword ptr ds:[608364]
*}
end;

//00406B2C
function KERNEL32.GetCPInfo(var lpCPInfo:_cpinfo):LongBool; stdcall;
begin
{*
 00406B2C    jmp         dword ptr ds:[608360]
*}
end;

//00406B34
function KERNEL32.GetCurrentProcessId:DWORD;
begin
{*
 00406B34    jmp         dword ptr ds:[60835C]
*}
end;

//00406B3C
function KERNEL32.GetCurrentThreadId:Cardinal;
begin
{*
 00406B3C    jmp         dword ptr ds:[608358]
*}
end;

//00406B44
function KERNEL32.GetDateFormatA(dwFlags:DWORD; lpDate:PSystemTime; lpFormat:PAnsiChar; lpDateStr:PAnsiChar; cchDate:Integer):Integer; stdcall;
begin
{*
 00406B44    jmp         dword ptr ds:[608354]
*}
end;

//00406B4C
function KERNEL32.GetDiskFreeSpaceA(var lpSectorsPerCluster:DWORD; var lpBytesPerSector:DWORD; var lpNumberOfFreeClusters:DWORD; var lpTotalNumberOfClusters:DWORD):LongBool; stdcall;
begin
{*
 00406B4C    jmp         dword ptr ds:[608350]
*}
end;

//00406B54
function KERNEL32.GetFileAttributesA:DWORD; stdcall;
begin
{*
 00406B54    jmp         dword ptr ds:[60834C]
*}
end;

//00406B5C
function KERNEL32.GetFullPathNameA(nBufferLength:DWORD; lpBuffer:PAnsiChar; var lpFilePart:PAnsiChar):DWORD; stdcall;
begin
{*
 00406B5C    jmp         dword ptr ds:[608348]
*}
end;

//00406B64
function KERNEL32.GetLastError:Integer;
begin
{*
 00406B64    jmp         dword ptr ds:[608344]
*}
end;

//00406B6C
function KERNEL32.GetLocalTime:TDateTime;
begin
{*
 00406B6C    jmp         dword ptr ds:[608340]
*}
end;

//00406B74
function KERNEL32.GetLocaleInfoA(LCType:DWORD; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;
begin
{*
 00406B74    jmp         dword ptr ds:[60833C]
*}
end;

//00406B7C
function KERNEL32.GetModuleFileNameA(lpFilename:PAnsiChar; nSize:DWORD):DWORD; stdcall;
begin
{*
 00406B7C    jmp         dword ptr ds:[608338]
*}
end;

//00406B84
function KERNEL32.GetModuleHandleA:HMODULE; stdcall;
begin
{*
 00406B84    jmp         dword ptr ds:[608334]
*}
end;

//00406B8C
function KERNEL32.GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;
begin
{*
 00406B8C    jmp         dword ptr ds:[608330]
*}
end;

//00406B94
function KERNEL32.GetStdHandle:Integer; stdcall;
begin
{*
 00406B94    jmp         dword ptr ds:[60832C]
*}
end;

//00406B9C
function KERNEL32.GetStringTypeExA(dwInfoType:DWORD; lpSrcStr:PAnsiChar; cchSrc:Integer; var lpCharType:void ):LongBool; stdcall;
begin
{*
 00406B9C    jmp         dword ptr ds:[608328]
*}
end;

//00406BA4
procedure KERNEL32.GetSystemInfo; stdcall;
begin
{*
 00406BA4    jmp         dword ptr ds:[608324]
*}
end;

//00406BAC
function KERNEL32.GetTempFileNameA(lpPrefixString:PAnsiChar; uUnique:LongWord; lpTempFileName:PAnsiChar):LongWord; stdcall;
begin
{*
 00406BAC    jmp         dword ptr ds:[608320]
*}
end;

//00406BB4
function KERNEL32.GetTempPathA(lpBuffer:PAnsiChar):DWORD; stdcall;
begin
{*
 00406BB4    jmp         dword ptr ds:[60831C]
*}
end;

//00406BBC
function KERNEL32.GetThreadLocale:Integer;
begin
{*
 00406BBC    jmp         dword ptr ds:[608318]
*}
end;

//00406BC4
function KERNEL32.GetTickCount:Cardinal;
begin
{*
 00406BC4    jmp         dword ptr ds:[608314]
*}
end;

//00406BCC
function KERNEL32.GetVersion:DWORD;
begin
{*
 00406BCC    jmp         dword ptr ds:[608310]
*}
end;

//00406BD4
function KERNEL32.GetVersionExA:LongBool; stdcall;
begin
{*
 00406BD4    jmp         dword ptr ds:[60830C]
*}
end;

//00406BDC
function KERNEL32.GlobalAddAtomA:Word; stdcall;
begin
{*
 00406BDC    jmp         dword ptr ds:[608308]
*}
end;

//00406BE4
function KERNEL32.GlobalAlloc(dwBytes:DWORD):THandle; stdcall;
begin
{*
 00406BE4    jmp         dword ptr ds:[608304]
*}
end;

//00406BEC
function KERNEL32.GlobalDeleteAtom:Word; stdcall;
begin
{*
 00406BEC    jmp         dword ptr ds:[608300]
*}
end;

//00406BF4
function KERNEL32.GlobalFindAtomA:Word; stdcall;
begin
{*
 00406BF4    jmp         dword ptr ds:[6082FC]
*}
end;

//00406BFC
function KERNEL32.GlobalFree:THandle; stdcall;
begin
{*
 00406BFC    jmp         dword ptr ds:[6082F8]
*}
end;

//00406C04
function KERNEL32.GlobalLock:Pointer; stdcall;
begin
{*
 00406C04    jmp         dword ptr ds:[6082F4]
*}
end;

//00406C0C
function KERNEL32.GlobalHandle:THandle; stdcall;
begin
{*
 00406C0C    jmp         dword ptr ds:[6082F0]
*}
end;

//00406C14
procedure KERNEL32.GlobalMemoryStatus; stdcall;
begin
{*
 00406C14    jmp         dword ptr ds:[6082EC]
*}
end;

//00406C1C
function KERNEL32.GlobalReAlloc(dwBytes:DWORD; uFlags:LongWord):THandle; stdcall;
begin
{*
 00406C1C    jmp         dword ptr ds:[6082E8]
*}
end;

//00406C24
function KERNEL32.GlobalUnlock:LongBool; stdcall;
begin
{*
 00406C24    jmp         dword ptr ds:[6082E4]
*}
end;

//00406C2C
procedure KERNEL32.InitializeCriticalSection; stdcall;
begin
{*
 00406C2C    jmp         dword ptr ds:[6082E0]
*}
end;

//00406C34
procedure KERNEL32.LeaveCriticalSection; stdcall;
begin
{*
 00406C34    jmp         dword ptr ds:[6082DC]
*}
end;

//00406C3C
function KERNEL32.LoadLibraryA:HMODULE; stdcall;
begin
{*
 00406C3C    jmp         dword ptr ds:[6082D8]
*}
end;

//00406C44
function KERNEL32.LoadResource(hResInfo:HRSRC):THandle; stdcall;
begin
{*
 00406C44    jmp         dword ptr ds:[6082D4]
*}
end;

//00406C4C
function KERNEL32.LockResource:Pointer; stdcall;
begin
{*
 00406C4C    jmp         dword ptr ds:[6082D0]
*}
end;

//00406C54
function KERNEL32.MapViewOfFile(dwDesiredAccess:DWORD; dwFileOffsetHigh:DWORD; dwFileOffsetLow:DWORD; dwNumberOfBytesToMap:DWORD):Pointer; stdcall;
begin
{*
 00406C54    jmp         dword ptr ds:[6082CC]
*}
end;

//00406C5C
function KERNEL32.MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;
begin
{*
 00406C5C    jmp         dword ptr ds:[6082C8]
*}
end;

//00406C64
function KERNEL32.QueryPerformanceCounter:LongBool; stdcall;
begin
{*
 00406C64    jmp         dword ptr ds:[6082C4]
*}
end;

//00406C6C
function KERNEL32.QueryPerformanceFrequency:LongBool; stdcall;
begin
{*
 00406C6C    jmp         dword ptr ds:[6082C0]
*}
end;

//00406C74
function KERNEL32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:Cardinal; var lpNumberOfBytesRead:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 00406C74    jmp         dword ptr ds:[6082BC]
*}
end;

//00406C7C
function KERNEL32.ResetEvent:LongBool; stdcall;
begin
{*
 00406C7C    jmp         dword ptr ds:[6082B8]
*}
end;

//00406C84
function KERNEL32.SetEndOfFile:LongBool; stdcall;
begin
{*
 00406C84    jmp         dword ptr ds:[6082B4]
*}
end;

//00406C8C
function KERNEL32.SetErrorMode:LongWord; stdcall;
begin
{*
 00406C8C    jmp         dword ptr ds:[6082B0]
*}
end;

//00406C94
function KERNEL32.SetEvent:LongBool; stdcall;
begin
{*
 00406C94    jmp         dword ptr ds:[6082AC]
*}
end;

//00406C9C
function KERNEL32.SetFilePointer(Distance:Integer; DistanceHigh:Pointer; MoveMethod:Integer):Integer; stdcall;
begin
{*
 00406C9C    jmp         dword ptr ds:[6082A8]
*}
end;

//00406CA4
function KERNEL32.SetThreadLocale:LongBool; stdcall;
begin
{*
 00406CA4    jmp         dword ptr ds:[6082A4]
*}
end;

//00406CAC
function KERNEL32.SizeofResource(hResInfo:HRSRC):DWORD; stdcall;
begin
{*
 00406CAC    jmp         dword ptr ds:[6082A0]
*}
end;

//00406CB4
procedure KERNEL32.Sleep; stdcall;
begin
{*
 00406CB4    jmp         dword ptr ds:[60829C]
*}
end;

//00406CBC
function KERNEL32.UnmapViewOfFile:LongBool; stdcall;
begin
{*
 00406CBC    jmp         dword ptr ds:[608298]
*}
end;

//00406CC4
function KERNEL32.VirtualAlloc(dwSize:DWORD; flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;
begin
{*
 00406CC4    jmp         dword ptr ds:[608294]
*}
end;

//00406CCC
function KERNEL32.VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;
begin
{*
 00406CCC    jmp         dword ptr ds:[608290]
*}
end;

//00406CD4
function KERNEL32.VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;
begin
{*
 00406CD4    jmp         dword ptr ds:[60828C]
*}
end;

//00406CDC
function KERNEL32.WaitForSingleObject(dwMilliseconds:DWORD):DWORD; stdcall;
begin
{*
 00406CDC    jmp         dword ptr ds:[608288]
*}
end;

//00406CE4
function KERNEL32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 00406CE4    jmp         dword ptr ds:[608284]
*}
end;

//00406CEC
function KERNEL32.lstrcpyA(lpString2:PAnsiChar):PAnsiChar; stdcall;
begin
{*
 00406CEC    jmp         dword ptr ds:[608280]
*}
end;

//00406CF4
function version.GetFileVersionInfoA(dwHandle:DWORD; dwLen:DWORD; lpData:Pointer):LongBool; stdcall;
begin
{*
 00406CF4    jmp         dword ptr ds:[6083C4]
*}
end;

//00406CFC
function version.GetFileVersionInfoSizeA(var lpdwHandle:DWORD):DWORD; stdcall;
begin
{*
 00406CFC    jmp         dword ptr ds:[6083C0]
*}
end;

//00406D04
function version.VerQueryValueA(lpSubBlock:PAnsiChar; var lplpBuffer:Pointer; var puLen:LongWord):LongBool; stdcall;
begin
{*
 00406D04    jmp         dword ptr ds:[6083BC]
*}
end;

//00406D0C
function gdi32.BitBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 00406D0C    jmp         dword ptr ds:[6084E8]
*}
end;

//00406D14
function gdi32.ChoosePixelFormat(p2:PPixelFormatDescriptor):Integer; stdcall;
begin
{*
 00406D14    jmp         dword ptr ds:[6084E4]
*}
end;

//00406D1C
function gdi32.CopyEnhMetaFileA(p2:PAnsiChar):HENHMETAFILE; stdcall;
begin
{*
 00406D1C    jmp         dword ptr ds:[6084E0]
*}
end;

//00406D24
function gdi32.CreateBitmap(Height:Integer; Planes:Longint; BitCount:Longint; Bits:Pointer):HBITMAP; stdcall;
begin
{*
 00406D24    jmp         dword ptr ds:[6084DC]
*}
end;

//00406D2C
function gdi32.CreateBrushIndirect:HBRUSH; stdcall;
begin
{*
 00406D2C    jmp         dword ptr ds:[6084D8]
*}
end;

//00406D34
function gdi32.CreateCompatibleBitmap(Width:Integer; Height:Integer):HBITMAP; stdcall;
begin
{*
 00406D34    jmp         dword ptr ds:[6084D4]
*}
end;

//00406D3C
function gdi32.CreateCompatibleDC:HDC; stdcall;
begin
{*
 00406D3C    jmp         dword ptr ds:[6084D0]
*}
end;

//00406D44
function gdi32.CreateDIBSection(const p2:tagBITMAPINFO; p3:LongWord; var p4:Pointer; p5:THandle; p6:DWORD):HBITMAP; stdcall;
begin
{*
 00406D44    jmp         dword ptr ds:[6084CC]
*}
end;

//00406D4C
function gdi32.CreateDIBitmap(var InfoHeader:tagBITMAPINFOHEADER; dwUsage:DWORD; InitBits:PChar; var InitInfo:tagBITMAPINFO; wUsage:LongWord):HBITMAP; stdcall;
begin
{*
 00406D4C    jmp         dword ptr ds:[6084C8]
*}
end;

//00406D54
function gdi32.CreateFontIndirectA:HFONT; stdcall;
begin
{*
 00406D54    jmp         dword ptr ds:[6084C4]
*}
end;

//00406D5C
function gdi32.CreateHalftonePalette:HPALETTE; stdcall;
begin
{*
 00406D5C    jmp         dword ptr ds:[6084C0]
*}
end;

//00406D64
function gdi32.CreatePalette:HPALETTE; stdcall;
begin
{*
 00406D64    jmp         dword ptr ds:[6084BC]
*}
end;

//00406D6C
function gdi32.CreatePenIndirect:HPEN; stdcall;
begin
{*
 00406D6C    jmp         dword ptr ds:[6084B8]
*}
end;

//00406D74
function gdi32.CreateSolidBrush:HBRUSH; stdcall;
begin
{*
 00406D74    jmp         dword ptr ds:[6084B4]
*}
end;

//00406D7C
function gdi32.DeleteDC:LongBool; stdcall;
begin
{*
 00406D7C    jmp         dword ptr ds:[6084B0]
*}
end;

//00406D84
function gdi32.DeleteEnhMetaFile:LongBool; stdcall;
begin
{*
 00406D84    jmp         dword ptr ds:[6084AC]
*}
end;

//00406D8C
function gdi32.DeleteObject:LongBool; stdcall;
begin
{*
 00406D8C    jmp         dword ptr ds:[6084A8]
*}
end;

//00406D94
function gdi32.DescribePixelFormat(p2:Integer; p3:LongWord; var p4:tagPIXELFORMATDESCRIPTOR):LongBool; stdcall;
begin
{*
 00406D94    jmp         dword ptr ds:[6084A4]
*}
end;

//00406D9C
function gdi32.ExcludeClipRect(LeftRect:Integer; TopRect:Integer; RightRect:Integer; BottomRect:Integer):Integer; stdcall;
begin
{*
 00406D9C    jmp         dword ptr ds:[6084A0]
*}
end;

//00406DA4
function gdi32.GdiFlush:LongBool;
begin
{*
 00406DA4    jmp         dword ptr ds:[60849C]
*}
end;

//00406DAC
function gdi32.GetBitmapBits(Count:Longint; Bits:Pointer):Longint; stdcall;
begin
{*
 00406DAC    jmp         dword ptr ds:[608498]
*}
end;

//00406DB4
function gdi32.GetBrushOrgEx(var lppt:TPoint):LongBool; stdcall;
begin
{*
 00406DB4    jmp         dword ptr ds:[608494]
*}
end;

//00406DBC
function gdi32.GetClipBox(var Rect:TRect):Integer; stdcall;
begin
{*
 00406DBC    jmp         dword ptr ds:[608490]
*}
end;

//00406DC4
function gdi32.GetCurrentPositionEx(Point:PPoint):LongBool; stdcall;
begin
{*
 00406DC4    jmp         dword ptr ds:[60848C]
*}
end;

//00406DCC
function gdi32.GetDCOrgEx(var Origin:TPoint):LongBool; stdcall;
begin
{*
 00406DCC    jmp         dword ptr ds:[608488]
*}
end;

//00406DD4
function gdi32.GetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadStructs:void ):LongWord; stdcall;
begin
{*
 00406DD4    jmp         dword ptr ds:[608484]
*}
end;

//00406DDC
function gdi32.GetDIBits(Bitmap:HBITMAP; StartScan:LongWord; NumScans:LongWord; Bits:Pointer; var BitInfo:tagBITMAPINFO; Usage:LongWord):Integer; stdcall;
begin
{*
 00406DDC    jmp         dword ptr ds:[608480]
*}
end;

//00406DE4
function gdi32.GetDeviceCaps(Index:Integer):Integer; stdcall;
begin
{*
 00406DE4    jmp         dword ptr ds:[60847C]
*}
end;

//00406DEC
function gdi32.GetEnhMetaFileBits(p2:LongWord; p3:PByte):LongWord; stdcall;
begin
{*
 00406DEC    jmp         dword ptr ds:[608478]
*}
end;

//00406DF4
function gdi32.GetEnhMetaFileHeader(p2:LongWord; p3:PEnhMetaHeader):LongWord; stdcall;
begin
{*
 00406DF4    jmp         dword ptr ds:[608474]
*}
end;

//00406DFC
function gdi32.GetEnhMetaFilePaletteEntries(p2:LongWord; p3:Pointer):LongWord; stdcall;
begin
{*
 00406DFC    jmp         dword ptr ds:[608470]
*}
end;

//00406E04
function gdi32.GetObjectA(p2:Integer; p3:Pointer):Integer; stdcall;
begin
{*
 00406E04    jmp         dword ptr ds:[60846C]
*}
end;

//00406E0C
function gdi32.GetObjectType:DWORD; stdcall;
begin
{*
 00406E0C    jmp         dword ptr ds:[608468]
*}
end;

//00406E14
function gdi32.GetPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;
begin
{*
 00406E14    jmp         dword ptr ds:[608464]
*}
end;

//00406E1C
function gdi32.GetPixel(X:Integer; Y:Integer):DWORD; stdcall;
begin
{*
 00406E1C    jmp         dword ptr ds:[608460]
*}
end;

//00406E24
function gdi32.GetPixelFormat:Integer; stdcall;
begin
{*
 00406E24    jmp         dword ptr ds:[60845C]
*}
end;

//00406E2C
function gdi32.GetStockObject:HGDIOBJ; stdcall;
begin
{*
 00406E2C    jmp         dword ptr ds:[608458]
*}
end;

//00406E34
function gdi32.GetSystemPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;
begin
{*
 00406E34    jmp         dword ptr ds:[608454]
*}
end;

//00406E3C
function gdi32.GetTextExtentPoint32A(Str:PAnsiChar; Count:Integer; var Size:TSize):LongBool; stdcall;
begin
{*
 00406E3C    jmp         dword ptr ds:[608450]
*}
end;

//00406E44
function gdi32.GetTextExtentPointA(Str:PAnsiChar; Count:Integer; var Size:TSize):LongBool; stdcall;
begin
{*
 00406E44    jmp         dword ptr ds:[60844C]
*}
end;

//00406E4C
function gdi32.GetTextMetricsA(var TM:tagTEXTMETRICA):LongBool; stdcall;
begin
{*
 00406E4C    jmp         dword ptr ds:[608448]
*}
end;

//00406E54
function gdi32.GetWinMetaFileBits(p2:LongWord; p3:PByte; p4:Integer; p5:HDC):LongWord; stdcall;
begin
{*
 00406E54    jmp         dword ptr ds:[608444]
*}
end;

//00406E5C
function gdi32.GetWindowOrgEx(var Point:TPoint):LongBool; stdcall;
begin
{*
 00406E5C    jmp         dword ptr ds:[608440]
*}
end;

//00406E64
function gdi32.IntersectClipRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):Integer; stdcall;
begin
{*
 00406E64    jmp         dword ptr ds:[60843C]
*}
end;

//00406E6C
function gdi32.LineTo(X:Integer; Y:Integer):LongBool; stdcall;
begin
{*
 00406E6C    jmp         dword ptr ds:[608438]
*}
end;

//00406E74
function gdi32.MaskBlt(XDest:Integer; YDest:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XScr:Integer; YScr:Integer; Mask:HBITMAP; xMask:Integer; yMask:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 00406E74    jmp         dword ptr ds:[608434]
*}
end;

//00406E7C
function gdi32.MoveToEx(p2:Integer; p3:Integer; p4:PPoint):LongBool; stdcall;
begin
{*
 00406E7C    jmp         dword ptr ds:[608430]
*}
end;

//00406E84
function gdi32.PatBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 00406E84    jmp         dword ptr ds:[60842C]
*}
end;

//00406E8C
function gdi32.PlayEnhMetaFile(p2:HENHMETAFILE; const p3:TRect):LongBool; stdcall;
begin
{*
 00406E8C    jmp         dword ptr ds:[608428]
*}
end;

//00406E94
function gdi32.RealizePalette:LongWord; stdcall;
begin
{*
 00406E94    jmp         dword ptr ds:[608424]
*}
end;

//00406E9C
function gdi32.RectVisible(const Rect:TRect):LongBool; stdcall;
begin
{*
 00406E9C    jmp         dword ptr ds:[608420]
*}
end;

//00406EA4
function gdi32.Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;
begin
{*
 00406EA4    jmp         dword ptr ds:[60841C]
*}
end;

//00406EAC
function gdi32.RestoreDC(SavedDC:Integer):LongBool; stdcall;
begin
{*
 00406EAC    jmp         dword ptr ds:[608418]
*}
end;

//00406EB4
function gdi32.SaveDC:Integer; stdcall;
begin
{*
 00406EB4    jmp         dword ptr ds:[608414]
*}
end;

//00406EBC
function gdi32.SelectObject(p2:HGDIOBJ):HGDIOBJ; stdcall;
begin
{*
 00406EBC    jmp         dword ptr ds:[608410]
*}
end;

//00406EC4
function gdi32.SelectPalette(Palette:HPALETTE; ForceBackground:LongBool):HPALETTE; stdcall;
begin
{*
 00406EC4    jmp         dword ptr ds:[60840C]
*}
end;

//00406ECC
function gdi32.SetBkColor(Color:DWORD):DWORD; stdcall;
begin
{*
 00406ECC    jmp         dword ptr ds:[608408]
*}
end;

//00406ED4
function gdi32.SetBkMode(BkMode:Integer):Integer; stdcall;
begin
{*
 00406ED4    jmp         dword ptr ds:[608404]
*}
end;

//00406EDC
function gdi32.SetBrushOrgEx(X:Integer; Y:Integer; PrevPt:PPoint):LongBool; stdcall;
begin
{*
 00406EDC    jmp         dword ptr ds:[608400]
*}
end;

//00406EE4
function gdi32.SetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadSTructs:void ):LongWord; stdcall;
begin
{*
 00406EE4    jmp         dword ptr ds:[6083FC]
*}
end;

//00406EEC
function gdi32.SetEnhMetaFileBits(p2:PChar):HENHMETAFILE; stdcall;
begin
{*
 00406EEC    jmp         dword ptr ds:[6083F8]
*}
end;

//00406EF4
function gdi32.SetPixel(X:Integer; Y:Integer; Color:DWORD):DWORD; stdcall;
begin
{*
 00406EF4    jmp         dword ptr ds:[6083F4]
*}
end;

//00406EFC
function gdi32.SetPixelFormat(PixelFormat:Integer; FormatDef:PPixelFormatDescriptor):LongBool; stdcall;
begin
{*
 00406EFC    jmp         dword ptr ds:[6083F0]
*}
end;

//00406F04
function gdi32.SetROP2(p2:Integer):Integer; stdcall;
begin
{*
 00406F04    jmp         dword ptr ds:[6083EC]
*}
end;

//00406F0C
function gdi32.SetStretchBltMode(StretchMode:Integer):Integer; stdcall;
begin
{*
 00406F0C    jmp         dword ptr ds:[6083E8]
*}
end;

//00406F14
function gdi32.SetTextColor(Color:DWORD):DWORD; stdcall;
begin
{*
 00406F14    jmp         dword ptr ds:[6083E4]
*}
end;

//00406F1C
function gdi32.SetViewportOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;
begin
{*
 00406F1C    jmp         dword ptr ds:[6083E0]
*}
end;

//00406F24
function gdi32.SetWinMetaFileBits(p2:PChar; p3:HDC; const p4:tagMETAFILEPICT):HENHMETAFILE; stdcall;
begin
{*
 00406F24    jmp         dword ptr ds:[6083DC]
*}
end;

//00406F2C
function gdi32.SetWindowOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;
begin
{*
 00406F2C    jmp         dword ptr ds:[6083D8]
*}
end;

//00406F34
function gdi32.StretchBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; SrcWidth:Integer; SrcHeight:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 00406F34    jmp         dword ptr ds:[6083D4]
*}
end;

//00406F3C
function gdi32.SwapBuffers:LongBool; stdcall;
begin
{*
 00406F3C    jmp         dword ptr ds:[6083D0]
*}
end;

//00406F44
function gdi32.UnrealizeObject:LongBool; stdcall;
begin
{*
 00406F44    jmp         dword ptr ds:[6083CC]
*}
end;

//00406F4C
function user32.ActivateKeyboardLayout(Flags:LongWord):HKL; stdcall;
begin
{*
 00406F4C    jmp         dword ptr ds:[608784]
*}
end;

//00406F54
function user32.AdjustWindowRectEx(dwStyle:DWORD; bMenu:LongBool; dwExStyle:DWORD):LongBool; stdcall;
begin
{*
 00406F54    jmp         dword ptr ds:[608780]
*}
end;

//00406F5C
function user32.CharLowerA:PAnsiChar; stdcall;
begin
{*
 00406F5C    jmp         dword ptr ds:[608774]
*}
end;

//00406F64
function user32.BeginPaint(var lpPaint:tagPAINTSTRUCT):HDC; stdcall;
begin
{*
 00406F64    jmp         dword ptr ds:[608768]
*}
end;

//00406F6C
function user32.CallNextHookEx(nCode:Integer; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00406F6C    jmp         dword ptr ds:[608764]
*}
end;

//00406F74
function user32.CallWindowProcA(hWnd:HWND; Msg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00406F74    jmp         dword ptr ds:[608760]
*}
end;

//00406F7C
function user32.CharLowerBuffA(cchLength:DWORD):DWORD; stdcall;
begin
{*
 00406F7C    jmp         dword ptr ds:[608770]
*}
end;

//00406F84
function user32.CharNextA:PAnsiChar; stdcall;
begin
{*
 00406F84    jmp         dword ptr ds:[60876C]
*}
end;

//00406F8C
function user32.CharToOemA(lpszDst:PAnsiChar):LongBool; stdcall;
begin
{*
 00406F8C    jmp         dword ptr ds:[60877C]
*}
end;

//00406F94
function user32.CharUpperBuffA(cchLength:DWORD):DWORD; stdcall;
begin
{*
 00406F94    jmp         dword ptr ds:[608778]
*}
end;

//00406F9C
function user32.CheckMenuItem(uIDCheckItem:LongWord; uCheck:LongWord):DWORD; stdcall;
begin
{*
 00406F9C    jmp         dword ptr ds:[60875C]
*}
end;

//00406FA4
function user32.ClientToScreen(var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 00406FA4    jmp         dword ptr ds:[608758]
*}
end;

//00406FAC
function user32.CloseClipboard:LongBool;
begin
{*
 00406FAC    jmp         dword ptr ds:[608754]
*}
end;

//00406FB4
function user32.CreateIcon(nWidth:Integer; nHeight:Integer; cPlanes:Byte; cBitsPixel:Byte; lpbANDbits:Pointer; lpbXORbits:Pointer):HICON; stdcall;
begin
{*
 00406FB4    jmp         dword ptr ds:[608750]
*}
end;

//00406FBC
function user32.CreateMenu(ParentMenu:AnsiString; FunctionName:AnsiString; AHeight:Integer; AWidth:Integer; AOnMouseOutEvent:AnsiString; AOnMouseOverEvent:AnsiString; AOnClickEvent:AnsiString; AHighLightTextColor:TColor; ATextColor:TColor; AHighlightColor:TColor; AColor:TColor; AImage2:AnsiString; AImage1:AnsiString; Target:AnsiString; LinkAddr:AnsiString):AnsiString;
begin
{*
 00406FBC    jmp         dword ptr ds:[60874C]
*}
end;

//00406FC4
function user32.CreatePopupMenu:HMENU;
begin
{*
 00406FC4    jmp         dword ptr ds:[608748]
*}
end;

//00406FCC
function user32.DefFrameProcA(hWndMDIClient:HWND; uMsg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00406FCC    jmp         dword ptr ds:[608744]
*}
end;

//00406FD4
function user32.DefMDIChildProcA(uMsg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00406FD4    jmp         dword ptr ds:[608740]
*}
end;

//00406FDC
function user32.DefWindowProcA(Msg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00406FDC    jmp         dword ptr ds:[60873C]
*}
end;

//00406FE4
function user32.DeleteMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;
begin
{*
 00406FE4    jmp         dword ptr ds:[608738]
*}
end;

//00406FEC
function user32.DestroyCursor:LongBool; stdcall;
begin
{*
 00406FEC    jmp         dword ptr ds:[608734]
*}
end;

//00406FF4
function user32.DestroyIcon:LongBool; stdcall;
begin
{*
 00406FF4    jmp         dword ptr ds:[608730]
*}
end;

//00406FFC
function user32.DestroyMenu:LongBool; stdcall;
begin
{*
 00406FFC    jmp         dword ptr ds:[60872C]
*}
end;

//00407004
function user32.DestroyWindow:LongBool; stdcall;
begin
{*
 00407004    jmp         dword ptr ds:[608728]
*}
end;

//0040700C
function user32.DispatchMessageA:Longint; stdcall;
begin
{*
 0040700C    jmp         dword ptr ds:[608724]
*}
end;

//00407014
function user32.DrawEdge(var qrc:TRect; edge:LongWord; grfFlags:LongWord):LongBool; stdcall;
begin
{*
 00407014    jmp         dword ptr ds:[608720]
*}
end;

//0040701C
function user32.DrawFrameControl(const Rect:TRect; uType:LongWord; uState:LongWord):LongBool; stdcall;
begin
{*
 0040701C    jmp         dword ptr ds:[60871C]
*}
end;

//00407024
function user32.DrawIcon(X:Integer; Y:Integer; hIcon:HICON):LongBool; stdcall;
begin
{*
 00407024    jmp         dword ptr ds:[608718]
*}
end;

//0040702C
function user32.DrawIconEx(xLeft:Integer; yTop:Integer; hIcon:HICON; cxWidth:Integer; cyWidth:Integer; istepIfAniCur:LongWord; hbrFlickerFreeDraw:HBRUSH; diFlags:LongWord):LongBool; stdcall;
begin
{*
 0040702C    jmp         dword ptr ds:[608714]
*}
end;

//00407034
function user32.DrawMenuBar:LongBool; stdcall;
begin
{*
 00407034    jmp         dword ptr ds:[608710]
*}
end;

//0040703C
function user32.DrawTextA(lpString:PAnsiChar; nCount:Integer; var lpRect:TRect; uFormat:LongWord):Integer; stdcall;
begin
{*
 0040703C    jmp         dword ptr ds:[60870C]
*}
end;

//00407044
function user32.EmptyClipboard:LongBool;
begin
{*
 00407044    jmp         dword ptr ds:[608708]
*}
end;

//0040704C
function user32.EnableMenuItem(uIDEnableItem:LongWord; uEnable:LongWord):LongBool; stdcall;
begin
{*
 0040704C    jmp         dword ptr ds:[608704]
*}
end;

//00407054
function user32.EnableScrollBar(wSBflags:LongWord; wArrows:LongWord):LongBool; stdcall;
begin
{*
 00407054    jmp         dword ptr ds:[608700]
*}
end;

//0040705C
function user32.EnableWindow(bEnable:LongBool):LongBool; stdcall;
begin
{*
 0040705C    jmp         dword ptr ds:[6086FC]
*}
end;

//00407064
function user32.EndPaint(const lpPaint:tagPAINTSTRUCT):LongBool; stdcall;
begin
{*
 00407064    jmp         dword ptr ds:[6086F8]
*}
end;

//0040706C
function user32.EnumThreadWindows(lpfn:Pointer; lParam:Longint):LongBool; stdcall;
begin
{*
 0040706C    jmp         dword ptr ds:[6086F4]
*}
end;

//00407074
function user32.EnumWindows(lParam:Longint):LongBool; stdcall;
begin
{*
 00407074    jmp         dword ptr ds:[6086F0]
*}
end;

//0040707C
function user32.EqualRect(const lprc2:TRect):LongBool; stdcall;
begin
{*
 0040707C    jmp         dword ptr ds:[6086EC]
*}
end;

//00407084
function user32.FillRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;
begin
{*
 00407084    jmp         dword ptr ds:[6086E8]
*}
end;

//0040708C
function user32.FindWindowA(lpWindowName:PAnsiChar):HWND; stdcall;
begin
{*
 0040708C    jmp         dword ptr ds:[6086E4]
*}
end;

//00407094
function user32.FrameRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;
begin
{*
 00407094    jmp         dword ptr ds:[6086E0]
*}
end;

//0040709C
function user32.GetActiveWindow:HWND;
begin
{*
 0040709C    jmp         dword ptr ds:[6086DC]
*}
end;

//004070A4
function user32.GetCapture:HWND;
begin
{*
 004070A4    jmp         dword ptr ds:[6086D8]
*}
end;

//004070AC
function user32.GetClassInfoA(lpClassName:PAnsiChar; var lpWndClass:tagWNDCLASSA):LongBool; stdcall;
begin
{*
 004070AC    jmp         dword ptr ds:[6086D4]
*}
end;

//004070B4
function user32.GetClassNameA(lpClassName:PAnsiChar; nMaxCount:Integer):Integer; stdcall;
begin
{*
 004070B4    jmp         dword ptr ds:[6086D0]
*}
end;

//004070BC
function user32.GetClientRect(var lpRect:TRect):LongBool; stdcall;
begin
{*
 004070BC    jmp         dword ptr ds:[6086CC]
*}
end;

//004070C4
function user32.GetClipboardData:THandle; stdcall;
begin
{*
 004070C4    jmp         dword ptr ds:[6086C8]
*}
end;

//004070CC
function user32.GetCursor:HICON;
begin
{*
 004070CC    jmp         dword ptr ds:[6086C4]
*}
end;

//004070D4
function user32.GetCursorPos:LongBool; stdcall;
begin
{*
 004070D4    jmp         dword ptr ds:[6086C0]
*}
end;

//004070DC
function user32.GetDC:HDC; stdcall;
begin
{*
 004070DC    jmp         dword ptr ds:[6086BC]
*}
end;

//004070E4
function user32.GetDCEx(hrgnClip:HRGN; flags:DWORD):HDC; stdcall;
begin
{*
 004070E4    jmp         dword ptr ds:[6086B8]
*}
end;

//004070EC
function user32.GetDesktopWindow:HWND;
begin
{*
 004070EC    jmp         dword ptr ds:[6086B4]
*}
end;

//004070F4
function user32.GetFocus:HWND;
begin
{*
 004070F4    jmp         dword ptr ds:[6086B0]
*}
end;

//004070FC
function user32.GetForegroundWindow:HWND;
begin
{*
 004070FC    jmp         dword ptr ds:[6086AC]
*}
end;

//00407104
function user32.GetIconInfo(var piconinfo:_ICONINFO):LongBool; stdcall;
begin
{*
 00407104    jmp         dword ptr ds:[6086A8]
*}
end;

//0040710C
function user32.GetKeyNameTextA(lpString:PAnsiChar; nSize:Integer):Integer; stdcall;
begin
{*
 0040710C    jmp         dword ptr ds:[6086A4]
*}
end;

//00407114
function user32.GetKeyState:Smallint; stdcall;
begin
{*
 00407114    jmp         dword ptr ds:[6086A0]
*}
end;

//0040711C
function user32.GetKeyboardLayout:HKL; stdcall;
begin
{*
 0040711C    jmp         dword ptr ds:[60869C]
*}
end;

//00407124
function user32.GetKeyboardLayoutList(var List:void ):LongWord; stdcall;
begin
{*
 00407124    jmp         dword ptr ds:[608698]
*}
end;

//0040712C
function user32.GetKeyboardState:LongBool; stdcall;
begin
{*
 0040712C    jmp         dword ptr ds:[608694]
*}
end;

//00407134
function user32.GetLastActivePopup:HWND; stdcall;
begin
{*
 00407134    jmp         dword ptr ds:[608690]
*}
end;

//0040713C
function user32.GetMenu:HMENU; stdcall;
begin
{*
 0040713C    jmp         dword ptr ds:[60868C]
*}
end;

//00407144
function user32.GetMenuItemCount:Integer; stdcall;
begin
{*
 00407144    jmp         dword ptr ds:[608688]
*}
end;

//0040714C
function user32.GetMenuItemID(nPos:Integer):LongWord; stdcall;
begin
{*
 0040714C    jmp         dword ptr ds:[608684]
*}
end;

//00407154
function user32.GetMenuItemInfoA(p2:LongWord; p3:LongBool; var p4:tagMENUITEMINFOA):LongBool; stdcall;
begin
{*
 00407154    jmp         dword ptr ds:[608680]
*}
end;

//0040715C
function user32.GetMenuState(uId:LongWord; uFlags:LongWord):LongWord; stdcall;
begin
{*
 0040715C    jmp         dword ptr ds:[60867C]
*}
end;

//00407164
function user32.GetMenuStringA(uIDItem:LongWord; lpString:PAnsiChar; nMaxCount:Integer; uFlag:LongWord):Integer; stdcall;
begin
{*
 00407164    jmp         dword ptr ds:[608678]
*}
end;

//0040716C
function user32.GetMessageTime:Longint;
begin
{*
 0040716C    jmp         dword ptr ds:[608674]
*}
end;

//00407174
function user32.GetWindow(uCmd:LongWord):HWND; stdcall;
begin
{*
 00407174    jmp         dword ptr ds:[608670]
*}
end;

//0040717C
function user32.GetParent:HWND; stdcall;
begin
{*
 0040717C    jmp         dword ptr ds:[60866C]
*}
end;

//00407184
function user32.GetPropA(lpString:PAnsiChar):THandle; stdcall;
begin
{*
 00407184    jmp         dword ptr ds:[608668]
*}
end;

//0040718C
function user32.GetScrollInfo(BarFlag:Integer; var ScrollInfo:tagSCROLLINFO):LongBool; stdcall;
begin
{*
 0040718C    jmp         dword ptr ds:[608664]
*}
end;

//00407194
function user32.GetScrollPos(nBar:Integer):Integer; stdcall;
begin
{*
 00407194    jmp         dword ptr ds:[608660]
*}
end;

//0040719C
function user32.GetScrollRange(nBar:Integer; var lpMinPos:Integer; var lpMaxPos:Integer):LongBool; stdcall;
begin
{*
 0040719C    jmp         dword ptr ds:[60865C]
*}
end;

//004071A4
function user32.GetSubMenu(nPos:Integer):HMENU; stdcall;
begin
{*
 004071A4    jmp         dword ptr ds:[608658]
*}
end;

//004071AC
function user32.GetSysColor:DWORD; stdcall;
begin
{*
 004071AC    jmp         dword ptr ds:[608654]
*}
end;

//004071B4
function user32.GetSysColorBrush:HBRUSH; stdcall;
begin
{*
 004071B4    jmp         dword ptr ds:[608650]
*}
end;

//004071BC
function user32.GetSystemMenu(bRevert:LongBool):HMENU; stdcall;
begin
{*
 004071BC    jmp         dword ptr ds:[60864C]
*}
end;

//004071C4
function user32.GetSystemMetrics:Integer; stdcall;
begin
{*
 004071C4    jmp         dword ptr ds:[608648]
*}
end;

//004071CC
function user32.GetTopWindow:HWND; stdcall;
begin
{*
 004071CC    jmp         dword ptr ds:[608644]
*}
end;

//004071D4
function user32.GetWindow(uCmd:LongWord):HWND; stdcall;
begin
{*
 004071D4    jmp         dword ptr ds:[608670]
*}
end;

//004071DC
function user32.GetWindowDC:HDC; stdcall;
begin
{*
 004071DC    jmp         dword ptr ds:[608640]
*}
end;

//004071E4
function user32.GetWindowLongA(nIndex:Integer):Longint; stdcall;
begin
{*
 004071E4    jmp         dword ptr ds:[60863C]
*}
end;

//004071EC
function user32.GetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;
begin
{*
 004071EC    jmp         dword ptr ds:[608638]
*}
end;

//004071F4
function user32.GetWindowRect(var lpRect:TRect):LongBool; stdcall;
begin
{*
 004071F4    jmp         dword ptr ds:[608634]
*}
end;

//004071FC
function user32.GetWindowTextA(lpString:PAnsiChar; nMaxCount:Integer):Integer; stdcall;
begin
{*
 004071FC    jmp         dword ptr ds:[608630]
*}
end;

//00407204
function user32.GetWindowThreadProcessId(lpdwProcessId:Pointer):DWORD; stdcall;
begin
{*
 00407204    jmp         dword ptr ds:[60862C]
*}
end;

//0040720C
function user32.GetWindowThreadProcessId(lpdwProcessId:Pointer):DWORD; stdcall;
begin
{*
 0040720C    jmp         dword ptr ds:[60862C]
*}
end;

//00407214
function user32.InflateRect(dx:Integer; dy:Integer):LongBool; stdcall;
begin
{*
 00407214    jmp         dword ptr ds:[608628]
*}
end;

//0040721C
function user32.InsertMenuA(uPosition:LongWord; uFlags:LongWord; uIDNewItem:LongWord; lpNewItem:PAnsiChar):LongBool; stdcall;
begin
{*
 0040721C    jmp         dword ptr ds:[608624]
*}
end;

//00407224
function user32.InsertMenuItemA(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;
begin
{*
 00407224    jmp         dword ptr ds:[608620]
*}
end;

//0040722C
function user32.IntersectRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;
begin
{*
 0040722C    jmp         dword ptr ds:[60861C]
*}
end;

//00407234
function user32.InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;
begin
{*
 00407234    jmp         dword ptr ds:[608618]
*}
end;

//0040723C
function user32.IsChild(hWnd:HWND):LongBool; stdcall;
begin
{*
 0040723C    jmp         dword ptr ds:[608614]
*}
end;

//00407244
function user32.IsDialogMessageA(var lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 00407244    jmp         dword ptr ds:[608610]
*}
end;

//0040724C
function user32.IsIconic:LongBool; stdcall;
begin
{*
 0040724C    jmp         dword ptr ds:[60860C]
*}
end;

//00407254
function user32.IsRectEmpty:LongBool; stdcall;
begin
{*
 00407254    jmp         dword ptr ds:[608608]
*}
end;

//0040725C
function user32.IsWindow:LongBool; stdcall;
begin
{*
 0040725C    jmp         dword ptr ds:[608604]
*}
end;

//00407264
function user32.IsWindowEnabled:LongBool; stdcall;
begin
{*
 00407264    jmp         dword ptr ds:[608600]
*}
end;

//0040726C
function user32.IsWindowVisible:LongBool; stdcall;
begin
{*
 0040726C    jmp         dword ptr ds:[6085FC]
*}
end;

//00407274
function user32.IsZoomed:LongBool; stdcall;
begin
{*
 00407274    jmp         dword ptr ds:[6085F8]
*}
end;

//0040727C
function user32.KillTimer(uIDEvent:LongWord):LongBool; stdcall;
begin
{*
 0040727C    jmp         dword ptr ds:[6085F4]
*}
end;

//00407284
function user32.LoadBitmapA(lpBitmapName:PAnsiChar):HBITMAP; stdcall;
begin
{*
 00407284    jmp         dword ptr ds:[6085F0]
*}
end;

//0040728C
function user32.LoadCursorA(lpCursorName:PAnsiChar):HICON; stdcall;
begin
{*
 0040728C    jmp         dword ptr ds:[6085EC]
*}
end;

//00407294
function user32.LoadIconA(lpIconName:PAnsiChar):HICON; stdcall;
begin
{*
 00407294    jmp         dword ptr ds:[6085E8]
*}
end;

//0040729C
function user32.LoadKeyboardLayoutA(Flags:LongWord):HKL; stdcall;
begin
{*
 0040729C    jmp         dword ptr ds:[6085E4]
*}
end;

//004072A4
function user32.LoadStringA(uID:LongWord; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;
begin
{*
 004072A4    jmp         dword ptr ds:[6085E0]
*}
end;

//004072AC
function user32.MapVirtualKeyA(uMapType:LongWord):LongWord; stdcall;
begin
{*
 004072AC    jmp         dword ptr ds:[6085DC]
*}
end;

//004072B4
function user32.MapWindowPoints(hWndTo:HWND; var lpPoints:void ; cPoints:LongWord):Integer; stdcall;
begin
{*
 004072B4    jmp         dword ptr ds:[6085D8]
*}
end;

//004072BC
function user32.MessageBeep:LongBool; stdcall;
begin
{*
 004072BC    jmp         dword ptr ds:[6085D4]
*}
end;

//004072C4
function user32.MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:LongWord):Integer; stdcall;
begin
{*
 004072C4    jmp         dword ptr ds:[6085D0]
*}
end;

//004072CC
function user32.OemToCharA(lpszDst:PAnsiChar):LongBool; stdcall;
begin
{*
 004072CC    jmp         dword ptr ds:[6085CC]
*}
end;

//004072D4
function user32.OffsetRect(DX:Integer; DY:Integer):Boolean;
begin
{*
 004072D4    jmp         dword ptr ds:[6085C8]
*}
end;

//004072DC
function user32.OpenClipboard:LongBool; stdcall;
begin
{*
 004072DC    jmp         dword ptr ds:[6085C4]
*}
end;

//004072E4
function user32.PeekMessageA(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;
begin
{*
 004072E4    jmp         dword ptr ds:[6085C0]
*}
end;

//004072EC
function user32.PostMessageA(Msg:LongWord; wParam:Longint; lParam:Longint):LongBool; stdcall;
begin
{*
 004072EC    jmp         dword ptr ds:[6085BC]
*}
end;

//004072F4
procedure user32.PostQuitMessage; stdcall;
begin
{*
 004072F4    jmp         dword ptr ds:[6085B8]
*}
end;

//004072FC
function user32.PtInRect(const P:TPoint):Boolean;
begin
{*
 004072FC    jmp         dword ptr ds:[6085B4]
*}
end;

//00407304
function user32.RedrawWindow(lprcUpdate:PRect; hrgnUpdate:HRGN; flags:LongWord):LongBool; stdcall;
begin
{*
 00407304    jmp         dword ptr ds:[6085B0]
*}
end;

//0040730C
function user32.RegisterClassA:Word; stdcall;
begin
{*
 0040730C    jmp         dword ptr ds:[6085AC]
*}
end;

//00407314
function user32.RegisterClipboardFormatA:LongWord; stdcall;
begin
{*
 00407314    jmp         dword ptr ds:[6085A8]
*}
end;

//0040731C
function user32.RegisterWindowMessageA:LongWord; stdcall;
begin
{*
 0040731C    jmp         dword ptr ds:[6085A4]
*}
end;

//00407324
function user32.ReleaseCapture:LongBool;
begin
{*
 00407324    jmp         dword ptr ds:[6085A0]
*}
end;

//0040732C
function user32.ReleaseDC(hDC:HDC):Integer; stdcall;
begin
{*
 0040732C    jmp         dword ptr ds:[60859C]
*}
end;

//00407334
function user32.RemoveMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;
begin
{*
 00407334    jmp         dword ptr ds:[608598]
*}
end;

//0040733C
function user32.RemovePropA(lpString:PAnsiChar):THandle; stdcall;
begin
{*
 0040733C    jmp         dword ptr ds:[608594]
*}
end;

//00407344
function user32.ScreenToClient(var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 00407344    jmp         dword ptr ds:[608590]
*}
end;

//0040734C
function user32.ScrollWindow(XAmount:Integer; YAmount:Integer; Rect:PRect; ClipRect:PRect):LongBool; stdcall;
begin
{*
 0040734C    jmp         dword ptr ds:[60858C]
*}
end;

//00407354
function user32.SendMessageA(Msg:LongWord; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00407354    jmp         dword ptr ds:[608588]
*}
end;

//0040735C
function user32.SetActiveWindow:HWND; stdcall;
begin
{*
 0040735C    jmp         dword ptr ds:[608584]
*}
end;

//00407364
function user32.SetCapture:HWND; stdcall;
begin
{*
 00407364    jmp         dword ptr ds:[608580]
*}
end;

//0040736C
function user32.SetClassLongA(nIndex:Integer; dwNewLong:Longint):DWORD; stdcall;
begin
{*
 0040736C    jmp         dword ptr ds:[60857C]
*}
end;

//00407374
function user32.SetClipboardData(hMem:THandle):THandle; stdcall;
begin
{*
 00407374    jmp         dword ptr ds:[608578]
*}
end;

//0040737C
function user32.SetCursor:HICON; stdcall;
begin
{*
 0040737C    jmp         dword ptr ds:[608574]
*}
end;

//00407384
function user32.SetCursorPos(Y:Integer):LongBool; stdcall;
begin
{*
 00407384    jmp         dword ptr ds:[608570]
*}
end;

//0040738C
function user32.SetFocus:HWND; stdcall;
begin
{*
 0040738C    jmp         dword ptr ds:[60856C]
*}
end;

//00407394
function user32.SetForegroundWindow:LongBool; stdcall;
begin
{*
 00407394    jmp         dword ptr ds:[608568]
*}
end;

//0040739C
function user32.SetMenu(hMenu:HMENU):LongBool; stdcall;
begin
{*
 0040739C    jmp         dword ptr ds:[608564]
*}
end;

//004073A4
function user32.SetMenuItemInfoA(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;
begin
{*
 004073A4    jmp         dword ptr ds:[608560]
*}
end;

//004073AC
function user32.SetParent(hWndNewParent:HWND):HWND; stdcall;
begin
{*
 004073AC    jmp         dword ptr ds:[60855C]
*}
end;

//004073B4
function user32.SetPropA(lpString:PAnsiChar; hData:THandle):LongBool; stdcall;
begin
{*
 004073B4    jmp         dword ptr ds:[608558]
*}
end;

//004073BC
function user32.SetRect(xLeft:Integer; yTop:Integer; xRight:Integer; yBottom:Integer):LongBool; stdcall;
begin
{*
 004073BC    jmp         dword ptr ds:[608554]
*}
end;

//004073C4
function user32.SetScrollInfo(BarFlag:Integer; const ScrollInfo:tagSCROLLINFO; Redraw:LongBool):Integer; stdcall;
begin
{*
 004073C4    jmp         dword ptr ds:[608550]
*}
end;

//004073CC
function user32.SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:LongBool):Integer; stdcall;
begin
{*
 004073CC    jmp         dword ptr ds:[60854C]
*}
end;

//004073D4
function user32.SetScrollRange(nBar:Integer; nMinPos:Integer; nMaxPos:Integer; bRedraw:LongBool):LongBool; stdcall;
begin
{*
 004073D4    jmp         dword ptr ds:[608548]
*}
end;

//004073DC
function user32.SetTimer(nIDEvent:LongWord; uElapse:LongWord; lpTimerFunc:Pointer):LongWord; stdcall;
begin
{*
 004073DC    jmp         dword ptr ds:[608544]
*}
end;

//004073E4
function user32.SetWindowLongA(nIndex:Integer; dwNewLong:Longint):Longint; stdcall;
begin
{*
 004073E4    jmp         dword ptr ds:[608540]
*}
end;

//004073EC
function user32.SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;
begin
{*
 004073EC    jmp         dword ptr ds:[60853C]
*}
end;

//004073F4
function user32.SetWindowPos(hWndInsertAfter:HWND; X:Integer; Y:Integer; cx:Integer; cy:Integer; uFlags:LongWord):LongBool; stdcall;
begin
{*
 004073F4    jmp         dword ptr ds:[608538]
*}
end;

//004073FC
function user32.SetWindowTextA(lpString:PAnsiChar):LongBool; stdcall;
begin
{*
 004073FC    jmp         dword ptr ds:[608534]
*}
end;

//00407404
function user32.SetWindowsHookExA(lpfn:TFNHookProc; hmod:HINST; dwThreadId:DWORD):HHOOK; stdcall;
begin
{*
 00407404    jmp         dword ptr ds:[608530]
*}
end;

//0040740C
function user32.ShowCursor:Integer; stdcall;
begin
{*
 0040740C    jmp         dword ptr ds:[60852C]
*}
end;

//00407414
function user32.ShowOwnedPopups(fShow:LongBool):LongBool; stdcall;
begin
{*
 00407414    jmp         dword ptr ds:[608528]
*}
end;

//0040741C
function user32.ShowScrollBar(wBar:Integer; bShow:LongBool):LongBool; stdcall;
begin
{*
 0040741C    jmp         dword ptr ds:[608524]
*}
end;

//00407424
function user32.ShowWindow(nCmdShow:Integer):LongBool; stdcall;
begin
{*
 00407424    jmp         dword ptr ds:[608520]
*}
end;

//0040742C
function user32.SystemParametersInfoA(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;
begin
{*
 0040742C    jmp         dword ptr ds:[60851C]
*}
end;

//00407434
function user32.TrackPopupMenu(uFlags:LongWord; x:Integer; y:Integer; nReserved:Integer; hWnd:HWND; prcRect:PRect):LongBool; stdcall;
begin
{*
 00407434    jmp         dword ptr ds:[608518]
*}
end;

//0040743C
function user32.TranslateMDISysAccel(const lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 0040743C    jmp         dword ptr ds:[608514]
*}
end;

//00407444
function user32.TranslateMessage:LongBool; stdcall;
begin
{*
 00407444    jmp         dword ptr ds:[608510]
*}
end;

//0040744C
function user32.UnhookWindowsHookEx:LongBool; stdcall;
begin
{*
 0040744C    jmp         dword ptr ds:[60850C]
*}
end;

//00407454
function user32.UnregisterClassA(hInstance:HINST):LongBool; stdcall;
begin
{*
 00407454    jmp         dword ptr ds:[608508]
*}
end;

//0040745C
function user32.UpdateWindow:LongBool; stdcall;
begin
{*
 0040745C    jmp         dword ptr ds:[608504]
*}
end;

//00407464
function user32.WaitMessage:LongBool;
begin
{*
 00407464    jmp         dword ptr ds:[608500]
*}
end;

//0040746C
function user32.WinHelpA(lpszHelp:PAnsiChar; uCommand:LongWord; dwData:DWORD):LongBool; stdcall;
begin
{*
 0040746C    jmp         dword ptr ds:[6084FC]
*}
end;

//00407474
function user32.WindowFromDC:HWND; stdcall;
begin
{*
 00407474    jmp         dword ptr ds:[6084F8]
*}
end;

//0040747C
function user32.WindowFromPoint:HWND; stdcall;
begin
{*
 0040747C    jmp         dword ptr ds:[6084F4]
*}
end;

//00407484
function MakeLong(a:Word; b:Word):Longint;
begin
{*
 00407484    movzx       eax,ax
 00407487    movzx       edx,dx
 0040748A    shl         edx,10
 0040748D    or          eax,edx
 0040748F    ret
*}
end;

//00407490
function GetCurrentTime:Longint;
begin
{*
 00407490    call        KERNEL32.GetTickCount
 00407495    ret
*}
end;

//00407498
function UnlockResource(hResData:THandle):LongBool;
begin
{*
 00407498    xor         eax,eax
 0040749A    ret
*}
end;

//0040749C
function GlobalAllocPtr(Flags:Integer; Bytes:Longint):Pointer;
begin
{*
 0040749C    push        edx
 0040749D    push        eax
 0040749E    call        KERNEL32.GlobalAlloc
 004074A3    push        eax
 004074A4    call        KERNEL32.GlobalLock
 004074A9    ret
*}
end;

//004074AC
function GlobalReAllocPtr(P:Pointer; Bytes:Longint; Flags:Integer):Pointer;
begin
{*
 004074AC    push        ecx
 004074AD    push        edx
 004074AE    push        eax
 004074AF    call        KERNEL32.GlobalHandle
 004074B4    push        eax
 004074B5    push        eax
 004074B6    call        KERNEL32.GlobalUnlock
 004074BB    call        KERNEL32.GlobalReAlloc
 004074C0    push        eax
 004074C1    call        KERNEL32.GlobalLock
 004074C6    ret
*}
end;

//004074C8
function GlobalFreePtr(P:Pointer):THandle;
begin
{*
 004074C8    push        eax
 004074C9    call        KERNEL32.GlobalHandle
 004074CE    push        eax
 004074CF    push        eax
 004074D0    call        KERNEL32.GlobalUnlock
 004074D5    call        KERNEL32.GlobalFree
 004074DA    ret
*}
end;

//004074DC
function MakeROP4(fore:DWORD; back:DWORD):DWORD;
begin
{*
 004074DC    shl         edx,8
 004074DF    and         edx,0FF000000
 004074E5    or          eax,edx
 004074E7    ret
*}
end;

//004074E8
function RGB(r:Byte; g:Byte; b:Byte):DWORD;
begin
{*
 004074E8    and         eax,0FF
 004074ED    and         edx,0FF
 004074F3    shl         edx,8
 004074F6    or          eax,edx
 004074F8    xor         edx,edx
 004074FA    mov         dl,cl
 004074FC    shl         edx,10
 004074FF    or          eax,edx
 00407501    ret
*}
end;

//00407504
{*function sub_00407504:?;
begin
 00407504    ret
end;*}

//00407508
{*function sub_00407508(?:TColor):?;
begin
 00407508    shr         eax,8
 0040750B    ret
end;*}

//0040750C
{*function sub_0040750C(?:TColor):?;
begin
 0040750C    shr         eax,10
 0040750F    ret
end;*}

//00407510
function SmallPointToPoint(const P:TSmallPoint):TPoint;
begin
{*
 00407510    push        ecx
 00407511    mov         dword ptr [esp],eax
 00407514    movsx       eax,word ptr [esp]
 00407518    mov         dword ptr [edx],eax
 0040751A    movsx       eax,word ptr [esp+2]
 0040751F    mov         dword ptr [edx+4],eax
 00407522    pop         edx
 00407523    ret
*}
end;

//00407524
function PointToSmallPoint(const P:TPoint):TSmallPoint;
begin
{*
 00407524    push        ecx
 00407525    mov         dx,word ptr [eax]
 00407528    mov         word ptr [esp],dx
 0040752C    mov         ax,word ptr [eax+4]
 00407530    mov         word ptr [esp+2],ax
 00407535    mov         eax,dword ptr [esp]
 00407538    pop         edx
 00407539    ret
*}
end;

//0040753C
function MakeWParam(l:Word; h:Word):Longint;
begin
{*
 0040753C    call        MakeLong
 00407541    ret
*}
end;

//00407544
function user32.CreateWindowExA(dwExStyle:DWORD; lpClassName:PAnsiChar; lpParam:Pointer; hInstance:HINST; hMenu:HMENU; hWndParent:HWND; nHeight:Integer; nWidth:Integer; Y:Integer; X:Integer; dwStyle:DWORD):HWND;
begin
{*
 00407544    jmp         dword ptr ds:[6084F0]
*}
end;

//0040754C
function CreateWindowEx(dwExStyle:DWORD; lpClassName:PChar; lpWindowName:PChar; dwStyle:DWORD; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;
begin
{*
 0040754C    push        ebp
 0040754D    mov         ebp,esp
 0040754F    push        ecx
 00407550    push        ebx
 00407551    push        esi
 00407552    push        edi
 00407553    mov         dword ptr [ebp-4],ecx
 00407556    mov         edi,edx
 00407558    mov         esi,eax
 0040755A    call        Get8087CW
 0040755F    mov         ebx,eax
 00407561    mov         eax,dword ptr [ebp+8]
 00407564    push        eax
 00407565    mov         eax,dword ptr [ebp+0C]
 00407568    push        eax
 00407569    mov         eax,dword ptr [ebp+10]
 0040756C    push        eax
 0040756D    mov         eax,dword ptr [ebp+14]
 00407570    push        eax
 00407571    mov         eax,dword ptr [ebp+18]
 00407574    push        eax
 00407575    mov         eax,dword ptr [ebp+1C]
 00407578    push        eax
 00407579    mov         eax,dword ptr [ebp+20]
 0040757C    push        eax
 0040757D    mov         eax,dword ptr [ebp+24]
 00407580    push        eax
 00407581    mov         eax,dword ptr [ebp+28]
 00407584    push        eax
 00407585    mov         eax,dword ptr [ebp-4]
 00407588    push        eax
 00407589    push        edi
 0040758A    push        esi
 0040758B    call        user32.CreateWindowExA
 00407590    mov         esi,eax
 00407592    mov         eax,ebx
 00407594    call        Set8087CW
 00407599    mov         eax,esi
 0040759B    pop         edi
 0040759C    pop         esi
 0040759D    pop         ebx
 0040759E    pop         ecx
 0040759F    pop         ebp
 004075A0    ret         24
*}
end;

//004075A4
function CreateWindow(lpClassName:PChar; lpWindowName:PChar; dwStyle:DWORD; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;
begin
{*
 004075A4    push        ebp
 004075A5    mov         ebp,esp
 004075A7    push        ecx
 004075A8    push        ebx
 004075A9    push        esi
 004075AA    push        edi
 004075AB    mov         dword ptr [ebp-4],ecx
 004075AE    mov         edi,edx
 004075B0    mov         esi,eax
 004075B2    call        Get8087CW
 004075B7    mov         ebx,eax
 004075B9    mov         eax,dword ptr [ebp+8]
 004075BC    push        eax
 004075BD    mov         eax,dword ptr [ebp+0C]
 004075C0    push        eax
 004075C1    mov         eax,dword ptr [ebp+10]
 004075C4    push        eax
 004075C5    mov         eax,dword ptr [ebp+14]
 004075C8    push        eax
 004075C9    mov         eax,dword ptr [ebp+18]
 004075CC    push        eax
 004075CD    mov         eax,dword ptr [ebp+1C]
 004075D0    push        eax
 004075D1    mov         eax,dword ptr [ebp+20]
 004075D4    push        eax
 004075D5    mov         eax,dword ptr [ebp+24]
 004075D8    push        eax
 004075D9    mov         eax,dword ptr [ebp-4]
 004075DC    push        eax
 004075DD    push        edi
 004075DE    push        esi
 004075DF    push        0
 004075E1    call        user32.CreateWindowExA
 004075E6    mov         esi,eax
 004075E8    mov         eax,ebx
 004075EA    call        Set8087CW
 004075EF    mov         eax,esi
 004075F1    pop         edi
 004075F2    pop         esi
 004075F3    pop         ebx
 004075F4    pop         ecx
 004075F5    pop         ebp
 004075F6    ret         20
*}
end;

//004075FC
function HwndMSWheel(var puiMsh_MsgMouseWheel:LongWord; var puiMsh_Msg3DSupport:LongWord; var puiMsh_MsgScrollLines:LongWord; var pf3DSupport:LongBool; var piScrollLines:Integer):HWND;
begin
{*
 004075FC    push        ebp
 004075FD    mov         ebp,esp
 004075FF    push        ecx
 00407600    push        ebx
 00407601    push        esi
 00407602    push        edi
 00407603    mov         edi,ecx
 00407605    mov         esi,edx
 00407607    mov         dword ptr [ebp-4],eax
 0040760A    push        407698
 0040760F    push        4076AC
 00407614    call        user32.FindWindowA
 00407619    mov         ebx,eax
 0040761B    push        4076B4
 00407620    call        user32.RegisterWindowMessageA
 00407625    mov         edx,dword ptr [ebp-4]
 00407628    mov         dword ptr [edx],eax
 0040762A    push        4076C4
 0040762F    call        user32.RegisterWindowMessageA
 00407634    mov         dword ptr [esi],eax
 00407636    push        4076DC
 0040763B    call        user32.RegisterWindowMessageA
 00407640    mov         dword ptr [edi],eax
 00407642    cmp         dword ptr [esi],0
>00407645    je          0040765F
 00407647    test        ebx,ebx
>00407649    je          0040765F
 0040764B    push        0
 0040764D    push        0
 0040764F    mov         eax,dword ptr [esi]
 00407651    push        eax
 00407652    push        ebx
 00407653    call        user32.SendMessageA
 00407658    mov         edx,dword ptr [ebp+0C]
 0040765B    mov         dword ptr [edx],eax
>0040765D    jmp         00407666
 0040765F    mov         eax,dword ptr [ebp+0C]
 00407662    xor         edx,edx
 00407664    mov         dword ptr [eax],edx
 00407666    cmp         dword ptr [edi],0
>00407669    je          00407683
 0040766B    test        ebx,ebx
>0040766D    je          00407683
 0040766F    push        0
 00407671    push        0
 00407673    mov         eax,dword ptr [edi]
 00407675    push        eax
 00407676    push        ebx
 00407677    call        user32.SendMessageA
 0040767C    mov         edx,dword ptr [ebp+8]
 0040767F    mov         dword ptr [edx],eax
>00407681    jmp         0040768C
 00407683    mov         eax,dword ptr [ebp+8]
 00407686    mov         dword ptr [eax],3
 0040768C    mov         eax,ebx
 0040768E    pop         edi
 0040768F    pop         esi
 00407690    pop         ebx
 00407691    pop         ecx
 00407692    pop         ebp
 00407693    ret         8
*}
end;

end.