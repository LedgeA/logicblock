import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:logicblock/components/buttons.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';

class OutputScreen extends StatelessWidget {
  
  final bool isRunning;

  const OutputScreen({
    super.key, 
    required this.isRunning
  });

  codeStatus() {
    if (isRunning) {
      return 'Code is Running';
    }

    return 'There is an error';
  }

  static const String text = 'This is the output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(codeStatus(), style: AppTexts.headingOne),
            Divider(
              height: 10,
              thickness: 1,
              color: AppColors.disabled,
            ),
            Text('Output', style: AppTexts.headingTwo),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceOne,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: MarkdownBody(
                  data: text,
                  softLineBreak: true,
                  styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    p: AppTexts.body,
                    h1: AppTexts.headingOne,
                    h2: AppTexts.headingTwo,
                    h3: AppTexts.headingThree,
                    listBullet: AppTexts.body,
                    textAlign: WrapAlignment.spaceBetween,

                    code: AppTexts.code,
                    codeblockDecoration: BoxDecoration(
                      color: AppColors.surfaceTwo,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    codeblockPadding: const EdgeInsets.all(16),
                  ),
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  text: 'Return Home', 
                  isHomeButton: false,
                  height: 40, 
                  width: 120, 
                  perform: () {
                    // Navigator.popUntil(context, predicate);
                  }
                ),
                AppButton(
                  text: 'Next Lesson', 
                  isHomeButton: false,
                  height: 40, 
                  width: 120, 
                  perform: () {}
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}