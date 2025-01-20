


import 'package:get/get.dart';

class AppController extends GetxController {
	final language = ''.obs;


	void select_language(String lan) async {
		language.value = lan;
	}
}