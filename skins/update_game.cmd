@echo off
set portal2=C:\Program Files (x86)\Steam\steamapps\common\Portal 2
set path=%portal2%\bin;%path%

FOR /F "tokens=* USEBACKQ" %%F IN (`bash -c ./fetch.sh`) DO SET text=%%F

echo %text% maps played so far

python png2vtf.py images\v_portalgun.png images\v_portalgun.vtf %text%
::python png2vtf.py images\v_portalgun.stamp.png images\v_portalgun.vtf

set pakdir=pak01_dir\materials\models\weapons\v_models\v_portalgun
md %pakdir%

copy images\v_portalgun.vtf %pakdir% && vpk pak01_dir > nul && copy pak01_dir.vpk "%portal2%\portal2_dlc3"

rd /S /Q pak01_dir
del pak01_dir.vpk
