import 'package:flutter/material.dart';
import 'package:gitstory/src/internal/models/commit.dart';
import 'package:gitstory/src/screens/commit_details.dart';
import 'package:gitstory/src/ui/commit_tile.dart';
import 'package:gitstory/src/ui/shared_axis_page_route.dart';

class CommitListView extends StatelessWidget {
  const CommitListView({super.key, required this.commits});

  final List<GithubCommit> commits;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: commits.isEmpty
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 450),
      firstChild: Container(),
      secondChild: commits.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: commits.length,
              itemBuilder: (context, index) {
                final commit = commits[index];
                return CommitTile(
                  commit: commit,
                  onTap: () {
                    Navigator.of(context).push(
                      SharedAxisPageRoute(
                        page: CommitDetails(sha: commit.sha),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
