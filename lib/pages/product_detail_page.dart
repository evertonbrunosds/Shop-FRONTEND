import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          product.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: colorScheme.primary,
      ),
      body: Container(
        color: colorScheme.background,
      ),
    );
  }
}
