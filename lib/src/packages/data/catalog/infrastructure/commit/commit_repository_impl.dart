import 'package:ftf_github_api/src/packages/data/catalog/domain/commit/commit.dart';
import 'package:ftf_github_api/src/packages/data/catalog/domain/commit/commit_repository.dart';
import 'package:ftf_github_api/src/packages/data/catalog/infrastructure/api_client.dart';
import 'package:ftf_github_api/src/packages/data/catalog/infrastructure/commit/commit_mapper.dart';

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
