import 'dart:convert';
import 'dart:io';

import 'package:ftf_github_api/src/packages/data/catalog/infrastructure/api_dtos.dart';
import 'package:http/http.dart' as http;

const owner = 'alvaroarmijos';
const repo = 'ftf_github_api';
const token =
    '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';

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
