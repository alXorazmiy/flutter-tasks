


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfetto/pages/Home/homePage.dart';
import 'package:perfetto/screens/code_verification_screen.dart';
import 'package:perfetto/service/network/authoration.dart';



class AuthController extends GetxController {

	TextEditingController full_name = TextEditingController();
	TextEditingController phone = TextEditingController();
	final code = "".obs;
	final phone_error = true.obs;
	final code_error = true.obs;


	final Map<int, TextEditingController> code_controllers = {
		0: TextEditingController(),
		1: TextEditingController(),
		2: TextEditingController(),
		3: TextEditingController(),
		4: TextEditingController(),
	}.obs;

	final Map<int, FocusNode> focusNodes = {
		0: FocusNode(),
		1: FocusNode(),
		2: FocusNode(),
		3: FocusNode(),
		4: FocusNode(),
	}.obs;


	late Timer _timer;
	RxInt start = 120.obs;



	String get timeString {
		int minutes = start.value ~/60;
		int seconds = start.value % 60;
		return '$minutes:${seconds.toString().padLeft(2, "0")}';
	}

	void startTimer() {
		_timer = Timer.periodic(Duration(seconds: 1), (timer) {
			if (start.value == 0) {
				_timer.cancel(); 
			} else if (start.value == 1) {
				code_error.value = false;
				start.value--; 
			} 
			else {
				start.value--; 
			}
		});
  }


	void check_code() async {

		if (timeString == "0:00") {
			start.value = 120;
			code_error.value = true;
			startTimer();

		} else {
			String _code = code_controllers.values.map((controller)=>controller.text).join("");

			var result =  await CustomerAuthorizatoinService().sendPhoneNumberAndCode(phone.text, _code);
			if (result.statusCode == 200) {
				Get.to(HomePage());

				code_error.value = true;
			} else {
				code_error.value = false;
			}

		
		}
	}

	void check_number() async {
		String phoneNumber = phone.text;
		RegExp regExp = RegExp(r'^\+998\ \(\d{2}\)\ \d{3}\ \d{2}\ \d{2}$');
		if (regExp.hasMatch(phoneNumber)) {
			phone_error.value = true;
			if (full_name.text != "") {
				phoneNumber = phoneNumber.substring(0,5) + phoneNumber.substring(6,8) + phoneNumber.substring(9,12) + phoneNumber.substring(12,15) + phoneNumber.substring(15,19);
				phone.text = phoneNumber;
				var result = await CustomerAuthorizatoinService().sendPhoneNumber(phoneNumber);
				if (result.statusCode == 200) {
					startTimer();
					Get.to(CodeVerificationScreen());
				} else {
					Get.snackbar("Error", "Telefon raqamini yuborishda xatolik yuz berdi.");
				}
			}

		} else {
			phone_error.value = false;

		}
	}

	@override
	void onInit() {
		super.onInit();
	}
}