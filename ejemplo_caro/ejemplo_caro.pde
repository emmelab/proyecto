

import processing.video.*;
// Variable para la captura de video, de tipo capture y la llamo video
Capture video;
int anchoCamara=320;
int altoCamara=240;
//fotograma previo
PImage prevFrame;
// tolerancia para saber cuando cambia un pixel
float threshold = 50;
int contadorPixel;//cuenta cuantos pixeles cambiaron en el ciclo
Organismo[] animales; //Un arreglo de animales
int cantAnimales; //Define la cantidad de animales
void setup() {
  size(800, 600);
  video = new Capture(this, anchoCamara, altoCamara, 30);//incializa la variable video
  // crea una imagen vacia del tamaño del video
  prevFrame = createImage(video.width, video.height, RGB);
  video.start(); //comienza a capturar el video
  cantAnimales = 20; //Se establece la cantidad de animales
  iniciar(); //ejecuta la inicializaciÃ³n
  background(0);
}

void draw() {

  // Captura de video
  if (video.available()) {// cuando la camara esta preparada
    // salva el fotograma previo para la deteccion de movimiento
    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); // antes de leer el nuevo fotograma, se salva el fotograma previo para comparar.
    prevFrame.updatePixels();
    video.read();//lee un nuevo fotograma
  }


  //cargo los pixeles de las imagenes para poder tener acceso a ellos
  loadPixels();
  video.loadPixels();//tanto para la imagen del video
  prevFrame.loadPixels();//como para la del fotograma anterior
  
  //el contador de los pixeles que cambiaron le asigno 0 para volver a contar
  contadorPixel=0;

  // Comienza el bucle para caminar por cada pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      
      //como los pixeles de una imagen se guardan en un vector calculo la posicion de cada pixel con el calculo de abajo
      int loc = x + y*video.width;            //en la variable loc guardo dicha posicion, que es igual a la posicion de x + y * (cantidad de pixeles de ancho)
      
      //guardo en la variable current el color del pixel de la posicion loc del video
      color current = video.pixels[loc];      // Step 2, what is the current color
      //guardo en la variable previous el color del pixel de la posicion loc del fotograma previo
      color previous = prevFrame.pixels[loc]; // Step 3, what is the previous color

      
      // Step 4, compare colors (previous vs. current)
      
      //extraigo composiciones
      float r1 = red(current); //extraigo la composicion roja de la variable current y la guardo en una variable float
      float g1 = green(current); //extraigo la composicion verde de la variable current y la guardo en una variable float
      float b1 = blue(current);//extraigo la composicion azul de la variable current y la guardo en una variable float
      float r2 = red(previous); //idem para previous
      float g2 = green(previous);//idem para previous 
      float b2 = blue(previous);//idem para previous
      
      //calculo la distancia de color que hay entre las composiciones de current con las de previous
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion at that pixel.
      
      //analizo si la distancia es mayor a la tolerancia, si es mayor entonces hubo movimiento y contadorPixel aumenta
      if (diff > threshold) { 
        // If motion, display black
        //pixels[loc] = color(0);
        contadorPixel++;
      } else {
        // If not, display white
        //pixels[loc] = color(255);
      }
    }
  }
  //updatePixels();

  if (contadorPixel>(video.width*video.height)/6) {
    for (int i=0; i<cantAnimales; i++) { //se recorre cada animal y
      animales[i].dibujar(); //dibuja cada animal
      animales[i].acelerar(); //dibuja cada animal
    }
  } else {
    for (int i=0; i<cantAnimales; i++) { //se recorre cada animal y
      animales[i].dibujar(); //dibuja cada animal
      animales[i].desacelerar(); //dibuja cada animal
    }
  }

}

void iniciar() {

  animales = new Organismo[cantAnimales]; //Se inicia el arreglo
  for (int i=0; i<cantAnimales; i++) { //se recorre cada animal

    animales[i] = new Organismo(); // se inicia cada animal
  }
}

void mousePressed() {

  for (int i=0; i<cantAnimales; i++) {
    animales[i].click();
  }
}

