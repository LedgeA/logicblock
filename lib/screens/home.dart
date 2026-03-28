import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logicblock/components/cards.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/entries.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/main.dart';
import 'package:logicblock/screens/daily_problems.dart';
import 'package:logicblock/screens/sandbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  String _username = 'Loading...';
  // FIX 1: Initialize with 7 placeholders to prevent RangeError during the first build
  List<String> _lessons = List.filled(7, "Loading...");

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // FIX 3: Removed redundant setState wrapper
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    // Create temporary variables to hold the new data
    final String loadedUsername = prefs.getString('username') ?? 'User';
    final List<String> loadedLessons = [];

    for (int i = 1; i <= 7; i++) {
      loadedLessons.add(prefs.getString("lesson$i") ?? "Not Finished");
      print(prefs.getString("lesson$i") ?? "Not Finished");
    }

    // FIX 2: Replace the list instead of continuously appending to it
    setState(() {
      _username = loadedUsername;
      _lessons = loadedLessons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Note: 'spacing' is a relatively new feature in Flutter's Column.
              // Ensure you are on Flutter 3.27+ to use this without errors!
              spacing: 20,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello $_username!', // Cleaned up string concatenation
                      style: AppTexts.headingOne,
                    ),
                    Text('Welcome!', style: AppTexts.headingThree),
                  ],
                ),
                ButtonCard(
                  text: 'Daily Problem',
                  buttonText: 'Solve Daily Problem',
                  perform: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChallengeScreen(),
                      ),
                    );
                  },
                  status: 'Not Started',
                ),
                ButtonCard(
                  text: 'Practice coding freely',
                  buttonText: 'Open Sandbox',
                  perform: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          body: SandboxScreen(lessonNumber: 0),
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.startFloat,
                          floatingActionButton: FloatingActionButton(
                            backgroundColor: AppColors.surfaceOne,
                            foregroundColor: AppColors.glow,
                            onPressed: () => Navigator.pop(context),
                            child: Icon(Icons.home),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Text('Lessons', style: AppTexts.headingTwo),
                Column(
                  spacing: 10,
                  children: [
                    LessonEntry(
                      title: 'Variables and Data Types',
                      status: _lessons[0],
                      lessonNumber: 0,
                    ),
                    LessonEntry(
                      title: 'Arithmetic Operators',
                      status: _lessons[1],
                      lessonNumber: 1,
                    ),
                    LessonEntry(
                      title: 'Relational Operators',
                      status: _lessons[2],
                      lessonNumber: 2,
                    ),
                    LessonEntry(
                      title: 'Logical Operators',
                      status: _lessons[3],
                      lessonNumber: 3,
                    ),
                    LessonEntry(
                      title: 'if Statement',
                      status: _lessons[4],
                      lessonNumber: 4,
                    ),
                    LessonEntry(
                      title: 'if/else Statement',
                      status: _lessons[5],
                      lessonNumber: 5,
                    ),
                    LessonEntry(
                      title: 'while Loop',
                      status: _lessons[6],
                      lessonNumber: 6,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
