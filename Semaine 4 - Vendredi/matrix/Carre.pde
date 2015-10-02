class Carre {

  float x = 0;
  float y = 0;
  float z = 0;
  float size = 100;
  float speed = 0.01;
  
  float life =0;

  Carre(float s) {
    // Code du constructeur
    size = s;

  speed = random(-0.03, 0.03);

    x = random(0, width);
    y = random(0, height);
    z = random(-100, 100);
  }

  void display() {
    rectMode(CENTER);
    
    life += speed;

    if (isOver() == true) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }

    pushMatrix();
    translate(x,y,z);
    rotate(life);
    //scale(life);
    rect(0, 0, size, size);
    popMatrix();
  }
 
  boolean isOver() {
    //return (mouseX > x - 50 && mouseX < x - 50 + 100) ;
    if ( (mouseX > x - size/2) && (mouseX < x - size/2 + size) && (mouseY > y - size/2) && (mouseY < y + size - size/2)) {
      return true;
    } else {
      return false;
    }
  }
}