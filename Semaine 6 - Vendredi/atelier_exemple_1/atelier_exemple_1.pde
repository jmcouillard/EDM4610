
/*
 Utilisation de l'oscillation en utilisant sin().
 Utilisation de 3D de base et de deux lumières.
 
 Cliquer pour afficher ou masquer le wireframe.
 Utiliser les flèches pour effecturer une rotation
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */


// Tabelaux de couleurs
color[] colors = new color[4];

// Paramètres de vertexes
int particlesCount = 100;

// Tableau de vertexes
Particle[] particles = new Particle[particlesCount];

Attractor attractor1;

boolean showStroke = false;
float rotationX = 0 ;
float rotationY = 0 ;

float life =0;

void setup() {

  // Taille du sketch
  size(960, 640, P3D);
  pixelDensity(displayDensity());

  // Définir les couleurs possibles
  colors[0] = color(246, 196, 24);
  colors[1] = color(46, 165, 241);
  colors[2] =  color(241, 138, 46);
  colors[3] =  color(170, 57, 190);

  // Create vertexes
  for (int i=0; i<particlesCount; i++) {

    // Créer un vertex
    if (i%2 == 0) {
      particles[i] = new Triangle();
    } else {
      particles[i] = new Sphere();
    }

    int selectedColor = floor(random(0, 4));
    particles[i].c  = colors[selectedColor];
  }
  
  attractor1 = new Attractor();
  attractor1.c = color(190,40, 40);
}

void draw() {

  // Effacer l'image
  background(0);

  // Créer une lumière de base
  ambientLight(100, 100, 100);

  // Créer une lumière controlée par la souris
  pointLight(155, 155, 155, -1000, mouseY, 1000);

  //float destX = sin(life) * 100 + width/2;
  //float destY = cos(life) * 100 + height /2;

  // Mettre à jour la position des vertex
  for (int i=0; i<particlesCount; i++) {
    particles[i].update();
    particles[i].attract(attractor1.pos);
  }

  for (int i=0; i<particlesCount; i++) {
    // Affichage du vertex courant
    particles[i].display();
  }
  
  
    attractor1.display();

  life += 0.01;
}

void mousePressed() {
}

void mouseMoved() {
  attractor1.pos.set(mouseX, mouseY);
}

void keyPressed() {
}