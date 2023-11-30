import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationTheme {
  final ThemeData theme;

  ApplicationTheme({required this.theme});

  ThemeData configureTheme({required final Color color}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: color,
      ),
    );
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: color,
        secondary: color.withGreen(255),
        background: color.withOpacity(0.3),
      ),
    );
  }
}
