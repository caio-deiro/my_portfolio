import 'dart:convert';

import 'package:app_miscelanea/src/pages/repos_page/model/github_model.dart';
import 'package:app_miscelanea/src/pages/repos_page/repos_controller.dart';
import 'package:app_miscelanea/src/pages/repos_page/repository/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repos_controller_test.mocks.dart';

@GenerateMocks([GithubRepository])
void main() {
  late ReposController controller;
  late MockGithubRepository repository;
  setUpAll(() {
    repository = MockGithubRepository();
    controller = ReposController(repository);
  });

  setUp(() {});
  test('Should return a list not empty', () async {
    when(repository.getRepo()).thenAnswer((_) async => [
          GithubModel(
            name: 'test',
            full_name: null,
            html_url: null,
            language: null,
            description: null,
            updated_at: null,
          ),
        ]);
    await controller.getRepos();
    verify(controller.getRepos()).called(1);
    expect(controller.repoList.length, equals(1));
    expect(controller.repoList[0].name, 'test');
  });

  test('Should return a error', () async {
    when(repository.getRepo()).thenAnswer((_) async => throw Exception());
    expect(() async => await controller.getRepos(), throwsA(isA<Exception>()));
  });
}
