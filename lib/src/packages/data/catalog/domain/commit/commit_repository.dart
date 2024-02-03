import 'package:ftf_github_api/src/packages/data/catalog/domain/commit/commit.dart';

abstract class CommitRepository {
  Stream<List<Commit>> getAllByRepoId();
}
