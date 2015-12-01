import java.util.concurrent.ConcurrentHashMap;

public class Loader extends Thread {

  private PApplet p;
  private ConcurrentHashMap<Integer, PImage> imgs;
  private int threshold;
  private int framesTotal;

  private boolean stop = false;
  private int currentFrame = 0;
  private int updateDelay = 20;
  private float health = 0;

  public Loader(PApplet p, int threshold, int framesTotal) {
    this.p = p;
    this.imgs = new ConcurrentHashMap<Integer, PImage>();
    this.threshold = threshold;
    this.framesTotal = framesTotal;
  }

  public void run() {

    while (!stop) {

      int found = 0;

      // Chargement des images
      for (int i=0; i<threshold; i++) {
        int frame = (i + currentFrame - (threshold/2)) % framesTotal;
        if (frame < 0) {
          // Loop at end
          frame = framesTotal + frame;
        }
        
        if (!imgs.containsKey(frame)) {
          imgs.put(frame, p.loadImage("Sequence 1 "+fixedDigits(frame+1)+".jpg"));
          //System.out.println("Loaded " + frame);
        } else {
          found++;
          //System.out.println("Already exists " + frame);
        }
      }

      clean();

      health = (float)found / threshold;

      // Sleep
      try {
        sleep(updateDelay);
      } 
      catch (InterruptedException e) {
      }
    }
  }

  public PImage get(int key) {
    return imgs.get(key);
  }

  public void clean() {

    for (Integer key : imgs.keySet ()) {
      if (key < currentFrame - threshold) {

        PImage img = imgs.get(key);
        img = null;
        imgs.remove(key);
        // System.out.println("Key " + key + " needs to be disposed");
      }
    }
  }

  public void setFrame(int frame) {
    this.currentFrame = frame;
  }

  public boolean ready() {
    return imgs.size() > threshold/2;
  }

  public float getHealth() {
    return health;
  }

  public void setUpdateDelay(int val) {
    updateDelay = val;
  }
}