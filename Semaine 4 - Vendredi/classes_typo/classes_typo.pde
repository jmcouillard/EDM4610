/*
 Exemple d'utilisation de tableau d'objets.
 Affichage d'un nuage de lettre
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

int gridSize = 10;
int lettersCount = 450;
Letter letters[] = new Letter[lettersCount];

PFont font;

void setup() {
  size(960, 540, P3D);

  // Créer la police de caractères (l'utilisation de vlw est plus performante)
  //font = createFont("GandhiSerif-Bold.otf", 32);
  font = loadFont("Serif-48.vlw");
  textFont(font);

  // Création d'une instance de Cercle
  for (int i = 0; i < 30; i++) {
    for (int j = 0; j < 15; j++) {
      int index =  i + (j*30);
      letters[index] = new Letter();
      letters[index].x = (i * 30) + 100;
      letters[index].y = (j * 30)+ 60;

      // Ajuster la  couleur en fonction de la distance avec le centre du sketch
      float distance = letters[index].distanceFromCenter();
      letters[index].c = color(405 - distance);
    }
  }
}

void draw() {

  // Effacer l'image
  background(0);

  // Dessin des cercle
  for (int i = 0; i < lettersCount; i++) {
    letters[i].display();
  }
}