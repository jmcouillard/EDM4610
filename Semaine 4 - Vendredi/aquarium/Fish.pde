class Fish {

  // Variable de position de la classe
  float x = 0.0;
  float y = 0.0;

  // Variable d'animation de la classe
  int frameOffset;
  float animationSpeed;
  float speed;

  // Le tableau d'images à utiliser
  PImage[] fishImages;

  // Le tableau de bulle
  Bulle[] bulles;

  // Constructeur (appelé lorsqu'on utilise le mot-clé new)
  Fish(PImage[] images) {
    fishImages = images;
    animationSpeed = 1;
    speed = 1;
    
    // Créer les bulles 
    bulles = new Bulle[floor(random(0, 4))];
    for (int i=0; i<bulles.length; i++) {
      bulles[i] = new Bulle();
    }
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void draw() {

    pushMatrix();

    translate(x, y);
    if (speed<0) scale(-1, 1);

    // Définir quel frame est à afficher
    int frame = floor(((frameCount+frameOffset)*animationSpeed)%fishImages.length);

    // Dessiner une image de papillon, en utilisant un modulo et framcount
    imageMode(CENTER);
    image(fishImages[frame], 0, 0);

    // Dessiner chacune des bulles
    for (int i=0; i<bulles.length; i++) {
      bulles[i].draw();
    }

    popMatrix();
  }

  // Fonction personnalisée, que l'on doit appeler manuellement
  void move() {

    // Modifier la position selon la vitesse
    x+=1*speed;

    // Inverser la vitesse si hors des limite
    if (x > width) speed = -speed;
    else if (x < 0) speed = -speed;

    // Mettre à jour la position des bulles
    for (int i=0; i<bulles.length; i++) {
      bulles[i].move();
    }
  }
}

