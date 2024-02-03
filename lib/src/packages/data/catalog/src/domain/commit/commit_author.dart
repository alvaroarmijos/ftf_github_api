class CommitAuthor {
  final int id;
  final String avatarUrl;
  final String type;
  final String name;
  final String email;
  final DateTime date;

  CommitAuthor({
    required this.id,
    required this.avatarUrl,
    required this.type,
    required this.name,
    required this.email,
    required this.date,
  });
}
