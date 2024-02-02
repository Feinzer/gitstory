import 'dart:convert';

// [
//   {
//     "url": "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e",
//     "sha": "6dcb09b5b57875f334f61aebed695e2e4193db5e",
//     "node_id": "MDY6Q29tbWl0NmRjYjA5YjViNTc4NzVmMzM0ZjYxYWViZWQ2OTVlMmU0MTkzZGI1ZQ==",
//     "html_url": "https://github.com/octocat/Hello-World/commit/6dcb09b5b57875f334f61aebed695e2e4193db5e",
//     "comments_url": "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e/comments",
//     "commit": {
//       "url": "https://api.github.com/repos/octocat/Hello-World/git/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e",
//       "author": {
//         "name": "Monalisa Octocat",
//         "email": "support@github.com",
//         "date": "2011-04-14T16:00:49Z"
//       },
//       "committer": {
//         "name": "Monalisa Octocat",
//         "email": "support@github.com",
//         "date": "2011-04-14T16:00:49Z"
//       },
//       "message": "Fix all the bugs",
//       "tree": {
//         "url": "https://api.github.com/repos/octocat/Hello-World/tree/6dcb09b5b57875f334f61aebed695e2e4193db5e",
//         "sha": "6dcb09b5b57875f334f61aebed695e2e4193db5e"
//       },
//       "comment_count": 0,
//       "verification": {
//         "verified": false,
//         "reason": "unsigned",
//         "signature": null,
//         "payload": null
//       }
//     },
//     "author": {
//       "login": "octocat",
//       "id": 1,
//       "node_id": "MDQ6VXNlcjE=",
//       "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//       "gravatar_id": "",
//       "url": "https://api.github.com/users/octocat",
//       "html_url": "https://github.com/octocat",
//       "followers_url": "https://api.github.com/users/octocat/followers",
//       "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//       "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//       "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//       "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//       "organizations_url": "https://api.github.com/users/octocat/orgs",
//       "repos_url": "https://api.github.com/users/octocat/repos",
//       "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//       "received_events_url": "https://api.github.com/users/octocat/received_events",
//       "type": "User",
//       "site_admin": false
//     },
//     "committer": {
//       "login": "octocat",
//       "id": 1,
//       "node_id": "MDQ6VXNlcjE=",
//       "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//       "gravatar_id": "",
//       "url": "https://api.github.com/users/octocat",
//       "html_url": "https://github.com/octocat",
//       "followers_url": "https://api.github.com/users/octocat/followers",
//       "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//       "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//       "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//       "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//       "organizations_url": "https://api.github.com/users/octocat/orgs",
//       "repos_url": "https://api.github.com/users/octocat/repos",
//       "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//       "received_events_url": "https://api.github.com/users/octocat/received_events",
//       "type": "User",
//       "site_admin": false
//     },
//     "parents": [
//       {
//         "url": "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e",
//         "sha": "6dcb09b5b57875f334f61aebed695e2e4193db5e"
//       }
//     ]
//   }
// ]

class Committer {
  final String name;
  final String email;
  final String date;

  Committer({
    required this.name,
    required this.email,
    required this.date,
  });

  Committer copyWith({
    String? name,
    String? email,
    String? date,
  }) {
    return Committer(
      name: name ?? this.name,
      email: email ?? this.email,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'date': date,
    };
  }

  factory Committer.fromMap(Map<String, dynamic> map) {
    return Committer(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Committer.fromJson(String source) =>
      Committer.fromMap(json.decode(source));

  @override
  String toString() => 'Committer(name: $name, email: $email, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Committer &&
        other.name == name &&
        other.email == email &&
        other.date == date;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ date.hashCode;
}

class CommitData {
  final Committer author;
  final Committer committer;
  final String message;

  CommitData({
    required this.author,
    required this.committer,
    required this.message,
  });

  CommitData copyWith({
    Committer? author,
    Committer? committer,
    String? message,
  }) {
    return CommitData(
      author: author ?? this.author,
      committer: committer ?? this.committer,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author.toMap(),
      'committer': committer.toMap(),
      'message': message,
    };
  }

  factory CommitData.fromMap(Map<String, dynamic> map) {
    return CommitData(
      author: Committer.fromMap(map['author']),
      committer: Committer.fromMap(map['committer']),
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommitData.fromJson(String source) =>
      CommitData.fromMap(json.decode(source));

  @override
  String toString() =>
      'CommitData(author: $author, committer: $committer, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommitData &&
        other.author == author &&
        other.committer == committer &&
        other.message == message;
  }

  @override
  int get hashCode => author.hashCode ^ committer.hashCode ^ message.hashCode;
}

class GithubCommit {
  final String url;
  final String sha;
  final String htmlUrl;
  final String commentsUrl;
  final CommitData commit;

  String get shortSha {
    return sha.substring(0, 7);
  }

  GithubCommit({
    required this.url,
    required this.sha,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
  });

  GithubCommit copyWith({
    String? url,
    String? sha,
    String? htmlUrl,
    String? commentsUrl,
    CommitData? commit,
  }) {
    return GithubCommit(
      url: url ?? this.url,
      sha: sha ?? this.sha,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      commit: commit ?? this.commit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'sha': sha,
      'html_url': htmlUrl,
      'comments_url': commentsUrl,
      'commit': commit.toMap(),
    };
  }

  factory GithubCommit.fromMap(Map<String, dynamic> map) {
    return GithubCommit(
      url: map['url'] ?? '',
      sha: map['sha'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      commentsUrl: map['comments_url'] ?? '',
      commit: CommitData.fromMap(map['commit']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubCommit.fromJson(String source) =>
      GithubCommit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GithubCommit(url: $url, sha: $sha, html_url: $htmlUrl, comments_url: $commentsUrl, commit: $commit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubCommit &&
        other.url == url &&
        other.sha == sha &&
        other.htmlUrl == htmlUrl &&
        other.commentsUrl == commentsUrl &&
        other.commit == commit;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        sha.hashCode ^
        htmlUrl.hashCode ^
        commentsUrl.hashCode ^
        commit.hashCode;
  }
}
