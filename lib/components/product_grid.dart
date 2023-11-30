import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(final BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final loadedProducts = provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (_, index) => ChangeNotifierProvider(
        create: (_) => loadedProducts[index],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
