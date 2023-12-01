import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/components/badgee.dart';
import 'package:shop/models/cart.dart';

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
            icon: Icon(
              Icons.more_vert,
              color: colorScheme.secondary,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
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
              onPressed: () {},
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
