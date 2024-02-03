import 'package:flutter/material.dart';
import 'package:ftf_github_api/src/packages/core/ui/ui.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';
import 'package:intl/intl.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.commits,
  });

  final List<Commit> commits;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(FtfDimens.dimen_12),
      itemCount: commits.length,
      itemBuilder: (context, index) {
        final commit = commits[index];
        final date =
            DateFormat(FtfStrings.dateFormat).format(commit.author.date);

        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                commit.author.avatarUrl,
              ),
            ),
            trailing: Badge(
              label: Text('${commit.commentCount}'),
              child: const Icon(Icons.comment),
            ),
            title: Text(commit.message),
            subtitle: Column(
              children: [
                CommitItem(
                  label: commit.author.name,
                  iconData: Icons.person,
                ),
                CommitItem(
                  label: commit.author.email,
                  iconData: Icons.email,
                ),
                CommitItem(
                  label: date,
                  iconData: Icons.calendar_month,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CommitItem extends StatelessWidget {
  const CommitItem({
    super.key,
    required this.label,
    required this.iconData,
  });

  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: FtfDimens.dimen_4,
      ),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(
            width: FtfDimens.dimen_8,
          ),
          Text(label),
        ],
      ),
    );
  }
}
