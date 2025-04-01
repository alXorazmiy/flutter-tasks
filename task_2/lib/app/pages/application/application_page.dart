
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/app/pages/application/bloc/application_bloc.dart';
import 'package:task_2/app/pages/application/bloc/application_state.dart';
import 'package:task_2/app/pages/application/widgets/bottomnavigationbar.dart';
import 'package:task_2/app/pages/application/widgets/widgets.dart';




class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {



    @override
    Widget build(BuildContext context) {
        return BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
                return 
                    Scaffold(
                        backgroundColor: Color(0xff1d2130),
                        body: Center(
                            child: buildPage(state.index),
                        ),
                        bottomNavigationBar: CustomBottomNavigationBar(),
                    );
            },
        );
    }
}
