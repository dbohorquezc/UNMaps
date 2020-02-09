class BotonCirc extends Boton {
  int tipo;

  BotonCirc(color col, PVector posi, int val, int dib) {
    super(col, posi, val);
    setTipo(dib);
  }

  void setTipo(int tip) {
    tipo=tip;
  }
  int getTipo () {
    return tipo;
  }

  void display() {
    if (tipo==1) {
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
    } else if (tipo==0) {
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
    } else if (tipo==2) {
      pushStyle();
      strokeWeight(2);
      stroke(0, 0, 0);
      //fill(41, 74, 255);
      fill(bcolor);
      ellipseMode(CENTER);
      ellipse(posicion.x, posicion.y, 35, 35);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      ellipse(posicion.x+1, posicion.y-7, 7, 7);
      //noFill(); 
      strokeWeight(3);
      line(posicion.x+1, posicion.y-6, posicion.x-1, posicion.y+2);
      line(posicion.x-1, posicion.y+2, posicion.x-2, posicion.y+9);
      line(posicion.x-1, posicion.y+2, posicion.x+5, posicion.y+7);
      line(posicion.x-2, posicion.y+9, posicion.x-5, posicion.y+12);
      line(posicion.x+5, posicion.y+7, posicion.x+5, posicion.y+11);
      line(posicion.x+1, posicion.y-5, posicion.x-5, posicion.y);
      line(posicion.x+1, posicion.y-5, posicion.x+5, posicion.y+1);
      line(posicion.x-5, posicion.y, posicion.x-5, posicion.y+4);
      line(posicion.x+5, posicion.y+1, posicion.x+8, posicion.y+1);
      //arc(posicion.x, posicion.y, 15, 15, -PI, PI/2);
      popStyle();
    } else if (tipo==3) {
      pushStyle();
      strokeWeight(2);
      stroke(0, 0, 0);
      //fill(41, 74, 255);
      fill(bcolor);
      ellipseMode(CENTER);
      ellipse(posicion.x, posicion.y, 35, 35);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      rect(posicion.x-4, posicion.y-6, 8, 4, 2, 2, 0, 0);
      rect(posicion.x-8, posicion.y-1, 16, 6, 1, 1, 1, 1);
      rect(posicion.x-6, posicion.y+4, 2, 4, 0, 0, 1, 1);
      rect(posicion.x+4, posicion.y+4, 2, 4, 0, 0, 1, 1);

      popStyle();
    }
  }
  void asignarValor() {
    if (mousePressed && sqrt(pow(mouseX-posicion.x, 2)+pow(mouseY-posicion.y, 2))<=(35/2)) {
      switch(valor) {
      case 0:
        nivel=valor;
        break;
      case 1:
        nivel=valor;
        break;
      case 2:
        mapa.setControl(0);
        break;
      case 3:
        mapa.setControl(1);
        break;
      }
    }
  }
}