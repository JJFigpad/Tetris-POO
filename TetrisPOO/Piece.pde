class Piece{
  color c=color(50,100,100);
  int xpos=0;
  int ypos=0;
  int n;
  String[]Tetro = new String [4];

  //Constructor
  Piece(int n1){
    n=n1;
    if (n==0){
      Tetro[0]="1100";
      Tetro[1]="1100";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==1){
      Tetro[0]="1111";
      Tetro[1]="0000";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==2){
      Tetro[0]="1110";
      Tetro[1]="1000";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==3){
      Tetro[0]="1110";
      Tetro[1]="0010";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==4){
      Tetro[0]="1100";
      Tetro[1]="0110";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==5){
      Tetro[0]="0110";
      Tetro[1]="1100";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==6){
      Tetro[0]="1111";
      Tetro[1]="0000";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }


  }

  void display(){
    fill(c);
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        if (Tetro[i].charAt(j)=='1'){
          rect((i+xpos)*(width-hspace-h2space)/COLS+hspace,(j+ypos)*(height-2*vspace)/ROWS+vspace,
               (width-hspace-h2space)/COLS,(height-2*vspace)/ROWS);
        }
      }
    }
  }
  void rotate (){
    char []a= new char[4];
    String []rotated= new String[4];
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        a[j]=Tetro[j].charAt(i);
      }
      rotated[i]= new String(a);
    }
    Tetro=reverse(rotated);
  }
    void move(Piece piece,Board myboard, int movX, int movY){
    if (myboard.collision(piece,movX,movY)==false){
      xpos +=movX;
      ypos +=movY;
    }
  }

  void fall(Piece piece,Board myboard){
    if (myboard.collision(piece,0,1)==false){
      xpos +=0;
      ypos +=1;
    }else{
      myBoard.newTablero(piece);
      myBoard.print1();
      myTetro= new Piece(int(random(0,6)));
      piece = new Piece(int(random(0,6)));
      print(piece.Tetro[0]);
    }
  }
}
