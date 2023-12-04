import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order_widget.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final orderList = Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme.secondary),
        backgroundColor: colorScheme.primary,
        title: Text(
          'Meus Pedidos',
          style: TextStyle(
            color: colorScheme.secondary,
          ),
        ),
      ),
      body: Container(
        color: colorScheme.background,
        child: ListView.builder(
          itemCount: orderList.itemsCount,
          itemBuilder: (ctx, index) => OrderWidget(
            order: orderList.items[index],
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
