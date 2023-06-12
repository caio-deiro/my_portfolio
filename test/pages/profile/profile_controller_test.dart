import 'package:app_miscelanea/src/pages/profile/profile_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProfileController controller;
  setUpAll(() {
    controller = ProfileController();
  });
  testWidgets('deve retornar o tamanho das listas', (tester) async {
    expect(controller.habilitiesList.length, equals(4));
    expect(controller.tecnologyList.length, equals(4));
  });
}
