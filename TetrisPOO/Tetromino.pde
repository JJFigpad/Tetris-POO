//Clase tetromino
class Piece{
  color c=color(50,100,100);
  float xpos=width/2;
  float ypos=height/2;
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
          rect(i*width/4,j*height/4,width/4,height/4);
        }
      }
    }
  }


}
