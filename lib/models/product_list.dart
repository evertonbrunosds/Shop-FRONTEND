import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/http_manager.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  final _httpManager = HttpManager(resource: '/product');
  ProductList();

  List<Product> get allItems => [..._items];

  int get itensCount => _items.length;

  List<Product> get favoriteItems =>
      _items.where((item) => item.isFavorite).toList();

  Future<void> addProduct(final Product product) {
    return _httpManager.post(
      (request) {
        request.body.addAll(product.parseMap());
      },
    ).then(
      (response) {
        final newProduct = Product.parse(jsonDecode(response.body));
        _items.add(newProduct);
        notifyListeners();
      },
    );
  }

  Future<void> updateProduct(final Product product) {
    final index = _items.indexWhere((currentProduct) {
      return currentProduct.id == product.id;
    });
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
    return Future.value();
  }

  void remove(final Product product) {
    _items.removeWhere((currentProduct) => currentProduct.id == product.id);
    notifyListeners();
  }

  Future<void> saveProductFromData(final Map<String, Object> content) {
    final hasId = content['id'] != null;
    final product = Product(
      id: hasId ? content['id'] as String : Random().nextDouble().toString(),
      name: content['name'] as String,
      description: content['description'] as String,
      price: content['price'] as double,
      imageUrl: content['imageUrl'] as String,
    );
    return hasId ? updateProduct(product) : addProduct(product);
  }
}
