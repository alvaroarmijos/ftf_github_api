import 'package:flutter/material.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.commits,
  });

  final List<Commit> commits;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commits.length,
      itemBuilder: (context, index) {
        final commit = commits[index];
        return ListTile(
          title: Text(commit.message),
          subtitle: Text(commit.author.name),
        );
      },
    );
  }
}
