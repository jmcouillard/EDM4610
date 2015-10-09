class Repulsor {

  PVector pos;
  float force;

  float size;
  float life;

  Repulsor() {
    pos = new PVector();
    size = 100;
  }

  void display() {
    fill(255, 100, 100, 30);
    stroke(255, 100, 100, 80);

    // Oscillateur pour faire varier la taille en sin
    float osc = sin(life) *0.5 + 0.5;

    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    scale(osc* 0.1 + 1);
    ellipse(0, 0, size, size);
    popMatrix();

    life += 0.1;
  }
}