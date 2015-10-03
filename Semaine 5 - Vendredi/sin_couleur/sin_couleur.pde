/*
 Utilisation de l'oscillation en utilisant sin().
 Changement de couleur en dégradé en utilisant deux réglages de couleurs.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/


// Créer deux réglages de couleurs
color colorTop1 = color(246, 196, 24);
color colorTop2 = color(46, 165, 241);
color colorBottom1 = color(241, 138, 46);
color colorBottom2 = color(170, 57, 190);

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
  
  // Définir les oscillations et les variables
  float oscillation = sin(life) / 2 + 0.5; 
  color colorTop = lerpColor(colorTop1, colorTop2, oscillation);
  color colorBottom = lerpColor(colorBottom1, colorBottom2, oscillation);
  
  // Création d'un dégrader en utilisant la technique de "couleurs de vertex"
  noStroke();
  beginShape();
  fill(colorTop);
  vertex(0, 0);
  vertex(width, 0);
  fill(colorBottom);
  vertex(width, height);
  vertex(0, height);
  endShape();
  
  // Visualisation de la donnée d'oscillation 
  fill(255);
  ellipse(width/2, oscillation * height, 10, 10) ;
  textAlign(LEFT, CENTER);
  text(oscillation, width/2 + 15, oscillation * height);
  
  // Incrémenter la vie
  life += 0.01;
}