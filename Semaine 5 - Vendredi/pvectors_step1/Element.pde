class Element {

  PVector pos;
  PVector vel;  
  float resistance;

  Element() {
    
    // Créer les vecteurs de positions et de vélocity
    pos = new PVector();
    vel = new PVector();

    // Créer un facteur de résistence (pour créer de la diversité) 
    resistance = random(0.98, 0.99);

    // Attribuer une position aléatoire
    pos.x = random(0, width);
    pos.y = random(0, height);

    // Attribuer une vélocité aléatoire
    randomVelocity();
  }

  // Fonction qui encapsule l'attribution d'une vélocité aléatoire
  void randomVelocity() {
    vel.x = random(-10.1, 10.1);
    vel.y = random(-10.1, 10.1);
  }

  void update() {
    
    // Ajouter la vélocité à la position
    pos.add(vel);
    
    // Diminuer la vélocité
    vel.mult(resistance);

    // Inverser la vélocité sur les bord de l'écran
    if (pos.x > width || pos.x < 0) {
      vel.x = vel.x * -1;
    } else if (pos.y > height || pos.y < 0) {
      vel.y = vel.y * -1;
    }
  }

  void display() {
    fill(255);
    noStroke();

    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}