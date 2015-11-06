/*
 Exemple simple de PVector.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

// Tableaux d'éléments
Element[] elements;
int elementCount = 100;

void setup() {

  // Taille du sketch
  size(960, 540, P3D);

  // Initialiser le tableau
  elements = new Element[100];  
  
  // Initialiser tous les éléments
  for(int i=0; i< elementCount; i++) {
    elements[i] = new Element();
  }
}

void draw() {

  // Effacer l'image
  background(50);

  // Mettre à jour les éléments
  for(int i=0; i< elementCount; i++) {
    elements[i].update();
  }
  
  // Afficher les éléments
  for(int i=0; i< elementCount; i++) {
    elements[i].display();
  }

}

void mousePressed() {
  for(int i=0; i< elementCount; i++) {
    elements[i].randomVelocity();
  }
}