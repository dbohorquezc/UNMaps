class Grafo {
  Table tabladeposiciones, tablaconexiones;
  int tnodo, tgrafo;
  Nodo[] nodo;
  Nodo[] opcion;
  Linea[] linea;

  //int [][]lineas ;
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
    for (int i = 0; i < tnodo; i++) {
      TableRow row=tabladeposiciones.getRow(i);
      if (i<77) {
        nodo[i]=new Nodo(new PVector(width/2-row.getInt(0), height/2-row.getInt(1)), 5, i+1, colnodo1a, colnodo1b,row.getString(2),row.getString(3));
      } else {
        nodo[i]=new Nodo(new PVector(width/2-row.getInt(0), height/2-row.getInt(1)), 3, i+1, colnodo2a, colnodo2b,row.getString(2),row.getString(3));
      }
    }

    //linea= new Linea[tgrafo];    
    //int tlinea=0;
    //for (int i = 0; i < tablaconexiones.getRowCount(); i++) {
    //  TableRow row=tablaconexiones.getRow(i);
    //  for (int j = i; j <tablaconexiones.getColumnCount(); j++) {
    //    if (row.getInt(j) == 1) {
    //      linea[tlinea]=new Linea(nodo[i].posicion, nodo[j].posicion);
    //      tlinea++;
    //    }
    //  }
    //}

    //lineas=new int[tablaconexiones.getRowCount()][tablaconexiones.getColumnCount()];
    //for (int i=0; i<tablaconexiones.getRowCount(); i++) {
    //  TableRow row=tablaconexiones.getRow(i);
    //  for (int j=0; j<tablaconexiones.getColumnCount(); j++) {
    //    lineas[i][j]=row.getInt(j);
    //  }
    //}

    //for (int i=0; i<tablaconexiones.getRowCount(); i++) {
    //  for (int j=0; j<tablaconexiones.getColumnCount(); j++) {
    //    if (lineas[i][j]!=lineas[j][i]) {
    //      println(i+1,j+1);
    //    }
    //  }
    //}
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
    //if (linea.length>0) {
    //  for (int i = 0; i<linea.length; i++) {
    //    if (linea[i]!=null) {
    //      linea[i].display();
    //    }
    //  }
    //}  
    for (int i = 0; i < nodo.length; i++) {
      nodo[i].display();
    }
  }
}
