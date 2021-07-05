#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^q::

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
}
Else
    MsgBox, Revisa el formato de tu URL debe contener: %Needle%.

case 1:
MsgBox, Bye!
}
return