class Tamano extends Propiedad {
  static String key = "Tamano";
  String getKey() {
    return key;
  }
  Propiedad soloPonerNewX() {
    return new Tamano();
  }
  Propiedad[] soloPonerNewArray(int tam) {
    return new Tamano[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float ancho,alto,diametro;
  
  Propiedad[] iniciar(Sistema s, Propiedad[] nuevas) {
    for (Tamano p : (Tamano[])nuevas) {
      p.ancho = p.alto = p.diametro = s.p5.random(5,10)+s.p5.random(5,10);
    }
    return nuevas;
  }
}
