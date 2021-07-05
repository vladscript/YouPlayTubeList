#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^q::

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
    Run cmd.exe /c cd "%A_ProgramFiles%"\VideoLAN\VLC && vlc --intf rc --extraintf skins2

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
	    Send enqueue %YTtemplate%%line%{Enter}	
	    ; Send add %YTtemplate%%line%{Enter}
	    Sleep, 1000
	}
    }
    WinActivate, ahk_pid %pidVLCcw%
    Send play{Enter}
}