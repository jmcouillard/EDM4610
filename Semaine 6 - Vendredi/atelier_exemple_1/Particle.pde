class Particle {
  
  PVector initialPos;
  PVector pos;
  PVector dest;
  PVector rotation;
  color c = color(0,0,0,0);
  float resistance = 1;
  float size = 1;
  
  Particle() {
    initialPos = new PVector(random(0,width), random(0,height));
    pos = initialPos.copy();
    dest = new PVector();
    rotation = new PVector(random(0,TWO_PI), random(0,TWO_PI));
    resistance = random(0.05, 0.5);
    size = random(0.15, 1.5);
  }
  
  void update() {
    rotation.x += 0.01 * resistance;
    
    //PVector displacement = PVector.sub(dest, pos).mult(0.01).mult(resistance);
    //pos.add(displacement);
  }
  
  void attract(PVector attractorPos) {
    PVector dist = PVector.sub(pos, attractorPos);
    float repulseForce = constrain(100- dist.mag(), 0, 100)  / 100;

    dist.normalize();
    dist.mult(repulseForce);
    

    //vel.add(dist);
    
    //dist.mult(0.01).mult(resistance);
    pos.add(dist);
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y);
    scale(size);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    this.displayCustom();
    popMatrix();
  }
  
  void displayCustom(){
  }
}