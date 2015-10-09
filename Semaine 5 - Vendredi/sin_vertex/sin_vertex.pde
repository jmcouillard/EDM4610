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
int grid = 10;
int vertexCount = grid * grid;

// Tableau de vertexes
Vertex[] vertexes = new Vertex[vertexCount];

boolean showStroke = false;
float rotationX = 0 ;
float rotationY = 0 ;

void setup() {

  // Taille du sketch
  size(960, 640, P3D);

  // Définir les couleurs possibles
  colors[0] = color(246, 196, 24);
  colors[1] = color(46, 165, 241);
  colors[2] =  color(241, 138, 46);
  colors[3] =  color(170, 57, 190);

  // Create vertexes
  for (int i=0; i<vertexCount; i++) {

    // Créer un vertex
    vertexes[i] = new Vertex();

    // Dféinir la position du vertex
    vertexes[i].x  = (i % grid) * (width / (grid-1));
    vertexes[i].y  = (floor(i / grid)) * (height / (grid-1));

    // Définir la couleur de chaque vertex
    int selectedColor = floor(random(0, 4));
    vertexes[i].c  = colors[selectedColor];
  }
}

void draw() {

  // Effacer l'image
  background(0);

  // Créer une lumière de base
  ambientLight(100, 100, 100);

  // Créer une lumière controlée par la souris
  pointLight(155, 155, 155, mouseX, mouseY, 1000);

  // Afficher ou non le les contours  (wireframe)
  if (showStroke) {
    stroke(0);
  } else {
    noStroke();
  }

  // Mettre à jour la position des vertex
  for (int i=0; i<vertexCount-10; i++) {
    vertexes[i].update();
  }

  // Rotation, translation et matrice de transformation
  pushMatrix();
  translate(width/2, height /2);
  rotateY(rotationY);
  rotateX(rotationX);

  // Afficher les vertex 
  beginShape(QUAD_STRIP);
  for (int i=0; i<vertexCount-grid; i++) {
    if (i % grid == 0) {
      endShape();
      beginShape(QUAD_STRIP);
    }

    // Affichage du vertex courant
    vertexes[i].display();

    // Affichage du vertex de la ligne suivante
    vertexes[i+grid].display();
  }
  endShape();

  // Rétablir la matrice de transformation
  popMatrix();
}

void mousePressed() {
  // Invereser l'affichage des contours selon le clique de la souris
  showStroke = !showStroke;
}

void keyPressed() {

  // Augmenter/diminuer la rotation avec les flèches UP/DOWN
  if (keyCode == 38) {
    rotationX += 0.1;
  } else if (keyCode == 40) {
    rotationX -= 0.1;
  } else if (keyCode == 37) {
    rotationY -= 0.1;
  } else if (keyCode == 39) {
    rotationY += 0.1;
  }
}