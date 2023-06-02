import 'dart:convert';

import 'package:app_miscelanea/src/pages/repos_page/model/github_model.dart';
import 'package:app_miscelanea/src/pages/repos_page/repository/github_repository.dart';
import 'package:dio/dio.dart';

class GithubRepositoryImp implements GithubRepository {
  Dio dio;
  GithubRepositoryImp(this.dio);
  @override
  Future<List<GithubModel>> getRepo() async {
    var list = [];
    try {
      var response =
          await dio.get('https://api.github.com/users/Caio-Deiro/repos');
      if (response.data is String) {
        var decode = jsonDecode(response.data);
        list.add(decode);
        return list.map((item) => GithubModel.fromJson(item)).toList();
      }

      var result = (response.data as List)
          .map((item) => GithubModel.fromJson(item))
          .toList();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
