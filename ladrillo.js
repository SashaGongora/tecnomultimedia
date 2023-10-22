class Ladrillo {
  constructor() {
    this.x = random(width);
    this.y = 0;
    this.ancho = 80;
    this.alto = 80;
    this.velocidad = random(1, 4);
    this.imagenes = [
    loadImage('assets/brick1.png'),
     loadImage('assets/brick2.png'),
      ];
       this.imagen = random(this.imagenes);  
  }

  mostrar() {
    image(this.imagen, this.x, this.y, this.ancho, this.alto);
  }

  mover() {
    this.y += this.velocidad;
  }

  reiniciar() {
    this.x = random(width);
    this.y = 0;
  }
}
