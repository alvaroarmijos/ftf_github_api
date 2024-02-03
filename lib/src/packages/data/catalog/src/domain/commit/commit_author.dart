import 'package:equatable/equatable.dart';

class CommitAuthor extends Equatable {
  final int id;
  final String avatarUrl;
  final String type;
  final String name;
  final String email;
  final DateTime date;

  const CommitAuthor({
    required this.id,
    required this.avatarUrl,
    required this.type,
    required this.name,
    required this.email,
    required this.date,
  });

  static final empty = CommitAuthor(
    id: 0,
    avatarUrl: '',
    type: '',
    name: '',
    email: '',
    date: DateTime(2024),
  );

  @override
  List<Object?> get props => [id, avatarUrl, type, name, email, date];
}
