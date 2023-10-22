/*
- Minijuego POO de cuento: Dracula
Tecla "P" para iniciar el juego y tecla "R" para reiniciarlo.
Sasha Gongora, comision 2
link: https://youtu.be/nsl17hTmdy0
*/

let dracula;
let materiales = [];
let ladrillos = [];
let vidas = 5;
let materialesRecolectados = 0;
let objetivoMateriales = 15;
let juegoTerminado = false;
let mensaje;
let inicio = true;
let tiempo, tiempoLimite = 40;
let Inicio, win, lose, torre;

function preload() {
  torre = loadImage('assets/tower.png'); 
  Inicio = loadImage('assets/Inicio.png');
  win= loadImage('assets/Ganaste.png');
  lose = loadImage('assets/Perdiste.png');
}

function setup() {
  createCanvas(600, 600);
 
  dracula = new Dracula();
  for (let i = 0; i < 2; i++) {
    materiales.push(new Material());
    ladrillos.push(new Ladrillo());
  }
  mensaje = "Presiona 'I' para empezar";
  tiempo = millis();
}

function draw() {
  if (inicio) {
    pantallaInicio();
  } else {
    image(torre, 0, 0, width, height);
    if (!gameOver) {
      mostrarEstado();
      dracula.mostrar();
      manejarMateriales();
      manejarLadrillos();
      mostrarMensaje();
      verificarTiempoAgotado();
      verificarVidasAgotadas();
    } else {
      mostrarPantallaResultado();
    }
  }
}

function keyPressed() {
  if (inicio) {
    // Si estamos en la pantalla de inicio, 'I' inicia el juego
    if (key === 'P' || key === 'p') {
      inicio = false;
      reiniciarJuego();
    }
  } else if (!gameOver) {
    // Solo permitir movimiento si el juego no termino
    if (key === 'a' || key === 'A') {
      dracula.mover(-40);
    } else if (key === 'd' || key === 'D') {
      dracula.mover(40);
    }
  } else {
    // Permitir reiniciar el juego con 'R' si el juego termino
    if (key === 'R' || key === 'r') {
      reiniciarJuego();
    }
  }
}
