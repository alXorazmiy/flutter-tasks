

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:perfetto/controller/appController.dart';
import 'package:perfetto/screens/registration_screen.dart';

class LanguageScreen extends StatelessWidget {

	final appCTRL = Get.find<AppController>();
	LanguageScreen({super.key});
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Color(0xFFFFFB800),
			resizeToAvoidBottomInset: false,

			body: Column(
				
				children: [
					Expanded(
						child: Container(
							alignment: Alignment.center,
							child: Image.asset("assets/icons/perfetto.png", color: Color(0xFF151515), width: 175, height: 98,),
						),
					),
					Container(
						height: 610,
						width: MediaQuery.of(context).size.width,
						decoration: const BoxDecoration(
							color: Colors.white,
							borderRadius: BorderRadius.only(
								topLeft: Radius.circular(30),
								topRight: Radius.circular(30),
							),
						),
					
						child :Obx((){
							return Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								Column(
									mainAxisAlignment: MainAxisAlignment.start,
									crossAxisAlignment: CrossAxisAlignment.center,
									children: [
										Container(
											alignment: Alignment.centerLeft,
											child: Padding(
												padding: const EdgeInsets.all(16.0),
												child: Text("Tilni tanlang", style :TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w700, fontSize: 24)),
											),
										),
										Column(
											children: [
												GestureDetector(
													onTap: (){
														appCTRL.select_language("en");
													},
													child: Container(
														// width: 361,
														height: 56,
														margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
														decoration: BoxDecoration(
															color: Color(0xFFF3F3F3),
															borderRadius: BorderRadius.circular(10),
															border: Border.all(
																width: 1,
																color: appCTRL.language == "en"
																	? Color(0xFF0068E1)
																	: Colors.transparent
															)
														),
														child: Padding(
															padding: const EdgeInsets.all(10.0),
															child: Row(
																children: [
																	Image.asset("assets/icons/en.png", width: 32, height: 32),
																	const SizedBox(width: 5),
																	Text("English", style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16))
																],
															),
														),
													),
												),
												GestureDetector(
													onTap: (){
														appCTRL.select_language("ru");
													},
													child: Container(
														// width: 361,
														height: 56,
														margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
														decoration: BoxDecoration(
															color: Color(0xFFF3F3F3),
															borderRadius: BorderRadius.circular(10),
															border: Border.all(
																width: 1,
																color: appCTRL.language == "ru"
																	? Color(0xFF0068E1)
																	: Colors.transparent
															)
														),
														child: Padding(
															padding: const EdgeInsets.all(10.0),
															child: Row(
																children: [
																	Image.asset("assets/icons/ru.png", width: 32, height: 32),
																	const SizedBox(width: 5),
																	Text("Русский", style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16))
																],
															),
														),
													),
												),
												GestureDetector(
													onTap: (){
														appCTRL.select_language("uz");
													},
													child: Container(
														// width: 361,
														height: 56,
														margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
														decoration: BoxDecoration(
															color: Color(0xFFF3F3F3),
															borderRadius: BorderRadius.circular(10),
															border: Border.all(
																width: 1,
																color: appCTRL.language == "uz"
																	? Color(0xFF0068E1)
																	: Colors.transparent
															)
														),
														child: Padding(
															padding: const EdgeInsets.all(10.0),
															child: Row(
																children: [
																	Image.asset("assets/icons/uz.png", width: 32, height: 32),
																	const SizedBox(width: 5),
																	Text("O'zbek", style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16))
																],
															),
														),
													),
												)
											],
										)
									],
								),
								
								GestureDetector(
									onTap: (){
										if (appCTRL.language != "") {
											Get.to(RegistrationScreen());
										}
									},
									child: Container(
										height: 59,
										margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color:  Color(0xFFFFFB800),
											borderRadius: BorderRadius.circular(10)
										),
										child: Text("Davom etish", style: TextStyle(fontFamily:"SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16)),
									),
								)

							],
						);
						})
					),
					
				],
			),
		);
	}
}