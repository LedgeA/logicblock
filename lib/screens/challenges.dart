import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/screens/sandbox.dart';
import 'package:logicblock/screens/problem.dart';

class ChallengeScreen extends StatefulWidget {
  static const challenges = <String>[
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Imagine you are coding a character for a video game. Create variables to store the character's name (string), their maximum health points (integer), their movement speed multiplier (float), and whether their ultimate ability is ready to use (boolean). Print each variable on a new line.
  &nbsp;
  ## Example Solution

  ```python
  character_name = "Aloy"   # str
  max_hp = 450              # int
  speed_multiplier = 1.15   # float
  ultimate_ready = False    # bool

  print(character_name)
  print(max_hp)
  print(speed_multiplier)
  print(ultimate_ready)
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;You are calculating dimensions for a rectangular garden plot. Assign 15 to the `length` and 4 to the `width`. Use arithmetic operators to calculate and print: the sum of the sides (length + width), the difference between them, the area (product), the exact ratio of length to width (division), how many whole 4x4 square boxes fit along the length (floor division), the remaining length after those boxes (remainder), and the area squared (exponentiation).
  &nbsp;
  ## Example Solution

  ```python
  length = 15
  width = 4

  print(length + width)   # sum
  print(length - width)   # difference
  print(length * width)   # product (area)
  print(length / width)   # exact division
  print(length // width)  # floor division
  print(length % width)   # remainder
  print((length * width) ** 2)  # exponentiation
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Two players just finished an arcade game. Player 1 scored 1024 points, and Player 2 scored 512 points. Use all six relational operators to compare Player 1's score against Player 2's score, printing the `True` or `False` result of each comparison.
  &nbsp;
  ## Example Solution

  ```python
  p1_score = 1024
  p2_score = 512

  print(p1_score == p2_score)  # Equal to (False)
  print(p1_score != p2_score)  # Not equal to (True)
  print(p1_score > p2_score)   # Greater than (True)
  print(p1_score < p2_score)   # Less than (False)
  print(p1_score >= p2_score)  # Greater than or equal to (True)
  print(p1_score <= p2_score)  # Less than or equal to (False)
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;A user is trying to access a secure company server. They have an `access_level` of 3, a `valid_token` set to `True`, and a firewall flag `is_flagged` set to `False`. 
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;Use logical operators to check and print:
  * Do they have an access level of 3 or higher AND a valid token?
  * Do they have an access level of 5 OR a valid token?
  * Are they NOT flagged by the firewall?
  &nbsp;
  ## Example Solution

  ```python
  access_level = 3
  valid_token = True
  is_flagged = False

  print(access_level >= 3 and valid_token)  # AND condition
  print(access_level == 5 or valid_token)   # OR condition
  print(not is_flagged)                     # NOT condition
  ```
  """,
    """
  # Problem
  
  &nbsp;&nbsp;&nbsp;&nbsp;A fitness app tracks daily steps. If the user's `current_steps` reach or exceed their `daily_goal` of 10000, print the message "Goal achieved! Great job."
  &nbsp;
  ## Example Solution
  
  ```python
  current_steps = 10500
  daily_goal = 10000
  
  if current_steps >= daily_goal:
      print("Goal achieved! Great job.")
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Write a program that simulates a simple password validator. Check the length of a password string (you can use a variable that holds the number of characters, like `password_length = 6`). If the length is 8 or more, print "Password saved." Otherwise, print "Password too short. Needs to be at least 8 characters."
  &nbsp;
  ## Example Solution

  ```pythonChallengeSc
  password_length = 6

  if password_length >= 8:
      print("Password saved.")
  else:
      print("Password too short. Needs to be at least 8 characters.")
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;You are saving up to buy a \$20 book. You start with \$0 in your `savings`, and you add \$5 every week. Use a `while` loop to simulate adding money until your savings reach \$20. Inside the loop, print the current amount of savings. 
  &nbsp;
  ## Example Solution

  ```python
  savings = 0

  while savings < 20:
      savings += 5
      print("You now have:", savings)
  ```
  """,
  ];

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late String _currentChallenge;

  @override
  void initState() {
    super.initState();
    final random = Random();
    int randomIndex = random.nextInt(ChallengeScreen.challenges.length);
    _currentChallenge = ChallengeScreen.challenges[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ProblemScreen(text: _currentChallenge),
          SandboxScreen(lessonNumber: -1),
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
