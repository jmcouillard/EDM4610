class Flower extends Pousse {

  // Variable spécifique à cette sous-classe
  // En plus de toutes la variables héritées
  float ellipseSize;

  // Constructeur pour cette sous classe
  Flower() {
    ellipseSize = random(20,60);
  }

  // Fonction de dessin spécifique
  void drawSpecial() {
    ellipse(topX,topY,ellipseSize*growth,ellipseSize*growth);
  }
}

