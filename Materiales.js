class Material {
  constructor() {
    this.x = random(width);
    this.y = 0;
    this.ancho = 70;
    this.alto = 70;
    this.velocidad = random(1, 4);
    this.imagenes = [
      loadImage('assets/mat1.png'),
      loadImage('assets/mat2.png'),
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
    this.imagen = random(this.imagenes);
  }
}
