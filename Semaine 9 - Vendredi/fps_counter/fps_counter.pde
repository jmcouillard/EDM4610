/*
 Sketch simple pour afficher le framerate 
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0.1
 */


// Variable qui contendra la police de caractère
PFont font;

void setup() {

  // Initilisation du sketch en OpenGL (P3D)
  size(960, 540, P3D);
  
  // Chargement de la police de caractère
  font = loadFont("InputMono-Bold-28.vlw");

}

void draw() { 

  // Effacer le skecth actuel (reset)
  background(0);
  
  // Afficher le framerate (à garder en fin de sketch)
  fill(255);
  textAlign(LEFT, TOP);
  textMode(MODEL);
  text(frameRate, 10,10);
  
  
}