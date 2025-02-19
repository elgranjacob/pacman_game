import 'package:flutter/material.dart';
import 'package:pacman_game/path.dart';
import 'package:pacman_game/pixel.dart';
import 'package:pacman_game/player.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 16 + 1;

  List<int> barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,99,110,121,132,143,154,165,176,177,178,179,180,181,182,183,184,185,186,175,164,153,142,131,120,109,87,76,65,54,43,32,21,78,79,80,81,70,59,24,35,46,57,26,37,38,39,28,30,41,52,63,61,72,83,84,85,86,100,101,102,103,114,125,123,134,145,156,158,147,148,149,160,162,151,140,129,127,116,105,106,107,108 
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numberInRow),
                  itemBuilder: (BuildContext context, int index){
                   if (player == index) {
                     return MyPlayer();
                    }else if (barriers.contains(index)) {
                     return MyPixel(
                        innerColor: Colors.blue[800],
                        outerColor: Colors.blue[900],
                        //child: Text(index.toString())
                      );
                    }else {
                        return MyPath(
                        innerColor: Colors.yellow,
                        outerColor: Colors.black,
                        //child: Text(index.toString())
                      );
                    }
                  }),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Text("Score: ", style: TextStyle(color: Colors.white, fontSize: 40),),
                    Text("Play: ", style: TextStyle(color: Colors.white, fontSize: 40),),
              ],),
            ),
          ),
        ],
      ),
    );
  }
}
