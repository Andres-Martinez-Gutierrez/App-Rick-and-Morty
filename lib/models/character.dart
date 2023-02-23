import 'package:pruebatecnica/models/location.dart';

class Character {
  int id;
  String name;
  String image;
  String status;
  String species;
  String type;
  String gender;
  Location location;
  List<String> episodes;
  String created;
  bool isFavorite;

  // Se mapea el json
  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        species = json['species'],
        status = json['status'],
        image = json['image'],
        type = json['type'],
        gender = json['gender'],
        location = Location.fromJson(json['location']),
        episodes = List<String>.from(json["episode"].map((x) => x)),
        created = json['created'],
        isFavorite = false;
}
