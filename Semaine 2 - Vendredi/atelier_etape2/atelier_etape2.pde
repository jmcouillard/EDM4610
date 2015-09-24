/*
 Animation en réaction avec la souris et le clavier.
 Utilisation de boucle pour creéer les cibles.
 Cliquer pour créer une cible.
 Appuyer sur SPACE pour changer la couleur.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

int posX1 = 0;
int posY1 = 0;
float life1 = 0;

int posX2 = 0;
int posY2 = 0;
float life2 = 0;

int posX3 = 0;
int posY3 = 0;
float life3 = 0;

int posX4 = 0;
int posY4 = 0;
float life4 = 0;

color targetColor;
int currentTarget = 0;

void setup() {
  size(960, 540);
  
  rectMode(CENTER);

  // Couleur de base de la cible
  targetColor = color(220, 220, 220);
}

void draw() {

  // Effacer
  background(0);

  // Dessiner les cibles
  drawTarget(posX1, posY1, life1, true);
  drawTarget(posX2, posY2, life2, false);
  drawTarget(posX3, posY3, life3, true);
  drawTarget(posX4, posY4, life4, false);

  // Augmenter la "vie"
  life1 += 0.03;
  life2 += 0.03;
  life3 += 0.03;
  life4 += 0.03;
}


// Dessiner les cibles
void drawTarget(int x, int y, float factor, boolean useSquare) {
  ellipseMode(CENTER);
  noFill();
  stroke(targetColor, 255 * (1.0 - factor));
  strokeWeight(10);

  for (int i=1; i <= 3; i++) {
    if (useSquare) {
      rect(x, y, factor * 50 * i + 10, factor * 50 * i + 10);
    } else {
      ellipse(x, y, factor * 50 * i + 10, factor * 50 * i + 10);
    }
  }
}

void mousePressed() {
  println("mousePressed");

  if (currentTarget == 0) {
    life1 = 0;
    posX1 = mouseX;
    posY1 = mouseY;
  } else if (currentTarget == 1) {
    life2 = 0;
    posX2 = mouseX;
    posY2 = mouseY;
  } else if (currentTarget == 2) {
    life3 = 0;
    posX3 = mouseX;
    posY3 = mouseY;
  }

  currentTarget = (currentTarget+1) % 3;
}


void keyPressed() {
  println(keyCode);

  if (keyCode == 32) {
    // SPACE
    targetColor = color(random(255), random(255), random(255));
  }
}