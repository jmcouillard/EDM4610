class Carre {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float s;
  color c;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Carre(color couleur, float size) {
    c = couleur;
    s = size;
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void draw() {
    noStroke();
    fill(c);
    rect(x, y, s, s);
  }
}

