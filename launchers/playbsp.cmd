@echo off
::Portal 2 custom map launcher (associate with .bsp files to launch with a mouse click)
::works with https://greasyfork.org/en/scripts/5729-enhanced-steam-workshop-downloader
::also works well with http://steamworkshopdownloader.com and its userscripts

set portal2=C:\Games\Portal 2

::chdir to script directory
cd /d %~dp0

if [%1]==[] goto loadmap
echo PARAMETER %1
set map=%~nx1
::if the map name is any differrent from the original - you lose cubemaps
::"mymaps_" prefix affects cubemaps (glass objects appear white), remove it
::"sp_" prefix is sometimes responsible for spawning a portal gun (coders, right)
::if anything, move map to portal2_dlc2\maps and type buildcubemaps in console
set map=%map:mymaps_=%
::remove chrome file postfixes for multiple downloads
set map=%map: (1)=%
set map=%map: (2)=%
::copying map to portal2_dlc2\maps sometimes breaks scripts
::e.g. "the index 'say_hello' does not exist" (sendificate part 4)
::if it happens try copying to portal2\maps
copy %1 "%portal2%\portal2_dlc2\maps\%map%"
echo %map%>last_map.txt

:loadmap
::load last map name (helps if launched without parameters)
set /p map=<last_map.txt
::append map name to log file for review and scores
echo %map%>>custom-portal2-maps-2.txt
echo USING MAP %map%
cd /d "%portal2%"
portal2.exe -novid -hijack -noborder -windowed +gameinstructor_enable "0" +displayportalplayerstats +map %map%

::I recommend these maps from two guys who made Portal Stories: MEL
::https://steamcommunity.com/id/LoneWolf2056/myworkshopfiles (reconstruction series)
::https://steamcommunity.com/id/tmast98/myworkshopfiles (winter testing initiative)
::also try Sendificate maps: https://steamcommunity.com/id/portal_HMW/myworkshopfiles
::also visit https://www.thinking.withportals.com
::Portal 2 lives!
