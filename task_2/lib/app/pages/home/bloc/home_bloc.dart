import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/app/model/seasonModel.dart';
import 'package:task_2/app/pages/home/bloc/home_event.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';
import 'package:task_2/app/service/network/character_service.dart';






class HomeBloc extends Bloc<HomeEvent, HomeState> {
    final CharacterService characterService;
    HomeBloc({required this.characterService}) : super(
            HomeState(
                characterList: List.empty(),
                seasonList: [
                    Seasonmodel(name: "Season 1", image: "Rick_and_Morty_season_1.png", episodes: 11),
                    Seasonmodel(name: "Season 2", image: "Rick_and_Morty_season_2.png", episodes: 10),
                    Seasonmodel(name: "Season 3", image: "Rick_and_Morty_season_3.png", episodes: 10),
                    Seasonmodel(name: "Season 4", image: "Rick_and_Morty_season_4.jpg", episodes: 10),
                    Seasonmodel(name: "Season 5", image: "Rick_and_Morty_season_5.jpg", episodes: 10),
                    Seasonmodel(name: "Season 6", image: "Rick_and_Morty_season_6.jpg", episodes: 10),
                    Seasonmodel(name: "Season 7", image: "Rick_and_Morty_season_7.jpg", episodes: 10),
                ]
            )
        ){
        on<LoadCharactersEvent>(_loadCharactersEvent);
    }

    void _loadCharactersEvent(LoadCharactersEvent event, emit) async {
        try {
            final characters = await characterService.getCharacters();
            emit(state.copyWith(characterList: characters));
            
        } catch (e) {
            print("Error: $e");
        }
    }
   
}
