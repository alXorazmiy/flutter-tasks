



import 'package:flutter/material.dart';
import 'package:task_2/app/pages/home/home_page.dart';

Widget buildPage(int index) {
    List<Widget> _widget = [
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
    ];
    return _widget[index];
}





