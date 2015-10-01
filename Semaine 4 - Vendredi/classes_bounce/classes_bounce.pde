/*
 Exemple d'utilisation de tableau d'objets.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

int cerclesCount = 100;
Cercle cercles[] = new Cercle[cerclesCount];

void setup() {
  size(960, 540);

  // Création d'une instance de Cercle
  for (int i = 0; i < cerclesCount; i++) {
    cercles[i] = new Cercle();
    cercles[i].x = random(0, width);
    cercles[i].y = random(0, height);
    cercles[i].randomColor();
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