#SingleInstance, Force
; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; GUI
Gui, Font, cWhite
; botoN CREA LISTA
Gui, Add, Text, x15 y20, Crear lista
Gui, Add, Button, x35 y40 w50 h20 gLista, Crea
; botoN REPRODUCE LISTA
Gui, Add, Text, x200 y20, Reproducir lista
Gui, Add, Button, x215 y40 w50 h20 gPlay, PLAY

Gui, Add, Picture,x0 w320 h-1, %A_ScriptDir%/Figs/Logo.png
Gui, Color, Black
Gui, Show, x400 y50 w320 h195, YouPlayTubeList
return
; LABELS
GuiClose:
    ExitApp
    return
; #########################################################################
Lista:
    ; msgbox, Pega la URL

InputBox, URLPLayList, URL de la playlist, Pega la URL de playlist de YouTube: ,100,300, , , locale
Switch ErrorLevel
{
case 0:
Needle := "https://youtube.com/playlist?"

If InStr(URLPLayList,Needle)
{
    InputBox, NamePLayList, Nombre de la playlist, Nombre: ,50,200, , , locale
    If NamePLayList =
    {
	s := (s := "0123456789abcdefghijklmnopqrstuvwxyz") . s . s
        loop, 6 {
	    Random, r, 1, StrLen(s)
	    i .= (c := SubStr(s, r, 1))
	    StrReplace(s, c, "",, 1)
	}
	NamePLayList = Playlist_%i%
    }
    MsgBox, Tu playlist es %NamePLayList%
    ; Lee Ruta de Youtube-DL
    FileReadLine, DirYoutubeDL, %A_WorkingDir%/CONFIG.txt, 1
    ; MsgBox, Youtube-DL dir: %DirYoutubeDL%
    Run cmd.exe /c cd "%DirYoutubeDL%" && youtube-dl.exe  --get-id %URLPLayList% -i > %NamePLayList%.txt
	; Run cmd.exe, %DirYoutubeDL%
	; WinWait, ahk_exe cmd.exe
	; Send youtube-dl.exe  --get-id %URLPLayList% -i > %NamePLayList%.txt
}
Else
    MsgBox, Revisa el formato de tu URL debe contener: %Needle%.

case 1:
MsgBox, Bye!
}

    return
; #########################################################################
Play:
    ; msgbox, Play

FileReadLine, DirYoutubeDL, %A_WorkingDir%/CONFIG.txt, 1

FileSelectFile, PlaylistFile, 3, %DirYoutubeDL%, Selecciona la playlist (*.txt), *txt

if (PlaylistFile = "")
    MsgBox, Sin playlist. Ciao!
else
{
    YTtemplate=https://www.youtube.com/watch?v=
    Array := StrSplit(PlaylistFile, "\")
    MsgBox, % "Reproducir: "Array[Array.Length()]
    ; OPEN VLC
    ; Run cmd.exe /c cd "%A_ProgramFiles%"\VideoLAN\VLC && vlc --intf rc --extraintf skins2
	Run cmd.exe, %A_ProgramFiles%\VideoLAN\VLC
    WinWait, ahk_exe cmd.exe
    Send vlc --intf rc --extraintf skins2{Enter}
    WinWait vlc  --intf rc --extraintf skins2
    WinActivate

    ; WinGet, pidVLCcw, PID, A

    FileRead, FilePlay, %PlaylistFile%

    ListArray := []
    ; Completa el Array con las IDs de las URLs
    loop, parse, FilePlay, `n
	ListArray.push(A_LoopField)
    ; Identificar PID de VLC commanf Window
    WinGet, pidVLCcw, PID, A
    ; MsgBox, The active window's PID is "%pidVLCcw%".
    ; Agregar al VLC
    for each, line in ListArray
    {
	; MsgBox Cargar Canción
        ; Send a{Enter}
	if (line ="") {
	    ; MsgBox, Empty.
	} else{
	    WinActivate, ahk_pid %pidVLCcw%
	    ; Send enqueue %YTtemplate%%line%{Enter}
		; Send enqueue %YTtemplate%%line% :network-caching=5000{Enter}
		Send enqueue %YTtemplate%%line%
	    ; Send status{Enter}	
	    ; Send add %YTtemplate%%line%{Enter}
	    Sleep, 999
		Send {Enter}
	}
    }
	Send playlist{Enter}
    WinActivate, ahk_pid %pidVLCcw%
	WinClose, ahk_exe cmd.exe 
    Send play{Enter}
}

    return

; FUNCTIONS

^x::ExitApp