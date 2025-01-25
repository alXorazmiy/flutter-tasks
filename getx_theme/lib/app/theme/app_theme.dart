import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme extends GetxService {

    RxBool isDarkMode = true.obs;
    Rx<Color> success = Color(0xFF1b9c85).obs;
    Rx<Color> danger = Color(0xffff0060).obs;
    Rx<Color> white = Color(0xFFFFFFFF).obs;


    void toggleTheme() {
        isDarkMode.toggle();
        if (isDarkMode.value) {
            white.value = Color(0xFFFFFFFF);
            success.value = Color(0xFF1b9c85);
        } else {
            white.value = Color(0xffff0060);
            success.value = Color(0xFFFFFFFF);
        }
    }

    final lightTheme = ThemeData.light().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
    );

    final darkTheme = ThemeData.dark().copyWith(
        primaryColor: Colors.black45,
        scaffoldBackgroundColor: Colors.black45,

        // Yuridingiz dark tema xususiyatlarini qo'shing
    );
}




