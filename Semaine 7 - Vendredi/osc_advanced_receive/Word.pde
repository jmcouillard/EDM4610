class Word {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float z = 0.0;

  float targetX = 0.0;
  float targetY = 0.0;
  float targetZ = 0.0;

  float alpha = 0.0;
  float s;
  float r;

  String content = "";

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Word(float size) {
    s = size+100;
    
    // Randomize target
    randomTarget();

    // Set position to target
    x = targetX;
    y = targetY;
    z = targetZ;

    // Random
    r = random(0, 1);
  }

  // Fonction qui dessine l'objet
  void draw() {

    noStroke();
    fill(255, alpha*100);

    // Déplacement à la position actuelle
    pushMatrix();
    translate(x, y, z);

    // Dessine l'ellipse
    blendMode(ADD);
    ellipseMode(CENTER);
    ellipse(0, 0, s, s);

    // Dessine le texte
    blendMode(BLEND);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    fill(0, alpha*255);
    textFont(font, 28*(s/150));
    text(content, 0, 0, s, s);

    popMatrix();
  }

  // Fonction qui met à jour les positions
  void update(boolean isCurrent) {

    // Déplace l'ojet vers sa cible
    float factor = 10.0;
    x += (targetX-x)/factor;
    y += (targetY-y)/factor;
    z += (targetZ-z)/factor;

    // Recule l'objet et fade out si ce n'est plus l'object actuel
    if (isCurrent == false) {
      targetZ = targetZ - 1;
      alpha = alpha -0.01;
    }
  }

  // Fonction qui enregistre le text à afficher
  void setContent(String value) {
    content = value;
  }

  // Donne une cible aléatoire à l'objet
  void randomTarget() {
    targetX = random(0, width);
    targetY = random(0, height);   
    targetZ = -1000;
  }
}