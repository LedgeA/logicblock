import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:logicblock/components/buttons.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/screens/lesson.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutputScreen extends StatefulWidget {
  final String terminalOutput;
  final int lessonNumber;
  final bool isRunning;

  const OutputScreen({
    super.key,
    required this.terminalOutput,
    required this.lessonNumber,
    required this.isRunning,
  });

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  // 1. Add a loading flag
  bool _isLoading = true;
  String status = '';

  @override
  void initState() {
    super.initState();
    _loadLessonStatus();
  }

  _loadLessonStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final loadedStatus =
        prefs.getString('lesson${widget.lessonNumber + 1}') ?? "Not Finished";

    if (mounted) {
      print("Data loaded! Status is: $loadedStatus");
      setState(() {
        status = loadedStatus;
        _isLoading = false;
      });
    }
  }

  _updateLessonStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lesson${widget.lessonNumber + 1}', status);
  }

  _codeStatus() {
    if (widget.isRunning) {
      return 'Code is Running';
    }
    return 'There is an error';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 22,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_codeStatus(), style: AppTexts.headingOne),
                if (widget.lessonNumber != -1 &&
                    widget.isRunning &&
                    !_isLoading)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Done?", style: AppTexts.body),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (status != "Completed") status = "Completed";
                          });
                        },
                        child: (status == 'Completed')
                            ? const Icon(
                                Icons.check_box,
                                color: AppColors.primary,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: AppColors.primary,
                              ),
                      ),
                    ],
                  ),
                if (widget.lessonNumber != -1 && _isLoading)
                  const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
            const Divider(height: 3, thickness: 1, color: AppColors.disabled),
            Text('Output', style: AppTexts.headingTwo),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceOne,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: MarkdownBody(
                    data: widget.terminalOutput,
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_circle_left,
                    color: AppColors.primary,
                    size: 45,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _updateLessonStatus();
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Icon(Icons.home, color: AppColors.primary, size: 45),
                ),

                if (widget.lessonNumber != -1)
                  AppButton(
                    text: 'Next Lesson',
                    isHomeButton: false,
                    height: 40,
                    width: 120,
                    perform: () {
                      _updateLessonStatus();
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonScreens(
                            lessonNumber: widget.lessonNumber + 1,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
