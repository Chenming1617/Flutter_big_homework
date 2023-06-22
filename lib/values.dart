import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int rowLength = 10;
int colLength = 15;

enum Direction {
  left,
  right,
  down,
}

enum Tetromino {
  L,
  J,
  I,
  O,
  S,
  Z,
  T,

  /*
  o
  o
  o o

    o
    o
  o o

  o
  o
  o
  o

  o o
  o o

    o o
  o o

  o o
    o o

  o
  o o 
  o


   */
}

const Map<Tetromino, Color> tetrominoColors = {
  Tetromino.I:Color.fromARGB(255, 176, 239, 190),
  Tetromino.J:Color.fromARGB(255, 125, 184, 232),
  Tetromino.L:Color.fromARGB(255, 93, 59, 182),
  Tetromino.S:Color.fromARGB(255, 212, 218, 45),
  Tetromino.Z:Color.fromARGB(255, 211, 149, 13),
  Tetromino.T:Color.fromARGB(255, 197, 51, 117),
  Tetromino.O:Color.fromARGB(255, 139, 186, 228),
};
