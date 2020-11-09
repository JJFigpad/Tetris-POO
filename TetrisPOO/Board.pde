class Board {
  String[]Tablero;//Representación del tablero
  int rows,cols;
  int colorTablero=0;

  //Inicializa el tablero con límites como una matriz de 1`s y 0`s (ejemplo en README)
  Board(int rows1,int cols1){
    rows=rows1;
    cols=cols1;
    Tablero = new String [rows+1+extra];
    for(int i=0;i<rows+extra;i++){
      Tablero[i]="1";
      for(int j=0;j<cols;j++){
        Tablero[i]+="0";
      }
      Tablero[i]+="1";
    }
    Tablero[rows+extra]="";
    for(int j=0; j<cols+2;j++){
      Tablero[rows+extra]+="1";
    }
  }
  void display(){//Dibuja el tablero
    fill(colorTablero);//Colorea el tablero
    rect(hspace,vspace,width/2-hspace-h2space,height-2*vspace);
    stroke(255-alpha(colorTablero));
    for (int i=0; i<=COLS;i++){//Dibuja líneasverticales
      line(i*(width/2-hspace-h2space)/COLS+hspace,vspace,
           i*( width/2-hspace-h2space)/COLS+hspace,height-vspace);
    }
    for (int i=0; i<=ROWS;i++){//Dibuja líneas horizontales
      line(hspace,i*(height-2*vspace)/ROWS+vspace,
           width/2-h2space,i*(height-2*vspace)/ROWS+vspace);
    }
    for(int i=0;i<rows+extra;i++){
      for(int j=0; j<cols;j++){
        if (Tablero[i].charAt(j+1)!='0'){
          if(i<extra){//Si está por encima de la altura, gameOver()
            page=2;
            print("Game Over, altura máxima");
            continue;
          }
          fill(colors[ Character.getNumericValue(Tablero[i].charAt(j+1) )]);//Colorea cada bloque del color que es
          rect(j*(width/2-hspace-h2space)/COLS+hspace,(i-extra)*(height-2*vspace)/ROWS+vspace,
               (width/2-hspace-h2space)/COLS,(height-2*vspace)/ROWS);//Dibuja bloque
        }
      }
    }
  }
  void print1(){//Imprime el tablero en la consola
    for(int i=0;i<rows+1+extra;i++){
      println(Tablero[i]);
    }
  }
  //Determina si un Tetromino piece se choca al moverse
  boolean collisionMove(Piece piece,int movX,int movY){
  for(int i=0;i<4;i++){
      for(int j=0;j<4;j++){
        //Si (posX+j,posY+i)+(movX,movY) ya está ocupado, sí hay choque
        if (piece.Tetro[j].charAt(i)!='0'){
          if(Tablero[i+piece.ypos+movY].charAt(j+piece.xpos+1+movX)!='0'){
            return true;
          }
        }
      }
    }
    return false;//Si no, no
  }
  //Determina si un Tetromino piece se choca al rotar
  boolean collisionRotate(Piece piece){
    for(int i=0;i<4;i++){
      for(int j=0;j<4;j++){
        if (piece.Tetro[4-1-i].charAt(4-1-j)!='0'){//Si bloque tetromino !=0
          if(Tablero[i+piece.ypos].charAt(j+piece.xpos+1)!='0'){//Si bloque tablero !=0
            return true;//Entonces sí 
          }
        }
      }
    }
    return false;//Si no, false
  }
    
  //Añade la un tetromino piece al tablero
  void newTablero(Piece piece){
    print("newTablero");
    char[] a;
    StringBuilder b;
    for(int i=0;i<4 && i+piece.ypos<rows+extra;i++){
      a=Tablero[i+piece.ypos].toCharArray();//Copia la fila del tablero
      for(int j=0;j<4;j++){
        if (piece.Tetro[j].charAt(i)!='0'){//Añade la información del tetromino
          if(a[j+piece.xpos+1]!='0'){print("Error");gameOver();}
          a[j+piece.xpos+1]=char(piece.n+'0');
        }
      }
      b= new StringBuilder();
      for(char c:a){b.append(c);}
      Tablero[i+piece.ypos]= b.toString();//Pasa la nueva información al tablero
    }
    int counterRows=0;
    for (int j=0;j<rows+extra;j++){
      if (completeRow(j)){//Si hay una fila completa
        Tablero=deleteRow(j);//Eliminarla
        counterRows++;
      }
    }//Si hubo filas completas, aumentar puntaje 
    if (counterRows!=0){points+=difPoints*pow(10,counterRows);}
    //Aumentar velocidad de bajada
    if (timeFrame>300){timeFrame-=timeDiference;}
  }

  boolean completeRow(int j){
    for (int i=0;i<cols;i++){
      if(Tablero[j].charAt(i+1)=='0'){
        return false;
      }
    }
    return true;
  }
  //Devuelve el tablero con la fila j eliminada
  String[] deleteRow(int j){
    String[] a=new String[rows+extra+1];//Nuevo tablero que se va a devolver
    int counter=1;
    println("delete row",j);
    for (int i=1;i<rows+1+extra;i++){
      if(rows+extra-counter==j){counter++;}//No añadir fila j
      if(counter>=rows+extra+1){continue;}//Contador está por fuera de rango
      else{//Copiar filas del tablero a a
        a[rows+extra-i]=Tablero[rows+extra-counter];
      }
      counter++;
    }
    //Añade fila superior e inferior
    a[0]="1";
    a[rows+extra]="1";
    for (int k=0;k<cols;k++){
      a[0]+="0";
      a[rows+extra]+="1";
    }
    a[0]+="1";
    a[rows+extra]+="1";
    return a;//Devuelve el nuevo tablero
  }
}
