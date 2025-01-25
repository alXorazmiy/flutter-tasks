

import '/app/controllers/app_controller.dart';
import '/app/controllers/home_controller.dart';
import '/app/theme/app_theme.dart';

import 'package:get/get.dart';

class AppBindings extends Bindings{
    @override
    void dependencies() {
        Get.put(AppController());
        Get.put(HomeController());
        Get.put(AppTheme());
    }
}