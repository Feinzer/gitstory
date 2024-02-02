import 'package:flutter/material.dart';
import 'package:gitstory/env.local.dart';
import 'package:gitstory/src/internal/github/api.dart';
import 'package:gitstory/src/internal/models/branch.dart';
import 'package:gitstory/src/internal/models/commit.dart';
import 'package:gitstory/src/ui/branch_dropdown.dart';
import 'package:gitstory/src/ui/commit_listview.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.title});

  final String title;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  GithubBranch? selectedBranch;

  List<GithubBranch> branches = [];
  List<GithubCommit> commits = [];

  Future<void> refresh() async {
    branches = await GithubApi.branches();
    if (selectedBranch == null && branches.isNotEmpty) {
      selectedBranch = branches[0];
    }
    setState(() {});
    if (selectedBranch != null) {
      commits = await GithubApi.commits(selectedBranch!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (branches.isEmpty) refresh();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: refresh,
        label: const Text("Refresh"),
        icon: const Icon(Icons.refresh),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).colorScheme.surfaceVariant,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "GitHub / $owner / $repo",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (branches.isNotEmpty)
                  BranchDropdown(
                      selected: selectedBranch,
                      branches: branches,
                      onChanged: (branch) {
                        setState(() {
                          selectedBranch = branch;
                        });
                      })
              ],
            ),
          ),
          if (commits.isNotEmpty) CommitListView(commits: commits)
        ],
      ),
    );
  }
}
