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
  
  void print(){
    for(int i=0;i<rows+1;i++){
      println(Tablero[i]);
    }
  }
}
