/*
 Réception de données OSC.
 Conçu pour être utilisé avec le layout par default de TouchOSC.
 http://hexler.net/software/touchosc
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

// Importer la librairie OSC
import oscP5.*;

// Déclarer l'objet de la librairie
OscP5 oscP5;

// Variables qui contiennent des images
PImage shades;

// Tableau de mon objet Shape
Shape[] shapes;

// Variables modifiés par OSC
float fade = 0.0;
boolean useEllipse = true;
color bgColor;
float speed;

void setup() {

  // Taille du sketch
  size(960, 540);

  // Initialisation de la librarie OSC, et définission du port d'écoute
  oscP5 = new OscP5(this, 3333);

  // Chargement des images
  shades = loadImage("shades.png");

  // Initialisation de certaines variables
  bgColor = color(0, 0, 0);

  // Initialisation du tableau de shape
  shapes = new Shape[100];
  for (int i=0; i<shapes.length; i++) {
    shapes[i] = new Shape(random(10, 100));
  }
}

void draw() {

  blendMode(NORMAL);
  background(bgColor, 255);
  image(shades, 0, 0);

  // Draw shape
  for (int i=0; i<shapes.length; i++) {
    shapes[i].update(speed);
    shapes[i].draw(useEllipse);
  }

  // Fade over
  blendMode(NORMAL);
  if (fade<1.0) {
    fill(0, 0, 0, 255-(fade*255) );
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
}

// Fonction appelée lorsque 
void oscEvent(OscMessage theOscMessage) {

  // Définir quelle adresse nous avons recu
  String adress = theOscMessage.addrPattern();

  println(theOscMessage);

  if (adress.equals("/1/push1")) {
    println("Bang received.");
    
  } else if (adress.equals("/1/toggle1")) {
    boolean value = theOscMessage.get(0).floatValue() == 1;
    if (value == true) {
      useEllipse = true;
    } else {
      useEllipse = false;
    }
    
  } else if (adress.equals("/1/fader1")) {
    fade = theOscMessage.get(0).floatValue();
    
  } else if (adress.equals("/1/fader2")) {
    speed = theOscMessage.get(0).floatValue();
    
  }
  
  //else if (adress.equals("/1/bgColor")) {
  //  int red = theOscMessage.get(0).intValue();
  //  int green = theOscMessage.get(1).intValue();
  //  int blue = theOscMessage.get(2).intValue();
  //  bgColor = color(red, green, blue);
  //}
}