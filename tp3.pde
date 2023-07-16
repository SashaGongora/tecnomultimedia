//https://youtu.be/59dXfqr2V5c
//Sasha Gongora - leg. 91425/4
//tocar el titulo "dracula" para iniciar y para re hacerlo tocar la barra espaciadora :D
int estado, d;
int c = 14;
int ach= 147;
int alt= 62;
String textoend;
PImage[] pantallas =  new PImage[c];
PImage mouse;
String[] textos = new String[c];
String[] botones = new String[c+1];
boolean botonstart, boton1, boton2, botonfin, botondesig;
PFont fuenteNueva;
void setup() {
  size( 600, 600 );
  background(0);
  estado = 0;
  d= 500;
  mouse= loadImage("mouse.png");
  fuenteNueva = loadFont("Perpetua-48.vlw");
  textFont(fuenteNueva, 20);


  //imagenes y textos y botones con for con arreglo
  for ( int i = 0; i < c; i++ ) {
    pantallas[i] = loadImage( "data/pantalla" + i + ".png" );
  }
  textos = loadStrings("textos.txt");
  for ( int a = 0; a < c; a++ ) {
  }
  botones = loadStrings("botones.txt");
  for ( int b = 0; b < c+2; b++ ) {
  }
}
void draw() {
  botonstart= (mouseX > 100 && mouseY > 116 && mouseX < 500 && mouseY <200);
  boton1= (mouseX > 43 && mouseY > 522 && mouseX < 190 && mouseY < 584);
  boton2=(mouseX > 420 && mouseY > 523 && mouseX < 567 && mouseY < 585);
  botonfin=(mouseX > 164 && mouseY > 525 && mouseX < 402 && mouseY < 582);
  botondesig=(mouseX > 117 && mouseY > 520 && mouseX < 485 && mouseY < 578);

  println(estado);
  
  switch(estado) {
  case 0:
    image( pantallas[0], 0, 0 );
    break;

  case 1:
    image( pantallas[1], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 20, 600, 148);
    ajustesdetextos(estado, 300);
    text(textos[1], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 170, 567);//A
    break;

  case 2:
    image( pantallas[2], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 18, 600, 148);
    ajustesdetextos(d, 300);
    text(textos[2], 25, 32, 560, 200);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 170, 567);//A
    break;

  case 3:
    image( pantallas[3], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 148);
    ajustesdetextos(estado, 300);
    text(textos[3], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[3], 46, 540, 170, 567);//A
    text(botones[2], 423, 540, 520, 520);//B
    break;

  case 4:
    image( pantallas[4], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 148);
    ajustesdetextos(estado, 300);
    text(textos[4], 25, 32, 560, 160);
    ajustesdebotones(estado, 500);
    text(botones[4], 250, 540, 600, 600);//retry
    break;

  case 5:
    image( pantallas[5], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 148);
    ajustesdetextos(estado, 300);
    text(textos[5], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 600, 600);//sig
    break;

  case 6:
    image( pantallas[6], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 168);
    ajustesdetextos(estado, 300);
    text(textos[6], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 600, 600);//fin
    break;
    
  case 7:
    image( pantallas[7], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 148);
    ajustesdetextos(estado, 300);
    text(textos[7], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 520, 520);//B
    break;

  case 8:
    image( pantallas[8], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 178);
    ajustesdetextos(estado, 300);
    text(textos[8], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 170, 567);//A
    break;

  case 9:
    image( pantallas[9], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 178);
    ajustesdetextos(estado, 300);
    text(textos[9], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[5], 423, 540, 520, 520);//A
    text(botones[6], 46, 540, 170, 567);//b
    break;

  case 10:
    image( pantallas[10], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 178);
    ajustesdetextos(estado, 300);
    text(textos[11], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[1], 250, 540, 170, 567);//A
    break;

  case 11:
    image( pantallas[11], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 178);
    ajustesdetextos(estado, 300);
    text(textos[10], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[4], 250, 540, 170, 567);//A
    break;

  case 12:
    image( pantallas[12], 0, 0 );
    noStroke();
    fill(255, 170);
    rect(0, 15, 600, 158);

    ajustesdetextos(estado, 300);
    text(textos[12], 25, 32, 560, 160);
    ajustesdebotones(estado, 300);
    text(botones[7], 250, 540, 170, 567);//A
    break;

    // creditos
  case 13:
    image( pantallas[13], 0, 0 );
    break;
  }
}
//Botones
void mouseClicked() {

  if ( estado == 0 && botonstart) {
    estado = 1;
  } else if ( estado == 1) {
    if (botondesig) {
      estado = 2;
    }
  } else if  ( estado == 2) {
    if (botondesig) {
      estado = 3;
    }
  } else if  ( estado == 3) {
    if (boton1) {
      estado = 4;
    }
    if (boton2) {
      estado = 5;
    }
  } else if  ( estado == 4) {
    if (botonfin) {
      estado = 0;
    }
  } else if  ( estado == 5) {
    if (botondesig) {
      estado = 6;
    }
  } else if  ( estado == 6) {
    if (botondesig) {
      estado = 7;
    }
  } else if  ( estado == 7) {
    if (botondesig) {
      estado = 8;
    }
  } else if  ( estado == 8) {
    if (botondesig) {
      estado = 9;
    }
  } else if  ( estado == 9) {
    if (boton1) {
      estado = 10;
    }
    if (boton2) {
      estado = 11;
    }
  } else if  ( estado == 10) {
    if (botondesig) {
      estado = 12;
    }
  } else if  ( estado == 11) {
    if (botonfin) {
      estado = 0;
    }
  } else if  ( estado == 12) {
    if (botondesig) {
      estado = 13;
    }
  }
}

void keyPressed() {
  if ( key == ' ') {
    reiniciar();
  }
}

void mousePressed() {
  if ( estado == 12 && botoncreditos(400, 500, 150) ) { //va del fin del juego a los creditos
    estado = 13;
  }
  if ( estado == 13&& botoncreditos(550, 550, 70) ) { //vuelve de los creditos al fin del juego
    estado = 12;
  }
}

void mouseMoved() {
  image(mouse, mouseX, mouseY);
}

void ajustesdetextos(int d, int t) {
  textSize(20.5);
  textAlign(LEFT, UP);
  fill(0);
}
void ajustesdebotones(int d, int t) {
  //textFont(tipografia);
  textSize(30);
  textAlign(LEFT, UP);
  fill(255);
}
//reinicar
void reiniciar() {
  estado= 0;
}

boolean botoncreditos( int x, int y, int s ) {
  return dist(mouseX, mouseY, x, y) <= s;
}
