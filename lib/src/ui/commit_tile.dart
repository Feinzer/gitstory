import 'package:flutter/material.dart';
import 'package:gitstory/src/internal/models/commit.dart';
import 'package:gitstory/src/ui/avatar_image.dart';

class CommitTile extends StatelessWidget {
  final GithubCommit commit;
  final Function()? onTap;

  const CommitTile({
    super.key,
    required this.commit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
  }
}
