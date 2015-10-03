EDM4610 - Semaine 6 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 16 octobre 2015.

## Concepts

### 1 - Assouplissement

#### Simple, et efficace : vitesse proportionnelle pour une variable

La manière la plus simple selon moi pour assouplir une donnée. Plus la une valeur se rapproche de sa cible, plus sont déplacement sera lent.

Si vous n'aviez qu'une seule méthode d'assouplissement à vous souvenir, ce serait sans doute celle ci. Personnellement, je m'en sers 95% du temps.

```
// La position actuelle
float posX = 200;

// La position cible
float targetX = 300;

// le facteur d'assouplissement (float entre 0 et 1)
float facteur = 0.05;

void draw() {
	posX = (targetX - posX) * facteur + posX;
}
```

#### Vitesse fixe pour une variable 1D

De la même manière qu'avec l'exemple précédent, nous utilisons une position cible et une position actuelle.

La différence, c'est que nous n'utilisons pas de facteur. De plus nous utilisons la fonction `min()` qui retourne la plus petit valeur de celle que nous lui fournissons, de manière à limiter la vitesse.

Plus d'information sur la fonction `min()` [ici](http://www.processing.org/reference/min_.html).

```
// La position actuelle
float posX = 200;

// La position cible
float targetX = 300;

// le facteur d'assouplissement (float entre 0 et 1)
float vitesse = 5;

void draw() {
  float distance = abs(targetX - posX);
  
  if ( courante < cible ) {
    posX = posX + min(distance,vitesse);
  } else {
    posX = posX - min(distance,vitesse);
  }
}
```



#### Vitesse fixe pour une variable 2D

C'est l'équivalent de la méthode précédente, mais la vitesse est constante à travers 2 dimensions. L'opération se fait donc en trois temps :

- Déterminer dans quelle direction se dirige (en radians) en utilisant la fonction trigonométrique `atan2()`.
- Définir la distance à parcourir (distance entre deux points).
- Répartir cette distance sur proportionnelement sur les deux axes, de manières à ce que la vitesse soit constente.

```
float radians = atan2( yCible-y , xCible-x );
float distance = dist( xCible , yCible , x , y );

x = cos(radians) * min( vitesse , distance ) + x;
y = sin(radians) * min( vitesse , distance ) + y;
```

Plus d'informations ici : [http://wiki.t-o-f.info/Processing/Assouplissement](http://wiki.t-o-f.info/Processing/Assouplissement)


### 2 - Classes *extends* (héritage)

Nous avons vu qu'une classe était une structure qui contenait entre autres :

- des variables
- des méthodes

Toutefois, il peut arriver que plusieurs classes partagent un certains nombres de fonctionnalités. Plutôt que de récrire plusieurs fois ces éléments, nous allons indiquer à une classe qu'elle *hérite* des fonctions et de variables d'une autre classe. C'est un concept que nous appelons *héritage*.

On dit alors qu'une classe en *extend* une autre.

Il permet d'appliquer l'approche *DRY* (*don't repeat yourself*) aux classes.

Ainsi, une classe `Bouton` pourrait contenir des fonctions de base de positions, de détection de clique, d'effet de survol, alors que les classes `BoutonCircle` et `BoutonSquare` ajouteraient des fonctionnalités spécifiques à chacune des formes.

```
-> Bouton
---> BoutonCircle
---> BoutonSquare
```

De la même manière, dans un jeu plus classique, une classe `Personnage` pourrait contenir les fonctions et variables relatives aux personnages d'un jeu, alors que les classes `Ennemi` et `Hero` comporteraient les variables et fonctions relatives au personnage contrôlé par l'utilisateur et ceux simulés par l'ordinateur, tout en héritant des fonctions de la classe `Personnage` :

```
-> Personnage
---> Hero
---> Ennemi
```

Moins de code, moins d'erreurs!

Les classes peuvent hériter de plusieurs niveau de profondeur :


```
-> DisplayObject
---> Bouton
-----> BoutonCircle
-----> BoutonSquare
---> Plateforme
-----> PlateformeFixe
-----> PlateformeVerticale
```

Pour définir une nouvelle classe qui hérite d'une autre classe, nous utilisons le mot clé *extends*, suivi du nom de la classe *mère* :

```
class BoutonSquare extends Button {

  BoutonSquare() {
  }
}

```

Les classes qui *héritent* peuvent redéclarer des fonctions contenues dans la classe *mère*. C'est ce qu'on appelle *override*. Dans ce cas, c'est toujours la fonction de la classe courante qui sera appelée, plutôt que celle de la classe mère.

Le mot clé `super` permet de contrôler ce comportement, et d'appeler spécifiquement une fonction de la classe mère.


```
class BoutonSquare extends Button {

  BoutonSquare() {
    // Force l'appel au constructeur de la classe mère
    // Nécessaire si le constructeur de la classe mère nécessite des paramètres
    super(10)
  }
  
  void draw() {
    // Force l'appel à la fonction draw() de la classe Button, malgré l'override
    super.draw()
  }
}

```

### 3 - Librarie d'animatio Ani

TODO


## Atelier

À voir.