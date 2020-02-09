  
void ejecutar(int a) {
  color cl=color(135, 255, 119); 
  PVector pos= new PVector(width/2, height/2-50);  
  PVector dimen= new PVector(190, 40);

  color cli=color(135, 255, 119); 
  PVector posi= new PVector(width/2, height/2+50);  
  PVector dimeni= new PVector(190, 40);

  //Valores para un nuevo boton
  //color clr=color(255, 126, 126); 
  //PVector posr= new PVector(width/2-120, (height+img.height)/2+30);  
  //PVector dimenr= new PVector(210, 40);

  color clg=color(255, 126, 126); 
  PVector posg= new PVector(width/2, (height+img.height)/2+50);  
  PVector dimeng= new PVector(210, 40);  
  PVector preturned1= new PVector(width*1/2-80, (height-img.height)/2-30);
  PVector pauto= new PVector(width*1/2-20, (height-img.height)/2-30);
  PVector pcamina= new PVector(width*1/2+20, (height-img.height)/2-30);   
  PVector pos1 = new PVector(width*1/8, height*2/16+100);
  PVector pos2 = new PVector(width*7/8, height*2/16+100); 

  Boton nivelo=new BotonRect(cl, pos, 1, 15, 28, dimen, "Empezar ruta", 0);

  Boton instruc=new BotonRect(cli, posi, 2, 15, 28, dimeni, "Instrucciones", 0);

  Boton generate=new BotonRect(clg, posg, 6, 15, 28, dimeng, "Generar ruta", 0);

  Boton returned=new BotonCirc(color(41, 74, 255), preturned1, 0, 1);
  Boton camina=new BotonCirc(color(41, 74, 255), pauto, 2, 2);
  Boton auto=new BotonCirc(color(41, 74, 255), pcamina, 3, 3);
  
  Boton partida =new BotonRect(color(41, 74, 255), pos1, 3, 15, 28, dimeng, "Asignar", 0);
  
  Boton llegada =new BotonRect(color(41, 74, 255), pos2, 4, 15, 28, dimeng, "Asignar", 0);
  switch(a) {

  case 0:
    background(255, 255, 255);    
    textAlign(CENTER);   
    textSize(56);
    fill(1, 62, 255);
    text("¡Bienvenido a UNMaps!", width*1/2, height*3/16 );
    nivelo.display();  
    instruc.display();
    nivelo.asignarValor();  
    instruc.asignarValor();
    break;  
  case 1:    
    background(255, 255, 255);    
    textAlign(CENTER);   
    textSize(28);    
    fill(1, 62, 255);
    text("Seleccione su punto", width*1/8, height*2/16 );
    text("de partida", width*1/8, height*3/16 );    
    text("Seleccione su punto", width*7/8, height*2/16 );
    text("de llegada", width*7/8, height*3/16 );
    image(img, (width-img.width)/2, (height-img.height)/2);  
    generate.display();
    generate.asignarValor();
    mapa.display();    
    returned.display();
    returned.asignarValor();
    camina.display();
    camina.asignarValor();
    auto.display();
    auto.asignarValor();  
    llegada.display();
    llegada.asignarValor();
    partida.display();
    partida.asignarValor();
    textSize(10);
    text("Coordena x "+ (width/2 - mouseX)+" Coordenada Y"+(height/2-mouseY), 100, 600);  
    if ((mapa.selecciones[0].z)!=-1) {
      text(mapa.selecciones[0].z, 100, 660);
    }
    break;

  case 2:
    image(img1, (width-img1.width)/2, (height-img1.height)/2);
    returned.display();
    returned.asignarValor();
    break;
  }
}