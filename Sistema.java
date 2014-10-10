import processing.core.PApplet;
import java.util.HashMap;

class Sistema {
  final PApplet p5;
  int tamano = 100;
  HashMap<String,Propiedad[]> propiedades;
  
  Sistema(PApplet p5, int cantidad) {
    this.p5 = p5;
    tamano = cantidad;
    propiedades = new HashMap();
  }
  
  Propiedad[] incluir(Propiedad semilla) {
    if (propiedades.containsKey( semilla.getKey() )) {
      System.out.println("Esta llave ya está en uso"+semilla.getKey());
      p5.exit();
      return null;
    }
    else {
      Propiedad[] nuevas = semilla.generarGrupo(this);
      propiedades.put(semilla.getKey(),nuevas);
      return nuevas;
    }
  }
  
  Propiedad[] getPropiedades(String llave) {
    return propiedades.get(llave);
  }
}
