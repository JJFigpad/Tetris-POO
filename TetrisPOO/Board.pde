class Board {
  String[]Tablero;
  int rows,cols;
  Board(int rows1,int cols1){
    rows=rows1;
    cols=cols1;
    Tablero = new String [rows+1];
    for(int i=0;i<rows;i++){
      Tablero[i]="1";
      for(int j=0;j<cols;j++){
        Tablero[i]+="0";
      }
      Tablero[i]+="1";
    }
    Tablero[rows]="";
    for(int j=0; j<cols+2;j++){
      Tablero[rows]+="1";
    }
  }
  void display(int colourTablero){
    fill(colourTablero);
    rect(hspace,vspace,width-hspace-h2space,height-2*vspace);
    stroke(255-alpha(colourTablero));
    for (int i=0; i<=COLS;i++){
      line(i*(width-hspace-h2space)/COLS+hspace,vspace,
           i*( width-hspace-h2space)/COLS+hspace,height-vspace);
    }
    for (int i=0; i<=ROWS;i++){
      line(hspace,i*(height-2*vspace)/ROWS+vspace,
           width-h2space,i*(height-2*vspace)/ROWS+vspace);
    }
    for(int i=0;i<rows;i++){
      for(int j=0; j<cols;j++){
        if (Tablero[i].charAt(j+1)!='0'){
          fill(colors[ Character.getNumericValue(Tablero[i].charAt(j+1) )]);
          rect(j*(width-hspace-h2space)/COLS+hspace,i*(height-2*vspace)/ROWS+vspace,
               (width-hspace-h2space)/COLS,(height-2*vspace)/ROWS);
        }
      }
    }
  }
  void print1(){
    for(int i=0;i<rows+1;i++){
      println(Tablero[i]);
    }
  }
  boolean collision(Piece piece,int movX,int movY){
  for(int i=0;i<4;i++){
      for(int j=0;j<4;j++){
        if(piece.ypos<0){continue;}
        if (piece.Tetro[j].charAt(i)!='0'){
          if(Tablero[i+piece.ypos+movY].charAt(j+piece.xpos+1+movX)!='0'){
            return true;
          }
        }
      }
    }
    return false;
  }

  void newTablero(Piece piece){
    char[] a;
    StringBuilder b;
    for(int i=0;i<4 && i+piece.ypos<rows;i++){
      b= new StringBuilder();
      a=Tablero[i+piece.ypos].toCharArray();
      for(int j=0;j<4;j++){
        if (piece.Tetro[j].charAt(i)!='0'){
          if(a[j+piece.xpos+1]!='0'){
            print("Error");
            noLoop();
            //Board(rows,cols);
          }
          a[j+piece.xpos+1]=char(piece.n+'0');
        }
      }
      for(char c:a){b.append(c);}
      Tablero[i+piece.ypos]= b.toString();
    }

    for (int j=0;j<rows;j++){
      if (completeRow(j)){
        Tablero=deleteRow(j);
      }
    }

  }
  boolean completeRow(int j){
    for (int i=0;i<cols;i++){
      if(Tablero[j].charAt(i+1)=='0'){
        return false;
      }
    }
    return true;
  }
  String[] deleteRow(int j){
    String[] a=new String[rows+1];
    int counter=1;//counter<rows+1
    println("j=",j);
    for (int i=1;i<rows+1;i++){
      println(i,rows-i,counter,rows-counter);
      if(rows-counter==j){counter++;}
      if(counter>=rows+1){continue;}
      else{
        a[rows-i]=Tablero[rows-counter];
      }
      println(i,rows-i,counter,rows-counter);
      counter++;
    }

    a[0]="1";
    a[rows]="1";
    for (int k=0;k<cols;k++){
      a[0]+="0";
      a[rows]+="1";
    }
    a[0]+="1";
    a[rows]+="1";
    return a;
  }
}
