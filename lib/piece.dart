import 'package:flutter/cupertino.dart';

import 'values.dart';

class Piece {
  Tetromino type;
  Piece({required this.type});

  List<int> position = [];
  //方块的颜色,不正常就显示白色
  Color get color {
    return tetrominoColors[type] ?? const Color(0xFFFFFFFF);
  }

  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        position = [
          -24,
          -14,
          -4,
          -3,
        ];
        break;
      case Tetromino.I:
        position = [
          -34,
          -24,
          -14,
          -4,
        ];
        break;
      case Tetromino.J:
        position = [
          -24,
          -14,
          -4,
          -5,
        ];
        break;
      case Tetromino.O:
        position = [
          -24,
          -25,
          -14,
          -15,
        ];
        break;
      case Tetromino.S:
        position = [
          -24,
          -23,
          -14,
          -15,
        ];
        break;

      case Tetromino.Z:
        position = [
          -24,
          -23,
          -13,
          -12,
        ];
        break;
      case Tetromino.T:
        position = [
          -24,
          -14,
          -13,
          -4,
        ];
        break;

      default:
        break;
    }
  }

  void movePiece(Direction direction) {
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLength;
        }
        break;
      case Direction.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
        break;
      case Direction.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }
}
