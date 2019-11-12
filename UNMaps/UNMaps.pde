Grafo mapa;
int nivel=0;
PImage img,img1;
Table puntos,conexiones;

void setup() {
  fullScreen();
  img=loadImage("Mapa.png");
  img1=loadImage("instrucciones.png");
  puntos=loadTable("Puntos.csv", "header"); 
  conexiones=loadTable("Grafo.csv", "header");  
  mapa=new Grafo(puntos,conexiones);
}

void draw() {
  ejecutar(nivel);
  }
