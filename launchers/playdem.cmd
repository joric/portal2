set portal2=C:\Games\Portal 2

if [%1]==[] goto end
echo PARAMETER %1
set demo=%~nx1
copy %1 "%portal2%\portal2_dlc2\%demo%"

cd /d "%portal2%"
portal2.exe -novid -hijack +gameinstructor_enable "0" +playdemo %demo%

:end
