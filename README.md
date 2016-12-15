# hpaigitexo2

-------- Présentation de l'exercice activité 2 du cours "Git & GitHub" 
-------- de Philippe Paillé (ptt.pro@laposte.net)
-------------------------------------------------------------------------------------------
Bonjour,

Cette présentation pour l'activité 2 du cours "Git & GitHub" arrive à l'occasion d'un travail personnel dont je me sers ici comme support très simplifié pour la partie correspondant à l'exercice.

	1) tabs: d'abord une utilisation classique de Git pour une partie développement: mise en conformité d'une librairie javascript de gestion d'onglets par du code css (WINDEFdemoextrud\Main\Lib\Js\tabs).

	2) utilisation de Git non plus en tant qu'outil mais dans le fonctionnement d'un script système pour l'appel des dernières librairies ou settings précisément lorsque l'on change de configuration utilisateur (ici en cas d'accessibilité avec une spécificité pour chaque handicap et à un moment de son évolution). Il ne nous était pas possible de passer par un bureau virtuel en raison des licences, Git intervient ici en complément d'un shell et d'un script ant qui reconnait et prépare le système, on peut choisir une configuration type dans l'historique et dans les branches. De la même manière, cela est utilisable en développement pour la conduite de tests en bénéficiant d'une organisation clairement structurée grâce au système de branches de Git.

Bien sûr, l'arborescence ne figure ici qu'à titre d'illustration, le repository lui-même se limite à la directory à déployer (WINDEFdemoextrud\KleW\Main\Env\Script\Profil). 

Comme indiqué dans le cours, les settings et configurations gérées concernent l'objet de l'application, les configurations des outils de développement sont ignorées.

Deux branches sont ainsi nécessaires: "devcommon" qui correspond au delivery principal en doublon de "master" par sécurité. Les fonctionnalités compatibles sont développées sur la branche "devassistive", je vous présente dans cet exercice un cas simple d'adaptation. L'objectif étant de s'exercer sur ce que l'on appris.

Les développeurs sont sur plateforme Windows, nous gardons donc le 'crlf'. Pierre, Jacques travaillent sur le code commun en particulier sur le script lancé au moment du boot qui est actuellement un simple bat capable entre autres d'individualiser certaines configurations via des variables d'environnement (on ignore pour la présentation les problèmes de persistance et de gestion des évènements qui nécessitent plutôt des scripts py ou vbs)

Trois étapes sont effectuées, une première (tag "devcommon.01") avec configuration de settings gérant un niveau de debug; pour la présentation un bug intervient, retour via log/blame avant cette étape sur un commit où tout marchait bien. Pierre s'aperçoit d'un effet de bord sur la variable du path d'un autre script utile à la configuration, la correction est effectuée par Jacques qui a défini une branche pour les tests.

Sophie travaille sur la mise en conformité des librairies entre les tags "devassist.00/01" (KleW\Lib\Js\tabs) avec les recommandations en terme d'accessibilité. En particulier sur l'affichage de pages web avec une taille de fontes devant rester au-dessus d'un certain niveau et le respect de la possibilité de lancer les pages sans nécessiter obligatoirement le javascript qui parfois interfère avec des dispositifs d'aide. Ce développement peut s'intégrer tout à fait aux librairies communes. Dans notre présentation, il s'agit de deux branches bien distinctes avec une gestion parfaite de la fusion par Git. On reproduit tout de même une illustration de la gestion de conflit sur un fichier accessoire (tag "devcommon.02"), la vérification de la version 2 s'effectue avec "index.html".

=================================================================
tabs
====
No Script - Test de recommandation W3C

branche devassist

Assure la compliance du code de la librairie selon les guidelines d'accessibilité dans le développement (W3C Recommendations "Web Content Accessibility Guidelines: 2.3 et 6":
	Checkpoint 3.4, priorité 2:
		utilisation des unités relatives ainsi que 'em' pour les offsets de positionnement
	Checkpoint 2.2, priorité 2 (images), 1(text):
		codage des couleurs par code numérique de préférence au nom générique en particulier dans le css
	Checkpoints 1.1 et 6.2, priorité 1:
		Mise en œuvre de l'élément NOSCRIPT
Ce test unitaire démontre la possibilité de mettre en œuvre des onglets en utilisant une technique basée sur le css de préférence à l'appel par js.  
----
use:
	indiquer dans votre librairie:
		WINDEFdemoextrud\Main\Lib\Js\tabs
	exemple d'utilisation sous:
		WINDEFdemoextrud\Main\Lib\Js\tabs\index.html
----
Contact:
N'hésitez pas à me contacter pour des renseignements sur ces guidelines et la norme 5508:
ptt.pro@laposte.net
==================================================================
klew
====
branche devcommon

Utilisation de Git afin de gérer les spécificités d'un poste de travail (ex. présence de devices d'accessibilité, configurations d'IHM ..) appelé lors du boot. Cet utilitaire nous permet d'utilser des applicatifs comme la présentation "tabs" ci-dessus.
use:
Copie de l'arborescence WINDEFdemoextrud sur le disque de démarrage:
%BOOT_DRIVE%\KleW
Appel lors du démarrage de Windows du fichier bat:
%BOOT_DRIVE%\KleW\Main\Env\Script\Profil\profilstatic.bat



