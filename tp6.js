//Sasha Gongora
//tpfinal, comision2

let AllDracula;

function setup() {
  createCanvas(1150, 560)
    AllDracula = new ClaseMadre();
}


function draw() {
  AllDracula.actualizar();
  AllDracula.dibujar();
  
}
function keyPressed() {
 AllDracula.teclado();
}
function mousePressed() {
  AllDracula.PasarEstados();
}
