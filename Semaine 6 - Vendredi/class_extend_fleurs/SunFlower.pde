class SunFlower extends Pousse {

  // Variable spécifique à cette sous-classe
  // En plus de toutes la variables héritées
  float ellipseSize;

  // Constructeur pour cette sous classe
  SunFlower() {
    ellipseSize = random(20,60);
  }

  // Fonction de dessin spécifique
  void drawSpecial() {
    pushMatrix();
    translate(topX, topY);
    rotate(frameCount/100.0 * rand);
    ellipse(0,0,ellipseSize*growth,ellipseSize*growth);
    
    for(int i=0; i<10; i++) {
      pushMatrix();
      rotate(TWO_PI/10 * i);
      scale(growth);
      ellipse(0,ellipseSize,10,10);
      popMatrix();
    }
    
    popMatrix();
  }
}

