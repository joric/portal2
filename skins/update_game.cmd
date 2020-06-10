@echo off
set portal2=C:\Program Files (x86)\Steam\steamapps\common\Portal 2
set path=%portal2%\bin;%path%

python png2vtf.py images\v_portalgun.png images\v_portalgun.vtf %1

set pakdir=pak01_dir\materials\models\weapons\v_models\v_portalgun
md %pakdir%

copy images\v_portalgun.vtf %pakdir% && vpk pak01_dir > nul && copy pak01_dir.vpk "%portal2%\portal2_dlc3"

rd /S /Q pak01_dir
del pak01_dir.vpk
