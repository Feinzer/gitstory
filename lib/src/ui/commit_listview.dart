import 'package:flutter/material.dart';
import 'package:gitstory/src/internal/models/commit.dart';
import 'package:gitstory/src/ui/avatar_image.dart';

class CommitListView extends StatelessWidget {
  const CommitListView({super.key, required this.commits});

  final List<GithubCommit> commits;

  @override
  Widget build(BuildContext context) {
    if (commits.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemCount: commits.length,
          itemBuilder: (context, index) {
            final commit = commits[index];
            return ListTile(
              leading: AvatarImage(url: commit.author?.avatarUrl),
              trailing: Text(commit.shortSha),
            );
          },
        ),
      );
    } else {
      return const Placeholder();
    }
  }
}
