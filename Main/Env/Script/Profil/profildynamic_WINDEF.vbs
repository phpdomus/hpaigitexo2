'---------------------------------------------
' <p>Title: profildynamic_<WSID> </p>
' @auth: PP
' @version 2.0
' 2161201: correction de Jacques
' 2161201: commit de Pierre
' 2161101: simplified only for presentation
'         Pour la presentation, Nous indiquons dans les fichiers (.js, .css, .bat, .vbs et .htm) 
'         "PRESENTATION_CLASSROOM" en commentaire les lignes de code incriminees
' ============
' 2161110: keep for testing under KLE 
' 2160604: ajout des envar M2, M2_REPO, MAVEN_OPTS
' 2160502: UPDATE sur C:, le YSQ_HOME dans le profile de STC
' 2160408: update de M2_HOME sur last version maven et PORT_APP dir en rempla de PROG_HOME
' 2151025: update CATALINA_HOME et DRIVE
' 2141201: encoded UTF80BOM -- without BOM --, replaced all tabs by 4_SP
' 2070131:JOB
' ppIniProfil est OK a cette date, il suffit de rediger le script py de diag et 
' 2061222: incorpore en definitive JAVA_HOME\bin et ANT_HOME\bin dans le Path
' 2061214: version00_00 de remplacement progressif des .bat 
'         liste des ENVAR USER pour 3 profils types emboites (tests sur JOB et VT)
'----------------------------------------------    
Dim  WshShell, WshEnv, FileSystem, DirListing, FileInfo, tmp, m2DirDim
Dim FileN, FileDT, FileS, Book, Ret, b, btn, szerr
Dim ProgDir, PortAppDir, Path, JavaHome, BkpHome, AntHome
Dim Wsid, PythonHome, AppDrive, WorkDrive, PikleDrive, BootDrive, SvnHome, ReposDrive
Dim KleWsidUrl, KlePikleUrl, KleKloutUrl, ScriptDir

Ret = 0
szerr="nominal"

'==== settting des environnements de base selon le type de profil 
'----------------------------------------------
'00/02 Definition du contexte de base: profil de WSID: appli
Set WshShell = WScript.CreateObject("WScript.Shell")
'WARN: SAUF pour les ENVAR LICENSE on agit uniquement sur environnement USER: qui est le dernier parle lors d'une licom en cas de concurrence
'Set WshEnv = WshShell.Environment("SYSTEM")
Set WshEnv = WshShell.Environment("USER")
' ==============
'DBG_silent:
' 2150913: visu direct sur stdout for silent
' Set oWsh = WScript.CreateObject("WScript.Shell")
vbsInterpreter = "cscript.exe"
If InStr(LCase(WScript.FullName), vbsInterpreter) = 0 Then
    WshShell.Run vbsInterpreter & " //NoLogo " & Chr(34) & WScript.ScriptFullName & Chr(34)
    WScript.Quit
End If

REM Function wait(n)    
    REM WScript.Sleep Int(n * 1000)
REM End Function

'WScript.Interactive = false
WScript.Interactive = true
' WScript.StdOut.WriteLine WshShell.ExpandEnvironmentStrings("----- test echo simple")
Set objNet = WScript.CreateObject("WScript.Network")
WScript.Echo "Computer Name " & objNet.ComputerName
WScript.Echo "Username " & objNet.UserName
REM Set objAD = CreateObject("ADSystemInfo")
REM Wscript.Echo "Your Computer Name is " & objAD.ComputerName
REM Wscript.Echo "Your Username is " & objAD.UserName 
'WScript.Interactive = true
'WScript.Sleep Int(1000)
REM println "test"
REM wait (5)

'println (variable)
'wait(5)
' ==============

'2141229: cscript //T:200 --pdef 30 -- pour les appels de vbs
WScript.Timeout=0
' defini uniquement dans le script
WshEnv("KLE_OSGI") = "0.3.0.v2141201"
'FOR INIT_LEVEL we have to pass by PROCESS env
'    PROCESS are overloaded by already created USER 
'WshProcessEnv("INIT_LEVEL_SH") = -1
'WshProcessEnv.Remove "INIT_LEVEL_SH"    'UNTIL the end of THIS Script
'WshProcessEnv("INIT_LEVEL_SK") = -1
'WshProcessEnv.Remove "INIT_LEVEL_SK"    'UNTIL the end of sk initialization
'WshProcessEnv("INIT_LEVEL_S<APP>") = undefined
'==============================================
'2008-11-19: LORS DE REMISE A SimM avec true tests du comportement sur le vif ..
'----------------------------------------------
'2081118: uniquement pour profil HOST et pour certaines ENVAR comme LICENSE
'TO: Dim WshEnv_sys
'TO: Set WshEnv_sys = WshShell.Environment("SYSTEM")
' MSC
'TO: WshEnv_sys("MSC_LICENSE_FILE") = "1800@fr-31-01-05-217"
' Altair
'TO: WshEnv_sys("LM_LICENSE_FILE") = "27003@cuba;27003@fidji;27003@barbade"
'===============================================================================================
'===========PROFIL-1:   lecture de profil static script confirme en ENVAR les osh static 
'===========            DOIT ETRE CUSTOMIZE ou ACCES .INI PREALABLEMENT par osh
'===============================================================================================
Wsid=WshShell.ExpandEnvironmentStrings("%WSID%")
WshEnv("WSID") = Wsid
BootDrive=WshShell.ExpandEnvironmentStrings("%BOOT_DRIVE%")
WshEnv("BOOT_DRIVE") = BootDrive
'2141226: obsolete APP_DRIVE n'est pas une ENVAR 
if not (trim(WshEnv("APP_DRIVE")) = "") then
    WshEnv.remove "APP_DRIVE"
end if
AppDrive=BootDrive
WorkDrive=WshShell.ExpandEnvironmentStrings("%WORK_DRIVE%")
WshEnv("WORK_DRIVE") = WorkDrive
PikleDrive=WshShell.ExpandEnvironmentStrings("%PIKLE_DEVICE%")
WshEnv("PIKLE_DEVICE") = PikleDrive
'2141201: confirm osh_static en ENVAR
ReposDrive=WshShell.ExpandEnvironmentStrings("%REPOS_URL%")
WshEnv("REPOS_URL") = ReposDrive
'2141201: confirm osh_static en ENVAR
VaultDrive=WshShell.ExpandEnvironmentStrings("%VAULT_URL%")
WshEnv("VAULT_URL") = VaultDrive
'===============================================================================================
'===========PROFIL-2:       profil DYNAMIC customised selon FIXTURE, 
'===========                DOIT ETRE CUSTOMIZE ou ACCES RDB ou remove entre get et set
'===============================================================================================
WshEnv("WSID_TYPE") = "APP"
KleWsidUrl=WshShell.ExpandEnvironmentStrings("%KLEWSID_URL%")


' *************************************PRESENTATION**********************************************
' PRESENTATION_CLASSROOM
'2161201:PRESENTATION_CLASSROOM variable d'environnement du poste de travail est confirmee dans le script
WshEnv("KLEWSID_URL") = KleWsidUrl

KlePikleUrl=WshShell.ExpandEnvironmentStrings("%KLEPIKLE_URL%")
WshEnv("KLEPIKLE_URL") = KlePikleUrl
' WshEnv("KLE_URL") = KleWsidUrl
' on ne veut pas que cette definition soit persistante afin de pouvoir le redetecter au niveau des warm boots,
' c'est a la session DOS de l'appeler
' ***********************************************************************************************


ScriptDir=KleWsidUrl&"\Main\Env\Script"
'===============================================================================================
'===========default static settings on KleDir  ===============
'===============================================================================================
WshEnv("PROG_HOME") = AppDrive&"\Progs"
'WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting: '%PROG_HOME%'")
ProgDir=WshShell.ExpandEnvironmentStrings("%PROG_HOME%")
WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting PROG_HOME: %PROG_HOME%")
WshEnv("ZWP_DIR") = WorkDrive&"\Zwp"
'2161201:TOCUSTOMIZE still for WINDEF and KTC
WshEnv("PORT_APP") = "C:"&"\PortApp"
PortAppDir=WshShell.ExpandEnvironmentStrings("%PORT_APP%")

WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting PORT_APP: %PORT_APP% ")

'2081118: PAR specific on J and not Z
WshEnv("BKP_HOME") = "Z:\Archi"
BkpHome=WshShell.ExpandEnvironmentStrings("%BKP_HOME%")

'2070131: Ces Dir (Lib=commercial) appartiennent desormais au profil PGCD APP 
WshEnv("LIB_JAVA_DIR") = WorkDrive&"\Code\Lib\Java"
WshEnv("LIB_PYT_DIR") = WorkDrive&"\Code\Lib\Pyt"

'2141201: DOIT ETRE DEFINI SPECIFIQUEMENT WARN on est en envar user
'WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting: '%JAVA_HOME%'")
'JavaHome=WshShell.ExpandEnvironmentStrings("%JAVA_HOME%")
'WshEnv("JAVA_HOME") = WorkDrive&"\Java\Jee\jdk1.6.0_30"
'2140104: update on jdk1.7
'JavaHome=WorkDrive&"\Java\Jee\jdk1.6.0_30"
'WARN:TOCUSTOMIZE THIS KTC and default WINDEF
JavaHome="C:\Java\jdk1.8.0_66"
WshEnv("JAVA_HOME") = JavaHome
'2070219: modif sur 170
'2150404: V194
'2160408: mis en PortApp
AntHome=PortAppDir&"\Ant194"
WshEnv("ANT_HOME") = AntHome
'DBG_silent: WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting: '%ANT_HOME%'")
WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting ANT_HOME: %ANT_HOME%")
'ii: Le SetPython est considere comme default
'WARN: confirme sans underline
PythonHome=PortAppDir & "\Py_2751_p\App"
WshEnv("PYTHONHOME") = PythonHome
WshEnv("TCL_LIBRARY") = PythonHome&"\tcl\tcl8.5"
'WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting: '%TCL_LIBRARY%'")
WshEnv("TK_LIBRARY") = PythonHome&"\tcl\tk8.5"
'WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting: '%TK_LIBRARY%'")
'2091007: modif en mode usm_CONTEXT.custom
'2120727: ProgDir&"\Script\Pyt" & ";"&PythonHome&"\lib;"&PythonHome&"\lib\tkinter"
'2150429: WshEnv("PYTHONPATH") = ".;" & ScriptDir&"\Pyt" & ";"&PythonHome&"\lib;"&PythonHome&"\lib\tkinter"
WshEnv("PYTHONPATH") = ".;" & "C:\Progs\Py_2751_p\App\Lib"
'WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting: '%PYTHONPATH%'")
'2081201: WshEnv("SVN_HOME") = ProgDir&"\Svn154"
SvnHome=WshShell.ExpandEnvironmentStrings("%SVN_HOME%")
'iii: au final: rappel, on cree de novo un path depuis user inited par systeme
Path=WshShell.ExpandEnvironmentStrings("%PATH%")
'WScript.Echo WshShell.ExpandEnvironmentStrings("----- Existing system path: "&Path)
'---------------------------------------------
'2160408: update Maven339
'2100929: install Maven 2.2.1
WshEnv("M2_HOME") = PortAppDir&"\Maven339"

' add in PATH:
M2Dir=WshShell.ExpandEnvironmentStrings("%M2_HOME%")&"\bin"

'2160604: 
tmp=WshShell.ExpandEnvironmentStrings("%M2_HOME%")
WshEnv("M2") = tmp&"\bin"
WshEnv("MAVEN_OPTS") = "-Xms256m -Xmx512m"

'2161202: FORGET KLE_URL
tmp=WshShell.ExpandEnvironmentStrings("%KLEWSID_URL%")
WshEnv("M2_REPO") = tmp&"\Main\Lib\MvnRepos"
WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting KLE_URL: %KLE_URL% ")
WScript.Echo WshShell.ExpandEnvironmentStrings("----- Setting M2_REPO: %M2_REPO% ")
'=============================================
'2090908: on accede direct au scripts de pyt etant donne que second batch desormais
'2120727: Changed on ScriptDir Henceforth
'2121104: add ProgDir&"\MinGW\bin"crosscompiler for Ecl360C
WshEnv("PATH") = PythonHome&";" & ScriptDir&"\Main" & ";" & JavaHome &"\bin" & ";" &AntHome&"\bin" & ";" &SvnHome&"\bin" & ";" & ScriptDir&"\Pyt" & ";" & ScriptDir&"\Java" & ";" & ScriptDir&"\Ecl" & ";" & M2Dir & ";" & ProgDir&"\MinGW\bin" & ";" & ScriptDir&"\Ysq"
'----------------------------------------------
'01/02) Definition du contexte de WSID: dvp
WshEnv("WSID_TYPE") = "DVP"
WshEnv("KIT_JAVA_DIR") = WorkDrive&"\Code\Kit\Java"
WshEnv("KIT_PYT_DIR") = WorkDrive&"\Code\Kit\Pyt"
WshEnv("JYTHON_HOME") = "D:\PyJy\Jy252_01_06_00_30"
'----------------------------------------------
'02/02) Definition du contexte de WSID: host
'2130101: confirmED AFTER PATH to force pass by script to launch
WshEnv("WSID_TYPE") = "HOST"
WshEnv("CATALINA_HOME") = "D:\Motor\Tomcat_8.0.28"
WshEnv("CATALINA_DRIVE") = "D:"
'2160502: changed on C:
WshEnv("YSQ_HOME") = "C:\WampServer02_02E\bin\mysql\mysql5.5.24"
WshEnv("YSQ_SERVICE") = "wampmysqld"
'2130101: TOSWAP in oper mode or if merged engine and httpd
WshEnv("HTTPD_SERVICE") = "wampapache"
'WshEnv("SMG_LIB") = "C:\SmgLib"
WshEnv("MSQ_DATA") = WorkDrive&"\Data\"&Wsid&"\Data"
WshEnv("MSQ_LOG") = WorkDrive&"\Data\"&Wsid&"\Log"
WshEnv("MSQ_BKP") = WorkDrive&"\Data\"&Wsid&"\Archi"
WshEnv("MSQ_VAULT") = WorkDrive&"\Data\"&Wsid&"\Vault"
'2081123:
Dim SysDir
SysDir=WshShell.ExpandEnvironmentStrings("%SystemRoot%")
WshEnv("SVN_EDITOR") = SysDir&"\system32\notepad.exe"
WshEnv("SVN_BKP") = BkpHome&"\Svn"
'2141010:
WshEnv("SVN_REPOS_BAN") = ReposDrive&"\SvnBan"
' 2081118: idem then SvnMain dble access daemon and file
'WshEnv("SVN_REPOS_DAN") = ReposDrive&"\SvnMain"
'2130107: cleanED
'WshEnv("SVN_REPOS_MAIN") = WorkDrive&"\SvnMain"
WshEnv("SVN_REPOS_MAIN") = ""
' 2091215:
WshEnv("SVN_REPOS_DAN") = ReposDrive&"\SvnDan"
WshEnv("SVN_REPOS_TEST") = ReposDrive&"\SvnTest"
WshEnv("SVN_BKP") = BkpHome&"\Svn"
' DBG: wscript.echo "test3"
' DBG_silent: 
WScript.Echo "timeout=" & WScript.Timeout
'objStdOut.WriteLine "timeout=" & WScript.Timeout
'----------------------------------------------
'TODO: ORA et DB2
' 2100812: NO for SMT
' 2081118: WARN pour DAN on Workdrive
' WshEnv("MAIL_CUR_DIR") = PikleDrive&"\Data\Mail"
' WshEnv("MAIL_CUR_FILENAME") = "phpOutlook09.pst"
'===============================================================================================
'===========PROFIL-3:       auto-genere en fonction des setenv static puis dynamic, 
'===========                NO MODIFY 
'===============================================================================================
' 2120723: Standardization for PIKLE, SetCfg modes
'===============================================================================================
dim ZwpDir, ZwpUrl, ZwpUrlOld
' dim ScriptDir
dim objFSO
dim y,m,d
' DBG: wscript.echo "test4"
'----------------------------------------------
' ScriptDir=KleUrl&"\Main\Env\Script"
'DBG_silent:  
WScript.Echo "SCRIPT_HOME= "&ScriptDir
'objStdOut.WriteLine "SCRIPT_HOME= "&ScriptDir
WshEnv("SCRIPT_HOME") = ScriptDir
y=DatePart("yyyy", now)
y=Right(y,2)
m=DatePart("m", now)
if Len(m)<2 then
    m="0"&m
end if
d=DatePart("d", now)
if Len(d)<2 then
    d="0"&d
end if
'if you need TO_CLEAN an ENVAR: WshEnv("ZWP_URL") = ""
Set objFSO=CreateObject("Scripting.FileSystemObject")
'-----------------------------------
' verify if minimal ZwpDir doesn't exist MANDATORY in workdrive
ZwpDir=WorkDrive&"\Zwp"
WshEnv("ZWP_DIR") = ZwpDir
If Not objFSO.FolderExists(ZwpDir) Then
  objFSO.CreateFolder(ZwpDir)
  If Err.Number <> 0 Then
    'wscript.echo Now() & " Error creating Zwp folder " & Err.Description
    szerr=Now() & "Error creating Zwp folder " & Err.Description
    btn = WshShell.Popup(szerr,0,"Fatal error", &H4 + &H30)
    'FATAL ERROR
    Ret = 1
    set oShell = Nothing
    WScript.Quit Ret 
  End If
End If
set logFile=objfso.opentextfile(ZwpDir&"\pikle.log",8,True)
if objFSO.FolderExists(PikleDrive&"\Zwp") Then 
    ZwpUrl=PikleDrive&"\Zwp\2"&y&m&d
else
    ZwpUrl=WorkDrive&"\Zwp\2"&y&m&d
End if
ZwpUrlOld=WshShell.ExpandEnvironmentStrings("----- old Setting: '%ZWP_URL%'--- new setting: "&ZwpUrl)
'DBG_silent: 
WScript.Echo ZwpUrlOld
logFile.writeLine ("-------------------------------------------"&Now)
logFile.writeLine (ZwpUrlOld)
WshEnv("ZWP_URL") = ZwpUrl
If Not objFSO.FolderExists(ZwpUrl) Then
  objFSO.CreateFolder(ZwpUrl)
  If Err.Number <> 0 Then
    WScript.echo Now() & " !! Error creating Zwp Uri, please verify your rights !! " & Err.Description
    ZwpUrl=ZwpDir
    'NOT FATAL ERROR
    'WScript.Quit
  End If
End If
'TODO: put bellow if recording other logs
logFile.Close
'==============================================
'==== PHASE: diagnostic de base, positionne ENVAR WSID_SCRIPT
Dim oShell
dim szinfoWsid
set oShell = WScript.CreateObject ("WSCript.shell")
Dim Dlg
    b = 0 'TO_DO implementer un script de diag.
if (b=0) Then
    szinfoWsid="----- Station ready: " & Wsid & "-----"
    btn = WshShell.Popup(szinfoWsid,0,"     Info:", &H40)
    ' DBG: wscript.echo "test5"
else
    btn = WshShell.Popup("----- Please verify your WSID configuration: '%WSID%' -----",0,"Problem", &H4 + &H30)
    wscript.echo "test6"
End if
'====  THE END: ===========
set oShell = Nothing
WScript.Quit Ret
