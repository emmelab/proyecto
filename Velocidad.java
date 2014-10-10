class Velocidad extends Propiedad {
  static String key = "Velocidad";
  String getKey() {
    return key;
  }
  Propiedad soloPonerNewX() {
    return new Velocidad();
  }
  Propiedad[] soloPonerNewArray(int tam) {
    return new Velocidad[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float direccion,magnitud;
  
  Propiedad[] iniciar(Sistema s, Propiedad[] nuevas) {
    for (Velocidad p : (Velocidad[])nuevas) {
      p.direccion = s.p5.random(s.p5.TWO_PI);
      p.magnitud = s.p5.random(.05f,1);
    }
    return nuevas;
  }
  
}
