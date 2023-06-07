import 'package:app_miscelanea/src/shared/widgets/app_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pages/profile/profile_page_test.dart';

void main() {
  testWidgets('should renderize all widget components', (tester) async {
    await tester.pumpWidget(buildWidget(AppPageView()));
    await tester.pumpAndSettle();

    final Finder bottomNavigatorFinder = find.byType(BottomNavigationBar);
    expect(bottomNavigatorFinder, findsOneWidget);

    //deve renderizar a imagem  do whatsapp na tela
    final Finder bottomNavigatorImageFlutter =
        find.image(AssetImage('assets/images/flutter-logo.png'));
    expect(bottomNavigatorImageFlutter, findsWidgets);

    final Finder bottomNavigatorImageGitHub =
        find.image(AssetImage('assets/icons/Icon-awesome-github.png'));
    expect(bottomNavigatorImageGitHub, findsWidgets);

    final Finder bottomNavigatorIconDev = find.byType(Icon);
    expect(bottomNavigatorIconDev, findsOneWidget);
  });
}
