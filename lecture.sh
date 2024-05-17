# On récupère puis installe les packets suivants grâce à l'outils Advanced Package Tool avec comme option -Y qui répond oui aux questions posées ultérieurement.
# mplayer: lecteur audio, alsa: ensemble de programmes pour jouer des sons (incorporé dans le noyau linux), mpg123: codec permettant de lire des fichiers mp3).
sudo apt-get -y install mplayer mplayer-gui alsa-base alsa-utils pulseaudio mpg123
# chargement du module snd_bcm2835
sudo modprobe snd_bcm2835
# ajout de la ligne snd_bcm2835 à la fin des modules à charger dans le noyau au démarrage
sudo echo 'snd_bcm2835' >> /etc/modules

# amixer : interface de ligne de commande permettant de controler une carte son, au niveau de la couche ALSA.
# configuration de la sortie audio sur un, le cable jack
amixer cset numid=3 1
# sélection de la carte son 1 (bcm2835 Headphones)
alsamixer -c 1
# réglage de la valeur défaut du mélangeur à 95% du son maximum
amixer sset "Master",0 95%
# lecture du mp3
mplayer /home/pi/Adeept_modifié/server/sounds/bruit-de-demarrage-voiture-2s.mp3

#En cas d'interférences avec le module snd_bcm2835 ou d'autres problèmes : 
sudo apt-get -y --purge remove pulseaudio
#suppression du packet pulseaudio et purge des fichiers crées par ce dernier
