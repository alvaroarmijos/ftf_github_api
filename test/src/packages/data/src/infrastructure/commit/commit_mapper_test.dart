import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/api_dtos.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/commit/commit_mapper.dart';

void main() {
  late final CommitMapper mapper;
  final commitAuthorDto = CommitAuthorDto(
    name: '',
    email: '',
    date: DateTime(2024),
  );
  final changeAuthorDto = ChangeAuthorDto(
    login: '',
    id: 0,
    nodeId: '',
    avatarUrl: '',
    gravatarId: '',
    url: '',
    htmlUrl: '',
    followersUrl: '',
    followingUrl: '',
    gistsUrl: '',
    starredUrl: '',
    subscriptionsUrl: '',
    organizationsUrl: '',
    reposUrl: '',
    eventsUrl: '',
    receivedEventsUrl: '',
    type: '',
    siteAdmin: true,
  );
  final dto = ChangeDto(
    sha: '',
    nodeId: '',
    commit: CommitDto(
      message: '',
      url: '',
      commentCount: 0,
      author: commitAuthorDto,
    ),
    url: '',
    author: changeAuthorDto,
  );

  setUpAll(() {
    mapper = CommitMapper();
  });

  group('fromApiDto', () {
    test('should get a Commit from dto', () {
      final commit = mapper.fromApiDto(dto);

      expect(commit, Commit.empty);
    });

    test('should get a CommitAuthor from dto', () {
      final commitAuthor =
          mapper.fromAuthorApiDto(changeAuthorDto, commitAuthorDto);

      expect(commitAuthor, CommitAuthor.empty);
    });
  });

  group('fromApiDtoList', () {
    test('should get Commits from Api dto list', () {
      final res = mapper.fromApiDtoList([dto]);

      expect(res, [Commit.empty]);
    });
  });
}
