import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: .1,
      color: colorScheme.background,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'R\$ ${widget.order.total.toStringAsFixed(2)}',
              style: TextStyle(color: colorScheme.secondary),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
              style: TextStyle(color: colorScheme.secondary),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more, color: colorScheme.secondary),
              onPressed: () => setState(() => _expanded = !_expanded),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              height: widget.order.products.length * 30 + 10,
              child: ListView(
                children: [
                  ...widget.order.products.map(
                    (product) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.secondary,
                          ),
                        ),
                        Text(
                          '${product.quantity}x R\$ ${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: colorScheme.secondary,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
