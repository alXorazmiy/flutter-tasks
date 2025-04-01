import 'package:hive/hive.dart';

part 'episodeModel.g.dart';



@HiveType(typeId: 1)
class Episodemodel{
    @HiveField(0)
    final int id;
    @HiveField(1)
    final String name;
    @HiveField(2)
    final String episode;
  

    Episodemodel({
        required this.id,
        required this.name,
        required this.episode,
      
    });

    factory Episodemodel.fromJson(Map<String, dynamic> json) {
        return Episodemodel(
        id: json['id'],
        name: json['name'],
        episode: json['episode'],
      
        );
    }

    Map<String, dynamic> toJson() {
        return {
        "id": id,
        "name": name,
        "episode": episode,
        };
  }
}