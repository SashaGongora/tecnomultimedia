class Dracula {
  constructor() {
    this.x = width / 2;
    this.y = height - 200;
    this.ancho = 150;
    this.alto = 150;
    this.imagen = 
    loadImage('assets/drac1.png');
  }

  mostrar() {
    image(this.imagen, this.x, this.y, this.ancho, this.alto);
  }

  mover(paso) {
    this.x = constrain(this.x + paso, 0, width - this.ancho);
  }

  intersecta(elemento) {
    return (
      this.x < elemento.x + elemento.ancho &&
      this.x + this.ancho > elemento.x &&
      this.y < elemento.y + elemento.alto &&
      this.y + this.alto > elemento.y
    );
  }
}
