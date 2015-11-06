/*
 Skecth en attente de donnée de osc_advanced_send.pde 
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */
 
// Importer la librairie OSC
import oscP5.*;

// Déclarer l'objet de la librairie
OscP5 oscP5;

// Variables qui contient l'image de shjades
PImage shades;

// Variables qui 
PFont font;

// Tableau de mon objet Shape
Word[] words;
int currentWord = 0;

// Variables modifiés par OSC
float fade = 1.0;
float shake = 0.0;
PVector pos;

void setup() {

  // Taille du sketch
  size(960, 540, P3D);

  hint(DISABLE_DEPTH_TEST);

  // Initialisation de la librarie OSC, et définission du port d'écoute
  oscP5 = new OscP5(this, 3333);

  // Chargement des images
  shades = loadImage("shades.png");

  // Chargement de la police
  font = loadFont("Lato-Bold-48.vlw");

  // Initialisation de variables

  pos = new PVector();

  // Initialisation du tableau de mots
  words = new Word[100];
  for (int i=0; i<words.length; i++) {
    words[i] = new Word(random(10, 100));
  }
}

void draw() {

  // Fond de couleurs et texture
  background(0, 255);
  image(shades, 0, 0);

  // Déplacement en z en fonction de la valeur de "shake"
  pushMatrix();
  translate(0, 0, shake);

  // Draw words
  for (int i=0; i<words.length; i++) {
    boolean isCurrent = (i==currentWord);
    words[i].update(isCurrent);
    words[i].draw();
  }
  popMatrix();

  // Fade over
  if (fade < 1.0) {
    fill(0, 0, 0, 255-(fade*255) );
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
  
  // Dessine la cible
  blendMode(NORMAL);
  fill(200, 255);
  ellipse(pos.x * width, pos.y * height, 10, 10);
}

void selectWord(String word) {

  // Relâchement du mon actuel
  words[currentWord].randomTarget();

  // Définir l'index de la nouvelle lettre
  currentWord = (currentWord+1)%words.length;

  // Configuration de la nouvelle lettre
  words[currentWord].setContent(word);
  words[currentWord].targetX = (pos.x*width) + random(-50, 50);
  words[currentWord].targetY = (pos.y*height) + random(-50, 50);
  words[currentWord].alpha = 1;
  words[currentWord].z = 400;
  words[currentWord].targetZ = 0;
}

// Fonction appelée lorsque 
void oscEvent(OscMessage theOscMessage) {

  // Définir quelle adresse nous avons recu
  String adress = theOscMessage.addrPattern();

  // Décommenter cette ligne pour afficher les messages reçu dans la console 
  // println(theOscMessage);

  if (adress.equals("/words")) {
    // Nous avons reçu une mot
    String value = theOscMessage.get(0).stringValue();
    selectWord(value);
  } else if (adress.equals("/shake")) {
    // Nous avons reçu une valeur de shake
    shake = theOscMessage.get(0).floatValue();
  } else if (adress.equals("/mouseMoved")) {
    // Nous avons reçu une valeur de position
    pos.x = theOscMessage.get(0).floatValue();
    pos.y = theOscMessage.get(1).floatValue();
  }
}