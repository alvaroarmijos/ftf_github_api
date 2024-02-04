import 'package:equatable/equatable.dart';

import 'commit_author.dart';

class Commit extends Equatable {
  final String message;
  final String url;
  final int commentCount;
  final CommitAuthor author;

  const Commit({
    required this.message,
    required this.url,
    required this.commentCount,
    required this.author,
  });

  static final empty = Commit(
    message: '',
    url: '',
    commentCount: 0,
    author: CommitAuthor.empty,
  );

  @override
  List<Object?> get props => [message, url, commentCount, author];
}
