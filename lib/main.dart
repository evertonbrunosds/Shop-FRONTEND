import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _configureTheme() {
    final theme = ThemeData(fontFamily: 'Lato');
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.grey.shade900,
      ),
    );
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: Colors.grey.shade900,
        secondary: Colors.white,
        background: Colors.black.withOpacity(0.3),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductList(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: OrderList(),
        )
      ],
      child: MaterialApp(
        theme: _configureTheme(),
        home: const ProductsOverviewPage(),
        routes: AppRoutes.ROUTES,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
