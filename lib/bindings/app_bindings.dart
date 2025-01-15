

import 'package:flutter_project/controllers/app_controller.dart';
import 'package:flutter_project/controllers/calendar_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
	@override
	void dependencies() {
		Get.put(AppController());
		Get.put(CalendarController());
	}
}

