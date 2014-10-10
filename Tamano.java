class Tamano extends Atributo {
  static String key = "Tamano";
  String getKey() {
    return key;
  }
  Atributo soloPonerNewX() {
    return new Tamano();
  }
  Atributo[] soloPonerNewArray(int tam) {
    return new Tamano[tam];
  }
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  float ancho,alto,diametro;
  
  Atributo[] iniciar(Sistema s, Atributo[] nuevas) {
    for (Tamano p : (Tamano[])nuevas) {
      p.ancho = p.alto = p.diametro = s.p5.random(5,10)+s.p5.random(5,10);
    }
    return nuevas;
  }
}
