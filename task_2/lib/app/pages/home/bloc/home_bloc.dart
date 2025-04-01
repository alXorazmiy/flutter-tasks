import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_2/app/model/characterModel.dart';
import 'package:task_2/app/model/episodeModel.dart';
import 'package:task_2/app/model/seasonModel.dart';
import 'package:task_2/app/pages/home/bloc/home_event.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';
import 'package:task_2/app/service/network/character_service.dart';
import 'package:task_2/app/service/network/episode_service.dart';






class HomeBloc extends Bloc<HomeEvent, HomeState> {
    final CharacterService characterService;
    final EpisodeService episodeService;
    HomeBloc({required this.characterService, required this.episodeService}) : super(
            HomeState(
                characterList: List.empty(),
                characterEpisodeList: List.empty(),
                episodeList: List.empty(),
                characterNextPageUrl: "https://rickandmortyapi.com/api/character?page=1",
                episodeNextPageUrl: "https://rickandmortyapi.com/api/episode?page=1",
                seasonList: [
                    Seasonmodel(name: "Season 1", image: "Rick_and_Morty_season_1.png", episodes: 11),
                    Seasonmodel(name: "Season 2", image: "Rick_and_Morty_season_2.png", episodes: 10),
                    Seasonmodel(name: "Season 3", image: "Rick_and_Morty_season_3.png", episodes: 10),
                    Seasonmodel(name: "Season 4", image: "Rick_and_Morty_season_4.png", episodes: 10),
                    Seasonmodel(name: "Season 5", image: "Rick_and_Morty_season_5.png", episodes: 10),
                    Seasonmodel(name: "Season 6", image: "Rick_and_Morty_season_6.png", episodes: 10),
                    Seasonmodel(name: "Season 7", image: "Rick_and_Morty_season_7.png", episodes: 10),
                ]
            )
        ){
        on<LoadCharactersEvent>(_loadCharactersEvent);
        on<LoadMoreCharactersEvent>(_loadMoreCharactersEvent);
        on<LoadMoreEpisodesEvent>(_loadMoreEpisodesEvent);
        on<LoadCharacterEpisodesEvent>(_loadCharacterEpisodesEvent);
    }

    Future<bool> checkInternetConnection() async {
        try {
            final response = await http.get(Uri.parse('https://www.google.com'));

            if (response.statusCode == 200) {
            return true;
            } else {
            return false;
            }
        } catch (e) {
            return false;
        }
        }

  
    void _loadCharactersEvent(LoadCharactersEvent event, emit) async {
        bool isOnline = await checkInternetConnection();
        try {
            print(isOnline);

            if (isOnline == true) {
                var response = await characterService.getCharacters(state.characterNextPageUrl);
                final characters = response['results'];
                final characterNextPageUrl = response['next'];
                response = await episodeService.getEpisodes(state.episodeNextPageUrl);
                final episodes = response['results'];
                final episodeNextPageUrl = response['next'];

                var characterBox = await Hive.openBox<List<CharacterModel>>('charactersBox');
                await characterBox.clear();
                await characterBox.put('charactersBox',characters);


                var eposodeBox = await Hive.openBox<List<Episodemodel>>('eposodeBox');
                await eposodeBox.clear();
                await eposodeBox.put('eposodeBox',episodes);

                emit(state.copyWith(
                    characterList: characters, 
                    characterNextPageUrl: characterNextPageUrl, 
                    episodeList: episodes,
                    episodeNextPageUrl: episodeNextPageUrl
                ));
            } 
            else {
                var characterBox = await Hive.openBox('charactersBox');

                List<CharacterModel> characterModels = (characterBox.get('charactersBox', defaultValue: []) as List<dynamic>)
                    .map((character) => character as CharacterModel)
                    .toList();

                var episodeBox = await Hive.openBox('eposodeBox');

                List<Episodemodel> episodeModels = (episodeBox.get('eposodeBox', defaultValue: []) as List<dynamic>)
                    .map((episode) => episode as Episodemodel)
                    .toList();

                emit(state.copyWith(
                    characterList: characterModels, 
                    episodeList: episodeModels,
                ));
            }
            
        } catch (e) { 
            print("Error: $e");
        }
    }

    void _loadMoreCharactersEvent(LoadMoreCharactersEvent event, emit) async {
        try {
            if (state.characterNextPageUrl == null) {
                return;
            }
            final response = await characterService.getCharacters(state.characterNextPageUrl);
            final newCharacters = response['results'];
            var nextPageUrl = response['next'];



            emit(state.copyWith(
                characterList: [...state.characterList, ...newCharacters],
                characterNextPageUrl: nextPageUrl,
            ));
            var characterBox = await Hive.openBox<List<CharacterModel>>('charactersBox');
            await characterBox.clear();
            await characterBox.put('charactersBox',state.characterList);
            
        } catch (e) {
            print("Error: $e");
        }
    }
    void _loadMoreEpisodesEvent(LoadMoreEpisodesEvent event, emit) async {
        try {
            if (state.episodeNextPageUrl == null) {
                return;
            }
            final response = await episodeService.getEpisodes(state.episodeNextPageUrl);
            final newEpisodes = response['results'];
            var episodeNextPageUrl = response['next'];
            
            emit(state.copyWith(
                episodeList: [...state.episodeList, ...newEpisodes],
                episodeNextPageUrl: episodeNextPageUrl,
            ));
            var eposodeBox = await Hive.openBox<List<Episodemodel>>('eposodeBox');
            await eposodeBox.clear();
            await eposodeBox.put('eposodeBox',state.episodeList);

            
        } catch (e) {
            print("Error: $e");
        }
    }
    void _loadCharacterEpisodesEvent(LoadCharacterEpisodesEvent event, emit) async {
        try {
            print(event.episode);
            final response = await episodeService.getCharacterEpisodes(event.episode);

            emit(state.copyWith(characterEpisodeList: response));
        } catch (e) {
            print("Error: $e");
        }
    }
   
}
