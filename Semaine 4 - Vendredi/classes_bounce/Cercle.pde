class Cercle {

  // Définition des variables contenus dans la classe
  float x = 0.0;
  float y = 0.0;
  float size = 0.0;
  float speedX = 0.0;
  float speedY = 0.0;
  color c = color(50);

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Cercle() {
    size = random(5, 20);
    speedX = random(-1, 1);
    speedY = random(-1, 1);
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void display() {

    ellipseMode(CENTER);
    fill(c);
    noStroke();

    // Desssiner 
    ellipse(x, y, size + 10, size + 10);

    // Bouger 
    x+=speedX;
    y+=speedY;
    
    // Inverser la direction lorsque l'objet dépasse les limites du sketch en X
    if (x < 0 || x > width) {
      speedX = speedX * -1.0;
    }
    
    // Inverser la direction lorsque l'objet dépasse les limites du sketch en Y
    if (y < 0 || y > height) {
      speedY = speedY * -1.0;
    }
  }


  // Fonction personnalisée, que l'on doit appeler manuellement
  // Elle permet de changer la couleur pour une nouvelle aléatoirement
  void randomColor() {
    int grayValue = floor(random(1, 255));

    // Sassurer que la couleur n'est pas la même que le fond
    if (grayValue > 150 && grayValue < 200) {
      grayValue+= 40;
    }

    // Attribuer la nouvelle valeur à la proppriété C
    c = color(grayValue);
  }
}