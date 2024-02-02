import 'dart:convert';

class GithubBranch {
  final String name;
  final bool protected;

  GithubBranch({
    required this.name,
    required this.protected,
  });

  GithubBranch copyWith({
    String? name,
    bool? protected,
  }) {
    return GithubBranch(
      name: name ?? this.name,
      protected: protected ?? this.protected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'protected': protected,
    };
  }

  factory GithubBranch.fromMap(Map<String, dynamic> map) {
    return GithubBranch(
      name: map['name'] ?? '',
      protected: map['protected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubBranch.fromJson(String source) =>
      GithubBranch.fromMap(json.decode(source));

  @override
  String toString() => 'GithubBranch(name: $name, protected: $protected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GithubBranch &&
        other.name == name &&
        other.protected == protected;
  }

  @override
  int get hashCode => name.hashCode ^ protected.hashCode;
}
