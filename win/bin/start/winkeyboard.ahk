;=========================================================================
; AUTOHOTKEY quick reference
;=========================================================================
; $ = hook, prevent circular reference?
; ! = ALT
; ^ = CTRL
; # = windows key

;-------------------------------------------------------------------------
; Notes:
;-------------------------------------------------------------------------
; In Windows, ALT key is rarely used, but it is also one of the most useful
; keys.  Also thumb is the strongest finger. Pinkie is the weakest.

; Swapping Windows key does not work in RDP

;-------------------------------------------------------------------------
; Installation:
; SharpKeys:
; TODO: we can set registry here usig RegRead/RegWrite!
;-------------------------------------------------------------------------
; remap CapsLock to Left Control (Optional)

; Remap Left Alt to Right Control!!!
; to avoid collision with autohotkey scripts
; NOTE: possibly map to RIGHT WIN/ALT instead?
; OLD: tried using Winkey as thumb key
; but Swapping Windows key does not work in RDP
; remap Left Alt to Left Windows
; remap LEFT WIN to Right CTRL?
;   so that Win+Ctrl combo is still possible
;   but there aren't many Alt+Win combo

;=========================================================================
; Recommended system-wide setting
;=========================================================================
SendMode Input          ; recommended for input
#NoEnv
#SingleInstance Force ; it make sure only one instance of this script is running

; --- Enable Numlock ----
SetNumLockState, AlwaysOn

; OutputDebug, starting the app
;===========================================================================
; MENU: force it to run as Administrator
; add it as Menu (not as hotkey, for now, hard to remember)
;===========================================================================
#Persistent  ; Keep the script running until the user exits it.
Menu, Tray, Add  ; Creates a separator line.
    Menu, Tray, Add, Run as Admin, RunAsAdmin ; Creates a new menu item.
    return

; RunAsAdmin:
RunAsAdmin() {
    ; MsgBox You selected %A_ThisMenuItem% from menu %A_ThisMenu%.
    SetWorkingDir %A_ScriptDir%
    if not A_IsAdmin {
        Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
        }
}


;-------------------------------------------------------------------------
;[PAUSE/BREAK]
; Pressing Pause/Break will toggle AHK script; Useful when you want to quickly switch off AHK, esp when you want to share the keyboard with someone else
; Suspend means all hotkeys are disabled
;-------------------------------------------------------------------------
Pause::Suspend

;-------------------------------------------------------------------------
; DISABLED: swap Alt with Win
; NOTE: doesn't seem to trigger win key mapping
;-------------------------------------------------------------------------
;RAlt::RWin

;=========================================================================
; WINDOWS-Specific
;=========================================================================
;-------------------------------------------------------------------------
; ALT Tab
;-------------------------------------------------------------------------
; Reason we can't map All Alt to CTRL is that CTRL-C,V,X,A,Z is special and
; they can mess up terminal.  We want to actually copy and paste when pressing
; ALT vs the real CTRL key.
; Possible Solution:
; LCtrl & Tab - cannot use Copy/Paste if using left control
; LCtrl & Tab:: AltTab -- this doesn't work in Admin mode in PS, CMD.exe
; Use RCtrl so that LCtrl is used for LCtrl-C for Stop, and RCtrl-C for copy
; also CTRL & TAB won't work in another IME, only works in English???

;Ctrl & tab:: AltTab ; Using all Ctrl instead of ALT
RCtrl & tab:: AltTab ; Using RCtrl instead of ALT
    ; this was needed when LAlt was mapped to RCTRL
; LWin & tab:: AltTab ; Windows key version

/*
; TODO: not sure whether to use LAlt or RAlt???
; DOES NOT WORK!!!
; Right Alt
; VistaSwitcher can do this.
; $>!`::Send ^{tab}
*/

;-------------------------------------------------------------------------
; ALT keys replacing Control key
; Copy/Cut/Paste using ALT key -- note: causes problem with console, where ALT keys are intercepted???
; also Problem with EMACS
;-------------------------------------------------------------------------
$<!a::Send ^a

; alt+c,x,v doesn't work in some app (notepad, visual studio CE), but works in others?
$<!c::Send ^c
$<!v::Send ^v
$<!x::Send ^x

$<!z::Send ^z
; todo: isntead use alt+backspace

; possibly, instead use alt, but this fails in File Explorer
; $<!c:: Send ^{Ins}
; $<!v:: Send +{Ins}
; $<!x:: Send +{Del}


;; alt-tab, shift-alt tab

; $<!`::Send ^`
$<!b::Send ^b
$<!f::Send ^f
$<!g::Send ^g
$<!i::Send ^i
$<!l::Send ^l
$<!n::Send ^n
$<!r::Send ^r
$<!t::Send ^t
$<!+t::Send ^+t
$<!w::Send ^w

;; alt-w => ctrl-w
;-------------------------------------------------------------------------
; Copy/Cut/Paste using Win key
;
; NOTE: how to use Win key exclusively? don't know
;      this works with Shift-Win, Ctrl-Win, etc...
;       I want Win only. Not using wildcard (*)
;       Perhaps create another key
;       But strangely, Win-A is exclusive, not wildcard
;-------------------------------------------------------------------------
/*
;#a::^a    ; replace action center
;#c::^c     ; replaces cortana
;#v::^v      ; replaces notification
;#x::^x     ; replaces quick-link-menu
;#z::^z     ; replaces full-screen menu
;#s::^s     ; replaces search
;#n::^n     ; replaces (undefined)
;#i::^i     ; replaces setting
;#b::^b     ; replaces set focus on notification area
;#f::^f      ; replaces Feedback Hub
;#o::^o      ; replaces Lock-orientation switch
;#t::^t      ; replaces Cycle through apps on taskbar
;#w::^w      ; replaces (undefined)
;#y::^y      ;REDO in mac, replaces (switch mixed reality)
;#m::WinMinimize,a ; Mac minimize this window; replaces Minimize ALl WIndows
; ;; #u::^u     ; replaces ease of access center
            ; looks like #u cannot be remapped.
; ;;#j, #k set aside for virtual desktop, see below
*/

;-------------------------------------------------------------------------
; CMD+F = F3, Find and Find Next/prev
;-------------------------------------------------------------------------
; [CTRL]+[g]
$>^g::Send {F3}
; WinG doesn't work (cannot be mapped?)
;#g::Send {F3}

; [CTRL]+[G]
$>^+G::Send {Shift Down}{F3}{Shift Up}
;#+G::Send {F3}

;-------------------------------------------------------------------------
; Quit, [CTRL]+[q]
;-------------------------------------------------------------------------
; Alt+F4  OR Alt+Space C
;$>^q::Send !{f4}
;$!w::Send !{f4}
;#q::Send !{f4}
$<!q::Send !{f4}
;$!q::Send {Alt Down}{F4}{Alt Up} ; doesn't work. use send !{f4}

; this could also be Ctrl+F4, but not sure which one is more compatible

;-------------------------------------------------------------------------
; Alt+Shift+[, alt+shift+] -> go to next/prev tab (Chrome, FF) 
;-------------------------------------------------------------------------
$<!}::Send ^{Tab}
$<!{::Send ^+{Tab}

;-------------------------------------------------------------------------
; Ctrl+arrow
;-------------------------------------------------------------------------
; Alt+ uparrow => Ctrl+Home / go to top of document
; Alt+ downarrow => Ctrl+End / go to bottom of document
; Alt up/down is useful in Visual Code, as it moves lines up/down
; so use Right Alt to do this, since it is still preserved on RAlt
RCtrl & up::Send ^{home}
RCtrl & down::Send ^{end}
>^left::Send {home}

; RCtrl & left::Send {home} ; Don't use this as it also captures Windows key
;RCtrl & right::Send {end}
; Don't use this as it also captures Windows key
>^right::Send {end}

;   WIN KEY version
;   Win-J, WIn-K is Home/End
;#j::Send ^{home}
;#k::Send ^{end}

;===========================================================================
; Virtual Desktop deskspace -
; default Win: LCtrl+Win+arrow = switch desk space
; I want Mac style, where it is CMD+LAlt+Arrow
; mimic Mac's desktop move. Win + RCtrl + left = same as Win+LCtrl+left
; Mac = CMd+Alt+left.   Win = WIn+Ctrl+left
;
; * NOTE: not needed on window once ctrl was mapped to ALT
;           since by default, Ctrl+Win+arrow is switch desk space
; * It was hard to remap ctrl+tab, and so using vim-style
; * Win+] = next desktop, but it was interfering with Win },{
; * win+[ = prev desktop
; * was using Win+j/k but it felt it could be app-specific
;===========================================================================
;use menu key to open taskview
;AppsKey::#Tab

; Ctrl+Tab
; move through desktop spaces
;RCtrl & Tab::send #A

; Alt+win+left/right
; Note: if you need to repeat this action, you need to release the key and press again
; unlike default Win+ctrl+arrow, where you can just hold down key to continue 
; todo: use {blind} ... but not sure how to do it...
$!#right::Send ^#{Right}
$!#left::Send ^#{Left}


;===========================================================================
; Remap Caps Lock in Windows (escape *and* control) https://superuser.com/a/581988
; However, it won't be able to do momentary ESCAPE
;===========================================================================
;-------------------------
; * switch capslock with control just in case it didn't
; * only because Leopold kb is switched
; * was using L/RCtrl instead of Ctrl to avoid loops (from LCtrl -double function)
;-------------------------
; Capslock::Ctrl

;-------------------------
; * uses hardware switch
; * but capslock (no matter where it is) should be ctrl
; * in case of Leopold keyboard, it switches Capslock with Ctrl
; *   but I want new capslock (CTRL) to act as ctrl, still
; * Capslock dual function - original , but not workin gwell
;-------------------------
; *CapsLock::
;     Send {Blind}{Ctrl Down}
;     cDown := A_TickCount
; Return

; *CapsLock up::
;     If ((A_TickCount-cDown)<200)  ; Modify press time as needed (milliseconds)
;         Send {Blind}{Ctrl Up}{Esc}
;     Else
;         Send {Blind}{Ctrl Up}
; Return

;===========================================================================
; DUal function - CTRL as both ESC and CTRL
;===========================================================================
;-------------------------------------------------------
; NOTE: trick* - it works for some reason, but only on hardware CTRL (unmapped)
; for weird reason it works as momentary ESC/CTRL
; sometimes LCtrl works. Sometimes CTRL works
;-------------------------------------------------------
Ctrl::Send {esc}    ; this works (on normal keyboard)
    ; currently disabled since I'm running DZ60/QMK keyboard
;-------------------------------------------------------
; Alternative settings
;-------------------------------------------------------
;LCtrl::Send {esc}   ;this works on certain kb ie Leopold keyboard
; not momentary in synergy + no mod + QMS?
;-------------------------------------------------------
; original, but not working well ; use this only if the trick* doesn't work
;-------------------------------------------------------
; *LCtrl::
;     Send {Blind}{LCtrl Down}
;     cDown := A_TickCount
; Return
; *LCtrl up::
;     If ((A_TickCount-cDown)<200)  ; Modify press time as needed (milliseconds)
;         Send {Blind}{LCtrl Up}{Esc}
;     Else
;         Send {Blind}{LCtrl Up}
; Return


;===========================================================================
; Space Cadet shift as parenthesis -- Shift only as ( )
; (200ms too fast?  changed to 400ms)
; DISABLED IT BECAUSE on remote deskotp, it doesn't work, printing 9 and 0
; ((())((((
;===========================================================================
; https://autohotkey.com/board/topic/98742-remapping-shift-key/
; ~LShift::
; 	KeyWait, LShift
; 	If (A_TimeSinceThisHotkey < 300 and A_PriorKey = "LShift") {
; 	; If (A_TimeSinceThisHotkey < 500 and A_TimeSinceThisHotkey < 800 and A_PriorKey = "LShift") {
; 		Send, (
; 	}
; return
;
; ~RShift::
; 	KeyWait, RShift
; 	If (A_TimeSinceThisHotkey < 300 and A_PriorKey = "RShift") {
; 	; If (A_TimeSinceThisHotkey < 500 and A_TimeSinceThisHotkey < 800 and A_PriorKey = "RShift") {
; 		Send, )
; 	}
; return
;
;===========================================================================
; Alt-backtick , just like Mac
; my post:https://superuser.com/a/1465387/790554
; Modified heavily from https://superuser.com/a/768060
;===========================================================================
!`::    ; Next window if using alt-backtick
    ;#`::    ; Next window if using Win-backtick
    ; ^`::    ; Next window if using Ctrl-backtick (ME: LAlt -> RCTRL)
    WinGet, ExeName, ProcessName , A
    WinGet, ExeCount, Count, ahk_exe %ExeName%
    If ExeCount = 1
        Return
    Else
        WinSet, Bottom,, A
        WinActivate, ahk_exe %ExeName%
return

!+`::    ; prev window, Alt+shift+backtick
    WinGet, ExeName, ProcessName , A
    WinActivateBottom, ahk_exe %ExeName%
return

;===========================================================================
; Others
;===========================================================================
; replace INSERT key, as it is annoying
INSERT::return

;===========================================================================
; Numeric keypad
;===========================================================================
NumpadSub::Send {Volume_Up}
NumpadAdd::Send {Volume_Down}
; Numpad0::KeyHistory
Numpad0::Send {F5}
;NumPad1::Send {Volume_Up}
NumpadDiv::DllCall("LockWorkStation")
;NumpadMult::Send {}
;NumpadEnter::Send {}
;NumpadDot::Send {}
; Numlock::DllCall("LockWorkStation")
; NumDel::Send {PrintScreen}

; Calculator button, doesn't work if using Synergy from Mac
;Launch_App2::Send {Volume_Down}
Launch_App2::
    ; ==== SWAP mouse button  ====
    ; https://github.com/jNizM/AHK_DllCall_WinAPI/blob/master/src/Mouse%20Input%20Functions/SwapMouseButton.ahk
    buttonState := DllCall("user32.dll\SwapMouseButton", "UInt", 1)
    if buttonState <> 0
    {
        buttonState := DllCall("user32.dll\SwapMouseButton", "UInt", 0)
    }
return

;===========================================================================
; Function / media keys
;===========================================================================
;RAlt & F7::SendInput {Media_Prev}
;RAlt & F8::SendInput {Media_Play_Pause}
;RAlt & F9::SendInput {Media_Next}
;; might interfere with Visual Studio
;F10::SendInput {Volume_Mute}
;F11::SendInput {Volume_Down}
;F12::SendInput {Volume_Up}

;===========================================================================
; Test
;===========================================================================
; ::btw::
; Send, by the way
; return
;
; :*:lol::Laughing Out Loud
;
; :*?:]dd::  ; This hotstring replaces "]d" with the current date and time via the functions below.
; ;SendInput FormatTime(, "M/d/yyyy h:mm tt")  ; It will look like 9/1/2005 3:53 PM
;     FormatTime, TimeString, "M/d/yyyy h:mm tt" 
;     Send, %TimeString%
;     return
;
; :*:]dt::
;     FormatTime, TimeString, , yyyy-MM-dd HH:mm
;     Send, %TimeString%
;     Return
;
; :*?:]t::
;     FormatTime, TimeString, , HHmm
;     Send, %TimeString%
;     Return

;===========================================================================
; App-specific
;===========================================================================
;-------------------------------------------------------------------------
; [CTRL]+[]] and [CTRL]+[[]
; TAB on Chrome tab, and others... doesn't work on all
; Mac: Cmd+Shift+] or [ go to next/prev tabs
; Win: Ctrl+Tab, Ctrl+Shift+Tab
; HOWEVER, moved to each individual app, not global
; because it was interfering with other apps
;-------------------------------------------------------------------------
; #}::Send ^{Tab}
; #{::Send ^+{Tab}

; GLOBAL - not n
; $^}::Send ^{Tab}
; $^{::Send ^+{Tab}

; If using ctrl instead
; ^}::Send ^{Tab}
; ^{::Send ^+{Tab}
;$^+]::Send ^{Tab}
;$^+[::Send ^+{Tab}
; Must have $ or else it will call ^+] as well

;SetTitleMatchMode 2 ;- Mode 2 is window title substring.
;#IfWinActive, OneNote ; Only apply this script to onenote.


;=========================================================================
; TESTING only
;=========================================================================
;if WinActive("ahk_class Notepad") or WinActive("ahk_exe chrome.exe")

;=========================================================================
; Google Chrome, but ignore VSCode, and Electron apps
;-------------------------------------------------------------------------
; use chrome.exe instead, as it Chrome_WidgetWin_1 works on all Electron app, including VSCode
; I don't want to apply it to VSCode
; #IfWinActive, ahk_class Chrome_WidgetWin_1
#IfWinActive, ahk_exe chrome.exe
; Show Web Developer Tools with cmd + alt + i
^<!i::Send {F12}
; Show source code with cmd + alt + u
;#^u::Send ^u ;howeer, cannot map #u?

; $^}::Send ^{Tab}
; $^{::Send ^+{Tab}


; Disable ALT key in chrome, as it focuses on Menu button!!!
Alt::return  

;=========================================================================
; Vivaldi browser
;-------------------------------------------------------------------------
#IfWinActive, ahk_exe vivaldi.exe
$<!}::Send ^{PgDn}
$<!{::Send ^{PgUp}

;=========================================================================
; Firefox
;-------------------------------------------------------------------------
#IfWinActive ahk_class MozillaWindowClass
; $^}::Send ^{Tab}
; $^{::Send ^+{Tab}
; $<!}::Send ^{Tab}
; $<!{::Send ^+{Tab}

;=========================================================================
; Vim, GVim
;-------------------------------------------------------------------------
#IfWinActive ahk_class Vim
;--------------------------------------------
; Cut,copy,paste
;Copy, paste, cut in WinVim

; using Right control + C/V/X
; use +{Insert} instead
; $>^c:: Send ^{Ins}
; ctrl-v
; $>^x::Send +{Del}

; OLD -- below failed
; ;{Shift down}{Insert}{Shift Up} is causing problem with shift getting stuck
; ;$>^c:: Send {Ctrl Down}{Insert}{Ctrl Up}
; ;$>^v::Send {Shift down}{Insert}{Shift Up}
; ;$>^x::Send {Shift Down}{Del}{Shift Up}

; ; issue with ctrl-v
; ; for some weird reason, ctrl+v sometimes get stuck with ctrl down
; ; could be acting like CapsLock?  
; ; or shift causing it to get stuck as capslock?
; ;$>^v::Send {Esc}+{Ins}{Esc}
; ;$>^v::Send "{+}gP
; ; temporary solution: use mouse middle-button to paste (which is default behavior)
; ; or use <leader>v to paste
; ; TODO: when I get a new programmable keyboard, try again


;; --- Use ALT+C/V/X
;; This may not be necessary if vimrc `behave mswin` is enabled. 
;; however, vim's behave mswin isn't working, so ...
;; also I want to use ALT instead of CTRL
$<!c:: Send ^{Ins}
$<!v:: Send +{Ins}
$<!x:: Send +{Del}

; ; OLD ----
; ; better paste, works with terminal, but doesn't work with Explorer
; ; $!c:: Send {Ctrl Down}{Insert}{Ctrl Up}
; ; $!v::Send {Shift down}{Insert}{Shift Up}
; ; $!x::Send {Shift Down}{Del}{Shift Up}

;; Use WIN+C/V/X
;#space::MsgBox "Pressed Win+Space in VIM"
;#c:: Send {Ctrl Down}{Insert}{Ctrl Up}
; better paste, works with terminal, but doesn't work with Explorer
;#v::Send {Shift down}{Insert}{Shift Up}
;#x::Send {Shift Down}{Del}{Shift Up}
;--------------------------------------------
; SWITCH TAB
; this cannot be done in vimrc since {,[ cannot be mapped using ctrl ALT+}, ALT+{
$<!}::Send {Esc}:tabn{Enter}
$<!{::Send {Esc}:tabp{Enter}

; using ctrl instead of ALT
; CTRL+}, CTRL+{
; $^}::Send {Esc}:tabn{Enter}
; $^{::Send {Esc}:tabp{Enter}

;=========================================================================
; Neovim GUI apps: neovim-qt, neovide, goneovim,...
;=========================================================================
#IfWinActive ahk_exe nvim-qt.exe
; SWITCH TAB
; this cannot be done in vimrc since {,[ cannot be mapped using ctrl ALT+}, ALT+{
$<!}::Send {Esc}:tabn{Enter}
$<!{::Send {Esc}:tabp{Enter}

#IfWinActive ahk_exe neovide.exe
$<!}::Send {Esc}:tabn{Enter}
$<!{::Send {Esc}:tabp{Enter}

#IfWinActive ahk_exe goneovim.exe
$<!}::Send {Esc}:tabn{Enter}
$<!{::Send {Esc}:tabp{Enter}

;=========================================================================
; Mintty, Cygwin,
; NOTE: it uses right control, not left.  Could pose problem
;-------------------------------------------------------------------------
#IfWinActive ahk_class mintty
; $>^c:: Send ^{Insert}
; $>^v::Send +{Insert}
; $>^x::Send +{Del}
;;$>^x::MsgBox "Ctrl-X"

; TEST
;#space::MsgBox "Pressed Win+Space in Mintty"

$<!c:: Send ^{Insert}
$<!v::Send +{Insert}
; there is no ^x/cut in mintty 
; $!x::Send +{Del}

; Everything Search App
; Currently hotkey not needed, and using Wox (front-end to Everything) instead
; hotkey for Everything (currently set to Win+Shift+F)
; RCtrl & space::Send #F


;=========================================================================
; Emacs
;-------------------------------------------------------------------------
#IfWinActive ahk_class Emacs
$<!a::Send !a
$<!c::Send !c
$<!v::Send !v
$<!x::Send !x
$<!z::Send !z
$<!t::Send !t
$<!l::Send !l
$<!f::Send !f
$<!n::Send !n
$<!r::Send !r
$<!g::Send !g
$<!w::Send !w

;=========================================================================
; Visual Studio
;-------------------------------------------------------------------------
#IfWinActive ahk_exe devenv.exe

;Next/Prev tab: `ctrl+alt+pageup`, `ctrl+alt+pagedown`

$<!}::Send ^!{PgDn}
$<!{::Send ^!{PgUp}

;=========================================================================
; ConEmu
;
; Better to set hotkey in ConEmu setting
; change switch-next-Console, console-prev to ctrl-shift [,]
; change new-console to ctrl-t
; disable "install keyboard hooks"
; no need to do ctrl-c, ctrl-v because it is handled by mouse
;    see ConEmu -> setting -> Key & Macro -> Mark/Copy -> Select text with mouse -> Copy on Left Button Release
;-------------------------------------------------------------------------
#IfWinActive ahk_class VirtualConsoleClass
$!q::Send #{f4}
; next/prev tab
; $!}::Send ^+{Tab}
; $!{::Send ^+{Tab}
; $^}::Send ^+{Tab}
; $^{::Send ^{Tab}
$<!{::Send ^{Tab}

; ctrl+shift+tab
; was disabled: was using conemu's own hotkey instead of autohotkey
; not perfect, but better than nothing
$<!}::Send ^+{Tab}

; old
; $^}::send
; $^{::send #q
;;Won't work because #q is reserved.
; only works one direction for now...

#IfWinActive
; End app-specific code here


;--------------------------
; EOF: Nothing else below
;--------------------------
