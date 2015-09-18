EDM4610 - Semaine 2 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 17 septembre 2015.

## Plan du cours

- Remise des travaux
- Retour sur les variables et les types
- Répondre aux questions sur les pixels
- Nouveaux concepts :
	- Functions (créer ses propores fonctions et celles disponibles dans Processing)
	- Boucle itérarive
	- Modulo
	- Conditions
	- Interactions (*keyPressed*, *mousePressed*, etc.)
- Atelier
- 
	
## Concepts

### 1 - Les fonctions 

Une fonction est un bloc de code que nous pouvons répéter en l'appelant par son nom.

Nous avons déjà utilisé plusieurs fonctions qui s'offrent à nous de base dans Processing :

- `void setup()`
- `void draw()`
- `void mouseMoved()`
- `void keyPressed()`

À titre d'exemple, `setup()` and `draw()` sont deux fonction sans type de valeur de retour (soit `void`) et sans argument.
Mais nous pouvons aussi définir nos propres fonctions. Imaginons que nous voulions dessiner plusieurs pièces de dominos.

```
void draw() {
  noStroke();
  fill(255);
  rect(0, 0, 100, 50);
  fill(0);
  ellipse(25, 25, 20, 20);
  ellipse(75, 25, 20, 20);
}
```

Cela semble logique... pour un seul domino. Mais imaginons que nous en voulions une dizaine... cela ferait beaucoup de code répété qui se ressemble étonnemment.

Voilà pourquoi nous créeons des fonctions : éviter de se répéter.

Pour arriver à dessiner plusieurs dominos simplement, nous allons créer une fonction. Une fonction est déclarée de la manière suivante :

```
void maFonction(int params1, int params2, etc..) {
	// Mon code
}
```

Une fonction se définie en trois parties (dans l'ordre) :

- Un type de valeur de retour (*void* lorsqu'il n'y en a pas)
- Un nom de fonction (maFonction)
- Des arguments, entre parenthèses, si nécessaire (int params1, int params2)

`void` est la valeur de retour de la fontion (dans ce cas ci, rien), `maFonction` est le nom de la fonction et, entre les parenthèses, sont les arguments (variables) que nous devons fournir afin que la fonction s'exécute correctement. Les argument sont facultatifs.

Voici une fonction qui dessine le domino  :

```
void draw() {
	background(127);
	drawDomino();
}

void drawDomino() {
  noStroke();
  fill(255);
  rect(0, 0, 100, 50);
  fill(0);
  ellipse(25, 25, 20, 20);
  ellipse(75, 25, 20, 20);
}
```

Bien que le code soit lisible, tout ceci semble bien inutile... mais ce qui est magique, c'est que nous pouvons exécuter la foncton `drawDomino()` plusieurs fois :

```
void draw() {
	background(127);
	drawDomino();
	drawDomino();
	drawDomino();
}
```

Dans ce cas, le domino est dessiné plusieurs fois, mais toujours au même endroit. C'est à ce moment que nous pouvons ajouter des arguments à notre fonction.

```
void draw() {
	background(127);
	drawDomino(0,0);
	drawDomino(200,100);
	drawDomino(50, 300);
}

void drawDomino(int x, int y) {
  noStroke();
  fill(255);
  rect(0+x, 0+y, 100, 50);
  fill(0);
  ellipse(25+x, 25+y, 20, 20);
  ellipse(75+x, 25+y, 20, 20);
}
```

À chacune des exécution de la fonction `drawDomino()`, les valeurs de `x` et de `y` sont remplacés par celles qui sont passées dans les parenthèses de l'appel. Ainsi:

- à la première exécution `x=0` et `y=0`
- à la deuxième `x=200` et `y=110`
- à la troisième `x=50` et `y=300`.



### 2 - Les boucles

Le boucles peuvent être utiliser pour répéter une opération un certain nombre de fois.

#### Boucle *for*

Ce code répéte la même action à trois reprises, comptant de 0 à 2 dans la console :

```
for(int i=0; i<3; i++) {
	println("Je compte " + i);
}
```
En regardant l'exemple ci-dessus, on peut voir que 3 éléments séparés par des ";" consituent la boucle :

- **initialisation** : Ici, une variable est déclarée et initialisée avec une valeur. Elle sera utilisé dans la boucle for à titre de compteur.
- **condition** :  condition qui est vérifiée avant chaque exécution de la boucle. La boucle ne s'exécute que si la condition est évaluée true
- **incrementation** : instruction a effectuer après chaque exécution de la boucle qui avec la condition, limite le nombre de répétitions de la boucle.

*Pourquoi 0 à 2 (plutôt que 1 à 3)?* : nous utilisons presque toujours des *0-based index*, c'est-à dire des index où l'élément 0 existe. Cela facilite certaines opérations et optimise le code.

#### Boucle *while*

Le boucle *while* s'éxecute  sans cesse, jusqu'à ce que la condition ne soit plus remplie. À l'opposé de *for*, il faut s'occuper soi même de déclarer et d'incrémenter les variables.

```
int x =0; // initialisation
while ( x < width ) { // condition
	line(x,0,x,height); // bloc de code
	x = x + 3; // incrementation
}
```

Plus d'informations : [http://wiki.t-o-f.info/Processing/Boucle](http://wiki.t-o-f.info/Processing/Boucle)

### 3 - Modulo

Calcule les *restes* d'une division. Par exemple :

```
3%1 = 1
6%3 = 0
7%3 = 1
8%3 = 2
```

La plupart du temps, on utilise le modulo avec une boucle `for` pour créer une boucle qui revient toujours à la case départ puisque les résultats du modulo sont régulier :

```
0%3 = 0
1%3 = 1
2%3 = 2
3%3 = 0
4%3 = 1
5%3 = 2
6%3 = 0
```

Par exemple, nous pouvon facilement faire une boucle qui compte plusieurs fois de 0 à 2 : 

```
for(int i = 0; i<30; i++) {
   int x = i%3;
}
```

Cela peut être utilisé pour créer des grilles :

```
for(int i = 0; i<30; i++) {
   int x = i%3;
   int y = floor(i/3);
}
```


Pour plus d'infromations : [https://processing.org/reference/modulo.html](https://processing.org/reference/modulo.html)


### 4 - Conditions

L'instruction conditionnelle if() teste la condition placée entre parenthèses et dirige le flux du code selon le résultat.

#### if

```
if( condition ) {
	// Mon action si la condition est remplie
}
```

#### if / else

```
if( condition ) {
	// Mon action si la condition est remplie
} else {
	// Mon action si la condition n'est PAS remplie
}
```

Une condition est souvent une comparaison :

- d'égalité (==)
- de non égalité (!=)
- plus grand que (>)
- plus grand ou égal (>=)
- plus petit que (<)
- plus petit ou égal (<=)

#### Combiner les conditions

Il est possible de combiner plusieurs conditions, et de n'exécuter le code que si ces conditions son partiellement ou toutes remplies.

Les opérataeurs sont les suivants :

- ET (&&)
- OU (||)


```
if( condition ) {
	// Mon action si la condition est remplie
} else {
	// Mon action si la condition n'est PAS remplie
}
```

#### Négation

Le signe`!` est le symbole de négation dans les condtions.

```
if( i != 2 ) {
	// Mon action si i n'est pas égal à 2
} else {
	// Mon action si i est égal à 2
}
```

Dans une combinaison de conditions, la négation peut-ètre utilisé de la manière suivante :

```
if( i > 50  && (i != 55) ) {
	// Mon action si i est plus grand que 50 et n'est pas égal à 5
} else {
	// Mon action dans le cas contraire
}
```

Plus d'information ici : [http://wiki.t-o-f.info/Processing/Condition](http://wiki.t-o-f.info/Processing/Condition)


### 5 - Interaction avec la souris

L'interaction avec la souris se fait à l'aide de 3 variables :

- variable `mouseX`
- variable `mouseY`
- variable `mousePressed`

Et de 3 fonctions :

- fonction `mousePressed()`
- fonction `mouseReleased()`
- fonction `mouseMoved()`

Les variables sont accessibles partout dans le code.

Les fonctions s'utilisent un peu comme `setup()` et `draw()` : 

```
void mouseMoved() {
	// Mes actions ici
}
```

Voir les notions d'événements pour mieux comprendre les fonctions.

#### Zone interactive

Pour créer une zone interactive, il suffit de combiner les fonctions et les variables précédentes avec des conditions appropriées.

```
if ( pointX > gauche && pointX < droite && pointY > haut && pointY < bas ) {
	// le point est dans le rectangle
} else {
	// le point n'est pas dans le rectangle
}
```

Plus d'information ici : [http://wiki.t-o-f.info/Processing/ZoneInteractive](http://wiki.t-o-f.info/Processing/ZoneInteractive)

### 6 - Interaction avec le clavier

L'interaction avec la souris se fait principalement à l'aide d'une variable :

- variable `keyCode`

Et de 2 fonctions :

- fonction `keyPressed()`
- fonction `keyReleased()`

Les fonctions s'utilisent un peu comme `setup()` et `draw()`, et on y ajoute la plupart du temps une condition, pour déterminer la touche pressée : 

```
void keyPressed() {
	println(keyCode);
	if(keyCode == 32) {
		// Mes actions ici
	}
}
```


## Atelier

Créer un système qui réagit à la position de la souris lorsque celle-ci est cliqué.

Utiliser une ou plusieurs fonctions pour dessiner les éléments récurrents.

Utiliser une ou plusieurs boucles itératives pour dessiner plusieurs copies du même élément.

Permettre que plusieurs éléments déclenché puissent cohabiter en même temps.

Utiliser des conditions pour créer des variations de cet élément.