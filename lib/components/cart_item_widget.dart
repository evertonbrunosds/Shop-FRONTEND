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
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Text(
              cartItem.name,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Total: R\$ ${cartItem.price * cartItem.quantity}',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '${cartItem.quantity}x',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}