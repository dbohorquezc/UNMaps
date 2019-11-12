class Nodo {
  PVector posicion;
  int tamano,tamano2;
  int z;
  boolean q;
  String a, b;
  color cnodo1,cnodo2;
  Nodo(PVector p, int s, int z,color c,color d,String a,String b) {
    setPosicion(p);
    setTamano(s);
    setNumnodo(z);
    setColnodo1(c);
    setColnodo2(d);
    setNombre(a);
    setNumero(b);
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

  void setNombre(String aa) {
    a = aa;
  }

  void setNumero(String bb) {
    b = bb;
  }

  void setNumnodo(int a) {
    z = a;
  }
 void setColnodo1(color a) {
    cnodo1 = a;
  }
 void setColnodo2(color a) {
    cnodo2 = a;
  }

  PVector posicion() {
    return posicion;
  }

  float size() {
    return tamano;
  }

  void display() {
    pushStyle();
    strokeWeight(1);   
    if (pick(mouseX, mouseY)) {
      q=true;
    } else {
      q=false;
    }
    if (q) { 
    stroke(cnodo1);
      fill(cnodo1);
    } else { 
    stroke(cnodo2);
      fill(cnodo2);
    }
    ellipse(posicion.x, posicion.y, 2*tamano, 2*tamano);  
    popStyle();
  }

  boolean pick(int x, int y) {
    return sqrt(sq(x-posicion().x) + sq(y-posicion().y)) <= tamano;
  }
}
