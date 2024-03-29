import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_dtos.dart';

const owner = 'alvaroarmijos';
const repo = 'ftf_github_api';
const token = 'token';

class CatalogApiClient {
  const CatalogApiClient(
    this._client,
  );

  final http.Client _client;

  Future<List<ChangeDto>> getCommits() async {
    const url = 'https://api.github.com/repos/$owner/$repo/commits';

    final resp = await _client.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: ContentType.json.value,
    });

    if (resp.statusCode == HttpStatus.ok) {
      return ChangeDto.fromJsonArray(json.decode(resp.body));
    } else {
      throw Exception();
    }
  }
}
