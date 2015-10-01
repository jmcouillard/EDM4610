class Letter {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float size = 0.0;
  float speed = 0.0;
  color c = color(50);
  float opacity = 255;
  float life = 0;
  float rotation = 0;
  String text = "x";
  float delay = 2000;
  long lastChangeTime = 2000;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Letter() {
    setRandomBehaviour();
    setRandomLetter();
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void display() {

    // Paramètres d'afficahge
    fill(c, opacity * ( 2 - life));
    noStroke();
    textAlign(CENTER, CENTER);
    //textMode(SHAPE);

    // Desssiner
    pushMatrix();
    translate(x, y);
    scale(size * (distanceFromMouse() * 0.0025 + 0.5));
    rotate(rotation);
    text(text, 0, 0);
    popMatrix();

    // Valider le si le délai de changement de lettre est dépassé
    if (millis() > lastChangeTime + delay) {
      // Si c'est le cas
      setRandomLetter();
      setRandomBehaviour();
    }

    // Augmenter la vie (utilisé pour faire disparaître la lettre)
    life += speed;
  }

  // Retourne la distance de la lettre avec le centre du sketch
  float distanceFromCenter() {
    return  dist(x, y, width/2, height/2);
  }

  // Retourne la distance de la lettre avec la souris
  float distanceFromMouse() {
    return  dist(x, y, mouseX, mouseY);
  }
  
  // Fonction qui attribue une nouvelle lettre
  void setRandomLetter() {
    text = getCharForNumber(floor(random(1, 26)));
    delay = random(0, 2000) + 50;
    lastChangeTime = millis();
    opacity = random(0, 255);
    life = 0;
  }

  // Fonction qui attribue de nouvelles propriétés de comportements
  void setRandomBehaviour() {
    size = random(0.1, 1);
    speed = random(0.01, 0.05);
    rotation = floor(random(0, 4)) * HALF_PI;
  }

  // http://stackoverflow.com/questions/10813154/converting-number-to-letter
  String getCharForNumber(int i) {
    return i > 0 && i < 27 ? String.valueOf((char)(i + 64)).toLowerCase()    : null;
  }
}