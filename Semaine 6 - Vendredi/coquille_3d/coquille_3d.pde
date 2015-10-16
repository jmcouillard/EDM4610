
/*
 Coquille 3D.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */


void setup() {

  // Taille du sketch
  size(960, 640, P3D);
  pixelDensity(displayDensity());
}

void draw() {

  // Effacer l'image
  background(0);
  
  // Au choix, selon une camera ortho/perspective
  ortho();

  // Créer une lumière de base
  ambientLight(100, 100, 100);

  // Créer une lumière controlée par la souris
  pointLight(155, 155, 155, mouseX, mouseY, 1000);

}

void mousePressed() {
}

void mouseMoved() {
}

void keyPressed() {
}