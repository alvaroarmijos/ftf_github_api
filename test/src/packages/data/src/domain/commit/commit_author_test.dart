import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';

void main() {
  final commitAuthor = CommitAuthor.empty;

  group('Entity', () {
    test('should be a subclass of CommitAuthor entity', () {
      expect(commitAuthor, isA<CommitAuthor>());
    });

    test('should be a CommitAuthor empty', () {
      final commitAuthorEmpty = CommitAuthor(
        id: 0,
        avatarUrl: '',
        type: '',
        name: '',
        email: '',
        date: DateTime(2024),
      );
      expect(commitAuthor, commitAuthorEmpty);
    });
  });
}
