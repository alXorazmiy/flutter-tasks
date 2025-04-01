






import 'package:task_2/app/model/characterModel.dart';
import 'package:task_2/app/model/seasonModel.dart';

class HomeState {
    final List<CharacterModel> characterList;
    final List<Seasonmodel> seasonList;


    HomeState({required this.characterList, required this.seasonList});

    HomeState copyWith({
        List<CharacterModel>? characterList,
        List<Seasonmodel>? seasonList,
    }) {
        return HomeState(
            characterList: characterList ?? this.characterList,
            seasonList: seasonList ?? this.seasonList,
        );
    }
}


