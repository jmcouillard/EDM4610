class Bulle {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float s = 0.0;
  float a = 255;
  float speed = 0.0;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Bulle() {
    speed = random(1,4);
    s = random(2,10);
    a = 50;
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void draw() {

    pushMatrix();
    translate(x, y);
    
    // Dessin de l'ellipse
    ellipseMode(CENTER);
    fill(255,a);
    noStroke();
    ellipse(0,0,s,s);

    popMatrix();
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void move() {

    // Modifer la position (y) et la transparence (a)
    y-=0.5*speed;
    a -= 1;

    // Recommencer l'animation après un déplacement vertical de 50 pixels 
    if (y < -50) {
     a = 55;
      y = 0;
    }
  }
}

