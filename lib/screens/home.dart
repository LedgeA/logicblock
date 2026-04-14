import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logicblock/components/cards.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/entries.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/main.dart';
import 'package:logicblock/screens/sandbox.dart';
import 'package:logicblock/screens/challenges.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  String _username = 'Loading...';
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
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    final String loadedUsername = prefs.getString('username') ?? 'User';
    final List<String> loadedLessons = [];

    for (int i = 1; i <= 7; i++) {
      loadedLessons.add(prefs.getString("lesson$i") ?? "Not Finished");
      print(prefs.getString("lesson$i") ?? "Not Finished");
    }

    setState(() {
      _username = loadedUsername;
      _lessons = loadedLessons;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _lessonTitles = [
      'Variables and Data Types',
      'Arithmetic Operators',
      'Relational Operators',
      'Logical Operators',
      'if Statement',
      'if/else Statement',
      'while Loop',
    ];

    int lastCompleted = _lessons.lastIndexWhere((s) => s == "Completed");

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello $_username!', style: AppTexts.headingOne),
                        Text('Welcome!', style: AppTexts.headingThree),
                      ],
                    ),
                  ],
                ),
                ButtonCard(
                  text: 'Challenges',
                  buttonText: 'Solve a Random Problem',
                  perform: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChallengeScreen(),
                      ),
                    );
                  },
                ),
                ButtonCard(
                  text: 'Practice coding freely',
                  buttonText: 'Start Sandbox',
                  perform: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          body: SandboxScreen(lessonNumber: -1),
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
                  children: List.generate(_lessonTitles.length, (index) {
                    bool isLocked = index > lastCompleted + 1;
                    return Opacity(
                      opacity: isLocked ? 0.5 : 1.0,
                      child: AbsorbPointer(
                        absorbing: isLocked,
                        child: LessonEntry(
                          title: _lessonTitles[index],
                          status: _lessons[index],
                          lessonNumber: index,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
