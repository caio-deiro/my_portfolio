import 'package:app_miscelanea/src/app_widget.dart';
import 'package:app_miscelanea/src/shared/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
