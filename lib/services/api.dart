import 'package:http/http.dart' as http;
import 'package:streaming_anime/models/anime.dart';

class APIService {
  Future<List<AnimeModel>> fetchAnime() async {
    final response = await http.get('https://ranggahaxor.my.id/api/streaminganime.json',
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
    final jsonObject = userModelFromJson(response.body);

    return jsonObject;
    } else {
      throw Exception('Failed to load Anime');
    }
  }
}
