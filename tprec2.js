/*
- Recuperatorio del Minijuego POO de cuento: Dracula
 Clickear "Play" para iniciar el juego y tecla "R" para reiniciarlo.
 Sasha Gongora, comision 2
 link: 
 */
let JuegoDracula;

function setup() {
  createCanvas(564, 564);
  JuegoDracula= new MainGame();
}

function draw() {
JuegoDracula.actualizar();
JuegoDracula.dibujar();
}

function keyPressed() {
JuegoDracula.teclado();
}

function mousePressed() {
JuegoDracula.mouse();
}
