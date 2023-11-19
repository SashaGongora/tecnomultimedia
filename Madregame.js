let estado = 0;
let img = [];
let Dracula;
let Material;
let Brick;

//carga de imagenes
function preload () {
  for ( let i = 0; i < 4; i++ ) {
    img[i] = loadImage("assets/img"+i+".png");
  }
}

class MainGame {
  constructor() {
    Dracula = new dracula(img);
    Material = [];
    this.Inicio = loadImage('assets/pantalla0.png');
    this.win= loadImage('assets/pantalla1.png');
    this.lose = loadImage('assets/pantalla2.png');
    for ( let i = 0; i < 2; i++ ) {
      Material.push( new sangre(img) );
    }

    Brick = [];
    for ( let i = 0; i < 2; i++ ) {
      Brick.push( new sangre(img) );
    }

    this.tiempos = new tiempo(60);
    this.tiempoIniciado = false;
    this.generarMate(2);
    this.puntaje = 0;
  }

  actualizar() {

    //"jugando"
    if (estado == 1) {

      //sangre
      for ( let i = 0; i < 3; i++ ) {
        Material[i].actualizar();
        image (img[2], this.x, this.y, this.w, this.h);
      }

      //tela roja
      for ( let i = 0; i < 2; i++ ) {
        Brick[i].actualizar();
        image (img[3], this.x, this.y, this.w, this.h);
      }

      //colision de la sangre y puntaje
      this.colisionMat()
        if (this.puntaje >= 15) {
        estado = 2;
      }

      //colision de ladrillos
      this.colisionBri();

      //tiempo
      if (!this.tiempoIniciado) {
        this.tiempos.inicio = millis(); // Inicia el tiempo
        this.tiempoIniciado = true; // Marca que el juego ha comenzado
      }

      this.tiempos.actualizar()
    }

    if (estado == 1 && this.tiempos.haTerminado()) {
      estado = 3;
    }

    //pantalla 2 "ganaste"
    if (estado == 2) {
      this.reiniciar();
    }

    //pantalla 3 "perdiste"
    if (estado == 3) {
      this.reiniciar();
    }
  }

  dibujar() {

    //pantalla 0 "instrucciones"
    if (estado == 0) {
      background (0);
      image(this.Inicio, 0, 0);

      push();
      fill (196, 32, 32, 160);
      noStroke();
      rect (70, 80, 450, 250);
      pop();
      push();
      textSize (25);
      text ("Instrucciones", 220, 140);
      textSize (20);
      text ("Debes recolectar con Dracula la sangre \nevitando los ladrillos que caen de la torre. \nCuidado! asegurate de hacerlo a tiempo o\nJonathan podria escapar!\nUtiliza las flechas para esquivar.", 100, 170);
      pop();

      //boton
      push();
      fill (196, 32, 32, 150);
      noStroke();
      rect (215, 460, 130, 60);
      fill (0);
      textSize(30);
      text ("Start!", 240, 500);
      pop();
    }

    //pantalla 1 "juego"
    if (estado == 1) {

      //fondo
      image (img[0], 0, 0, 0, 0);
      Dracula.dibujar(img);

      for ( let i = 0; i < 3; i++ ) {
        Material[i].dibujar(img, 2);
      }
      for ( let i = 0; i < 2; i++ ) {
        Brick[i].dibujar(img, 3);
      }

      push();
      textSize (20);
      //para redondear el tiemp
      fill(250)
      text("Tiempo: " + this.tiempos.tiempoRestante.toFixed(0), 60, 60);
      pop();
      
      push();
      textSize (20);
      fill(250)
      text("Score: " + this.puntaje, 60, 100);
      pop();
      this.tiempos.actualizar();
    }
    
    if (estado == 2) {
      background (0);
      image(this.win, 0, 0);
      textSize (25);
      fill(200)
      text ("¡Exito!", 230, 80);
      text ("Jhonny es atacado por las novias de\nDracula!", 20, 100);
      push();
      fill (196, 32, 32,150);
      noStroke();
      rect (130, 363, 310, 60);
      fill (200);
      textSize(20);
      text ("Presiona R para jugar otra vez!", 150, 400);
      pop();
      this.reiniciar();      
    }
    
    if (estado == 3) {
      background (0);
      image(this.lose, 0, 0);

      textSize (25);
       fill (200);
      text ("¡Oh no!", 220, 75);
      text ("Se acabo el tiempo y los escombros dañaron a\nDracula!", 20, 100);


      push();
      fill (196, 32, 32,150);
      noStroke();
      rect (130, 363, 310, 60);
      fill (200);
      textSize(20);
      text ("Presiona R para jugar otra vez!", 150, 400);
      pop();

      this.reiniciar();
    }
  }

  teclado() {
    Dracula.Teclas();

    if (estado == 2) {
      if (key === 'r') {
        estado = 0;

        this.reiniciar();
      } else if (key === 'r') {
        estado = 2;
      }
    }
    if (estado == 3) {
      if (key === 'r') {
        estado = 0;

        this.reiniciar();
      } else if (key === 'r') {
        estado = 3;
      }
    }
  }


  mouse() {

    //boton "play", pantalla 0 a pantalla 1
    if (estado == 0 && ((mouseX > 215 && mouseX < 215 + 130 && mouseY > 460 && mouseY < 460 + 60))) {
      estado = 1;
      this.tiempos = new tiempo(60);
    }
  }


  generarMate(cantidad) {
    for (let i = 0; i < cantidad; i++) {
      Material.push(new sangre(random(width), -height, 45));
    }
  }

  colisionMat() {
    for (let i = Material.length - 1; i >= 0; i--) {
      let distanciaReal = dist (Dracula.getX(), Dracula.getY(), Material[i].getX(), Material[i].getY());
      let distanciaChoque = 45;

      if (distanciaReal <= distanciaChoque) {
        //para que no se sature el puntaje
        Material.splice(i, 1);

        this.puntaje += 1;
        //genera una gota de sangre en una posición random en el eje X
        Material.push(new sangre(random(width), -height, 45));
      }
    }
  }


  colisionBri() {

    for (let i = 0; i < Brick.length; i++) {
      let distanciaReal = dist (Dracula.getX(), Dracula.getY(), Brick[i].getX(), Brick[i].getY());
      let distanciaChoque = 45;

      if (distanciaReal <= distanciaChoque) {
        estado = 3;
      }
    }
  }

  reiniciar() {
    //método "reiniciar"
    if (key === "r") {

      estado = 0;
      Dracula = new dracula();
      this.puntaje = 0;
      this.tiempos = new tiempo(60);

      Material= [];
      for ( let i = 0; i < 3; i++ ) {
        Material.push( new sangre(img) );
      }

      Brick = [];
      for ( let i = 0; i < 2; i++ ) {
        Brick.push( new sangre(img) );
      }
    }
  }
}
