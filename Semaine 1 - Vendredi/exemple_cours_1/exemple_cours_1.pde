/*
 Sketch qui décrit l'initalisation de variables
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

// Variables pour la couleur de background
int gray = 127; 

// Variable de position du rectangle 1
float rect1X = 1.0;
float rect1Y = 1.0;
float rect1Direction = 10.0;
color rect1Color = color(0, 100, 0);

// Variables pour le cercle
float round1Size = random(1) * 50.0;

// Exemple de d'autres types de variables
boolean switch1 = true;
String maChaine1 = "Ma chaine caractère"; 
float monNombre1 = 127.425;

// Exemple (très) sommaire d'image
PImage img;

void setup() {

  // La taille de la fenetre.
  size(600, 600);

  // Le nombre d'images par seconde.
  frameRate(60);

  // Chargement d'une image
  img = loadImage("planet.png");
}

void draw() {

  // Augmenter l'intensité de rouge du background en s'assurant que la valeur est entre 0-255
  gray = constrain(gray - 1, 0, 255);

  // Remplir l'arriere-plan (efface le contenu)
  background(gray);

  // Affichage de l'image
  imageMode(CENTER);
  image(img, width/2, height/2);

  // Premier rectangle
  fill(rect1Color);
  rect(rect1X, rect1Y, 50, 50);

  // Deuxième rectangle
  fill(255);
  rectMode(CENTER);
  rect(mouseX, mouseY, 100, 100);

  // Troisième forme
  round1Size = random(50); 
  rectMode(CORNER);
  ellipse(100, 100, round1Size, round1Size);

  // Incrémenter les variables de position du rectangle 1 
  rect1X += rect1Direction;
  rect1Y += rect1Direction;

  // Des équivalents seraient
  // rect1X ++;
  // rect1X = rect1X + 1;

  // Lorsque la souris est pressée
  // if(mousePressed) {
  if (mousePressed == true) {
    rect1X = 0;
    rect1Y = 0;
  }

  // Boucle conditionnelle simple
  if (rect1X > width) {
    // On inverse la direction
    rect1Direction = -rect1Direction;
  } else if (rect1X < 0) {
    // On inverse la direction
    rect1Direction = -rect1Direction;
  }

  // Version encore plus simple de la boucle conditionnelle
  //if (rect1X > width || rect1X < 0 ) {    
  //  rect1Direction = -rect1Direction;
  //}


  // Deboggage
  println(rect1X + " / " + rect1Direction);
}