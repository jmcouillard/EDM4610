/*
 Assouplissement avec destination.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

float posX;
float posY;

float targetX;
float targetY;

float speedFactor = 0.005;

PImage img1;
PImage img2;

int partCount = 100;
float[] partX = new float[partCount];
float[] partY = new float[partCount];
float[] partRandom = new float[partCount];

void setup() {
  size(760, 540);

  posX = 450;
  posY = -150;

  targetX = 450;
  targetY = 300;

  img1 = loadImage("planet.jpg");
  img2 = loadImage("fusee.png");

  for (int i=0; i<partCount; i++) {
    partRandom[i] = random(0.5, 1);
  }
}

void draw() {

  background(0);
  imageMode(CORNER);
  image(img1, 0, 0);  

  posX += (targetX-posX) * speedFactor;
  posY += (targetY-posY) * speedFactor;

  imageMode(CENTER);
  image(img2, posX, posY);

  fill(255, 0, 0);  
  ellipse(targetX, targetY, 10, 10);

  smoke();
}

void smoke() {

  pushMatrix();
  translate(posX, posY+100);

  noStroke();
  fill(255, 255, 255, 50);

  for (int i=0; i<partCount; i++) {
    ellipse(partX[i], partY[i], 10*partRandom[i], 10*partRandom[i]);
    partY[i] += 2*partRandom[i];
    partX[i] += partRandom[i] - 0.75;

    if (partY[i] > 100) {
      partY[i] = 0;
      partX[i] = 0;
    }
  }

  popMatrix();
}


void mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
}