@echo off

echo ====== ------ ======
echo This script is not affiliated with Moonlight steam.
echo ====== ------ ======

if exist "%temp%\MoonlightPortable" (
    rmdir /s /q "%temp%\MoonlightPortable"
)
mkdir "%temp%\MoonlightPortable"
curl https://download854.mediafire.com/6xhi9gmou3kgVqoWhnbqo93u7flYqqIlmagRLoMceZ9gSIFnOIJ8_7-70BQdQmDRJPdPAm9YyGIuAiwVJ8P1DWPa31o8IRTjNtC1VhSaDGIaiu1CTmWKm5pdIQDY-4u6uEfJuw3k7r61bdKmvG6Dj7wLVeudbN1WBSf0fFLMCf27/t85jf9e336zlp2o/MoonlightPortable-x64-6.1.0.zip -o "%temp%\MoonlightPortable\Moonlight.zip"
Call :UnZipFile "%temp%\MoonlightPortable\" "%temp%\MoonlightPortable\Moonlight.zip"
del "%temp%\MoonlightPortable\Moonlight.zip"
start /d "%temp%\MoonlightPortable" Moonlight.exe
exit /b


:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%