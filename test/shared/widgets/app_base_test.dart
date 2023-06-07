import 'package:app_miscelanea/src/shared/service/theme_service.dart';
import 'package:app_miscelanea/src/shared/widgets/app_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('should renderize all widget components', (tester) async {
    ThemeService().isDarkTheme = true;

    await tester.pumpWidget(buildWidget(ChangeNotifierProvider<ThemeService>(
      create: (_) => ThemeService(),
      child: AppBase(
        title: 'teste',
        child: Container(),
      ),
    )));
    await tester.pumpAndSettle();

    final Finder imagefind =
        find.image(AssetImage('assets/icons/Icon-awesome-moon.png'));
    expect(imagefind, findsOneWidget);

    final Finder textFind = find.text('teste');
    expect(textFind, findsOneWidget);

    final Finder containerFind = find.byType(Container);
    expect(containerFind, findsOneWidget);

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();
    expect(ThemeService().isDarkTheme, false);
  });
}

Widget buildWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}
