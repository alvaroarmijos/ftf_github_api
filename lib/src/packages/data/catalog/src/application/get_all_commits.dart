import '../domain/commit/commit.dart';
import '../domain/commit/commit_repository.dart';

class GetAllCommits {
  const GetAllCommits(
    this._commitRepository,
  );

  final CommitRepository _commitRepository;

  Stream<List<Commit>> call() => _commitRepository.getAllByRepoId();
}
