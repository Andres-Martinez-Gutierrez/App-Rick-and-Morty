class Location{
  String name;


  Location.fromJson(Map<dynamic, dynamic> json)
      :name = json['name'];
}