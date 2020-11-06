import java.util.Arrays;

//Driver
Piece myTetro;
Board myBoard;
int time=0;
int COLS=5,ROWS=15;
int nTetro=0;
int hspace, h2space, vspace;

void setup(){
  size(400,400);
  hspace=50;
  h2space=width/2;
  vspace=50;
  myTetro = new Piece(nTetro);
  myBoard = new Board(ROWS,COLS);
  myBoard.print1();
}

void draw(){

  myBoard.display();
  myTetro.display();
  if(time*1000<millis()){
    time++;
    myTetro.fall(myBoard);
  }


}

void keyPressed() {//Si se oprime una tecla
  if (key == CODED) {
    if (keyCode == UP) {//Si la tecla es la flecha superior
      myTetro.rotate();
    } else if (keyCode == DOWN) {//Si la flecha es la flecha inferior
      while(myBoard.collision(myTetro.Tetro,myTetro.xpos,myTetro.ypos+1)==false){
        myTetro.fall(myBoard);
      }
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myBoard,1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myBoard,-1,0);
    }
  }
}
