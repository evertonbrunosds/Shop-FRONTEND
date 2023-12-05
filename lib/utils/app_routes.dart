// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/pages/products_page.dart';

final class AppRoutes {
  static const HOME = '/home';
  static const PRODUCT_DETAIL = "/product-detail";
  static const CART = "/cart";
  static const ORDERS = '/orders';
  static const PRODUCTS = '/products';

  static final Map<String, WidgetBuilder> ROUTES = {
    HOME: (_) => const ProductsOverviewPage(),
    PRODUCT_DETAIL: (_) => const ProductDetailPage(),
    CART: (_) => const CartPage(),
    ORDERS: (_) => const OrdersPage(),
    PRODUCTS: (_) => const ProductsPage(),
  };
}
