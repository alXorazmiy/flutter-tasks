import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/calendar_controller.dart';
import 'package:flutter_project/model/data.dart';
import 'package:get/get.dart';




class Calendar extends StatelessWidget {
	Calendar({super.key});
	final calendarCTRL = Get.find<CalendarController>();


	@override
	Widget build(BuildContext context) {
		return Container(
		height: 350,
		child: Column(
			children: [
				Container(
					height: 32,
					child: Row(
					children: calendarCTRL.weekdays.map((day) {
						return Expanded(
						child: Center(
							child: Text(day, style: TextStyle(fontFamily: "Urbanist",fontWeight: FontWeight.w500),),
						),
						);
					}).toList(),
					),
				),

				Expanded(
					child: Obx(()=> Container(
							height: 320,
							padding: EdgeInsets.symmetric(horizontal: 6),
							child: GridView.builder(
								gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
									crossAxisCount: 7,
									crossAxisSpacing: 0.0,
									mainAxisSpacing: 0.0,
								),
								itemCount: calendarCTRL.data.length,
								itemBuilder: (context, index) {
								final item = calendarCTRL.data[index];
								bool iscurrentMonth = item.date.month == calendarCTRL.today.month;
								bool iscurrentDay = item.date.day == calendarCTRL.today.day;
								return GestureDetector(
									onTap: () {
									
									},
									child: Container(
									width: 62,
									height: 62,
									decoration: BoxDecoration(
										border: Border.all(
											color:  iscurrentDay 
												? Color(0xFFFF981F) 
												: item.status == "bad"
													? Colors.white 
													: Colors.grey.shade200, // Yengilroq rang
											width: 0.8,
										),
										color: item.status == "bad" 
											? Color(0xFFFF699C)  
											: iscurrentDay
												?  Color(0xFFFF981F) 
												: Colors.transparent,
									),
									child: Column(
										children: [
										Padding(
											padding: const EdgeInsets.symmetric(horizontal: 2.0),
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: [
													Container(
														child: Text(
															item.date.day.toString(),
															style: TextStyle(
																fontSize: 26, 
																fontFamily: "Urbanist", 
																fontWeight: FontWeight.w600,
																color: iscurrentMonth 
																	? iscurrentDay || item.status == "bad"
																		? Colors.white 
																		: Colors.black 
																: Colors.grey.shade400
															),
														),
													),
													Container(
														child: Text(
															item.day.toString(),
															style: TextStyle(
																fontFamily: "Urbanist", 
																color: iscurrentMonth 
																	? iscurrentDay || item.status == "bad"
																		? Colors.white 
																		: Colors.grey 
																: Colors.grey.shade400
															),
														),
													)
												],
											),
										),
										Center(
											child: item.status == "good"
												? Image.asset("assets/icons/flower.png", width: 20, height: 20)
												: item.status == "bad"
													? Image.asset("assets/icons/tomchi.png", width: 20, height: 20)
													: item.status == "none"
														? Image.asset("assets/icons/smile.png", width: 20, height: 20)
														:Container(), // Statusga qarab tasvirni ko'rsatish
										),
										],
									),
									),
								);
								},
							),
						
						)
						),
					),
				],
			),
		);
	}
}

