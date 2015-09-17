/*
 Utilisation d'une fonction simple avec des paramètres pour
 dessiner un objet à répétition.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

void setup() {
  size(960, 540);
}

void draw() {
  background(127);
  drawDomino(0,0);
  drawDomino(200,100);
  drawDomino(50, 300);
}

void drawDomino(int x, int y) {
  noStroke();
  fill(255);
  rect(0+x, 0+y, 100, 50);
  fill(0);
  ellipse(25+x, 25+y, 20, 20);
  ellipse(75+x, 25+y, 20, 20);
}