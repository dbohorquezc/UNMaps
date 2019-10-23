class Grafo {
  Table tabladeposiciones, tablaconexiones;
  int tnodo, tgrafo;
  String[] nombres={"Calle 26", "Carrera 30", "Calle 53", "Carrera 40", "F. Cien. Humanas", "Economia", "El viejo", "Aulas de ing.", "Plaza che", "Medicina", "Cyt"};
  //Boolean[] seleccion={false,false,false,false,false,false,false,false,false,false,false};
  Nodo[] nodo;
  Nodo[] opcion;
  Linea[] linea;

  Grafo(Table a, Table b) {
    setTablaposiciones(a);
    setTamanotablas(a);
    setTamanografo(b);    
    setTablaconexiones(b);
    nodo = new Nodo[tnodo];
    for (int i = 0; i < tnodo; i++) {
      TableRow row=tabladeposiciones.getRow(i);
      nodo[i]=new Nodo(new PVector(width/2-row.getInt(0), height/2-row.getInt(1)), 5);
    }    
    opcion = new Nodo[11];
    for (int i = 0; i<4; i++) {
      opcion[i]=new Nodo(new PVector(width*1/32, height*(i+4)/16), 15);
    }
    for (int i=0; i<7; i++) {
      opcion[i+4]=new Nodo(new PVector(width*25/32, height*(i+4)/16), 15);
    }
    linea= new Linea[tgrafo];    
    int tlinea=0;
    for (int i = 0; i < 11; i++) {
      TableRow row=tablaconexiones.getRow(i);
      for (int j = i; j <11; j++) {
        if (row.getInt(j) == 1) {
          linea[tlinea]=new Linea(nodo[i].posicion, nodo[j].posicion);
          tlinea++;
        }
      }
    }
  }

  void setTamanografo(Table aa) {
    for (int i = 0; i < aa.getRowCount(); i++) {
      for (int j = i; j < aa.getColumnCount(); j++) {
        if (aa.getInt(i, j) > 0) {
          tgrafo=tgrafo+aa.getInt(i, j);
          ;
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


  void display() {    
    pushStyle();
    strokeWeight(8);
    stroke(255, 255, 0);
    strokeWeight(10);
    fill(0);
    for (int i = 0; i<linea.length; i++) {
      linea[i].display();
    }
    textSize(22);
    fill(0);
    strokeWeight(3);  
    for (int i = 0; i < nodo.length; i++) {
      nodo[i].display();
    }
    for (int i = 0; i < opcion.length; i++) {
      opcion[i].display();
      if (i<4) {
        text(nombres[i], width*1/8, height*(i+4)/16+5 );
      } else {
        text(nombres[i], width*7/8, height*(i)/16 +5);
      }
    }
  }
}
