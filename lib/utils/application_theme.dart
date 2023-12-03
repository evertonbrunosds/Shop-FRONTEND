import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationTheme {
  final ThemeData theme;

  ApplicationTheme({required this.theme});

  ThemeData configureTheme({final Color? color}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: color ?? Colors.grey.shade900,
      ),
    );
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: color ?? Colors.grey.shade900,
        secondary: (color ?? Colors.black).withGreen(255),
        background: (color ?? Colors.black).withOpacity(0.3),
      ),
    );
  }
}
