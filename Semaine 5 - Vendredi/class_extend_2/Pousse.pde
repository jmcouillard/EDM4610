class Pousse {

  // Définition des variables
  boolean started;
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  float rand = 0;
  float growth = 0;
  float topX = 0;
  float topY = 0;
  color c;
  float shake =1;

  Pousse() {
    started = false;
    rand = random(1);
    w = random(5, 10);
    h = random(100, 300);
    c = color(random(100, 150), random(150, 255), random(10, 50));
    growth = 0;
  }

  void draw() {

    // Forcer un blendmode de type screen
    blendMode(SCREEN);

    // Calculer l'oscillation, et la position de la vertex du haut
    topX = sin(frameCount/100.0*rand) * 20.0 * rand;
    topX = (topX + shake) * growth ;
    topY = -h*growth;

    // Créer une matrice de transformation
    pushMatrix();
    translate(x, y);
    scale(rand);

    // Début de la souris
    beginShape();    
    fill(c);
    noStroke();
    curveVertex(-w, 20);
    curveVertex(-w, 0);
    curveVertex(topX, topY);
    curveVertex(w, 0);
    curveVertex(w, 20);
    endShape(CLOSE);

    // Appel de la fonction contenue dans les classes inférieures
    drawSpecial();

    // Fin de la matrice de dessin
    popMatrix();

    // Si la pousse est débuter, faire grandir la variable growth de 0.0 à 1.0
    if (started && growth<1.0) {
      growth += (1.0-growth) / 100.0;
    }

    // Diminution de la valeur de shake, affectée par la souris
    shake = shake * 0.99;
  }

  // Fonction appellée pour débuter la "pousse"
  void startGrow() {
    started = true;
  }

  // Fonction de détection de la souris
  void mouseMoved() {
    float distance = abs(mouseX - x);
    if (mouseX < pmouseX) {
      shake -= max(0, (40-distance)/40) * 10;
    }
    else {
      shake += max(0, (40-distance)/40) * 10;
    }
  }

  // Cette fonction est utilisé dans les sous-classes
  void drawSpecial() {
  }
}

