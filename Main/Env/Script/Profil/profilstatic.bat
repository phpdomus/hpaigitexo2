@echo off
color 20
::2161201: correction de Jacques
::2161201: commit de Pierre
::2161101: simplified only for presentation
::  Pour la presentation, Nous indiquons dans les fichiers (.js, .css, .bat, .vbs et .htm) 
::  "PRESENTATION_CLASSROOM" en commentaire les lignes de code incriminees
::  version 1.0: pass TO generic script name of files 
::  version 0.5: _B1 script execution *with ENVAR USER and SYSTEM in vbs -- no py actually --*
::  defines static profil WSID

REM == Step00: WSID Static *Requisite* ======================================
:Step00
REM ============== TO CUSTOMIZE HERE static
REM FOR each WSID even before calling sh scripts
REM Only this part for customisation 

set WSID=KTC
set WSID=WINDEF
set BOOT_DRIVE=C:
set WORK_DRIVE=C:
set PIKLE_DEVICE=T:
set REPOS_URL=R:
set VAULT_URL=V:
set TIMEOUT=1

REM should be defined in dynamicscript *for persistence and user/system setting *, 
REM	set here *it is surdefined*  if you don't run dynamic script
REM set JAVA_HOME=C:\Java\jdk1.8.0_20
set JAVA_HOME=C:\Java\jdk1.8.0_66
set PORT_APP=C:\PortApp
set ANT_HOME=%PORT_APP%\Ant194
set PROG_HOME=C:\Progs

REM in the same way, profil should be rather defined by dynamic script (autodetection or typing) before step04
REM [HOST][context}
REM *************************PRESENTATION*********************************************
set PROFIL_DEMO=WINDEFcommon
:: PRESENTATION_CLASSROOM: a ce niveau erreur indicateur du groupe de developpemenT -- fusion avec le code de Sophie --
set TARGET_TYPE=COMMON
REM **********************************************************************************
REM set KTCdev pour les configs de dev standard
REM set KTCdevaccess pour exemple de sous-config de dev with accessibility specifications.
REM KTCstable pas de dll beta
REM ============== generic, NOT customisable
set KLEWSID_URL=%BOOT_DRIVE%\KleW
REM remplace KLEBRIC
set KLEPIKLE_URL=%PIKLE_DEVICE%\KleP
REM TODO reset with KLE
REM NO KEEP each case SET KLE_DIR=%KLEWSID_URL%\Main\Env\Script\Profil
REM TODO WARN DIR contains backslash but not URL !!

:: for dbg TOSWAP indiquer a chaque sortie son propre code de couleur
set PYTHONHOME=C:\PortApp\Py_2751_p\App
set PYTHONPATH=C:\PortApp\Py_2751_p\App\Lib
set PATH=%PYTHONHOME%;%PATH%

if exist %KLEWSID_URL% goto StaticReady

REM KleW est introuvable: installation KleW doit etre corrigee
@echo "WARN: KleW mandatory -- initialisation failed!! --"
color C0
goto Theend

REM == MANDATORY DONE =======================================================
:StaticReady
@echo KLEWSID_URL= %KLEWSID_URL%
@echo "OK: static properties initED"

REM == Step01: WSID Dynamic *optional* ======================================
:Step01
REM dynamic script avec applis script osscript, py, .. et DB de settings invocable
REM TODO indicate test here if your dynamic script is available
if exist %KLEWSID_URL%\Main\Env\Script\Profil\profildynamic_%WSID%.vbs goto 01Ready
@echo "NO: config script unavailable, only static properties init"
goto Step02
:01Ready
@echo run WSID dynamic script Start "Step01Readynamic"  profildynamic_%WSID%.vbs

REM *************************************PRESENTATION**********************************************
REM PRESENTATION_CLASSROOM
REM 2161201:PRESENTATION_CLASSROOM variable d'environnement du poste de travail est confirmee dans le script
Start "Step01Readynamic"  %KLEWSID_URL%\Main\Env\Script\Profil\profildynamic_%WSID%.vbs 
REM on ne veut pas que cette definition soit persistante afin de pouvoir le redetecter au niveau des warm boots,

REM c'est a la session DOS de l'appeler
:: PRESENTATION_CLASSROOM: a ce niveau erreur de Pierre au sujet de la recuperation de la modification de variable d'environnement
:: il est necessaire de mettre a jour depuis la session DOS:
:: set KLE_URL=%KLEWSID_URL%
' ***********************************************************************************************

REM == Step02: PIKLE if detected *optional* =================================
:Step02
if exist %KLEPIKLE_URL% goto 02Ready
@echo "NO: Pikle script unavailable --"
goto Step03
:02Ready
@echo Start  "Step02Readynamic" %KLEPIKLE_URL%\Main\Env\Script\Profil\profilpikle_%WSID%.vbs
REM TODO: Start "Step02ReadyPikle"  /WAIT %KLEPIKLE_URL%\Env\Script\Profil\profilpikle_%WSID%.vbs
@echo "OK: PIKLE inited --"

REM == step03: KLOUT if detected *optional* =================================
REM TODO detection by timeout *with py*
:Step03
if exist callKlout.py goto 03Ready
@echo "NO: Klout not available --"
goto Step04
:03Ready
REM: TODO Start "Step03ReadyKlout" with py script
@echo "OK: KLOUT inited --"

REM == Step04: Profil.git if correct *ant script* Last one who spoke *SURDEFINED* =======
REM TODO test on ant script availability 
:Step04
if exist %KLEWSID_URL%\Main\Env\Script\Profil\profil_build00.xml goto 04Ready
@echo "NO: Profil.git not available --"
goto Step05
:04Ready
@echo "OK: run Profil.git --"
REM BUG JDK should contain tools.jar add it if unavailable 
REM TODO /MIN for quasi silent during debug phase, /b without any window but ctrl-C not available
REM TODO THIS after tests: 
Start "Step04" /min %KLEWSID_URL%\Main\Env\Script\Profil\profil_goant -buildfile profil_build00.xml warmboot 
REM THIS verbose but avoid because in its thread 
REM Start "Step04" /b %KLEWSID_URL%\Main\Env\Script\Profil\profil_goant -buildfile profil_build00.xml warmboot 

REM == Step05: Post-TT custo *optional*  ===================================
:Step05
REM TODO swap managed only under profil.git when available
REM V0.5 TOACTIVATE THIS *******************************************************
REM TODO THIS %SystemRoot%\explorer.exe /n,/e, /select, %KLEWSID_URL%\Main\Env\Bureau\Pikle_cur\Objectiv_ED
REM %SystemRoot%\explorer.exe /n, /root, %KLEWSID_URL%\Main\Env\Bureau\Pikle_cur\Objectiv_ED

:Theend
@echo "-- SetCfg.profil:: The End --"

pause