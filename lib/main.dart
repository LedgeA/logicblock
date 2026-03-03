import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logicblock/components/entries.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/screens/challenges.dart';
import 'package:logicblock/screens/sandbox.dart';

import 'components/cards.dart';
import './components/colors.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, 
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello User!', style: AppTexts.headingOne,),
                    Text('Welcome back!', style: AppTexts.headingThree,)
                  ], 
                ),
                ButtonCard(
                  text: 'Daily Logic Puzzle', 
                  buttonText: 'Start Daily Logic Puzzle',
                  perform: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengeScreen()));
                  },
                  status: 'Not Started',
                ),
                ButtonCard(
                  text: 'Practice coding freely', 
                  buttonText: 'Open Sandbox',
                  perform: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SandboxScreen()));
                  },
                ),
                SizedBox(height: 10),
                Text('Lessons', style: AppTexts.headingTwo),
                Column(
                  spacing: 10,
                  children: [
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'Completed'
                    ),
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'In Progress'
                    ),
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'Not Started'
                    ),
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'Not Started'
                    ),
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'Not Started'
                    ),
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'Not Started'
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}