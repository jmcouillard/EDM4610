class Cercle {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float s = 50.0;
  float speed = 1.0;
  color c = color(50);
  float life;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Cercle(float size) {
    s = size;
    speed = random(1, 2);
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void display() {

    ellipseMode(CENTER);
    noFill();
    stroke(c, 255 * (1.0 - life));
    strokeWeight(10);

    // Condition lorsque cliquée
    if (isClicked()) {
      stroke(200);
      x = random(width);
      y = random(height);
      life = 0;
    }

    // Desssiner 
    for (int i=1; i <= 3; i++) {
      ellipse(x, y, life * s* i + 10, life  * s * i + 10);
    }

    // Augmenter la vie
    life+= 0.01 * speed;

    // Redémarrer la vie suite à l'animation
    if (life > 2) life = 0;
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  boolean isClicked() {
    if (mousePressed && (mouseX>x-s/2 && mouseX<x+s/2 && mouseY>y-s/2 && mouseY<y+s/2)) {
      return true;
    } else {
      return false;
    }
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  // Elle permet de changer la couleur pour une nouvelle aléatoirement
  void randomColor() {
    int grayValue = floor(random(1, 255));
    
    // Sassurer que la couleur n'est pas la même que le fond
    if(grayValue > 150 && grayValue < 200) {
      grayValue+= 40;
    }
    
    // Attribuer la nouvelle valeur à la proppriété C
    c = color(grayValue);
  }
}