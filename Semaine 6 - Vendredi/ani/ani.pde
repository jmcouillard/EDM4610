/*
 Exemple de base de la librairie Ani
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

import de.looksgood.ani.*;

float posX;
float posY;

void setup() {
  size(600, 600);
  noStroke();
  
  // Centrer l'ellipse au départ
  posX = width / 2;
  posY = width / 2;

  // Initialisation de la librairie
  Ani.init(this);
}

void draw() {
  background(255);
  fill(0);
  ellipse(posX, posY, 120, 120);
}

void mouseReleased() {
    Ani.to(this, 1.5, "posX", mouseX);
    Ani.to(this, 1.5, "posY", mouseY);
}