import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';

void main() {
  final commit = Commit.empty;

  group('Entity', () {
    test('should be a subclass of Commit entity', () {
      expect(commit, isA<Commit>());
    });

    test('should be a Commit empty', () {
      final commitEmpty = Commit(
        message: '',
        url: '',
        commentCount: 0,
        author: CommitAuthor.empty,
      );
      expect(commit, commitEmpty);
    });
  });
}
