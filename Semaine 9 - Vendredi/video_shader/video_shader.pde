/*
 Sketch qui intègre la video et un shader.
 Utilisation de la souris en Y pour gérer le changemnet Hue.
 Démonstration qu'un video ne loop jamais vraiment en mp4.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0.1
 */


import processing.video.*;

// Variable qui contiendra la police de caractère
PFont font;

// Variable qui contiendra la vidéo
Movie movie;

// Variable qui contient le shader
PShader hueShader;

void setup() {

  // Initilisation du sketch en OpenGL (P3D)
  size(960, 540, P3D);

  // Chargement de la police de caractère
  font = loadFont("InputMono-Bold-28.vlw");

  // Load and play the video in a loop
  movie = new Movie(this, "ink.mp4");
  movie.loop();

  // Chargement du shader
  hueShader = loadShader("HueFrag.glsl", "HueVert.glsl");
}

void draw() { 

  // Effacer le skecth actuel (reset)
  background(0);

  // Afficher le video
  image(movie, 0, 0, width, height);

  // Nouvelle valeur de Hue au shader
  float hue = (float(mouseY) / height) * TWO_PI;
  hueShader.set("hue", hue);
  hueShader.set("time", millis());

  // Applique le shader
  shader(hueShader);

  // Afficher le framerate (à garder en fin de sketch)
  fill(255);
  textAlign(LEFT, TOP);
  textMode(MODEL);
  text(frameRate, 10, 10);

  // Affiche le Hue
  text("HUE : " + (hue / TWO_PI), 10, 30);
}

void movieEvent(Movie m) {
  m.read();
}