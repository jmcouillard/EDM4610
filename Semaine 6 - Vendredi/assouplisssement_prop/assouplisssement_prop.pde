/*
 Assouplissement proportionnel.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

// La position actuelle
float posX = 200;
float posY = 200;

float targetX = 200;
float targetY = 200;

void setup() {
  size(400, 400);
}

void draw() {
  
  background(127);
  
  posX = posX + (targetX-posX)/10.0;
  posY = posY + (targetY-posY)/10.0;
  
  rectMode(CENTER);
  rect(posX, posY, 50, 50);
}

void mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
}