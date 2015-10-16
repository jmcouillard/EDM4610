/*
 xxx
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

float radius = 200;

// Variable de police de caractère
PFont font;

// Variable de vie qui incrémente avec le temps
float life = 0;

void setup() {

  // Taille du sketch
  size(960, 540, P3D);

  // Chargement de la police de caractère
  font = loadFont("MyriadArabic-Bold-28.vlw");
  textFont(font, 28);
}

void draw() {

  background(50);

  // Définir les oscillations et les variables
  float oscillationSin = sin(life); 
  float x = (oscillationSin *radius / 2) + width/2;
 
  // Affichage de l'ellipse
  noStroke();
  fill(255);
  ellipse(x, height/2, 10, 10) ;

  // Visualisation de la donnée d'oscillation 
  textAlign(CENTER, CENTER);
  text("sin", width / 2, height / 2 - 80);
  text(oscillationSin, width / 2, height / 2 -50);

  // Incrémenter la vie
  life += 0.01;
}