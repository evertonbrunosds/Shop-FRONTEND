import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(final Product product) {
    _items.containsKey(product.id)
        ? _items.update(
            product.id,
            (currentItem) => CartItem(
              id: currentItem.id,
              productId: currentItem.productId,
              name: currentItem.name,
              quantity: currentItem.quantity + 1,
              price: currentItem.price,
            ),
          )
        : _items.putIfAbsent(
            product.id,
            () => CartItem(
              id: Random().nextDouble().toString(),
              productId: product.id,
              name: product.name,
              quantity: 1,
              price: product.price,
            ),
          );
    notifyListeners();
  }

  void removeItem(final String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get itemsCount => _items.length;
}
