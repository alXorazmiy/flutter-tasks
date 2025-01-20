import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
	@override
	State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
	DateTime _selectedDate = DateTime.now();
	late DateTime _focusedDay = DateTime.now();
	List<String> _weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

	@override
	void initState() {
		super.initState();
		_focusedDay = _selectedDate;
	}


	List<DateTime> _getDaysMonth(DateTime date) {
		var year = _selectedDate.year;
		var month = _selectedDate.month;
		final firstDayOfMonth = DateTime(year, month, 1);
		final lastDayOfMonth = DateTime(year, month + 1, 0);
		List<DateTime> dayMonth = [];


		int firstWeekday = firstDayOfMonth.weekday; 
		if (firstWeekday == 7) {
			firstWeekday = 0; 
		}



		var last_year;
		var last_month;
		if (month == 1) {
			last_year = year - 1;
			last_month = 13;
		}
	
		DateTime lastDayPrevMonth = DateTime(last_year, last_month, 0);
		var days = 0;
		for (int i = lastDayPrevMonth.day - firstWeekday; i < lastDayPrevMonth.day; i++) {
			dayMonth.add(DateTime(last_year, last_month,i + 1 ));
			days++;
		}

		for (int i = 1; i <= lastDayOfMonth.day; i++) {
			dayMonth.add(DateTime(date.year, date.month, i));
			days++;
		}
		var j = 1;
		for (int i = days; i < 35; i++) {
			dayMonth.add(DateTime(date.year, date.month + 1, j));
			j++;
		}

		return dayMonth;
	}

  @override
  Widget build(BuildContext context) {
    final dayMonth = _getDaysMonth(_focusedDay);
    return Container(
		height: 400,
		child: Column(
			children: [
				// Hafta kunlari
				Container(
					height: 32, // Haftaning yuqori qismidagi balandlik
					child: Row(
					children: _weekdays.map((day) {
						return Expanded(
						child: Center(
							child: Text(day),
						),
						);
					}).toList(),
					),
				),

				Expanded(
					child: Container(
						height: 320,
						child: GridView.builder(
							gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
								crossAxisCount: 7, 
								crossAxisSpacing: 0.0, 
								mainAxisSpacing: 0.0, 
							),
							itemCount: dayMonth.length,
							itemBuilder: (context, index) {
								final day = dayMonth[index];
								bool isCurrentMonth = day.month == _focusedDay.month;
								return GestureDetector(
									onTap: () {},
									child: Container(
										width: 62,
										height: 62,
										decoration: BoxDecoration(
											border: Border.all(
											color: Colors.grey.shade300, // Yengilroq rang
											width: 0.8, // Qalinlikni kamaytirdik
											),
											// color: isCurrentMonth ? Colors.blue : Colors.grey.shade300, // Agar hozirgi oydan bo'lsa, rangni o'zgartirish
										),
										child: Column(
											children: [
												Padding(
													padding: const EdgeInsets.symmetric(horizontal: 2.0),
													child: Row(
														children: [
															Container(
																child: Text(day.day.toString(), style: TextStyle(fontSize: 28, fontFamily: "Urbanist", fontWeight: FontWeight.w600),),
															),
														],
													),
												),
												Center(
													child: Image.asset("assets/icons/tomchi.png", width: 20,height: 20),
												)
											],
										),
									),
								);
							},
						),
					),
				),
			],
		),
		);
	}
}