@echo off

rem ここでバッチファイルがおいてあるdirに移動
cd /d %~dp0 
rem 使用者に合わせて移動したいストレージのパスを入力することもできる。
rem set /P USR_INPUT_STR="移動したいストレージのフルパスをコピペしてください"
rem　pushd %USR_INPUT_STR%

set dirname="encode"
if not exist %dirname% (
    mkdir %dirname%
)


for %%i in (*.h264) do 
(mp4box -add %%i.h264 -new %%i.mp4 
)

mv *.mp4 encode

pause
