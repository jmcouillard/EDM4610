/*
 xxx
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

// Tableaux d'éléments
Element[] elements;
int elementCount = 100;

// Creer un élément de répulsion
Repulsor repulsor1;

void setup() {

  // Taille du sketch
  size(960, 540, P3D);

  // Initialiser le tableau
  elements = new Element[100];  
  
  // Initialiser tous les éléments
  for(int i=0; i< elementCount; i++) {
    elements[i] = new Element();
  }
  
  repulsor1 = new Repulsor();
}

void draw() {

  // Effacer l'image
  background(50);

  // Mettre à jour les éléments
  for(int i=0; i< elementCount; i++) {
    elements[i].update();
    elements[i].applyRepulsor(repulsor1);
  }
  
  // Afficher les éléments
  for(int i=0; i< elementCount; i++) {
    elements[i].display();
  }
  
  // Afficher le répulseur
  repulsor1.display();
}

void mouseMoved() {
  
  // Lorsque la souris bouge, on déplace le repulsor
  repulsor1.pos.x = mouseX;
  repulsor1.pos.y = mouseY;
}