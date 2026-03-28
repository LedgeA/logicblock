import 'package:flutter/material.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/screens/home.dart';
import 'package:logicblock/screens/username_prompt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSplash extends StatefulWidget {
  const AppSplash({super.key});

  @override
  State<AppSplash> createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _navigateToUsernamePrompt();
  }

  _navigateToUsernamePrompt() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'User';
    });

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            _username == 'User' ? UsernamePromptScreen() : HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Image.asset('assets/images/logo.png', width: 500)),
    );
  }
}
