#! /usr/bin/env python
# -*- coding: utf-8 -*-
##2060208: textFile BOM interne: accepte non ascii:ùéàè
# version VT
##########################################################################
#                                                                        #
#                       sitecustomize                                    #
#                                                                        #
##########################################################################
# $Author: ppaille $#
# $Date: 2006/09/06 09:36:46 $#
##########################################################################
#   appelle le SetEnv() de ppStartup responsable du codage
#   en mode appel licom, site.py importe ce sitecustomize si présent
#      placer ce fichier dans le CurDir pour chaque session
#       ou dans le PYTHONPATH de l'utilisateur
#   en mode interactif >> ppStartup doit figurer prealablement dans le PYTHONSTARTUP
#       ppDefault.pth le designe et peut etre copie dans PYTHONHOME (dir d'install) pour s'en assurer
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
# 2060828: on appelle le TestStartup mais surtout pas Main !
# 2060208:  intègre la déclaration d'encoding
#--------------------------------------------------------------------------
# ToDo lifo:
#--------------------------------------------------------------------------
#
#==========================================================================
V_MAIN = '01'
V_SUB = '00'
V_COMPIL = '001'
B_DEBUG = __debug__
NULL = None

#__version__= '%02d_%02d_%03d' %(V_MAIN, V_SUB, V_COMPIL)
__version__ = '%s_%s_%s' %(V_MAIN, V_SUB, V_COMPIL)
__author__ = 'php'
__stamp__  = '2060202'


#============================================
# import modules
#--------------------------------------------
import sys
from ppStartup import SetEnv, TestStartup

#============================================
# Public interface 
#--------------------------------------------

#============================================
#
# Public module functions
#
#============================================


#============================================
# module execution
#
if __name__ == "__main__":
    iRet =TestStartup(sys.argv)
    # sys.exit(iRet)
else:
    iRet = SetEnv()
















