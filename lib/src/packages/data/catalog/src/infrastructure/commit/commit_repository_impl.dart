import '../../domain/commit/commit.dart';
import '../../domain/commit/commit_repository.dart';
import '../api_client.dart';
import 'commit_mapper.dart';

class CommitRepositoryImpl implements CommitRepository {
  const CommitRepositoryImpl(
    this._apiClient,
    this._mapper,
  );

  final CatalogApiClient _apiClient;
  final CommitMapper _mapper;

  @override
  Stream<List<Commit>> getAllByRepoId() =>
      _apiClient.getCommits().asStream().map(
            (dtos) => _mapper.fromApiDtoList(dtos),
          );
}
