rem --------------------------- phpPYT
:: 2121101: correct for KLEW and SCRIPT_HOME rather than PROG_HOME\Script
:: 2120704: modif SMT PYTHONPATH with CAS Lib
:: 2060909: adapted pour VT
:: 2060907: corrections JAVA_HOME et variables
:: 2060828: adapted pour JOB
rem version 2060130: sans lancement de pyt
rem ce n'est valable que lorsque lancé pendant une session DOS
rem sous win, il faut passer par le SetEnv pour définir les var si on desire persiste
rem args = 

rem @echo off

rem --- DEFINIR cette partie

IF NOT "%PROG_HOME%" == "" (
	echo %PROG_HOME%
	) else (
		echo ENVAR PROG_HOME set to default
		set PROG_HOME=C:\Progs
		)

IF NOT "%PYTHONHOME%" == "" (
	echo %PYTHONHOME%
	) else (
		echo ENVAR PYTHONHOME set to default
		set PYTHONHOME=D:\PyJy\Py272
		)

IF NOT "%JAVA_HOME%" == "" (
	echo  %JAVA_HOME%
	) else (
		echo ENVAR JAVA_HOME set to default
		set JAVA_HOME=D:\Java\Jee\jdk1.6.0_30
		)

set JOB_DIR=D:\Code\Etu\EtuPyt
set JOB_GRM=%JOB_DIR%\Grm
set JOB_DAT=%JOB_GRM%\Dat
set JOB_LOG=%JOB_GRM%\Log


rem --- Java
set PATH=%PATH%;%JAVA_HOME%\bin


rem --- python install  // cf STD PYTINT.p20 
set PATH=%PYTHONHOME%;%PATH%
set PYTHONPATH=.;%PYTHONHOME%\Lib;%PYTHONHOME%\Lib\tkinter
set TCL_LIBRARY=%PYTHONHOME%\tcl\tcl8.4
set TK_LIBRARY=%PYTHONHOME%\tcl\tk8.4

rem --- seulement pour les appels interactifs (niet par idle ou winPyt)
rem le script designe par PYTHONSTARTUP est préalablement execute
rem set PYTHONSTARTUP=D:\Progs\Script\Pyt\startup.py 

echo ---------------------------
echo %1
echo ---------------------------


