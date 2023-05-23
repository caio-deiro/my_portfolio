import 'package:app_miscelanea/src/pages/repos_page/repository/github_repository.dart';
import 'package:flutter/material.dart';

class ReposController extends ChangeNotifier {
  final GithubRepository githubRepository;

  ReposController(this.githubRepository);

  final repoList = [];

  var loading = false;

  Future<void> getRepos() async {
    loading = true;
    notifyListeners();
    var response = await githubRepository.getRepo();
    loading = false;
    notifyListeners();
    repoList.addAll(response);
  }
}
