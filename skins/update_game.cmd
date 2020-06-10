@echo off
setlocal EnableDelayedExpansion

set image=images\v_portalgun.joric.vtf

if "%1" neq "" (
set image=images\out.vtf
python png2vtf.py images\v_portalgun.joric.png images\out.vtf %1
)

set portal2=C:\Program Files (x86)\Steam\steamapps\common\Portal 2
set path=%portal2%\bin;%path%

set pakdir=pak01_dir\materials\models\weapons\v_models\v_portalgun

md %pakdir%

copy %image% %pakdir%\v_portalgun.vtf && vpk pak01_dir > nul && copy pak01_dir.vpk "%portal2%\portal2_dlc3"

rd /S /Q pak01_dir
del pak01_dir.vpk
