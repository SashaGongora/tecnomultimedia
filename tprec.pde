//https://youtu.be/cPxNYLt-0IE
//Gongora Sasha 91425/4
//tprec ART OPT
//tocar "c" para cambiar de color, "r" para resetear y volver al blanco y negro
//(en caso de no funcionar a la primera clickee dentro del programa q esta corriendo y vuelva a intentar)
PImage base;
color c =color(255, 90);
color c2 = color( 0, 0, 0, 100);
int _ancho;
int ancho;
int centro;
int _centro;


void setup () {
  size (800, 400);
  base= loadImage("base.png");
}

void draw () {
  push();
  translate (width-200, height/2);
  float distMax = dist(0, 0, width-200, height/2 );
  float hue= map(width-200, 0, distMax, 0, 359);

  lineas();

  //Circulos
  for (int R=0; R<360; R+=20) {
    stroke(random(hue));
    pushMatrix();
    strokeWeight(2);
    rotate (radians (R));
    fill (c);
    circle (mouseY, mouseX, 80);
    popMatrix();
  }

  cuadrados(35);
  boolean Derecha = mouseDerecha(width/2);
  fill(0);
  println( "Derecha: " + Derecha);
  pop();
  image(base, 0, 0);
}

void keyPressed () {
  if (key == 'R' || key == 'r' ) {
    background (160);
    c = color(255, 90);
    println ("¡reseteaste correctamente, sos re capo!");
  } else if (key== 'C' || key == 'c' ) {
    c = color(random(255), random(255), random(255));
  }
}

void cuadrados(int _ancho) {
  ancho = _ancho;
  for (int R=0; R<360; R+=40) {
    for (int x=0; x<360; x+=40) {
      pushMatrix();
      rotate (radians (R));
      stroke(0, 50);
      strokeWeight (0.5);
      fill (c, 50);
      rect (mouseY, mouseX, ancho, 40);
      popMatrix();
    }
  }
}
void lineas() {
  for (int R=0; R<360; R+=20) {
    pushMatrix();
    rotate (radians (R));
    {
      stroke(0, 50);
      strokeWeight (0.5);
      line (0, 0, mouseX, mouseY);
    }
    popMatrix();
  }
}
boolean mouseDerecha(int _centro) {
  centro = _centro;
  if ( mouseX >= centro ) {
    return true;
  } else {
    return false;
  }
}
