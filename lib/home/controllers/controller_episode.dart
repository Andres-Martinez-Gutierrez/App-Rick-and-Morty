import '../../models/episode.dart';
import '../repositories/repository_episode.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ControllerEpisodes {
  final apiRepositoryEpisode = ApiRepositoryEpisode();

  Future<Episode> getEpisode(String id) async {
    final Response response = await apiRepositoryEpisode.getEpisode(id);
    late Episode episode;

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataFromAPI = jsonDecode(response.body);

      episode = Episode.fromJson(dataFromAPI);
    }
    return episode;
  }
}


