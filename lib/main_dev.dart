import 'package:app_miscelanea/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/shared/service/theme_service.dart';

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
