

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:perfetto/controller/appController.dart';
import 'package:perfetto/controller/authController.dart';

class RegistrationScreen extends StatelessWidget {

	final authCTRL = Get.find<AuthController>();
	final _phoneFormat = MaskTextInputFormatter(mask: "+998 (##) ### ## ##", filter: {"#": RegExp(r'[0-9]')});
	RegistrationScreen({super.key});
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
												child: Text("Ro'yxatdan o'tish", style :TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w700, fontSize: 24)),
											),
										),
										Column(
											children: [
												Container(
													alignment:Alignment.centerLeft, 
													margin: EdgeInsets.only(top: 12, left: 10),

													child:  Text("Ism familiya",style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w600, fontSize: 16))
												),
												Container(
														height: 56,
														margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
														child: TextField(
															controller: authCTRL.full_name,
															decoration: InputDecoration(
																focusedBorder: OutlineInputBorder(
																	borderSide: BorderSide(color: Color(0xFF9CBEF6)),
																	borderRadius: BorderRadius.circular(10)
																),
																enabledBorder: OutlineInputBorder(
																	borderSide: BorderSide(color: Color(0xFFE0E0E0)),
																	borderRadius: BorderRadius.circular(10)
																)
															),
															style: TextStyle(
																fontFamily: "SFProDisplay",
																fontWeight: FontWeight.w400,
																color: Colors.black
															),
														),
													),
												Container(
													alignment:Alignment.centerLeft, 
													margin: EdgeInsets.only(top: 12, left: 10),

													child:  Text("Telefon raqam",style: TextStyle(fontFamily: "SFProDisplay", fontWeight: FontWeight.w600, fontSize: 16))
												),
												
												Column(
													children: [
														Container(
																height: 56,
																margin: EdgeInsets.only(top: 12, left: 10, right: 10),
																child: TextField(
																	controller: authCTRL.phone,
																	keyboardType: TextInputType.phone,
																	inputFormatters: [_phoneFormat],
																	decoration: InputDecoration(
																		hintText: "+998 (_ _) ___ __ __",
																		prefixIcon: Padding(
																			padding: const EdgeInsets.all(8.0),
																			child: Image.asset("assets/icons/uz.png", height: 20, width: 20,),
																		),
																		focusedBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.phone_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFF9CBEF6)
																			),
																			borderRadius:  BorderRadius.circular(10)
																		),
																		enabledBorder: OutlineInputBorder(
																			borderSide: BorderSide(
																				color: authCTRL.phone_error == false
																				? Color(0xFFFF1E39)
																				: Color(0xFFE0E0E0)
																			),
																			borderRadius: BorderRadius.circular(10)
																		)
																	),
																	style: const TextStyle(
																		fontFamily: "SFProDisplay",
																		fontWeight: FontWeight.w400,
																		color: Colors.black
																	),
																),
															),
														authCTRL.phone_error == false ?  Container(
															alignment: Alignment.centerLeft,
															margin: EdgeInsets.only(left: 10),
															child: Text("Telefon raqamini to'liq kiriting!", style: TextStyle(fontFamily: "SFProDisplay", fontSize: 12, color: Color(0xFFFF1E39), fontWeight: FontWeight.w400)),
														) : const SizedBox()
													],
													),
													
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
										)
									],
								),
								
								GestureDetector(
									onTap: (){
										authCTRL.check_number();
									},
									child: Container(
										height: 59,
										margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color:  Color(0xFFFFFB800),
											borderRadius: BorderRadius.circular(10)
										),
										child: Text("Ro'yxatdan o'tish", style: TextStyle(fontFamily:"SFProDisplay", fontWeight: FontWeight.w500, fontSize: 16)),
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