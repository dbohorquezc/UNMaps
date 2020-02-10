Grafo mapa;
int nivel=0;
PImage img,img1;
Table puntos,puntos2,conexiones,conexiones2;
boolean ninicial,nfinal;
boolean botonb;
boolean boton;

void setup() {
  fullScreen();
  img=loadImage("Mapa.png");
  img1=loadImage("instrucciones.png");
  puntos=loadTable("Puntos.csv", "header");
  puntos2=loadTable("Puntos2.csv", "header"); 
  conexiones=loadTable("Grafo.csv", "header");
  conexiones2=loadTable("Grafo2.csv", "header");  
  mapa=new Grafo(puntos,conexiones,puntos2,conexiones2);
  ninicial=false;
  nfinal=false;
}

void draw() {  
  ejecutar(nivel);  
}
void mousePressed () { 
  if (nivel==1) {
    mapa.mouse1();
  }
}
void mouseClicked () { 
  if (nivel==1) {
    mapa.mouse1();
  }
}
