class Board {
  String[]Tablero;
  int rows,cols;
  int colorTablero=0;

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
  void display(){
    fill(colorTablero);
    rect(hspace,vspace,width-hspace-h2space,height-2*vspace);
    stroke(255-alpha(colorTablero));
    for (int i=0; i<=COLS;i++){
      line(i*(width-hspace-h2space)/COLS+hspace,vspace,
           i*( width-hspace-h2space)/COLS+hspace,height-vspace);
    }
    for (int i=0; i<=ROWS;i++){
      line(hspace,i*(height-2*vspace)/ROWS+vspace,
           width-h2space,i*(height-2*vspace)/ROWS+vspace);
    }
    for(int i=extra;i<rows+extra;i++){
      for(int j=0; j<cols;j++){
        if (Tablero[i].charAt(j+1)!='0'){
          fill(colors[ Character.getNumericValue(Tablero[i].charAt(j+1) )]);
          rect(j*(width-hspace-h2space)/COLS+hspace,(i-extra)*(height-2*vspace)/ROWS+vspace,
               (width-hspace-h2space)/COLS,(height-2*vspace)/ROWS);
        }
      }
    }
  }
  void print1(){
    for(int i=0;i<rows+1+extra;i++){
      println(Tablero[i]);
    }
  }
  boolean collisionMove(Piece piece,int movX,int movY){
  for(int i=0;i<4;i++){
      for(int j=0;j<4;j++){

        if(piece.ypos+movY+i<0){continue;}
        if (piece.Tetro[j].charAt(i)!='0'){
          if(Tablero[i+piece.ypos+movY].charAt(j+piece.xpos+1+movX)!='0'){
            if(piece.ypos<=-extra){gameOver();}
            return true;
          }
        }
      }
    }
    return false;
  }
  boolean collisionRotate(Piece piece){
    for(int i=0;i<4;i++){
      for(int j=0;j<4;j++){
        if(piece.ypos<0){continue;}
        if (piece.Tetro[4-1-i].charAt(4-1-j)!='0'){
          if(Tablero[i+piece.ypos].charAt(j+piece.xpos+1)!='0'){
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
    for(int i=0;i<4 && i+piece.ypos<rows+extra;i++){
      b= new StringBuilder();
      if (i+piece.ypos<extra-1){page=2;}
      a=Tablero[i+piece.ypos].toCharArray();
      for(int j=0;j<4;j++){
        if (piece.Tetro[j].charAt(i)!='0'){
          if(a[j+piece.xpos+1]!='0'){
            print("Game Over");
            gameOver();
          }
          a[j+piece.xpos+1]=char(piece.n+'0');
        }
      }
      for(char c:a){b.append(c);}
      Tablero[i+piece.ypos]= b.toString();
    }
    int counterRows=0;
    for (int j=0;j<rows+extra;j++){
      if (completeRow(j)){
        Tablero=deleteRow(j);
        counterRows++;
      }
    }
    points+=pow(difPoints,counterRows);

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
    String[] a=new String[rows+extra+1];
    int counter=1;//counter<rows+extra+1
    println("j=",j);
    for (int i=1;i<rows+extra+1;i++){
      println(i,rows+extra-i,counter,rows+extra-counter);
      if(rows+extra-counter==j){counter++;}
      if(counter>=rows+extra+1){continue;}
      else{
        a[rows+extra-i]=Tablero[rows+extra-counter];
      }
      println(i,rows+extra-i,counter,rows+extra-counter);
      counter++;
    }

    a[0]="1";
    a[rows+extra]="1";
    for (int k=0;k<cols;k++){
      a[0]+="0";
      a[rows+extra]+="1";
    }
    a[0]+="1";
    a[rows+extra]+="1";
    return a;
  }
}
