import 'dart:async';
import 'dart:ffi';
import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gitpod_flutter_quickstart/piece.dart';
import 'package:gitpod_flutter_quickstart/pixel.dart';
import 'package:gitpod_flutter_quickstart/values.dart';
import 'piece.dart';
import 'pixel.dart';

//创建2X2的区域
List<List<Tetromino?>> gameBoard = List.generate(
  colLength,
  (i) => List.generate(
    rowLength,
    (j) => null,
  ),
);

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //网格尺寸大小
  int rowLength = 10;
  int colLength = 15;

  Piece currentPiece = Piece(type: Tetromino.L);
  @override
  void initState() {
    super.initState();

    startGame();
  }

  void startGame() {
    currentPiece.initializePiece();
    //下降速度设置
    Duration frameRate = const Duration(milliseconds: 500);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(
      frameRate,
      (timer) {
        setState(() {
          //向下移动，方块

          currentPiece.movePiece(Direction.down);
        });
      },
    );
  }

//检测位置是否有冲突
  bool checkCollision(Direction direction) {
    for (int i = 0; i < currentPiece.position.length; i++) {
      //计算位置
      int row = (currentPiece.position[i] / rowLength).floor();
      int col = currentPiece.position[i] % rowLength;
      //基于方向判断行和列
      if (direction == Direction.left) {
        col -= 1;
      } else if (direction == Direction.right) {
        col += 1;
      } else if (direction == Direction.down) {
        col += 1;
      }
      //检查是否出界
      if (row >= colLength || col < 0 || col >= rowLength) {
        return true;
      }
    }
    //出界了
    return false;
  }

  void checkLanding() {
    //如果下面有方块
    if (checkCollision(Direction.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLength).floor();
        int col = currentPiece.position[i] % rowLength;
        if (row >= 0 && col >= 0) {
          gameBoard[row][col] = currentPiece.type;
        }
      }

      //一旦着落，创建其他的方块
      createNewPiece();
    }
  }

  void createNewPiece() {
    //创建随机对象来生成随机值
    Random rand = Random();
    //创建一个人随机类型的方块
    Tetromino randomType =
        Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          GridView.builder(
        itemCount: rowLength * colLength,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowLength),
        itemBuilder: (context, index) {
          int row = (index / rowLength).floor();
          int col = index % rowLength;
          if (currentPiece.position.contains(index)) {
            return Pixel(
              color: currentPiece.color,
              child: index,
            );
          }
          //到底的方块
          else if (gameBoard[row][col] != null) {
            final Tetromino? tetrominoType = gameBoard[row][col];
            return Pixel(color: tetrominoColors[tetrominoType], child: '');
          } 
          
          else {
            return Pixel(
              color: Colors.grey[900],
              child: index,
            );
          }
        },
      ),
        ],
      )
    );
  }
}
