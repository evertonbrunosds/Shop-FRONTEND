import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item_widget.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cart = Provider.of<Cart>(context);
    final items = [...cart.items.values];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme.secondary,
        backgroundColor: colorScheme.primary,
        title: Text(
          'Carrinho',
          style: TextStyle(
            color: colorScheme.secondary,
          ),
        ),
      ),
      body: Container(
        color: colorScheme.background,
        child: Column(
          children: [
            Card(
              elevation: .1,
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 25,
              ),
              color: colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        color: colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Chip(
                      backgroundColor: colorScheme.primary,
                      label: Text(
                        'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: colorScheme.secondary),
                      ),
                      child: Text(
                        'COMPRAR',
                        style: TextStyle(
                          color: colorScheme.secondary,
                        ),
                      ),
                      onPressed: () {
                        Provider.of<OrderList>(
                          context,
                          listen: false,
                        ).addOrder(cart);
                        cart.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  return CartItemWidget(cartItem: items[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
