#SingleInstance, Force
#Persistent
#NoEnv
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Application := {Name: A_ScriptName}
Window := {Width: 400, Height: 300, Title: Application.Name}
Navigation := {Label: ["Aim Hotkey", "Aim Config", "Aim Speed", "Fov Config", "Help"]}
Box_Init(C="FF0000") {
Gui, 96: -Caption +ToolWindow +E0x20
Gui, 96: Color, % C
Gui, 97: -Caption +ToolWindow +E0x20
Gui, 97: Color, % C
Gui, 98: -Caption +ToolWindow +E0x20
Gui, 98: Color, % C
Gui, 99: -Caption +ToolWindow +E0x20
Gui, 99: Color, % C
}
Box_Draw(X, Y, W, H, T="1", O="I") {
If(W < 0)
X += W, W *= -1
If(H < 0)
Y += H, H *= -1
If(T >= 2)
{
If(O == "O")
X -= T, Y -= T, W += T, H += T
If(O == "C")
X -= T / 2, Y -= T / 2
If(O == "I")
W -= T, H -= T
}
Gui, 96: Show, % "x" X " y" Y " w" W " h" T " NA", Horizontal 1
Gui, 96:+AlwaysOnTop
Gui, 98: Show, % "x" X " y" Y + H " w" W " h" T " NA", Horizontal 2
Gui, 98:+AlwaysOnTop
Gui, 97: Show, % "x" X " y" Y " w" T " h" H " NA", Vertical 1
Gui, 97:+AlwaysOnTop
Gui, 99: Show, % "x" X + W " y" Y " w" T " h" H " NA", Vertical 2
Gui, 99:+AlwaysOnTop
}
Box_Destroy() {
Loop, 4
Gui, % A_Index + 95 ":  Destroy"
}
Box_Hide() {
Loop, 4
Gui, % A_Index + 95 ":  Hide"
}
Box_Init_Target(C="FF0000") {
Gui, 90: -Caption +ToolWindow +E0x20
Gui, 90: Color, % C
Gui, 91: -Caption +ToolWindow +E0x20
Gui, 91: Color, % C
Gui, 92: -Caption +ToolWindow +E0x20
Gui, 92: Color, % C
Gui, 93: -Caption +ToolWindow +E0x20
Gui, 93: Color, % C
}
Box_Draw_Target(X, Y, W, H, T="1", O="I") {
If(W < 0)
X += W, W *= -1
If(H < 0)
Y += H, H *= -1
If(T >= 2)
{
If(O == "O")
X -= T, Y -= T, W += T, H += T
If(O == "C")
X -= T / 2, Y -= T / 2
If(O == "I")
W -= T, H -= T
}
Gui, 90: Show, % "x" X " y" Y " w" W " h" T " NA", Horizontal 1
Gui, 90:+AlwaysOnTop
Gui, 92: Show, % "x" X " y" Y + H " w" W " h" T " NA", Horizontal 2
Gui, 92:+AlwaysOnTop
Gui, 91: Show, % "x" X " y" Y " w" T " h" H " NA", Vertical 1
Gui, 91:+AlwaysOnTop
Gui, 93: Show, % "x" X + W " y" Y " w" T " h" H " NA", Vertical 2
Gui, 93:+AlwaysOnTop
}
Box_Destroy_Target() {
Loop, 4
Gui, % A_Index + 89 ":  Destroy"
}
Box_Hide_Target() {
Loop, 4
Gui, % A_Index + 89 ":  Hide"
}
Box_Show_Target() {
Loop, 4
Gui, % A_Index + 89 ":  Show"
}
inicount := 9
fileread,settings,settings.ini
stringsplit,settings,settings,`n
if !(fileexist("settings.ini")) || (settings0-3 != inicount){
iniread,sen_Short,settings.ini,settings,senShort, 3
iniread,Fov_X,settings.ini,settings,FovX, 3
iniread,Fov_Y,settings.ini,settings,FovY, 3
iniread,AimShort_X,settings.ini,settings,AimShortX, 60
iniread,AimShort_Y,settings.ini,settings,AimShortY, 85
iniread,Shoot_T,settings.ini,settings,Shoot, 50
}

Gui, +LastFound -Resize +HwndhGui1
Gui, Color, ffffff
Gui, Add, Tab2, % " x" -999999 " y" -999999 " w" 0 " h" 0 " -Wrap +Theme vTabControl", % ""
Gui, Tab
Gui, Add, Picture, % "x" -999999 " y" -999999 " w" 4 " h" 32 " vpMenuHover +0x4E +HWNDhMenuHover",
Gui, Add, Picture, % "x" 0 " y" 18 " w" 4 " h" 32 " vpMenuSelect +0x4E +HWNDhMenuSelect",
Gui, Font, s9 c808080, Meiryo UI
Loop, % Navigation.Label.Length() {
GuiControl,, TabControl, % Navigation.Label[A_Index] "|"
If (Navigation.Label[A_Index] = "---") {
Continue
}
Gui, Add, Text, % "x" 18 " y" (32*A_Index)-14 " h" 32 " +0x200 gMenuClick vMenuItem" . A_Index, % Navigation.Label[A_Index]
Gui, Add, Text, x18 y280 h150, Patted Hack Gang UC
}
Gui, Font
Gui, Font, s11 c000000, Meiryo UI
Gui, Add, Text, % "x" 192 " y" 18 " w" (Window.Width-192)-14 " h" 32 " +0x200 vPageTitle", % ""
Gui, Font
Gui, Add, Picture, % "x" 192 " y" 50 " w" (Window.Width-192)-14 " h" 1 " +0x4E +HWNDhDividerLine",
Gui, Tab, 1
Gui, Add, Checkbox, x192 y60 w110 vaimtype, Left Mouse Button
Gui, Add, Checkbox, x192 y80 w120 vaimtype1, Right Mouse Button
Gui, Add, Checkbox, x192 y100 w80 vtrigger, Trigger Bot
Gui, Add, Text, % "x" 192 " y" 120 " w" (Window.Width-192)-14, % "TB Fire Rate"
Gui, Add, Edit, x260 y120 w35 vsht, % Shoot_T
Gui, Add, Text, % "x" 192 " y" 150 " w" (Window.Width-192)-14, % "Lower Number = Faster Rate of Fire"

Gui, Add, ActiveX, x175 y150 w308 h200, mshtml:<img src='https://i.imgur.com/fRT8Oa3.png' />
Gui, Tab, 2
Gui, Add, Text, % "x" 192 " y" 66 " w" (Window.Width-192)-14, % "Aim Offsets -"
Gui, Add, Text, % "x" 192 " y" 66 " w" (Window.Width-192)-14, % "X - Axis:"
Gui, Add, Edit, x240 y61 w30 vxa, % AimShort_X
Gui, Add, Text, % "x" 192 " y" 106 " w" (Window.Width-192)-14, % "Y - Axis:"
Gui, Add, Edit, x240 y101 w30 vxy, % AimShort_Y
Gui, Add, ActiveX, x175 y150 w308 h200, mshtml:<img src='https://i.imgur.com/fRT8Oa3.png' />
Gui, Tab, 3
Gui, Add, Text, % "x" 192 " y" 66 " w" (Window.Width-192)-14, % "Aim Speed:"
Gui, Add, Edit, x255 y61 w30 vrx, % sen_Short
Gui, Add, ActiveX, x175 y150 w308 h200, mshtml:<img src='https://i.imgur.com/fRT8Oa3.png' />
Gui, Tab, 4
Gui, Add, Text, % "x" 192 " y" 66 " w" (Window.Width-192)-14, % "Fov X - Axis:"
Gui, Add, Edit, x260 y61 w30 vxrange, % Fov_X
Gui, Add, Text, % "x" 192 " y" 106 " w" (Window.Width-192)-14, % "Fov Y - Axis:"
Gui, Add, Edit, x260 y101 w30 vyrange, % Fov_Y
Gui, Add, Text, % "x" 192 " y" 150 " w" (Window.Width-192)-14, % "Lower Number = Larger the Fov"
Gui, Add, ActiveX, x175 y150 w308 h200, mshtml:<img src='https://i.imgur.com/fRT8Oa3.png' />
Gui, Tab, 5
Gui, Add, Text, x192 y66, Insert = On/Off | F2 = Restart
Gui, Add, Text, x192 y90, CoD Assist v4 by Patted

Gui, Add, ActiveX, x175 y150 w308 h200, mshtml:<img src='https://i.imgur.com/fRT8Oa3.png' />
Gui, Show, % " w" Window.Width " h" Window.Height, % Window.Title
GoSub, OnLoad
return
OnLoad:
SetPixelColor("4C4C4C", hMenuHover)
SetPixelColor("0E0C0D", hMenuSelect)
SetPixelColor("0E0C0D", hDividerLine)
SelectMenu("MenuItem1")
OnMessage(0x200, "WM_MOUSEMOVE")
return
MenuClick:
SelectMenu(A_GuiControl)
return
SelectMenu(Control) {
Global
CurrentMenu := Control
Loop, % Navigation.Label.Length() {
SetControlColor("808080", Navigation.Label[A_Index])
}
SetControlColor("000000", Control)
GuiControl, Move, pMenuSelect, % "x" 0 " y" (32*SubStr(Control, 9, 2))-14 " w" 4 " h" 32
GuiControl, Choose, TabControl, % SubStr(Control, 9, 2)
GuiControl,, PageTitle, % Navigation.Label[SubStr(Control, 9, 2)]
}
WM_MOUSEMOVE(wParam, lParam, Msg, Hwnd) {
Global
If (InStr(A_GuiControl, "MenuItem") = true && A_GuiControl != CurrentMenu) {
GuiControl, Move, pMenuHover, % "x" 0 " y" (32*SubStr(A_GuiControl, 9, 2))-14 " w" 4 " h" 32
} Else If (InStr(A_GuiControl, "MenuItem") = false || A_GuiControl = CurrentMenu) {
GuiControl, Move, pMenuHover, % "x" -999999 " y" -999999 " w" 4 " h" 32
}
}
SetControlColor(Color, Control) {
Global
GuiControl, % "+c" Color, % Control
GuiControlGet, ControlText,, % Control
GuiControlGet, ControlHandle, Hwnd, % Control
DllCall("SetWindowText", "Ptr", ControlHandle, "Str", ControlText)
}
SetPixelColor(Color, Handle) {
VarSetCapacity(BMBITS, 4, 0), Numput("0x" . Color, &BMBITS, 0, "UInt")
hBM := DllCall("Gdi32.dll\CreateBitmap", Int, 1, Int, 1, UInt, 1, UInt, 24, Ptr, 0)
hBM := DllCall("User32.dll\CopyImage", Ptr, hBM, UInt, 0, Int, 0, Int, 0, UInt, 0x2008)
DllCall("Gdi32.dll\SetBitmapBits", Ptr, hBM, UInt, 3, Ptr, &BMBITS)
return DllCall("User32.dll\SendMessage", Ptr, Handle, UInt, 0x172, Ptr, 0, Ptr, hBM)
}
Insert::
#Persistent
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 2511
#InstallKeybdHook
#UseHook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
SendMode, InputThenPlay
SetBatchLines,-1
ListLines, Off
CoordMode, Mouse, client
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, Normal
ZeroX := A_Screenwidth/2
ZeroY := A_Screenheight/2
CFovX := 80
CFovY := 200
ScanL := 660
ScanR := 1250
ScanT := 280
ScanB := 610
GuiControlget, rX
GuiControlget, xa
GuiControlget, ya
GuiControlget, xrange
GuiControlget, yrange
GuiControlget, shoot

Soundbeep, 750, 500
Loop,
{
Gui,Submit, Nohide
if (aimtype=1)
{
GetKeyState, Mouse2, LButton, P
if ( Mouse2 == "D" )
GoSub MouseMoves2
}
if (aimtype1=1)
{
GetKeyState, Mouse3, RButton, P
if ( Mouse3 == "D" )
GoSub MouseMoves2
}
if (trigger=1)
{
GoSub trigger
}

GetKeyState, Key1, Insert, P
if ( Key1 == "D")
{
Soundbeep
break
}
}

trigger:
{
GetKeyState, Key2, RButton, P
if ( Key2 == "D")
{
GoSub MouseMoves2
If (( AimPixelY ) > 0)
{

MouseClick, left

Sleep (sht) ; time between shots
}}}
return


MouseMoves2:
imageSearch, AimPixelX, AimPixelY, 0 + (A_Screenwidth * (xrange/10)), 0 + (A_Screenheight * (yrange/10)), A_Screenwidth - (A_Screenwidth * (xrange/10)), A_Screenheight - (A_Screenheight * (yrange / 10)),   *5 b800cc.png
if(AimPixelX != "" && AimPixelY != "")
{
GoSub GetAimOffset1
GoSub GetAimMoves1
}
Return

GetAimOffset1:
Gui,Submit, Nohide
AimX := AimPixelX - ZeroX +xa
AimY := AimPixelY - ZeroY +xy
if ( AimX+10 > 0)
{
DirX := rx / 10
}
else if ( AimX+5 > 0)
{
DirX := rx / 15
}
if ( AimX+10 < 0)
{
DirX := (-rx) / 10
}
else if ( AimX+5 < 0)
{
DirX := (-rx) / 15
}
if ( AimY+.25 > 0 )
{
DirY := rx /13
}
if ( AimY+.25 < 0 )
{
DirY := (-rx) /13
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
return

GetAimOffset2:
Gui,Submit, Nohide
AimX := AimPixelX - ZeroX +xa
AimY := AimPixelY - ZeroY +xy
if ( AimX+10 > 0)
{
DirX := rx / 10
}
else if ( AimX+5 > 0)
{
DirX := rx / 15
}
if ( AimX+10 < 0)
{
DirX := (-rx) / 10
}
else if ( AimX+5 < 0)
{
DirX := (-rx) / 15
}
if ( AimY+.25 > 0 )
{
DirY := rx /13
}
if ( AimY+.25 < 0 )
{
DirY := (-rx) /13
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
Return
GetAimMoves1:
RootX := Ceil(( AimOffsetX ** ( 1 )))
RootY := Ceil(( AimOffsetY ** ( 1 )))
MoveX := RootX * DirX
MoveY := RootY * DirY
DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
Return
reload:
SleepF1:
SleepDuration = 1
TimePeriod = 1
DllCall("Winmm\timeBeginPeriod", uint, TimePeriod)
Iterations = 1
StartTime := A_TickCount
Loop, %Iterations% {
DllCall("Sleep", UInt, TimePeriod)
}
DllCall("Winmm\timeEndPeriod", UInt, TimePeriod)
Return
DebugTool1:
MouseGetPos, MX, MY
ToolTip, %AimOffsetX% | %AimOffsetY%
ToolTip, %AimX% | %AimY%
ToolTip, %IntAimX% | %IntAimY%
ToolTip, %RootX% | %RootY%
ToolTip, %MoveX% | %MoveY% || %MX% %MY%
Return
{
DllCall("mouse_event", uint, 1, int, 0, int, 1, uint, 0, int, 0)
Sleep, 15
DllCall("mouse_event", uint, 1, int, 0, int, 1, uint, 0, int, 0)
Sleep, 5
}
Return

F2::
Reload

GuiClose:
gui,submit
iniwrite,%rx%,settings.ini,settings,senShort
iniwrite,%xrange%,settings.ini,settings,FovX
iniwrite,%yrange%,settings.ini,settings,FovY
iniwrite,%xa%,settings.ini,settings,AimShortX
iniwrite,%xy%,settings.ini,settings,AimShortY
iniwrite,%sht%,settings.ini,settings,Shoot

ExitApp
