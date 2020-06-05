@echo off

set image=images\v_portalgun.joric.vtf

set portal2=C:\Program Files (x86)\Steam\steamapps\common\Portal 2
set path=%portal2%\bin;%path%

set pakdir=pak01_dir\materials\models\weapons\v_models\v_portalgun

md %pakdir%

copy %image% %pakdir% >nul

vpk pak01_dir > nul

echo Copying pak01_dir.vpk to %portal2%\portal2_dlc3.

copy pak01_dir.vpk "%portal2%\portal2_dlc3"  >nul

rd /S /Q pak01_dir
del pak01_dir.vpk
