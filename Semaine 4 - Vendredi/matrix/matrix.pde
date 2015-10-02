/*
 Exemple d'utilisation des matrices de transformations.
 Utilisation de la souris pour bouger la scène.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */


int count = 50;
Carre[] carres;

void setup() {
  size(960, 540, P3D);

  // Créer le tableau
  carres = new Carre[count];

  // Instancier les 50 carrées
  for (int i = 0; i < count; i++) {
    float size = random(10, 100);
    carres[i] = new Carre(size);
  }
}

void draw() {

  // Effacer le frame
  background(127);

  // Créer une matrice de transformation
  pushMatrix();
  
  // Appliquer une translation
  translate(width/2-mouseX, 0);

  // Afficher les carrées
  for (int i=0; i<count; i++) {
    carres[i].display();
  }

  popMatrix();
}