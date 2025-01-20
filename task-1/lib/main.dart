import 'package:flutter/material.dart';
import 'package:flutter_project/bindings/app_bindings.dart';
import 'package:flutter_project/pages/articles/ArticlesPage.dart';
import 'package:flutter_project/pages/home/HomePage.dart';
import 'package:flutter_project/pages/calendar/CalendarPage.dart';
import 'package:flutter_project/pages/profile/ProfilePage.dart';
import 'package:flutter_project/pages/tracker/TrackerPage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return GetMaterialApp(
			debugShowCheckedModeBanner: false,
			initialRoute: Routes.main,
			getPages: AppPages.pages,
			initialBinding: AppBinding(),
		);
	}
}


class MainPage extends StatefulWidget {
	const MainPage({super.key});

	@override
	State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
	int _index = 1;
	Color _activeColor = Color(0xFFFF699C);

	final List<Widget> _pages = [
		HomePage(),
		CalendarPage(),
		TrackerPage(),
		ArticlesPage(),
		ProfilePage(),
	];
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: _pages[_index],
			bottomNavigationBar: BottomNavigationBar(
				currentIndex: _index,
				onTap: (index) {
					setState(() {
					  _index = index;
					});
				},
				selectedItemColor: _activeColor,
				unselectedItemColor: Colors.black,
				showSelectedLabels: true,
				showUnselectedLabels: true,
				type: BottomNavigationBarType.fixed,
				elevation: 0,
				items: [
					BottomNavigationBarItem(
						icon: _index == 0 
							? Image.asset("./assets/icons/home2.png", color: _index == 0 ? _activeColor : Colors.black, width: 24,) 
							: Image.asset("./assets/icons/Home.png", color: _index == 0 ? _activeColor : Colors.black, width: 24,) ,
						label: "Home",
					),
					BottomNavigationBarItem(
						icon: _index == 1 
							? Image.asset("./assets/icons/calendar.png", color: _index == 1 ? _activeColor : Colors.black, width: 24,) 
							: Image.asset("./assets/icons/Calendar2.png", color: _index == 1 ? _activeColor : Colors.black, width: 24,) ,
						label: "Calendar",
					),
					BottomNavigationBarItem(
						icon: Image.asset("./assets/icons/Vector.png", color: _index == 2 ? _activeColor : Colors.black, width: 24,),
						label: "Tracker"
					),
					BottomNavigationBarItem(
						icon: Image.asset("./assets/icons/articles.png", color: _index == 3 ? _activeColor : Colors.black, width: 24,),
						label: "Articles"
					),
					BottomNavigationBarItem(
						icon: Image.asset("./assets/icons/Profile.png", color: _index == 4 ? _activeColor : Colors.black, width: 24,),
						label: "Profile"
					),
				],
			),
		);
	}
}

class Routes {
	static const main = "/";
}

class AppPages {
	static final pages = [
		GetPage(
			name: Routes.main, 
			page: ()=> MainPage(),
			binding: AppBinding(),
		)
	];
}