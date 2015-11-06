EDM4610 - Semaine 9 - Vendredi
=======

Références, documentations et téléchargements.

Le cours a lieu le 6 novembre 2015.

## Plan du cours

- Video dans Processing
- Mini atelier sur les shaders
- Méthodes de conception et de travail
- Poursuite du projet

## Concepts

### 1 - Lecture de video (Processing)

Il est possible de faire la lecture de vidéo en utilisant Processing. La librarie est très simple d'utilisation ([voir la documentation](https://processing.org/reference/libraries/video/index.html)).

Celui-ci utilise une platforme de lecture video pour Java nommée [gstreamer](http://gstreamer.freedesktop.org/). Il est parfois nécessaire de se référer à la documentation de gstreamer pour avoir accès à plus de fonctions et connaître quels sont les codecs supportés.

#### Codecs

Comme dans tous les logiciels qui traitent des vidéos, les codecs choisis auront une très grande influcence sur les performances. Voici un aperçu de quelques codecs populaires et fréquemment utilisés :

- **H264** : Poids très léger, compression avec perte, impossibilité de contrôler la tête de lecture (car c'est un codec basé sur des *keyframes*), utilisation cosidérable du processeur CPU.
- **Photo JPG** : Poids moyen, lecture rapide des frames sans *keyframes*, perte de qualité modérée, utilisation modéré du processeur CPU.
- **HAP** : Poids lourd, lecture rapide des frames sans *keyframes*, presque pas d'utilisation processeur CPU. Toutefois, ce codec n'est disponible que pour une sélection réduite de logiciel ([https://github.com/vidvox/hap](https://github.com/vidvox/hap)) et n'est pas disponible pour Processing.


#### Exemple de base dans Processing

La lecture d'un video dans Processing est faites en quelques lignes :


```
// Variable qui contiendra la vidéo
Movie movie;

void setup() {
  // Charger le video et lecture en boucle
  movie = new Movie(this, "ink.mp4");
  movie.loop();
}

void draw() { 
  // Afficher le video
  image(movie, 0, 0, width, height);
}

void movieEvent(Movie m) {
  // Lecture du video lorsqu'un nouveau frame est disponible
  m.read();
}
```

Toutefois, question flexibilité et performance, cette technique a des limites.


### 2 - Lecture de video en mémoire pour plus de performance (Processing)

Pour avoir plus de flexibilité et de performance, il vaut mieux traiter le video comme une séquence d'images. Voici la logique derrière :

1. Création de l'object `Movie` et d'un tableau de `PImage[]`.
2. Lecture du vidéo.
3. Enregistrement de chaque frame dans le tableau de `PImage`.
4. Plutôt que d'afficher l'objet `Movie`, il suffit d'afficher un PImage du tableau en utilisant un index.

Pour voir le tout fonctionnel, référez-vous à l'exemple `video_buffered_frames`.


### 3 - Présentation de base des *shaders*

Les shaders permettent de parler directement à la carte graphique et permettent d'atteindre des performances inégalées lorsqu'il est question de temps réel (*realtime*).

Tous les logiciels de création visuelle avancés (tel que TouchDesigner) proposent d'intégrer du code GLSL ou HLSL pour créer des shaders et accéder à de meilleurs performances.

Un shader est en fait une combinaison de deux fichiers texte :

- Un fichier FRAG : pour controler la couleur de chaque pixel
- Un fichier VERT : pour contrôler la position de chaque vertex.

Dans Processing, voici ce à quoi ça peut ressembler :

**Sketch**

```
// Variable qui contient le shader
PShader myShader;

void setup() {

  // Initilisation du sketch en OpenGL (P3D)
  size(960, 540, P3D);
 
  // Chargement du shader
  myShader = loadShader("MyShaderFrag.glsl", "MyShaderVert.glsl");  
}

void draw() { 

  // Effacer le skecth actuel (reset)
  background(0);
  
  // Afficher une image
  image(img, 0, 0, width, height);
  
  // Nouvelle valeur au shader
  myShader.set("myParam", 0.75);
  
  // Applique le shader
  shader(myShader);
  
}
```

**MyShaderFrag.glsl**

C'est un fichier qui doit être situé dans le dossier `data`.

Basé sur le fichier processing/core/src/processing/opengl/shaders/TexFrag.glsl

```
uniform sampler2D texture;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform float myParam;

void main() { 
    vec4 color = texture2D(texture, vertTexCoord.st) * vertColor;
    gl_FragColor = color;
}

```

**MyShaderVert.glsl**

C'est un fichier qui doit être situé dans le dossier `data`.

Basé sur le fichier processing/core/src/processing/opengl/shaders/TexVert.glsl

```
uniform mat4 transformMatrix;
uniform mat4 texMatrix;

attribute vec4 position;
attribute vec4 color;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  gl_Position = transformMatrix * position;
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}

```

#### Quelques liens pour aller plus loin

- Bases (en anglais) : [http://gamedevelopment.tutsplus.com/tutorials/a-beginners-guide-to-coding-graphics-shaders--cms-23313](http://gamedevelopment.tutsplus.com/tutorials/a-beginners-guide-to-coding-graphics-shaders--cms-23313)
- Autre approche de base (en anglais) : [http://area.autodesk.com/blogs/chris/introduction-to-pixel-shaders-using-glsl](http://area.autodesk.com/blogs/chris/introduction-to-pixel-shaders-using-glsl)
- Éditeur en temps réel : [http://shdr.bkcore.com/](http://shdr.bkcore.com/)
- Exemples de base : [http://glslsandbox.com/](http://glslsandbox.com/)
- Exemple complet : [https://www.clicktorelease.com/blog/vertex-displacement-noise-3d-webgl-glsl-three-js](https://www.clicktorelease.com/blog/vertex-displacement-noise-3d-webgl-glsl-three-js)
