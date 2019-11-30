@echo off
set portal2=C:\Program Files (x86)\Steam\steamapps\common\Portal 2
set path=%portal2%\bin;%path%

del pak01_dir.vpk

vpk "%~dp0\pak01_dir"

copy pak01_dir.vpk "%portal2%\portal2_dlc3"

