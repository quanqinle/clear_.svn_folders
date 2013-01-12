@echo off

:start
::Starting Change path
set pwd=%cd%
cd %1
echo wook path chdir

:input
::get input infomation and operation
set source=:
set /p source=confirm to clear this path with svn file?[Y/N/Q] 
set "source=%source:"=%"

if "%source%"=="y" goto clean 
if "%source%"=="Y" goto clean 
if "%source%"=="n" goto noclean 
if "%source%"=="N" goto noclean 
if "%source%"=="q" goto end
if "%source%"=="Q" goto end
goto input

:clean
::main process,running clear
@echo on
@for /d /r %%c in (.svn) do @if exist %%c ( rd /s /q "%%c" & echo     delete path%%c)
@echo off
echo "svn file were clean from this path"
goto end

:noclean
::sub process,cancel clean
echo "svn clean process stop"
goto end

:end
::exit
cd "%pwd%"
pause
