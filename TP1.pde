// TP1 
//Gongora, Sasha 
// tocar "p" para iniciar musica, tocar "s" para detenerla
int miVariable;
String texto, texto2, texto3, texto4, texto5, texto5a, texto6, texto6a, texto7, texto7a, texto8, texto8a, texto9, texto9a, texto10, tex;
PImage poliArrodillado;
PImage Martillo;
PImage chris;
PImage mariska;
PImage periodico;
PImage all;
PFont fuenteNueva;
int Titulo;
import ddf.minim.*;
Minim soundengine;
AudioSample sonido1;


void setup() {
  size(800, 500);
  background(20);
  textSize(50);
  miVariable = 100;
  soundengine = new Minim(this);
  sonido1= soundengine.loadSample("LawOrderTheme.wav");
  texto= "LAW AND ORDER";
  texto2= "LAW AND ORDER";
  texto3= "SPECIAL VICTIMS UNITY";
  texto4= "SPECIAL VICTIMS UNITY";
  texto5= "MARISKA HARGITAY";
  texto6= "Staring\nCHISTOPHER MELONI";
  texto7= "Co-Producer \n DANIEL BACKHEIM";
  texto8= "Casting by \n JONATHAN STRAUSS \n Lynn Kressel Casting";
  texto9= "Story Editor\n MICK BETANCOURT";
  texto10="With\n ANTU YACOB         Ida Jallow\n JESSICA PIMENTEL     Joanne Suarez\n OWEN CAMPBELL     P.C Garcia\n TOM LUCCA     Dc. nee Tommy";
  
  poliArrodillado = loadImage("3poliarrodillado.jpeg");
  poliArrodillado.resize(500, 300);
  Martillo= loadImage("martillo.png");
  mariska = loadImage("9mariska.jpeg");
  mariska.resize(500, 300);
  chris = loadImage("6chris.jpeg");
  chris.resize(500, 300);
  periodico= loadImage("4periodico.jpeg");
  periodico.resize(800, 500);
  all= loadImage("21all.jpeg");
  all.resize(500, 300);
  
  fuenteNueva = loadFont("Perpetua-48.vlw");
  textFont(fuenteNueva, 15);
  strokeWeight(50);
  stroke(255);
  noCursor();
  frameRate(100);
}
void draw() {
  miVariable = frameCount;
  background(0);
  image(periodico, 3, 2400/miVariable);
  image(mariska, 2, 1400-miVariable);
  image(chris, 1, 1800-miVariable);
  image(poliArrodillado, 2, 2200-miVariable);
  image(all, 2, 2600-miVariable);

  //titulo
  textSize(80);
  fill (245, 7, 7);
  text(texto, 11, 1000-miVariable);
  fill(255);
  text(texto2, 14, 1000-miVariable);
  fill(255, 146, 44);
  textSize(76);
  text(texto3, 9, 1200-miVariable);
  fill(242, 255, 64);
  text(texto4, 12, 1200-miVariable);

  // creditos
  textSize(33);
  fill(63, 41, 155);
  text(texto5, 510, 1500-miVariable);
  fill(255);
  text(texto5, 513, 1500-miVariable);
  fill(63, 41, 155);
  text(texto6, 500, 1900-miVariable);
  fill(255);
  text(texto6, 498, 1900-miVariable);
  textSize(30);
  fill(63, 41, 155);
  text(texto7, 500, 2220-miVariable);
  fill(255);
  text(texto7, 503, 2220-miVariable);
  textSize(33);
  fill(63, 41, 155);
  text(texto8, 500, 2320-miVariable);
  fill(255);
  text(texto8, 503, 2320-miVariable);
  fill(63, 41, 155);
  text(texto9, 500, 2420-miVariable);
  fill(255);
  text(texto9, 503, 2420-miVariable);
  fill(63, 41, 155);
  text(texto10, 503, 2520-miVariable);


  println(frameCount);
  //4865
}
//musica
void keyPressed() {
  if (key=='p') { 
    sonido1.trigger();
  }
  if (key=='s') {
    sonido1.stop();
  }
}
void mouseMoved() {
  image(Martillo, mouseX, mouseY);
}
