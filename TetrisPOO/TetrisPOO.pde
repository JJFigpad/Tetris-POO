//Driver

//Declarar objeto
Piece myTetro;
int time=0;
int COLS=10,ROWS=12;
int nTetro=0;

void setup(){
  size(400,400);
  //Inicializar objeto
  myTetro = new Piece(nTetro);
}

void draw(){
  background(255);
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
      nTetro=int(random(0,6));
      myTetro= new Piece(nTetro);
    }else if (keyCode == RIGHT) {//Si la flecha es la flecha a la derecha
      myTetro.move(1,0);
    }else if (keyCode == LEFT) {//Si la flecha es la flecha a la derecha
      myTetro.move(-1,0);
    }
  }
}
