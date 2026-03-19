import 'package:flutter/material.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/screens/concept.dart';
import 'package:logicblock/screens/done/problem.dart';
import 'package:logicblock/screens/sandbox.dart';

class LessonScreens extends StatelessWidget {
  
  static const concepts = <String> [
  """
  # Variables and Data Types

  &nbsp;&nbsp;&nbsp;&nbsp;A variable is like a labeled box that holds one value. You choose a name and put a value inside using `=`.
  &nbsp;
  ## Common types in Python:
  * int → whole numbers
  * float → decimal numbers
  * str → text (must use quotes)
  * bool → only `True` or `False`
  &nbsp;
  ## Example

  ```python
  age = 16          # int
  height = 1.62     # float
  name = "Maria"    # str
  has_pet = True    # bool
  """,

  """
  # Operators

  &nbsp;&nbsp;&nbsp;&nbsp;Operators let you do math and make comparisons.
  &nbsp;
  ## Types of Operators:
  * Arithmetic: `+`, `-`, `*`, `/`, 
  `//` (integer division), 
  `%`  (remainder), 
  `**` (power)
  * Relational (comparison): 
  `==`, `!=`, `>`, `<`, `>=`, `<=` 
  
  * Logical: `and`, `or`, `not`  
  &nbsp;
  ## Example

  ```python
  total = 10 * 25.5                      # Arithmetic
  mahal = total > 200                    # Relational
  discount = total > 200 and total < 300 # Logical
  ```
  """,

  """
  # Conditionals

  &nbsp;&nbsp;&nbsp;&nbsp;`if` checks a condition.
  &nbsp;
  ## How it works:
  * If `True` → run the indented block.
  * `else` → run when the condition is `False`.
  * **Indentation (4 spaces) is required!**
  &nbsp;
  ## Example

  ```python
  grade = 80
  if grade >= 75:
      print("Pasado!")
  else:
      print("Bagsak.")
  """
  ];

  static const problems = <String> [
  """
  # Exercise: Creating Variables

  &nbsp;&nbsp;&nbsp;&nbsp;Create variables that store the following personal information:
  &nbsp;
  ## Requirements:
  * Your name (text)
  * Your age this year (whole number)
  * Your height in meters (with decimal)
  * Whether you have a pet (yes = `True`, no = `False`)
  &nbsp;
  ## Instructions:

  &nbsp;&nbsp;&nbsp;&nbsp;Then print all four values in one clear sentence.
  &nbsp;
  ## Example Solution

  ```python
  name = "Alex"
  age = 16
  height = 1.62
  has_pet = True

  print(f"Hi, I am {name}, I am {age} years old, {height}m tall, and it is {has_pet} that I have a pet.")
  """,

  """
  # Exercise: Mango Calculator

  &nbsp;&nbsp;&nbsp;&nbsp;Ask the user to enter input values and perform calculations based on their answers.
  &nbsp;
  ## Ask the user to enter:
  * 1. Number of mangoes they want to buy
  * 2. Price per mango
  &nbsp;
  ## Calculate and show:
  * Total cost
  * If total cost is more than 200 → say "Mahal na!"
  * Remainder when total cost is divided by 50
  &nbsp;
  ## Example Solution

  ```python
  mangoes = int(input("How many mangoes do you want to buy? "))
  price = float(input("What is the price per mango? "))

  total_cost = mangoes * price
  print(f"Total cost: {total_cost}")

  if total_cost > 200:
      print("Mahal na!")

  remainder = total_cost % 50
  print(f"Remainder when divided by 50: {remainder}")
  """,
  
  """
  # Exercise: Grade Checker

  &nbsp;&nbsp;&nbsp;&nbsp;Ask the user to input their numerical grade and evaluate if they passed or failed.
  &nbsp;
  ## Instructions:
  * Ask the user for their grade (0–100).
  * If grade ≥ 75 → print "Pasado ka!"
  * Otherwise → print "Bagsak. Mag-aral ulit."
  &nbsp;
  ## Example Solution

  ```python
  grade = float(input("Enter your grade (0-100): "))

  if grade >= 75:
      print("Pasado ka!")
  else:
      print("Bagsak. Mag-aral ulit.")
  """
  ];

  final int lessonNumber;

  const LessonScreens({
    super.key, 
    required this.lessonNumber
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ConceptScreen(text: concepts[lessonNumber]),
          ProblemScreen(text: problems[lessonNumber]),
          SandboxScreen()
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