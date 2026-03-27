import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logicblock/components/buttons.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/components/fonts.dart';
import 'package:logicblock/screens/home.dart';

class UsernamePromptScreen extends StatefulWidget {
  const UsernamePromptScreen({super.key});

  @override
  State<UsernamePromptScreen> createState() => _UsernamePromptScreenState();
}

class _UsernamePromptScreenState extends State<UsernamePromptScreen> {

  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  
  _navigateToHome() async {
    if (!mounted || usernameController.text.isEmpty) return; 

    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setString('username', usernameController.text);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(username: usernameController.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Center( 
              child: Image.asset(
                'assets/images/logo.png',
                width: 500,
              ),
          ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(30), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.surfaceOne
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20 ,
                    children: [
                      Text('Let us know your name!', style: AppTexts.headingTwo),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: AppTexts.disabledBody,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none, 
                          ),
                          filled: true,
                          fillColor: AppColors.surfaceTwo
                        ),
                        style: AppTexts.body,
                        controller: usernameController,
                      ),
                      Text('We will use it to refer to you', style: AppTexts.smallBody)
                    ],
                  ),
                ),
                AppButton(
                  text: 'Done', 
                  isHomeButton: false,
                  height: 40, 
                  width: 100, 
                  perform: () => _navigateToHome())
              ],
            )
          )
        ],
      )
    );
  }
}