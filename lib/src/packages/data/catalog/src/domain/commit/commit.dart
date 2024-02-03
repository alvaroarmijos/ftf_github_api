import 'commit_author.dart';

class Commit {
  final String message;
  final String url;
  final int commentCount;
  final CommitAuthor author;

  Commit({
    required this.message,
    required this.url,
    required this.commentCount,
    required this.author,
  });
}
