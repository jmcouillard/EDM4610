
// Le tableau qui contient les images
Loader loader;

int threshold = 100;
int framesTotal = 421;

float timehead = 0;
int prevFrame = 0;
int currentFrame = 0;
float speed  = 0;
int frameDrop = 0;


void setup() {
  size(720, 404, P3D);
  frameRate(24);

  // Init image loader
  loader = new Loader(this,  threshold, framesTotal);
  loader.setUpdateDelay(1);
  loader.start();
}

void draw() { 
  
  // Effacer le skecth actuel (reset)
  background(0, 0, 0, 0);

  //int currentFrame = floor(millis()/1000.0 * 30);
  currentFrame  = floor(timehead);
  loader.setFrame(currentFrame);

  // Dessiner une image de papillon, en utilisant un modulo et framcount
  if (loader.get(currentFrame) != null) {
    image(loader.get(currentFrame), 0, 0);
    prevFrame = currentFrame;
  } else if (loader.get(prevFrame) != null) {
    image(loader.get(prevFrame), 0, 0);
    frameDrop ++;
  }
  
  // Update timehead
  if (loader.ready()) {
    speed = (mouseX - width/2) / 100.0;
    timehead += speed;
    timehead = timehead % (framesTotal-1);
    if(timehead < 0) {
      timehead = framesTotal -1 ;
    }
  }
  
  // Show details
  textSize(12);
  text("speed " + speed,40,40);
  text("frame drop " + frameDrop,40,60);
  text("loader health " + loader.getHealth(),40,80);
}


String fixedDigits(int value) { 

  if (value < 10) {
    return "0000" + value;
  } else  if (value < 100) {
    return "000" + value;
  } else  if (value < 1000) {
    return "00" + value;
  } else  if (value < 10000) {
    return "0" + value;
  } else {
    return Integer.toString(value);
  }
}