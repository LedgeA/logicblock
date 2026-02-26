import 'package:flutter/material.dart';

import './fonts.dart';

class ButtonCard extends StatelessWidget {
  final String text;
  final String buttonText;
  final String status;
  
  const ButtonCard({
    super.key,
    required this.text,
    required this.buttonText,
    this.status = ''
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber
      ),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              Text(text, style: AppTexts.headingTwo),
              Text(status, style: AppTexts.body)
            ],
          ),
          ElevatedButton(
            onPressed: () => {}, 
            child: Text('buttonText')
          )
        ],
      ),
    );
  }
}

