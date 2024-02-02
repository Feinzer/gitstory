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
              title: Text(
                commit.shortMessage,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                commit.commit.author.name,
                style: Theme.of(context).textTheme.bodySmall,
              ),
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
