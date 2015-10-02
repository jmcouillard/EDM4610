EDM4610 - Semaine 4 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 2 octobre 2015.

## Plan du cours

- Retour 
- Concepts : les objets
- Concepts : les tableaux
- Exemple ensemble
- Atelier
- Retour sur GIT (retour sur SourceTree, comment utiliser git sans SourceTree).
- Analyse de projets avec une perspective de classes

## Concepts

### 1 - Tableau

Il arrive très souvent qu'une même action doit être appliquée à plusieurs variables. Pour traiter ces variables en lots (*batch)*, nous devons les stocker dans une sorte de liste. Nous faisons alors appel à des **tableaux** (*arrays*).

Un tableau est simplement une liste de variables auquel nous avons attribuer un numéro d'identification, plutôt qu'un nom.

Tout comme pour les variables, il faut déclarer un tableau en lui donnant un nom et un type. Nous devons aussi déterminer combien d'éléments conitennent ce tableau


#### Déclaration

Pour créer un tableau contenant 10 variables de nombres à virgule (*float*), il faut utiliser le code suivant:

```
float[] monTableau1 = new float[10] ;
```

De la même manière, pour créer un tableau contenant 100 variables de nombres entiers (*int*), il faut utiliser le code suivant:

```
int[] monTableau1 = new int[100] ;
```

#### Attribuer des valeurs

Reprenons l'exemple du tableaux de 10 variables de nombres à virgule (*float*).

```
float[] monTableau1 = new float[10] ;
```

Les 10 variables contenues dans ce tableau sont numérotées de 0 à 9. Pour changer la valeur d'une variable, on utilise la même méthode qu'avec les variables, en identifiant quel entrée du tableau nous voulons modifier à l'aide de l'index (dans ce cas ci, 0 à 9) :

```
monTableau1[2] = 35;
monTableau1[4] = 55;
```

### 2 - Tableau et boucles

Ce code répéte la même action à trois reprises, comptant de 0 à 2 dans la console :

```
for(int i=0; i<3; i++) {
	println("Je compte " + i);
}
```

*Pourquoi 0 à 2 (plutôt que 1 à 3)?* : nous utilisons presque toujours des *0-based index*, c'est-à dire des index où l'élément 0 existe. Cela facilite certaines opérations et optimise le code. Les tableaux ont aussi un index basé sur zéro (*zero-based*).

Les boucles sont donc parfaites pour appliquer des opérations à tous les éléments d'un tableau simplement. On utilise la valeur de i pour changer l'index du tableau :

```
int[] monTableau = new int[100] ;


for(int i=0; i<100; i++) {
	monTableau[i] = 15;
	println("L'index " + i + " a la valeur " + monTableau[i] + ".");
}
```

Dans l'exemple ci-dessus, les 100 entiers (*int*) qui sont inclus dans le tableaux (index 0 à 99 inclusivement) ont maintenant la valeur de 15.

On peut aussi utiliser l'incrementation plutôt que l'attribuation :

```
int[] monTableau = new int[100] ;


for(int i=0; i<100; i++) {
	if(i < 50) {
		monTableau[i] += 1;
	} else {
		monTableau[i] += 2;
	}
	
	println("L'index " + i + " a la valeur " + monTableau[i] + ".");
}
```


Dans l'exemple ci-dessus, les 50 premiers entiers (*int*) qui sont inclus dans le tableaux (index 0 à 49 inclusivement) ont été augmentés de 1 et les 50 entiers suivants (index 50 à 99 inclusivement) ont été augmentés de 2.


### 3 - Tableau d'objets

Là où la magie s'opère, c'est lorsque nous combinons les objets et les tableaux. Nous pouvons donc répéter des opérations sur une multitude d'instances de classes en quelques lignes. Les objets s'animent et « vivent » avec moins d'effort.

Prenons par exemple une classe simple :

```
class Cercle {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float size = 10;
  color c = color(50);

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Cercle() {
    size = random(5, 20);
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void display() {

    ellipseMode(CENTER);
    fill(c);
    noStroke();

    // Desssiner 
    ellipse(x, y, size + 10, size + 10);
  }
}
```

Il est possible de créer facilement et rapidement une multitude d'instances de cette classe et de les animer en quelques lignes :


```
int cerclesCount = 100;
Cercle[] cercles = new Cercle[cerclesCount];

void setup() {
  size(960, 540);

  // Création d'une instance de Cercle
  for (int i = 0; i < cerclesCount; i++) {
    cercles[i] = new Cercle();
    cercles[i].x = random(0, width);
    cercles[i].y = random(0, height);
  }
}

void draw() {

  // Effacer l'image
  background(155);
  
  // Dessin des cercle
  for (int i = 0; i < cerclesCount; i++) {
    cercles[i].display();
  }
}
```

Des exemples plus concrets sont disponibles dans le dossier du cours.


### 4 - Les matrices de transformation

Les transformations modifient la localisation des éléments dessinés. L'ordre des transformations est très important.

L'utilisation des matrices de transformation se fait en 3 étapes.

1. Nous déclarons une matrice en utilisant `pushMatrix()`.
2. Nous appliquons des transformations `rotate`, `translate`, `scale`, etc.
3. Nous terminons la matrice en utilisant `popMatrix()`. 

Les matrices peuvent aussi être imbriqués.

Tout est dit ici : [http://wiki.t-o-f.info/Processing/Transformation](http://wiki.t-o-f.info/Processing/Transformation)




## Atelier

- Créer un système "vivant" en utilisant au moins deux classes et plusieurs instances de chacune d'elle.
- Utiliser une approche graphique au choix (formes avec une approche esthétique, typographie, utilisation d'images).
- Utiliser les matrices de transformation pour positionner les objets.
- Porter une attention particulière à faire varier l'apparence et les comportements des éléments de manière à créer une "individualité" à travers les objets. Bien q- e ce soit tous des instances des mêmes classes, ils méritent leur personnalité propre !

### Inspirations

- [http://www.creativeapplications.net/news/private-i-ldf-2015/](http://www.creativeapplications.net/news/private-i-ldf-2015/)
- [http://www.creativeapplications.net/javascript-2/novoline-7/
](http://www.creativeapplications.net/javascript-2/novoline-7/)
- [http://www.creativeapplications.net/i-os/deko-generative-wallpapers-for-ios/
](http://www.creativeapplications.net/i-os/deko-generative-wallpapers-for-ios/)
- [http://www.creativeapplications.net/vvvv/cycles-720-hybrid-visualaudio-sequencer-by-craig-allan/](http://www.creativeapplications.net/vvvv/cycles-720-hybrid-visualaudio-sequencer-by-craig-allan/)