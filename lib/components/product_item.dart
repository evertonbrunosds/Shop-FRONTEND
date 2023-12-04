import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(final BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(product.name, textAlign: TextAlign.center),
          backgroundColor: Colors.black.withOpacity(.65),
          //REDERIZAÇÃO ESPECÍFICA
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              onPressed: product.toggleFavorite,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: colorScheme.secondary,
            ),
          ),
          trailing: IconButton(
            onPressed: () => cart.addItem(product),
            icon: const Icon(Icons.shopping_cart),
            color: colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_DETAIL,
            arguments: product,
          ),
        ),
      ),
    );
  }
}
