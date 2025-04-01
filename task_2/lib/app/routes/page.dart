






import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/app/pages/application/application_page.dart';
import 'package:task_2/app/pages/application/bloc/application_bloc.dart';
import 'package:task_2/app/pages/detail/bloc/detail_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_event.dart';
import 'package:task_2/app/pages/home/home_page.dart';

import 'package:task_2/app/service/network/character_service.dart';


class AppPages {
    static List<PageEntity> routes(){
        return [
            
            PageEntity(
                page:  ApplicationPage(),
                bloc: BlocProvider(create: (_)=> ApplicationBloc())
            ),
            PageEntity(
                page:  HomePage(),
                bloc: BlocProvider(create: (_)=> HomeBloc(characterService: CharacterService())..add(LoadCharactersEvent()))
            ),
            
        ];
    }


    static List<dynamic> allBlocProviders(BuildContext context) {
        List<dynamic> blocProviders = <dynamic> [];
        for (var bloc in routes()) {
            if (bloc.bloc !=null) {
                blocProviders.add(bloc.bloc); 
            }
        }
        blocProviders.add(
            BlocProvider(create: (_)=> DetailBloc())
        ); 
        return blocProviders;

    }

    static MaterialPageRoute GenerateRouteSettings (RouteSettings   settings) {
        return MaterialPageRoute(builder: (_) => ApplicationPage(), settings: settings);
    }
}



class PageEntity {
    Widget? page;
    dynamic bloc;

    PageEntity({required  this.page, this.bloc});
}