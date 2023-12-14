import 'package:flutter/material.dart';
import 'package:shop/utils/json_serializable.dart';

class Product extends JsonSerializable with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  @override
  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  @override
  T toType<T>(final Map<String, Object> content) {
    return Product(
      id: content['id'] as String,
      name: content['name'] as String,
      description: content['description'] as String,
      price: content['price'] as double,
      imageUrl: content['imageUrl'] as String,
    ) as T;
  }
}
