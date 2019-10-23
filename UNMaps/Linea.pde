class Linea{
  PVector puntoinicial,puntofinal;
  
  Linea(PVector a,PVector b){
  setPuntoinicial(a);
  setPuntofinal(b);
  }
  

  
  void setPuntoinicial(PVector a){
    puntoinicial=a;
  }
  void setPuntofinal(PVector a){
    puntofinal=a;
  }  
  PVector puntoinicial(){
  return puntoinicial;
  }  
  
  PVector puntofinal(){
  return puntofinal;
  } 

    void display() {
    pushStyle();
    strokeWeight(4);
    stroke(208, 206, 212);
    fill(0, 0, 0);
    //if (pick(mouseX, mouseY) && mousePressed) {
    //  stroke(0, 0, 255);
    //  fill(0, 0, 0);
    //  this.seleccion = true;
    //}
    line(puntoinicial.x, puntoinicial.y, puntofinal.x, puntofinal.y);    
    popStyle();
  }

}
