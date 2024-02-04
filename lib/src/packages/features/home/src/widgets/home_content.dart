import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftf_github_api/src/packages/core/ui/ui.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';
import 'package:intl/intl.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.commits,
  });

  final List<Commit> commits;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => _pullRefresh(context),
      child: ListView.builder(
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
              trailing: commit.commentCount > 0
                  ? Badge(
                      label: Text('${commit.commentCount}'),
                      child: const Icon(Icons.comment),
                    )
                  : null,
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
      ),
    );
  }

  Future<void> _pullRefresh(BuildContext context) async {
    context.read<HomeBloc>().add(const GetCommitsEvent());
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
          Flexible(
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
