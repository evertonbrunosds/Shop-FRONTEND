import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/product_form_page.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  ProductList();

  List<Product> get allItems => [..._items];

  int get itensCount => _items.length;

  List<Product> get favoriteItems =>
      _items.where((item) => item.isFavorite).toList();

  void addProduct(final Product product) {
    _items.add(product);
    notifyListeners();
  }

  void addProductFromData(final FormContent content) {
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: content.getName,
      description: content.getDescription,
      price: content.getPrice,
      imageUrl: content.getUrlImage,
    );
    addProduct(newProduct);
    notifyListeners();
  }
}
