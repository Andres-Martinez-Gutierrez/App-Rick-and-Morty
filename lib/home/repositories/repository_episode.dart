import 'package:http/http.dart' as http;

class ApiRepositoryEpisode {
  Future<http.Response> getEpisode(String url) async {
    Uri uri = Uri.parse(url);
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}
