import java.util.Arrays;

//Driver
Piece myTetro;
Board myBoard;
Piece nextTetro;
int nextN=int(random(1,8));
int points=0;
int difPoints=100;
int time=0, timeFrame=600,timeDiference=1;
int extra=4;
int COLS=10,ROWS=15;
int page=0;
int hspace, h2space, vspace;
color colorTablero=0, colorCanvas=0;
color[] colors=new color[8];


void setup(){
  size(600,600);
  hspace=50;
  h2space=width/2;
  vspace=50;
  colors[1]=#F786FF;
  colors[2]=#FF86E3;
  colors[3]=#8D86FF;
  colors[4]=#86FCFF;
  colors[5]=#86FFAB;
  colors[6]=#E2FF86;
  colors[7]=#FFCB86;

}

void draw(){
  pageSelector();
  if(time*timeFrame<millis()){ time++; }
}

void pageSelector(){
  switch(page) {
    case 0:
      page0();
      break;

    case 1:
      gamePage();
      break;

    case 2:
      gameOver();
  }
}
void page0(){
  print("page0");
  background(0);
  myTetro = new Piece(nextN);
  nextTetro = new Piece(nextN);
  myBoard = new Board(ROWS,COLS);
  textAlign(CENTER);
  textSize(62);
  for(int i = 0, n = "Tetris".length() ; i < n ; i++) {
    char ch = "Tetris".charAt(i);
    fill(colors[i+1]);
    text(ch,width/2+31*(i-n/2),height*3/4);
  }
}

void gamePage(){
  print("gamePage");
  background(colorCanvas);
  myBoard.display();
  myTetro.display();
  nextTetro.display(width*3/4-width*0.9/6,height/4,2*width*0.9/6);
  if(time*timeFrame<millis()){
    time++;
    if (timeFrame<500){timeDiference=0;}
    timeFrame-=timeDiference;
    myTetro.fall(myTetro,myBoard);
  }
  textAlign(CENTER,CENTER);
  textSize(30);
  text("Points="+String.valueOf(points),width*3/4,height*3/4);
}

void gameOver(){
  background(colorCanvas);
  myBoard.display();
  println("gameOver");

}

void keyPressed() {//Si se oprime una tecla
  if (keyCode==ENTER){
    page++;
    if (page>2){page=0;}
  }
  else if (key == CODED) {
    if (keyCode == UP) {//Si la tecla es la flecha superior
      myTetro.rotate(myTetro);
    } else if (keyCode == DOWN) {//Si la flecha es la flecha inferior
      while(myBoard.collisionMove(myTetro,0,1)==false){
        myTetro.fall(myTetro,myBoard);
      }
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myTetro,myBoard,1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myTetro,myBoard,-1,0);
    }
  }
}
