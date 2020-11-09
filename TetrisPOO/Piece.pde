class Piece{
  color c;
  int xpos=int(random(0,COLS-4-1));
  int ypos=0;
  int n;//Tipo de tetromino
  String[]Tetro = new String [4];//Representación

  //Constructor

  Piece(int n1){
    n=n1;//Tipo de tetromino
    if (n==1){
      Tetro[0]="0000";
      Tetro[1]="0110";
      Tetro[2]="0110";
      Tetro[3]="0000";
    }
    if (n==2){
      Tetro[0]="0000";
      Tetro[1]="2222";//Los diferentes dígitos indican el color
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
  //Display fijo(para el próximo Tetromino)
  void display(float xpos1, float ypos1,float side){
    fill(colors[n]);//Colorea del color que es
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        if (Tetro[i].charAt(j)!='0'){//Dibuja el bloque
          rect(i*side/4+xpos1,j*side/4+ypos1,side/4,side/4);
        }
      }
    }
  }
  void display(){//Display en el tablero
    if(ypos==extra-2 && changeNextN){//Cambia el próximo Tetromino
      nextN=int(random(1,8));
      println("changeNextN:",nextN);
      nextTetro= new Piece(nextN);
      changeNextN=false;
    }
    fill(colors[n]);//Colorea del color que es
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        if (Tetro[i].charAt(j)!='0'&& ypos+j-extra>=0){//Dibuja el bloque
          rect((i+xpos)*(width/2-hspace-h2space)/COLS+hspace,(j+ypos-extra)*(height-2*vspace)/ROWS+vspace,
               (width/2-hspace-h2space)/COLS,(height-2*vspace)/ROWS);
        }
      }
    }
  }
  void rotate (){//Rota el tetromino
    char []a= new char[4];//Guarda una fila
    String []rotated= new String[4];//Guarda nuevo tetromino
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        a[j]=Tetro[j].charAt(i);//Matriz adjunta
      }
      rotated[i]= new String(a);
    }
    Tetro=reverse(rotated);//Refleja verticalmente
  }
  void move(int movX, int movY){//Mueve el tetromino
    xpos +=movX;
    ypos +=movY;
  }
}
