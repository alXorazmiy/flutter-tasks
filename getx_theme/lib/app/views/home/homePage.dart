import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_theme/app/service/app_theme_service.dart';
import '/app/theme/app_theme.dart';

class HomePage extends StatelessWidget {

    final theme = Get.find<AppTheme>();
    HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Obx(() => GestureDetector(

                    onTap: () {
                        theme.toggleTheme();
                        ThemeService().changeThemeMode();
                    },
                    child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                            color: theme.success.value,
                            borderRadius:BorderRadius.circular(8),
                        ),
                        child: Icon(theme.isDarkMode.value ? Icons.light_mode : Icons.dark_mode, color: theme.white.value),
                    ),
                )),
            ),
        );
    }
}