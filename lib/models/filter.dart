class Filter {
  int id;
  String image;
  String name;
  String status;




  Filter.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image= json['image'],
        name = json['name'],
        status = json['status'];

}
