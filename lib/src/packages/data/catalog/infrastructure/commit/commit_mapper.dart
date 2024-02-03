import 'package:ftf_github_api/src/packages/data/catalog/domain/commit/commit_author.dart';

import '../../domain/commit/commit.dart';
import '../api_dtos.dart';

class CommitMapper {
  Commit fromApiDto(ChangeDto dto) {
    final message = dto.commit.message;
    final url = dto.commit.url;
    final commentCount = dto.commit.commentCount;
    final author = fromAuthorApiDto(dto.author, dto.commit.author);

    return Commit(
      message: message,
      url: url,
      commentCount: commentCount,
      author: author,
    );
  }

  List<Commit> fromApiDtoList(List<ChangeDto> dtos) =>
      dtos.map((e) => fromApiDto(e)).toList();

  CommitAuthor fromAuthorApiDto(
      ChangeAuthorDto changeAuthorDto, CommitAuthorDto commitAuthorDto) {
    final id = changeAuthorDto.id;
    final avatarUrl = changeAuthorDto.avatarUrl;
    final type = changeAuthorDto.type;
    final name = commitAuthorDto.name;
    final email = commitAuthorDto.email;
    final date = commitAuthorDto.date;

    return CommitAuthor(
      id: id,
      avatarUrl: avatarUrl,
      type: type,
      name: name,
      email: email,
      date: date,
    );
  }
}
