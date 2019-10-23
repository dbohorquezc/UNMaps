class Nodo {
  PVector posicion;
  int tamano=20;
  boolean q;

  Nodo(PVector p, int s) {
    setPosicion(p);
    setTamano(s);
  }

  void setPosicion(PVector pos) {
    posicion = pos;
  }
    void setSelec(boolean a) {
    q = a;
  }

  void setPosicion(float x, float y) {
    setPosicion(new PVector(x, y));
  }

  void setTamano(int s) {
    tamano = s;
  }

  PVector posicion() {
    return posicion;
  }

  float size() {
    return tamano;
  }

  void display() {
    pushStyle();
    strokeWeight(8);    
    if(pick(mouseX, mouseY)){
      q=true;
    }else{
      q=false;
    }
    if (q) {
      stroke(0, 255,0);
    } else {
      stroke(0, 0, 255);
    }
    fill(0, 0, 0);
    ellipse(posicion.x, posicion.y, tamano, tamano);    
    popStyle();
  }

  boolean pick(int x, int y) {
    return sqrt(sq(x-posicion().x) + sq(y-posicion().y)) <= tamano;
  }
}
