# **Reproduce Playlists de Youtube en VLC**

![YouPlayTubeList](/Figs/Logo.png "YouPlayTubeList")

## **Meta:**
Reproducir videos directamente de la URL de alguna playlist de Youtube, una y otra vez.

## **Motivación:**
1. VLC no reproduce videos directamente de las URLs de playlists
2. Después de pegar URLs, una a una. VLC no es capaz de reproducir la lista guardada o después de un tiempo aparece un error similar a este:
![Error](/Figs/Error.png)

## **Antecedentes**

Hay plugins para reproducir playlists en  VLC: [1](https://www.maketecheasier.com/play-youtube-playlist-vlc/) y [2](https://gist.github.com/bastibeckr/16f57b6bdecf27b772d6433b2090bf61). Mi experiencia: no funcionan.

## **Solución**
Usar Autohotkey [AHK](https://www.autohotkey.com/) para extraer automáticamente URLs de los videos usando [youtube-dl](http://ytdl-org.github.io/youtube-dl/) para guardarlas en archivos de texto. Posteriormente, con otro script de Autohotkey, lee las URLs y las pega en la consola de [VLC](https://www.videolan.org/).

### Requisitos:
- Símbolo del sistema, **CMD** de Windows  [?](https://en.wikipedia.org/wiki/Cmd.exe)
- **VLC** [descarga](https://www.videolan.org/vlc/download-windows.html)
- Ejecutable de **youtube-dl** [descarga](http://ytdl-org.github.io/youtube-dl/download.html)
- **Autohotkey** (AHK) [descarga](https://www.autohotkey.com/download/)
- Editar: CONFIG.txt [Instalación](#Insta-id)
- Conexión a Internet

### Testeado en:
- [x] Windows 10
- [x] VLC 3.0.12, 3.0.16 Vetinari
- [x] Youtube-DL 2021.04.01
- [x] Autohotkey v1.1.33.09
---
## Instalación {#Insta-id}

* VLC: descarga e instala configuración default
* Guardar youtube-dl.exe en, por ejemplo, 'C:/Usuario/Mi Música'
* Descargar este script en un folder: MyFolder
* Modificar MyFolder/CONFIG.txt reemplazar el directorio que está con el que donde descargaste youtube-dl.exe (C:/Usuario/Mi Música)

## Instrucciones de Uso

### Sin AHK
* Después de descargar y configurar, ejecutar PlayTubeYouList.exe
### Con AHK & Interfaz Gráfica
* Después de descargar y configurar, ejecutar PlayTubeYouListVLCDL.ahk
### Con AHK & Sin Interfaz Gráfica
* Después de descargar y configurar, 
* Ejecutar GetPlaylist.ahk para crear lista, CTRL+Q
* Ejecutar PlayPlaylist.ahk para reproducr lista, CTRL+Q


## Recomendaciones
* Playlist cortas (hasta decenas de videos ~60)
* En medida de lo posible guarda videos sin restricción de edad (sólo audio)

## Áreas de oportunidad
* Algunas URLs no se añaden a la playlist correctamente (tiempo de procesado?)
* En lugar de usar la consola de VLC, se puede controlar las teclas con AHK en la interfaz gráfica normal pegando una a una las URLs con CTRL+V y tabs para darle a 'Encolar'
* Para abrir más playlists hay que iniciar un VLC nuevo

## REFERENCIAS

* Input Box [video](https://www.youtube.com/watch?v=S_VIpylSleU)
* Strings [web1](https://www.autohotkey.com/boards/viewtopic.php?t=76052), [web2](https://www.autohotkey.com/boards/viewtopic.php?style=19&t=87441&p=384623)
* Read Text File in Arrays [video](https://www.youtube.com/watch?v=NtO91mr9a5o),[web](https://www.autohotkey.com/boards/viewtopic.php?t=51025)
* Save text in CMD [video](https://www.youtube.com/watch?v=1zZ88P5ppDE)
* CMD y Autohotkey [video](https://www.youtube.com/watch?v=WTJHwEl1Wk8&t=43s)
* Youtube-DL y Autohotkey [video](https://www.youtube.com/watch?v=8q2BFjhP9OA)
* Videos restringidos por edad [web](https://github.com/blackjack4494/yt-dlc/issues/7)
* Interfaces VLC [web](https://wiki.videolan.org/Interfaces/)
* Comandos de VLC [web](https://wiki.videolan.org/VLC_command-line_help/)
* GUIs en VLC [video](https://www.youtube.com/watch?v=smcfM3bdB8I)
* Font [web](https://en.fonttextup.com/cyberpunk-font-generator.html)
* Icons [web](http://www.xiconeditor.com/)# platubelist
* AHK en Notepad++ [video](https://www.youtube.com/watch?v=CsP8-Sc0J4o)[Código](https://stackoverflow.com/questions/45466733/autohotkey-syntax-highlighting-in-notepad)