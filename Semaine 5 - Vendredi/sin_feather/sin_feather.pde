/*
 Déplacement autour d'un cercle en utilisant sin et cos.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */

// Object de plume
int feathersCount = 10;
Feather[] feathers;

PImage imagePlume;

void setup() {

  // Taille du sketch
  size(960, 540, P3D);
  
  // Charger l'image
  imagePlume = loadImage("data/1-feather.png");

  // Instancier l'object
  feathers = new Feather[feathersCount];
  
  for(int i=0; i<feathersCount; i++) {
    feathers[i] = new Feather(imagePlume);
  }
}

void draw() {

  background(50);
  for(int i=0; i<feathersCount; i++) {
    feathers[i].display();
  }
}