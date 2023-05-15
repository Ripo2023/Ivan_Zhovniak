import 'dart:convert';

class DataModel {
  String? name;
  String? price;
  String? icon;
  String? desc;
  DataModel(
      {required this.name,
      required this.price,
      required this.icon,
      required this.desc});
  DataModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    icon = json["icon"];
    desc = json["desc"];
  }
}
