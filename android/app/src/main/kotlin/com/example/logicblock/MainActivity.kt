package com.example.logicblock

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import com.chaquo.python.Python
import com.chaquo.python.android.AndroidPlatform

class MainActivity : FlutterActivity(){
    private val CHANNEL = "python"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {call, result ->
            if(call.method == "runPython"){
                val code = call.argument<String>("code")!!
                val output = runPython(code)
                result.success(output)
            } else {
                result.notImplemented()
            }
        }
    }

    fun runPython(code: String): String {
        if(!Python.isStarted()){
            Python.start(AndroidPlatform(this))
        }

        val py = Python.getInstance()

        val result = py.getModule("runner").callAttr("run_code", code)

        return result.toString()
    }
}
