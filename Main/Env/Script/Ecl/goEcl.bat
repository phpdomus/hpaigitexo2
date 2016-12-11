@echo off
:: 2160404_PHP: LUNA400BASIC pour le AllPrjHomes dans maintien en JVCook minimal
:: 2160404_PHP: LUNA400LOC pour le AllPrjHomes dans le ice
:: 2160324_PHP: LUNA400 custo std pour STC (restart ionly java from eclipse-jee-luna-SR2-win32-x86_64_yoxos
:: 2141231_PHP: custo for STC
:: 2141112:PP:  correction de jvm=javaw sous bin
:: 2140528:PP:  EclPhP422
:: 2130215:PP:	RMPyJy_360W
:: 2130129:PP:	AllPrjHomes Ecl\FTC\RMYsq_360 prefix prjHomes by step
:: 2121120:PP:  Orga dev prjHomes: SETCFG_360W
:: 2121111:PP:  Vlnm213 series, osgi versions 0.1.0.0 [ITI]VLNM213_360W,[ITI]VLNM213SRV_360W, [ITI]VLNM213_360DS 
:: 2120914:PP:  compatib with new osgi on FTC, PTC
:: 2120720:PP:	use of APP_DRIVE instead of direct even in specific JRE
::              REM: argts are case sensible
:: 2120704:PP:  Kit360W, TXDb2340DS
:: 2120416:PP:  only for temp GO212_360W
:: 2111006:PP:  TEST212_340B
:: 2110922:PP:  GO212_340B
:: 2110817:PHP: color A0 pour eviter confusions de fenetres
:: 2110527:PHP: KITSLM360W
:: 2110228:PHP: SPRING360W
:: 2110220:PHP: SNECMAINTENANCETX360W
:: 2110211:PHP: SNECMAINTENANCEPARAM360W et RCPTX352R
:: 2101102:PHP: SNECMAINTENANCE360W
:: 2100930:PHP: sync SMT PAR avec start of 360W02
:: 2100923:PHP: S'imposer de mettre les argts en CAP integral 
:: 2100923:PHP: correction PIKLE_DRIVE, AVEC340W .. il est temps de passer en jy
:: 2100923:PHP: SUMMER340W, SUMMER340DS
:: 2100923:PHP: Iti340B, Iti340DS et Iti340W
:: 2100923:PHP: Summer340B sur le modele Avec340B
:: 2100818:PHP: KITJYPY340B
:: 2091123:PHP: KitDb2340DS
:: 2090921:PHP: Avec340W
:: 2090921:PHP: Avec340R
:: 2090921:PHP: Avec340B
:: 2090729:PHP: MocProfil340B avec Pydev -- snecma --
:: 2090330:PHP: ALSTOMEAI340W
:: 2090223:PHP: MOCP340W
:: 2090127:PHP: KitLayouTpl340B WARN on PIKLE direct
:: 2081229:PHP: modif Mcl with autonomous myeclipse.exe and self jvm in its myeclipse.ini
:: 2081229:PHP: KitAnt340B W R with Ganymed migration PAR
:: 2081127:PHP: CFGTOD330W
:: 2091119:PHP: KitAnt330W
:: 2080915:PHP: mise en oeuvre KitAnt330R for RCP and plugins dvp
:: 2080915:PHP: go Valid330C for CPP programming 
:: 2080904:PHP: add DISTRO 330T only for validation before return TO 330B PAR
::		we create a dedicated AllprjHome: VALID330T
::		test LYRIA
::		test MAVEN + indic de PERL
::
:: 2080523:PHP: KitUml330P inited on VT
:: 2080429:PHP: Iti330R
:: 2080429:PHP: Iti330B
:: 2080424:PHP  KitAnt330R 
:: TODO: modify config de 330U selon .ini de ECLEUROP
:: 2080424:PHP  KitAnt330U avec Ecl330U issu de distro 330_JEE_W_00 sur lequel installed xxxx testED 
:: 2080423:PHP: KitAnt330P avec Ecl330P issu de distro 330_JEE_W_00 sur lequel installed SDE_CE 4.2 testED OK
:: 2080416:PHP: version PIKLE01_00 merged in PrjHome:
::         valided:
:: 2080330: version VT avec Mcl601 valided KITANT330B, KITANT330M
::          TODO: ITI330 pour notify
::          * lors de passage en 330: deux lignes to redef: variable et plus bas le lancement
:: 2080108: config JOB and VT for Version 330 --retrocompatibility--
:: 2070712: version JOB avec deux Mockup C composants et P portails
:: 2070709: version JOB avec Ecl320P sur les allprjHomes KitUml320P et KitJava320P
:: 2070702: adaptation avec Iti320C
:: 2070417: version JOB pour prise en compte de AllPrjHomes Iti320M, MockupFW320M, MockupPU320M
:: 2070401: version VT et JOB assume implement de profil 
::          desormais devient generique sans suffixe pour le bureau virtuel
:: 2070313: UPG de ArgoUml320C
:: 2070219: UPG Ant170 bien que inutile si gestion profil
:: 2070125: UPG Dir Smg312 sur Iter00
:: 2070123: options ReadyTo: ETUJAVA320M, ETUUML320U, KITUML320U, ETUANT320M,KITJAVA320M, KITANT320M
::          Désormais, sauf Bug majeur, on privilégie ces configs 320C en cas pitfall suspect
:: 2070118: TODO: regroupement des args specifiques a un Ecl dans le WARMINIT
:: 2070117: integration de la version OMONDO avec callisto en scratch autonome -v OMONDO
:: 2070115: modif de settings pour MCL 5.1.0-GA // Wsp specifique
:: 2061213: mise en route py
:: 2061114: suppress parentheses, correction PROGSHOME dans JAVAHOME et , ajout de EtuPyt et EtuAnt
:: 2061009: ajout training
:: 2060921: prend en charge les Ecl de Kit
:: 2060908: ajout de option AllPrjHome IC dvp SMG integrated client
:: 2060907: ajout de option -showlocation 
:: 2060821: pdef jdk1_5_0_08
:: 2060818: appli des profils ENVAR
:: 2060803: suites au pepins de JOB: en profite pour placer tous les ECLIPSE_HOME en
::          _APP_DRIVE:\Ecl312\eclipse
::          _APP_DRIVE:\Ecl320C\eclipse 
::	    _APP_DRIVE:\Ecl320Y\eclipse
::		VT et BR restent en _APP_DRIVE=c:
::              PPJ et JOB sont homogenes desormais en _APP_DRIVE=C: également pour homogen DAN et BAN
::	    le ALL_WSP_HOME pdef reste en _WORK_DRIVE:\Ecl\WSID
::             ALL_PRJ_HOME dépend de version donc dans 
::			_WORK_DRIVE:\Ecl\WSID\Ecl312 
::			_WORK_DRIVE:\Ecl\WSID\Ecl320C 
::			_WORK_DRIVE:\Ecl\WSID\Ecl320Y 
::          ex. de licom: go.bat -v TPL -d D:
:: 2060707: reprise depuis goEclipse2060523 
::	un par WSID,
::	on se limite strictement à ajouter des lignes de IF
::	ne pas perdre de temps à coder propre, trop de pb avec les noms de var.. 
::
::	dès que possible, tout passer en .py et asumer que toutes machines en disposent
::	y compris le lancement de ant si intermédiaire pour lanceurs .. -cf. runant en Env-
::		reTX les default.bat, 
:: On conserve un goEclipse par WSID
:: chaque goEclipse est conservé dans Env\Grm
::	goEclipse-WSID-versionnage
::	On conserve uniquement 3 arguments de version et ON MODIFIE EN DIRECT 
::		selon la machine et selon la politique de la version en cours 
::		ex. ETU ie. Java devient désormais Eclipse320C
::		on peut ajouter qques sous versions 
::	MAIS un goEclipse est impérativement lié à une WSID ne pas essayer de géné car .bat devient illisible, mieux vaut PYT ou ANT
:: 2060707: Seul changement porte sur le ETU qui est desormais sur Eclipse 320 Callisto pour tout ce qui est Java
:: 			le TPL reste jusqu'en fin JULY sur version 312 car risques incompatib
:: 2060617: suppression des chevrons y compris en comments
:: 2060526: modification en parallele de celui de JOB -cf.proximite de WS avec Projet-
:: 	+ Modif des AllPrjHome, AllWSHome, AllPrjHome, PrjHome pour ECL
::	Option DVP par defaut va désormais en D:\Ecl\WSID\AllPrjHome
::	Option ETU conservé en EtuJava mais delaissee en raison des pb de synchro avec LLG
::  Reorga de Dir de ECLJob en parallèle mais reste tout de meme sur EtuJava afin de permettre recup sur DAN 
::			-pas de risque de synchro avec JOB-
:: 2060523: Last version lancement de Ecl312 sur package template cf. reorga dans SmgPrj suppress des else pour ajouter options
:: 2060410: désormais, les workspaces de 312 sont Ecl312PPJ
:: 	envisager un cd dans la dir de eclipse cf. SMG
:: 2060315: lancement de ecl avec bonne JVM et Workspace 
:: 	version 312 est pdef
:: 	lancement de Eclipse DVP/SMG option [-v TPL | SMG | ETU320C | ETU320Y] [-j jre]  [other]
::----------------------------------------------------
:: REM ne jamais utiliser de parentheses dans les comment ou echo de ce script ...
:: REM les IF sont CASE sensibles, mettre argument -v en CAP


:: M: ajout d'un nouveau AllPrjHome necessite deux points de modif precede par if version 
:: 	set des envar
::      appel plus loin

:: == en principe doit etre defini en ENVAR TO ADAPTER AU WSID
:: TODO en l'absence de definition ENVAR, ADAPTER les lignes suivantes


IF NOT "%PROG_HOME%" == "" (
	echo %PROG_HOME%
	) else (
		echo ENVAR PROG_HOME set to default
		set PROG_HOME=D:\Progs
		)

IF NOT "%JAVA_HOME%" == "" (
	echo  %JAVA_HOME%
	) else (
		echo ENVAR JAVA_HOME set to default
		set JAVA_HOME=D:\Progs\jdk1.6.0
		)

IF NOT "%ANT_HOME%" == "" (
	echo  %ANT_HOME%
	) else (
		echo ENVAR ANT_HOME set to default
		set ANT_HOME=%PROG_HOME%\Ant170
		)


setlocal
color A0


:: =========== PRESET specifique au WSID d'execution TO UPG 
:: =========== TODO: adapter ici selon le wsid pas de licom en .bat
:: =========== adaptation au WSID est réalisée en PYT
:: =========== en .bat, le goEclipse est spécifique à un WSID en changeant seulement ces 4 lignes EN DUR
:: 2070401: desormais gere par profil
set _WSID=%WSID%
:: 2141231_PHP: TO_DO suppress envar APP_DRIVE au profit de HOME_DRIVE ou WORK_DRIVE
set _APP_DRIVE=%APP_DRIVE%
set _WORK_DRIVE=%WORK_DRIVE%
set _PIKLE_DRIVE=%PIKLE_DRIVE%
set all_progs=%PROG_HOME%

:: =========== les jvm et version sont definis en licom
set eclipse_home=
set allprj_home=
set allwsp_home=


:: COLDINIT
set version=
set jvm=
set other_args=


:loop_args
IF [%1] == [] GOTO continue_args

IF [%1] == [-j] (
	SET jvm=%2
	SHIFT
	GOTO shift_args
)


IF [%1] == [-v] (
	SET version=%2
	SHIFT
	GOTO shift_args

)


:: 2060818: ces deux args ne sont pas encore valided
IF [%1] == [-d] (
	SET _APP_DRIVE=%2
	SHIFT
	GOTO shift_args
)

IF [%1] == [-w] (
	SET _WSID=%2
	SHIFT
	GOTO shift_args
)


SET other_args=%other_args% %1

:shift_args
SHIFT
GOTO loop_args

:continue_args


:: =========== WARMINIT on assure les valeurs pdef qui peuvent etre redef dans le switch project
:: on est obligé de set les envar ici et non pas dans le switch sinon pas pris en compte lorsque dans switch ?!
:: 		en fait, echo n'est correct qu'a la sortie du IF ?
:: 2060808: les JDK sont désormais homogenes dans _APP_DRIVE:\Progs

IF "%ProgramFiles%" == "" (
		set ProgramFiles="C:\Program Files"
		)


IF NOT "%jvm%" == "" (
	rem indiquer le jvm en ligne de commande
	) else (
		set jvm=%JAVA_HOME%\bin\javaw.exe
		)


::2140528: PHP422
:: WARN je confirme le dev sur Ecl _WORKDRIVE et non pas _PIKLEDRIVE
IF [%version%] == [PHP422] (
	rem on la redefinit pour 422
	set eclipse_home=%_WORK_DRIVE%\Ecl422Php\eclipse
	:: set allprj_home=%_PIKLE_DRIVE%\Ecl\%_WSID%\RMPhp_422
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\RMPhp_422
	:: 2141112_PHP: WARN le jvm = javaw est desormais direct sous bin
	REM set jvm=%JAVA_HOME%\bin\javaw
    set jvm=%JAVA_HOME%\bin\javaw.exe
    :: 2141231_PHP:set jvm=C:\Java\jdk1.8.0_20\jre\bin\javaw.exe
    :: 2141231_PHP:set jvm=C:\Java\jdk1.8.0_20\jre\bin\server\jvm.dll
    :: 2141231_PHP:set jvm=C:\Java\jdk1.8.0_20\bin\java.exe
    :: 2141231_PHP:set jvm=C:\Program Files\Java\jre1.8.0_20\bin\javaw.exe
    :: 2141231_PHP:set jvm=C:\Program Files\Java\jre7\bin\javaw.exe
    :: 2141231_PHP:set jvm=C:\Program Files\Java\jre6\bin\javaw.exe
    )



IF [%version%] == [ETU320C] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Ecl320C
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [ARGO320C] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EclArgo320C
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [IC] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\SmgIc320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [KITANT] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


:: 2080904: derivation specific for testing plugins Lyria, Maven ..
IF [%version%] == [VALID330T] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330T\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Valid330T
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2090915: AllPrjHome for dvp CPP with DISTR 330C
IF [%version%] == [VALID330C] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Valid330C
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080108
IF [%version%] == [KITANT330B] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt330B
	set jvm=%JAVA_HOME%\bin\javaw
	)



:: 2081229:

IF [%version%] == [KITANT340M] (
	rem on la redefinit pour 340
        :: 2081229: WARN autonome pour 340, direct myeclipse.exe
        :: 2081229: indique seulement .exe et -data pas de forcage -jvm   -- cf. in myeclipse.ini ---
	:: 2070115: cf. pbs de WTP 
	:: set eclipse_home=%_APP_DRIVE%\Ecl340M\MyEclipse\eclipse
    set eclipse_home=%_APP_DRIVE%"\Program Files\Genuitec\MyEclipse 7.0"
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt340M
	:: set jvm=%JAVA_HOME%\bin\javaw
	rem keep its own jvm -1.5-
	:: set jvm=%_APP_DRIVE%\Ecl330M\jre\bin\javaw
        set jvm=myeclipse_ini
	)


:: 2081229
IF [%version%] == [KITANT340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt340B
	set jvm=%JAVA_HOME%\bin\javaw
	)


:: 2090223
IF [%version%] == [MOCP340W] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\MOCP340W
	set jvm=%JAVA_HOME%\bin\javaw
	)



:: 2100923:
IF [%version%] == [ITI340DS] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%_APP_DRIVE%\Ecl340DS\DS2.2
	set allprj_home=%_PIKLE_DRIVE%\Ecl\PK\Iti340DS
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	set jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)

:: 2160324
IF [%version%] == [LUNA400] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%WORK_DRIVE%\EclJeeYoxos\eclipse
	set allprj_home=%WORK_DRIVE%\Ecl\%WSID%\Luna400
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	REM _B0 jvm proprio: jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)

:: 2160404
IF [%version%] == [LUNA400LOC] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%WORK_DRIVE%\EclJeeYoxos\eclipse
	set allprj_home=%PIKLE_DEVICE%\Prj\Ice\Ecl\%WSID%\Luna400_LOC
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	REM _B0 jvm proprio: jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)

:: 2160406
IF [%version%] == [LUNA400BASIC] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%WORK_DRIVE%\EclJeeYoxos\eclipse
	set allprj_home=%PIKLE_DEVICE%\Code\JeeRestartRoadMap\Grm\10_JavaBasic\00_STC\AllPrjHomeBasicLuna400
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	REM _B0 jvm proprio: jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)
:: 2100923:
IF [%version%] == [SUMMER340DS] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%_APP_DRIVE%\Ecl340DS\DS2.2
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Summer340DS
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	set jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)


:: 2091123 WARN installed et DIR distinctes
IF [%version%] == [KitDb2340DS] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%_APP_DRIVE%\Ecl340DS\DS2.2
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitDb2340DS
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	set jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)


:: 2120720
IF [%version%] == [TXDb2340DS] (
	rem TODO add classic JAVA_HOME dans les settings
	REM set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set eclipse_home=%_APP_DRIVE%\Ecl340DS\DS2.2
	set allprj_home=%_PIKLE_DRIVE%\Ecl\%_WSID%\TXDB2340DS
	REM set jvm=%JAVA_HOME%\bin\javaw
        REM jvm dans le jre et non pas plus bas
	set jvm=%_APP_DRIVE%\Ecl340DS\DS2.2\jdk\jre\bin\javaw.exe
	)




:: 2100818: tests avec change des epf: KITJYPY340B
IF [%version%] == [KITJYPY340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitJyPy340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2110922: copy from KITJYPY340B
IF [%version%] == [GO212_340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\GO212_340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2111026: copy from GO212_340B
IF [%version%] == [TEST212_340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\TEST212_340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2121111: copy from TEST212_340B
IF [%version%] == [VLNM213_360W] (
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Vlnm213_360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2090730
IF [%version%] == [MOCPROFIL340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\MocProfil340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2100923:
IF [%version%] == [SUMMER340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Summer340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2090921:
IF [%version%] == [AVEC340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Avec340B
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [AVEC340R] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Avec340R
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2100923:
IF [%version%] == [ITI340W] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set allprj_home=%_PIKLE_DRIVE%\Ecl\PK\Iti340W
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2100923:
IF [%version%] == [SUMMER340W] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Summer340W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2100930:
IF [%version%] == [SUMMER360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Summer360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2101102:
IF [%version%] == [SNECMAINTENANCE360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\SnecMaintenance360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2110211:
IF [%version%] == [SNECMAINTENANCEPARAM360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\SnmParam360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2110220:
IF [%version%] == [SNECMAINTENANCETX360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\SnmTx360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2110228:
IF [%version%] == [SPRING360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Spring360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2110527:
IF [%version%] == [KITSLM360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitSlm360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2120704: KIT360W
IF [%version%] == [KIT360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_PIKLE_DRIVE%\Ecl\%_WSID%\Kit360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2120416: copy from KITSLM360W
IF [%version%] == [GO212_360W] (
	rem on la redefinit pour 360 et PIKLE_DRIVE
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_PIKLE_DRIVE%\Ecl\%_WSID%\GO212_360W
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [AVEC340W] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Avec340W
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2081229
IF [%version%] == [KITANT340W] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt340W
	set jvm=%JAVA_HOME%\bin\javaw
	)


:: 2090330
IF [%version%] == [ALSTOMEAI340W] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\AlstomEai340W
	set jvm=%JAVA_HOME%\bin\javaw
	)


:: 2081229
IF [%version%] == [KITANT340R] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340R\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt340R
	set jvm=%JAVA_HOME%\bin\javaw
	)


::2081119
IF [%version%] == [KITANT330W] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt330W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2081127
IF [%version%] == [CFGTOD330W] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\CfgTod330W
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080423
IF [%version%] == [KITANT330R] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330R\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt330R
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080423
IF [%version%] == [KITANT330P] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330P\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt330P
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080523
IF [%version%] == [KITUML330P] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330P\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitUml330P
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080424
IF [%version%] == [KITANT330U] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330U\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt330U
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2100923: remplace ItI330B
IF [%version%] == [ITI340B] (
	rem on la redefinit pour 340
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%PIKLE_DRIVE%\Ecl\PK\Iti340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080429
IF [%version%] == [ITI330B] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330B\eclipse
	set allprj_home=%PIKLE_DRIVE%\Ecl\PK\Iti330B
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2090127
IF [%version%] == [KITLAYOUTPL340B] (
	rem on la redefinit pour 340 WARN direct on PK
	set eclipse_home=%_APP_DRIVE%\Ecl340B\eclipse
	set allprj_home=%PIKLE_DRIVE%\Ecl\PK\KitLayouTpl340B
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080429
IF [%version%] == [ITI330R] (
	rem on la redefinit pour 330
	set eclipse_home=%_APP_DRIVE%\Ecl330R\eclipse
	set allprj_home=%PIKLE_DRIVE%\Ecl\PK\Iti330R
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [ETUANT] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EtuAnt320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [KITPYT] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitPyt320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [ETUPYT] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EtuPyt320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [KITJAVA] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitJava320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [ETUJAVA] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EtuJava320C
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2070117 lance OMONDO sur EtuUml320U - WSPHOME pdef de OMONDO --
IF [%version%] == [ETUUML320U] (
	set eclipse_home=%_APP_DRIVE%\Ecl320U\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EtuUml320U
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [KITUML320U] (
	set eclipse_home=%_APP_DRIVE%\Ecl320U\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitUml320U
	set jvm=%JAVA_HOME%\bin\javaw
	)


:: 2070712
IF [%version%] == [MOCP320M] (
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\MocP320M
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [MOCC320M] (
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\MocC320M
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [ITI320M] (
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%PIKLE_DRIVE%\Ecl\PK\Iti320M
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2070702
IF [%version%] == [ITI320C] (
	set eclipse_home=%_APP_DRIVE%\Ecl320C\eclipse
	set allprj_home=%PIKLE_DRIVE%\Ecl\PK\Iti320C
	set jvm=%JAVA_HOME%\bin\javaw
	)


:: 2070115:
IF [%version%] == [ETUJAVA320M] (
	rem on la redefinit pour 320
	:: 2070115: cf. pbs de WTP 
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EtuJava320M
	set jvm=%JAVA_HOME%\bin\javaw
	)
IF [%version%] == [ETUANT320M] (
	rem on la redefinit pour 320
	:: 2070115: cf. pbs de WTP 
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\EtuAnt320M
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [KITANT320M] (
	rem on la redefinit pour 320
	:: 2070115: cf. pbs de WTP 
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt320M
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2080108
IF [%version%] == [KITANT330M] (
	rem on la redefinit pour 330
	:: 2070115: cf. pbs de WTP 
	set eclipse_home=%_APP_DRIVE%\Ecl330M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitAnt330M
	:: set jvm=%JAVA_HOME%\bin\javaw
	rem keep its own jvm -1.5-
	set jvm=%_APP_DRIVE%\Ecl330M\jre\bin\javaw
	)

IF [%version%] == [KITJAVA320M] (
	rem on la redefinit pour 320
	:: 2070115: cf. pbs de WTP 
	set eclipse_home=%_APP_DRIVE%\Ecl320M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitJava320M
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [MOCP330M] (
	rem on la redefinit pour 330
	:: 2070115: cf. pbs de WTP 
	set eclipse_home=%_APP_DRIVE%\Ecl330M\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\MocP330M
	:: set jvm=%JAVA_HOME%\bin\javaw
	rem keep its own jvm -1.5-
	set jvm=%_APP_DRIVE%\Ecl330M\jre\bin\javaw
	)

:: 2070709:
IF [%version%] == [KITJAVA320P] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320P\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitJava320P
	set jvm=%JAVA_HOME%\bin\javaw
	)

:: 2070709:
IF [%version%] == [KITUML320P] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320P\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\KitUml320P
	set jvm=%JAVA_HOME%\bin\javaw
	)

IF [%version%] == [ETU320Y] (
	rem on la redefinit pour 320
	set eclipse_home=%_APP_DRIVE%\Ecl320Y\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Ecl320Y
	set jvm=%JAVA_HOME%\bin\javaw
	)


IF [%version%] == [ETU312] (
	rem on la redefinit pour 312 avec JDK 142
	set eclipse_home=%_APP_DRIVE%\Ecl312\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\%_WSID%\Ecl312
	:: WARN
	set jvm=%all_progs%\j2sdk1.4.2_11\bin\javaw
	)

:: WARN pour les versions specifiques a projet, 312 utilise jvm 142 sauf redef ici ou licom 
IF [%version%] == [TPL] (
	rem on la redefinit pour 312 avec JDK 142
	set eclipse_home=%_APP_DRIVE%\Ecl312\eclipse
	:: cf. in situ
	:: 2070125: updated
	set allprj_home=D:\Prj\SimMgr\SmgIter00\0_Grm\Tpl\Ecl312%_WSID%
	:: WARN
	set jvm=%all_progs%\j2sdk1.4.2_11\bin\javaw
	)

::2121130:
IF [%version%] == [SETCFG_360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_PIKLE_DRIVE%\Ecl\PK\SetCfg360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2130129:
IF [%version%] == [RMYSQ_360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\FTC\RMYsq_360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

::2130215:
IF [%version%] == [RMPYJY_360W] (
	rem on la redefinit pour 360
	set eclipse_home=%_APP_DRIVE%\Ecl360W\eclipse
	set allprj_home=%_WORK_DRIVE%\Ecl\FTC\RMPyJy_360W
	set jvm=%JAVA_HOME%\bin\javaw
	)

echo == ready to throw
echo version=%version%
echo ProgramFiles=%ProgramFiles%
echo jvm=%jvm%
echo args=%other_args%
echo all_progs=%all_progs%
echo eclipse_home=%eclipse_home%
echo allprj_home=%allprj_home%
echo java_home=%java_home%

:: =========== FAIRE SIMPLE wait py ou l'on centralisera:
::				on se contente d'ajout une ligne par config
::				un script ne gere que un seul _WSID
::				ne pas oublier zone WARMINIT pour les settings
:: ===========================================================================
:: =========== ETU generiques 
:: desormais le Java étant sur 320 mais on conserve pour UML la version 312
IF [%version%] == [ETU312] (
   	echo lance version de developpement V312 par defaut sur WS ETUCode
	:: %_APP_DRIVE%\Ecl312\eclipse\eclipse.exe -vm %jvm% -data D:\Code\Etu\EtuJava\Ecl312%_WSID% %other_args%
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home%  %other_args%
	goto The_end
	)


IF [%version%] == [ETU320C] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [ARGO320C] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [IC] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


IF [%version%] == [KITANT] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [ETUANT] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


IF [%version%] == [KITPYT] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [ETUPYT] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [KITJAVA] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [ETUJAVA] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [ETUUML320U] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS OMONDO pdef
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)
IF [%version%] == [KITUML320U] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto par defaut sur WS OMONDO pdef
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2070712
IF [%version%] == [MOCP320M] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL sur MOCKUP PORTALS
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)

IF [%version%] == [MOCC320M] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL sur MOCKUP COMPOSANTS JEE
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)



IF [%version%] == [ITI320M] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)


:: 2070702
IF [%version%] == [ITI320C] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto tout a fait std
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)

:: 2070115
IF [%version%] == [ETUJAVA320M] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)
IF [%version%] == [KITJAVA320M] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)
IF [%version%] == [ETUANT320M] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)
IF [%version%] == [KITANT320M] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings MCL
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)

IF [%version%] == [ETU320Y] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
	::2070123:
	echo 2070123: DEPRECATED
   	echo lance version de developpement V320Y Yoxos par defaut sur WS ETUCode
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: ==================================================================================
:: 2070709: on passe avec le P
IF [%version%] == [KITJAVA320P] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings VPP
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)

:: 2070709: on passe avec le P
IF [%version%] == [KITUML320P] (
	rem on la redefinit pour 320
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo lance version de developpement V320C Callisto avec settings VPP
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation -vmargs -Xms128M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M %other_args%
	goto The_end
	)

:: ===========================================================================
::2080915: VALID330C
IF [%version%] == [VALID330C] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- distro C 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2080904: VALID330T
IF [%version%] == [VALID330T] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO B 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2080108: with version 330
IF [%version%] == [KITANT330B] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO B 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2081229: with version 340
IF [%version%] == [KITANT340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO B 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)




:: 2090223: with version 340
IF [%version%] == [MOCP340W] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [MOCPROFIL340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2100818
IF [%version%] == [KITJYPY340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

::2100922
IF [%version%] == [GO212_340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

::2101006
IF [%version%] == [TEST212_340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2121111
IF [%version%] == [SETCFG_360W] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2130129
IF [%version%] == [RMYSQ_360W] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2130215
IF [%version%] == [RMPYJY_360W] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

::2121111
IF [%version%] == [VLNM213_360W] (
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

::2100923:

IF [%version%] == [SUMMER340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2090921:
IF [%version%] == [AVEC340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)
IF [%version%] == [AVEC340R] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)
::2100923:
IF [%version%] == [ITI340W] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)



IF [%version%] == [SUMMER340W] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2100930:
IF [%version%] == [SUMMER360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2101102:
IF [%version%] == [SNECMAINTENANCE360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2101102:
IF [%version%] == [SNECMAINTENANCEPARAM360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2110220:
IF [%version%] == [SNECMAINTENANCETX360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

::2110228:
IF [%version%] == [SPRING360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2110527:
IF [%version%] == [KITSLM360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

::2120704
IF [%version%] == [KIT360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


::2120416
IF [%version%] == [GO212_360W] (
	rem on la redefinit pour 360
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 360 -helios- DISTRO W02
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [AVEC340W] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2081229: with version 340
IF [%version%] == [ALSTOMEAI340W] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2081229: with version 340
IF [%version%] == [KITANT340R] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO R 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2091126: retablit KITANT340W pour du training de remise a Java
IF [%version%] == [KITANT340W] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymed- DISTRO W 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2081229: version 340 AUTONOME
IF [%version%] == [KITANT340M] (
	rem on la redefinit pour 340
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Mcl fullStack with its own myeclipse.ini
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\myeclipse.exe -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)


:: 2100923: 
IF [%version%] == [ITI340DS] (
	rem on la redefinit pour 340
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version DB2 workbench 2.2
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -product com.ibm.datastudio.mini.im.product.ide -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

:: 2160320: 
IF [%version%] == [LUNA400] (
	rem on la redefinit pour 400
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version Luna400 on WORKDRIVE\%WSID%\Luna400
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

:: 2160404: 
IF [%version%] == [LUNA400LOC] (
	rem on la redefinit pour 400
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version Luna400 on %PIKLE_DEVICE%\Prj\Ice\Ecl\%WSID%\Luna400_LOC
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

:: 2160404: 
IF [%version%] == [LUNA400BASIC] (
	rem on la redefinit pour 400
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version Luna400 on %PIKLE_DEVICE%\Prj\Ice\Ecl\%WSID%\Luna400BASIC
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

:: 2100923:
IF [%version%] == [SUMMER340DS] (
	rem on la redefinit pour 340
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version DB2 workbench 2.2
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -product com.ibm.datastudio.mini.im.product.ide -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

:: 2120720:
IF [%version%] == [TXDb2340DS] (
	rem on la redefinit pour 340
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version DB2 workbench 2.2
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -product com.ibm.datastudio.mini.im.product.ide -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

:: 2091123: version DB2 workbench 2.2
IF [%version%] == [KitDb2340DS] (
	rem on la redefinit pour 340
	echo eclipse_home=%eclipse_home%
	echo allprj_home=%allprj_home%
	echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run version DB2 workbench 2.2
   	:: %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	%eclipse_home%\eclipse.exe  -product com.ibm.datastudio.mini.im.product.ide -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)


:: 2081119: with version 330
IF [%version%] == [KITANT330W] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO W 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2081127: with version 330
IF [%version%] == [CFGTOD330W] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO W 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2080423: with version 330
IF [%version%] == [KITANT330P] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO P 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2080523: with version 330
IF [%version%] == [KITUML330P] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO P 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2080424: with version 330
IF [%version%] == [KITANT330U] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO U 
	:: TODO: passer les arguments de eclipse.ini dans la ligne de cde: ceci afin d'essayer de prendre en compte
	cd %eclipse_home%
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2080424: with version 330
IF [%version%] == [KITANT330R] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO R 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2100923 remplace 330B
IF [%version%] == [ITI340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -europa- DISTRO B 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2080429
IF [%version%] == [ITI330B] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO B 
        echo 2100923: WARN: migration under 340B from now
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)


:: 2090127
IF [%version%] == [KITLAYOUTPL340B] (
	rem on la redefinit pour 340
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 340 -ganymede- DISTRO B 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: 2080429
IF [%version%] == [ITI330R] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Ecl 330 -europa- DISTRO B 
	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [KITANT330M] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Mcl fullStack with its own jvm -1.5-
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

IF [%version%] == [MOCP330M] (
	rem on la redefinit pour 330
	rem echo eclipse_home=%eclipse_home%
	rem echo allprj_home=%allprj_home%
	rem echo jvm=%jvm%
	rem plaie des espaces, ne pas oublier dquotes
   	echo run Mcl fullStack with its own jvm -1.5-
   	%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation  %other_args%
	goto The_end
	)

IF [%version%] == [PHP422] (
   	echo lance version RM 422 PHP avec Pdt
   	REM %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	echo %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	REM %eclipse_home%\eclipse.exe -data %allprj_home% -showlocation %other_args%
	REM echo %jvm%
	REM %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	REM 2141112 _DO_NOT force jvm !
	%eclipse_home%\eclipse.exe  -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

IF [%version%] == [PHP422] (
   	echo lance version RM 422 PHP avec Pdt
   	REM %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	echo %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	REM %eclipse_home%\eclipse.exe -data %allprj_home% -showlocation %other_args%
	REM echo %jvm%
	REM %eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
	REM 2141112 _DO_NOT force jvm !
	%eclipse_home%\eclipse.exe  -data %allprj_home% -showlocation %other_args%
	goto The_end
	)

:: ===========================================================================
:: ========== ALL_WSP_HOME specifiques a projet non generiques in situ WARN ne pas mixer
:: original fourni par MSC
if [%version%] == [SMG] (
		echo TODO: lance version SimManager V300 sur WS ETUCode et non pas WS MSC
		echo TODO: reprendre les configs de run_studio
		C:\MSC.Software\MSC.SimManager\2005r2\Studio\eclipse.exe -vm %jvm% -data D:\Code\Etu\EtuJava\Ecl300 %other_args%
		goto The_end
	) 


:: reste en 312 pour UML dans Dir de SMG au BOULOT
if [%version%] == [TPL] (
			echo TODO: lance version SimManager V312 sur package projet SMG.TPL
			echo TODO: reprendre les configs de run_studio
			:: %_APP_DRIVE%\Ecl312\eclipse\eclipse.exe -vm "%jvm%" -data D:\Prj\SimMgr\0_Grm\Tpl\Ecl312%_WSID% %other_args%
			%eclipse_home%\eclipse.exe -vm "%jvm%" -data %allprj_home% -showlocation %other_args%
			goto The_end
	) 

:: deprecated, tout reste en TPL
if [%version%] == [PRE] (
			echo TODO: lance version SimManager V312 sur package projet SMG.TPL
			echo TODO: reprendre les configs de run_studio
			%_APP_DRIVE%\Ecl312\eclipse\eclipse.exe -vm "%jvm%" -data D:\Prj\SimMgr\0_Grm\Pre\Ecl312%_WSID% %other_args%
			goto The_end
	) else ( echo ERROR: configuration non reconnue
		 echo lancement de Eclipse DVP/SMG option [-p TPL / SMG] [-j jre] [other]	
		)



pause

:The_end
set version=
set jvm=
set other_args=
set eclipse_home=
set _WSID=
set allprj_home=
set allwsp_home=


:: for dbg TOSWAP
color 0A
pause

endlocal
