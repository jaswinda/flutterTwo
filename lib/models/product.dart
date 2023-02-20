import 'dart:convert';

List<Product?>? productFromJson(String str) => json.decode(str) == null
    ? []
    : List<Product?>.from(json.decode(str)!.map((x) => Product.fromJson(x)));

String productToJson(List<Product?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Product {


  Product({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.approved,
    this.category,
  });

  String? id;
  String? image;
  String? name;
  String? description;
  String? price;
  String? quantity;
  String? approved;
  String? category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        approved: json["approved"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "description": description,
        "price": price,
        "quantity": quantity,
        "approved": approved,
        "category": category,
      };
}
