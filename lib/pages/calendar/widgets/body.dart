

import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/calendar_controller.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
	Body({super.key});

	final calendarCTRL = Get.find<CalendarController>();
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.all(16),
			child: Obx((){
				return Column(
				children: [
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Container(
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Row(children: [
											Text(calendarCTRL.month_name.substring(0, 3).toString(), style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, fontFamily: "Urbanist"),),
											const SizedBox(width: 5,),
											Text(calendarCTRL.today.day.toString(), style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, fontFamily: "Urbanist"),),
										]),
										Row(
											children: [
												Text("Cycle day ",style: TextStyle(fontFamily: "Urbanist",)),
												Text(calendarCTRL.new_count.value.toString()),
												Text("- Fallicular Phase", style: TextStyle(fontFamily: "Urbanist",))
											],
										)
									],
								),
							),
							ElevatedButton(
								onPressed: () {
									calendarCTRL.updateData();
								}, 
								style: ElevatedButton.styleFrom(
									elevation: 0,
									backgroundColor: Colors.transparent,
									side: BorderSide(color: Colors.grey.shade200, width: 1),
								),
								child: Row(
									children: [
										Image.asset("assets/icons/tomchi.png", width: 16, height: 16),
										SizedBox(width: 8,),
										Text("Edit", style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: "Urbanist", fontWeight: FontWeight.w600),),
									],
								)
							)
						],
					),
					Divider(color: Colors.grey.shade200,),
					Row(
						children: [
							Container(
								height: 26,
								width: 72,
								alignment: Alignment.center,
								decoration: BoxDecoration(
									color: calendarCTRL.status.value == "Bad" 
										? Color(0xFFFF699C)
										: Color(0xFFFF981F),
									borderRadius: BorderRadius.circular(4),
								),
								child: Text(
									calendarCTRL.status.value.toString(), 
									style: TextStyle(color: Colors.white, fontFamily: "Urbanist", fontWeight: FontWeight.w600, fontSize: 20),),
							),
							Text("  - Chance of getting pregnant", style: TextStyle(fontSize: 20, fontFamily: "Urbanist",),),
						],
					),
				],
			);
			}),
		);
	}
}