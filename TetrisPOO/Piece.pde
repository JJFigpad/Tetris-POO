class Piece{
  color c=color(50,100,100);
  float xpos=0;
  float ypos=0;
  String[]Tetro = new String [4];

  //Constructor
  Piece(int n){
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
          rect((i+xpos)*width/COLS,(j+ypos)*height/ROWS,width/COLS,height/ROWS);
        }
      }
    }
  }
  void rotate (){
    println(Tetro);
    char []a= new char[4];
    String []rotated= new String[4];
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        a[j]=Tetro[j].charAt(i);
      }
      rotated[i]= new String(a);
    }
    Tetro=reverse(rotated);
    println(Tetro);
  }
  void move(int a, int b){
    xpos +=a;
    ypos +=b;
  }


}
