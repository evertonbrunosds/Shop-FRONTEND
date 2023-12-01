// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/product_detail_page.dart';

final class AppRoutes {
  static const PRODUCT_DETAIL = "/product-detail";
  static const CART = "/cart";

  // ignore: non_constant_identifier_names
  static final Map<String, WidgetBuilder> ROUTES = {
    PRODUCT_DETAIL: (_) => const ProductDetailPage(),
    CART: (_) => const CartPage(),
  };
}
