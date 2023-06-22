import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gitpod_flutter_quickstart/pixel.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //网格尺寸大小
  int rowLength = 10;
  int colLength = 15;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GridView.builder(
        itemCount: rowLength*colLength,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowLength),
       itemBuilder: (context,index)=>Pixel(
        color: Colors.grey[900],
        child: index,
       ),
      
      ),
    );

  }
}
