import java.util.Arrays;

//Driver
Piece myTetro;
Board myBoard;
int time=0;
int COLS=5,ROWS=15;
int nTetro=0;
int hspace, h2space, vspace;
color[] colors=new color[8];


void setup(){
  size(400,400);
  colors[1]=#F786FF;
  colors[2]=#FF86E3;
  colors[3]=#8D86FF;
  colors[4]=#86FCFF;
  colors[5]=#86FFAB;
  colors[6]=#E2FF86;
  colors[7]=#FFCB86;
  hspace=50;
  h2space=width/2;
  vspace=50;
  myTetro = new Piece(int(random(1,8)));
  myBoard = new Board(ROWS,COLS);
  myBoard.print1();
}

void draw(){

  myBoard.display();
  myTetro.display();
  if(time*1000<millis()){
    time++;
    myTetro.fall(myTetro,myBoard);
  }


}

void keyPressed() {//Si se oprime una tecla
  if (key == CODED) {
    if (keyCode == UP) {//Si la tecla es la flecha superior
      myTetro.rotate();
    } else if (keyCode == DOWN) {//Si la flecha es la flecha inferior
      while(myBoard.collision(myTetro,0,1)==false){
        myTetro.fall(myTetro,myBoard);
      }
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myTetro,myBoard,1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myTetro,myBoard,-1,0);
    }
  }
}
