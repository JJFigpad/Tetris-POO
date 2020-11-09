import java.util.Arrays;

//Driver
Piece myTetro;//Tetromino
Board myBoard;//Tablero
Piece nextTetro;//Siguiente tetromino
PFont tetricide, defaultFont;
boolean changeNextN= true;//Cambiar siguiente tetromino?
int nextN=int(random(1,8));//Tipo de tetromino del siguiente tetromino
int points=0, difPoints=100;
boolean countingTime=true;
int time=0, timeFrame=400,timeDiference=10;//Tiempo, velocidad y aceleración
int extra=4;//Número de filas superiores del tablero(donde se crean los Tetrominos)
int COLS=10,ROWS=16;//Número de columnas y filas visibles del tablero
int page=0;//Página
int hspace, h2space, vspace;//Márgenes
color colorTablero=0, colorCanvas=0;//Colores tablero y canvas
color[] colors=new color[8];//Colores tetrominos


void setup(){
  size(800,600);
  hspace=50;//Márgenes
  h2space=0;
  vspace=50;
  tetricide=createFont("tetri.ttf",width/6);
  defaultFont=createFont("8bitOperatorPlusSC-Regular.ttf",width/25);
  colors[1]=#F786FF;//Colores tetrominos
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

void pageSelector(){//Escoge la página
  switch(page) {
    case 0:
      page0();
      break;

    case 1:
      gamePage();
      break;

    case 2:
      gameOver();
      break;
    case 3:
      helpPage();
  }
}
void page0(){//Página 0 (solo texto)
  background(0);
  textAlign(CENTER);
  textFont(tetricide);//texto...
  for(int i = 0, n = "TETRIS".length() ; i < n ; i++) {
    char ch = "TETRIS".charAt(i);
    fill(colors[i+1]);
    text(ch,width/2+width/9*(i*2-n+1)/2,height*2/5);
  }
  textFont(defaultFont);
  text("PRESS ENTER TO START",width/2,height*6/8);
  text("PRESS H FOR HELP",width/2,height*7/8);
}

void gamePage(){//Página del juego
  background(colorCanvas);
  myBoard.display();//Dibuja el tablero
  myTetro.display();//Dibuja el Tetromino actual
  //Dibuja próximo tetromino
  nextTetro.display(width*3/4-width*0.9/6,height/4,2*height*0.9/6);
  if((timeFrame<time||myTetro.ypos<extra-2)&& countingTime){
    time=0;//Controla la caída del tetromino
    if (myBoard.collisionMove(myTetro,0,1)==false){
      myTetro.move(0,1);
    }else{
      myBoard.newTablero(myTetro);
      //myBoard.print1();
      myTetro= new Piece(nextN);
      changeNextN=true;
    }
  }
  time+=15;
  textAlign(CENTER,CENTER);//texto...
  text("POINTS="+String.valueOf(points),width*3/4-hspace/2,height*2.5/4);
  text("PRESS H FOR HELP",width*3/4,height*6/8);
}

void gameOver(){//Se termina el juego
  background(colorCanvas);
  myBoard.display();//Dibuja el tablero
  textFont(tetricide);//texto...
  fill(255);
  textAlign(CENTER,CENTER);
  for(int i=0, n=4 ; i<n ; i++) {
    char a = "GAME".charAt(i);
    char b = "OVER".charAt(i);
    fill(colors[i+1]);
    text(a, width*3/4-h2space/2+width/8.5*(i*2-n+1)/2, height/3);
    fill(colors[i+1+2]);
    text(b, width*3/4-h2space/2+width/8.5*(i*2-n+1)/2, height/3+120);
  }
  textFont(defaultFont);
  text("POINTS="+String.valueOf(points),width*3/4-h2space/2,height*2.9/4);
  textSize(width/30);
  text("PRESS ENTER TO PLAY AGAIN",width*3/4-h2space/2,height*3.3/4);
  text("PRESS H FOR HELP",width*3/4,height*7/8);
}

void helpPage(){//Página de ayuda
  background(0);
  float dif= height/20;//Diferencia de altura del texto
  float start=height/7;//Donde comienza el texto
  text("OBJECTIVE",width/2,start-dif/2);//Texto...
  textSize(width/55);
  String a= "The goal of Tetris is to score as many points as possible by clearing horizontal lines of Blocks.";
  text(a,width/2,start+dif);
  a= "The player must rotate, move, and drop the falling Tetriminos inside the Matrix (playing field).";
  text(a,width/2,start+dif*2);
  a= "Lines are cleared when they are filled with Blocks and have no empty spaces.";
  text(a,width/2,start+dif*3);
  a= "As lines are cleared, the Tetriminos fall faster, making the game progressively more challenging.";
  text(a,width/2,start+dif*4);
  a="If the Blocks land above the top of the playing field, the game is over.";
  textSize(width/30);

  dif =height/17;
  start=height/2.1;
  text("CONTROLS",width/2,start-dif/2);
  textSize(width/50);
  text("<- OR ->",width/3.5,start+dif);
  translate(width/3.5,start);
  rotate(PI/2);
  text("<-",dif*2,0);
  text("->",dif*3,0);
  rotate(-PI/2);
  translate(-width/3.5,-start);
  text("CTRL",width/3.5,start+dif*4);
  text("ALT",width/3.5,start+dif*5);
  textAlign(CORNER,CENTER);
  text("TO MOVE HORIZONTALLY",width/2.5,start+dif);
  text("TO ROTATE CLOCKWISE",width/2.5,start+dif*2);
  text("TO GO ALL THE WAY DOWN",width/2.5,start+dif*3);
  text("TO STOP",width/2.5,start+dif*4);
  text("TO CONTINUE",width/2.5,start+dif*5);
  textSize(width/25);
  textAlign(CENTER,CENTER);
  text("PRESS ENTER TO START",width/2,start+dif*7);
}
void keyPressed() {//Si se oprime una tecla
  if (keyCode==ENTER && page!=1){//si ENTER y si no se está jugando
    println("Leaving page", page);
    if (page==2||page==0){
      points=0;//Reiniciar el juego
      changeNextN=true;
      myTetro = new Piece(nextN);
      nextTetro = new Piece(nextN);
      myBoard = new Board(ROWS,COLS);
    }
    page++;//aumentar página
    if (page>2){page=1;}
  }else if (key=='h'){//si h,Página de ayuda
    page=3;
  }
  else if (key == CODED && page==1) {
    if (keyCode == CONTROL){
      countingTime=false;//Para el juego
    }else if (keyCode == ALT){
      countingTime=true;//Continua el juego
    }if (keyCode == UP) {
      if(myBoard.collisionRotate(myTetro)==false){//Si no hay colisión
        myTetro.rotate();//Rotar tetromino
      }
    } else if (keyCode == DOWN) {
      if(myTetro.ypos>=extra-2){//Bajar tetromino hasta el fondo
        while(myBoard.collisionMove(myTetro,0,1)==false){
          myTetro.move(0,1);
        }
      }
    }else if (keyCode == RIGHT) {
      if (myBoard.collisionMove(myTetro,1,0)==false){
        myTetro.move(1,0);//Mover tetromino hacia la derecha
      }
    }else if (keyCode == LEFT) {
      if (myBoard.collisionMove(myTetro,-1,0)==false){
        myTetro.move(-1,0);//Mover tetromino hacia la izquierda
      }

  }
  }
}
