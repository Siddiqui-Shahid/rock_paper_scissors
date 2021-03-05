import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_flutter/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GameScreen();
  }
}
