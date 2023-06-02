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

  GithubModel copyWith({
    String? name,
    String? full_name,
    String? html_url,
    String? language,
    String? description,
    String? updated_at,
  }) {
    return GithubModel(
      name: name ?? this.name,
      full_name: full_name ?? this.full_name,
      html_url: html_url ?? this.html_url,
      language: language ?? this.language,
      description: description ?? this.description,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'full_name': full_name,
      'html_url': html_url,
      'language': language,
      'description': description,
      'updated_at': updated_at,
    };
  }

  factory GithubModel.fromMap(Map<String, dynamic> map) {
    return GithubModel(
      name: map['name'] != null ? map['name'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      html_url: map['html_url'] != null ? map['html_url'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'GithubModel(name: $name, full_name: $full_name, html_url: $html_url, language: $language, description: $description, updated_at: $updated_at)';
  }
}
