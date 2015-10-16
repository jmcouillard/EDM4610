/*
 Assouplissement fixe à 2 dimensions.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

// La position actuelle
float posX = 200;
float posY = 200;

float targetX = 200;
float targetY = 200;

// Vitesse recherchée 
float vitesse = 2;

void setup() {
  size(400, 400);
}

void draw() {

  background(127);

  // Calcul de l'angle vers laquelle on se dirige
  // atan2 : Calculates the angle (in radians) from a specified point to the coordinate origin as measured from the positive x-axis.
  float radians = atan2( targetY-posY, targetX-posX );
  
  // Calcul de la distance entre les deux points
  float distance = dist( targetX, targetY, posX, posY );

  // Ajustement des 
  posX = cos(radians) * min( vitesse, distance ) + posX;
  posY = sin(radians) * min( vitesse, distance ) + posY;

  // Desin
  noStroke();
  rectMode(CENTER);
  ellipse(posX, posY, 50, 50);
}

void mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
}

void mouseDragged() {
  targetX = mouseX;
  targetY = mouseY;
}