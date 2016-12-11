rem --------------------------- Lancement de pychecker en licom avec set env pp
rem version 2110927 avec shift_argts
rem version 2060222: avec lancement de pyt en licom avec 1 (.py) + 3 argts optionnels 
rem il suffit de le recopier dans la dir de travail 


rem @echo off


if exist "%PROG_HOME%\Script\Pyt\setPytEnv.bat" (
   call "%PROG_HOME%\Script\Pyt\setPytEnv.bat"
)

echo ---------------------------
echo %1
echo ---------------------------

:: =========== imperatif de passer par switch argts sinon repete les %i non fournis

:: COLDINIT
set other_args=

:loop_args
IF [%1] == [] GOTO continue_args

SET other_args=%other_args% %1

:shift_args
SHIFT
GOTO loop_args

:continue_args


:: =========== 
echo arguments=%other_args%
echo cdline=%PYTHONHOME%\python.exe %other_args%

rem ---- on lance idle avec startup.py si nécessaire 
%PYTHON_INSDIR%\python.exe  C:\Python23\Lib\site-packages\pychecker\checker.py %other_args%