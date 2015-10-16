class Button {
  
  int x;
  int y;
  
  color color1 = color(200, 100, 100);
  color color2 = color(100, 150, 150);
  
  float s;
  float life;

  Button() {
    
    x = floor(random(0, width));
    y = floor(random(0, height));
  }
  
  void display() {    
    float oscillation = sin(life)/2 + 0.5;
    color actualColor = lerpColor(color1, color2, oscillation);
    fill(actualColor);
    
    life+=0.01;
  }
  
  boolean isClicked() {
    println("isClicked() de Button");
    return false;
  }
  
}