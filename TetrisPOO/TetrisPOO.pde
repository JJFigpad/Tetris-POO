import java.util.Arrays;

//Driver
Piece myTetro;
Board myBoard;
int time=0;
int COLS=4,ROWS=5;
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
  background(155);
  for (int i=0; i<=COLS;i++){
    line(i*(width-hspace-h2space)/COLS+hspace,vspace,
         i*( width-hspace-h2space)/COLS+hspace,height-vspace);
  }
  for (int i=0; i<=ROWS;i++){
    line(hspace,i*(height-2*vspace)/ROWS+vspace,
         width-h2space,i*(height-2*vspace)/ROWS+vspace);
  }
  myTetro.display();
  if(time*1000<millis()){
    time++;
    myTetro.move(myBoard,0,1);
  }


}

void keyPressed() {//Si se oprime una tecla
  if (key == CODED) {
    if (keyCode == UP) {//Si la tecla es la flecha superior
      myTetro.rotate();
    } else if (keyCode == DOWN) {//Si la flecha es la flecha inferior
      nTetro=int(random(0,6));
      myTetro= new Piece(nTetro);
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myBoard,1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myBoard,-1,0);
    }
  }
}
