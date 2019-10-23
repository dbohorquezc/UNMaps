abstract class Boton {
  color bcolor;
  PVector posicion;
  int valor;

  Boton(color col, PVector posi, int val) {
    setColor(col);
    setPosicion(posi);
    setValor(val);
  }

  void setPosicion(PVector pos) {
    posicion=pos;
  }
  PVector getPosicion () {
    return posicion;
  }

  void setColor(color colo) {
    bcolor=colo;
  }
  color getColor () {
    return bcolor;
  }

  void setValor(int val) {
    valor=val;
  }
  int getValor () {
    return valor;
  }
  
  abstract void display();
  
  abstract void asignarValor();
}
