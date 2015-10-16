
ButtonSquare button1;
ButtonCirc button2;

Button[] buttons;
int buttonsCount = 10;

void setup() {
  size(600, 600);
  
  buttons = new Button[buttonsCount];
  for(int i=0; i<buttonsCount; i++) {
    
    if(i%3 == 0) {
      buttons[i] = new ButtonSquare();
    } else if(i%3 == 1) {
      buttons[i] = new ButtonRect();
    } else {
      buttons[i] = new ButtonCirc();
    }
    
  }
  
  buttons[0].x = 0;
  buttons[0].y = 0;
  buttons[0].color1 = color(255,0,0);
  buttons[0].color2 = color(255,0,0);
  
}


void draw() {
  //button1.display();
  //button2.display();
  
  //if(button1.isClicked()) {
  //  button1.s += 1;
  //}
  
  for(int i=0; i<buttonsCount; i++) {
    buttons[i].display();
    
    if(buttons[i].isClicked()) {
      buttons[i].s += 1;
    }
  }

  //if (button2.isClicked()) {
  //  button2.s += 1;
  //}
}