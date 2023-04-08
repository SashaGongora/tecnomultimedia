//Gongora Sasha
//Comision 2 tp0 Figuras
PImage Puppycat;
void setup() {
  size(800, 400);
  background(230, 230, 230);
  Puppycat= loadImage("Puppycat.png");
}
void draw() {
  image(Puppycat, 400, 0);
  fill(253, 251, 247);
  stroke(112, 61, 39);
  strokeWeight(3);
  //cola
  bezier(295, 164, 304, 136, 340, 149, 312, 175);
  fill(197, 149, 134);
  bezier(302, 151, 280, 118, 320, 109, 322, 160);

  //patitas de atras
  fill(253, 251, 247);
  bezier(100, 289, 110, 380, 159, 385, 161, 335);
  bezier(233, 346, 232, 380, 265, 380, 271, 333);
  fill(197, 149, 134);
  bezier(234, 352, 232, 380, 264, 380, 267, 348);
  bezier(119, 350, 120, 360, 147, 385, 157, 355);

  //cuerpo
  fill(253, 251, 247);
  ellipse(217, 245, 257, 205);

  //patitas de adelante
  bezier(168, 335, 160, 390, 215, 390, 228, 310);
  bezier(280, 335, 270, 395, 330, 395, 341, 270);
  bezier(253, 310, 261, 326, 270, 326, 280, 335);
  fill(197, 149, 134);
  bezier(167, 355, 168, 380, 204, 375, 213, 354);
  bezier(279, 352, 278, 380, 300, 385, 322, 350);
  // garritas
  line(132, 357, 133, 366);
  line(142, 358, 143, 367);
  line(176, 361, 177, 368);
  line(186, 363, 186, 369);
  line(244, 362, 243, 371);
  line(251, 362, 251, 370);
  line(289, 363, 290, 373);
  line(300, 363, 300, 371);
  //accesorios de cuello
  fill(244, 186, 180);
  bezier(156, 261, 187, 295, 270, 250, 257, 163);
  bezier(75, 219, 60, 236, 70, 250, 84, 254);

  //cascabel
  fill(255, 215, 126);
  ellipse(122, 241, 90, 105);
  fill(112, 61, 39);
  ellipse(110, 257, 20, 10);
  strokeWeight(5);
  bezier(110, 257, 113, 275, 110, 275, 124, 292);

  //orejas
  strokeWeight(3);
  fill(197, 149, 134);
  bezier(58, 97, 50, 43, 74, 43, 104, 68);
  noStroke();
  fill(244, 186, 180);
  ellipse(70, 77, 24, 45);

  //cabeza
  fill(253, 251, 247);
  stroke(112, 61, 39);
  ellipse(146, 156, 225, 185);

  //oreja derecha
  fill(197, 149, 134);
  bezier(180, 78, 188, 97, 217, 110, 236, 100);
  bezier(180, 78, 191, 40, 223, 30, 236, 102);
  noStroke();
  fill(244, 186, 180);
  ellipse(197, 75, 30, 45);
  stroke(112, 61, 39);
  noFill();
  bezier(180, 78, 188, 97, 217, 110, 236, 100);
  bezier(180, 78, 191, 40, 223, 30, 236, 102);

  //cara
  fill(197, 149, 134);
  ellipse(158, 119, 28, 23);
  ellipse(91, 119, 28, 23);
  noStroke();
  fill(66, 2, 2);
  ellipse(82, 155, 10, 25);
  ellipse(162, 155, 10, 25);
  triangle(109, 176, 117, 176, 113, 180);
  stroke(66, 2, 2);
  strokeWeight(3);
  line(115, 177, 107, 188);
  line(109, 177, 116, 188);
  //he de admitir que perdi mi estabilidad mental en esto, pero me diverti.
}
