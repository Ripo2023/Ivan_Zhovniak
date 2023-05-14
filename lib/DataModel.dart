import 'dart:convert';

class DataModel {
  String? name;
  String? price;
  String? icon;
  DataModel({required this.name, required this.price, required this.icon});
  DataModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    icon = json["icon"];
  }
}
