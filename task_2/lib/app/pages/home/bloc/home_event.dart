




abstract class HomeEvent {}

class LoadCharactersEvent extends HomeEvent {}
class LoadMoreCharactersEvent extends HomeEvent {}
class LoadMoreEpisodesEvent extends HomeEvent {}
class LoadCharacterEpisodesEvent extends HomeEvent {
    final List<String> episode;
    LoadCharacterEpisodesEvent({required this.episode});
}

