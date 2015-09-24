/*
 Animation en réaction avec la souris et le clavier.
 Utilisation de boucle pour creéer les cibles.
 Cliquer pour créer une cible.
 Appuyer sur SPACE pour changer la couleur.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

int posX = 0;
int posY = 0;
float life = 0;
color targetColor;

void setup() {
  size(960, 540);
  
  // Couleur de base de la cible
  targetColor = color(220, 220, 220);
}

void draw() {  
  
  // Effacer
  background(0);

  // Dessiner les cibles
  drawTarget(posX, posY, life);
  
  // Augmenter la "vie"
  life += 0.05;
}


// Dessiner les cibles
void drawTarget(int x, int y, float factor) {
  ellipseMode(CENTER);
  noFill();
  stroke(targetColor, 255 * (1.0 - factor));
  strokeWeight(10);

  for (int i=1; i <= 3; i++) {
    ellipse(x, y, factor * 50 * i + 10, factor * 50 * i + 10);
  }
}


void mousePressed() {
  println("mousePressed");
  life = 0;
  posX = mouseX;
  posY = mouseY;
}


void keyPressed() {
  println(keyCode);

  if (keyCode == 32) {
    // SPACE
    targetColor = color(random(255), random(255), random(255));
  } 
}