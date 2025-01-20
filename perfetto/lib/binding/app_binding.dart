


import 'package:get/get.dart';
import 'package:perfetto/controller/appController.dart';
import 'package:perfetto/controller/authController.dart';




class AppBinding extends Bindings {
	@override
	void dependencies() {
		// Get.lazyPut(()=>AppController());
		Get.put(AppController());
		Get.put(AuthController());
	}
}