/*
 Exemple d'utilisation du modulo afin d'alterner entre deux états.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

// Définir des limites de temps
float limiteDeTemps = 2000;

void setup() {
  size(400, 400);
}

void draw() {

  // Afficher dans la console le temps actuel
  println(millis());

  if (millis() % (limiteDeTemps * 2) > limiteDeTemps) {
    // Opération d'après 2000 millisecondes
    background(0, 255, 0);
  } 
  else {
    // Opération d'AVANT 2000 millisecondes
    background(255, 0, 0);
  }
}