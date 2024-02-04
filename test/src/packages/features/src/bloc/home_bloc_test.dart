import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllCommits extends Mock implements GetAllCommits {}

void main() {
  late MockGetAllCommits mockGetAllCommits;

  setUp(() {
    mockGetAllCommits = MockGetAllCommits();
  });

  group('GetCommitsEvent', () {
    blocTest<HomeBloc, HomeState>(
      'emits [HomeSuccess] when GetCommitsEvent is added.',
      setUp: () => when(() => mockGetAllCommits()).thenAnswer(
        (_) => Stream.value([]),
      ),
      build: () => HomeBloc(mockGetAllCommits),
      act: (bloc) => bloc.add(const GetCommitsEvent()),
      expect: () => const <HomeState>[
        HomeLoading(),
        HomeSuccess([]),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeError] when GetCommitsEvent is added.',
      setUp: () => when(() => mockGetAllCommits()).thenThrow(Exception()),
      build: () => HomeBloc(mockGetAllCommits),
      act: (bloc) => bloc.add(const GetCommitsEvent()),
      errors: () => [
        isA<Exception>(),
      ],
      expect: () => const <HomeState>[
        HomeLoading(),
        HomeError(),
      ],
    );
  });
}
