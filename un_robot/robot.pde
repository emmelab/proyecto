/*class robot {
  float carax = 20;
  float caray = 400;
  float cuerpox = carax;
  float cuerpoy = caray + 22.5;  
  float pierna1x1 = cuerpox + 4; 
  float pierna1y1 = cuerpoy + 12.5;
  float pierna1x2 = cuerpox + 4;
  float pierna1y2 = pierna1y1 + 20; 
  float pierna2x1 = cuerpox - 4; 
  float pierna2y1 = cuerpoy + 12.5;
  float pierna2x2 = cuerpox - 4;
  float pierna2y2 = pierna2y1 + 20;
  float movimientolento = 1;

  robot() {
  }

  void run() {
    display();
    keyPressed();
    //move();
  }

  void display() {
    rectMode(CENTER);
    rect(carax, caray, 20, 20);
    rect(cuerpox, cuerpoy, 25, 25);
    line(pierna1x1, pierna1y1, pierna1x2, pierna1y2);
    line(pierna2x1, pierna2y1, pierna2x2, pierna2y2);
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        carax++;
      } 
      else if (keyCode == LEFT) {
        carax--;
      }
    } 
    else {
      carax = carax;
    }
  }
  void move() {
   if (key == 'd') {
   carax = carax + movimientolento;
   }
   else if (key == 'a') {
   carax = carax - movimientolento;
   } 
   else {
   carax = carax;
   }
   }
}*/


