import 'package:app_miscelanea/src/pages/profile/profile_routes.dart';
import 'package:app_miscelanea/src/pages/repos_page/repos_routes.dart';
import 'package:app_miscelanea/src/pages/splash/splash_route.dart';
import 'package:app_miscelanea/src/shared/themes/app_theme.dart';
import 'package:app_miscelanea/src/shared/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/projects/projects_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      theme.loadThemePrefs();
      return MaterialApp(
        title: 'Flutter Demo',
        theme: theme.isDarkTheme ? AppTheme().themeDark : AppTheme().themeLight,
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          ...splashRoute,
          ...devPageRoute,
          ...repositoryPageRoute,
          ...projectRoutes,
        },
      );
    });
  }
}
