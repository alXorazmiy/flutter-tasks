import 'package:hive/hive.dart';
part 'characterModel.g.dart'; 



@HiveType(typeId: 0)
class CharacterModel{
    @HiveField(0)
    final int id;
    @HiveField(1)
    final String name;
    @HiveField(2)
    final String status;
    @HiveField(3)
    final String species;
    @HiveField(4)
    final String gender;
    @HiveField(5)
    final String imageUrl;
    @HiveField(6)
    final List<String> episodes;

    CharacterModel({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.gender,
        required this.imageUrl,
        required this.episodes, 
    });

    factory CharacterModel.fromJson(Map<String, dynamic> json) {
        return CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        gender: json['gender'],
        imageUrl: json['image'],
        episodes: List<String>.from(json['episode']),
        );
    }

    Map<String, dynamic> toJson() {
        return {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "gender": gender,
        "image": imageUrl,
        "episode": episodes,
        };
  }
}