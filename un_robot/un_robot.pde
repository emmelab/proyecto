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
float movimientolento = 6;
float ojo = 4;


void setup() {
  size(1200, 600);
  smooth();
  
}

void draw() {
  background(100);
  strokeWeight(10);
  line(0,455,1200,455);
  strokeWeight(5);
  rectMode(CENTER);
  rect(carax, caray, 20, 20);
  rect(cuerpox, cuerpoy, 25, 25);
  line(pierna1x1, pierna1y1, pierna1x2, pierna1y2);
  line(pierna2x1, pierna2y1, pierna2x2, pierna2y2);
  point(carax + ojo, caray);
  
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      carax = carax + movimientolento;
      cuerpox = cuerpox + movimientolento;
      pierna1x1 = pierna1x1 + movimientolento;
      pierna2x1 = pierna2x1 + movimientolento;
      pierna1x2 = pierna1x2 + movimientolento;
      pierna2x2 = pierna2x2 + movimientolento;
      ojo = 4;
    } 
    else if (keyCode == LEFT) {
      carax = carax - movimientolento;
      cuerpox = cuerpox - movimientolento;
      pierna1x1 = pierna1x1 - movimientolento;
      pierna2x1 = pierna2x1 - movimientolento;
      pierna1x2 = pierna1x2 - movimientolento;
      pierna2x2 = pierna2x2 - movimientolento;
      ojo = -4;
    }
  } 
  else {
    carax = carax;
    cuerpox = cuerpox;
    pierna1x1 = pierna1x1;
    pierna2x1 = pierna2x1;
    pierna1x2 = pierna1x2;
    pierna2x2 = pierna2x2;
  }
}



