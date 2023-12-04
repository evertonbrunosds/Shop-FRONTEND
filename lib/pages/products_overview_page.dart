import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
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
        iconTheme: IconThemeData(color: colorScheme.secondary),
        backgroundColor: colorScheme.primary,
        elevation: 5,
        shadowColor: Colors.black,
        title: Text(
          'Minha Loja',
          style: TextStyle(color: colorScheme.secondary),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
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
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Container(
              margin: const EdgeInsets.only(right: 10),
              child: Badgee(
                value: cart.itemsCount,
                child: child!,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
      ),
      drawer: const AppDrawer(),
    );
  }
}
