class Button {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float s;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Button(float size) {
    s = size;
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void draw() {
    rectMode(CORNER);
    stroke(0);
    if (isClicked()) fill(200);
    else fill(255);
    rect(x, y, s, s);
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
}

