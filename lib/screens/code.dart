import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';

class CodeScreen extends StatelessWidget {
  final String code;

  const CodeScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Text', style: AppTexts.headingTwo),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.grid_view, color: AppColors.glow),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceOne,
                borderRadius: BorderRadius.circular(15),
              ),
              child: MarkdownBody(
                data: code,
                softLineBreak: true,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                    .copyWith(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
