/*
 Exemple pour l'atelier. Cliquer sur les cercle pour réinitialiser leur position.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

Cercle cercle1;
Cercle cercle2;
Cercle cercle3;

void setup() {
  size(960,540);
  
  // Création d'une instance de Cercle
  cercle1 = new Cercle(50.0);
  cercle1.x = random(0, width);
  cercle1.y = random(0, height);
  cercle1.randomColor();
  
  // Création d'une instance de Cercle
  cercle2 = new Cercle(40.0);
  cercle2.x = random(0, width);
  cercle2.y = random(0, height);
  cercle2.randomColor();
  
  // Création d'une instance de Cercle
  cercle3 = new Cercle(150.0);
  cercle3.x = random(0, width);
  cercle3.y = random(0, height);
  cercle3.randomColor();
}

void draw() {
  
  if(cercle1.isClicked() || cercle2.isClicked() || cercle3.isClicked()) {
    background(200);
  } else  {
    background(155);
  }
    
  // Dessin des cercle
  cercle1.draw();
  cercle2.draw();
  cercle3.draw();
   
}