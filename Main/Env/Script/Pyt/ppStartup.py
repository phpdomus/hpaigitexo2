#! /usr/bin/env python
# -*- coding: utf-8 -*-
##2060208: textFile BOM interne: accepte non ascii:ùéàè
# version VT
##########################################################################
#                                                                        #
#                       ppStartup                                        #
#                                                                        #
##########################################################################
# $Author: ppaille $#
# $Date: 2006/09/06 09:36:46 $#
##########################################################################
#   Principales verifications des projets et ctes a tout va
#
#   appel direct par main modules ou bien (seulement pour le SetEnv avec arguments)
#       execfile ('D:\\Code\\Etu\\EtuPyt\\Pack\\Spm\\Rel\\phpPythonStartup.py')
#
##[M]2060220 modified 2060828: 
##     1) placer un ppStartup.py valide dans la Dir des Batch:
##              D:\Progs\Script\Pyt
##              ce ppStartup est un release maintenu dans pack Env ainsi que ppDefault.pth
##     2) copier dans Dir d'install de notre PYT (ie. PYTHONHOME=C:\Python23 où figure le python.exe)
##              ppDefault.pth qui désigne la Dir %PHP_DIR%:\Code\Kit\Bat\Rel entre autres (plusieurs pth possibles)
##     3) soit on copie dans la même dir que module.py le sitecustomize.py (appelé automatiquement lors licom via site.py)
##              placer le sitecustomize dans la dir du module.py que l'on veut exécuter
##		    ce sitecustomize import ppstartup et appelle SetEnv() 
##	          
##     3) soit solution plus simple = import ppstartup dans le module.py
##		    et exécuter le SetEnv() qui ajoute au sys.path AVANT les import de modules éparpillés.
##      
##     pour diffusion, en l'absence de pth, il suffit de copier dans la dir du module.py le ppstartup
##     En l'absence de sitecustomize ou de ppstartup, echec mais pas d'écho d'exception
#--------------------------------------------------------------------------
# Version lifo:
# 2121101: correct for KLEW and SCRIPT_HOME rather than PROG_HOME\Script
# 2100818: Correction SetEnv avec inhibit de print qui perturbe pydev set interpreter as for pth
# TODO: update CS_MODULE_PATH as soon PIKLE ready
# 2060220: 01_00_024
# 2060208: ajout de la Dir Code\Lib\Pyt 
# 2060202: startup (appelable par sitecustomize) dans fichier utf natif
# 2050620: recueil de type include pour recueil de contexte
#--------------------------------------------------------------------------
# ToDo lifo:
# [] detecter la présence de pyWin sinon inhiber les fonctions appelant wincom
#--------------------------------------------------------------------------
#
#==========================================================================
V_MAIN = '00'
V_SUB = '00'
V_COMPIL = '001'
B_DEBUG = __debug__
NULL = None

#__version__= '%02d_%02d_%03d' %(V_MAIN, V_SUB, V_COMPIL)
__version__ = '%s_%s_%s' %(V_MAIN, V_SUB, V_COMPIL)
__author__ = 'php'
__stamp__  = '2060123'

##  liste de string des Dir de modules que l'on veut faire figurer assurement
##  dans PYTHONPATH de la session
CS_MODULE_PATH = ('.','C:\\Python23\\lib','C:\\Python23\\lib\\lib\\tkinter', \
                  'C:\\Code\\Lib\\Pyt', 'C:\\Code\\Etu\\EtuPyt\\Pack\\Spm\\Rel', \
                  'C:\\Code\\Etu\\EtuPyt\\Pack\\Rdb\\Rel','C:\\Code\\Etu\\EtuPyt\\Pack\\Url\\Rel')
CS_DOMAIN = "SO"
CS_VER_PYTHON_MINI  = '2.3'     #en string pour la comparaison avec mini nversion toleree

#============================================
# import modules
#--------------------------------------------
#TODBG: sachant que 
import sys
import os
import string
import traceback, time
if os.name == "posix":
        import pwd

import string, re
##import select, signal
##import inspect
##import socket
import Tkinter
import win32net
import win32netcon
#============================================
# Public interface 
#--------------------------------------------
#Package only: __all__ = ['phpStartup']
bTrue, bFalse = bool(1), bool(0)        #attn des versions <1.5 
NERR_OK, NERR_FAIL = 1, 0

#============================================
#
# Public module functions
#
#============================================


#============================================
# SetEnv
#--------------------------------------------
def SetEnv():
        """
        Repositionne les path selon les environnements

        @author: PhP
        """
        ret = NERR_OK
        i=1

        for d in CS_MODULE_PATH:
                #if (string.find (sys.path, d) < 0) :
                if (not d in sys.path):
                        sys.path.append (d)

        #2100818: WARN _DONOT print here car perturbe def. de pythonInterpreter in pydev meme phenomene que pth
        if 0:           #NEVER: __debug__:
                        os.system(getStrClean())
                        print '\n-- PYTHONPATH:\n'
                        for d in sys.path: 
                                print '%02d \t %s' %(i,d )
                                i +=1
                
        try:
                pass
        except:
                print "erreur in SetEnv"
                return NERR_FAIL

        else:
                return ret


#============================================
# getComponentVersion
#--------------------------------------------
def getComponentVersion(componentName):
        """Retrieves the version of the component."""

        #Open the file $CONF_DIR/versions/sftscript
        try:
                fileName = os.environ.get("CONF_DIR") + "/versions/" + componentName
                fileVersion = open(fileName, 'r')
        except IOError:
                errorInfo = sys.exc_info()
                traceback.print_exception(errorInfo[0], errorInfo[1], None)
                return "", ""

        #Read the first line
        version = fileVersion.readline()

        #Remove whitespaces and trailing \n
        version = re.sub(r'\n', '', version)
        version = string.strip(version, ' ')
        version = re.sub(r'[ ][ ]+',' ',version)

        #Split the version number et version date
        versionArray = string.split(version," ")
        versionNumber = versionArray[0]
        versionDate = versionArray[1]

        #Return
        return versionNumber, versionDate


#============================================
# getConfig
#--------------------------------------------
def getConfig():
        """Retrieves the config (top directory name and config name + version number).
                Based on $CONF_TOP_DIR and/or $CONF_DIR."""

        # CONF_DIR=$CONF_TOP_DIR/space/confx.y.z/dev_$osname
        
        #Get $CONF_TOP_DIR value
        confTopDir = os.environ.get("CONF_TOP_DIR")

        #Get $CONF_DIR value
        confDir = os.environ.get("CONF_DIR")

        #No $CONF_DIR: not an EGAT configuration environment
        if confDir is None:
                return None, None
        
        split = os.path.split
        if confTopDir is None:
                #Try to deduce it from CONF_DIR
                confTopDir = split(split(split(confDir)[0])[0])[0]

        #Get conf version from CONF_DIR
        confVersion = split(split(confDir)[0])[1]

        #Return
        return confTopDir, confVersion


#============================================
# getUserLogin
#--------------------------------------------
def getUserLogin():
        """Retrieves the user login."""

        login = ""

        if os.name == "posix":
                #for UNIX: get the login name
                #of the currently effective user ID
                login = pwd.getpwuid(os.getuid())[0]
        elif os.name == "nt":
                #for WINDOWS (nt or 2000): read the login in env variable
                login = os.environ.get("USERNAME")
        else:
                #for other os: no login name
                login = ""

        return login

#============================================
#   getDC
#--------------------------------------------
def getDC(dom=CS_DOMAIN):
        """retourne server de domaine."""
        try:
                #get the server for the domain -- it has to be a primary dc
                dc = str(win32net.NetGetDCName("",dom))
                
        except win32net.error:
                print traceback.format_tb(sys.exc_info()[2]),'\n',sys.exc_type,'\n',sys.exc_value
                dc = "unknown"

        return dc

#============================================
#   GetUserDC
#--------------------------------------------
def GetUserDC(netuser = "", dom=CS_DOMAIN):
        """retourne infos user domaine """
        login = netuser
        if len(login)==0: login=getUserLogin()

        try:
                #get the server for the domain -- it has to be a primary dc
                server=getDC(dom)
                #info returns a dictionary of information
                info = win32net.NetUserGetInfo(server, login, 3)
                if __debug__:
                        print info['full_name']
                        print '------ info: ', info

                return NERR_OK
                        
        except win32net.error:
                print traceback.format_tb(sys.exc_info()[2]),'\n',sys.exc_type,'\n',sys.exc_value
                return NERR_FAIL


#============================================
# getOSName
#--------------------------------------------
def getOSName():
        """Retrieves the operating system name."""

        OSName = ""

        if os.name == "posix":
                #get the uname tuple
                uname = os.uname()
                sysname = uname[0]
                release = uname[2]

                if sysname[:4] == "IRIX":
                        #Special case for IRIX
                        sysname = "IRIX"
                        OSName = sysname
                elif sysname == "Linux":
                        OSName = "Linux"
                else:
                        OSName = sysname + release

        elif os.name == "nt":
                #For Windows NT or 2000: Set the name to Win32
                OSName = "Win32"
                
        else:
                OSName = os.name

        return OSName



#============================================
# GetOSSep
#--------------------------------------------
def getOSSepPath():
        """retourne le Car du sep de Path."""

        szSep = "/"

        if os.name == "nt":
                szSep = "\\"

        return szSep

#============================================
# getStrClean
#--------------------------------------------
def getStrClean():
        """retourne la str d'effacement interactif."""

        sz = "clear"

        if os.name == "nt":
                sz = "cls"

        return sz
#============================================
# getOSSepList
#--------------------------------------------
def getOSSepList():
        """retourne le Car du sep de listes Path."""

        szSepList = ":"

        if os.name == "nt":
                szSepList = "\\.1"

        return szSepList


#============================================
# getHostType
#--------------------------------------------
def getHostType():
        """Retrieves the operating system type.
        (SUN, PCWINDOWS, SGI, HP, HPC, PCLINUX)"""

        #Get osname
        osname = getOSName()

        #Find corresponding host type
        if osname[:5] == "SunOS":
                hostType = "SUN"
        elif osname[:4] == "IRIX":
                hostType = "SGI"
        elif osname[:2] == "HP":
                hostType = "HP"
        elif osname[:3] == "AIX":
                hostType = "HPC"
        elif osname == "Win32":
                hostType = "PCWINDOWS"
        elif osname == "Linux":
                hostType = "PCLINUX"
        else:
                hostType = ""

        return hostType


#============================================
# getHostName
#--------------------------------------------
def getHostName():
        """Retrieves the name of the hosting machine."""

        return socket.gethostname()

        
#============================================
# flattenArray
#--------------------------------------------
def arrayToFlatStr(array, sep=" "):
        """Convert an array into a flat list string.
        sep arguments specifies the separator character.
        The default is a space character."""

        if (array is None) or (len(array) == 0):
                return ""

        strResult = ""
        for val in array:
                if (val != None) and (str(val) != ''):
                        strResult += str(val) + sep
        strResult = strResult[:-1]

        return strResult


#============================================
# getCaller
#--------------------------------------------
def getCaller():
        """Return the module's name that called the current module.
                If it's python, return <stdin>."""

        callerName = None
        
        stack = inspect.stack()
        #print "stack=", stack

        if len(stack) <= 2:
                callerName = "<stdin>"
        else:
                for i in range(2, len(stack)):
                        if stack[i][1] == "<string>":
                                continue
                        else:
                                callerName = inspect.getmodulename(stack[i][1])
                                break

        if callerName is None:
                callerName = "<stdin>"
                        
        ##Warning in Python documentation about memory leaks
        del stack
        
        return callerName

#============================================
# SetCustomize
#--------------------------------------------
def SetCustomise(szCodage = ''):
        """ fonction autonome appelée par sitecustomise si existe dans le PYTHONPATH ou dans le curDir
                on reprend le code de site.py

                @param szCodage: string codage si different du default
                @type szCodage: string 
                @return NERR_OK équivaut à OK
                @rtype: NERR (int)
                """
        iRet = NERR_FAIL
        try:
                # Set the string encoding used by the Unicode implementation.  The
                # default is 'ascii', but if you're willing to experiment, you can
                # change this.

                encoding = "ascii" # Default value set by _PyUnicode_Init()

                if 1:
                        # Enable to support locale aware default string encodings.
                        import locale
                        loc = locale.getdefaultlocale()
                        if (szCodage=='' and loc[1]):
                                encoding = loc[1]
                        iRet = NERR_OK

                if 0:
                        # Enable to switch off string to Unicode coercion and implicit
                        # Unicode to string conversion.
                        encoding = "undefined"

                if encoding != "ascii":
                        # On Non-Unicode builds this will raise an AttributeError...
                        sys.setdefaultencoding(encoding) # Needs Python Unicode build !  
                       
        
        except Exception, err:
                print "Customize Error:"
                print str(err)
                iRet=NERR_FAIL
        
        return iRet


#============================================
# isGoodVersion
#--------------------------------------------
def isGoodVersion(szVersion=CS_VER_PYTHON_MINI, bRetro=bTrue):
        """ retourne bool si version acceptable

                @param versionMini: incluse souhaitable
                @type versionMini: string "i.j"
                @param bRetro: 1/0 1= autorise versions sup.
                @type bRetro: integer 1/0   // retrocompatibilite
                @return NERR_OK équivaut à OK
                @rtype: NERR (int)
                """
        bRet = bFalse
        szVer = sys.version[:3]
        if ((bRetro and (szVer>=szVersion)) or ((not bRetro) and (szVer==szVersion))):
                bRet = bTrue
        
        return bRet

#============================================
#
# Private module functions
#
#============================================
# _usage 
#--------------------------------------------
def _usage():
        """
        Print help string.
        @author: php
        """

        print "<php_kit>: Usage:"
        print __doc__
        print ""
        print "php_kit --help"
        print ""

#============================================
# _log
#--------------------------------------------
def _log(mode, msg):
        """
        Print log info on standard output.
        @author: php
        """

        if mode not in ("get-logfile", "grid-execute"):
                print msg

#============================================
# _gui
#--------------------------------------------
def _msgBox(msg , title=""):
        """
        MessageBox prive
        PytRef.343
        @author: php
        """
        root = Tkinter.Tk()
        
        if (len(title) == 0) : title = "Graphic mode"
        root.title (msg)
        
        tv=Tkinter.StringVar()
        Tkinter.Label(textvariable = tv).pack()
        Tkinter.Entry(textvariable = tv).pack()
        tv.set('Hello !')
        
        
        btn = Tkinter.Button(root, text=msg, command = root.quit)
        btn['foreground'] = 'red'
        
        btn.pack()
        Tkinter.mainloop()
        print tv.get()

#============================================
# Main
#--------------------------------------------
def TestStartup(argv):
        """
        Main function.
                Appelle pdef le SetEnv
        @param argv:
        @type argv: list of string
        @return: return code (NERR_OK:ok, NERR_FAIL: error)
        @rtype: int

        @author: PhP
        """
        ret = SetEnv()
        if __debug__:
                # si desire changer de user sret = getDC()
                ret = GetUserDC()
                print " isGoodVersion   :", isGoodVersion()

        #Parse command line arguments
        if __debug__: print "argv[1:]=", argv[1:]
        try:
                args = argv[1:]
                
        except :
                print "Error:", err
                _usage()
                return NERR_FAIL

        #print "opts:", opts
        if __debug__: print "args:", args
        
        #Init

        mode = "batch"

        #Check options
        for a in args:
                if a in ("-h", "--help"):
                        _usage()
                        return NERR_OK
                elif a in ("-g", "--gui"):
                        mode = "graphical"

        #Check arguments
        if mode == "batch":
                if len(args) == 0:
                        mode = "interactive"
                elif len(args) != 3:
                        print "Error: wrong count of arguments!"
                        _usage()
                        return NERR_OK


        #MODE BATCH
        if mode == "batch":
                pass
##        #get arguments
##        generationScriptName = args[0]
##        pythonScriptName = args[1]
##        ptName = args[2]

        #MODE INTERACTIVE
        if mode == "interactive":
                pass
##        #Ask for arguments
##        generationScriptName = raw_input("Generation script filename: ")
##        pythonScriptName = raw_input("Python script filename: ")
##        ptName = raw_input("Process Template destination filename: ")

        #Common treatments for batch and interactive
        if mode in ("batch", "interactive"):
                try:
                        pass
##            #Create wizard
##            wizard = pt_from_python_wizard.PTFromPythonWizard()
##
##            #Load and run generation script
##            wizard.loadGenerationScript(generationScriptName)
##            wizard.runGenerationScript(pythonScriptName, ptName)
                except Exception, err:
                        print "Execution Error:"
                        print str(err)
                        return NERR_FAIL

                print "Execution OK"
                return NERR_OK


        #MODE GRAPHICAL
        if mode == "graphical":
                _msgBox(args[0] + "::" + getUserLogin())
##         wizardGui = pt_from_python_wizard_window.PTFromPythonWizardWindow(
##                                         title=" Wizard : PYTHON -> PT")
##        wizardGui.logMessage("Process Template Wizard Ready...")
##        wizardGui.run()
                
                return NERR_OK
                

        return NERR_FAIL




#============================================
# module execution
#
if __name__ == "__main__":
        ret = TestStartup(sys.argv)
        sys.exit(ret)




##REM: il existe un uncomment meme dans l'IDLE
##    #============================================
##    # Function   template
##    #--------------------------------------------
##    def Function( arg1=NS_PT, arg2=PREFIX_PT):
##        """
##        This fun does.
##
##        @param arg1: namespace to put to the element
##        @type arg1: string
##        @param arg2: prefix of the namespace
##        @type arg2: string
##        @return 
##        @rtype: xml.dom.Element
##        @raise: typeError
##        
##        @auth: PhP
##  """














