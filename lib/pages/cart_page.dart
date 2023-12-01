import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme.secondary,
        backgroundColor: colorScheme.primary,
        shadowColor: Colors.black,
        elevation: 5,
        title: Text(
          'Carrinho',
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
