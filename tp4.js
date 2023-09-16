//Sasha Gongora leg: 91425/4
//comision: 2
//perdon por el ruido de fondo en cierta parte del video ( https://youtu.be/vAL8Na_oQ1U )
var estado = 0;
var puntos = 0;
var errores = 0;
let pj, pjx, pjy, pjp, pjr;
let objeto, obx, oby, obr, obvelx, obvely, boton;
let fondo;

function preload () {
  cargaArchivos();
}

function setup() {
  createCanvas(900, 550);
  background(200, 100, 220);
  boton= true;
  textFont(Fuente);
  pjy= height-20;
  pjx=400;
  pjp= 400;
  pjr= 50;
  obr= 20;
  obx = random(800);
  oby=0;
  obvely= 2 ;
  pj = dibujarPj();
  objeto = dibujarObjeto();
}


function draw() {
  boton = ( mouseX > 350 ) && ( mouseX < 350+200 ) && ( mouseY > 510) && ( mouseY < 510+50);
  if (estado === 0) {
    Inicio();
  } else if (estado === 1) {
    Jugando();
  } else if (estado === 2) {
    Perdiste();
  } else if (estado === 3) {
    Ganaste();
  }
}
function cargaArchivos () {
  lev1 = loadImage('data/lev1.jpg');
  win = loadImage('data/win.jpg');
  lose = loadImage('data/lose.jpg');
  fondo = loadImage ('data/fondo.jpg');
  zana = loadImage('data/carrots.png');
  bunny = loadImage('data/bun.png');
  bunnylose = loadImage('data/bunlose.png');
  bunnywin = loadImage('data/bunwin.png');
  Fuente = loadFont ('data/ARCADE_N.ttf');
}
function Inicio() {
  image(fondo, 0, 0)
    fondo.resize (900, 600);
  push();
  fill(230, 200, 50);
  textSize (50);
  textAlign (CENTER, CENTER);
  text ("Cloud Bunny", width/2, 70);
  fill (230);
  textSize(20);
  text ("REGLAS:", width/2, 150);
  textSize(10);
  text ("1- colecta las zanahorias!", width/2, 200);
  text ("Tu objetivo principal es colectar la mayor cantidad", width/2, 220);
  text ("de zanahorias!!", width/2, 240);
  text ("2- cuidado!:", width/2, 300);
  text ("Debes evitar a toda costa que no caigan mas de 4 zanahorias al suelo", width/2, 330);
  text (" o el juego terminara de manera inmediata", width/2, 345);
  text ("3- y lo mas importante: ", width/2, 400);
  text ("diviertete!!", width/2, 420);
  fill(0, 100);
  textSize(30);
  noStroke();
  hover();
  text("START!", width/2, 530);
  pop();
}

function hover() {
  if (boton) {
    fill(0, 200);
    rect (350, 510, 200, 50);
    fill(255, 0, 0);
  } else {
    fill(0, 100);
    rect (350, 510, 200, 50);
    fill(100, 0, 0);
  }
}

function mousePressed() {
  if (boton && estado === 0) {
    estado=1;
  }
}
function Ganaste() {
  image(win, 0, 0);
  fondo.resize (900, 600);

  push();
  fill (255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("YOU WIN!", width/2, 200);
  text("thanks for playing!!", width/2, 250);
  imageMode(CENTER, CENTER);
  image(bunnywin, pjx, pjy-80, 250, 200);
  textSize(14);
  textAlign(CORNER);
  text("Creditos: ", 20, 20);
  text("Diseño de personaje: Sasha Gongora", 20, 40);
  text("legajo: 91425/4", 20, 60);
  text("Ilustracion de fondo: pinterest", 20, 80);
  text("Comision: 2", 20, 100);
  hover();
  textSize(25);
  text("RETRY!", 385, 530);
  pop();
}
function hover() {
  if (boton) {
    fill(0, 200);
    rect (350, 510, 200, 50);
    fill(255, 0, 0);
  } else {
    fill(39, 52, 183, 100);
    rect (350, 510, 200, 50);
    fill(100, 0, 0);
  }
}

function Perdiste() {
  image(lose, 0, 0);
  fondo.resize (900, 600);
  push();
  fill (255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("-GAME OVER-", width/2, 200);
  imageMode(CENTER, CENTER);
  image(bunnylose, pjx, pjy-80, 250, 200);
  textSize(14);
  textAlign(CORNER);
  text("Creditos ", 20, 20);
  text("Diseño de personaje: Sasha Gongora", 20, 40);
  text("legajo: 91425/4", 20, 60);
  text("Ilustracion de fondo: pinterest", 20, 80);
  text("Comision: 2", 20, 100);
  hover();
  textSize(25);
  text("RETRY!", 385, 530);
  pop();
}
function hover() {
  if (boton) {
    fill(0, 200);
    rect (350, 510, 200, 50);
    fill(255, 0, 0);
  } else {
    fill(39, 52, 183, 100);
    rect (350, 510, 200, 50);
    fill(100, 0, 0);
  }
}
function mouseClicked() {
  if (boton && estado === 2) {
    estado = 0;
    puntos = 0;
    errores=0;
  } else if (boton && estado === 3) {
    estado = 0;
    puntos = 0;
    errores=0;  
}
}
// conejo
function dibujarPj() {
  push();
  imageMode(CENTER, CENTER);
  image(bunny, pjx, pjy-90, 250, 220);
  pop();
}
// zanahora
function dibujarObjeto() {
  push();
  oby += obvely;
  imageMode(CENTER, CENTER);
  image(zana, obx, oby, obr*3, obr*3);
  pop();
}
function Jugando() {
  image(lev1, 0, 0);
  fondo.resize (900, 600);
  dibujarPj();
  dibujarObjeto();
  push();
  fill(255);
  textSize(14);
  textAlign(CORNER);
  text("SCORE: " + puntos, 20, 20);
  text("ZANAHORIAS PERDIDAS: " + errores, 20, 40);
  pop();

  oby += obvely;
  if ( oby > width+obr ) {
    oby = -obr-random(50, 100);
    obx = random( obr, width-obr);

    //caidas
    errores++;
    if (  errores>=4 ) {
      estado = 2;
    }
  }

  //colision
  if ( dist(pjx, pjy, obx, oby) <= obr + pjr  ) {

    //reinicio la ubicacion del enemigo:
    obx = random(obr, width-obr);
    oby = -obr-random(50, 100);

    //score
    puntos++;

    //cuenta zana:
    if ( puntos==8 ) {
      estado = 3;
    }
  }
}
function keyPressed() {
  if ( estado==1 ) {
    if ( keyCode === LEFT_ARROW ) {
      pjx -= 50;
    }
    if ( keyCode === RIGHT_ARROW) {
      pjx += 50;
    }
  }
}
