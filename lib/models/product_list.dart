import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;

  ProductList();

  List<Product> get items => _showFavoriteOnly
      ? _items.where((item) => item.isFavorite).toList()
      : [..._items];

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(final Product product) {
    _items.add(product);
    notifyListeners();
  }
}
