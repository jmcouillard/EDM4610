class Triangle extends Particle  {
  
  Triangle() {
  }
  
  void displayCustom(){
    
    // Triangle
    noStroke();
    beginShape();
    fill(c);
    vertex(0, -20);
    vertex(-20, 20);
    fill(lerpColor(c, color(0), 0.5));
    vertex(20, 20);
    endShape();
  }
}