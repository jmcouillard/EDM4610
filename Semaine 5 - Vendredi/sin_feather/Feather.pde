class Feather {

  float x;
  float y;
  float life;
  float speed;
  
  PImage img;

  Feather(PImage image) {
    img = image;
    reset();
  }

  void reset() {
    
    // Redémarre l'animation et attribue des variables aléatoires
    x = random(0, width);
    y = -100;
    life = 0;
    speed = random(0.005, 0.05);
  }
  
  void display() {

    float oscillation = sin(life);
    float offsetX = sin(oscillation) * 100;
    float offsetY = cos(oscillation) * 50;

    // Affichage de l'image
    noStroke();
    imageMode(CENTER);
    
    // Affichage de l'image
    pushMatrix();
    translate(x+offsetX, y+offsetY);
    rotate(-oscillation * 0.2);
    image(img, 0, 0, 100, 78);
    popMatrix();

    // Augmentation des variables de vie et de position 
    life += speed;
    y += (speed*10);
    
    // Redémarrer l'animation au besoin
    if(y > height) {
      reset();
    }
  }
}