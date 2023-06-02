import 'package:app_miscelanea/src/pages/repos_page/model/github_model.dart';
import 'package:app_miscelanea/src/pages/repos_page/repository/github_repository.dart';
import 'package:flutter/material.dart';

class ReposController extends ChangeNotifier {
  final GithubRepository githubRepository;

  ReposController(this.githubRepository);

  final repoList = <GithubModel>[];

  var loading = false;

  Future<void> getRepos() async {
    try {
      loading = true;
      notifyListeners();
      var response = await githubRepository.getRepo();
      loading = false;
      notifyListeners();
      repoList.addAll(response);
      debugPrint(repoList.toString());
    } catch (e) {
      throw Exception(e);
    }
  }
}
