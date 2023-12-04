import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Drawer(
        surfaceTintColor: colorScheme.background,
        backgroundColor: colorScheme.background,
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false, //REMOVE ÍCONE DO DRAWER
              iconTheme: IconThemeData(color: colorScheme.secondary),
              backgroundColor: colorScheme.background,
              title: Text(
                'Bem-Vindo!',
                style: TextStyle(
                  color: colorScheme.secondary,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.shop,
                color: colorScheme.secondary,
              ),
              title: Text(
                'Loja',
                style: TextStyle(
                  color: colorScheme.secondary,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: colorScheme.secondary,
              ),
              title: Text(
                'Pedidos',
                style: TextStyle(
                  color: colorScheme.secondary,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
