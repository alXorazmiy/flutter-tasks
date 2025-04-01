






import 'package:task_2/app/model/characterModel.dart';
import 'package:task_2/app/model/episodeModel.dart';
import 'package:task_2/app/model/seasonModel.dart';

class HomeState {
    final List<CharacterModel> characterList;
    final List<Episodemodel> characterEpisodeList;
    final List<Episodemodel> episodeList;
    final List<Seasonmodel> seasonList;
    final String? characterNextPageUrl;
    final String? episodeNextPageUrl;

    HomeState({required this.characterList, required this.characterEpisodeList, required this.seasonList, required this.episodeList, required this.characterNextPageUrl, required this.episodeNextPageUrl});

    HomeState copyWith({
        List<CharacterModel>? characterList,
        List<Episodemodel>? characterEpisodeList,
        List<Episodemodel>? episodeList,
        List<Seasonmodel>? seasonList,
        String? characterNextPageUrl,
        String? episodeNextPageUrl,
    }) {
        return HomeState(
            characterList: characterList ?? this.characterList,
            characterEpisodeList: characterEpisodeList ?? this.characterEpisodeList,
            episodeList: episodeList ?? this.episodeList,
            seasonList: seasonList ?? this.seasonList,
            characterNextPageUrl: characterNextPageUrl ?? this.characterNextPageUrl,
            episodeNextPageUrl: episodeNextPageUrl ?? this.episodeNextPageUrl,
        );
    }
}


