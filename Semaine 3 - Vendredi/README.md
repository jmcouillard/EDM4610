EDM4610 - Semaine 3 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 24 septembre 2015.

## Plan du cours

- Dépôt du travail
- Proposition musicale
- Retour sur les fonctions, boucles itératives, conditions et variables
- Retour sur l'atelier
- Classes et POO : concepts de base
- Fonctions et valeurs de retour
- Classes et POO : applications
- Atelier (de 14h à 16h15)
- Capsule - Systèmes de versionnage et de travail en équipe (16h15 à 17h)
	
## Concepts

### 1 - OOP

La programmation orientée objet (*Object-Oriented Programming*) est une approche de programmation qui regroupe des variables et des fonctions afin de créer des classes, que l'on peut voir comme des *objets*.

Une classe est une structure de données, qui n'existe pas vraiment jusqu'à ce que nous en créions une **instance**.

Il peut y avoir plusieurs instances d'une même classe (d'où tout l'intérêt des classes!!!).

L'exemple le plus banal, et le plus utile, est celui d'une classe de boutton. Un boutton de base est composé des éléments suivant :

- une variable de position
- une variable de taille
- une fonction d'affichage à l'écran (dessin)
- une fonction pour tester le clique

Or, la plupart des programmes contiennent plusieurs éléments interactif, que ce soit des bouttons ou non. En regroupant toutes ces éléments dans une classe, on s'assure de n'avoir à gérer cette logique qu'une seule fois, et qu'une modification dans la classe se répercute dans toutes ces instances.


### 2 - Classes

Les quatre éléments de base d'une classe:

- son nom
- ses attributs (variables)
- son constructeur (la fonction d'inialisation, appelée avec lorsque nous utilisons le mot-clé *new*)
- ses méthodes (fonctions)

Dans l'exemple suivant, nous créons une classe `Carre` qui contient la position et la couleur d'un carré, et qui permet de le dessiner facilement :

```
class Carre {

	// Définition des variables contenus dans la classe
	float x = 0.0;
	float y = 0.0;
	float s;
	color c;
	
	
	// Constructeur (appelé lorsqu'on utilise le mot-clé new)
	Carre(color _couleur, float size) {
		c = couleur;
		s = size;
	}
	
	// Fonction personnalisée, que l'on doit appeler manuellement
	void draw() {
		noStroke();
		fill(c);
		rect(x,y,s,s);
	}
	
}
```

Ensuite, nous pouvons créer des *instances* de cette classe :


```
color red = color(255,0,0);
Carre monCarre1 = new Carre(red, 20.0);
```

Comme pour n'importe quelle variable, nous définissons d'abord le type de variable (*Carre*), son nom (*monCarre1*) et lui attribuons une valeur (avec le mot-clé *new*).

Ensuite, nous pouvons appeler les fonctions ou les variables qu'il contient à l'aide du caractère `.` (point) :


```
monCarre1.x = 10.0;
monCarre1.y = 200.0;
monCarre1.draw();
```


Pour faciliter le l'organisation du code, les classes sont souvent créées dans de nouveaux onglets :

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cours10%20-%20onglets.png)

Les onglets sont simplement une façon de structurer son code. Lorsque nous lançons l'application, tous les onglets sont combinés puis compilés. En d'autres mots, que vous utilisiez des onglets ou non, l'application n'y voit aucune différence : c'est simplement pour simplifier la lecture de  votre code.

D'autres exemples de classes sont disponibles ici : [http://wiki.t-o-f.info/Processing/Classe](http://wiki.t-o-f.info/Processing/Classe)


### 3 - Fonctions avec valeurs de retours

Jusqu'à maintenant, nous avons utilisé les fonctions pour modifier des valeurs et altérer des comportements. Il est aussi possible d'utiliser les fonctions pour retourner des valeurs.

Cela peut être utile pour encapsuler un calcul auquel nous faisons appel à plusieurs reprises.

Pour créer une fonction qui retourne une valeur, nous devons simplement lui indiquer le type de valeur qu'elle renvoie. Ainsi, plutôt que d'utiliser le mot-clé `void`, nous allons utiliser un mot clé qui identifie un type de variable tel que `int`, `float`, `booleand`, `color`, `String`, etc.

Par exemple, imaginons que nous voulions créer une fonction qui nous indique si la souris est cliquée pendant plus de 2 secondes :

```
long lastClick = 0;

boolean isClickLong() {
	if(millis() - lastClick > 2000 ) {
		return true;
	} else {
		return false;
	}
}


void mousePressed() {
	lastClick = millis();
}

```

La fonction `isClickLong` est notre fonction personalisée. Sa valeur de retour est un `boolean`. Nous utilisons le mot-clé `return` pour définir quelle valeur la fonction retourne. Lorsque le mot-clé `return` est utilisé, la fonction est quittée et le code qui suit n'est pas exécuté.

Voir l'exemple nommé *function_retour* pour un exemple fonctionnel.

## Atelier

- Créer au moins un classe qui sert à stocker les propriétés d'un objet et de l'afficher.
- Cette classe doit avoir une fonction qui retourne une varaible.
- Plusieurs instances de la ou des classes (objets) doivent être créés.
- Le code lié à a un objet doit être inclus dans sa classe et il doit y avoir le moins de code possible dans l'onglet pricipal.
- Il doit être possible d'interagir avec les objects avec la souris.
- L'ensemble doit être visuellement agréable.

#### Optionnel

Commencer à explorer les tableaux utiliser un tableau pour stocker les instances. Ces notions seront abordées au cours du prochain cours (mardi avec JFR).


## Capsule

Système de travail en équipe et Github.