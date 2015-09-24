/*
 Créeation d'une classe très simple et instanciation.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

Carre monCarre1;

void setup() {
  size(960,540);
  
  // Création d'une instance de Carre
  color red = color(255,0,0);
  monCarre1 = new Carre(red, 20.0);
  
  // Modifications des variables de la classee
  monCarre1.x = 200.0;
  monCarre1.y = 200.0;
}

void draw() {
  
  // Dessin du carre 1
  monCarre1.draw();
}