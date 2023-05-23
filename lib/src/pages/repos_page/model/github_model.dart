import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GithubModel {
  final String? name;
  final String? full_name;
  final String? html_url;

  final String? language;
  final String? description;
  final String? updated_at;

  GithubModel({
    required this.name,
    required this.full_name,
    required this.html_url,
    required this.language,
    required this.description,
    required this.updated_at,
  });

  factory GithubModel.fromJson(Map<String, dynamic> json) {
    return GithubModel(
      name: json['name'],
      full_name: json['full_name'],
      html_url: json['html_url'],
      language: json['language'],
      description: json['description'],
      updated_at: json[' updated_at'],
    );
  }
}
