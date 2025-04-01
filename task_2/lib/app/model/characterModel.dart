
import 'package:task_2/app/model/character.dart';

class CharacterModel extends Character {
    CharacterModel({
        required int id,
        required String name,
        required String status,
        required String species,
        required String gender,
        required String imageUrl,
    }) : super(
            id: id,
            name: name,
            status: status,
            species: species,
            gender: gender,
            imageUrl: imageUrl,
            );

    factory CharacterModel.fromJson(Map<String, dynamic> json) {
        return CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        gender: json['gender'],
        imageUrl: json['image'],
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
        };
  }
}