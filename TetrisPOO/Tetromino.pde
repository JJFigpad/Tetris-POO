//Clase tetromino
class Piece{
  color c=color(50,100,100);
  float xpos=0;
  float ypos=0;
  String[]Tetro = new String [4];

  //Constructor
  Piece(){
    Tetro[0]="0000";
    Tetro[1]="0000";
    Tetro[2]="0011";
    Tetro[3]="0011";
  }

  void display(){
    fill(c);
    for(int i=0;i<4;i++){
      for(int j=0; j<4;j++){
        if (Tetro[i].charAt(j)=='1'){
          rect((i+xpos)*width/8,(j+ypos)*height/8,width/8,height/8);
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
