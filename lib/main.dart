import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/utils/application_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    final applicationTheme = ApplicationTheme(
      theme: ThemeData(fontFamily: 'Lato'),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductList(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        theme: applicationTheme.configureTheme(color: Colors.deepPurple),
        home: const ProductsOverviewPage(),
        routes: AppRoutes.ROUTES,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
