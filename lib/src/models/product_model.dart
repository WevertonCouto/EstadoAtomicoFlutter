import 'dart:convert';

class ProductModel {
  final String id;
  final String title;
  final String image;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  String toMoney() {
    return r'R$ ' + price.toStringAsFixed(2);
  }

  // JSON Serializable

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
