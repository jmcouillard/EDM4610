EDM4610 - Semaine 1 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 10 septembre 2015.

## Concepts

### 1 - Utiliser la documentation

Les mots colorés sont des **mot-clés** (*reserved keywords*). Ces mots sont soit des mots reliés au langage, et qui ne peuvent pas être utilisés. Apprenez à cibler ces mots dans les exemples, et recherchez les dans la [documentation en ligne](http://processing.org/reference/).

Dans l'exemple *Basic/Brightness*, vous pouvez par exemple cibler ces **mots-clé** :

- *mouseX*
- *mouseY*
- *fill*
- *rect*

En vous rendant dans la [documentation en ligne](http://processing.org/reference/), recherchez ces **mots-clés** (CTRL+F / CMD+F) :

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cours1%20-%20documentation.png)

En cliquant sur le **mot-clé**, vous accédez à la définition de ce mot:

> Draws a rectangle to the screen. A rectangle is a four-sided shape with every angle at ninety degrees. By default, the first two parameters set the location of the upper-left corner, the third sets the width, and the fourth sets the height. The way these parameters are interpreted, however, may be changed with the rectMode() function.


Source : [http://processing.org/reference/rect_.html](http://processing.org/reference/rect_.html)

### 2 - Structure

### Le sketch

Un projet créé dans Processing s'appelle un sketch.

Lorsque vous créez un nouveau sketch, il convient de prendre l'habitude de respecter la structure de dossier suivante :

- Un dossier portant le nom du projet. À l'intérieur de ce projet se trouve:
	- Un fichier texte ".pde" qui contient le code et qui porte le même nom que le dossier,
	- Un dossier `data` qui contient tous les médias utilisés par le sketch.
	- Un dossier `code` qui contient tous les fichiers .jar des librairies utilisées.

Source : [http://wiki.t-o-f.info/Processing/Introduction](http://wiki.t-o-f.info/Processing/Introduction)

### Le sketchbook

Le sketchbook est un dossier spécial (créé par Processing s'il n'existe pas déjà) dans lequel, par défaut, les sketchs sont sauvegardés. Par défaut, il s'agit d'un dossier nommé `Processing` dans le dossier `Documents`. Il peut être modifié pour n'importe quel autre dossier à partir de l'item `Preferences` du menu `File`.

Source : [http://wiki.t-o-f.info/Processing/Introduction](http://wiki.t-o-f.info/Processing/Introduction)


### 3 - Coquille de base

Le modèle de base de tout *sketch* Processing:


```
void setup() {

  // La taille de la fenetre.
  size(600, 600);

  // Le nombre d'images par seconde.
  frameRate(30); 
}

void draw() {

  // Remplir l'arriere-plan d'une teinte de gris.
  background(127);
}
```

Les lignes qui débutent par «//» sont des **commentaires**, c'est-à-dire des  

**setup()** et **draw()** sont deux fonctions spéciales:

- Le bloc de code encapsulé par la fonction **setup()** ne s'exécute qu'une seule fois au démarrage du programme;
- Le bloc **draw()** est répété jusqu'à la terminaison du programme.
 
### 4 - Les coordonnées

Un point deux-dimensionnel (2D) est composé d'une valeur x et y.

En programmation, le point supérieur gauche est toujours à (0,0), c'est-à-dire que sa valeur X est 0 et sa valeur Y est zéro.

![](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cours2%20-%20coord.jpg)

La valeur de X augmente lorsque nous allons vers la gauche, et la valeur de Y augmente lorsque nous allons vers le bas.

### 5 - Les formes

La façon la plus simple d'interagir avec un programme, c'est de lui demander d'afficher un élément graphique.

Utilisez les fonctions décrites ici pour dessiner des formes :

- [point(x,y)](http://processing.org/reference/point_.html)
- [line(x1,y1,x2,y2)](http://processing.org/reference/line_.html)
- [rect(x,y,largeur,hauteur)](http://processing.org/reference/rect_.html)
- [triangle(x1,y1,x2,y2,x3,y3)](http://processing.org/reference/triangle_.html)
- [quad(x1,y1,x2,y2,x3,y3,x4,y4)](http://processing.org/reference/quad_.html)
- [ellipse(x,y,largeur,hauteur)](http://processing.org/reference/ellipse_.html)
- [arc(x,y,largeur,hauteur,début,fin)](http://processing.org/reference/arc_.html)
- [beginShape()](http://processing.org/reference/beginShape_.html) / [endShape()](http://processing.org/reference/endShape_.html) / [vertex(x, y)](http://processing.org/reference/vertex_.html)

Plus d'informations ici : [http://wiki.t-o-f.info/Processing/Formes](http://wiki.t-o-f.info/Processing/Formes)

### 6 - Les couleurs

La plupart du temps, nous utilisons la notation de couleur RGB, c'est-à-dire que les valeurs qui se succèdent sont la quantité de ROUGE, de VERT, puis de BLEU.

Les valeurs de couleurs sont comprises entre 0 et 255, soit un total de 256 possibilités par couleur.

Avec Processing, il faut définir la couleur d'un élément avec les fonctions *fill()* et *stroke()*.

```
fill(255, 0, 0);
stroke(0, 0, 255);
rect(30, 20, 55, 55);
```

Toutes les formes qui suivront prendront alors ces couleurs.

Nous pouvons enregistrer la valeur d'une couleur dans une variable (voir la section 6)


```
// Définir une variable 'c' de type 'color'
color c; 

// Attibuer une valeur à 'c'
c = color(50, 55, 100);

// Dessiner un carré avec la valeur de 'c' comme couleur de remplissage
fill(c);
rect(30, 20, 55, 55);

```

Plus d'informations ici : [http://wiki.t-o-f.info/Processing/Couleurs
](http://wiki.t-o-f.info/Processing/Couleurs) et ici [processing.org](http://processing.org/reference/fill_.html)

### 7 - La console

La console est utilisée pour afficher des messages de votre choix, on lire les messages d'erreurs retournés.

![La console](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cours2%20-%20console.png)

Vous pouvez afficher des éléments dans la console avec la fonction *println* :

```
println("Hello World");
```

### 8 - Les variables

Lorsque vous créez des variables, n'oubliez pas:

- de respecter la convention des majuscules,
- de leur donner un nom descriptif,
- et de leur associer un type approprié.

La création d'une variable se fait en deux étapes: sa déclaration et ensuite son assignation. Ces deux étapes peuvent s'effectuer simultanément. Sinon l'assignation peut être effectuée après la déclaration.

Le signe égal (=) permet d'assigner une valeur à une variable.

```
// Déclaration et assignation dans une seule ligne
int count = 50;

// Déclaration et assignation en deux temps
int count;
count = 50;
```

Source (et plus d'informations) : [http://wiki.t-o-f.info/Processing/Variable](http://wiki.t-o-f.info/Processing/Variable)

#### Les types de variables de base

- int : abbréviention de *integer*, ce sont des nombres entiers.
- float : ce sont des nombres à virgules, offrant plus de précision.
- boolean : pouvant prendre la valeur de *true* ou *false*, on les appelle binaires, 
- String : un chaîne de caractères (une lettre, un mot, un phrase, etc.)
- color : représentation d'une couleur (*Processing* seulement)

#### String 

Il faut noter que le texte en programmation est utilisé pour nommer les variables. Pour indiquer que nous parlons de la valeur d'une chaîne de caractères, nous devons la mettre entre guillemets.

```
String maVariable = "mon valeur de chaîne de caractères";
```

#### Color et int 

Fait intéressant : le type color est en fait un nombre entier (*int*) masqué.


### Portée de variable

Les variables existent seulement dans leur portée (*scope*). En d'autres mots, en dehors de leur portée, elle perde leur valeur et ne sont plus accessibles.

Vous avez sans doute pu observer cela en utilisant des boucles :

```
// la variable i n'existe PAS ici

for(int i=0; i<0; i++) {
  // la variable i existe ici
}

// la variable i n'existe PAS ici
```

Voici une image qui illustre bien la portée des variables :

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cours7%20-%20scope.jpg)

Bien que ce soit un peu simpliste de l'expliquer ainsi, on peut dire qu'une variable existe dans l'accolade `{}` qui l'inclue et celle qui y sont imbriquées, mais pas celles qui lui sont *supérieures* ou non-reliées.


### Animations de base

En utilisant les variables et les fonctions de dessins de base, nous pouvons déjà arriver à animer (discussion liée avec le groupe).

## Atelier

L'objectif de l'atelier et de créer un paysage figuratif avec les fonctions de dessin.

1. Commencer avec la coquille de base.
2. Ajouter des formes pour créer un paysage dans la fonction *draw()*.
3. Utiliser au moins trois variables : 
	1. une variable de type *Color* pour enregistrer une couleur
	2. une variable de type *int* pour enregister la position d'un élément
	3. une variable système tel que *width*, *height*, *mouseX* ou *mouseY*.
4. Sauf pour les variables de système, les valeurs des variables doivent être attribuées dans la fonction *setup()*.
5. Créer un système d'animation simple en utilisant des variables.
