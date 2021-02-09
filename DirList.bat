@echo off
set dirpath=%1
dir /b %dirpath% /-p /o:gn > "%dirpath%\DirContents.txt"
exit