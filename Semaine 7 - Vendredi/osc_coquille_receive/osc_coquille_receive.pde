/*
 Coquille pour réception de données OSC.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
 */
 
// Importer la librairie OSC
import oscP5.*;

// Déclarer l'objet de la librairie
OscP5 oscP5;

void setup() {

  // Taille du sketch
  size(400, 400);

  // Initialisation de la librarie OSC, et définission du port d'écoute
  oscP5 = new OscP5(this, 3333);
}

void draw() {
}

// Fonction appelée lorsque 
void oscEvent(OscMessage theOscMessage) {

  String adress = theOscMessage.addrPattern();

  // println("### received an osc message.");
  // println(" addrpattern: " + adress);
  // println(" typetag: "+theOscMessage.typetag());

  if (adress.equals("/bangs")) {
    println("Bang received.");
  } 
  else if (adress.equals("/curves")) {
    float value = theOscMessage.get(0).floatValue();
    println("Curves received, value is : " + value);
  }
  else if (adress.equals("/switches")) {
    int value = theOscMessage.get(0).intValue();
    println("Switches received, value is : " + value);
  }
  else if (adress.equals("/flags")) {
    String value = theOscMessage.get(0).stringValue();
    println("Flags received, value is : " + value);
  }
  else if (adress.equals("/colors")) {
    int red = theOscMessage.get(0).intValue();
    int green = theOscMessage.get(1).intValue();
    int blue = theOscMessage.get(2).intValue();
    println("Colors received, value is : " + red + ", "+ green + ", " + blue);
  }
  else if (adress.equals("/audio")) {
    float freq[] = new float[160]; 
    float average = 0;  
    for (int i=0; i<160; i++) {
      freq[i] = theOscMessage.get(i).floatValue();
      average += freq[i];
    }
    average = average/160.0;    
    println("Audio received, average of : " + average);
  }
}