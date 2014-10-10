void moverParticulas(Sistema sistema) {//Este vendria a ser un modificador
  Posicion[] posiciones = (Posicion[])sistema.getPropiedades(Posicion.key);
  if (posiciones == null) posiciones = (Posicion[])sistema.incluir(new Posicion());
  Velocidad[] velocidades = (Velocidad[])sistema.getPropiedades(Velocidad.key);
  if (velocidades == null) velocidades = (Velocidad[])sistema.incluir(new Velocidad());

  for (int i=0; i<sistema.tamano; i++) {
    Posicion p = posiciones[i];
    Velocidad v = velocidades[i]; 
    p.x += v.magnitud*cos(v.direccion);
    p.y += v.magnitud*sin(v.direccion);
  }
}
