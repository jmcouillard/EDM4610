EDM4610 - Semaine 2 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 17 septembre 2015.

## Concepts

### 1 - Les fonctions 

Une fonction se définie en trois parties (dans l'ordre) :

- Un type de valeur de retour (*void* lorsqu'il n'y en a pas)
- Un nom de fonction
- Des arguments, entre parenthèses, si nécessaire

```
void drawBlackCircle() {	fill(0);	ellipse(50,50,20,20);}```

À titre d'exemple, `setup()` and `draw()` sont deux fonction sans type de valeur de retour (soit `void`) et sans argument.Pour ajouter des arguements, il suffit de les inclure avec leur types entre les parenthèses.
```
void drawColoredCircle(int red, int green, int blue) {	fill(red, green, blue);	ellipse(50,50,20,20);}```Les valeurs de `red`, `green` et `blue` sont accessibles seulement à l'intérieur de la fonction.
Ou encore mieux :
```
void drawColoredCircle(color c) {	fill(color);	ellipse(50,50,20,20);}```


Plus d'informations ici : [http://wiki.t-o-f.info/Processing/Fonction](http://wiki.t-o-f.info/Processing/Fonction)

## Atelier

À voir.