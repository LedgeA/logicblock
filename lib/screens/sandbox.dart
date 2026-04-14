import 'package:logicblock/components/fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logicblock/components/buttons.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/screens/code.dart';
import 'package:logicblock/screens/output.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SandboxScreen extends StatefulWidget {
  final int lessonNumber;
  const SandboxScreen({super.key, required this.lessonNumber});

  @override
  State<SandboxScreen> createState() => _SandboxScreenState();
}

class _SandboxScreenState extends State<SandboxScreen> {
  late final WebViewController _controller;

  String pythonCode = "";
  String _terminalOutput = "";
  bool isRunning = false;
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    print('lesson${widget.lessonNumber}');
    super.initState();
    _controller = WebViewController()
      ..setBackgroundColor(const Color(0xFF1E1E1E))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'CodeChannel',
        onMessageReceived: (JavaScriptMessage message) {
          setState(() {
            pythonCode = message.message;
          });
        },
      )
      ..addJavaScriptChannel(
        'OutputChannel',
        onMessageReceived: (JavaScriptMessage message) {
          final result = message.message;

          setState(() {
            if (result.startsWith("ERROR|")) {
              _terminalOutput = result.replaceFirst("ERROR|", "");
              isRunning = false;
            } else {
              _terminalOutput = result.replaceFirst("SUCCESS|", "");
              isRunning = true;
              if (_terminalOutput.isEmpty) {
                _terminalOutput = "Program finished with no output.";
              }
            }
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OutputScreen(
                terminalOutput: _terminalOutput,
                lessonNumber: widget.lessonNumber,
                isRunning: isRunning,
              ),
            ),
          );
        },
      )
      ..addJavaScriptChannel(
        'InputChannel',
        onMessageReceived: (JavaScriptMessage message) {
          _inputDialog(message.message);
        },
      );

    _loadLocalHTML();
  }

  Future<void> _loadLocalHTML() async {
    await _controller.loadFlutterAsset('assets/blockly/index.html');
  }

  Future<void> _inputDialog(String promptText) async {
    _inputController.clear();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.surfaceOne,
          title: Text(
            promptText.isEmpty ? "Input Required" : promptText,
            style: AppTexts.headingTwo,
          ),
          content: TextField(
            controller: _inputController,
            style: AppTexts.body,
            decoration: InputDecoration(
              hintText: 'Enter a value',
              hintStyle: AppTexts.disabledBody,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.surfaceTwo,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _controller.runJavaScript("receiveFlutterInput(null);");
                Navigator.of(context).pop();
              },
              child: const Text("Cancel", style: AppTexts.body),
            ),
            AppButton(
              text: 'Submit',
              isHomeButton: false,
              height: 40,
              width: 100,
              perform: () {
                final String safeAnswer = _inputController.text.replaceAll(
                  "'",
                  "\\'",
                );
                _controller.runJavaScript(
                  "receiveFlutterInput('$safeAnswer');",
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            color: AppColors.background,
            height: 100,
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.text_fields),
                      color: AppColors.glow,
                      iconSize: 30.0,
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodeScreen(code: pythonCode),
                          ),
                        ),
                      },
                    ),
                    AppButton(
                      text: 'Run',
                      isHomeButton: false,
                      height: 40,
                      width: 100,
                      perform: () => {
                        _controller.runJavaScript('executePython();'),
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRect(
              child: WebViewWidget(
                controller: _controller,
                gestureRecognizers: {
                  Factory<EagerGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
              ),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
