/*
 Sketch simple pour afficher le framerate 
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0.1
 */


import processing.video.*;

// Variable qui contiendra la police de caractère
PFont font;

// Variable qui contiendra la vidéo
Movie movie;

void setup() {

  // Initilisation du sketch en OpenGL (P3D)
  size(960, 540, P3D);
  
  // Chargement de la police de caractère
  font = loadFont("InputMono-Bold-28.vlw");

  // Charger le video et lecture en boucle
  movie = new Movie(this, "ink.mp4");
  movie.loop();
}

void draw() { 

  // Effacer le skecth actuel (reset)
  background(0);
  
  // Afficher le video
  image(movie, 0, 0, width, height);
  
  // Afficher le framerate (à garder en fin de sketch)
  fill(255);
  textAlign(LEFT, TOP);
  textMode(MODEL);
  text(frameRate, 10,10);
  
}

void movieEvent(Movie m) {
  
  // Lecture du video lorsqu'un nouveau frame est disponible
  m.read();
}