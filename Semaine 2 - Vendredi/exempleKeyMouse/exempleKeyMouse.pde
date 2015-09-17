
int posX = 0;
int posY = 0;
color colorRect = color(255, 255, 255);

void setup() {
  size(960,540);
}

void draw() {  
  background(0);
  rectMode(CENTER);
  
  // Draw rect
  fill(colorRect);
  rect(posX,posY,100,100);
}


void mouseDragged() {
  //println("mousePressed");
  posX = mouseX;
  posY = mouseY;  
}


void keyPressed() {
  println(keyCode);
  
  if(keyCode == 32) {
    // SPACE
    colorRect = color(random(255), random(255), random(255));
  } else if(keyCode == 38) {
    // UP
    posY -= 10;
  } else if(keyCode == 40) {
    posY += 10;
  } else if(keyCode == 37) {
    posX -= 10;
  } else if(keyCode == 39) {
    posX += 10;
  }
  
}



