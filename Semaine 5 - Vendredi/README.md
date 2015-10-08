EDM4610 - Semaine 5 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 9 octobre 2015.

## Plan du cours

AM :

- Survol des ateliers
- Capsule de la semaine dernière (analyse d'un projet avec une approche orientée objet)
- Retour sur les propriétés de classes (utilisation des classes) et les fonctions (l'ordre des paramètres)
- Sin et Cos
- Héritage des classes

PM :

- Atelier

## Concepts

### 1 - sin et cos (oscillation)

Ces deux fonctions servent à animer des objets d'une manière «organique». Ce sont les fonctions de base pour tout mouvement qui se rapproche de la nature.

**sin**

![image](http://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Sinus.svg/400px-Sinus.svg.png)

**cos**

![image](http://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Cosinus.svg/400px-Cosinus.svg.png)

Comme ces deux fonnctions retournent une valeur entre -1 et 1, il est très facile de les faire osciller sur une distance fixe, en les mutlipliant simplement par la valeur désirée.

```
float posX = sin(frameCount/30.0)*100 + 100;
rect(posX, 100,100,100);
```

**À remarquer :** L'utilisation de `30.0` plutôt que `30`. Cela force la division à se faire avec des virgules, et donc de conserver les décimales.

En combinant *sin* et *cos*, nous pouvons déplacer un objet autour d'un cercle.

```
float posX = sin(frameCount/30.0)*100 + 100;
float posY = cos(frameCount/30.0)*100 + 100;
rect(posX, posY,100,100);
```

Ma page préférée sur wikipédia : [http://fr.wikipedia.org/wiki/Fonction_trigonom%C3%A9trique](http://fr.wikipedia.org/wiki/Fonction_trigonom%C3%A9trique)

L'intérêt de `sin` et `cos` réside dans : 

- la fluidité de leurs mouvements
- la valeur de retour qui est dite *normalisée*, c'est-à-dire entre **-1 et 1**



![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/sin.gif)

Plus de détails ici : [http://wiki.t-o-f.info/Processing/Oscillation](http://wiki.t-o-f.info/Processing/Oscillation)


### 2 - sin et cos (cercle et sphere)

En utilisant sin et cos simultanément, il est possible de simuler des comportements circulaires.

En effet, sin et cos ont s'opèrent sur la même distance (`TWO_PI`) : il complètent un cycle complet entre 0 et 6,2832. 

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cos-sin.png)

En associant `sin` à la position X d'un objet et `cos` à sa position Y, nous povons voir que les deux fonctions mathématiques ne sont pas synchronisées aléatoirement :

```
float radius = 100;
float x = (oscillationSin *radius / 2) + width/2;
float y = (oscillationCos * radius / 2) + height/2;

noStroke();
fill(255);
ellipse(sin(life) * radius + (width/2), cos(life) * radius + (width/2), 10, 10) ;
```

Résultat :

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/cos-sin-circle.gif)

C'est tout à fait logique, puis	que `sin` et `cos` tirent leur source dans la trigonométrie et sont basés sur PI, mesure de base de la trigonométrie.

En 3D, cela est aussi un concept très utilisé, entre autre pour disposer des points ou des éléments autour d'une sphère. Car une façon d'aborder la sphère est de la concevoir comme plusieurs cercles (ou anneaux) de différentes tailles organisées autour d'un demi-cercle.

![image](https://dl.dropboxusercontent.com/u/1052827/EDM4600/sphere.png)


### Exemple

Un bel exemple de l'utilisation 
http://lightgraffiti.littlesun.com/


## Atelier

- Créer un système d'objet organisés en **tableaux** et en **classes**.
- Les éléments du système doivent s'organiser autour de certaines **règles perceptibles**.
- Un certain **esthétisme** dans l'apparence et/ou dans le comportement doit être présent.
- Utiliser **sin et/ou cos** pour disposer des éléments et/ou créer des oscillations organiques.

Pour ceux qui souhaite davantage de directions : créer un **vortex/trou noir/spirale** d'éléments. Les éléments si enfoncet sans cesse.