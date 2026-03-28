import 'package:flutter/material.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/screens/lesson.dart';

class LessonEntry extends StatelessWidget {
  final String title;
  final String status;
  final int lessonNumber;

  const LessonEntry({
    super.key,
    required this.title,
    required this.status,
    required this.lessonNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LessonScreens(lessonNumber: this.lessonNumber),
        ),
      ),
      child: Column(
        children: [
          Divider(height: 30, thickness: 1, color: AppColors.disabled),
          Row(
            spacing: 13,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 5),
                  if (status == 'Completed')
                    Icon(Icons.check_box, color: AppColors.primary)
                  else
                    Icon(
                      Icons.check_box_outline_blank,
                      color: AppColors.primary,
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 3,
                children: [
                  Text(title, style: AppTexts.headingTwo),
                  Row(
                    spacing: 7,
                    children: [
                      Text('Status:', style: AppTexts.headingThree),
                      Container(
                        padding: EdgeInsetsDirectional.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.surfaceOne,
                        ),
                        child: Text(status, style: AppTexts.code),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
