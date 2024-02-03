import 'dart:convert';

class ChangeDto {
  final String sha;
  final String nodeId;
  final CommitDto commit;
  final String url;
  final ChangeAuthorDto author;

  ChangeDto({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.author,
  });

  factory ChangeDto.fromRawJson(String str) =>
      ChangeDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangeDto.fromJson(Map<String, dynamic> json) => ChangeDto(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: CommitDto.fromJson(json["commit"]),
        url: json["url"],
        author: ChangeAuthorDto.fromJson(json["author"]),
      );

  static List<ChangeDto> fromJsonArray(List jsonArray) =>
      jsonArray.map((element) => ChangeDto.fromJson(element)).toList();

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit.toJson(),
        "url": url,
        "author": author.toJson(),
      };
}

class ChangeAuthorDto {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  ChangeAuthorDto({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory ChangeAuthorDto.fromRawJson(String str) =>
      ChangeAuthorDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangeAuthorDto.fromJson(Map<String, dynamic> json) =>
      ChangeAuthorDto(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class CommitDto {
  final String message;
  final String url;
  final int commentCount;
  final CommitAuthorDto author;

  CommitDto({
    required this.message,
    required this.url,
    required this.commentCount,
    required this.author,
  });

  factory CommitDto.fromRawJson(String str) =>
      CommitDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitDto.fromJson(Map<String, dynamic> json) => CommitDto(
        author: CommitAuthorDto.fromJson(json["author"]),
        message: json["message"],
        url: json["url"],
        commentCount: json["comment_count"],
      );

  Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "message": message,
        "url": url,
        "comment_count": commentCount,
      };
}

class CommitAuthorDto {
  final String name;
  final String email;
  final DateTime date;

  CommitAuthorDto({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthorDto.fromRawJson(String str) =>
      CommitAuthorDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitAuthorDto.fromJson(Map<String, dynamic> json) =>
      CommitAuthorDto(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}
