import 'package:app_miscelanea/src/pages/repos_page/repos_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';

import '../profile/profile_page_test.dart';

void main() async {
  Map<String, dynamic> response = {
    'name': 'teste',
    'created_at': '2022-04-08T20:57:20Z'
  };

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    nock.init();
  });

  setUp(() => nock.cleanAll());

  testWidgets('test if page loaded', (tester) async {
    nock('https://api.github.com').get('/users/Caio-Deiro/repos').reply(
          200,
          response,
        );

    await tester.pumpWidget(buildWidget(RepoPage()));

    await tester.pumpAndSettle();

    expect(find.text('teste'), findsOneWidget);
  });
}
