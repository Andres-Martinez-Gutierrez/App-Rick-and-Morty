import 'package:http/http.dart' as http;

class ApiRepositoryFilter {
  final String urlApi = "https://rickandmortyapi.com/api/character/?name=";

  Future<http.Response> getFilter(String keyword) async {
    Uri uri = Uri.parse('$urlApi$keyword');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}
