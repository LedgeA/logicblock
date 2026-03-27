
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logicblock/components/cards.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/entries.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/screens/daily_problems.dart';
import 'package:logicblock/screens/sandbox.dart';

class HomeScreen extends StatelessWidget {

  final String username;

  const HomeScreen({
    super.key, 
    required this.username
  });
  
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
                    Text('Hello ' + username + '!', style: AppTexts.headingOne,),
                    Text('Welcome back!', style: AppTexts.headingThree,)
                  ], 
                ),
                ButtonCard(
                  text: 'Daily Problem', 
                  buttonText: 'Solve Daily Problem',
                  perform: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengeScreen()));
                  },
                  status: 'Not Started',
                ),
                ButtonCard(
                  text: 'Practice coding freely', 
                  buttonText: 'Open Sandbox',
                  perform: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => Scaffold(
                          body: SandboxScreen(),
                          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
                          floatingActionButton: FloatingActionButton(
                            backgroundColor: AppColors.surfaceOne,
                            foregroundColor: AppColors.glow,
                            onPressed: () => Navigator.pop(context),
                            child: Icon(Icons.home),
                          )
                        )
                      )
                    );
                  },
                ),
                
                SizedBox(height: 10),
                Text('Lessons', style: AppTexts.headingTwo),
                Column(
                  spacing: 10,
                  children: [
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: 'Completed',
                      lessonNumber: 1,
                    ),
                    LessonEntry(
                      title: 'Operators',
                      status: 'In Progress',
                      lessonNumber: 2,
                    ),
                    LessonEntry(
                      title: 'Conditionals',
                      status: 'Not Started',
                      lessonNumber: 3,
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