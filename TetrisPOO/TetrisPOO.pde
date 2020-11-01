//Driver

//Declarar objeto
Piece myTetro;
int time=0;
int vspace, hspace;
int ROWS = 8, COLS =4;

void setup(){
  size(600,600);
  vspace = 20;
  hspace = width/2;
  //Inicializar objeto
  myTetro = new Piece();
}

void draw(){
  
  background(255);
  for(int j=0; j<=COLS;j++){
    line(j*(width-vspace-hspace)/COLS+vspace, vspace, j*(width-vspace-hspace)/COLS+vspace, height-vspace);
  }
  for(int i=0;i<=ROWS;i++){
    line(vspace,i*(height-2*vspace)/ROWS+vspace, width-hspace, i*(height-2*vspace)/ROWS+vspace); 
  }
  //Call methods
  myTetro.display();
  if(time*1000<millis()){
    time++;
    myTetro.move(0,1);
  }
}

void keyPressed() {//Si se oprime una tecla
  if (key == CODED) {
    if (keyCode == UP) {//Si la tecla es la flecha superior
      myTetro.rotate();
    } else if (keyCode == DOWN) {//Si la flecha es la flecha inferior
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(-1,0);
    }
  }
}
