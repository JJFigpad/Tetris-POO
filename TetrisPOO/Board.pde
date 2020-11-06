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

  void print1(){
    for(int i=0;i<rows+1;i++){
      println(Tablero[i]);
    }
  }
  boolean collision(String[] Tetro, int xpos, int ypos){
    //print1();
    print(Tetro);
    for(int i=0;i<4;i++){
      print("\n");
      for(int j=0;j<4;j++){

        print(" ",Tetro[j].charAt(i));
        if (Tetro[j].charAt(i)=='1'){
          print(Tablero[i+ypos].charAt(j+xpos+1));
          if(Tablero[i+ypos].charAt(j+xpos+1)=='1'){
            print("\n no \n");
            return false;
          }
        }
      }
    }
    print("\n Yas");
    return true;
  }
}
