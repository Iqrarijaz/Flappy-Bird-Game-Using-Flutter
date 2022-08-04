import 'dart:async';

import 'package:flappy_bird/components/barrier.dart';
import 'package:flappy_bird/components/myBird.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxises= 0;
  double time=0;
  double height=0;
  double initialHeight=birdYaxises;
  bool gameHasStarted=false;
  void Jump()
  {setState(() {
    time=0;
    initialHeight=birdYaxises;
  });
  }

  void startGame(){
    gameHasStarted=true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * (time);
      setState(() {
        birdYaxises = initialHeight - height;
      });
      if (birdYaxises>1){
        timer.cancel();
        gameHasStarted=false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex:2,child: Container(color: Colors.blue,
          child: Stack(
            children: [
              GestureDetector(
                onTap: (){
                  if (gameHasStarted){
                    Jump();
                  }
                  else{
                    startGame();
                  }
                },
                child: AnimatedContainer(
                  //animation  first is horzental and second is vertical
                    alignment: Alignment(0,birdYaxises),
                    duration: const Duration(milliseconds: 0),
                    child: const MyBird()),
              ),
              Container(
                alignment: const Alignment(0,-0.3),
                child: gameHasStarted ? const Text(" "): const Text("T A P  TO  P L A Y",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
              ),
              MyBarrier()
            ],
          )
          )
          ),
          Container(height: 15,color: Colors.green,),
          Expanded(child: Container(color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              Text("SCORE" ,style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
              SizedBox(height: 20,),
              Text("0",style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ))
            ],),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              Text("BEST",style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
                SizedBox(height: 20,),
              Text("10",style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ))
            ],)
          ],),))
        ],
      ),
    );
  }
}
