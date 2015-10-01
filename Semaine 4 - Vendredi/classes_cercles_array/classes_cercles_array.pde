/*
 Exemple pour l'atelier. Cliquer sur les cercle pour réinitialiser leur position.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

int cerclesCount = 10;
Cercle cercles[] = new Cercle[cerclesCount];

void setup() {
  size(960, 540);

  // Création d'une instance de Cercle
  for (int i = 0; i < cerclesCount; i++) {
    cercles[i] = new Cercle(50.0);
    cercles[i].x = random(0, width);
    cercles[i].y = random(0, height);
    cercles[i].randomColor();
  }
}

void draw() {

  // Effacer l'image
  background(155);

  // Couleur différente du fond si un cercle est cliqué
  for (int i = 0; i < cerclesCount; i++) {
    if (cercles[i].isClicked()) {
      background(255);
      break;
    }
  }

  // Dessin des cercle
  for (int i = 0; i < cerclesCount; i++) {
    cercles[i].display();
  }
}