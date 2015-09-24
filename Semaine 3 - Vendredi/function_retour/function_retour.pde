/*
 xxx
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0b5
*/


long lastClick = 0;

void setup() {
  size(600,600);
}

void draw() {
  
  if(isClickLong()) {
    background(200);
  } else  {
    background(75);
  }
 }


// Fonction  
boolean isClickLong() {
  if(millis() - lastClick > 2000) && mousePressed ) {
    return true;
  } else {
    return false;
  }
}


void mousePressed() {
  
  // Enregistre le temps actuelle dans la variable lastClick
  lastClick = millis();
}