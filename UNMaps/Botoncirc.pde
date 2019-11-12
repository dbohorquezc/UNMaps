class BotonCirc extends Boton {
  boolean tipo;

  BotonCirc(color col, PVector posi, int val, boolean dib) {
    super(col, posi, val);
    setTipo(dib);
  }

  void setTipo(boolean tip) {
    tipo=tip;
  }
  boolean getTipo () {
    return tipo;
  }

  void display() {
    if (tipo) {
      pushStyle();
      strokeWeight(2);
      stroke(0, 0, 0);
      //fill(41, 74, 255);
      fill(bcolor);
      ellipseMode(CENTER);
      ellipse(posicion.x, posicion.y, 35, 35);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      rect(posicion.x-5, posicion.y-3, 10, 10, 1);
      triangle(posicion.x+7, posicion.y-3, posicion.x-7, posicion.y-3, posicion.x, posicion.y-9);
      popStyle();
    } else {
      pushStyle();
      strokeWeight(2);
      stroke(0, 0, 0);
      //fill(41, 74, 255);
      fill(bcolor);
      ellipseMode(CENTER);
      ellipse(posicion.x, posicion.y, 35, 35);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      triangle(posicion.x-11, posicion.y+1, posicion.x-8, posicion.y+4, posicion.x-5, posicion.y+1);
      noFill(); 
      strokeWeight(3);
      arc(posicion.x, posicion.y, 15, 15, -PI, PI/2);
      popStyle();
    }
  }
  void asignarValor() {
    if (mousePressed && sqrt(pow(mouseX-posicion.x, 2)+pow(mouseY-posicion.y, 2))<=(35/2)) {
      nivel=valor;
    }
  }
}
