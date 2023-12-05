import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final products = Provider.of<ProductList>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme.secondary),
        backgroundColor: colorScheme.primary,
        title: Text(
          'Gerenciar Produtos',
          style: TextStyle(color: colorScheme.secondary),
        ),
      ),
      body: Container(
        color: colorScheme.background,
        child: ListView.builder(
          itemCount: products.itensCount,
          itemBuilder: (ctx, index) => Column(
            children: [
              ProductItem(product: products.allItems[index]),
              Divider(color: colorScheme.background),
            ],
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
