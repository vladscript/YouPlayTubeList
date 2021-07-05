# **Reproduce Playlists de Youtube en VLC**

![YouPlayTubeList](/Figs/Logo.png "YouPlayTubeList")

## **Meta:**
Reproducir videos directamente de las URLs de las playlists de Youtube, una y otra vez.

## **Motivación:**
1. VLC no reproduce videos directamente de las URLs de playlists (hasta el momento).
2. Después de pegar URLs, una a una, y guardar como lista de VLC, posteriormente no es capaz de reproducir la lista guardada o aparece un error similar a este:

![Error](/Figs/Error.png)

## **Antecedentes**

Hay (o había) plugins para reproducir playlists en  VLC: [1](https://www.maketecheasier.com/play-youtube-playlist-vlc/) y [2](https://gist.github.com/bastibeckr/16f57b6bdecf27b772d6433b2090bf61). Mi experiencia: no funcionan.

## **Solución**
Usar Autohotkey ([AHK](https://www.autohotkey.com/)) para extraer automáticamente URLs de los videos usando [youtube-dl](http://ytdl-org.github.io/youtube-dl/) para guardarlas en archivos de texto. 
Posteriormente, con otro script de AHK, leer y pegar las URLs en la consola de [VLC](https://www.videolan.org/).

### Requisitos:
- Símbolo del sistema, **CMD** de Windows  [¿Qué es?](https://en.wikipedia.org/wiki/Cmd.exe)
- **VLC**: [descarga](https://www.videolan.org/vlc/download-windows.html)
- Ejecutable de **youtube-dl**: [descarga](http://ytdl-org.github.io/youtube-dl/download.html)
- **Autohotkey** (AHK): [descarga](https://www.autohotkey.com/download/) (opcional).
- Conexión a Internet

### Testeado en:
- [x] Windows 10
- [x] VLC 3.0.12, 3.0.16 Vetinari
- [x] Youtube-DL 2021.04.01
- [x] Autohotkey v1.1.33.09

---

## Instalación
* Descarga este repositorio en un folder: C:/Usuario/MyFolder'
* Descarga e instala VLC con su configuración default.
* Guardar youtube-dl.exe en, por ejemplo, 'C:/Usuario/Mi Música'
* Editar 'C:/Usuario/MyFolder/CONFIG.txt' reemplazando 'C:\Users\Vladimir\Music\' por el directorio que contiene youtube-dl.exe: 'C:/Usuario/Mi Música'

## Instrucciones de Uso

### Sin AHK
* Después de *descargar* y *configurar*, *ejecutar* *PlayTubeYouList.exe*
- Clic en Crea para pegar URL de playlist y crear lista (archivo de texto en C:/Usuario/Mi Música).
- Clic en PLAY para reproducir lista (espera).
### Con AHK e Interfaz Gráfica
* Después de *descargar* y *configurar*, abrir PlayTubeYouListVLCDL.ahk
- Clic en Crea para pegar URL de playlist y crear lista (archivo de texto en C:/Usuario/Mi Música).
- Clic en PLAY para reproducir lista (espera).
### Con AHK & Sin Interfaz Gráfica
* Después de descargar y configurar, 
* Ejecutar GetPlaylist.ahk para crear lista, CTRL+Q
* Ejecutar PlayPlaylist.ahk para reproducir lista, CTRL+Q

---

## Recomendaciones
* No activar otras ventanas durante el cargado de la lista
* Playlist cortas (hasta decenas de videos ~60)
* En medida de lo posible guarda videos sin restricción de edad (sólo audio)

## Áreas de oportunidad
* Con algunos videos ocurre: main input error: ES_OUT_SET(GROUP_)PCR is called too late (pts_delay increase to XXXX ms). Workaround: incrementar tiempo de cache en VLC [referencia](https://www.reddit.com/r/linux/comments/20gun9/can_anyone_help_me_set_a_fixed_buffer_on_vlcs/)
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