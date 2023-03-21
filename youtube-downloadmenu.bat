@echo off
title Youtube downloader
cls

:menu
cls
echo Zorg ervoor dat als er een ^& teken aanwezig is in de youtube link je hier een ^^ voor zet!
set /p url="Voer youtube url in: "
echo Selecteer een optie.
echo.
echo 1. MP3 met playlist
echo 2. MP3 zonder playlist
echo 3. M4A met playlist
echo 4. M4A zonder playlist
echo q. Begin opnieuw
echo.
set /p antwoord="Maak uw keuze: [1/2/3/4]: "
if %antwoord% == 1 goto mp3withplaylist
if %antwoord% == 2 goto mp3noplaylist
if %antwoord% == 3 goto m4awithplaylist
if %antwoord% == 4 goto m4anoplaylist
if %antwoord% == q goto menu
echo Ongeldige invoer! Probeer het opnieuw.
pause
goto menu

:mp3withplaylist
echo mp3metpl
echo -o %%(title)s.%%(ext)s >%TEMP%\ytdl-config.txt
echo --audio-format mp3 >>%TEMP%\ytdl-config.txt
echo --throttled-rate 100K >>%TEMP%\ytdl-config.txt
echo -x >>%TEMP%\ytdl-config.txt
echo --sponsorblock-remove intro,outro,music_offtopic >>%TEMP%\ytdl-config.txt
echo --yes-playlist >>%TEMP%\ytdl-config.txt
echo --audio-quality 0 >>%TEMP%\ytdl-config.txt
yt-dlp.exe --config-location %TEMP%\ytdl-config.txt %url%
echo.
echo Druk op een toets om terug te gaan naar URL selectie.
pause >nul
goto menu

:mp3noplaylist
echo -o %%(title)s.%%(ext)s >%TEMP%\ytdl-config.txt
echo --audio-format mp3 >>%TEMP%\ytdl-config.txt
echo --throttled-rate 100K >>%TEMP%\ytdl-config.txt
echo --sponsorblock-remove intro,outro,music_offtopic >>%TEMP%\ytdl-config.txt
echo --no-playlist >>%TEMP%\ytdl-config.txt
echo -x >>%TEMP%\ytdl-config.txt
echo --audio-quality 0 >>%TEMP%\ytdl-config.txt
yt-dlp.exe --config-location %TEMP%\ytdl-config.txt %url%
echo.
echo Druk op een toets om terug te gaan naar URL selectie.
pause >nul
goto menu

:m4awithplaylist
echo -o %%(title)s.%%(ext)s >%TEMP%\ytdl-config.txt
echo --audio-format mp3 >>%TEMP%\ytdl-config.txt
echo --throttled-rate 100K >>%TEMP%\ytdl-config.txt
echo --sponsorblock-remove intro,outro,music_offtopic >>%TEMP%\ytdl-config.txt
echo -x >>%TEMP%\ytdl-config.txt
echo --yes-playlist >>%TEMP%\ytdl-config.txt
echo --audio-quality 0 >>%TEMP%\ytdl-config.txt
yt-dlp.exe --config-location %TEMP%\ytdl-config.txt %url%
echo.
echo Druk op een toets om terug te gaan naar URL selectie.
pause >nul
goto menu


:m4anoplaylist
echo -o %%(title)s.%%(ext)s >%TEMP%\ytdl-config.txt
echo --audio-format m4a >>%TEMP%\ytdl-config.txt
echo --throttled-rate 100K >>%TEMP%\ytdl-config.txt
echo --sponsorblock-remove intro,outro,music_offtopic >>%TEMP%\ytdl-config.txt
echo --no-playlist >>%TEMP%\ytdl-config.txt
echo -x >>%TEMP%\ytdl-config.txt
echo --audio-quality 0 >>%TEMP%\ytdl-config.txt
yt-dlp.exe --config-location %TEMP%\ytdl-config.txt %url%
echo.
echo Druk op een toets om terug te gaan naar URL selectie.
pause >nul
goto menu