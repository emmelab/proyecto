abstract class Propiedad {
  abstract Propiedad soloPonerNewX();
  abstract Propiedad[] soloPonerNewArray(int tam);
  abstract Propiedad[] iniciar(Sistema s, Propiedad[] n);
  abstract String getKey();
  
  Propiedad[] generarGrupo(Sistema s) {
    Propiedad[] nuevas = soloPonerNewArray(s.tamano);
    nuevas[0] = this;
    for (int i=1; i<nuevas.length; i++) {
      nuevas[i] = soloPonerNewX();
    }
    return iniciar(s, nuevas);
  }
}
