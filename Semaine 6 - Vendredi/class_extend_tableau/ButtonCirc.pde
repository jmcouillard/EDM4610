class ButtonCirc extends Button {
  
  ButtonCirc() {
    s = 20;
  }
  
  void display() {
    fill(255);
    super.display();
    ellipse(x,y,s,s);
  }
  
  boolean isClicked() {
    float dist = dist(x,y,mouseX,mouseY);
    if(dist < s/2 && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
  
}