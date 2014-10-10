class Organismo {
  boolean toroidal;
  float x, y; //posicion del organismo
  float direccion;
  float dx, dy; //desplazamiento en x e y
  float velocidad;

  Organismo(  float x_, float y_ ) { //inicializa el organismo
    iniciar( x_, y_ );
    toroidal=true;
  }
  //----------------------------  

  Organismo( ) { //inicializa el organismo
    iniciar( random(width), random(height) ); //si no recibe parametros inicia con x e y al azar
    toroidal=true;
  }
  //----------------------------  

  void iniciar( float x_, float y_ ) {  //inicializaciÃ³n del organismo
    x = x_;
    y = y_;
    direccion = random(TWO_PI); //inicia con una dirección al azar
    velocidad = 5; //inicia la velocidad en 5 pixels por fotograma
  }

  void variarAngulo( float amplitud ) { //varia la direcciÃ³n con una amplitud determinada

    float radi = radians( amplitud ); //transforma los grados en radianes
    direccion += random( -radi, radi ); //aplica un valor al azar dentro del rango
  }

  void mover() { //actualiza la ubicación del organismo
    variarAngulo( 30 ); //caria la direccion en un rango de 30 grados para cada lado
    dx = velocidad * cos(direccion);  
    dy = velocidad * sin(direccion);
    x += dx; //aplica los desplazamiento
    y += dy; //aplica los desplazamiento

    if ( toroidal ) { 
      x = ( x>width ? x-width : x );
      x = ( x<0 ? x+width : x );
      y = ( y>height ? y-height : y );
      y = ( y<0 ? y+height : y );
    }
  }
  void click() {
    if (toroidal== true) {
      toroidal=false;
    } else {
      toroidal=true;
    }
  }

  void dibujar() {  //dibuja el organismo
    rectMode(CENTER);
    noStroke();
    //fill(random(100, 255), random(100, 255), random(100, 255));
    fill(random(0,255),random(0,150),random(80,0));
    //bezier(x, y, x,x, y, y, x, y);
    //rect(x,y,50,50);
    ellipse(x, y, 50, 50);
    mover();
  }
  
  void acelerar(){
    if(velocidad<50){
     velocidad++;
    }
   
  }
  
  void desacelerar(){
    if(velocidad>2){
    velocidad--;
    }
      
  }
  
}

