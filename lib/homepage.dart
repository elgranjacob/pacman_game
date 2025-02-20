import 'dart:async'; // Importa funciones relacionadas con temporizadores (Timer).
import 'dart:math'; // Importa funciones para generar números aleatorios.
import 'package:flutter/material.dart'; // Importa Material Design de Flutter para crear la UI.
import 'package:pacman_game/ghost.dart'; // Importa el widget que representa al fantasma.
import 'package:pacman_game/path.dart'; // Importa el widget para los caminos del tablero.
import 'package:pacman_game/pixel.dart'; // Importa el widget para las barreras/píxeles.
import 'package:pacman_game/player.dart'; // Importa el widget para el jugador.

class Homepage extends StatefulWidget {
  const Homepage({super.key}); // Constructor de la clase Homepage.

  @override
  State<Homepage> createState() =>
      _HomepageState(); // Devuelve el estado del widget.
}

class _HomepageState extends State<Homepage> {
  static int numberInRow =
      11; // Define la cantidad de columnas del tablero (11).
  int numberOfSquares = numberInRow *
      17; // Total de casillas en el tablero (11 columnas por 17 filas).
  int player = numberInRow * 15 +
      5; // Posición inicial del jugador (en la fila 15 y columna 5).
  int ghost = numberInRow * 5 +
      5; // Posición inicial del fantasma (en la fila 5 y columna 5).

  List<int> barriers = [
    // Lista de índices donde están las barreras (muros del mapa).
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    175,
    164,
    153,
    142,
    131,
    120,
    109,
    87,
    76,
    65,
    54,
    43,
    32,
    21,
    78,
    79,
    80,
    81,
    70,
    59,
    24,
    35,
    46,
    57,
    26,
    37,
    38,
    39,
    28,
    30,
    41,
    52,
    63,
    61,
    72,
    83,
    84,
    85,
    86,
    100,
    101,
    102,
    103,
    114,
    125,
    123,
    134,
    145,
    156,
    158,
    147,
    148,
    149,
    160,
    162,
    151,
    140,
    129,
    127,
    116,
    105,
    106,
    107,
    108
  ];

  List<int> food =
      []; // Lista vacía para almacenar las posiciones de la comida.

  String direction =
      "right"; // Dirección inicial del jugador ("right" por defecto).
  bool preGame =
      true; // Estado para indicar si el juego está en la fase de inicio.
  bool mouthClosed =
      false; // Estado de la boca del jugador (para alternar entre abierta y cerrada).
  int score = 0; // Puntuación inicial del jugador.

  void startGame() {
    // Función que inicia el juego.
    moveGhost(); // Comienza el movimiento del fantasma.
    preGame = false; // Cambia el estado a que el juego ya comenzó.
    getFood(); // Llena la lista de comida.
    Duration duration =
        Duration(milliseconds: 120); // Duración de cada ciclo de juego.
    Timer.periodic(duration, (timer) {
      // Temporizador para actualizar el estado del juego.
      setState(() {
        mouthClosed =
            !mouthClosed; // Alterna la boca del jugador (abierta/cerrada).
      });

      if (food.contains(player)) {
        // Si el jugador está en una posición con comida...
        setState(() {
          food.remove(player); // Elimina la comida de esa posición.
          score++; // Incrementa la puntuación.
        });
      }

      if (player == ghost) {
        // Si el jugador y el fantasma se encuentran...
        ghost = -1; // El fantasma desaparece (se establece a -1).
      }

      switch (direction) {
        // Mueve al jugador dependiendo de la dirección.
        case 'left':
          moveLeft(); // Mueve hacia la izquierda.
          break;
        case 'right':
          moveRight(); // Mueve hacia la derecha.
          break;
        case 'up':
          moveUp(); // Mueve hacia arriba.
          break;
        case 'down':
          moveDown(); // Mueve hacia abajo.
          break;
      }
    });
  }

  void moveGhost() {
    // Mueve al fantasma de manera aleatoria.
    Duration ghostDuration =
        Duration(milliseconds: 300); // Duración del movimiento del fantasma.
    Timer.periodic(ghostDuration, (timer) {
      // Temporizador para mover al fantasma cada 300ms.
      if (ghost == -1) {
        // Si el fantasma ha sido "eliminado", termina el temporizador.
        timer.cancel();
      }

      List<int> possibleMoves = [
        // Posibles movimientos del fantasma (izquierda, derecha, arriba, abajo).
        ghost - 1,
        ghost + 1,
        ghost - numberInRow,
        ghost + numberInRow
      ];
      possibleMoves.removeWhere((move) =>
          barriers.contains(move)); // Elimina movimientos hacia barreras.

      if (possibleMoves.isNotEmpty) {
        // Si hay movimientos válidos, mueve al fantasma.
        setState(() {
          ghost = possibleMoves[Random().nextInt(
              possibleMoves.length)]; // Mueve al fantasma aleatoriamente.
        });
      }
    });
  }

  void getFood() {
    food.clear();
    // Coloca la comida en el tablero (en lugares vacíos).
    for (int i = 0; i < numberOfSquares; i++) {
      // Recorre todas las casillas del tablero.
      if (!barriers.contains(i) && i != player) {
        // Si la casilla no es una barrera y si la casilla no es el jugador...
        food.add(i); // Agrega la casilla a la lista de comida.
      }
    }
  }

  void moveLeft() {
    // Mueve al jugador hacia la izquierda.
    if (!barriers.contains(player - 1)) {
      // Si no hay barrera a la izquierda...
      setState(() {
        player--; // Decrementa la posición del jugador.
      });
    }
  }

  void moveRight() {
    // Mueve al jugador hacia la derecha.
    if (!barriers.contains(player + 1)) {
      // Si no hay barrera a la derecha...
      setState(() {
        player++; // Incrementa la posición del jugador.
      });
    }
  }

  void moveUp() {
    // Mueve al jugador hacia arriba.
    if (!barriers.contains(player - numberInRow)) {
      // Si no hay barrera arriba...
      setState(() {
        player -=
            numberInRow; // Resta el número de columnas para mover hacia arriba.
      });
    }
  }

  void moveDown() {
    // Mueve al jugador hacia abajo.
    if (!barriers.contains(player + numberInRow)) {
      // Si no hay barrera abajo...
      setState(() {
        player +=
            numberInRow; // Suma el número de columnas para mover hacia abajo.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Construye la UI del juego.
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro para el tablero de juego.
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              // Detecta gestos (deslizar) para mover al jugador.
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  // Si se desliza hacia abajo...
                  direction = "down";
                } else if (details.delta.dy < 0) {
                  // Si se desliza hacia arriba...
                  direction = "up";
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  // Si se desliza hacia la derecha...
                  direction = "right";
                } else if (details.delta.dx < 0) {
                  // Si se desliza hacia la izquierda...
                  direction = "left";
                }
              },
              child: Container(
                child: GridView.builder(
                    // Construye la cuadrícula del juego.
                    physics:
                        NeverScrollableScrollPhysics(), // Deshabilita el desplazamiento.
                    itemCount: numberOfSquares, // Número total de casillas.
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            numberInRow), // Define la cantidad de columnas.
                    itemBuilder: (BuildContext context, int index) {
                      if (index == ghost) {
                        // Si la casilla es la posición del fantasma...
                        return MyGhost(); // Muestra el fantasma.
                      }

                      if (mouthClosed && player == index) {
                        // Si la boca del jugador está cerrada...
                        return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                          ),
                        );
                      } else if (player == index) {
                        // Si la casilla es la posición del jugador...
                        switch (direction) {
                          // Rotación del jugador dependiendo de la dirección.
                          case 'left':
                            return Transform.rotate(
                              angle: pi,
                              child: MyPlayer(),
                            );
                          case 'right':
                            return MyPlayer(); // Sin rotación.
                          case 'up':
                            return Transform.rotate(
                              angle: 3 * pi / 2,
                              child: MyPlayer(),
                            );
                          case 'down':
                            return Transform.rotate(
                              angle: pi / 2,
                              child: MyPlayer(),
                            );
                          default:
                            return MyPlayer();
                        }
                      } else if (barriers.contains(index)) {
                        // Si la casilla es una barrera...
                        return MyPixel(
                          // Muestra una barrera.
                          innerColor: Colors.blue[800],
                          outerColor: Colors.blue[900],
                        );
                      } else if (food.contains(index)) {
                        return MyPath(
                          innerColor: Colors.yellow, // La comida
                          outerColor: Colors.black,
                        );
                      } else {
                        // Si la casilla es un camino vacío...
                        return MyPath(
                          // Muestra un camino.
                          innerColor: Colors.yellow,
                          outerColor: Colors.black,
                        );
                      }
                    }),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score: $score", // Muestra el puntaje actual.
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  GestureDetector(
                      // Botón para iniciar el juego.
                      onTap: startGame,
                      child: Text(
                        "PLAY",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
