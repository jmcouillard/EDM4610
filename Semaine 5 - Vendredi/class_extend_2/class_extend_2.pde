
// Variables pour les pousses
Pousse[] pousses;
int current = 0;
int last = 0;

void setup() {

  // Taille du sketch
  size(960, 540, P3D);

  // Nouveau tableau de pousse
  pousses = new Pousse[100];

  // Déclaration de chacune des pousses
  for (int i=0; i<pousses.length; i++) {
    if (i%3 == 1) pousses[i] = new Pousse();
    else if (i%3 == 2) pousses[i] = new SunFlower();
    else pousses[i] = new Flower();
    pousses[i].x = random(0, width);
    pousses[i].y = height;
  }
}

void draw() {
  
  // Forcer le retour à Un blend mode normal
  blendMode(BLEND);

  // Fond de couleurs et texture
  background(0);

  // Dessiner les pousses
  for (int i=0; i<pousses.length; i++) {
    pousses[i].draw();
  }

  // Déclancher une nouvelle pousse à toutes les secondes
  if (millis() - last > 1000 && current<pousses.length) {    
    pousses[current].startGrow(); 
    current ++;
    last = millis();
  }
}

void mouseMoved() {

  // Appeler mousePressed() sur toutes les pousses
  for (int i=0; i<pousses.length; i++) {
    pousses[i].mouseMoved();
  }
}

