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
  void display(){
    background(155);
    for (int i=0; i<=COLS;i++){
      line(i*(width-hspace-h2space)/COLS+hspace,vspace,
           i*( width-hspace-h2space)/COLS+hspace,height-vspace);
    }
    for (int i=0; i<=ROWS;i++){
      line(hspace,i*(height-2*vspace)/ROWS+vspace,
           width-h2space,i*(height-2*vspace)/ROWS+vspace);
    }
    fill(100,100,200);
    for(int i=0;i<rows;i++){
      for(int j=0; j<cols;j++){
        if (Tablero[i].charAt(j+1)=='1'){
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
  boolean collision(String[] Tetro, int xpos, int ypos){
    for(int i=0;i<4;i++){
      for(int j=0;j<4;j++){
        if (Tetro[j].charAt(i)=='1'){
          if(Tablero[i+ypos].charAt(j+xpos+1)=='1'){
            return false;
          }
        }
      }
    }
    return true;
  }
  void newTablero(String[] Tetro, int xpos, int ypos){
    char[] a;
    StringBuilder b;
    for(int i=0;i<4 && i+ypos<rows;i++){
      b= new StringBuilder();
      a=Tablero[i+ypos].toCharArray();
      for(int j=0;j<4;j++){
        if (Tetro[j].charAt(i)=='1'){
          if(a[j+xpos+1]=='1'){print("Error");}
          a[j+xpos+1]='1';
        }
      }
      for(char c:a){b.append(c);}
      Tablero[i+ypos]= b.toString();
    }

  }



}
