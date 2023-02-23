class Episode {
  int id;
  String name;

  // Se mapea el json
  Episode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
