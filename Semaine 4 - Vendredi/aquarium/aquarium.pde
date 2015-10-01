/*
 Exemple plus avancé et très concret de l'utilisation de tableaux et de classes.
 Pas d'interaction
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */


Fish[] fishes = new Fish[100];

// Le tableau qui contient les 20 images
PImage fish1Img[] = new PImage[16];
PImage fish2Img[] = new PImage[6];

void setup() {
  size(960,540);
  
  // Chargement des images de papillon
  for (int i=0; i<fish1Img.length; i++) {
    fish1Img[i] = loadImage("fish1_"+i+".png");
  }
  
  // Chargement des images de papillon
  for (int i=0; i<fish2Img.length; i++) {
    fish2Img[i] = loadImage("fish2_"+i+".png");
  }
  
  
  // Création des instances de poissons (Fish)
  for (int i=0; i<fishes.length; i++) {
    if(i%2==0) fishes[i] = new Fish(fish1Img);
    else fishes[i] = new Fish(fish2Img);
    fishes[i].animationSpeed = random(0.1,0.3);
    fishes[i].speed = random(0.1,3);
    fishes[i].frameOffset = floor(random(1,10));
    fishes[i].x = random(0,width);
    fishes[i].y = random(0,height);
  }
  
}

void draw() {
    
  background(50);
  
  // Déplacement et affichage des poissons
  for (int i=0; i<fishes.length; i++) {
    fishes[i].move();
    fishes[i].draw();
  }
  
}