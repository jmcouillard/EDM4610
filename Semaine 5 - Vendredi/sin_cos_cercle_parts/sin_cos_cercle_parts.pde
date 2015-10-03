/*
 Positionnement d'objets autour d'un cercle
 en utilisant sin et cos.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

// Paramètres de dessin
float radius = 200;
int parts = 12;

void setup() {

  // Taille du sketch
  size(960, 540);
}

void draw() {

  background(50);

  // Paramètre de dessins
  noStroke();
  fill(255);

  // Boucle pour dessiner chacune des "parties"
  for (int i=0; i<parts; i++) {

    // Création d'un dégrader en utilisant la technique de "couleurs de vertex"
    float norm = (float)i / parts;
    float x = (sin(norm * TWO_PI) * radius) + width/2;
    float y = (cos(norm * TWO_PI) * radius) + height/2;

    // Dessin de l'ellipse
    ellipse(x, y, 10, 10);
  }

}