import java.util.Arrays;

//Driver
Piece myTetro;
Board myBoard;
Piece nextTetro;
PFont tetricide, defaultFont;
boolean changeNextN= true;
int nextN=int(random(1,8));
int points=0;
int difPoints=100;
int time=0, timeFrame=600,timeDiference=1;
int extra=4;
int COLS=10,ROWS=16;
int page=0;
int hspace, h2space, vspace;
color colorTablero=0, colorCanvas=0;
color[] colors=new color[8];


void setup(){
  size(600,800);
  hspace=50;
  h2space=width/2+hspace;
  vspace=hspace;
  tetricide=createFont("tetri.ttf",width/6);
  defaultFont=createFont("8bitOperatorPlus-Regular.ttf",width/20);
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
  background(0);
  textAlign(CENTER);
  textFont(tetricide);
  for(int i = 0, n = "TETRIS".length() ; i < n ; i++) {
    char ch = "TETRIS".charAt(i);
    fill(colors[i+1]);
    text(ch,width/2+width/9*(i*2-n+1)/2,height*2/5);
  }
  textFont(defaultFont);
  text("PRESS ENTER TO START",width/2,height*3/4);
}

void gamePage(){
  background(colorCanvas);
  myBoard.display();
  myTetro.display();
  nextTetro.display(width*3/4-width*0.9/6,height/4,2*width*0.9/6);
  if(timeFrame<time||myTetro.ypos<extra-2){
    time=0;
    if (timeFrame<500){timeDiference=0;}
    timeFrame-=timeDiference;
    myTetro.fall(myTetro,myBoard);
  }
  time+=15;
  textAlign(CENTER,CENTER);
  text("POINTS="+String.valueOf(points),width*3/4,height*2.5/4);
}

void gameOver(){
  background(colorCanvas);
  myBoard.display();
  textFont(tetricide);
  fill(255);
  textAlign(CENTER,CENTER);
  for(int i=0, n=4 ; i<n ; i++) {
    char a = "GAME".charAt(i);
    char b = "OVER".charAt(i);
    fill(colors[i+1]);
    text(a,width*3/4+width/8.5*(i*2-n+1)/2,height/3);
    fill(colors[i+1+2]);
    text(b,width*3/4+width/9*(i*2-n+1)/2,height/3+height/7);
  }
  textFont(defaultFont);
  text("POINTS="+String.valueOf(points),width*3/4,height*2.5/4);
  textSize(width/30);
  text("PRESS ENTER TO PLAY AGAIN",width*3/4,height*3/4);

}

void keyPressed() {//Si se oprime una tecla
  if (keyCode==ENTER && page!=1){
    page++;
    if (page>2){page=1;}
    points=0;
    changeNextN=true;
    myTetro = new Piece(nextN);
    nextTetro = new Piece(nextN);
    myBoard = new Board(ROWS,COLS);
  }
  else if (key == CODED && page==1) {
    if (keyCode == CONTROL){
      noLoop();
    }else if (keyCode == ALT){
      loop();
    }if (keyCode == UP) {//Si la tecla es la flecha superior
      myTetro.rotate(myTetro);
    } else if (keyCode == DOWN) {//Si la flecha es la flecha inferior
      if(myTetro.ypos>=extra-2){
        while(myBoard.collisionMove(myTetro,0,1)==false){
          myTetro.fall(myTetro,myBoard);
        }
      }
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myTetro,myBoard,1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(myTetro,myBoard,-1,0);
    }
  }
}
