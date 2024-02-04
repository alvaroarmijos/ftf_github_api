import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/core/utility/utility.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/api_client.dart';
import 'package:ftf_github_api/src/packages/data/catalog/src/infrastructure/api_dtos.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late CatalogApiClient apiClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiClient = CatalogApiClient(mockHttpClient);
  });

  setUpAll(() {
    registerFallbackValue(
      Uri.parse('https://api.github.com/repos/$owner/$repo/commits'),
    );
  });

  group('Fecth commits', () {
    test('should return valid response when the response code is ok', () async {
      final response =
          readJson('helpers/dummy_data/dummy_commits_response.json');

      when(
        () => mockHttpClient.get(any(), headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: ContentType.json.value,
        }),
      ).thenAnswer(
        (_) async => http.Response(response, HttpStatus.ok),
      );

      final result = await apiClient.getCommits();

      expect(result, isA<List<ChangeDto>>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () {
      when(
        () => mockHttpClient.get(any(), headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: ContentType.json.value,
        }),
      ).thenAnswer(
        (_) async => http.Response('Not found', HttpStatus.notFound),
      );

      expect(() => apiClient.getCommits(), throwsA(isA<Exception>()));
    });
  });
}
