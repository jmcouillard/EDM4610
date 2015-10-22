/*
 Coquille pour réception de données OSC.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */
 
// Importer la librairie OSC et de sa librairie cousine netP5
import oscP5.*;
import netP5.*;

// Déclarer l'objet de la librairie
OscP5 oscP5;

// Déclarer l'objet de la librairie
NetAddress receiver;

void setup() {

  // Taille du sketch
  size(400, 400);

  // Initialisation de la librarie OSC, et définission du port d'écoute
  oscP5 = new OscP5(this, 3333);
  
  // Initialisation de la destination des messages
  receiver = new NetAddress( "127.0.0.1" , 12000 );
}

void draw() {
}

// Fonction appelée lorsque 
void mouseMoved() {
  
  OscMessage myMessage = new OscMessage("/mouseMoved");
  
  myMessage.add(mouseX/width);
  myMessage.add(mouseY/height);

  oscP5.send(myMessage, receiver);
}