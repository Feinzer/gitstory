import 'package:flutter/material.dart';
import 'package:gitstory/src/internal/github/api.dart';
import 'package:gitstory/src/internal/models/commit.dart';
import 'package:gitstory/src/ui/avatar_image.dart';

import 'package:url_launcher/url_launcher.dart';

class CommitDetails extends StatefulWidget {
  final String sha;

  const CommitDetails({super.key, required this.sha});

  @override
  State<CommitDetails> createState() => _CommitDetailsState();
}

class _CommitDetailsState extends State<CommitDetails> {
  GithubCommit? commit;

  Future<void> getCommit() async {
    commit = await GithubApi.commit(widget.sha);
    setState(() {});
  }

  Future<void> openInBrowser(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      debugPrint("Could not open $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (commit == null) getCommit();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Commit"),
      ),
      floatingActionButton: commit == null
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                openInBrowser(commit!.htmlUrl);
              },
              icon: const Icon(Icons.public),
              label: const Text("Open in browser"),
            ),
      body: AnimatedCrossFade(
        crossFadeState: commit == null
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 150),
        firstChild: Container(),
        secondChild: commit == null
            ? Container()
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        commit!.shortMessage,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      AuthorCard(commit: commit!),
                      if (commit!.files != null)
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: commit!.files!.length,
                          itemBuilder: (context, index) {
                            final file = commit!.files![index];
                            return FileCard(file: file);
                          },
                        )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class FileCard extends StatelessWidget {
  final CommitFile file;

  const FileCard({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              file.filename,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "+${file.additions}",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Text(
                  "-${file.deletions}",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(file.patch),
            )
          ],
        ),
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  final GithubCommit commit;

  const AuthorCard({super.key, required this.commit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: AvatarImage(url: commit.author?.avatarUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(commit.commit.author.name,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(commit.committedAt,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}
