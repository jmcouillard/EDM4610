/*
 Assouplissement proportionnel.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

PVector pos;
PVector dest;

float life =0;
float radius = 100;

void setup() {
  size(600, 600, P3D);
  
  pos = new PVector(width /2, height /2);
  dest = new PVector();
}

void draw() {

  background(255);

  // Triangle
  noStroke();
  pushMatrix();
  translate(pos.x, pos.y);
  beginShape();
  fill(20, 100, 100);
  vertex(0, -20);
  fill(5, 100, 0);
  vertex(-20, 20);
  fill(0, 255, 0);
  vertex(20, 20);
  endShape();
  popMatrix();

  fill(0);

  pos.x += (dest.x - pos.x) * 0.05;
  pos.y += (dest.y - pos.y) * 0.05;
  
  ellipse(dest.x, dest.y, 20, 20);

  life += 0.01;

  dest.x = sin(life) * radius + width/2;
  dest.y = cos(life) * radius + height /2;
  
  stroke(0, 100);
  line(width/2, height/2, dest.x, dest.y);
}

void mousePressed() {
  dest.x = mouseX;
  dest.y = mouseY;
}

void mouseMoved() {
  radius =  mouseX;
}