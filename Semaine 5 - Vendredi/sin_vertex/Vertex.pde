class Vertex {

  float x;
  float y;
  float z;
  float life;
  float speed;
  float depth;

  color c;

  Vertex() {
    speed = random(0.01, 0.05);
    depth = random(10, 100);
    c = color(floor(random(0, 255)));
  }

  void update() {
    life += speed;
    z = sin(life) * depth;
  }

  void display() {
    fill(c);
    vertex(x - (width/2), y - (height/2), z);
  }
}