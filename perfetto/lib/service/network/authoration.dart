

import 'package:get/get.dart';

class CustomerAuthorizationService {

	final getx = GetConnect();
	Future<Response> sendPhoneNumber(String phoneNumber) async {

		var url = "http://45.138.158.239:7868/api/Customer/send-verification-code";
		var body = {"phoneNumber" : phoneNumber};
		final response = await getx.post(url, body);
		return response;
	}



	Future<Response> sendPhoneNumberAndCode(String phoneNumber, String code) async {
		var url = "http://45.138.158.239:7868/api/Customer/verify-code";
		var body = {
			"phoneNumber" : phoneNumber,
			"verifyCode" : code
		};
		final response = await getx.post(url, body);
		return response;
	}


}