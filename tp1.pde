// Tp1
//Gongora sasha
//tocar el cascabel del logo para empezar y para reiniciar el todo el logo del medio :D
String estado;
int c; //contador
int x = 10 ;
int a = 10 ;
int vel = 1;
PImage puppyMouse;
PImage puppyMouse2;
PImage Logo;
PImage Logoend;
PFont fuenteNueva;
PImage PantallaFinal;
PImage MenuScreen;
PImage PantallaIntro;
PImage segunda;
PImage Ptercera;
PImage Cuarto;

void setup() {
  size( 640, 480 );
  textSize( 40 );
  fill(0);
  noStroke();
  estado = "menu";
  fuenteNueva = loadFont("Perpetua-48.vlw");
  textFont(fuenteNueva, 25);
  puppyMouse= loadImage("puppy3.png");
  puppyMouse2= loadImage("puppy4.png");
  Logo= loadImage("Bee_and_PuppyCat_logo.png");
  MenuScreen= loadImage("menu.jpg");
  PantallaIntro = loadImage("aaa.png");
  segunda= loadImage("intro2.png");
  Ptercera= loadImage("pantalla3.png");
  Cuarto = loadImage("bee.png");
  Logoend = loadImage("endbutton.png");
  PantallaFinal = loadImage("end.png");
  frameRate( 60 );
}

void draw() {
  //menu
  if ( estado.equals("menu") ) {
    background(MenuScreen);
    image(Logo, width/27, height/9*2);
    // circle( width/3.2, height/1.37, 70 ); guia para el cascabel del logo

    //pantalla1
  } else if (estado.equals("p1") ) {
    background(PantallaIntro);
    text( "Hola!\nEste es Puppycat!!, uno de los personajes principales\nen la serie que lleva su nombre, Bee and Puppycat.", x, height/1.30);
    if ( x < 100 ) {
      x++;
    }
    c++;  //suma 1 per frame
    if ( c >= 400 ) {  // 60fps * 10seg = 600
      estado = "p2";
      c = 0;
      x=0;
    }
    //pantalla2
  } else if (estado.equals("p2") ) {
    background(segunda);
    text("Puppycat es una cruza de gato y perro\nde color blanco, con cejas, orejas, patas, y cola de color\n marrón claro.", x, height/6);
    text( "Lleva un collar color rosa con una cascabel dorado colgando,\nde complexión regordeta y patas cortas que lo hacen lento\n al correr.", x, height/1.30);
    if ( x < 40) {
      x++;
    }
    c++;  //suma 1 per frame
    if ( c >= 600 ) {  // 60fps * 5seg = 300
      estado = "p3";
      c = 0;
      
    }
    //pantalla3
  } else if (estado.equals("p3") ) {
    background(Ptercera);
    text("Su relación con bee es muy parecida a la de compañeros de\ncuarto(porque odia ser considerado mascota).", a, height/7.50);
    text( "Y aunque algunas veces es algo\nrudo con ella, el de verdad se preocupa por ella.", a, 440);
    if ( a < 90) {
      a++;
      
    }
    c++;  //suma 1 per frame
    if ( c >= 600 ) {  // 60fps * 5seg = 300
      estado = "p4";
      c = 0;
    }
    //pantalla4
  } else if (estado.equals("p4") ) {
    background(Cuarto);
    text("Puppycat es bien tratado por Bee y Disfrutan ver TV juntos.", x, height/7.50);
    text( "Y aunque algunos detalles de ella le molesten aprecia\nmucho su amabilidad.", x, 420);
    if ( x < 100) {
      x++;
    }
    c++;  //suma 1 per frame
    if ( c >= 600 ) {  // 60fps * 5seg = 300
      estado = "pfin";
      c = 0;  //RESET DE VARIABLE CONTADOR
    }
    //pantallafinal
  } else if (estado.equals("pfin") ) {
    background(PantallaFinal);
    //circle(width/2, height/2, 240);
    image(Logoend, width/3.70, height/9*2);
    text( "Gracias por ver!!", a, height/5);
      if ( a < 250) {
      a++;
    }
   
    //
  } else {
    text( "no es ningun \n estado preseteado", width/2, height/2 );
    //si no es ninguna de las condiciones anteriores,
    //entonces ejecuta este bloque de codigo
  }
  println( estado );
}
void mouseMoved() {
  image(puppyMouse, mouseX, mouseY);
}
void mousePressed() {
  // circle( width/2, height/4*3, 50 );  <-- de acá salen los datos
  if ( estado.equals("menu") ) {
    if ( dist(width/3.2, height/1.47, mouseX, mouseY) < 70/2 ) {
      estado = "p1";
    }
    if ( dist(width/3.2, height/1.47, mouseX, mouseY) < 70/2 )
      puppyMouse = puppyMouse2;
  }
  if ( estado.equals("pfin") ) {
    //aca falta boton cuadrado
    if ( dist( width/2, height/2, mouseX, mouseY) < 240/2 )
      estado = "menu" ;
  }
}
