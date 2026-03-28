import 'package:flutter/material.dart';
import 'package:logicblock/components/buttons.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/screens/code.dart';
import 'package:logicblock/screens/output.dart';

class SandboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the workspace', style: AppTexts.headingOne),
            AppButton(
              text: 'to text interface', 
              isHomeButton: false,
              height: 40, 
              width: 160, 
              perform: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CodeScreen()),
                ),
              }
            ),
            AppButton(
              text: 'to code output', 
              isHomeButton: false,
              height: 40, 
              width: 160, 
              perform: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OutputScreen(isRunning: true, codeOutput: 'This is the output')),
                ),
              }
            )
          ],
        )
      ),
    );
  }
}