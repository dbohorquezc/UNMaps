class Grafo {
  Table tabladeposiciones, tablaconexiones;
  int tnodo, tgrafo;
  String[] nombres={"Calle 26", "Carrera 30", "Calle 53", "Carrera 40", "F. Cien. Humanas", "Economia", "El viejo", "Aulas de ing.", "Plaza che", "Medicina", "Cyt"};
  Nodo[] nodo;
  Nodo[] opcion;
  Nodo[] selecciones;
  Linea[] linea;
  int nodo1;
  int nodo2;
  
  //Para usar un arbol que guarde los caminos, se usara un arreglo con los papas de cada nodo
  int[] padres;
  
  int[] condiciones;
  //Para usar el algoritmo de Dijkstra se usaran el arreglo de padres y un arreglo con la condicion de cada nodo en un int llamado condiciones:
  
  //0. Si aún no se ha encontrado el menor camino para el nodo i entonces condiciones[i] = 0
  
  //1. Si ya se encontro el menor camino para el nodo i entonces condiciones[i] = 1
  
  //2. Si ya se encontro el menor camino para el nodo i, y además a todos los nodos a los que esta conectado tambien se le han encontrado el menor camino
  //entonces condiciones[i] = 2
  
  //Ademas, se usara un arreglo para llevar la distancia hasta cada nodo
  double[] distancias;
  
  //Para dibujar el camino se usara un arreglo de lineas
  Linea[] camino;
  

  color colnodo1a=(color(0, 255, 0));
  color colnodo1b=(color(0, 0, 255));
  color colnodo2a=(color(255, 0, 0));
  color colnodo2b=(color(255, 0, 255));

  Grafo(Table a, Table b) {
    setTablaposiciones(a);
    setTamanotablas(a);
    setTamanografo(b);    
    setTablaconexiones(b);
    nodo = new Nodo[tnodo];
    padres = new int[tnodo];
    condiciones = new int[tnodo];
    selecciones = new Nodo[2];
    for (int i = 0; i < tnodo; i++){
      condiciones[i] = 0;
    }
    distancias = new double[tnodo];
    for (int i = 0; i < tnodo; i++){
      distancias[i] = Double.MAX_VALUE;
    }
    camino = new Linea[200];
    for (int i = 0; i < tnodo; i++) {
      TableRow row=tabladeposiciones.getRow(i);
      if (i<77) {
        nodo[i]=new Nodo(new PVector(width/2-row.getInt(0), height/2-row.getInt(1)), 5, i+1, colnodo1a, colnodo1b/*,row.getString(2),row.getString(3)*/);
      } else {
        nodo[i]=new Nodo(new PVector(width/2-row.getInt(0), height/2-row.getInt(1)), 3, i+1, colnodo2a, colnodo2b/*,row.getString(2),row.getString(3)*/);
      }
    }   
    for (int i=0; i<2; i++) {
      selecciones[i]=new Nodo(new PVector(0, 0), 5, 0, colnodo1a, colnodo1b/*, "seleccion", "NA"*/);             
    }
    //opcion = new Nodo[11];
    //for (int i = 0; i<4; i++) {
    //  opcion[i]=new Nodo(new PVector(width*1/32, height*(i+4)/16), 15);
    //}
    //for (int i=0; i<7; i++) {
    //  opcion[i+4]=new Nodo(new PVector(width*25/32, height*(i+4)/16), 15);
    //}
    linea= new Linea[tgrafo];    
    int tlinea=0;
    for (int i = 0; i < tablaconexiones.getRowCount(); i++) {
      TableRow row=tablaconexiones.getRow(i);
      for (int j = i; j < tablaconexiones.getColumnCount(); j++) {
        if (row.getInt(j) == 1) {
          linea[tlinea]=new Linea(nodo[i].posicion, nodo[j].posicion);
          nodo[i].connectNewNode(nodo[j].z);
          nodo[j].connectNewNode(nodo[i].z);
          tlinea++;
        }
      }
      
    }
    
    //
    
    
    
    //Se elige desde que nodo se quiere empezar (El nodo 21 en este caso)
    //createPathStart(nodo1);
    //Hacer que dibuje el camino desde el nodo 21 hasta el nodo 38 (en este caso)
    //drawShorterPath(nodo2,nodo1);
    
  
    
    
    
    
    //
  }

  void setTamanografo(Table aa) {
    for (int i = 0; i < aa.getRowCount(); i++) {
      for (int j = i; j < aa.getColumnCount(); j++) {
        if (aa.getInt(i, j) > 0) {
          tgrafo=tgrafo+aa.getInt(i, j);
        }
      }
    }
  }


  void setTamanotablas(Table aa) {
    tnodo=aa.getRowCount();
  }

  void setTablaconexiones(Table a) {
    tablaconexiones=a;
  }

  void setTablaposiciones(Table ee) {
    tabladeposiciones=ee;
  }
  void mouse1 () {
    for (int i=0; i<tnodo; i++) {
      if (ninicial) {        
        if (nodo[i].pick(mouseX, mouseY)) {
          selecciones[0].setPosicion(new PVector(nodo[i].posicion.x, nodo[i].posicion.y));
          selecciones[0].setTamano(5);
          selecciones[0].setNumnodo(nodo[i].getNumnodo());
          nodo1=selecciones[0].getNumnodo();
          println(nodo1);
          selecciones[0].setColnodo1(colnodo1a);
          selecciones[0].setColnodo2(colnodo1a);
          //selecciones[0].setNombre("Selección");
          //selecciones[0].setNumero("NA");
          ninicial=false;
        }
      }
      if (nfinal) {        
        if (nodo[i].pick(mouseX, mouseY)) {
          selecciones[1].setPosicion(new PVector(nodo[i].posicion.x, nodo[i].posicion.y));
          selecciones[1].setTamano(5);
          selecciones[1].setNumnodo(nodo[i].getNumnodo());
          nodo2=selecciones[1].getNumnodo();
          println(nodo2);
          selecciones[1].setColnodo1(colnodo2a);
          selecciones[1].setColnodo2(colnodo2a);
          //selecciones[1].setNombre("Selección");
          //selecciones[1].setNumero("NA");
          nfinal=false;
        }
      }
      for(int j=0 ; j<2 ;j++){
         
        if(selecciones[0].getNumnodo()!=0) nodo1=selecciones[0].getNumnodo();
        if(selecciones[1].getNumnodo()!=0) {nodo2=selecciones[1].getNumnodo();createPathStart(nodo1);drawShorterPath(nodo2,nodo1);}
        
      }
    }
  }
  //Crear los caminos desde el nodo n
  void createPathStart (int n){
    for (int i = 0; i < tnodo; i++){
      condiciones[i] = 0;
    }
    for (int i = 0; i < tnodo; i++){
      distancias[i] = Double.MAX_VALUE;
    }
    padres[n-1] = n-1;
    condiciones[n-1] = 1;
    distancias[n-1] = 0;
    for (int i = 0; i < nodo.length; i++){
      for (int j = 0; j < nodo.length; j++){
        if (condiciones[j] == 1){
          for (int k = 0; k < nodo[j].cantidadConexiones(); k++){
            int kk = nodo[j].getConexion(k)-1;
            //System.out.println("Nodo " + (j+1) + " " + nodo[j].cantidadConexiones() + " " + nodo[kk].z);
            if (condiciones[kk] == 0){
              double dist = distancia(nodo[j],nodo[kk]) + distancias[j];
              if (distancias[kk] > dist){
                distancias[kk] = dist;
                padres[kk] = j;
              }
            }
          }
        }
      }
      
      double min = Double.MAX_VALUE;
      int jmin = 0;
      for (int j = 0; j < nodo.length; j++){
        if (condiciones[j] == 0){
          if (min > distancias[j]){
            min = distancias[j];
            jmin = j;
          }
        }
      }
      condiciones[jmin] = 1;
      for (int j = 0; j < nodo.length; j++){
        if (condiciones[j] == 0){
          distancias[j] = Double.MAX_VALUE;
        }
      }
    }
  }
  
  double distancia (Nodo a, Nodo b){
    return Math.sqrt(((a.posicion.x-b.posicion.x)*(a.posicion.x-b.posicion.x))+((a.posicion.y-b.posicion.y)*(a.posicion.y-b.posicion.y)));
  }
  
  void drawShorterPath (int n, int start){
    int i = n-1;
    int index = 0;
    while (padres[i] != start-1){
      camino[index] = new Linea(nodo[i].posicion,nodo[padres[i]].posicion);
      //System.out.println(padres[i]+1);
      i = padres[i];
      index++;
    }
    camino[index] = new Linea(nodo[i].posicion,nodo[padres[i]].posicion);
  }

  void display() {    
    pushStyle();
    strokeWeight(8);
    stroke(255, 255, 0);
    strokeWeight(10);
    fill(0);
    if (linea.length>0) {
      for (int i = 0; i<linea.length; i++) {
        if (linea[i]!=null) {
          linea[i].display();
        }
      }
    }
    for (int i = 0; i < nodo.length; i++) {
      nodo[i].display();
    }
    for (int i = 0; i < selecciones.length; i++) {
      if (selecciones[i].z!=-1) {
        selecciones[i].display();
      }
    }
    
    pushStyle();
    strokeWeight(2);
    stroke(0, 0, 0);
    strokeWeight(5);
    fill(0);
    
    for (int i = 0; i < camino.length; i++){
      if (camino[i] == null){
        break;
      }
      PVector a = camino[i].puntoinicial;
      PVector b = camino[i].puntofinal;
      line(a.x,a.y,b.x,b.y);
    }
    //for (int i = 0; i < opcion.length; i++) {
    //  opcion[i].display();
    //  if (i<4) {
    //    text(nombres[i], width*1/8, height*(i+4)/16+5 );
    //  } else {
    //    text(nombres[i], width*7/8, height*(i)/16 +5);
    //  }
    //}
  }
  
  
  
}
