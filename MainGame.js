
function pantallaInicio() {
  image(Inicio, 0, 0, width, height);
  fill(255);
  textSize(30);
  text("El minijuego.", 350, 280);
  fill(255, 85, 85);
  textSize(20);
  text("Usa 'A' y 'D' para moverte.", 20, 500);
  text("Recolecta la sangre y los murcielagos que caen", 20, 520);
  text("Evita los ladrillos que se desprenden de la torre", 20, 540);
  text(" P para empezar.", 20, 560);
  text("Tienes 40s o la torre se derrumba!", 20, 580);
}

function mostrarEstado() {
  textSize(20);
  fill(255);
  text('Vidas: ' + vidas, 10, 30);
  text('Materiales: ' + materialesRecolectados + ' / ' + objetivoMateriales, 10, 60);

  let tiempoTranscurrido = (millis() - tiempo) / 1000;
  let tiempoRestante = tiempoLimite - tiempoTranscurrido;

  if (tiempoRestante < 0) {
    tiempoRestante = 0;
  }

  text('Tiempo: ' + tiempoRestante.toFixed(1) + ' s', 10, 90);
}


function manejarMateriales() {
  for (let i = 0; i < materiales.length; i++) {
    let material = materiales[i];
    material.mostrar();
    material.mover();
    if (dracula.intersecta(material)) {
      materialesRecolectados++;
      material.reiniciar();
    }
    if (material.y > height) {
      material.reiniciar();
    }
  }

  if (materialesRecolectados >= objetivoMateriales) {
    gameOver = true;
    mensaje = "¡Lo lograste!\nLa expedición continúa con éxito!\nPresiona R para reiniciar";
  }
}

function manejarLadrillos() {
  for (let i = 0; i < ladrillos.length; i++) {
    let ladrillo = ladrillos[i];
    ladrillo.mostrar();
    ladrillo.mover();
    if (dracula.intersecta(ladrillo)) {
      vidas--;
      ladrillo.reiniciar();
    }
    if (ladrillo.y > height) {
      ladrillo.reiniciar();
    }
  }
}


function mostrarMensaje() {
  fill(0);
  textSize(32);
  text(mensaje, 220, height / 2);
}

function verificarTiempoAgotado() {
  let tiempoTranscurrido = (millis() - tiempo) / 1000;
  if (tiempoTranscurrido >= tiempoLimite) {
    gameOver = true;
    mensaje = "Se acabó el tiempo.\nLa torre se derrumba y jhonny sobrevive \nPresiona R para reiniciar";
  }
}

function verificarVidasAgotadas() {
  if (vidas <= 0) {
    gameOver = true;
    mensaje = "Los escombros de la torre te dañaron.\nPresiona R para reiniciar";
  }
}

function mostrarPantallaResultado() {
  if (gameOver) {
    image(torre, 0, 0, width, height);
    fill(255);
    textSize(32);

    if (mensaje.includes("¡Lo lograste!")) {
      image(win, 0, 0, width, height);
      textSize(30);
      fill(0, 255, 0);
      text("¡Lo lograste!\n Jhonny es atacado por las novias\nde Dracula!\nPresiona R para reiniciar", 50, 100);
    }

    if (mensaje.includes("Se acabó el tiempo.") || mensaje.includes("Los escombros de la torre te dañaron.")) {
      image(lose, 0, 0, width, height);
      textSize(30);
      fill(255, 0, 0);
      text(mensaje, 30, 100);
    }
  }
}

function reiniciarJuego() {
  gameOver = false;
  vidas = 4;
  materialesRecolectados = 0;
  tiempo = millis();
  dracula.x = width / 2;

  for (let i = 0; i < materiales.length; i++) {
    materiales[i].reiniciar();
  }

  for (let i = 0; i < ladrillos.length; i++) {
    ladrillos[i].reiniciar();
  }
//()
  mensaje = "";
  inicio = false;
}
