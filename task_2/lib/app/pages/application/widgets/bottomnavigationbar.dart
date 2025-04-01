





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/pages/application/bloc/application_bloc.dart';
import 'package:task_2/app/pages/application/bloc/application_event.dart';
import 'package:task_2/app/pages/application/bloc/application_state.dart';

class CustomBottomNavigationBar extends StatelessWidget {
    const CustomBottomNavigationBar({
        super.key,
    });



    @override
    Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        height: 58.h,
        child: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory, 
            ),
            child: BlocBuilder<ApplicationBloc, ApplicationState>(
                builder: (context, state) {
                return BottomNavigationBar(
                    showSelectedLabels: false,
                    currentIndex: state.index,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    
                    onTap: (value) {
                        context.read<ApplicationBloc>().add(TriggerApplicationEvent(value));
                    },
                    items: [
                        BottomNavigationBarItem(
                            label: "",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/home.png", color: Color(0xff3a495d)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/home.png", color: Colors.grey),
                            )
                        ),
                        BottomNavigationBarItem(
                            label: "",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/search.png", color: Color(0xff3a495d)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/search.png", color: Colors.grey),
                            )
                        ),
                        BottomNavigationBarItem(
                            label: "",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/location.png", color: Color(0xff3a495d)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/location.png", color: Colors.grey),
                            )
                        ),
                        BottomNavigationBarItem(
                            label: "",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/person.png", color: Color(0xff3a495d)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/person.png", color: Colors.grey),
                            )
                        ),
                    ],
                );
                }
            ),
            ),
        );
    }
}
