import 'dart:convert';

import 'package:gitstory/env.local.dart';
import 'package:gitstory/src/internal/models/branch.dart';
import 'package:gitstory/src/internal/models/commit.dart';
import 'package:http/http.dart' as http;

final Map<String, String> _headers = {
  "Accept": "application/vnd.github+json",
  "Authorization": "Bearer $accessToken",
  "X-GitHub-Api-Version": "2022-11-28"
};

class GithubApi {
  static Future<List<GithubBranch>> branches() async {
    final url = Uri.parse("https://api.github.com/repos/$owner/$repo/branches");
    final response = await http.get(
      url,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return List<GithubBranch>.generate(
        body.length,
        (index) => GithubBranch.fromMap(body[index]),
      );
    } else {
      return [];
    }
  }

  static Future<List<GithubCommit>> commits(GithubBranch branch) async {
    final url = Uri.parse(
        "https://api.github.com/repos/$owner/$repo/commits?sha=${branch.name}");
    final response = await http.get(
      url,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return List<GithubCommit>.generate(
        body.length,
        (index) => GithubCommit.fromMap(body[index]),
      );
    } else {
      return [];
    }
  }

  static Future<GithubCommit?> commit(String sha) async {
    final url =
        Uri.parse("https://api.github.com/repos/$owner/$repo/commits/$sha");
    final response = await http.get(
      url,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      return GithubCommit.fromJson(response.body);
    } else {
      return null;
    }
  }
}
