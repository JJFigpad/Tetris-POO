  # Tetris-POO

  Copia del juego clásico de [TETRIS](https://tetris.com/play-tetris)
  en programación orientada a objetos.

  ## Objetivo del juego

  La idea del juego es obtener todos los puntos posibles al completar filas de bloques.

  El jugador debe rotar, mover o dejar caer el Tetromino dentro de la Matriz (o tablero de juego). 
  Las líneas se completan cuando están llenas e bloques y no hay espacios.

  Cuando las líneas son completadas los Tetrominos caen con mayor velocidad, aumentando la dificultad del juego.
  Si algún bloque de algú Tetromino queda por fuera del tablero de juego, el juego se termina.

  ## Controles

  Cuando se oprime 

  #### &uarr; 
  Los tetrominos rotan.

  #### &larr; &rarr; 
  Los tetrominos se desplazan horizontalmente.

  #### &darr; 
  Los tetrominos caen hasta el fondo.

  #### ctrl
  El juego para.

  #### alt
  El juego continua.

  ## Representación
  Este juego representa el tablero y los tetrominos mediante las clases Board y Piece, respetivamente.

  ### Tetrominos
  Cada Tetromino (u objeto de la clase Piece) tiene 5 atributos:

  Ubicación en el tablero `int xpos`, `int ypos` 

  Tipo de tetromino `int n`

  Color, determinado por n `color c`

  Representación del tetromino `String[]Tetro` 

  Los bloques que deben ser dibujados son representados por enteros diferentes de 0, 
  dicho entero es igual a 'n' e indica de qué color se debe rellenar el bloque.

  Por ejemplo, un Tetromino tipo n=2 se inicializa así
  ```
    Tetro[0]="0000";
    Tetro[1]="2222";
    Tetro[2]="0000";
    Tetro[3]="0000";
  ```
  Y un Tetromino tipo n=3, así
  ```
    Tetro[0]="0000";
    Tetro[1]="0300";
    Tetro[2]="0333";
    Tetro[3]="0000";
  ```

  Además, los Tetrominos tienen 4 funciones:
  
  `display()` Dibuja el Tetromino
  
  `rotate()`   Rotar Tetromino
  
  `move()`    Mover Tetromino(horizontalmente)
  
  `fall()`    Bajar Tetromino (o gravedad)

### Tablero
  El tablero tiene 4 atributos:

  Número de filas y de columnas `int rows` `int cols`

  Color de fondo del tablero (contrario al de las líneas) `int colorTablero`

  Representación del tablero `String[]Tablero`
  
  La representación del tablero se inicializa con un matriz de 0`s y 1`s donde los 1`s representan los límites del tablero.
  
  Por ejemplo, para inicializar un tablero de 4 filas y 4 columnas con sus límites,
  usamos la siguiente matriz de `cols+1+4` columnas y `rows+2` filas.
  ```
    Tablero[0]="100001";
    Tablero[1]="100001";
    Tablero[2]="100001";
    Tablero[3]="100001";
    Tablero[4]="100001";
    Tablero[5]="100001";
    Tablero[6]="100001";
    Tablero[7]="100001";
    Tablero[8]="111111";
  ```
  Donde las primeras 4 filas son donde se crean los tetrominos sin ser mostrados

  El tablero tiene 7 métodos o funciones:
  
  `display()` Dibuja el tablero en el canvas
  
  `print1()` Imprime el tablero en la consola
  
  `collisionMove()` Determina si un Tetromino se chocaría al moverse o al caer
  
  `collisionRotate()` Determina si un Tetromino se chocaría al rotar
  
  `newTablero()` Devuelve el tablero añadiendo la ficha que acaba de chocar
  
  `completeRow()` Determina si alguna fila se ha completado
  
  `deleteRow()` Elimina una fila
  
  Cuando `collisionMove()` determina que un Tetromino se chocaría al caer, 
  la representación de dicho Tetromino se añade a la del tablero.
  
  Por ejemplo, si un Tetromino tipo n=2 se chocara contra el final del tablero del ejemplo con la posición `(0,7)`.
  
  Tetromino tipo n=2
  ```
    Tetro[0]="0000";
    Tetro[1]="2222";
    Tetro[2]="0000";
    Tetro[3]="0000";
  ```
  
  Entonces el tablero quedaría así después del choque:
  ```
    Tablero[0]="100001";
    Tablero[1]="100001";
    Tablero[2]="100001";
    Tablero[3]="100001";
    Tablero[4]="100001";
    Tablero[5]="100001";
    Tablero[6]="100001";
    Tablero[7]="122221";
    Tablero[8]="111111";
  ```
  Donde los enteros indican el color en que debe ser rellenado los bloques.
  
