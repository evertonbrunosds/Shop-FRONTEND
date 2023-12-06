import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  Future<bool?> confirm(final BuildContext context, {required String name}) {
    final colorScheme = Theme.of(context).colorScheme;
    return showDialog<bool>(
      barrierColor: Colors.transparent,
      context: context,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AlertDialog(
          backgroundColor: colorScheme.background,
          surfaceTintColor: Colors.transparent,
          title: Text(
            'Tem certeza?',
            style: TextStyle(color: colorScheme.secondary),
          ),
          content: Text(
            'Quer remover o produto "$name" da lista de produtos?',
            style: TextStyle(color: colorScheme.secondary),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Não',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: colorScheme.secondary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Sim',
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
                arguments: product,
              ),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () => confirm(context, name: product.name).then(
                (result) {
                  if (result ?? false) {
                    Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).remove(product);
                  }
                },
              ),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
