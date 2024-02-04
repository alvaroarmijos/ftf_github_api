import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/api_client.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/commit/commit_mapper.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/commit/commit_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockCatalogApiClient extends Mock implements CatalogApiClient {}

class MockCommitMapper extends Mock implements CommitMapper {}

void main() {
  late MockCatalogApiClient mockCatalogApiClient;
  late MockCommitMapper mockCommitMapper;
  late CommitRepositoryImpl commitRepositoryImpl;

  setUp(() {
    mockCatalogApiClient = MockCatalogApiClient();
    mockCommitMapper = MockCommitMapper();
    commitRepositoryImpl = CommitRepositoryImpl(
      mockCatalogApiClient,
      mockCommitMapper,
    );
  });

  test('should return Commits when a call to api client is successful',
      () async {
    when(
      () => mockCatalogApiClient.getCommits(),
    ).thenAnswer(
      (invocation) => Future.value([]),
    );
    when(
      () => mockCommitMapper.fromApiDtoList(any()),
    ).thenAnswer(
      (_) => [],
    );

    final result = await commitRepositoryImpl.getAllByRepoId().first;

    expect(result, []);
  });

  test(
      'should return a Server Exception when a call to Api Client is unsuccessful',
      () async {
    when(
      () => mockCatalogApiClient.getCommits(),
    ).thenThrow(
      Exception(),
    );

    expect(
      () => commitRepositoryImpl.getAllByRepoId(),
      throwsA(isA<Exception>()),
    );
  });
}
