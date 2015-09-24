/*
 Exemple de classe de type bouton.
 Trois instances de la classe sont créées.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/


Carre monCarre1;
Carre monCarre2;
Carre monCarre3;

void setup() {
  size(960,540);
  
  // Création d'une instance de Carre
  color red = color(255,0,0);
  monCarre1 = new Carre(red, 10.0);
  monCarre1.x = 100.0;
  monCarre1.y = 200.0;
  
  // Création d'une autre instance de Carre
  color green = color(0,255,0);
  monCarre2 = new Carre(green, 50.0);
  monCarre2.x = 300.0;
  monCarre2.y = 100.0;
  
  // Création d'une autre instance de Carre
  color blue = color(0,0,255);
  monCarre3 = new Carre(blue, 30.0);
  monCarre3.x = 500.0;
  monCarre3.y = 400.0;
}

void draw() {
  
  // Dessin des carrés
  monCarre1.draw();
  monCarre2.draw();
  monCarre3.draw();
}