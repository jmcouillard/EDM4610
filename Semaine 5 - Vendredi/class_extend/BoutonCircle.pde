class BoutonCircle extends Button {

  BoutonCircle(float size) {
    super(size);
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  boolean isClicked() {
    if (mousePressed && (dist(mouseX, x, mouseY, y)<s/2)) {
      return true;
    }
    else {
      return false;
    }
  }


  void drawShape() {
    ellipse(x, y, s, s);
  }
}

