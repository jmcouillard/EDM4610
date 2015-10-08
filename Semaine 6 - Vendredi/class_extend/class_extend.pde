
// Variables
BoutonCircle btn1;
BoutonSquare btn2;

void setup() {

  // Taille du sketch
  size(960, 540);

  btn1 = new BoutonCircle(20);
  btn1.x = 200;
  btn1.y = 200;
  
  btn2 = new BoutonSquare(20);
  btn2.x = 500;
  btn2.y = 200;

}

void draw() {
  
  // Forcer le retour à Un blend mode normal
  blendMode(BLEND);

  // Fond de couleurs et texture
  background(0);
  
  btn1.draw();
  btn2.draw();
}

void mouseMoved() {

}

