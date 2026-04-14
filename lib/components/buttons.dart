import 'package:flutter/material.dart';

import './fonts.dart';
import './colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback perform;

  const AppButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.perform,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: perform,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
        child: Text(text, style: AppTexts.button),
      ),
    );
  }
}
