import 'package:flutter/material.dart';
import 'package:logicblock/components/colors.dart';
import 'package:logicblock/screens/sandbox.dart';
import 'package:logicblock/screens/concept.dart';
import 'package:logicblock/screens/problem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonScreens extends StatefulWidget {
  static const concepts = <String>[
    """
  # Variables and Data Types

  &nbsp;&nbsp;&nbsp;&nbsp;A variable is a named storage location in memory that holds data. In Python, you do not need to declare the type before using it—the type is automatically decided based on the value you assign (this is called dynamic typing). This is important because almost every program starts by storing data so the computer can "remember" it for later calculations or decisions.
  &nbsp;
  ## Common types in Python:
  * int → whole numbers without a decimal
  * float → numbers with decimal points
  * str → text or strings
  * bool → `True` or `False` values
  &nbsp;
  ## Example

  ```python
  age = 20           # int
  height = 1.75      # float
  name = "Robin"     # str
  is_student = True  # bool

  print(age)
  print(height)
  print(name)
  print(is_student)
  ```
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;This is important because almost every program starts by storing and working with data. Variables let the computer “remember” values so you can use them later in calculations or decisions.
  """,

    """
  # Arithmetic Operators

  &nbsp;&nbsp;&nbsp;&nbsp;Arithmetic operators are used to perform mathematical calculations on numbers or variables. These are the basic math tools you will use in almost every program. These operators matter because they allow you to calculate totals, averages, scores, or any math-based results directly inside your code.
  &nbsp;
  ## Common arithmetic operators:
  * `+` → Addition
  * `-` → Subtraction
  * `*` → Multiplication
  * / → Division
  (always returns a float)
  * // → Floor Division 
  (returns integer only)
  * % → Modulo 
  (returns the remainder)
  * ** → Exponentiation 
  (raises to a power)
  &nbsp;
  ## Example

  ```python
  a = 10
  b = 3

  print(a + b)   # 13
  print(a - b)   # 7
  print(a * b)   # 30
  print(a / b)   # 3.3333333333333335
  print(a // b)  # 3
  print(a % b)   # 1
  print(a ** b)  # 1000
  ```
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;These operators matter because they allow you to calculate totals, averages, scores, or any math-based results directly inside your code.
  """,

    """
  # Relational Operators

  &nbsp;&nbsp;&nbsp;&nbsp;Relational operators (also called comparison operators) compare two values and return either `True` or `False`. They form the foundation for making decisions in programs.
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;They are essential because they let the program ask questions like "Is the score high enough?" or "Are these two values the same?" before deciding what to do next.
  &nbsp;
  ## Common relational operators:
  * == → Equal to
  * != → Not equal to
  * `>` → Greater than
  * `<` → Less than
  * `>=` → Greater than or equal to
  * `<=` → Less than or equal to
  &nbsp;
  ## Example

  ```python
  x = 10
  y = 5

  print(x == y)   # False
  print(x != y)   # True
  print(x > y)    # True
  print(x <= 10)  # True
  ```
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;They are essential because they let the program ask questions like “Is the score high enough?” or “Are these two values the same?” before deciding what to do next.
  """,

    """
  # Lesson 4: Logical Operators
  
  &nbsp;&nbsp;&nbsp;&nbsp;Logical operators combine or reverse comparison results (`True`/`False`). They allow you to build more complex conditions by joining multiple checks together.
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;Logical operators are important because real-life decisions often need more than one condition—for example, "You must be 18 AND have an ID card."
  &nbsp;
  ## The three logical operators are:
  * and → returns `True` only if both conditions are `True`
  * or → returns `True` if at least one condition is `True`
  * not → reverses the result (`True` becomes `False`, and vice versa)
  &nbsp;
  ## Example
  
  ```python
  age = 20
  has_id = True
  
  print(age >= 18 and has_id)  # True
  print(age >= 18 or has_id)   # True
  print(not (age < 18))        # True
  ```
  &nbsp;logicblock
  &nbsp;&nbsp;&nbsp;&nbsp;Logical operators are important because real-life decisions often need more than one condition — for example, “You must be 18 AND have an ID card.”
  """,

    """
  # The if Statement

  &nbsp;&nbsp;&nbsp;&nbsp;The if statement lets the program execute a block of code only when a condition is `True`. It is the simplest way to add decision-making to your code. If the condition is `True`, the indented code runs. If it is `False`, nothing happens.
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;This is the starting point for all conditional logic—the program can now react differently based on the data.
  &nbsp;
  ## Example

  ```python
  score = 85

  if score >= 75:
      print("Congrats! You passed.")
  ```
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;This is the starting point for all conditional logic — the program can now react differently based on the data.
  """,

    """
  # Lesson 6: if/else Statement

  &nbsp;&nbsp;&nbsp;&nbsp;The if/else statement gives two possible paths: if the condition is `True`, run the if block; if it is `False`, run the else block instead.
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;This is very useful because every decision usually has two outcomes—success or failure, yes or no—and if/else handles both cleanly.
  &nbsp;
  ## Example

  ```python
  score = 65

  if score >= 75:
      print("You passed!")
  else:
      print("Sorry, you failed.")
  ```
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;This is very useful because every decision usually has two outcomes — success or failure, yes or no — and if/else handles both cleanly.
  """,

    """
  # Lesson 7: while Loop

  &nbsp;&nbsp;&nbsp;&nbsp;A while loop repeats a block of code as long as a condition remains `True`. Once the condition becomes `False`, the loop stops. 
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;It is used for "repeat until" situations. You must update a variable inside the loop so it eventually stops (to avoid an infinite loop). The while loop is the basic way to repeat actions in Python.
  &nbsp;
  ## Example

  ```python
  count = 1

  while count <= 5:
      print("Count:", count)
      count = count + 1
  ```
  &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;This prints numbers 1 to 5. The while loop is the basic way to repeat actions in Python.
  """,
  ];

  static const problems = <String>[
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Store a student's name (string), age (integer), height in meters (float), and student status (boolean). Then print all four values on separate lines.
  &nbsp;
  ## Example Solution

  ```python
  name = "Jordan"      # str
  age = 19             # int
  height = 1.72        # float
  is_student = True    # bool

  print(name)
  print(age)
  print(height)
  print(is_student)
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Assign 10 to variable a and 3 to variable b. Use all arithmetic operators to calculate and print: sum, difference, product, division, floor division, remainder, and exponentiation.
  &nbsp;
  ## Example Solution

  ```python
  a = 10
  b = 3

  print(a + b)   # sum
  print(a - b)   # difference
  print(a * b)   # product
  print(a / b)   # division
  print(a // b)  # floor division
  print(a % b)   # remainder
  print(a ** b)  # exponentiation
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Assign 15 to variable x and 10 to variable y. Use all relational operators to compare them and print the results.
  &nbsp;
  ## Example Solution

  ```python
  x = 15
  y = 10

  print(x == y)  # Equal to (False)
  print(x != y)  # Not equal to (True)
  print(x > y)   # Greater than (True)
  print(x < y)   # Less than (False)
  print(x >= y)  # Greater than or equal to (True)
  print(x <= y)  # Less than or equal to (False)
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Assign 20 to age and `True` to has_id. Use logical operators to check:
  * Is the person 18 or older AND has an ID?
  * Is the person 18 or older OR has an ID?
  * Is the person NOT under 18? 

  &nbsp;&nbsp;&nbsp;&nbsp;Print all three results.
  &nbsp;
  ## Example Solution

  ```python
  age = 20
  has_id = True

  print(age >= 18 and has_id)  # AND condition
  print(age >= 18 or has_id)   # OR condition
  print(not (age < 18))        # NOT condition
  ```
  """,
    """
  # Problem
  
  &nbsp;&nbsp;&nbsp;&nbsp;A student has a score. If the score is 75 or higher, display "You passed the exam."
  &nbsp;
  ## Example Solution
  
  ```python
  score = 82  # Example score
  
  if score >= 75:
      print("You passed the exam.")
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Ask a program to check a number. If the number is even, print "Even number". Otherwise, print "Odd number".
  &nbsp;
  ## Example Solution

  ```python
  number = 42  # Example number

  if number % 2 == 0:
      print("Even number")
  else:
      print("Odd number")
  ```
  """,
    """
  # Problem

  &nbsp;&nbsp;&nbsp;&nbsp;Print numbers from 1 to 5 using a loop.
  &nbsp;
  ## Example Solution

  ```python
  count = 1

  while count <= 5:
      print(count)
      count += 1  # This is the same as count = count + 1
  ```
  """,
  ];

  final int lessonNumber;

  const LessonScreens({super.key, required this.lessonNumber});

  @override
  State<LessonScreens> createState() => _LessonScreensState();
}

class _LessonScreensState extends State<LessonScreens> {
  String _savedUsername = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final String fetchedName = prefs.getString('username') ?? 'Guest';
    setState(() {
      _savedUsername = fetchedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ConceptScreen(text: LessonScreens.concepts[widget.lessonNumber]),
          ProblemScreen(text: LessonScreens.problems[widget.lessonNumber]),
          SandboxScreen(lessonNumber: widget.lessonNumber),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.surfaceOne,
        foregroundColor: AppColors.glow,
        onPressed: () {
          Navigator.pop(context);
          print(_savedUsername);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
