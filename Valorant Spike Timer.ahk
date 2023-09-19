#SingleInstance Force
#HotkeyModifierTimeout -1		
Gui, +AlwaysOnTop +LastFound +toolwindow -caption
Gui, Color, FFFFFF
WinSet, TransColor, FFFFFF 255
Gui, Font, s28 c00FF00 q4 w600, Arial Black
Gui, Add, Text, x20 vUserVar w1000 h400
coordmode, pixel, Relative


settime := 45 ;default 45
countdown := settime
toggle := false

f1::
if (toggle = true){  
toggle := false
}else{
toggle := true
Loop{
;PixelSearch, OX, OY, 1075, 183, 1085, 199, 0xECEEB3, 3, Fast RGB ;works for attacking 100% of the time
PixelSearch, OX, OY, 930, 30, 945, 45, 0x850000, 5, Fast RGB
if (ErrorLevel = 0) {
toggle := false
Sleep 10
}else if (toggle = false){
Send {\}
}
}
}
return


\::
Gui, Show, w150 h150 x915 y105 NoActivate
GuiControl,,UserVar,%countdown%
SetTimer, Second, 1000
return

Second:
if (countdown > 21) {
Gui, Font, c00FF00 ;green
GuiControl, Font, UserVar
countdown--
GuiControl,,UserVar,%countdown%

}else if (countdown > 11) {
Gui, Font, cFFFF00 ;yellow
GuiControl, Font, UserVar
countdown--
GuiControl,,UserVar,%countdown%

}else if (countdown > 10) { ;extra buffer for double to single below
Gui, Font, cFFA500 ;Orange
GuiControl, Font, UserVar
countdown--
GuiControl,,UserVar,%countdown%

}else if (countdown > 6) {
GuiControl, Move, UserVar, x+33 ;to account for text going from double digit to single
Gui, Font, cFFA500 ;Orange
GuiControl, Font, UserVar
countdown--
GuiControl,,UserVar,%countdown%

}else if (countdown > 0) {
Gui, Font, cFF0000 ;red
GuiControl, Font, UserVar
countdown--
GuiControl,,UserVar,%countdown%

}else{
;toggle := false
Gui, Font, c00FF00
GuiControl, Font, UserVar
countdown := settime
milcount := 0
GuiControl,,UserVar,%countdown%
SetTimer, Second, Off
Gui, Hide

return
}

return