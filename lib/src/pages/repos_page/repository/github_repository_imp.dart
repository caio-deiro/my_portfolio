import 'package:app_miscelanea/src/pages/repos_page/model/github_model.dart';
import 'package:app_miscelanea/src/pages/repos_page/repository/github_repository.dart';
import 'package:dio/dio.dart';

class GithubRepositoryImp implements GithubRepository {
  var dio = Dio();
  @override
  Future<dynamic> getRepo() async {
    try {
      var response =
          await dio.get('https://api.github.com/users/Caio-Deiro/repos');
      return (response.data).map((item) => GithubModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception();
    }
  }
}
