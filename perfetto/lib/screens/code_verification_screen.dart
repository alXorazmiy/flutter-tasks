

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:perfetto/controller/appController.dart';
import 'package:perfetto/controller/authController.dart';

class CodeVerificationScreen extends StatelessWidget {

	final authCTRL = Get.find<AuthController>();
	CodeVerificationScreen({super.key});
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
												child: Text("Tasdiqlash", style :TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w700, fontSize: 24)),
											),
										),
										Container(
											alignment: Alignment.centerLeft,
											child: Padding(
												padding: const EdgeInsets.all(16.0),
												child: Text(authCTRL.phone.text.toString() +" ga yuborilgan SMS kodni kiriting", style :TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16)),
											),
										),
										Row(
											children: [
												Container(
													height: 51,
													width: 43,
													margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
													child: TextField(
														keyboardType: TextInputType.number,
														maxLength: 1,
														textAlign: TextAlign.center,
														controller: authCTRL.code_controllers[0],
														focusNode: authCTRL.focusNodes[0],
														decoration: InputDecoration(
															counterText: "",
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: Color(0xFF9CBEF6)),
																borderRadius: BorderRadius.circular(10)
															),
															enabledBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.code_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFFE0E0E0)
																			),
																			borderRadius: BorderRadius.circular(10)
																		)
														),
														style: const  TextStyle(
															fontFamily: "SFProDisplay",
															fontWeight: FontWeight.w400,
															color: Colors.black
														),
														onChanged: (value) {
															if(value.length == 1) {
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[1]);
															}
														},
													
													),
												),
												Container(
													height: 51,
													width: 43,
													margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
													child: TextField(
														keyboardType: TextInputType.number,
														maxLength: 1,
														textAlign: TextAlign.center,
														controller: authCTRL.code_controllers[1],
														focusNode: authCTRL.focusNodes[1],
														decoration: InputDecoration(
															counterText: "",
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: Color(0xFF9CBEF6)),
																borderRadius: BorderRadius.circular(10)
															),
															enabledBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.code_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFFE0E0E0)
																			),
																			borderRadius: BorderRadius.circular(10)
																		)
														),
														style: const  TextStyle(
															fontFamily: "SFProDisplay",
															fontWeight: FontWeight.w400,
															color: Colors.black
														),
														onChanged: (value) {
															if(value.length == 1) {
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[2]);
															}
															else{
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[0]);
																
															}
														},
													),
												),
												Container(
													height: 51,
													width: 43,
													margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
													child: TextField(
														keyboardType: TextInputType.number,
														maxLength: 1,
														textAlign: TextAlign.center,
														controller: authCTRL.code_controllers[2],
														focusNode: authCTRL.focusNodes[2],
														decoration: InputDecoration(
															counterText: "",
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: Color(0xFF9CBEF6)),
																borderRadius: BorderRadius.circular(10)
															),
															enabledBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.code_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFFE0E0E0)
																			),
																			borderRadius: BorderRadius.circular(10)
																		)
														),
														style: const  TextStyle(
															fontFamily: "SFProDisplay",
															fontWeight: FontWeight.w400,
															color: Colors.black
														),
														onChanged: (value) {
															if(value.length == 1) {
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[3]);
															}
															else{
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[1]);
																
															}
														},
													),
												),
												
												Container(
													height: 51,
													width: 43,
													margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
													child: TextField(
														keyboardType: TextInputType.number,
														maxLength: 1,
														textAlign: TextAlign.center,
														controller: authCTRL.code_controllers[3],
														focusNode: authCTRL.focusNodes[3],
														decoration: InputDecoration(
															counterText: "",
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: Color(0xFF9CBEF6)),
																borderRadius: BorderRadius.circular(10)
															),
															enabledBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.code_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFFE0E0E0)
																			),
																			borderRadius: BorderRadius.circular(10)
																		)
														),
														style: const  TextStyle(
															fontFamily: "SFProDisplay",
															fontWeight: FontWeight.w400,
															color: Colors.black
														),
														onChanged: (value) {
															if(value.length == 1) {
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[4]);
															}
															else{
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[2]);
																
															}
														},
													),
												),
												
												Container(
													height: 51,
													width: 43,
													margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
													child: TextField(
														keyboardType: TextInputType.number,
														maxLength: 1,
														textAlign: TextAlign.center,
														controller: authCTRL.code_controllers[4],
														focusNode: authCTRL.focusNodes[4],
														decoration: InputDecoration(
															counterText: "",
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: Color(0xFF9CBEF6)),
																borderRadius: BorderRadius.circular(10)
															),
															enabledBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.code_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFFE0E0E0)
																			),
																			borderRadius: BorderRadius.circular(10)
																		)
														),
														style: const  TextStyle(
															fontFamily: "SFProDisplay",
															fontWeight: FontWeight.w400,
															color: Colors.black
														),
														onChanged: (value) {
															if (value.length == 0){
																FocusScope.of(context).requestFocus(authCTRL.focusNodes[3]);
															}
														},
													),
												),
												Container(
													height: 51,
													width: 43,
													alignment: Alignment.center,
													margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
													child: Text(authCTRL.timeString, style: TextStyle(
														fontFamily: "SFProDisplay", 
														fontSize: 16, 
														color: authCTRL.timeString == "0:00" 
															? Color(0xFFFF1E39)
															: Colors.black, 
														fontWeight: FontWeight.w400) 
													),
												),

											],
										),
										authCTRL.timeString != "0:00" 
											?	authCTRL.code_error == false 
												?   Container(
													alignment: Alignment.centerLeft,
													margin: EdgeInsets.only(left: 10),
													child: Text("Tasdiqlash kodi xato kiritildi!",style: TextStyle(fontFamily: "SFProDisplay", fontSize: 16, color: Color(0xFFFF1E39), fontWeight: FontWeight.w400) ),
											) : const SizedBox()
											: const SizedBox(),

										Container(
											alignment:Alignment.centerLeft, 
											margin: EdgeInsets.only(top: 24, left: 10),

											child:  Row(
												children: [
													Text("Hisobingiz mavjudmi?",style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w400, fontSize: 14)),
													const SizedBox(width: 10),
													GestureDetector(onTap:() {}, child: Text("Kirish",style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF0068E1)))),
												],
											)
										),
 									],
								),
								
								GestureDetector(
									onTap: (){
										authCTRL.check_code();
									},
									child: Container(
										height: 59,
										margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color:  Color(0xFFFFFB800),
											borderRadius: BorderRadius.circular(10)
										),
										child: Text(
											authCTRL.timeString == "0:00" ? "Qayta yuborish" : "Tasdiqlash", 
											style: TextStyle(fontFamily:"SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16)),
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