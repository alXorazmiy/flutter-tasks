import 'package:get_storage/get_storage.dart';
import 'package:getx_theme/app/service/app_theme_service.dart';

import '../app/pages/app_pages.dart';
import '../app/routers/app_routers.dart';
import '../app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main()  async {
	await GetStorage.init();
    Get.put(AppTheme());
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return GetMaterialApp(
			debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            themeMode: ThemeService().getThemeMode(),
			getPages: AppPage.list,
			initialRoute: AppRoute.home,    
		);
    }
}