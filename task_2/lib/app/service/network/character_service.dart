
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_2/app/model/characterModel.dart';


class CharacterService {
    Future<Map<String, dynamic>> getCharacters(String? url) async {
        final response = await http.get(Uri.parse(url!));

        if (response.statusCode == 200) {
            final Map<String, dynamic> data = jsonDecode(response.body);
            final List<dynamic> results = data['results'];
            final String? nextPage = data['info']['next'];
            return {
                'results': results.map((json) => CharacterModel.fromJson(json)).toList(),
                'next': nextPage,
            };
        } else {
            throw Exception("Failed to load characters");
        }
    }
}