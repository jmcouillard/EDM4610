/*
 Exemple de classe de type bouton.
 Une seule instance de la classe est utilisée.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/


Button button1;

void setup() {
  size(960,540);
  
  // Création d'une instance de Carre
  button1 = new Button(50.0);
  button1.x = 200.0;
  button1.y = 200.0;
}

void draw() {
  
  if(button1.isClicked()) {
    background(200);
  } else  {
    background(155);
  }
    
  
  
  // Dessin du carre 1
  button1.draw();
  
    
}