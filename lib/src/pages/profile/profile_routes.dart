import 'package:app_miscelanea/src/pages/profile/profile_page.dart';
import 'package:app_miscelanea/src/shared/widgets/app_pageview.dart';
import 'package:flutter/material.dart';

final devPageRoute = <String, WidgetBuilder>{
  '/profile': (context) => AppPageView(),
  '/profile/home': (context) => ProfilePage(),
};
