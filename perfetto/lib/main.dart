import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfetto/controller/authController.dart';
import 'package:perfetto/screens/language_screen.dart';

import 'binding/app_binding.dart';
import 'controller/appController.dart';

void main() {
	Get.put(AppController());
	Get.put(AuthController());
  	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return GetMaterialApp(
			debugShowCheckedModeBanner: false,
			initialBinding: AppBinding(),
			home: LanguageScreen(),
		);
	}
}
