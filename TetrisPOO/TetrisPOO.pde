//Driver

//Declarar objeto
Piece myTetro;
int time=0;
int COLS=10,ROWS=12;
int nTetro=0;
int hspace, h2space, vspace;

void setup(){
  size(400,400);
  //Inicializar objeto
  hspace=10;
  h2space=width/2;
  vspace=10;
  myTetro = new Piece(nTetro);
}

void draw(){
  background(255);
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
    myTetro.move(0,1);
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
      myTetro.move(1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(-1,0);
    }
  }
}
