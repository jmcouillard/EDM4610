
// Déclaration de variables
int posX = 0;
int posY = 0;
float life = 0;
boolean clicked = true;
String monTexte = "Chaîne de charctères";
PImage img1;
PVector monVecteur;

// Variables vraiment utilisées
float size = 50;
color rectColor;

void setup() {

  // Grandeur du sketch
  size(600, 600);

  // Couleur de base des rectangles 
  rectColor = color(255, 0, 0);
}

void draw() {

  // Effacer
  background(0);

  // Affichage manuelle des objets
  //drawObject(100, 10, rectColor);
  //drawObject(200, 200, color(0, 255, 0));
  //drawObject(250, 100, rectColor);
  //drawObject(450, 100, rectColor);
  //drawObject(450, 200, rectColor);
  //drawObject(250, 200, rectColor);
  //drawObject(250, 240, rectColor);
  //drawObject(550, 100, rectColor);

  // Variable qui contien la couleur conditionnelle
  color newColor;

  for (int i=0; i<10; i+=1) {
    for (int j=0; j<10; j+=1) {
      //drawObject(floor(i/10)*75, (i%10)*75, rectColor);

      if ((j%3 == 0  & i%2 ==0 ) && mousePressed) {
        // Couleur en rouge lorsque la souris est pressée
        newColor = color(255, 100, 0);
      } else {
        // Couleur en bleu dans les autres cas
        newColor = color(100, 100, 255);
      }

      // Affichage des objets
      drawObject(i*65, j*65, newColor);
    }
  }
}

// Fonction appellée lorsque la souris est appuyée
void mousePressed() {
  println("mouse pressed");
}

// Fonction appellée lorsqu'une touche est pressée
void keyPressed() {

  if (keyCode == 38) {
    // Flèche d'en haut
    println("haut");
    size += 2;
  } else if (keyCode ==40) {  
    // Flèche d'en bas
    println("bas");
    size -= 2;
  } else {
    println("key pressed " + keyCode);
  }
}

// Fonction appellée lorsque la souris est bougée
void mouseMoved() {
  println("mouse moved " + mouseX + " / " + mouseY);
}

// Raccourci pour appeller la fonction drawObject() sans paramètre
void drawObject() {
  drawObject(0, 0, rectColor);
}

// Fonction de dessin d'objet
void drawObject(int x, int y, color c) {

  noStroke();
  fill(c, 100);
  rectMode(CENTER);
  rect(x, y, size, size);
  fill(0);
  ellipseMode(CENTER);
  ellipse(x, y, 15, 15);

  fill(255, 0, 255);
  ellipse(x-15, y-15, 15, 15);

  // Affiche ou non l'ellipse jaune
  if ( (x < width/2) == false) {
    fill(255, 255, 9);
    ellipse(x+15, y+15, 5, 5);
  }

  //println("drawObject / " + x + " / " + y);
}