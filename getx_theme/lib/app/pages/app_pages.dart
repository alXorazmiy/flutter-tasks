






import '/app/bindings/app_bindings.dart';
import '/app/routers/app_routers.dart';
import '/app/views/home/homePage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPage {
	static var list = [
		GetPage(
			name: AppRoute.home,
			page: () =>  HomePage(),
			binding: AppBindings()
		),
		
	];
}