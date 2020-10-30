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
