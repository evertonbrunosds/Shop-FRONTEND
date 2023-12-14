import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'http://192.168.0.106:8080/api';
  final List<Product> _items = dummyProducts;

  ProductList();

  List<Product> get allItems => [..._items];

  int get itensCount => _items.length;

  List<Product> get favoriteItems =>
      _items.where((item) => item.isFavorite).toList();

  void addProduct(final Product product) {
    http.post(
      Uri.parse('$_baseUrl/product'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );
    _items.add(product);
    notifyListeners();
  }

  void updateProduct(final Product product) {
    final index = _items.indexWhere((currentProduct) {
      return currentProduct.id == product.id;
    });
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void remove(final Product product) {
    _items.removeWhere((currentProduct) => currentProduct.id == product.id);
    notifyListeners();
  }

  void saveProductFromData(final Map<String, Object> content) {
    final hasId = content['id'] != null;
    final product = Product(
      id: hasId ? content['id'] as String : Random().nextDouble().toString(),
      name: content['name'] as String,
      description: content['description'] as String,
      price: content['price'] as double,
      imageUrl: content['imageUrl'] as String,
    );
    hasId ? updateProduct(product) : addProduct(product);
    notifyListeners();
  }
}
