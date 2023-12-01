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
        foregroundColor: colorScheme.secondary,
        backgroundColor: colorScheme.primary,
        shadowColor: Colors.black,
        elevation: 5,
        title: Text(
          product.name,
          style: TextStyle(
            color: colorScheme.secondary,
          ),
        ),
      ),
      body: Container(
        color: colorScheme.background,
      ),
    );
  }
}
