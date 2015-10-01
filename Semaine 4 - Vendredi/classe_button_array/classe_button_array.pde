Button[] buttons;

void setup() {
  size(960, 540);

  // Création d'un tableau de boutons
  buttons = new Button[5];

  // Création d'une instance de Carre

  for (int i=0; i<5; i++) {
    buttons[i] = new Button(50.0);
    buttons[i].x = random(0, 960);
    buttons[i].y = random(0, 540);
  }
}

void draw() {

  for (int i=0; i<5; i++) {
    buttons[i].draw();
    if (buttons[i].isClicked()) {
      println("Bouton " + i + " pressé!");
    }
  }
}

