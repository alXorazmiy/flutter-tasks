

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_2/app/model/episodeModel.dart';

class EpisodeService {
    Future<Map<String, dynamic>>getEpisodes(String? url) async {
        final response = await http.get(Uri.parse(url!));

        if (response.statusCode == 200) {
            final Map<String, dynamic> data = jsonDecode(response.body);
            final List<dynamic> results = data['results'];
            final String? nextPage = data['info']['next'];
            return {
                'results': results.map((json) => Episodemodel.fromJson(json)).toList(),
                'next': nextPage,
            };
        } else {
            throw Exception("Failed to load characters");
        }
    }
    Future<List<Episodemodel>> getCharacterEpisodes(List<String> episodeUrls) async {
        List<Episodemodel> episodes = [];
        
        for (String url in episodeUrls) {
            final response = await http.get(Uri.parse(url));
            
            if (response.statusCode == 200) {
                episodes.add(Episodemodel.fromJson(json.decode(response.body)));
            } else {
                throw Exception('Failed to load episode');
            }
        }
        return episodes;
    }
}