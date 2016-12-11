----------------------------------------------
2120727:
WARN: since 2120727: we redefine profil ppdefault under KLELOC_URL on SMT and further WSID
THIS IS the KLEW version common inherits from SMT
----------------------------------------------
2090730: 
Il est important de se souvenir que seul %PROG_HOME% est dans le path,
on ne peut pas accéder aux fichiers directement, il faut indiquer explicitement et même se placer dans la Dir du script
On met désormais les utilitaires dans Main et iniProfil dans Profil 
TODO homogénéiser sur autres WSID
----------------------------------------------
2071016: use de Script go
[R] désormais, on le préfère à l'appel direct de ant 
mais on conserve le ant, pyt et java dans un PATH direct (WSID standard)
par contre en licom de dvp, on utilise plutôt go de script car on contrôle mieux les versions, ce qui n'est pas le cas avec PATH



