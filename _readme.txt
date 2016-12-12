------------------------------------------------------------------

2161202:
this version for WINDEFdemoextrud limiée à la simple dizaine de fichiers nécessaires à la présentation, 
les premiers commits de branches master et WINDEFdemo contiennent une version de démonstration.



B: individualisation du tronc commun en parallele a master version de depart sujette a modification sur la partie batch et visualisation.
// tag devcommon.01 pour un retour general de la version 1 initiale


D: Modification de Pierre sur le batch et script systeme sur la reconnaissance auto du contexte connecte


D1: co creation de branche devtest pour tests sur le batch de reconnaissance

E: ci + merge AUTOMATIQUE (vient en ajout dans le fichier) apres validation de branche devtest par Jacques into branche devcommon
// push pour communiquer au reste de l'equipe

=======
C : creation de branche correspondant a la feature devassist
// tag devassist.00 pour un eventuel retour  avant les modifications de Sophie

F: ci du developpement de l'equipe sur la partie dev.assist sur la librairie tabs

H: ci de etape de correspondant a livraison de l'exercice
// tag commenté de la version devcommon.02
ppaille@LFR003469 /s/Presentation/WINDEFdemoextrud (devcommon)
$ git tag devcommon.02 -m "version git.exercice delivery "

ppaille@LFR003469 /s/Presentation/WINDEFdemoextrud (devcommon)
$ git tag
devassist.00
devassist.01
devcommon.02
devcommun.01

==================================================================
trois repos: 

Workdir: local sous le version de workdir sous S:\Presentation\WINDEFdemoextrud

remote 'domaine' (pour les besoins de l'exercice qui représente team general sous S:\Presentation\Repos\RemoteLocal\gitex2loc.git 

remote de team general sur Github en clone à partir de repos workdir local comportant l'ensemble de l'historique log de l'exercice.

tag correspondant à toute étape de récupération
push pour chaque étape validée susceptible d'être communiquée à l'équipe