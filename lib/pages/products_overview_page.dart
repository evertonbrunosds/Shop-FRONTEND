import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 5,
        shadowColor: Colors.black,
        title: const Text(
          'Minha Loja',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            iconColor: Colors.white,
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
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
      ),
    );
  }
}
