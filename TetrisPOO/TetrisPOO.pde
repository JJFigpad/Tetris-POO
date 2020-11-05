//Driver

//Declarar objeto
Piece myTetro;

void setup(){
  size(400,400);
  //Inicializar objeto
  myTetro = new Piece();
}

void draw(){
  background(255);
  //Call methods
  myTetro.display();
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
