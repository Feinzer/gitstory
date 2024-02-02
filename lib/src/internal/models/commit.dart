import 'dart:convert';

import 'package:flutter/foundation.dart';

class CommitVerification {
  final bool verified;
  final String? reason;
  final String? signature;
  final String? payload;

  CommitVerification({
    required this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  CommitVerification copyWith({
    bool? verified,
    ValueGetter<String?>? reason,
    ValueGetter<String?>? signature,
    ValueGetter<String?>? payload,
  }) {
    return CommitVerification(
      verified: verified ?? this.verified,
      reason: reason != null ? reason() : this.reason,
      signature: signature != null ? signature() : this.signature,
      payload: payload != null ? payload() : this.payload,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'verified': verified,
      'reason': reason,
      'signature': signature,
      'payload': payload,
    };
  }

  factory CommitVerification.fromMap(Map<String, dynamic> map) {
    return CommitVerification(
      verified: map['verified'] ?? false,
      reason: map['reason'],
      signature: map['signature'],
      payload: map['payload'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommitVerification.fromJson(String source) =>
      CommitVerification.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommitVerification(verified: $verified, reason: $reason, signature: $signature, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommitVerification &&
        other.verified == verified &&
        other.reason == reason &&
        other.signature == signature &&
        other.payload == payload;
  }

  @override
  int get hashCode {
    return verified.hashCode ^
        reason.hashCode ^
        signature.hashCode ^
        payload.hashCode;
  }
}

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
  final CommitVerification verification;

  CommitData({
    required this.author,
    required this.committer,
    required this.message,
    required this.verification,
  });

  CommitData copyWith({
    Committer? author,
    Committer? committer,
    String? message,
    CommitVerification? verification,
  }) {
    return CommitData(
      author: author ?? this.author,
      committer: committer ?? this.committer,
      message: message ?? this.message,
      verification: verification ?? this.verification,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author.toMap(),
      'committer': committer.toMap(),
      'message': message,
      'verification': verification.toMap(),
    };
  }

  factory CommitData.fromMap(Map<String, dynamic> map) {
    return CommitData(
      author: Committer.fromMap(map['author']),
      committer: Committer.fromMap(map['committer']),
      message: map['message'] ?? '',
      verification: CommitVerification.fromMap(map['verification']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommitData.fromJson(String source) =>
      CommitData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommitData(author: $author, committer: $committer, message: $message, verification: $verification)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommitData &&
        other.author == author &&
        other.committer == committer &&
        other.message == message &&
        other.verification == verification;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        committer.hashCode ^
        message.hashCode ^
        verification.hashCode;
  }
}

class GithubAuthor {
  final int id;
  final String name;
  final String email;
  final String date;
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  GithubAuthor({
    required this.id,
    required this.name,
    required this.email,
    required this.date,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  GithubAuthor copyWith({
    int? id,
    String? name,
    String? email,
    String? date,
    String? login,
    String? avatarUrl,
    String? htmlUrl,
  }) {
    return GithubAuthor(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      date: date ?? this.date,
      login: login ?? this.login,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'date': date,
      'login': login,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
    };
  }

  factory GithubAuthor.fromMap(Map<String, dynamic> map) {
    return GithubAuthor(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      date: map['date'] ?? '',
      login: map['login'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubAuthor.fromJson(String source) =>
      GithubAuthor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GithubAuthor(id: $id, name: $name, email: $email, date: $date, login: $login, avatar_url: $avatarUrl, html_url: $htmlUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubAuthor &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.date == date &&
        other.login == login &&
        other.avatarUrl == avatarUrl &&
        other.htmlUrl == htmlUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        date.hashCode ^
        login.hashCode ^
        avatarUrl.hashCode ^
        htmlUrl.hashCode;
  }
}

class CommitStats {
  final int additions;
  final int deletions;
  final int total;

  CommitStats({
    required this.additions,
    required this.deletions,
    required this.total,
  });

  CommitStats copyWith({
    int? additions,
    int? deletions,
    int? total,
  }) {
    return CommitStats(
      additions: additions ?? this.additions,
      deletions: deletions ?? this.deletions,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'additions': additions,
      'deletions': deletions,
      'total': total,
    };
  }

  factory CommitStats.fromMap(Map<String, dynamic> map) {
    return CommitStats(
      additions: map['additions']?.toInt() ?? 0,
      deletions: map['deletions']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommitStats.fromJson(String source) =>
      CommitStats.fromMap(json.decode(source));

  @override
  String toString() =>
      'CommitStats(additions: $additions, deletions: $deletions, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommitStats &&
        other.additions == additions &&
        other.deletions == deletions &&
        other.total == total;
  }

  @override
  int get hashCode => additions.hashCode ^ deletions.hashCode ^ total.hashCode;
}

class CommitFile {
  final String filename;
  final int additions;
  final int deletions;
  final int changes;
  final String status;
  final String rawUrl;
  final String patch;

  CommitFile({
    required this.filename,
    required this.additions,
    required this.deletions,
    required this.changes,
    required this.status,
    required this.rawUrl,
    required this.patch,
  });

  CommitFile copyWith({
    String? filename,
    int? additions,
    int? deletions,
    int? changes,
    String? status,
    String? rawUrl,
    String? patch,
  }) {
    return CommitFile(
      filename: filename ?? this.filename,
      additions: additions ?? this.additions,
      deletions: deletions ?? this.deletions,
      changes: changes ?? this.changes,
      status: status ?? this.status,
      rawUrl: rawUrl ?? this.rawUrl,
      patch: patch ?? this.patch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filename': filename,
      'additions': additions,
      'deletions': deletions,
      'changes': changes,
      'status': status,
      'raw_url': rawUrl,
      'patch': patch,
    };
  }

  factory CommitFile.fromMap(Map<String, dynamic> map) {
    return CommitFile(
      filename: map['filename'] ?? '',
      additions: map['additions']?.toInt() ?? 0,
      deletions: map['deletions']?.toInt() ?? 0,
      changes: map['changes']?.toInt() ?? 0,
      status: map['status'] ?? '',
      rawUrl: map['raw_url'] ?? '',
      patch: map['patch'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommitFile.fromJson(String source) =>
      CommitFile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommitFile(filename: $filename, additions: $additions, deletions: $deletions, changes: $changes, status: $status, raw_url: $rawUrl, patch: $patch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommitFile &&
        other.filename == filename &&
        other.additions == additions &&
        other.deletions == deletions &&
        other.changes == changes &&
        other.status == status &&
        other.rawUrl == rawUrl &&
        other.patch == patch;
  }

  @override
  int get hashCode {
    return filename.hashCode ^
        additions.hashCode ^
        deletions.hashCode ^
        changes.hashCode ^
        status.hashCode ^
        rawUrl.hashCode ^
        patch.hashCode;
  }
}

class GithubCommit {
  final String url;
  final String sha;
  final String htmlUrl;
  final String commentsUrl;
  final CommitData commit;
  final GithubAuthor? author;
  final GithubAuthor? committer;
  final CommitStats? stats;
  final List<CommitFile>? files;

  String get shortSha {
    return sha.substring(0, 7);
  }

  String get shortMessage {
    final linebreak = commit.message.indexOf(RegExp(r'(\n)'));
    return commit.message.substring(
      0,
      linebreak > -1 ? linebreak : commit.message.length,
    );
  }

  GithubCommit({
    required this.url,
    required this.sha,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
    this.author,
    this.committer,
    this.stats,
    this.files,
  });

  GithubCommit copyWith({
    String? url,
    String? sha,
    String? htmlUrl,
    String? commentsUrl,
    CommitData? commit,
    ValueGetter<GithubAuthor?>? author,
    ValueGetter<GithubAuthor?>? committer,
    ValueGetter<CommitStats?>? stats,
    ValueGetter<List<CommitFile>?>? files,
  }) {
    return GithubCommit(
      url: url ?? this.url,
      sha: sha ?? this.sha,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      commit: commit ?? this.commit,
      author: author != null ? author() : this.author,
      committer: committer != null ? committer() : this.committer,
      stats: stats != null ? stats() : this.stats,
      files: files != null ? files() : this.files,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'sha': sha,
      'htmlUrl': htmlUrl,
      'commentsUrl': commentsUrl,
      'commit': commit.toMap(),
      'author': author?.toMap(),
      'committer': committer?.toMap(),
      'stats': stats?.toMap(),
      'files': files?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory GithubCommit.fromMap(Map<String, dynamic> map) {
    return GithubCommit(
      url: map['url'] ?? '',
      sha: map['sha'] ?? '',
      htmlUrl: map['htmlUrl'] ?? '',
      commentsUrl: map['commentsUrl'] ?? '',
      commit: CommitData.fromMap(map['commit']),
      author:
          map['author'] != null ? GithubAuthor.fromMap(map['author']) : null,
      committer: map['committer'] != null
          ? GithubAuthor.fromMap(map['committer'])
          : null,
      stats: map['stats'] != null ? CommitStats.fromMap(map['stats']) : null,
      files: map['files'] != null
          ? List<CommitFile>.from(
              map['files']?.map((x) => CommitFile.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubCommit.fromJson(String source) =>
      GithubCommit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GithubCommit(url: $url, sha: $sha, htmlUrl: $htmlUrl, commentsUrl: $commentsUrl, commit: $commit, author: $author, committer: $committer, stats: $stats, files: $files)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubCommit &&
        other.url == url &&
        other.sha == sha &&
        other.htmlUrl == htmlUrl &&
        other.commentsUrl == commentsUrl &&
        other.commit == commit &&
        other.author == author &&
        other.committer == committer &&
        other.stats == stats &&
        listEquals(other.files, files);
  }

  @override
  int get hashCode {
    return url.hashCode ^
        sha.hashCode ^
        htmlUrl.hashCode ^
        commentsUrl.hashCode ^
        commit.hashCode ^
        author.hashCode ^
        committer.hashCode ^
        stats.hashCode ^
        files.hashCode;
  }
}
