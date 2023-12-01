import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/components/badgee.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 5,
        shadowColor: Colors.black,
        title: Text(
          'Minha Loja',
          style: TextStyle(color: colorScheme.secondary),
        ),
        actions: [
          PopupMenuButton(
            color: colorScheme.secondary,
            icon: Icon(
              Icons.more_vert,
              color: colorScheme.secondary,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text(
                  'Somente Favoritos',
                  style: TextStyle(
                    color: colorScheme.primary,
                  ),
                ),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text(
                  'Todos',
                  style: TextStyle(
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
            onSelected: (final FilterOptions value) => setState(
              () => value == FilterOptions.favorite
                  ? _showFavoriteOnly = true
                  : _showFavoriteOnly = false,
            ),
          ),
          //REDERIZAÇÃO ESPECÍFICA
          Consumer<Cart>(
            child: IconButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.CART),
              icon: Icon(
                Icons.shopping_cart,
                color: colorScheme.secondary,
              ),
            ),
            builder: (ctx, cart, child) => Badgee(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
      ),
    );
  }
}
