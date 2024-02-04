import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/domain/commit/commit_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockCommitRepository extends Mock implements CommitRepository {}

void main() {
  late GetAllCommits useCase;
  late MockCommitRepository mockCommitRepository;

  setUp(() {
    mockCommitRepository = MockCommitRepository();
    useCase = GetAllCommits(mockCommitRepository);
  });

  test('should get all commits', () async {
    when(
      () => mockCommitRepository.getAllByRepoId(),
    ).thenAnswer(
      (_) => Stream.value([]),
    );

    final result = await useCase().first;

    expect(result, []);
    verify(() => mockCommitRepository.getAllByRepoId()).called(1);
    verifyNoMoreInteractions(mockCommitRepository);
  });
}
