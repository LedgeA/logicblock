import 'package:flutter/material.dart';

import './components/button_card.dart';
import './components/buttons.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: AppButton(text: 'Submit', height: 70, width: 80, perform: () => ()),
          // child: ,
          // child: ButtonCard(
          //   text: 'Daily Logic Puzzle', 
          //   buttonText: 'Start Daily Logic Puzzle',
          //   status: 'Not Started',
          // )
        )
      );
  }
}
