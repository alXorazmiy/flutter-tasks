

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_2/app/model/characterModel.dart';

class CharacterService {
    final String baseUrl = "https://rickandmortyapi.com/api/character";

    Future<List<CharacterModel>> getCharacters() async {
        final response = await http.get(Uri.parse(baseUrl));

        if (response.statusCode == 200) {
            final Map<String, dynamic> data = jsonDecode(response.body);
            final List<dynamic> results = data['results'];

            return results.map((json) => CharacterModel.fromJson(json)).toList();
        } else {
            throw Exception("Failed to load characters");
        }
    }
}