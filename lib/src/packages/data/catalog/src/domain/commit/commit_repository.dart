import 'commit.dart';

abstract class CommitRepository {
  Stream<List<Commit>> getAllByRepoId();
}
