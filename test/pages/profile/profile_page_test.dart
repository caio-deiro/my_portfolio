import 'package:app_miscelanea/src/pages/profile/profile_page.dart';
import 'package:app_miscelanea/src/pages/profile/widget/habilities_card_widget.dart';
import 'package:app_miscelanea/src/pages/profile/widget/tecnology_card_widget.dart';
import 'package:app_miscelanea/src/pages/profile/widget/user_card_profile_widget.dart';
import 'package:app_miscelanea/src/shared/widgets/app_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('testando elementos basicos da tela', () {
    testWidgets('O base app deve estar na tela', (tester) async {
      await tester.pumpWidget(buildWidget(ProfilePage()));
      await tester.pumpAndSettle();

      final Finder appBase = find.byType(AppBase);
      expect(appBase, findsOneWidget);
    });
  });

  group('testando o card de perfil', () {
    testWidgets('testando elementos do card', (tester) async {
      await tester.pumpWidget(buildWidget(ProfilePage()));
      await tester.pumpAndSettle();

      // deve renderizar o card na tela
      final Finder userCardProfile = find.byType(UserCardProfileWidget);
      expect(userCardProfile, findsOneWidget);

      //deve renderizar a imagem  do whatsapp na tela
      final Finder userCardProfileWhatsImage =
          find.image(AssetImage('assets/icons/Icon-ionic-logo-whatsapp.png'));
      expect(userCardProfileWhatsImage, findsOneWidget);

      //deve renderizar a imagem  do github na tela
      final Finder userCardProfileGitImage =
          find.image(AssetImage('assets/icons/Icon-awesome-github.png'));
      expect(userCardProfileGitImage, findsOneWidget);

      //deve renderizar a imagem  do linkedin na tela
      final Finder userCardProfileLinkedinImage =
          find.image(AssetImage('assets/icons/Icon-awesome-linkedin.png'));
      expect(userCardProfileLinkedinImage, findsOneWidget);
    });
  });

  group('testando card de tecnologias', () {
    testWidgets('Testando se o card renderizou na tela', (tester) async {
      await tester.pumpWidget(buildWidget(ProfilePage()));
      await tester.pumpAndSettle();

      final Finder tecnologyFinder = find.byType(TecnologyCardWidget);

      expect(tecnologyFinder, findsNWidgets(4));
    });
  });

  group('testando o card de habilidades e competencias', () {
    testWidgets('O card de habilidades deve renderizar na tela',
        (tester) async {
      await tester.pumpWidget(buildWidget(ProfilePage()));
      await tester.pumpAndSettle();

      final Finder habilitiesCard = find.byType(HabilitiesCardWidget);
      expect(habilitiesCard, findsOneWidget);
    });
  });
}

Widget buildWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}
