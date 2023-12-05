import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: colorScheme.background,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: colorScheme.primary,
          size: 40,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog(
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
                'Quer remover o item "${cartItem.name}" do carrinho?',
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
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Sim',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onDismissed: (_) => Provider.of<Cart>(
        context,
        listen: false,
      ).removeItem(cartItem.productId),
      child: Card(
        elevation: 0,
        color: colorScheme.background,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '${cartItem.price}',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                ),
              ),
            ),
            title: Text(
              cartItem.name,
              style: TextStyle(color: colorScheme.secondary),
            ),
            subtitle: Text(
              'Total: R\$ ${cartItem.price * cartItem.quantity}',
              style: TextStyle(color: colorScheme.secondary),
            ),
            trailing: Text(
              '${cartItem.quantity}x',
              style: TextStyle(color: colorScheme.secondary),
            ),
          ),
        ),
      ),
    );
  }
}
