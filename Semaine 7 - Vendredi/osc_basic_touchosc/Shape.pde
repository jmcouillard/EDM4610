class Shape {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float s;
  float r;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Shape(float size) {
    s = size;
    x = random(0, width);
    y = random(0, height);
    r = random(0, 1);
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void draw(boolean useEllipse) {

    noStroke();
    
    blendMode(ADD);
    
    fill(255, 100);

    if (useEllipse) {
      ellipseMode(CENTER);
      ellipse(x, y, s, s);
    } 
    else {
      rectMode(CENTER);
      rect(x, y, s, s);
    }
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void update(float speed) {

    y = y-(1.0*speed*r);

    if (y< -s) {
      y = height + s;
    } 
    else if (y > height+s) {
      y = height + s;
    }
  }
}