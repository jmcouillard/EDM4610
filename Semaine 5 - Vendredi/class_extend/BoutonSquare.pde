class BoutonSquare extends Button {

  BoutonSquare(float size) {
    super(size);
  }
  
  // Fonction personnalisée, que l'on doit appeler manuellement
  boolean isClicked() {
    if (mousePressed && (mouseX>x && mouseX<x+s && mouseY>y && mouseY<y+s)) {
      return true;
    }
    else {
      return false;
    }
  }
  
  
  void drawShape() {
    rect(x, y, s, s);
  }
  
}

