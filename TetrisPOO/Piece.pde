class Piece{
  color c=color(50,100,100);
  int xpos=0;
  int ypos=-3;
  int n;
  String[]Tetro = new String [4];

  //Constructor
  Piece(int n1){
    n=n1;
    if (n==1){
      Tetro[0]="0000";
      Tetro[1]="0110";
      Tetro[2]="0110";
      Tetro[3]="0000";
    }
    if (n==2){
      Tetro[0]="0000";
      Tetro[1]="2222";
      Tetro[2]="0000";
      Tetro[3]="0000";
    }
    if (n==3){
      Tetro[0]="0000";
      Tetro[1]="0300";
      Tetro[2]="0333";
      Tetro[3]="0000";
    }
    if (n==4){
      Tetro[0]="0000";
      Tetro[1]="0040";
      Tetro[2]="4440";
      Tetro[3]="0000";
    }
    if (n==5){
      Tetro[0]="0000";
      Tetro[1]="0550";
      Tetro[2]="5500";
      Tetro[3]="0000";
    }
    if (n==6){
      Tetro[0]="0000";
      Tetro[1]="6600";
      Tetro[2]="0660";
      Tetro[3]="0000";
    }
    if (n==7){
      Tetro[0]="0700";
      Tetro[1]="0770";
      Tetro[2]="0700";
      Tetro[3]="0000";
    }


  }

  void display(){
    fill(colors[n]);
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        if (Tetro[i].charAt(j)!='0'&& ypos+j>=0){
          rect((i+xpos)*(width-hspace-h2space)/COLS+hspace,(j+ypos)*(height-2*vspace)/ROWS+vspace,
               (width-hspace-h2space)/COLS,(height-2*vspace)/ROWS);
        }
      }
    }
  }
  void rotate (Piece piece){
    if(myBoard.collisionRotate(piece)==false){
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
  }
    void move(Piece piece,Board myboard, int movX, int movY){
    if (myboard.collisionMove(piece,movX,movY)==false){
      xpos +=movX;
      ypos +=movY;
    }
  }

  void fall(Piece piece,Board myboard){
    if (myboard.collisionMove(piece,0,1)==false){
      xpos +=0;
      ypos +=1;
    }else{
      myBoard.newTablero(piece);
      myBoard.print1();
      myTetro= new Piece(int(random(1,7)));
      piece = new Piece(int(random(1,7)));
      print(piece.Tetro[0]);
    }
  }
}
