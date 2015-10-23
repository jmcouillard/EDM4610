/*
 Réception de données OSC.
 Conçu pour être utilisé avec le layout Beatmachine à la "page" 3 de TouchOSC.
 http://hexler.net/software/touchosc
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/

import netP5.*;
import oscP5.*;

OscP5 osc;

int r = 100;
int g = 100;
int b = 100;

void setup() {
  size(600,600);
  osc = new OscP5(this, 3333); 
}

void draw() {
  background(r,g,b);
}

void oscEvent(OscMessage message) {
  
  String addr = message.addrPattern();
  float value = message.get(0).floatValue();
  
  if(addr.equals("/3/rotary4")) {
    r = floor(value * 255);
  } else if(addr.equals("/3/rotary1")) {
    g = floor(value * 255);
  } else if(addr.equals("/3/rotary5")) {
    b = floor(value * 255);
  }
  
  
  println(addr + " : " + value);
}