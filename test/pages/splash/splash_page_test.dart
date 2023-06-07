import 'package:app_miscelanea/src/pages/profile/profile_routes.dart';
import 'package:app_miscelanea/src/pages/splash/splash_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should load image', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: <String, WidgetBuilder>{
        ...splashRoute,
        ...devPageRoute,
      },
    ));
    await tester.pumpAndSettle(Duration(seconds: 2));
    final Finder imageFind = find.byType(Image).first;
    expect(imageFind, findsOneWidget);
  });
}
