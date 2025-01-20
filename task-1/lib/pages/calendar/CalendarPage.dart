

import 'package:flutter/material.dart';
import 'package:flutter_project/pages/calendar/widgets/body.dart';
import 'package:flutter_project/pages/calendar/widgets/calendar.dart';
import 'package:flutter_project/pages/calendar/widgets/navbar.dart';

class CalendarPage extends StatelessWidget {
	const CalendarPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: [
					NavbarWidget(),
					Calendar(),
					Body(),
				],
			),
		);
	}
}