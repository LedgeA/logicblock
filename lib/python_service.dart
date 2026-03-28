import 'package:flutter/services.dart';

class PythonService {
  static const platform = MethodChannel('python');
  static Future<String> runPython(String code) async{
    final result = await platform.invokeMethod("runPython", {
      "code": code
    });

    return result;
  }
}

