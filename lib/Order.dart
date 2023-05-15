class Order {
  String? name;
  String? price;
  String? key;
  String? icon;
  String? volume;
  String? status;
  Order({this.name, this.price, this.icon, this.key, this.volume});
  Order.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    icon = json["icon"];
    key = json["key"];
    volume = json["volume"];
    //location = json["location"];
  }
}
