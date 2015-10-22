EDM4610 - Semaine 7 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 23 octobre 2015.

##  Plan

- Retour musicien
- Voir ce que JF a fait au dernier cours
- Exploreation TouchOSC + Réception
- Démonstration

## Concepts

### 1 - Événements et communications

Afin de faire communiquer et interagir les éléments de différents programmes sur un ou plusieurs  ordinateurs, on utilise l'envoi et la réception d'évenements.

Les événements circulent entre deux programmes sur un canal, habitullement de type TCP/UDP :

- TCP : Envoi de données par paquet, ce qui permet d'être certain de la réception d'un message
- UDP : Envoie de donées en flux, où l'ordinateur récepteur *attrape ce qu'il veut*, et où l'ordinateur emetteur ne confirme pas la réception des messages.

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cours11%20-%20schema.jpg)

Les messages sont envoyées sur des ports. C'est à dire que sur un même ordinateurs, il y a plusieurs ports d'ouverts, pour séparer les données et les diriger vers les bons programmes. Un port est identifié par un nombre; on pourrait les voir comme des *gates* dans un terminal de bus. Certains ports sont réservés :

- 21 : transfert de fichiers FTP
- 80 : l'internet
- 993 : courriels sécurisés 
- [Et plusieurs autres...](http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

### 2- Introduction à OSC

OSC est une type de message standardisé. C'est à dire que tous les messages OSC ont une forme commune :

- une adresse
- une ou des valeurs

Concrètement, un message OSC ressemble à ceci :

```
monAdresse 255.0 
```

Un message peut aussi contenir plusieurs valeurs. Un exemple plus concret serait l'envoie d'un message qui contient une couleur de fond :

```
background 127.0 90.0 100.0
```

De la même manière, un message peut contenir une adresse plus complexe :

```
monAdresse/monAdresse/monAdresse 255.0 
```

L'adresse sert à quoi attribuer la ou les valeurs envoyées. L'adresse est donc paramétrable selon les besoins spécifique d'un programme.

Les messages OSC n'ont pas de port obligatoire, ils peuvent être envoyés sur n'importe quel port. Toutefois, nous allons prendre l'habitude d'utiliser le port 12345.

### 3 - Réseautage

#### Adresse IP

C'est un façon d'identifier un ordinateur sur un réseau. Il y a l'adresse ip externe, utilisée pour accéder à Internet ([voir Google](https://www.google.ca/search?hl=en&safe=off&q=what+is+my+ip)) et l'adresse interne, utilisée pour identifier un périphérique à l'intérieur d'un réseau à plus petite échellet (un router).

#### Localhost ou 121.0.0.1

C'est une adresse IP utilisé pour s'identifier "soi-même". Souvent utilisé pour envoyer des messages d'un programme à l'autre sur le même ordinateur.


### 3 - Utilisation des libraries

Pour utiliser OSC (comme pour bien d'autres fonctionnalités *communes*), le plus simple et le plus efficace est d'utiliser des librairies qui facilitent la connexion entre ces messages et votre environnement de programmation (en l'occurence, Processing). Pour utiliser une librairies :

1. Dans Processing, ouvrir le menu **Sketch->Import library** et cliquer sur **Add library**.
2. Sélectionner **oscP5** et cliquer sur installer.
3. Pour utiliser la librairie dans un nouveau sketch, il suffit de l'*importer* en utilisant la commande `import oscP5.*`, ou en utilisant le menu Sketch->Import->*nom de la librairie*


### 4 - Exemples concrets

- Un ordinateur de détection qui envoie ses données à un ordinateur de génération visuelle.
- Synchronisations de ligne du temps sur plusieurs ordinateurs dans un spectacle (triggers pour une chanson, couleurs de la scène).
- Contrôle d'application avec [TouchOSC](http://hexler.net/software/touchosc)


## Atelier

- Créer un sketch d'envoi de données qui utilise une des source de données suivante : 
	- Clavier et souris
	- Camera ou video ([référence](https://processing.org/reference/libraries/video/index.html))
	- Microphone ou fichier audio ([référence](https
			://processing.org/reference/libraries/sound/index.html))
	- Une interface externe (clavier MIDI, etc.)
- Créer un scketch qui reçoit ces données et réagit à ces données en utilisant :
	- Un approche graphique de votre choix (formes, images ou vidéos)
	- Une palette graphique cohérente
	- Des PVector pour enregistrer les positions
	- Une approche orientée objet (OOP)
	

Proposition d'idée : utiliser comme base l'exemple qui vient avec la librairie **Video** nommée *Frame Differencing* pour analyser la vidéo d'une webcam. Envoyer ce video au deuxième sketch pour réagir aux données.