import 'package:flutter/material.dart';
import 'package:logicblock/components/fonts.dart';

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
    required this.perform
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 187, 154, 247)
      ),
      child: Text(text, style: AppTexts.button),
    );
  }
  
}