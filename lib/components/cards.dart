import 'package:flutter/material.dart';
import 'package:logicblock/components/buttons.dart';

import './fonts.dart';
import './colors.dart';

class ButtonCard extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback perform;
  final String status;
  
  const ButtonCard({
    super.key,
    required this.text,
    required this.buttonText,
    required this.perform,
    this.status = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.surfaceOne
      ),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              Text(text, style: AppTexts.headingTwo),
              if (status != '')
                Container(
                  padding: EdgeInsetsDirectional.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.surfaceTwo
                  ),
                  child: Text(status, style: AppTexts.code,),
                )
            ],
          ),
          SizedBox(height: 15),
          AppButton(
            text: buttonText, 
            height: 40, 
            width: double.infinity, 
            perform: perform
          ),
        ],
      ),
    );
  }
}


