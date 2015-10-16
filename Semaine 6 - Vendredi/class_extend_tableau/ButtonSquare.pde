class ButtonSquare extends Button {
  
  ButtonSquare() {
    s = 100;    
    color1 = color(0, 255,255);
  }
  
  void display() {
    fill(255);
    super.display();
    rectMode(CENTER);
    rect(x,y,s,s);
  }
  
  boolean isClicked() {
     if( mouseX < x + s/2 && mouseX > x - s/2 && mouseY > y - s/2 && mouseY < y+s/2 && mousePressed) {
       return true;
     }  else {
       return false;
    }
  }
  
  void special() {
    println("N'importe quoi");
  }
  

}