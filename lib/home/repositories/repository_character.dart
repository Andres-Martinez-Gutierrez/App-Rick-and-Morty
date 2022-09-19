import 'package:http/http.dart' as http;

class ApiRepository {
  final String urlApi = "https://rickandmortyapi.com/api/";

  Future<http.Response> getCharacters() async {
    Uri uri = Uri.parse('${urlApi}character/');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}