import '../model/github_model.dart';

abstract class GithubRepository {
  Future<List<GithubModel>> getRepo();
}
