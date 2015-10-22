/*
 Envoi de données pour l'exemple osc_advanced_receive.pde
 Déplacer la souris pour déplacer la cible.
 Cliquer pour afficher un mot.
 Appuyer sur espace pour faire un saut en Z.
 
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

// Déclarer l'objet de la librairie
String[] words;
int currentWord = 0;

void setup() {

  // Taille du sketch
  size(400, 400);

  // Initialisation de la librarie OSC, et définission du port d'écoute
  oscP5 = new OscP5(this, 1234);

  // Initialisation de la destination des messages
  receiver = new NetAddress( "127.0.0.1", 3333 );

  // Initialisation des mots possibles
  words = new String[10];
  words[0] = "My my,";
  words[1] = "hey hey";
  words[2] = "Rock and roll";
  words[3] = "is here to stay";
  words[4] = "It's better";
  words[5] = "to burn out";
  words[6] = "Than to";
  words[7] = "fade away";
  words[8] = "My my,";
  words[9] = "hey hey.";
}

void draw() {

  background(0);

  // Dessin de la cible
  noStroke();
  fill(200);
  rectMode(CENTER);
  rect(mouseX, mouseY, 5, 50);
  rect(mouseX, mouseY, 50, 5);
}

// Fonction appelée lorsque 
void mouseMoved() {

  OscMessage myMessage = new OscMessage("/mouseMoved");
  myMessage.add((float)mouseX/width);
  myMessage.add((float)mouseY/height);
  oscP5.send(myMessage, receiver);
}

// Fonction appelée lorsque 
void mouseClicked() {

  // Envoi du message
  OscMessage myMessage = new OscMessage("/words");
  myMessage.add(words[currentWord]);
  oscP5.send(myMessage, receiver);

  // Passer au prochain mot
  currentWord = (currentWord + 1) % 10;
}

// Fonction appelée lorsque le clavier est utilisé 
void keyPressed() {

  // Seulement lorsque ESPACE est utilisé
  if (keyCode == 32) {
    
    // Envoi du message
    OscMessage myMessage = new OscMessage("/shake");
    myMessage.add(random(-20, 20));
    oscP5.send(myMessage, receiver);
  }
}