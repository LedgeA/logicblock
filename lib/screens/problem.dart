import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';

class ProblemScreen extends StatelessWidget {

  final String text;

  const ProblemScreen({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Container(
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
        )
      ),
    );
  }
}
