class Posicion extends Propiedad {
  static String key = "Posicion";
  String getKey() {
    return key;
  }
  Propiedad soloPonerNewX() {
    return new Posicion();
  }
  Propiedad[] soloPonerNewArray(int tam) {
    return new Posicion[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float x;
  
  Propiedad[] iniciar(Sistema s, Propiedad[] nuevas) {
    int grilla = s.p5.ceil(s.p5.sqrt(nuevas.length));
    int grillaX = grilla;
    int grillaY = grilla;
    for (int i=0; i<nuevas.length; i++) {
      Posicion p = (Posicion)nuevas[i];
      p.x = (i%grillaX) * (s.p5.width / grillaX);
      p.y = (i/grillaY) * (s.p5.height / grillaY);
    }
    return nuevas;
  }
  /*Propiedad[] iniciar(Sistema s, Propiedad[] nuevas) {
    for (Posicion p : (Posicion[])nuevas) {
      p.x = s.p5.random(s.p5.width);
      p.y = s.p5.random(s.p5.height);
    }
    return nuevas;
  }*/
  
    
    /*EDICION PARA PRUEBA*/
}
