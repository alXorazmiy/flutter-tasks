import 'package:flutter/material.dart';
import 'package:task_2/app/app.dart';
import 'package:task_2/app/global/app_global.dart';
Future<void> main() async {
    await Global.init();
    runApp(App());
}

