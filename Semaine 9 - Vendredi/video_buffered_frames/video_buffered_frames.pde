/*
 Chargement des frames d'un vidéo en mémoire.
 Affichage du frame désiré à l'aide de la souris
 À noter qu'encore plus d'optimisation peut-être nécessaire,
 comme la mémoire est très sollicitée avec cette technique.
 
 Auteur : Jean-Maxime Couillard
 Licence : 
 Syntaxe : Processing version 3.0.1
 */

import processing.video.*;
import org.gstreamer.Bus;
import org.gstreamer.GstObject;

// Variable qui contiendra la police de caractère
PFont font;

// Variable qui contiendra la vidéo
Movie movie;

// Tableau d'images qui contient les frames du video
PImage frames[];
int loadedFrames = 0;
int totalFrames = 0;

void setup() {

  // Initilisation du sketch en OpenGL (P3D)
  size(960, 540, P3D);

  // Chargement de la police de caractère
  font = loadFont("InputMono-Bold-28.vlw");

  // Chergement et lecture du video
  movie = new Movie(this, "ink.mp4");
  movie.play();

  // Ajoute une fonction à exécuter en fin de vidéo (end of stream)
  Bus bus = movie.playbin.getBus();
  bus.connect(new Bus.EOS() {
    public void endOfStream(GstObject element) {
      movieEOSEvent();
    }
  });
  
}

void draw() { 

  // Effacer le skecth actuel (reset)
  background(0);

  // Execute la fonction sur le premier frame
  if (totalFrames == 0) {
    videoLoaded() ;
  }

  // Affiche un frame à partir du tableau
  int frameToGet = floor((float(mouseX) / width) * totalFrames);
  if (loadedFrames > 1) {
    image(getNearestLoadedFrame(frameToGet), 0, 0, width, height);
  }

  // Enregistre le frame lu par l'objet movie dans le tableau
  if (frames[getCurrentFrame()] == null) {
    frames[getCurrentFrame()] = movie.copy();
    loadedFrames ++;
  }

  // Afficher le framerate (à garder en fin de sketch)
  fill(255);
  textAlign(LEFT, TOP);
  textMode(MODEL);
  text(frameRate, 10, 10);

  // Show loaded frames
  text("Loaded frames : "  + loadedFrames + " / " + totalFrames, 10, 30);
}

// Fonction qui retourne un frame chargé le plus près possible de celui demandé
PImage getNearestLoadedFrame(int frame) {

  if (frames[frame] != null) {
    return frames[frame];
  } else {
    for (int i = 0; i< totalFrames; i++) {
      if ((frame - i) > 0 && frames[frame - i] != null) {
        return frames[frame - i];
      } else if ((frame + i) < totalFrames && frames[frame + i] != null) {
        return frames[frame + i];
      }
    }
  }

  return null;
}  

// Calcul du frame actuel (basé sur le temps)
int getCurrentFrame() {
 float percent = movie.time() / movie.duration();
 return floor(constrain(percent, 0, 0.999) * totalFrames);
}  

// Function appelé lors du chargement du premier frame
void videoLoaded() {
  totalFrames = floor(movie.duration() * movie.frameRate); 
  frames = new PImage[totalFrames];
  movie.jump(0);
  movie.play();
}

// Function appelé automatiquement lors du chargement de chaque frame
void movieEvent(Movie m) {
  m.read();
}

// Function appelé à la fin du vidéo
void movieEOSEvent() {
  
  println("Fin du video");
  
  if(totalFrames != loadedFrames) {
    // Facultatif : rejouer le video pour charger toutes les images
    movie.speed(0.2);
    movie.jump(0);
    movie.play();
  }
}