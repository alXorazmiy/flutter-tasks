

import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/calendar_controller.dart';
import 'package:get/get.dart';

class NavbarWidget extends StatelessWidget {

	final calendarCTRL = Get.find<CalendarController>();
	NavbarWidget({super.key});

	@override
	Widget build(BuildContext context) {
		return  Container(
			margin:const  EdgeInsets.only(top: 44),
			width: MediaQuery.of(context).size.width,
			height: 72,
			padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
			child: Obx(() {
				return Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
						Image.asset("assets/icons/logo.png", width: 28,),
						Text(calendarCTRL.month_name.toString(), style: TextStyle(fontFamily: "Urbanist", fontWeight: FontWeight.w700, fontSize: 34 ),),
						Image.asset("assets/icons/Calendar2.png", width: 28,),

					],
				);
			}),
		);
	
	}
}