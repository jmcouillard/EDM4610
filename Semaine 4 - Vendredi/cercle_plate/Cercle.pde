class Cercle {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float size = 10;
  color c = color(50);

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Cercle() {
    size = random(5, 20);
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void display() {

    ellipseMode(CENTER);
    fill(c);
    noStroke();

    // Desssiner 
    ellipse(x, y, size + 10, size + 10);
  }
}