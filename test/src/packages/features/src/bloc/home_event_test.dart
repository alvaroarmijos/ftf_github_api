import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';

void main() {
  test('GetCommitsEvent supports value comparisions',
      () => expect(const GetCommitsEvent(), const GetCommitsEvent()));
}
