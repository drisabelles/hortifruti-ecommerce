class Product {
  String? icon;
  String? name;
  double? price;

  Product({this.icon, this.name, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}