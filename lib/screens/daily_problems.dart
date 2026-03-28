import 'package:flutter/material.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/screens/problem.dart';
import 'package:logicblock/screens/sandbox.dart';

class ChallengeScreen extends StatelessWidget {
  static const String concept = """
  # Variables & Data Types
  &nbsp;&nbsp;&nbsp;&nbsp;Think of a variable as a labeled storage box in your computer's memory where you can keep data. Python is dynamically typed, meaning you don't have to declare the type of box ahead of time—Python figures it out based on what you put inside!
  &nbsp;
  ## Core Data Types
  * String (str): Text wrapped in quotes (e.g., "Hello, World!")
  * Integer (int): Whole numbers without a decimal (e.g., 42)
  * Float (float): Numbers with a decimal point (e.g., 3.14)
  * Boolean (bool): Represents a binary state, exactly True or False

  ```python
  # Assigning values to variables 
  player_name = "Alex"    # String 
  score = 150             # Integer 
  health_multiplier = 1.5 # Float 
  is_game_over = False    # Boolean

  # Printing a message using the variables 
  print(f"Welcome {player_name}!”)
  print(“Your score is {score}.")
  ```
  """;

  static const String lesson = """
  # The Coffee Shop Checkout
  &nbsp;&nbsp;&nbsp;&nbsp;You are programming a simple checkout system for a local cafe. You need to store information about a customer's order in the computer's memory so you can print a receipt.
  &nbsp;
  ## Coding Challenge

  &nbsp;&nbsp;&nbsp;&nbsp;Write a small Python script that creates variables for the following pieces of information, choosing the correct data type for each:
  1. The name of the drink (e.g., "Caramel Macchiato")
  2. The number of drinks ordered (e.g., 2)
  3. The price per drink (e.g., 4.50)
  4. Whether the order is for "here" or "to-go" (represented by a True/False value for "is to-go")
  Once you have created the variables, use the print block that outputs a summary of the order.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ProblemScreen(text: lesson),
          SandboxScreen(lessonNumber: 0),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.surfaceOne,
        foregroundColor: AppColors.glow,
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.home),
      ),
    );
  }
}
