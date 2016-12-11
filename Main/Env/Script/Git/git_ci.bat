@echo off
rem --------------------------- script de call: doit etre place dans le PrjHome
REM 2150708: updated for Git: sh_gitci.bat
REM WARN mis en commun et TO_DO une version py afin de préciser les add
REM obliged de mettre en commun afin de disposer d'un _LNK 
rem 2101030: mis pour info TO_DO dans le build avec un svnant
rem 2081202: le PrjHome est deja co donc connected, inutile d'indiquer protocole 
rem ces .bat sont des pertes de temps: TODO licom en direct, inutile de definir des envar, TODO en build si besoin


if "%OS%"=="Windows_NT" @setlocal
if "%OS%"=="WINNT" @setlocal

set _PRJHOME_DIR=.
:: set _PRJHOME_DIR=DirDest2
:: set _DESTALLPRJ_HOME=

:: set _FQNPRJ_HOME=PrjHome

:: sous la forme svn://server ou file:///D:/Dir
:: set _PROTOCOL=svn://fr-31-02-08-111
:: set _PROTOCOL=file:///%SVN_REPOS_TEST%



:: ex. svn://daumier/%_FQNPRJ_HOME%
:: set _PROTOCOL_REPOS=%_PROTOCOL%/%_FQNPRJ_HOME%


color E3

set ARGS=-- ci regular to call in PrjHome --

:loop
if [%1] == [] goto end
        set ARGS=%ARGS% %1
        shift
        goto loop
:end

echo %ARGS%

:: en licom
:: java -cp classes com.Un

:: equiv en lançant:
:: call %PROG_HOME%\Script\Java\goJavaLicom %ARGS%
:: call .\goJavaLicom -v CLASS -cp classes -p com -m Un
:: call %PROG_HOME%\Script\Java\goJavaLicom -v CLASS -cp classes -p com -m Un


::=================
:: echo on

:: svn commit -m "commit de PrjHome " --username ppaille
git add *.doc
git add *.ppt
git add *.htm
git add *.html

echo prjhome: %CD%
git commit -m "%ARGS%"

GOTO the_end

:the_end

set _PRJHOME_DIR=
set _DESTALLPRJ_HOME=
set _FQNPRJ_HOME=
set _PROTOCOL=
set _PROTOCOL_REPOS=

if "%OS%"=="Windows_NT" @endlocal
if "%OS%"=="WINNT" @endlocal
pause