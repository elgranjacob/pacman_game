// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pacman_game/path.dart';
import 'package:pacman_game/pixel.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  static List<int> barriers = [
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
    88,
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
    98,
    87,
    76,
    65,
    54,
    43,
    32,
    21
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow),
                itemBuilder: (BuildContext context, int index) {
                  if (barriers.contains(index)) {
                    return Mypixel(
                        innerColor: Colors.blue[800],
                        outerColor: Colors.blue[900],
                        child: Text(index.toString()));
                  } else {
                    return Mypath(
                        innerColor: Colors.yellow,
                        outerColor: Colors.black,
                        child: Text(index.toString()));
                  }
                }),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score: ",
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text("P L A Y ",
                      style: const TextStyle(color: Colors.white, fontSize: 40)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
