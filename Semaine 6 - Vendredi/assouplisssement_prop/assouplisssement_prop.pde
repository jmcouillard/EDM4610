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
  
  noStroke();
  rectMode(CENTER);
  
  // Triangle
  pushMatrix();
  translate(posX, posY);
  beginShape();
  vertex(0, -10);
  vertex(-10, 10);
  vertex(10, 10);
  endShape();
  popMatrix();
}

void mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
}