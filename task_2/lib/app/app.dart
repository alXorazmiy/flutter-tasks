




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/routes/page.dart';

class App extends StatefulWidget {
    const App({super.key});
    @override
    State<App> createState() => _AppState();
}

class _AppState extends State<App> {
    @override
    Widget build(BuildContext context) {
        return MultiBlocProvider(
                providers: [...AppPages.allBlocProviders(context)],
                child: ScreenUtilInit(
                    builder: (context, state) {
                        return MaterialApp(
                            debugShowCheckedModeBanner: false,
                            onGenerateRoute: AppPages.GenerateRouteSettings,
                        );
                
                    }
                ));
  
    }
}
