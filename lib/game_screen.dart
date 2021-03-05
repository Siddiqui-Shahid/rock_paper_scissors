import 'dart:math';

import 'package:flutter/material.dart';

import 'constant.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String rightPick = 'assets/stone.png';
  String leftPick = 'assets/stone.png';
  int leftTotal = 0, rightTotal = 0;

  int ChangeLeft() {
    int num = Random().nextInt(3);
    if (num == 0) {
      setState(() {
        leftPick = 'assets/paper.png';
      });
    } else if (num == 1) {
      setState(() {
        leftPick = 'assets/scissor.png';
      });
    } else {
      setState(() {
        leftPick = 'assets/stone.png';
      });
    }
    return num;
  }

  void Reset() {
    setState(() {
      leftTotal = 0;
      rightTotal = 0;
      rightPick = 'assets/stone.png';
      leftPick = 'assets/stone.png';
    });
  }

  int ChangeRight() {
    int num = Random().nextInt(3);
    if (num == 0) {
      setState(() {
        rightPick = 'assets/paper.png';
      });
    } else if (num == 1) {
      setState(() {
        rightPick = 'assets/scissor.png';
      });
    } else {
      setState(() {
        rightPick = 'assets/stone.png';
      });
    }
    return num;
  }

  void UpdateScore({int left, int right}) {
    setState(() {
      if (left == right) {
        return;
      } else {
        if (right == 0 && left == 1) {
          leftTotal++;
        } else if (right == 1 && left == 2) {
          leftTotal++;
        } else if (right == 2 && left == 1) {
          rightTotal++;
        } else if (right == 1 && left == 0) {
          rightTotal++;
        } else if (right == 0 && left == 2) {
          rightTotal++;
        } else if (right == 2 && left == 0) {
          leftTotal++;
        } else {
          print('Unknown Condition');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'Rock Paper Scissors',
        //   ),
        //   backgroundColor: Colors.amber,
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 170,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.6),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'Score',
                            textAlign: TextAlign.center,
                            style:
                                kScoreTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                        Text(
                          leftTotal.toString(),
                          style: kScoreTextStyle,
                        ),
                        Image(
                          width: 150,
                          image: AssetImage(leftPick),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 170,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(.6),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'Score',
                            textAlign: TextAlign.center,
                            style:
                                kScoreTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                        Text(
                          rightTotal.toString(),
                          style: kScoreTextStyle,
                        ),
                        // Text(
                        //   rightPick,
                        //   style: TextStyle(fontSize: 180.0),
                        // ),
                        Image(
                          width: 150,
                          image: AssetImage(rightPick),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Reset();
                      },
                      child: Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            'Reset',
                            style:
                                kScoreTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        int leftNumber = ChangeLeft();
                        int rightNumber = ChangeRight();
                        UpdateScore(
                          left: leftNumber,
                          right: rightNumber,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            'Play',
                            style:
                                kScoreTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
