


import 'dart:ffi';

import 'package:flutter_project/model/data.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CalendarController extends GetxController {
	RxString month_name = "August".obs;
	int month_id = 8;
	RxInt new_count = 0.obs;
	DateTime today = DateTime.now();
	List<String> weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	Map<int, String> month_map = {
		1: "January",
		2: "February",
		3: "March",
		4: "April",
		5: "May",
		6: "June",
		7: "July",
		8: "August",
		9: "September",
		10: "October",
		11: "November",
		12: "December"
	};
	final data = [].obs;
	final status = "Medium".obs;
	var last_month_day = 0;
	var first_bad_day = 5;

	@override
	void onInit() {
		super.onInit();
		_getDateTimeStatuses();
	
		
	}
	void _getDateTimeStatuses() {
		final dayMonth = _getDaysMonth(today);
		last_month_day = last_month_day + first_bad_day;
		data.value = dayMonth.map((day) {
			if ([first_bad_day,6,7,8].contains(day.day)){
				return Data(date: day, status: "bad");
			} else if ([1,3,15, 16, 25,26,27,28,29].contains(day.day)) {
				return Data(date: day, status: "good");
			} else if ([2, 21, 30].contains(day.day)) {
				return Data(date: day, status: "none");
			} else {
				return Data(date: day, status: null); 
			}
		}).toList();
		var count1 = 28 - last_month_day + 2;
		var count2 = 1;
		for (int i = 0; i < 35; i++) {
			if(i < last_month_day - 1) {
				data[i].day = count1;
				count1++;
			}else {
				data[i].day = count2;
				count2++;
			}
		}
		new_count.value = today.day - first_bad_day;

	}
	List<DateTime> _getDaysMonth(DateTime date) {
		var year = today.year;
		var month = today.month;
		month_name.value = month_map[month]!;
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
			dayMonth.add(DateTime(last_year, last_month - 1, i + 1));
			last_month_day++;
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



	void updateData() {
		bool nextday = false;
		var count = 1;
		data.value = data.map((item) {
			if (item.date.day == today.day){
				nextday = true;
				return Data(date: item.date, status: "bad", day: count);
			} else{
				if (nextday == true) {
					count++;
					return Data(date: item.date, status: item.status, day: count);
				} else{
					return Data(date: item.date, status: item.status, day: item.day);
				}
			} 		
		}).toList();

		data.refresh();
		status.value = "Bad";
		new_count.value = 0;
	}
}